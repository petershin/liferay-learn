# 맞춤 주문 상태 구현

`CommerceOrderStatus` 인터페이스를 구현하여 사용자 지정 주문 상태를 추가할 수 있습니다. 상거래 주문 엔진은 즉시 사용 가능한 표준 주문 흐름을 제공하지만 필요에 맞게 사용자 지정할 수 있습니다.

맞춤 주문 상태는 기존 주문 흐름에 추가된 새로운 단계입니다. 표준 주문 흐름이 처리하지 않는 주문 처리 프로세스를 원할 때 사용자 지정 주문 상태가 필요합니다. 먼저 주문 상태가 작동하는 방식을 배운 다음 새 예제 구현을 배포합니다.

## 주문 상태 개요

Liferay 주문 엔진에는 1) 공개, 2) 진행 중, 3) 보류 중, 4) 처리 중, 5) 발송됨, 6) 완료의 6가지 주요 상태가 있습니다.

![Liferay Commerce에는 기본적으로 6가지 주문 상태가 있습니다.](./implementing-a-custom-order-status/images/01.png)

주문 엔진은 올바른 주문 처리를 보장하고 주문에 적용될 다음 상태를 결정하기 위해 각 주문 상태에 대해 확인을 수행합니다. 위에서 언급한 주요 상태 외에도 주문은 세 가지 대체 상태로 전환될 수 있습니다.

![주문은 세 가지 대체 상태로 전환될 수 있습니다.](./implementing-a-custom-order-status/images/02.png)

1. **보류 중** - 최종 주문 상태가 아닌 경우(보류 중, 처리 중, 배송됨) 주문을 보류할 수 있습니다.

1. **취소됨** - 주문이 최종 주문 상태가 아닌 경우(보류 중, 처리 중, 배송됨) 주문을 취소할 수 있습니다.

1. **부분 배송됨** - 주문에 여러 항목이 있고 모든 항목이 배송되지 않은 경우 **부분 배송됨** 상태로 전환됩니다.

![주문 흐름에 새 주문 상태를 추가할 수 있습니다.](./implementing-a-custom-order-status/images/03.png)

기본 주문 흐름을 변경하기 위해 사용자 지정 주문 상태를 추가할 수 있습니다. 아래에서 **Scheduling** 이라는 주문 상태를 추가하고 기존 **Pending** 상태와 **Processing** 상태 사이에 배치합니다. 이 사용자 지정 단계는 수락되기 전에 예약 대기 중인 주문을 나타냅니다. 주문의 사용자 정의 필드는 일정 상태를 추적합니다. 각 주문 상태 및 전환에 대한 자세한 내용은 [상거래 주문 엔진 개요](./commerce-order-engine-overview.md) 을 참조하십시오.

## 주문 상태 배포

1. 라이프레이 커머스를 시작하세요.

    ```bash
    docker run -it -p 8080:8080 liferay/portal:7.4.1-ga2
    ```

1. Acme Commerce 주문 상태 방법을 다운로드하고 압축을 풉니다.

    ```bash
    curl https://resources.learn.liferay.com/commerce/latest/en/developer-guide/order-management/liferay-m4v7.zip

    unzip liferay-m4v7.zip
    ```

1. 예제를 빌드하고 배포합니다.

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    !!! note
        이 명령은 배포된 jar를 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.

1. Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```bash
    STARTED com.acme.m4v7.impl_1.0.0
    ```

1. 주문 일정을 추적하려면 사용자 정의 필드를 생성해야 합니다. **애플리케이션 메뉴**(![Applications Menu](../../images/icon-applications-menu.png))를 클릭하고 **제어판** → **사용자 정의 필드** 으로 이동합니다.

1. 항목 목록에서 Commerce Order를 선택하고 **추가**(![Add](../../images/icon-add.png)) 버튼을 클릭하여 새 필드를 추가합니다. 사용 가능한 필드에서 **드롭다운** 옵션을 선택하고 아래 정보를 입력합니다. 완료되면 **저장** 을 클릭합니다.

   __필드 이름__: m4v7Scheduling

   __데이터 유형__: 텍스트

   __값__: 보류 중, 확인됨(두 개의 별도 라인)

 ![주문 일정을 추적하기 위해 사용자 지정 필드를 추가합니다.](./implementing-a-custom-order-status/images/04.png)

1. 브라우저를 `https://localhost:8080` 로 열고 응용 프로그램 메뉴(![Applications Menu](../../images/icon-applications-menu.png))에서 귀하의 사이트로 이동하여 주문을 하여 예제 주문 상태가 추가되었는지 확인하십시오.

1. 애플리케이션 메뉴를 다시 클릭하고 **Commerce** → **Orders** 으로 이동한 다음 주문을 선택합니다. 새로운 상태 **Scheduling** 과 새로운 주문 흐름을 설정하는 Scheduling이라는 버튼이 주문 수명 주기에 나타납니다. 새 사용자 정의 필드는 주문의 **사용자 정의 필드** 섹션 아래에 있습니다.

   ![새 주문 상태가 작동 중입니다.](./implementing-a-custom-order-status/images/05.gif)

## 맞춤 주문 상태 작동 방식

예제 구현은 3단계로 구현됩니다. 먼저 OSGi 등록을 위해 클래스에 주석을 달아야 합니다. 다음으로 [`CommerceOrderStatus`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/order/status/CommerceOrderStatus.java) 인터페이스를 검토합니다. 마지막으로 사용자 지정 `CommerceOrderStatus`구현을 완료합니다.

- [OSGi 등록을 위해 클래스에 주석 달기](#annotate-the-class-for-osgi-registration)
- [`CommerceOrderStatus` 인터페이스 검토](#review-the-commerceorderstatus-interface)
- [주문 상태 완료](#complete-the-order-status)

!!! important
    주문 수명 주기에서 새 상태를 배치하는 단계에 따라 올바른 주문 처리를 위해 다음 단계를 조정해야 합니다. 이 예에서는 보류 중 및 처리 중 상태 사이에 새 상태를 배치하므로 논리에서 새 상태를 확인하도록 기존 처리 중 상태를 재정의해야 합니다.

### OSGi 등록을 위해 클래스에 주석 달기

```{literalinclude} ./implementing-a-custom-order-status/resources/liferay-m4v7.zip/m4v7-impl/src/main/java/com/acme/m4v7/internal/commerce/order/status/M4V7SchedulingCommerceOrderStatus.java
    :language: java
    :lines: 17-23
```

Liferay Commerce가 주문 상태 레지스트리에서 새 상태를 다른 상태와 구별할 수 있도록 주문 상태에 대한 고유 키를 제공하는 것이 중요합니다. 이미 사용 중인 키를 지정하면 기존의 연결된 상태가 재정의됩니다. 주문 상태의 우선 순위에 따라 주문 수명 주기에서 주문이 결정됩니다. 이 경우 보류 상태의 우선 순위는 30이고 처리 상태의 우선 순위는 50입니다. 둘 사이에 상태를 배치하려면 우선 순위가 두 숫자 사이에 있어야 합니다(이 경우 40).

!!! note
    이 예제 구현의 경우 임의의 정수가 키로 설정되고 40이 우선 순위로 설정되지만 코드 내에서 더 나은 가독성을 위해 변수를 사용할 수 있습니다. 예제 [here](https://gist.github.com/aswinrajeevofficial/5d09d76ae11a1dc78c7d1fc388ae0306#file-m4v7schedulingcommerceorderstatus-java) 을 참조하십시오.

### CommerceOrderStatus 인터페이스 검토

다음 방법을 구현합니다.

```java
public String getLabel(Locale locale);
```

이 메서드는 주문 상태의 이름을 반환합니다. 이 이름은 UI에 나타나는 이름에 해당하는 언어 키일 수 있습니다. 이 경우 문자열 **Scheduling** 을 반환합니다.

```java
public int getKey();
```

이 메서드는 주문 상태의 고유 키를 반환합니다. 기존 키를 사용하면 해당 상태가 무시됩니다.

```java
public int getPriority();
```

이 메서드는 주문 상태의 우선 순위를 반환합니다. 이것은 이 상태가 배치되는 단계를 결정하는 데 사용됩니다.

```java
public boolean isTransitionCriteriaMet(CommerceOrder commerceOrder) throws PortalException;
```

이 메서드는 주문이 현재 주문 상태에 대해 지정된 모든 전환 기준을 충족하는지 확인합니다.

```java
public CommerceOrder doTransition(CommerceOrder commerceOrder, long userId) throws PortalException;
```

이 상태에 대한 전환 기준이 충족되면 `doTransition` 메서드는 주문이 이 상태로 전환되는 데 필요한 모든 작업을 수행합니다.

```java
public boolean isComplete(CommerceOrder commerceOrder);
```

이 메서드는 주문 상태가 작업을 완료하고 다음 상태로 전환할 준비가 되었는지 확인합니다. 예약 상태의 경우 사용자 정의 필드 값이 보류 중인지 또는 확인되었으며 처리 단계로 전환할 준비가 되었는지 확인합니다.

인터페이스에는 두 가지 방법이 더 있습니다. 첫 번째 `공개 부울 isValidForOrder(CommerceOrder commerceOrder) throws PortalException` 은 상태가 주문에 적용 가능한지 확인합니다. 두 번째 `public boolean isWorkflowEnabled(CommerceOrder commerceOrder) throws PortalException` 은 상태와 연결된 워크플로가 있는지 확인합니다. 이 예제에서는 이러한 메서드를 구현할 필요가 없습니다.

### 주문 상태 완료

주문 상태 구현은 예약 상태에 대한 메서드 구현과 처리 상태에 있는 기존 비즈니스 논리 조정으로 구성됩니다.

- [`isTransitionCriteriaMet` 메서드 구현](#implement-the-istransitioncriteriamet-method)
- [`doTransition` 메서드 구현](#implement-the-dotransition-method)
- [`isComplete` 메소드 구현](#implement-the-iscomplete-method)
- [기존 **처리** 상태 재정의](#override-the-existing-processing-status)
- [처리 상태 비즈니스 로직 조정](#tweak-the-processing-status-business-logic)

#### isTransitionCriteriaMet 메소드 구현

```{literalinclude} ./implementing-a-custom-order-status/resources/liferay-m4v7.zip/m4v7-impl/src/main/java/com/acme/m4v7/internal/commerce/order/status/M4V7SchedulingCommerceOrderStatus.java
    :dedent: 1
    :language: java
    :lines: 65-76
```

주문이 **예약** 주문 상태로 전환되려면 **보류** 상태여야 합니다. 이것은 `commerceOrder` 개체에서 `getOrderStatus()` 메서드를 사용하여 확인합니다. 이 메서드는 주문이 보류 중이면 `참` 을 반환하고 그렇지 않으면 `거짓` 을 반환합니다.

#### doTransition 메소드 구현

```{literalinclude} ./implementing-a-custom-order-status/resources/liferay-m4v7.zip/m4v7-impl/src/main/java/com/acme/m4v7/internal/commerce/order/status/M4V7SchedulingCommerceOrderStatus.java
    :dedent: 1
    :language: java
    :lines: 26-34
```

주문에 대한 전환 기준이 충족되면 고유 키를 사용하여 주문 상태를 **Scheduling** 로 설정합니다. 그런 다음 `_commerceOrderService`에서 `updateCommerceOrder()` 메서드를 호출하고 `commerceOrder` 개체를 전달하여 새 상태를 업데이트합니다.

#### isComplete 메소드 구현

```{literalinclude} ./implementing-a-custom-order-status/resources/liferay-m4v7.zip/m4v7-impl/src/main/java/com/acme/m4v7/internal/commerce/order/status/M4V7SchedulingCommerceOrderStatus.java
    :dedent: 1
    :language: java
    :lines: 51-63
```

Scheduling 단계를 완료하려면 Custom Field를 **Confirmed** 로 설정해야 합니다. 이 사용자 정의 속성은 `m4v7Scheduling`키를 사용하여 `ExpandoBridge` 을 통해 검색됩니다. 드롭다운이므로 반환 값은 String 배열 안에 있으며 첫 번째 값입니다. 값이 **Confirmed** 이면 메서드는 `true`을 반환하고 배열이 비어 있으면 `false`를 반환합니다.

#### 기존 처리 상태 재정의

```{literalinclude} ./implementing-a-custom-order-status/resources/liferay-m4v7.zip/m4v7-impl/src/main/java/com/acme/m4v7/internal/commerce/order/status/M4V7ProcessingCommerceOrderStatus.java
    :language: java
    :lines: 15-22
```

내부에 존재하는 논리를 조정하려면 기존 처리 상태를 재정의해야 합니다. 이는 OSGi 등록을 위해 클래스에 주석을 달고 기존 상태와 동일한 키 및 우선 순위를 사용하여 수행됩니다. `service.ranking` 은 재정의된 상태에 대해 100으로 설정되어 기존 것보다 우선합니다.

#### 처리 상태 비즈니스 로직 조정

```{literalinclude} ./implementing-a-custom-order-status/resources/liferay-m4v7.zip/m4v7-impl/src/main/java/com/acme/m4v7/internal/commerce/order/status/M4V7ProcessingCommerceOrderStatus.java
    :dedent: 1
    :language: java
    :lines: 54-74
```

원래 처리 상태는 메서드에서 보류 상태를 확인하므로 새로 추가된 상태를 확인하려면 약간 조정해야 합니다. 이것은 새 상태의 고유 키를 사용하여 수행됩니다.

## 결론

축하합니다! 이제 `CommerceOrderStatus` 인터페이스를 구현하기 위한 기본 사항을 알고 있으며 Liferay Commerce에 새 주문 상태를 추가했습니다.

## 관련 주제

- [상거래 주문 엔진 개요](./commerce-order-engine-overview.md)