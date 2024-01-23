# 사용자 정의 주문 유효성 검사기 구현

이 튜토리얼에서는 [CommerceOrderValidator](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/order/CommerceOrderValidator.java) 인터페이스를 구현하여 사용자 정의 주문 유효성 검사기를 추가하는 방법을 설명합니다.

주문 유효성 검사기는 결제를 진행할 때 고객 장바구니에 있는 품목의 유효성을 검사하는 클래스입니다. Liferay는 [기본값](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/order/DefaultCommerceOrderValidatorImpl.java) 을 포함한 여러 가지 기본 주문 유효성 검사기와 [항목 버전](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/order/VersionCommerceOrderValidatorImpl.java) 및 [반복 항목(구독)](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/order/SubscriptionCommerceOrderValidatorImpl.java) 을 확인하는 유효성 검사기를 제공합니다.

주문 유효성 검사기에는 장바구니에 제품을 추가하고 새로운 결제 단계를 진행하기 위한 유효성 검사 논리가 있습니다. 세 부분이 있습니다:

1. [장바구니에 제품을 추가하기 위한 검증 논리입니다.](#validation-logic-for-adding-a-product-to-cart)
1. [결제 진행을 위한 검증 로직.](#validation-logic-for-proceeding-to-checkout)
1. [`Language.properties`에 언어 키가 추가되었습니다.](#language-keys-added-to-languageproperties)

두 개의 `validate` 메소드는 주문 유효성 검사기에 대한 사용자 정의 유효성 검사 논리를 정의하는 곳입니다. 이 예에서는 특정 가격을 초과하는 항목이 10개 이상인 주문을 거부하는 논리를 추가합니다.

## 샘플 주문 검사기 배포

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르세요.

1. [Acme Commerce Order Validator](./liferay-n9b2.zip) 을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/developer-guide/sales/liferay-n9b2.zip -O
   ```

   ```bash
   unzip liferay-n9b2.zip
   ```

1. 예제를 빌드하고 배포합니다.

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    !!! note
        이 명령은 배포된 jar를 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.

1. Docker 컨테이너 콘솔에서 배포를 확인합니다.

   ```bash
   STARTED com.acme.n9b2.impl_1.0.0
   ```

1. 실패 메시지를 보고 예제 주문 유효성 검사기의 추가를 확인합니다. 브라우저에서 `https://localhost:8080`을 열고 가격이 100달러가 넘는 항목이 하나 이상 포함된 카탈로그로 이동하세요. 해당 제품이 아직 없으면 직접 추가하세요. 자세한 내용은 [간단한 제품 만들기](../../product-management/creating-and-managing-products/product-types/creating-a-simple-product.md) 참조하세요.

   카탈로그에서 이 가격의 품목을 찾은 다음 _장바구니에 추가_를 클릭하세요. 수량을 11개 이상으로 늘린 다음 화살표를 클릭하여 계속하세요. 표시되는 오류 메시지는 맞춤 주문 검사기가 항목 추가를 성공적으로 거부했음을 보여줍니다.

   ![The custom order validator displays an error message.](./implementing-a-custom-order-validator/images/01.png)

축하합니다. `CommerceOrderValidator`를 구현하는 새로운 주문 유효성 검사기를 성공적으로 구축하고 배포했습니다.

Order Validator 생성은 세 가지 주요 단계로 구성됩니다. 먼저 OSGi 등록을 위해 클래스에 주석을 답니다. 둘째, `CommerceOrderValidator` 인터페이스를 구현합니다. 마지막으로 `CommerceOrderValidator` 구현을 만듭니다.

## OSGi 등록을 위해 클래스에 주석 달기

```{literalinclude} ./implementing-a-custom-order-validator/resources/liferay-n9b2.zip/n9b2-impl/src/main/java/com/acme/n9b2/internal/commerce/order/N9B2CommerceOrderValidator.java
    :language: java
    :lines: 20-26
```

Liferay가 [주문 검증인 레지스트리](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/order/CommerceOrderValidatorRegistryImpl.java) 에서 새로운 주문 검증인을 다른 주문 검증인과 구별할 수 있도록 주문 검증인에 대한 고유 키를 제공하는 것이 중요합니다. 이미 사용 중인 키를 재사용하면 기존에 연결된 유효성 검사기가 재정의됩니다.

`commerce.order.validator.priority` 값은 주문 유효성 검사기가 다른 유효성 검사기와 순서대로 유효성 검사를 수행하는 시기를 나타냅니다. 예를 들어, [기본 주문 유효성 검사기](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/order/DefaultCommerceOrderValidatorImpl.java) 의 값은 10입니다. 주문 유효성 검사기의 값을 9로 지정하면 기본 유효성 검사기 직전에 유효성 검사가 수행됩니다.

## `CommerceOrderValidator` 인터페이스 검토

인터페이스를 사용하려면 다음 세 가지 메서드를 구현해야 합니다.

```java
public String getKey();
```

이 방법은 주문 유효성 검사기 레지스트리에서 주문 유효성 검사기에 대한 고유 식별자를 제공합니다. 키는 레지스트리에서 유효성 검사기를 가져옵니다. 이미 사용 중인 키를 재사용하면 기존에 연결된 유효성 검사기가 재정의됩니다.

```java
public CommerceOrderValidatorResult validate(Locale locale, CommerceOrder commerceOrder, CPInstance cpInstance, int quantity) throws PortalException;
```

이는 사용자 지정 유효성 검사 논리를 추가하는 두 가지 유효성 검사 방법 중 하나입니다. 이 메소드는 고객이 장바구니에 품목을 추가할 때마다 호출됩니다. 결과가 유효성 검사를 통과했는지 여부를 알리기 위해 부울을 사용하는 `CommerceOrderValidatorResult`를 반환하여 이를 수행합니다. 자세한 내용은 [CommerceOrderValidatorResult.java](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/order/CommerceOrderValidatorResult.java) 참조하세요.

```java
public CommerceOrderValidatorResult validate(Locale locale, CommerceOrderItem commerceOrderItem) throws PortalException;
```

이는 사용자 지정 유효성 검사 논리를 추가할 수 있는 두 번째 유효성 검사 방법입니다. 이 메소드는 주문이 '진행 중' 또는 '보류 중'으로 전환될 때마다 장바구니에 이미 있는 항목에 대해 호출됩니다.

### 장바구니에 제품을 추가하기 위한 검증 로직

```{literalinclude} ./implementing-a-custom-order-validator/resources/liferay-n9b2.zip/n9b2-impl/src/main/java/com/acme/n9b2/internal/commerce/order/N9B2CommerceOrderValidator.java
    :dedent: 1
    :language: java
    :lines: 34-61
```

```java
private static final double _MAX_ITEM_PRICE = 100.0;

private static final int _MAX_ITEM_QUANTITY = 10;
```

예제의 주요 검증에서는 가격(`BigDecimal`로 저장됨)이 $100를 초과하고 수량이 10보다 큰지 확인합니다. 이 가격 정보는 고객 주문에 대한 정보가 포함된 'CPInstance'에서 확인할 수 있습니다. `CPInstance`와 함께 사용할 수 있는 더 많은 메서드를 찾으려면 [CPInstance](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/model/CPInstance.java) 및 [CPInstanceModel](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/model/CPInstanceModel.java) 을 참조하세요.

!!! note
    기본 유효성 검사에 대한 유효성 검사가 실패한 이유를 설명하는 현지화된 메시지를 포함하는 것이 가장 좋습니다.

### 결제 진행을 위한 검증 로직

```{literalinclude} ./implementing-a-custom-order-validator/resources/liferay-n9b2.zip/n9b2-impl/src/main/java/com/acme/n9b2/internal/commerce/order/N9B2CommerceOrderValidator.java
    :dedent: 1
    :language: java
    :lines: 62-84
```

고객 장바구니에 있는 항목에 대해 호출되므로 이 메서드에 동일한 유효성 검사 논리를 추가합니다. 여기서 가장 큰 차이점은 `CommerceOrderItem` 개체에서 정보를 얻는다는 것입니다. `CommerceOrderItem`과 함께 사용할 수 있는 더 많은 방법을 찾으려면 [CommerceOrderItem](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/model/CommerceOrderItem.java) 및 [CommerceOrderItemModel](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/model/CommerceOrderItemModel.java) 을 참조하세요.

### `Language.properties`에 언어 키가 추가되었습니다.

모듈 내의 [Language.properties](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/sales/implementing-a-custom-order-validator/resources/liferay-n9b2.zip/n9b2-impl/src/main/resources/content/Language.properties) 파일에 언어 키와 해당 값을 추가하십시오. 예를 들어,

```properties
expensive-items-have-a-maximum-order-quantity-of-x=Expensive items have a maximum order quantity of {0}.
this-expensive-item-has-a-maximum-quantity-of-x=This expensive item has a maximum order quantity of {0}.
```

자세한 내용은 [애플리케이션 지역화](https://help.liferay.com/hc/ko/articles/360018168251-Localizing-Your-Application) 참조하세요.

## 사용자 정의 주문 유효성 검사기 수정

주문 유효성 검사기의 기능을 변경하려면 Java 파일을 편집하면 됩니다. `_MAX_ITEM_PRICE` 값을 변경하여 유효성 검사기가 $200 이상의 주문을 거부하도록 합니다. 이러한 변경 사항을 Liferay로 보내려면 사용자 지정 주문 유효성 검사기를 다시 배포하세요.

브라우저로 돌아가서 $100에서 $200 사이의 가치가 있는 항목 10개를 추가해 보세요. 유효성 검사기가 더 이상 $100 이상의 주문을 거부하지 않으므로 이러한 항목을 장바구니에 추가할 수 있습니다.

이제 $200 이상의 가치가 있는 항목 10개를 추가해 보세요. 이러한 항목을 장바구니에 추가할 수 없으면 유효성 검사기가 작동하는 것입니다!

## 결론

축하해요! 이제 `CommerceOrderValidator` 인터페이스 구현에 대한 기본 사항을 알고 Liferay에 새로운 주문 유효성 검사기를 추가했습니다.

## 관련 주제

- [간단한 제품 만들기](../../product-management/creating-and-managing-products/product-types/creating-a-simple-product.md)
- [애플리케이션 현지화](https://help.liferay.com/hc/ko/articles/360018168251-Localizing-Your-Application)