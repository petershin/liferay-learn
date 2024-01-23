# 새 할인 규칙 유형 추가

[CommerceDiscountRuleType](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-discount-api/src/main/java/com/liferay/commerce/discount/rule/type/CommerceDiscountRuleType.java) 및 [CommerceDiscountRuleTypeJSPContributor](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-discount-api/src/main/java/com/liferay/commerce/discount/rule/type/CommerceDiscountRuleTypeJSPContributor.java) 인터페이스를 구현하여 새 할인 규칙 유형을 추가할 수 있습니다.

할인 규칙 유형은 할인이 주문에 적용되는 시기를 평가하기 위한 조건을 정의합니다. Liferay Commerce는 기본적으로 [AddedAllCommerceDiscountRuleTypeImpl](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-discount-service/src/main/java/com/liferay/commerce/discount/internal/rule/type/AddedAllCommerceDiscountRuleTypeImpl.java) , [AddedAnyCommerceDiscountRuleTypeImpl](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-discount-service/src/main/java/com/liferay/commerce/discount/internal/rule/type/AddedAnyCommerceDiscountRuleTypeImpl.java) 및 [CartTotalCommerceDiscountRuleTypeImpl](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-discount-service/src/main/java/com/liferay/commerce/discount/internal/rule/type/CartTotalCommerceDiscountRuleTypeImpl.java) 의 세 가지 할인 규칙 유형을 제공합니다.

![즉시 사용 가능한 할인 규칙 유형](./adding-a-new-discount-rule-type/images/01.png "즉시 사용 가능한 할인 규칙 유형")

## 개요

1. [**예제 배포**](#deploy-an-example)
1. [**예제 살펴보기**](#walk-through-the-example)
1. [**추가 정보**](#additional-information)

## 예제 배포

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계에 따라 Liferay Commerce 인스턴스에 예제 할인 규칙 유형을 배포하십시오.

1. [Acme Commerce 할인 규칙 유형](./liferay-m6a8.zip) 을 다운로드하고 압축을 풉니다.

    ```bash
    curl https://resources.learn.liferay.com/commerce/latest/en/developer-guide/promotions/liferay-m6a8.zip -O
    ```

    ```bash
    unzip liferay-m6a8.zip
    ```

1. 예제를 빌드하고 배포합니다.

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 배포된 jar를 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
    ```

1. Liferay Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```bash
    STARTED com.acme.m6a8.web_1.0.0
    ```

1. 예제 할인 규칙 유형이 추가되었는지 확인합니다. 브라우저에서 `https://localhost:8080`로 엽니다. 그런 다음 애플리케이션 메뉴(![Applications Menu](../../images/icon-applications-menu.png))를 클릭하고 **상거래** → **할인** 로 이동합니다. 할인을 받으려면 메뉴에서 **편집** 클릭하십시오. **규칙** 섹션까지 아래로 스크롤하고 (+) 아이콘을 클릭하여 새 할인 규칙을 추가합니다. 새 할인 규칙 유형("최소 제품 수 있음")은 **유형** 드롭다운 아래에 있습니다.

```{note}
Liferay Commerce 2.1 및 이전 버전에서는 *제어판* → *상거래* → *할인*으로 이동하여 할인을 찾습니다. 할인 메뉴에서 *수정*을 클릭한 다음 화면 상단의 *규칙*을 클릭합니다.
```

![새 할인 규칙 유형](./adding-a-new-discount-rule-type/images/02.png "새 할인 규칙 유형")

축하합니다. `CommerceDiscountRuleType`을 구현하는 새 할인 규칙 유형을 성공적으로 구축 및 배포했습니다.

다음으로, 더 자세히 알아보기 위해 더 깊이 잠수할 것입니다.

## 예제 살펴보기

이제 배포한 예제를 검토할 차례입니다. 할인 규칙 유형 클래스와 사용자 정의 UI 입력을 위한 JSP 컨트리뷰터의 두 가지 클래스가 있습니다. 다음과 같이하세요:

* [OSGi 등록을 위한 할인 규칙 유형 클래스에 주석 추가](#annotate-the-discount-rule-type-class-for-osgi-registration)
* [`CommerceDiscountRuleType` 인터페이스 검토](#review-the-commercediscountruletype-interface)
* [OSGi 등록을 위해 JSP 기여자 클래스에 주석 달기](#annotate-the-jsp-contributor-class-for-osgi-registration)
* [`CommerceDiscountRuleTypeJSPContributor` 인터페이스 검토](#review-the-commercediscountruletypejspcontributor-interface)
* [할인 규칙 유형을 완료하십시오.](#complete-the-discount-rule-type)

### OSGi 등록을 위한 할인 규칙 유형 클래스에 주석 추가

```java
@Component(
    property = {
    "commerce.discount.rule.type.key=m6a8",
    "commerce.discount.rule.type.order:Integer=51"
    },
    service = CommerceDiscountRuleType.class
)
public class M6A8CommerceDiscountRuleTypeImpl
    implements CommerceDiscountRuleType {
```

> Liferay Commerce가 [할인 규칙 유형 레지스트리](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-discount-service/src/main/java/com/liferay/commerce/discount/internal/rule/type/CommerceDiscountRuleTypeRegistryImpl.java) 에서 새 유형을 다른 유형과 구별할 수 있도록 할인 규칙 유형에 고유한 키를 제공하는 것이 중요합니다. 이미 사용 중인 키를 선언하면 기존 연결된 유형이 재정의됩니다.
> 
> `commerce.discount.rule.type.order` 값은 사용 가능한 할인 규칙 유형 목록에서 이 유형이 나타나는 정도를 나타냅니다. 예를 들어 ["모두 추가됨" 할인 규칙 유형](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-discount-service/src/main/java/com/liferay/commerce/discount/internal/rule/type/AddedAllCommerceDiscountRuleTypeImpl.java) 의 값은 50입니다. 할인 규칙 유형에 값 51을 지정하면 "모두 추가됨" 유형 바로 뒤에 표시됩니다.

### `CommerceDiscountRuleType` 인터페이스 검토

다음 방법을 구현합니다.

```java
public boolean evaluate(
        CommerceDiscountRule commerceDiscountRule,
        CommerceContext commerceContext)
    throws PortalException;
```

> 이 방법은 할인 규칙이 적용되는 시기를 평가하기 위한 비즈니스 논리를 구현하는 사이트입니다.

```java
public String getKey();
```

> 이는 할인 규칙 유형 레지스트리의 할인 규칙 유형에 대한 고유 식별자를 제공합니다. 키는 레지스트리에서 새 형식을 가져오는 데 사용할 수 있습니다.

```java
public String getLabel(Locale locale);
```

> 그러면 할인 규칙이 적용되는 방식을 설명하는 텍스트 레이블이 반환됩니다. 언어 키가 있는 레이블 검색에 대한 참조는 [M6A8CommerceDiscountRuleTypeImpl.java](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/promotions/adding-a-new-discount-rule-type/resources/liferay-m6a8.zip/m6a8-web/src/main/java/com/acme/m6a8/web/internal/commerce/discount/rule/type/M6A8CommerceDiscountRuleTypeImpl.java) 의 구현을 참조하십시오.

### OSGi 등록을 위해 JSP 기여자 클래스에 주석 달기

```java
@Component(
    property = "commerce.discount.rule.type.jsp.contributor.key=m6a8",
    service = CommerceDiscountRuleTypeJSPContributor.class
)
public class M6A8CommerceDiscountRuleTypeJSPContributor
    implements CommerceDiscountRuleTypeJSPContributor {
```

> Liferay Commerce가 [할인 규칙 유형 JSP 기여자 레지스트리](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-discount-api/src/main/java/com/liferay/commerce/discount/rule/type/CommerceDiscountRuleTypeJSPContributorRegistry.java) 에서 기여자를 다른 기여자와 구별할 수 있도록 JSP 기여자에 대한 고유 키를 제공하는 것이 중요합니다. 이미 사용 중인 키를 선언하면 기존 연결된 유형이 재정의됩니다.

### `CommerceDiscountRuleTypeJSPContributor` 인터페이스 검토

다음 방법을 구현합니다.

```java
public void render(
        long l, long l1, HttpServletRequest httpServletRequest,
        HttpServletResponse httpServletResponse)
    throws Exception;
```

> 할인 규칙 유형에 대한 사용자 정의 UI 입력을 렌더링하는 코드가 들어가는 곳입니다.

### 할인 규칙 유형을 완료하십시오.

할인 규칙 유형은 주문에 할인 규칙을 적용할 시기를 평가하기 위한 백엔드 논리, 할인 규칙 유형에 대한 UI 입력을 렌더링하는 논리 및 사용자 정의 UI 입력 자체로 구성됩니다. 다음과 같이하세요:

* [모듈에 대해 `ServletContext` 구성합니다.](#configure-the-servletcontext-for-the-module)
* [`CommerceDiscountRuleTypeJSPContributor`의 `렌더링` 메서드를 구현합니다.](#implement-the-commercediscountruletypejspcontributors-render-method)
* [`평가`에 평가 논리를 추가합니다.](#add-the-evaluation-logic-to-evaluate)
* [JSP를 추가하여 사용자 정의 UI 입력을 렌더링하십시오.](#add-a-jsp-to-render-the-custom-ui-input)
* [`Language.properties`에 언어 키를 추가합니다.](#add-the-language-keys-to-languageproperties)

#### 모듈에 대한 `ServletContext` 구성

JSP를 찾을 수 있도록 번들의 기호 이름을 사용하여 JSP 기여자 클래스에서 `ServletContext` 을 정의합니다.

```java
@Reference(target = "(osgi.web.symbolicname=com.acme.m6a8.web)")
private ServletContext _servletContext;
```

> `osgi.web.symbolicname` 에 대해 설정된 값은 [bnd.bnd 파일](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/promotions/adding-a-new-discount-rule-type/resources/liferay-m6a8.zip/m6a8-web/bnd.bnd) 에서 `Bundle-SymbolicName` 에 대한 값과 일치합니다. 이러한 값은 JSP를 찾으려면 `ServletContext` 과 일치해야 합니다.
> 
> `ServletContext` 이 올바르게 생성되도록 bnd.bnd 파일에서 `Web-ContextPath` 에 대한 고유한 값을 선언합니다. 이 예에서 `Web-ContextPath` `/m6a8-web`으로 설정됩니다. 이러한 값에 대한 참조는 [bnd.bnd 파일](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/promotions/adding-a-new-discount-rule-type/resources/liferay-m6a8.zip/m6a8-web/bnd.bnd) 을 참조하십시오.

#### `CommerceDiscountRuleTypeJSPContributor`의 `렌더링` 메서드 구현

```java
@Override
public void render(
        long commerceDiscountId, long commerceDiscountRuleId,
        HttpServletRequest httpServletRequest,
        HttpServletResponse httpServletResponse)
    throws Exception {

    _jspRenderer.renderJSP(
        _servletContext, httpServletRequest, httpServletResponse,
        "/view.jsp");
}
```

> `JSPRenderer` 사용하여 할인 규칙 유형의 사용자 정의 UI 입력에 대한 JSP를 렌더링합니다(예제에서는 [view.jsp](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/promotions/adding-a-new-discount-rule-type/resources/liferay-m6a8.zip/m6a8-web/src/main/resources/META-INF/resources/view.jsp) ). `ServletContext` 을 매개변수로 제공하여 JSP를 찾으십시오.

#### 평가 논리를 `평가`에 추가

```java
@Override
public boolean evaluate(
        CommerceDiscountRule commerceDiscountRule,
        CommerceContext commerceContext)
    throws PortalException {

    CommerceOrder commerceOrder = commerceContext.getCommerceOrder();

    if (commerceOrder == null) {
        return false;
    }

    List<CommerceOrderItem> commerceOrderItems =
        commerceOrder.getCommerceOrderItems();

    int mininumNumberOfItems = GetterUtil.getInteger(
        commerceDiscountRule.getSettingsProperty(
            commerceDiscountRule.getType()));

    if (commerceOrderItems.size() >= mininumNumberOfItems) {
        return true;
    }

    return false;
}
```

> 적용할 할인 규칙에 대해 true여야 하는 모든 조건을 여기에서 구현합니다. 이 예는 사용자 정의 UI 입력( [CommerceDiscountRule](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-discount-service/src/main/java/com/liferay/commerce/discount/model/impl/CommerceDiscountRuleImpl.java) 내에서 문자열로 저장됨)에 의해 정의된 최소값을 사용하여 주문에 최소 항목 수가 포함되어 있는지 확인합니다.
> 
> `CommerceOrder` 개체는 평가 중인 주문에 대한 정보를 나타냅니다. `CommerceOrder`에서 얻을 수 있는 자세한 정보를 찾으려면 [CommerceOrder.java](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/model/CommerceOrder.java) 및 [CommerceOrderModel.java](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/model/CommerceOrderModel.java) 참조하십시오.

#### JSP를 추가하여 사용자 정의 UI 입력 렌더링

예제에서는 최소 제품 수에 대한 숫자 입력이 있는 `view.jsp` 이라는 JSP를 사용합니다.

```jsp
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<aui:input label="minimum-number-of-items" name="typeSettings" type="text">
    <aui:validator name="digits" />
    <aui:validator name="min">1</aui:validator>
</aui:input>
```

> 할인 규칙을 정의할 때 표시할 UI 요소를 구현합니다. 할인 규칙 유형을 선택한 직후에 나타납니다. 입력을 정의하면 저장된 값이 할인 규칙의 설정 속성에 저장됩니다.
> 
> AUI 입력 사용에 대한 자세한 내용은 [AUI Taglib 사용](https://help.liferay.com/hc/ko/articles/360020189212-Using-AUI-Taglibs) 참조하십시오.

#### `Language.properties`에 언어 키 추가

언어 키와 해당 값을 [Language.properties](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/promotions/adding-a-new-discount-rule-type/resources/liferay-m6a8.zip/m6a8-web/src/main/resources/content/Language.properties) 파일에 추가합니다.

```properties
has-a-minimum-number-of-items=Has a Minimum Number of Items
minimum-number-of-items=Minimum Number of Items
```

> 자세한 내용은 [응용 프로그램 지역화](https://help.liferay.com/hc/ko/articles/360018168251-Localizing-Your-Application) 참조하십시오.

## 결론

축하해요! 이제 `CommerceDiscountRuleType` 인터페이스를 구현하기 위한 기본 사항을 알고 있으며 Liferay Commerce에 사용자 정의 UI 입력이 있는 새로운 할인 규칙 유형을 추가했습니다.

## 관련 주제

* [할인 만들기](../../pricing/promoting-products/creating-a-discount.md)
* [애플리케이션 현지화](https://help.liferay.com/hc/ko/articles/360018168251-Localizing-Your-Application)
* [AUI Taglib 사용](https://help.liferay.com/hc/ko/articles/360020189212-Using-AUI-Taglibs)
