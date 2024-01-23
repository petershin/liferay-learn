# カスタム注文バリデーターの実装

このチュートリアルでは、 [CommerceOrderValidator](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/order/CommerceOrderValidator.java) インターフェイスを実装してカスタムオーダーバリデータを追加する方法を説明します。

注文バリデータは、チェックアウトを進めるときに顧客のカート内の商品を検証するクラスです。 Liferay は、 [デフォルト](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/order/DefaultCommerceOrderValidatorImpl.java) を含む複数のすぐに使える注文バリデーターに加え、 [アイテムのバージョン](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/order/VersionCommerceOrderValidatorImpl.java) と [繰り返しのアイテム (サブスクリプション)](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/order/SubscriptionCommerceOrderValidatorImpl.java) をチェックするためのバリデーターを提供します。

オーダーバリデータには、商品をカートに追加するときと、新しいチェックアウトステップに進むときの両方のバリデーションロジックがあります。 3つのパートがある：

1. [商品をカートに追加するためのバリデーションロジックです。](#validation-logic-for-adding-a-product-to-cart)
1. [チェックアウトに進むためのバリデーションロジック。](#validation-logic-for-proceeding-to-checkout)
1. [言語キーを `Language.properties` に追加した。](#language-keys-added-to-languageproperties)

2つの `validate` メソッドでは、オーダーバリデータのカスタム検証ロジックを定義します。 この例では、一定価格以上の商品が10個以上ある注文を拒否するロジックを追加しています。

## サンプルオーダーバリデータをデプロイする

```{include} /_snippets/run-liferay-portal.md
```

次に、以下の手順に従います。

1. [Acme Commerce Order Validator](./liferay-n9b2.zip) をダウンロードして解凍します。

    ```bash
    curl https://resources.learn.liferay.com/commerce/latest/en/developer-guide/sales/liferay-n9b2.zip -O
    ```

    ```bash
    unzip liferay-n9b2.zip
    ```

1. サンプルをビルドしてデプロイします。

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    !!! note
        このコマンドは Docker コンテナ上の `/opt/liferay/osgi/modules` にデプロイした jar をコピーするのと同じです。

1. Dockerコンテナコンソールでデプロイを確認します。

    ```bash
    STARTED com.acme.n9b2.impl_1.0.0
    ```

1. 失敗メッセージを表示して、サンプルオーダーバリデータの追加を確認する。 ブラウザを`https://localhost:8080`に開き、100ドル以上の商品が少なくとも1点あるカタログに移動する。 そのような商品がまだ存在しない場合は、自分で追加してください。詳細については、 [シンプル商品を作成する](../../product-management/creating-and-managing-products/product-types/creating-a-simple-product.md) を参照してください。

    カタログからこの価格の商品を探し、 **カートに入れる** をクリックします。 数量を11以上に増やし、矢印をクリックして続行します。 表示されるエラーメッセージは、カスタム注文バリデーターがアイテムの追加を正常に拒否したことを示しています。

    ![The custom order validator displays an error message.](./implementing-a-custom-order-validator/images/01.png)

おめでとうございます。 `CommerceOrderValidator` を実装した新しいオーダーバリデータをビルドしてデプロイできました。

オーダーバリデータの作成は、主に3つのステップで構成される。 まず、OSGi登録のためにクラスにアノテーションを付ける。 次に、`CommerceOrderValidator` インターフェースを実装する。 最後に、`CommerceOrderValidator` の実装を作成する。

## OSGi登録用のクラスに注釈を付ける

```{literalinclude} ./implementing-a-custom-order-validator/resources/liferay-n9b2.zip/n9b2-impl/src/main/java/com/acme/n9b2/internal/commerce/order/N9B2CommerceOrderValidator.java
    :language: java
    :lines: 20-26
```

Liferay が新しいオーダーバリデータを [オーダーバリデータレジストリ](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/order/CommerceOrderValidatorRegistryImpl.java) の他のものと区別できるように、 オーダーバリデータに個別のキーを指定することが重要です。 すでに使われているキーを再利用すると、関連する既存のバリデータが上書きされます。

`commerce.order.validator.priority`の値は、オーダーバリデータが他のバリデータと順番にバリデーションを行うタイミングを示します。 たとえば、 [デフォルトの注文バリデーター](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/order/CommerceOrderValidatorRegistryImpl.java) の値は10です。 オーダーバリデータに 9 を指定すると、デフォルトバリデータの直前でバリデーションを行うようになります。

## `CommerceOrderValidator` インターフェイスのレビュー

このインターフェイスでは、3つのメソッドを実装する必要がある：

```java
public String getKey();
```

このメソッドは、注文バリデーターレジストリに注文バリデーター用の一意の識別情報を提供します。 このキーはバリデータをレジストリから取得します。 すでに使われているキーを再利用すると、関連する既存のバリデータが上書きされます。

```java
public CommerceOrderValidatorResult validate(Locale locale, CommerceOrder commerceOrder, CPInstance cpInstance, int quantity) throws PortalException;
```

これは2つのバリデーションメソッドのうちの1つで、カスタムのバリデーションロジックを追加します。 このメソッドは、顧客がカートにアイテムを追加するたびに呼び出されます。 これは `CommerceOrderValidatorResult` を返すことで行います。この `CommerceOrderValidatorResult` はブール値を使用して、結果がバリデーションに合格したかどうかを知らせます。 詳細は [CommerceOrderValidatorResult.java](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/order/CommerceOrderValidatorResult.java) を参照。

```java
public CommerceOrderValidatorResult validate(Locale locale, CommerceOrderItem commerceOrderItem) throws PortalException;
```

これは2番目のバリデーションメソッドで、カスタムのバリデーションロジックを追加することができます。 このメソッドは、注文が `進行中` または `保留中` に遷移するたびに、すでにカートに入っているアイテムのために呼び出されます。

### カートに商品を追加するためのバリデーション・ロジック

```{literalinclude} ./implementing-a-custom-order-validator/resources/liferay-n9b2.zip/n9b2-impl/src/main/java/com/acme/n9b2/internal/commerce/order/N9B2CommerceOrderValidator.java
   :dedent: 1
   :language: java
   :lines: 34-61
```

```java
private static final double _MAX_ITEM_PRICE = 100.0;

private static final int _MAX_ITEM_QUANTITY = 10;
```

この例の主な検証では、価格 (「BigDecimal」として保存) が $100 より大きいかどうか、および数量が 10 より大きいかどうかをチェックします。 この価格情報は、顧客の注文に関する情報が含まれる「CPInstance」から取得できます。 `CPInstance` で使用できるその他のメソッドについては、 [CPInstance](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/model/CPInstance.java) および [CPInstanceModel](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/model/CPInstanceModel.java) を参照してください。

!!! note
    主なバリデーションチェックには、なぜ失敗したかを説明するローカライズされたメッセージを含めるのがベストプラクティスです。

### チェックアウトに進むためのバリデーション・ロジック

```{literalinclude} ./implementing-a-custom-order-validator/resources/liferay-n9b2.zip/n9b2-impl/src/main/java/com/acme/n9b2/internal/commerce/order/N9B2CommerceOrderValidator.java
    :dedent: 1
    :language: java
    :lines: 63-83
```

このメソッドは顧客のカート内の商品に対して呼び出されるので、同じ検証ロジックをこのメソッドに追加します。 ここでの主な違いは、情報を `CommerceOrderItem` オブジェクトから取得することです。 `CommerceOrderItem` で使用できるその他のメソッドについては、 [CommerceOrderItem](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/model/CommerceOrderItem.java) および [CommerceOrderItemModel](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/model/CommerceOrderItemModel.java) を参照してください。

### `Language.properties`に言語キーが追加されました。

言語キーとその値を、モジュール内の [Language.properties](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/sales/implementing-a-custom-order-validator/resources/liferay-n9b2.zip/n9b2-impl/src/main/resources/content/Language.properties) ファイルに追加します。 例えば、

```properties
expensive-items-have-a-maximum-order-quantity-of-x=Expensive items have a maximum order quantity of {0}.
this-expensive-item-has-a-maximum-quantity-of-x=This expensive item has a maximum order quantity of {0}.
```

詳細は、 [アプリケーションのローカライズ](https://help.liferay.com/hc/ja/articles/360018168251-Localizing-Your-Application) を参照してください。

## カスタムオーダーバリデータの変更

オーダーバリデータの動作を変更したい場合は、javaファイルを編集します。 `_MAX_ITEM_PRICE` の値を変更して、$200 以上の注文を拒否するようにする。 カスタムオーダーバリデータを再デプロイして、これらの変更をLiferayに送信します。

ブラウザに戻って、100ドルから200ドルの商品を10個追加してみる。 バリデータが100ドル以上の注文を拒否しなくなったので、これらの商品をカートに入れることができます。

今度は、200ドル以上の商品を10個追加してみよう。 これらの商品をカートに追加できない場合は、バリデータが機能しています！

## さいごに

　 これで `CommerceOrderValidator` インターフェイスの実装の基本がわかり、 Liferay に新しい注文バリデータが追加されました。

## 関連トピック](../../product-management/creating-and-managing-products/product-types/creating-a-simple-product.md)

- [シンプルな製品の作成](../../product-management/creating-and-managing-products/product-types/creating-a-simple-product.md)
- [アプリケーションのローカライズ](https://help.liferay.com/hc/ja/articles/360018168251-Localizing-Your-Application)