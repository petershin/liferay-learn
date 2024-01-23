# 새로운 결제 수단 구현

이 자습서에서는 [CommercePaymentMethod](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/payment/method/CommercePaymentMethod.java) 인터페이스를 구현하여 새 결제 방법을 추가하는 방법을 보여줍니다.

결제 방법은 고객이 주문에 대해 결제할 수 있는 다양한 방법을 나타냅니다. Liferay Commerce는 [Authorize.Net](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-payment-method-authorize-net/src/main/java/com/liferay/commerce/payment/method/authorize/net/internal/AuthorizeNetCommercePaymentMethod.java) , [Mercanet](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-payment-method-mercanet/src/main/java/com/liferay/commerce/payment/method/mercanet/internal/MercanetCommercePaymentMethod.java) , [Money Order](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-payment-method-money-order/src/main/java/com/liferay/commerce/payment/method/money/order/internal/MoneyOrderCommercePaymentMethod.java) 및 [PayPal](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-payment-method-paypal/src/main/java/com/liferay/commerce/payment/method/paypal/internal/PayPalCommercePaymentMethod.java) 을 포함한 몇 가지 즉시 사용 가능한 결제 방법을 제공합니다.

![즉시 사용 가능한 결제 방법](./implementing-a-new-payment-method/images/01.png "즉시 사용 가능한 결제 방법")

## 개요

1. [**예제 배포**](#deploy-an-example)
1. [**예제 살펴보기**](#walk-through-the-example)
1. [**추가 정보**](#additional-information)

## 예제 배포

이 섹션에서는 Liferay Commerce 인스턴스에서 실행되는 결제 방법의 예를 살펴보겠습니다.
```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르세요.

1. [Acme Commerce 결제 수단](./liferay-b1c3.zip) 을 다운로드하고 압축을 풉니다.

    ```bash
    curl https://resources.learn.liferay.com/commerce/latest/en/developer-guide/sales/liferay-b1c3.zip -O
    ```

    ```bash
    unzip liferay-b1c3.zip
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
    STARTED com.acme.b1c3.impl_1.0.0
    ```

1. 예시 결제 수단이 추가되었는지 확인합니다. 브라우저에서 `https://localhost:8080`로 엽니다. 그런 다음 애플리케이션 메뉴(![Applications Menu](../../images/icon-applications-menu.png))를 클릭하고 **Commerce** → **Channels** 로 이동한 다음 **Payment Methods** 섹션으로 스크롤합니다.

```{note}
Liferay Commerce 2.1 및 이전 버전에서는 *사이트 관리* → *상거래* → *설정* → *결제 방법*으로 이동합니다.
```

![새 결제 수단](./implementing-a-new-payment-method/images/02.png "새 결제 수단")

축하합니다. `CommercePaymentMethod`을 구현하는 새 결제 방법을 성공적으로 구축하고 배포했습니다.

다음으로 더 자세히 알아보기 위해 더 깊이 들어가 보겠습니다.

## 예제 살펴보기

이 섹션에서는 배포한 예제를 검토합니다. 먼저 OSGi 등록을 위해 클래스에 주석을 달겠습니다. 둘째, `CommercePaymentMethod` 인터페이스를 검토합니다. 셋째, `CommercePaymentMethod`구현을 완료합니다.

### OSGi 등록을 위해 클래스에 주석 달기

```java
@Component(
    property = "commerce.payment.engine.method.key=b1c3",
    service = CommercePaymentMethod.class
)
public class B1C3CommercePaymentMethod implements CommercePaymentMethod {
```
> Liferay Commerce가 지불 방법 레지스트리 [에서 새로운 지불 방법을 다른 지불 방법과 구별할 수 있도록 지불 방법에 대한 고유 키를 제공하는 것이 중요](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-payment-service/src/main/java/com/liferay/commerce/payment/internal/method/CommercePaymentMethodRegistryImpl.java) . 이미 사용 중인 키를 재사용하면 기존에 연결된 결제 수단이 재정의됩니다.

### `CommercePaymentMethod` 인터페이스 검토

다음 방법을 구현합니다.

```java
    public String getDescription(Locale locale);
```

> 이것은 **지불 방법** 관리 페이지의 "설명" 열을 채웁니다. 언어 키로 설명 검색에 대한 참조는 [B1C3CommercePaymentMethod.java](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/sales/implementing-a-new-payment-method/resources/liferay-b1c3.zip/b1c3-impl/src/main/java/com/acme/b1c3/internal/commerce/payment/method/B1C3CommercePaymentMethod.java) 의 구현을 참조하십시오.

```java
    public String getKey();
```
> 이것은 지불 방법 레지스트리에서 지불 방법에 대한 고유 식별자를 제공합니다. 키는 레지스트리에서 지불 방법을 가져오는 데 사용할 수 있습니다. 이미 사용 중인 키를 재사용하면 기존에 연결된 결제 수단이 재정의됩니다.

```java
    public String getName(Locale locale);
```

> 이것은 **지불 방법** 관리 페이지의 "이름" 열을 채웁니다. `getDescription` 메소드와 유사하게 작동합니다.

```java
    public int getPaymentType();
```
> 이것은 지불 엔진이 주어진 지불 방법을 사용하는 방법을 식별합니다.
> 
> `COMMERCE_PAYMENT_METHOD_TYPE_OFFLINE` 값을 사용하여 이 결제 방법에 대한 온라인 처리 요구 사항이 없음을 결제 엔진에 알립니다. 즉시 사용할 수 있는 두 가지 다른 지불 유형 상수가 있습니다: `COMMERCE_PAYMENT_METHOD_TYPE_ONLINE_STANDARD` 및 `COMMERCE_PAYMENT_METHOD_TYPE_ONLINE_REDIRECT`.

```java
    public String getServletPath();
```

> 온라인 지불 방법에 대해 외부 지불 제공자와의 적절한 인터페이스를 활성화하려면 서블릿이 필요할 수 있습니다. 오프라인 결제 방법에는 서블릿 경로가 필요하지 않으므로 `getServletPath` 은 `null`을 반환해야 합니다.

### 지불 방법을 완료하십시오

결제 방법은 결제 처리 및 완료를 위한 백엔드 로직과 더 많은 선택적인 사용자 지정 동작으로 구성됩니다. 다음을 수행하십시오.

* [결제 처리 로직을 구현합니다.](#implement-payment-processing-logic)
* [결제 완료 로직을 구현합니다.](#implement-payment-completion-logic)
* [선택적 방법을 구현합니다.](#implement-optional-methods)
* [언어 키를 `Language.properties`에 추가하십시오.](#add-the-language-keys-to-languageproperties)

#### 결제 처리 로직 구현

```java
@Override
public boolean isProcessPaymentEnabled() {
    return true;
}
```
> 결제 방법이 결제를 처리하려면 이 메서드가 true를 반환해야 합니다. 이는 결제 엔진에 결제 방법이 지원하는 기능을 알려줍니다.

```java
@Override
public CommercePaymentResult processPayment(
        CommercePaymentRequest commercePaymentRequest)
    throws Exception {

    return new CommercePaymentResult(
        null, commercePaymentRequest.getCommerceOrderId(),
        CommerceOrderConstants.PAYMENT_STATUS_AUTHORIZED, false, null, null,
        Collections.emptyList(), true);
}
```
> 이 방법으로 사용자 정의 지불 논리를 구현하십시오. `CommercePaymentResult` 은 지불 처리와 관련된 정보를 저장해야 합니다. 자세한 내용은 [CommercePaymentResult.java](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/payment/result/CommercePaymentResult.java) 을 참조하십시오.

#### 결제 완료 로직 구현

```java
@Override
public boolean isCompleteEnabled() {
    return true;
}
```
> 결제 방법이 결제를 완료하려면 true를 반환해야 합니다. 이는 결제 엔진에 결제 방법이 지원하는 기능을 알려줍니다.

```java
@Override
public CommercePaymentResult completePayment(
        CommercePaymentRequest commercePaymentRequest)
    throws Exception {

    return new CommercePaymentResult(
        null, commercePaymentRequest.getCommerceOrderId(),
        CommerceOrderConstants.PAYMENT_STATUS_PAID, false, null, null,
        Collections.emptyList(), true);
}
```
> 이 메서드에서 사용자 지정 결제 완료 로직을 구현합니다.  `CommercePaymentResult` 은 결제 프로세스 완료와 관련된 정보를 저장하는 컨테이너입니다. 자세한 내용은 [CommercePaymentResult.java](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/payment/result/CommercePaymentResult.java) 을 참조하십시오.

#### 선택적 방법 구현

구독, 반복 결제 및 환불과 같은 추가 기능을 제공하기 위해 구현될 수 있는 추가 방법이 있습니다. 이들은 [CommercePaymentMethod.java](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/payment/method/CommercePaymentMethod.java) 에서 볼 수 있습니다. 이러한 메서드는 쌍으로 제공됩니다. 하나는 활성화하는 메서드이고 다른 하나는 지정된 기능을 구현하는 것입니다.

이러한 방법 중 다수는 온라인 API를 사용하는 결제 방법에 중요합니다. 온라인 지불 방법의 예는 [PayPalCommercePaymentMethod](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-payment-method-paypal/src/main/java/com/liferay/commerce/payment/method/paypal/internal/PayPalCommercePaymentMethod.java) 을 참조하십시오.

이 예에서는 이러한 선택적 메서드를 재정의하지 않습니다.

#### `Language.properties`에 언어 키 추가

모듈 내의 [Language.properties](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/sales/implementing-a-new-payment-method/resources/liferay-b1c3.zip/b1c3-impl/src/main/resources/content/Language.properties) 파일에 언어 키와 해당 값을 추가합니다.

```properties
b1c3-commerce-payment-method=B1C3 Commerce Payment Method
pay-via-b1c3-commerce-payment-method=Pay via B1C3 commerce payment method.
```

> 자세한 내용은 [응용 프로그램 지역화](https://help.liferay.com/hc/ko/articles/360018168251-Localizing-Your-Application) 을 참조하십시오.

## 결론

축하합니다! 이제 `CommercePaymentMethod` 인터페이스를 구현하기 위한 기본 사항을 알고 있으며 Liferay Commerce에 새 결제 방법을 추가했습니다.

## 관련 주제

* [애플리케이션 현지화](https://help.liferay.com/hc/ko/articles/360018168251-Localizing-Your-Application)
