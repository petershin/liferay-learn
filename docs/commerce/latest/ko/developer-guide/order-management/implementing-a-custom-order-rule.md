# 맞춤 주문 규칙 구현

특정 조건을 충족하는 주문에 대해 Liferay에서 주문 규칙을 구성할 수 있습니다. 최소 주문 금액 규칙은 즉시 사용할 수 있습니다. 특정 값 이하의 주문이 체크아웃되는 것을 방지합니다. 새 주문 규칙을 추가하려면 [`COREntryType`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-order-rule-api/src/main/java/com/liferay/commerce/order/rule/entry/type/COREntryType.java) 인터페이스를 구현해야 합니다. 자세한 내용은 [상거래 주문 규칙](https://learn.liferay.com/commerce/latest/ko/order-management/order-rules.html) 을 참조하십시오.

## 사용자 지정 주문 규칙 배포 및 언어 키 추가

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르세요.

1. Acme Commerce 주문 규칙을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/developer-guide/order-management/liferay-x9k1.zip

   unzip liferay-x9k1.zip
   ```

1. 예제를 빌드하고 배포합니다.

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   ```{note}
   이 명령은 배포된 jar를 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
   ```

1. Docker 컨테이너 콘솔에서 배포를 확인합니다.

   ```bash
   STARTED com.acme.x9k1.impl_1.0.0
   ```

1. 관리자로 로그인하고 **전역 메뉴**(![Applications Menu icon](../../images/icon-applications-menu.png))을 연 다음 **제어판** &rarr; **언어 재정의** 을 클릭합니다. **추가** 버튼(![Add icon](../../images/icon-add.png))을 클릭하고 다음 키를 추가합니다.

   | 언어 키          | 가치            |
   |:------------- |:------------- |
   | x9k1-최소 주문 수량 | X9K1 최소 주문 수량 |
   | 최소 수량         | 최소 수량         |

   ```{important}
   Liferay DXP 7.4 U4+ 또는 Liferay Portal 7.4 GA8+용 언어 재정의 도구에서 언어 키를 추가할 수 있습니다. 이전 버전의 경우 빌드 및 배포하기 전에 `/src/main/resources/content/` 아래에 `Language.properties` 파일을 키와 함께 추가해야 합니다.
   ```

1. **글로벌 메뉴**(![Applications Menu icon](../../images/icon-applications-menu.png))를 열고 **상거래** &rarr; **주문 규칙** 을 클릭합니다.

1. **추가** 버튼(![Add icon](../../images/icon-add.png))을 클릭하고 다음 정보를 입력합니다.

   **이름:** 최소 주문 수량 - 3

   **설명:** 테스트 최소 주문 수량 3 항목

   **유형:** X9K1 최소 주문 수량

   ![사용자 지정 주문 규칙의 이름, 설명 및 유형을 입력합니다.](./implementing-a-custom-order-rule/images/01.png)

1. **제출** 을 클릭합니다.

1. **구성** 섹션에서 **최소 수량** 을 **3** 로 설정합니다.

1. 활성 토글을 클릭하여 새 주문 규칙을 활성화합니다.

   ![최소 수량을 3으로 설정하고 활성 토글을 사용하여 새 주문 규칙을 활성화합니다.](./implementing-a-custom-order-rule/images/02.png)

1. **게시** 을 클릭합니다.

1. **글로벌 메뉴**(![Applications Menu icon](../../images/icon-applications-menu.png))을 열고 **제어판** &rarr; **사이트** 을 클릭한 다음 새로운 Miniium 데모 사이트를 추가합니다.

1. 구매자로 로그인하고 장바구니에 항목을 추가하십시오. **제출** 을 클릭하여 체크아웃합니다.

주문 수량이 3개 미만일 경우 경고 메시지를 볼 수 있습니다. 이 조건을 충족하기 전에는 결제가 불가능합니다.

![주문 수량이 3개 미만일 경우 경고 메시지를 볼 수 있습니다.](./implementing-a-custom-order-rule/images/03.png)

```{important}
주문 규칙을 활성화하면 모든 계정, 계정 그룹, 주문 유형 및 채널에 적용됩니다. 자격을 제어하려면 주문 규칙의 *자격* 탭을 클릭하고 적절한 옵션을 선택합니다. 
```

## 맞춤 주문 규칙의 작동 방식

이 예에는 9개의 주요 단계가 있습니다.

1. [OSGi 등록을 위한 주문 규칙에 주석 달기](#annotate-the-order-rule-for-osgi-registration)
1. [`COREntryType` 인터페이스 검토](#review-the-corentrytype-interface)
1. [`COREntryType` 구현 완료](#complete-the-corentrytype-implementation)
1. [디스플레이 컨텍스트 추가](#add-a-display-context)
1. [최소 수량 값을 검색하기 위한 유틸리티 클래스 추가](#add-a-utility-class-to-retrieve-the-minimum-quantity-value)
1. [OSGi 등록을 위해 JSP 기여자에 주석 달기](#annotate-the-jsp-contributor-for-osgi-registration)
1. [`COREntryTypeJSPContributor` 인터페이스 검토](#review-the-corentrytypejspcontributor-interface)
1. [JSP 기여자 구현 완료](#complete-the-jsp-contributor-implementation)
1. [주문 규칙의 구성을 렌더링하는 JSP 추가](#add-a-jsp-to-render-the-configuration-of-the-order-rule)

### OSGi 등록을 위한 주문 규칙에 주석 달기

```{literalinclude} ./implementing-a-custom-order-rule/resources/liferay-x9k1.zip/x9k1-impl/src/main/java/com/acme/x9k1/internal/commerce/order/rule/entry/type/X9K1MinimumQuantityCOREntryTypeImpl.java
    :language: java
    :lines: 18-26
```

Liferay Commerce가 주문 규칙 레지스트리의 다른 항목과 구별할 수 있도록 주문 규칙에 고유한 키를 제공해야 합니다. 이미 사용 중인 키를 지정하면 기존 연결된 유형이 재정의됩니다. 순서는 드롭다운에서 정렬 순서를 결정합니다. 이 경우 순서는 1이고 드롭다운에서 두 번째 항목으로 나타납니다.

### `COREntryType` 인터페이스 검토

다음 방법을 구현합니다.

```java
public boolean evaluate(COREntry corEntry, CommerceOrder commerceOrder) throws PortalException;
```

이 메서드는 주문 규칙을 평가하고 조건 충족 여부에 따라 true 또는 false를 반환합니다.

```java
public String getErrorMessage(COREntry corEntry, CommerceOrder commerceOrder, Locale locale)  throws PortalException;
```

평가된 메서드가 false를 반환하는 경우 이 메서드는 사용자에게 경고를 표시하는 오류 메시지가 포함된 문자열을 반환합니다.

```java
public String getKey();
```

이 메서드는 주문 규칙의 고유 키를 반환합니다. 기존 키를 사용하면 해당 주문 규칙이 재정의됩니다.

```java
public String getLabel(Locale locale);
```

이 메서드는 UI에 표시되는 주문 규칙의 이름을 반환합니다. 이것은 언어 키 또는 문자열일 수 있습니다.

### `COREntryType` 구현 완료

```{literalinclude} ./implementing-a-custom-order-rule/resources/liferay-x9k1.zip/x9k1-impl/src/main/java/com/acme/x9k1/internal/commerce/order/rule/entry/type/X9K1MinimumQuantityCOREntryTypeImpl.java
    :language: java
    :lines: 28-94
    :dedent: 1
```

주문 규칙을 완료하려면 위의 방법을 구현해야 합니다. 주문 규칙에 구성된 주문 수량과 최소 수량을 가져오기 위해 두 가지 유틸리티 방법이 추가되었습니다. 재정의된 첫 번째 메서드는 `evaluate()` 이며 현재 주문이 주문 규칙을 통과하는지 여부를 확인합니다. 맞으면 true를 반환하고 그렇지 않으면 false를 반환합니다.

두 번째 방법은 주문 규칙을 충족하지 않는 주문에 대한 오류 메시지를 검색합니다. 모든 용어를 포함하는 `StringBuilder` 에서 변환된 문자열을 반환합니다. 세 번째 메서드는 고유 키를 반환하고 마지막 메서드는 UI에 표시되는 레이블을 반환합니다.

주문 규칙의 최소 수량과 총 주문 수량을 얻는 두 가지 추가 방법이 있습니다. 첫 번째 메서드는 유틸리티 클래스 `X9K1MinimumQuantityUtil`에 있습니다. 두 번째 방법은 `_getOrderQuantity(CommerceOrder commerceOrder)`입니다. 주문의 개별 제품 수량의 합계로 총 주문 수량을 반환합니다.

### 디스플레이 컨텍스트 추가

```{literalinclude} ./implementing-a-custom-order-rule/resources/liferay-x9k1.zip/x9k1-impl/src/main/java/com/acme/x9k1/internal/commerce/order/rule/web/display/context/X9K1MinimumQuantityDisplayContext.java
    :language: java
    :lines: 7-19
```

이 코드는 `COREntry` 유형의 단일 필드를 포함하고 생성된 주문 규칙을 사용하여 설정되는 디스플레이 컨텍스트에서 주문 규칙에 대해 구성된 최소 수량 값을 검색합니다. 표시 컨텍스트에는 주문 규칙에 대해 구성된 최소 수량을 검색하는 한 가지 방법이 있으며 아래에 설명된 유틸리티 클래스를 사용합니다.

### 최소 수량 값을 검색하기 위한 유틸리티 클래스 추가

```{literalinclude} ./implementing-a-custom-order-rule/resources/liferay-x9k1.zip/x9k1-impl/src/main/java/com/acme/x9k1/internal/commerce/order/rule/entry/util/X9K1MinimumQuantityUtil.java
    :language: java
    :lines: 8-20
```

`X9K1MinimumQuantityUtil` 클래스는 주문 규칙에 대해 구성된 최소 수량을 검색합니다. JSPkey에 설정된 특성 이름을 사용하여 값을 검색합니다.

### OSGi 등록을 위해 JSP 기여자에 주석 달기

```{literalinclude} ./implementing-a-custom-order-rule/resources/liferay-x9k1.zip/x9k1-impl/src/main/java/com/acme/x9k1/internal/commerce/order/rule/web/entry/type/X9K1MinimumQuantityCOREntryTypeJSPContributor.java
    :language: java
    :lines: 18-24
```

`commerce.order.rule.entry.type.jsp.contributor.key` 속성은 JSP 기여자가 구현되는 주문 규칙을 결정합니다.

### `COREntryTypeJSPContributor` 인터페이스 검토

```java
public void render(long corEntryId, HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse) throws Exception;
```

`COREntryTypeJSPContributor` 인터페이스에는 JSP를 렌더링하는 하나의 메서드가 포함되어 있습니다. 이 메서드에는 주문 규칙의 ID와 유형 `HTTPServletRequest` 및 `HTTPServletResponse` 의 개체가 인수로 필요합니다.

### JSP 기여자 구현 완료

```{literalinclude} ./implementing-a-custom-order-rule/resources/liferay-x9k1.zip/x9k1-impl/src/main/java/com/acme/x9k1/internal/commerce/order/rule/web/entry/type/X9K1MinimumQuantityCOREntryTypeJSPContributor.java
    :language: java
    :lines: 26-52
    :dedent: 1
```

JSP Contributor를 완성하려면 `render()` 메서드를 구현해야 합니다. `_corEntryLocalService` 및 `corEntryId`를 사용하여 `COREntry` 을 검색합니다. 그런 다음 검색된 `corEntry`을 사용하여 유형 `X9K1MinimumQuantityDisplayContext` 의 새 디스플레이 컨텍스트를 생성합니다. 이 컨텍스트는 `httpServletRequest`로 설정됩니다. `servletContext` 은 `bnd.bnd` 파일에서 Bundle-Symbolic-Name을 참조합니다. `JSPRenderer` 은 `renderJSP()` 메서드로 JSP 파일을 렌더링합니다. JSP의 상대 경로인 `servletContext`, `httpServletRequest`, `httpServletResponse` 를 인수로 받아들입니다.

### 주문 규칙의 구성을 렌더링하는 JSP 추가

```{literalinclude} ./implementing-a-custom-order-rule/resources/liferay-x9k1.zip/x9k1-impl/src/main/resources/META-INF/resources/minimum_quantity.jsp
    :language: jsp
    :lines: 1-27
```

JSP에는 주문 규칙에 대한 최소 수량을 승인하는 하나의 입력 필드가 포함되어 있습니다. 디스플레이 컨텍스트를 통해 검색되고 사용자 지정 주문 규칙 내에서 평가됩니다. 디스플레이 컨텍스트는 유틸리티 클래스를 사용하고 유형 설정 구성에서 `최소 수량` 이름을 사용하여 필드를 가져옵니다. `getMinimumQuantity()` 메서드는 기존 값이 있는 경우 검색합니다.

## 결론

축하합니다! 이제 `COREntryType` 인터페이스를 구현하기 위한 기본 사항을 알고 있으며 Liferay Commerce에 새로운 주문 규칙을 추가했습니다.
