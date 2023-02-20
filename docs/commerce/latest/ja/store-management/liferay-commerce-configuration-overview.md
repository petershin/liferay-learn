# Liferay Commerce設定の概要

Liferay Commerce 3.0の設定は、 _［グローバルアプリケーション］_ メニューから行えます。

![グローバルアプリケーションメニューからCommerce 3.0にアクセスします。](./liferay-commerce-configuration-overview/images/06.png)

_［グローバルアプリケーション］_ メニュー &rarr; _［コマース］_に移動します。 管理者は以下を構成できます：

* [チャンネル](./channels/managing-channels.md)
* [価格表](../pricing/creating-a-price-list.md)
* [割引](../pricing/promoting-products/introduction-to-discounts.md)
* プロモーション
* 製品グループ
* [カタログ](../product-management/catalogs/creating-a-new-catalog.md)
* [プロダクト](../product-management/creating-and-managing-products/products/products-overview.md)
* [オプション](../product-management/creating-and-managing-products/products/using-product-options.md)
* [順番](../order-management/orders/orders-menu-reference-guide.md)
* [出荷](../order-management/shipments/introduction-to-shipments.md)
* [素材リスト](../product-management/creating-and-managing-products/products/managing-boms.md)
* [変更通知を受け取る（購読する）](../order-management/subscriptions/managing-subscriptions.md)
* [通貨](./currencies/adding-a-new-currency.md)
* [在庫](../inventory-management.md)
* [倉庫](../inventory-management/warehouse-reference-guide.md)
* [在庫数の見積もり](../inventory-management/availability-estimates.md)

## Liferay Commerce 2.1以前

Liferay Commerce 2.1の設定は、Liferay_［商品メニュー］_のいくつかの場所に分かれています。 Commerceの_［コントロールパネル］_ドロップダウンには、Liferay Commerceのインストールに_グローバル_に適用される構成と設定が含まれています。 Commerceの_［サイトメニュー］_ドロップダウンには、特定のストアサイトを対象とする構成と設定が含まれています。

### Commerceのコントロールパネル

_［コントロールパネル］_ → _［コマース］_に移動します。 以下の設定のいずれかに変更を加えると、ストアサイト全体に適用されます。

![グローバルCommerce設定](./liferay-commerce-configuration-overview/images/01.png)

* [チャンネル](./channels/managing-channels.md)
* [価格表](../pricing/creating-a-price-list.md)
* [注文](../order-management/orders/orders-menu-reference-guide.md)

［コマース Global Settings］メニューには、次のタブが含まれています。

![Commerceのグローバル設定タブ](./liferay-commerce-configuration-overview/images/02.png)

* [在庫数の見積もり](../inventory-management/availability-estimates.md)
* [新しい通貨の追加](./currencies/adding-a-new-currency.md)
* [計量単位](./configuring-shipping-methods/measurement-units.md)
* [地域](./adding-regions.md)
* [倉庫](../inventory-management/warehouse-reference-guide.md)

### Commerceのサイト設定

> Commerce 2.0以前

次の設定は、選択したストアサイトに限定されます。 ここで行った変更は、同じLiferay Commerceインスタンスでホストされている他のストアには適用されません。

_［コントロールパネル］_ → _［Store Site］_ → _［コマース］_に移動します。

![サイトの最小フル設定](./liferay-commerce-configuration-overview/images/03.png)

ここには、以下のサイト設定があります。

* [お知らせ](./sending-emails/using-notification-templates.md)
* [注文ワークフローの概要](../order-management/order-workflows/introduction-to-order-workflows.md)
* [支払方法](./configuring-payment-methods.md)
* [商品表示ページ](../creating-store-content/creating-product-display-pages.md)
* [配送方法](./configuring-shipping-methods/shipping-method-reference.md)
* [サイトのタイプ](../starting-a-store/sites-and-site-types.md)
