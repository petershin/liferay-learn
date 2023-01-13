# 맞춤형 주문 검사기 구현

이 자습서에서는 [CommerceOrderValidator](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/order/CommerceOrderValidator.java) 인터페이스를 구현하여 사용자 지정 주문 유효성 검사기를 추가하는 방법을 보여줍니다.

주문 유효성 검사기는 결제를 진행할 때 고객의 카트에 있는 항목의 유효성을 검사하는 클래스입니다. Liferay Commerce는 [기본값](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/order/DefaultCommerceOrderValidatorImpl.java)을 포함하여 여러 가지 즉시 사용 가능한 주문 유효성 검사기와 [항목 버전](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/order/VersionCommerceOrderValidatorImpl.java) 및 [반복 항목(구독)](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/order/SubscriptionCommerceOrderValidatorImpl.java)을 확인하는 유효성 검사기를 제공합니다.

## 개요

1. [**예제 배포**](#deploy-an-example)
1. [**예제 살펴보기**](#walk-through-the-example)
1. [**추가 정보**](#additional-information)

## 예제 배포

이 섹션에서는 Liferay Commerce 인스턴스에서 예제 주문 유효성 검사기를 시작하고 실행합니다.
```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps:

1. Download and unzip the [Acme Commerce Order Validator](./liferay-n9b2.zip).

    ```bash
    curl https://learn.liferay.com/commerce/latest/en/developer-guide/sales/liferay-n9b2.zip -O
    ```

    ```bash
    unzip liferay-n9b2.zip
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
    STARTED com.acme.n9b2.impl_1.0.0
    ```

1. 실패 메시지를 보고 예제 주문 검사기가 추가되었는지 확인합니다. 브라우저를 `https://localhost:8080` 로 열고 가격이 $100 이상인 항목이 하나 이상 있는 카탈로그로 이동합니다. 해당 제품이 아직 없으면 직접 추가하십시오. 자세한 내용은 [간단한 제품 만들기](../../product-management/creating-and-managing-products/product-types/creating-a-simple-product.md) 을 참조하십시오.

    카탈로그에서 이 가격의 항목을 찾은 다음 "장바구니에 추가"를 클릭하십시오. 수량을 11개 이상으로 늘린 다음 화살표를 클릭하여 계속합니다. 표시되는 오류 메시지는 사용자 지정 주문 유효성 검사기가 항목 추가를 성공적으로 거부했음을 보여줍니다.

    ![새 주문 확인 오류 메시지](./implementing-a-custom-order-validator/images/01.png "새 주문 확인 오류 메시지")

축하합니다. `CommerceOrderValidator`을 구현하는 새로운 주문 유효성 검사기를 성공적으로 구축하고 배포했습니다.

다음으로 더 자세히 알아보기 위해 더 깊이 들어가 보겠습니다.

## 예제 살펴보기

이 섹션에서는 배포한 예제를 검토합니다. 먼저 OSGi 등록을 위해 클래스에 주석을 달겠습니다. 둘째, `CommerceOrderValidator` 인터페이스를 검토합니다. 셋째, `CommerceOrderValidator`구현을 완료합니다.

### OSGi 등록을 위해 클래스에 주석 달기

```java
@Component(
    property = {
    "commerce.order.validator.key=n9b2",
    "commerce.order.validator.priority:Integer=9"
    },
    service = CommerceOrderValidator.class
)
public class N9B2CommerceOrderValidator implements CommerceOrderValidator {
```

> Liferay Commerce가 주문 유효성 검사기 레지스트리 [에서 새 주문 유효성 검사기를 다른 주문 유효성 검사기와 구별할 수 있도록 주문 유효성 검사기에 고유](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/order/CommerceOrderValidatorRegistryImpl.java)키를 제공하는 것이 중요합니다. 이미 사용 중인 키를 재사용하면 기존 관련 유효성 검사기가 재정의됩니다.
> 
> `commerce.order.validator.priority` 값은 주문 유효성 검사기가 다른 유효성 검사기와 순서대로 유효성 검사를 수행하는 시기를 나타냅니다. 예를 들어, [기본 주문 유효성 검사기](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/order/DefaultCommerceOrderValidatorImpl.java) 의 값은 10입니다. 주문 유효성 검사기에 값 9를 지정하면 기본 유효성 검사기 바로 전에 유효성 검사를 수행합니다.

### `CommerceOrderValidator` 인터페이스 검토

다음 방법을 구현합니다.

```java
public String getKey();
```

> 이 메서드는 주문 유효성 검사기 레지스트리에서 주문 유효성 검사기에 대한 고유 식별자를 제공합니다. 키는 레지스트리에서 유효성 검사기를 가져오는 데 사용할 수 있습니다. 이미 사용 중인 키를 재사용하면 기존 관련 유효성 검사기가 재정의됩니다.

```java
public CommerceOrderValidatorResult validate(Locale locale, CommerceOrder commerceOrder, CPInstance cpInstance, int quantity) throws PortalException;
```

> 이는 사용자 지정 유효성 검사 논리를 추가할 두 가지 유효성 검사 방법 중 하나입니다. 이 메서드는 고객이 장바구니에 항목을 추가할 때마다 호출됩니다. `CommerceOrderValidatorResult`을 반환하여 이를 수행합니다. 부울을 사용하여 결과가 유효성 검사를 통과하는지 여부를 알립니다. [CommerceOrderValidatorResult.java](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/order/CommerceOrderValidatorResult.java)참조.

```java
public CommerceOrderValidatorResult validate(Locale locale, CommerceOrderItem commerceOrderItem) throws PortalException;
```
> 이것은 사용자 지정 유효성 검사 논리를 추가할 수 있는 두 번째 유효성 검사 방법입니다. 이 메서드는 고객이 체크아웃에서 새 단계를 진행할 때마다 장바구니에 이미 있는 항목에 대해 호출됩니다.

### 주문 검사기 완료

주문 유효성 검사기는 장바구니에 제품을 추가하고 새로운 체크아웃 단계로 진행하기 위한 유효성 검사 논리로 구성됩니다. 다음을 수행하십시오.

* [카트에 제품을 추가하기 위한 유효성 검사 논리를 추가합니다.](#add-validation-logic-for-adding-a-product-to-cart)
* [체크아웃 진행을 위한 유효성 검사 논리를 추가합니다.](#add-validation-logic-for-proceeding-in-checkout)
* [언어 키를 `Language.properties`에 추가하십시오.](#add-the-language-keys-to-languageproperties)

두 개의 `유효성 검사` 메서드는 주문 유효성 검사기에 대한 사용자 지정 유효성 검사 논리를 정의하는 곳입니다. 이 예에서는 특정 가격 이상의 항목이 10개 이상인 주문을 거부하는 논리를 추가합니다.

#### 카트에 제품을 추가하기 위한 유효성 검사 논리 추가

```java
@Override
public CommerceOrderValidatorResult validate(
        Locale locale, CommerceOrder commerceOrder, CPInstance cpInstance,
        int quantity)
    throws PortalException {

    if (cpInstance == null) {
        return new CommerceOrderValidatorResult(false);
    }

    BigDecimal price = cpInstance.getPrice();

    if ((price.doubleValue() > _MAX_ITEM_PRICE) &&
        (quantity > _MAX_ITEM_QUANTITY)) {

        ResourceBundle resourceBundle = ResourceBundleUtil.getBundle(
            "content.Language", locale, getClass());

        return new CommerceOrderValidatorResult(
            false,
            LanguageUtil.format(
                resourceBundle,
                "this-expensive-item-has-a-maximum-quantity-of-x",
                Integer.valueOf(_MAX_ITEM_QUANTITY)));
    }

    return new CommerceOrderValidatorResult(true);
}

private static final double _MAX_ITEM_PRICE = 100.0;

private static final int _MAX_ITEM_QUANTITY = 10;
```

> 예제의 주요 유효성 검사는 가격( `BigDecimal`로 저장됨)이 $100 이상이고 수량이 10 이상인지 확인하는 것입니다. 고객이 추가한 주문에 대한 정보가 포함된 `CPInstance`에서 가격 정보를 가져옵니다. `CPInstance`과 함께 사용할 수 있는 더 많은 방법을 찾으려면 [CPInstance](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/model/CPInstance.java) 및 [CPInstanceModel](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/model/CPInstanceModel.java)를 참조하십시오.
> 
> 기본 유효성 검사에 대해 유효성 검사가 실패한 이유를 설명하는 현지화된 메시지를 포함하는 것이 가장 좋습니다.

#### 결제 진행을 위한 유효성 검사 논리 추가

```java
@Override
public CommerceOrderValidatorResult validate(
        Locale locale, CommerceOrderItem commerceOrderItem)
    throws PortalException {

    BigDecimal price = commerceOrderItem.getUnitPrice();

    if ((price.doubleValue() > _MAX_ITEM_PRICE) &&
        (commerceOrderItem.getQuantity() > _MAX_ITEM_QUANTITY)) {

        ResourceBundle resourceBundle = ResourceBundleUtil.getBundle(
            "content.Language", locale, getClass());

        return new CommerceOrderValidatorResult(
            false,
            LanguageUtil.format(
                resourceBundle,
                "expensive-items-have-a-maximum-order-quantity-of-x",
                Integer.valueOf(_MAX_ITEM_QUANTITY)));
    }

    return new CommerceOrderValidatorResult(true);
}
```

> 고객 카트의 항목에 대해 호출되므로 이 메서드에 동일한 유효성 검사 논리를 추가합니다. 이 경우의 주요 차이점은 `CommerceOrderItem` 개체에서 정보를 얻는다는 것입니다. [CommerceOrderItem](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/model/CommerceOrderItem.java) 및 [CommerceOrderItemModel](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/model/CommerceOrderItemModel.java) 를 참조하여 `CommerceOrderItem`과 함께 사용할 수 있는 더 많은 방법을 찾으십시오.

#### `Language.properties`에 언어 키 추가

모듈 내의 [Language.properties](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/sales/implementing-a-custom-order-validator/resources/liferay-n9b2.zip/n9b2-impl/src/main/resources/content/Language.properties) 파일에 언어 키와 해당 값을 추가합니다.

```properties
expensive-items-have-a-maximum-order-quantity-of-x=Expensive items have a maximum order quantity of {0}.
this-expensive-item-has-a-maximum-quantity-of-x=This expensive item has a maximum order quantity of {0}.
```

> 자세한 내용은 [응용 프로그램 지역화](https://help.liferay.com/hc/en-us/articles/360018168251-Localizing-Your-Application) 을 참조하십시오.

## 결론

축하합니다! 이제 `CommerceOrderValidator` 인터페이스를 구현하기 위한 기본 사항을 알고 있으며 Liferay Commerce에 새 주문 유효성 검사기를 추가했습니다.

## 추가 정보

* [간단한 제품 만들기](../../product-management/creating-and-managing-products/product-types/creating-a-simple-product.md)
* [애플리케이션 현지화](https://help.liferay.com/hc/en-us/articles/360018168251-Localizing-Your-Application)
