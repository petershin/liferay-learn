# Liferay Commerce設定の概要

グローバルメニューから、Commerceを設定するためのオプションを見つけることができます。

![Global ApplicationメニューからCommerceにアクセスします。](./liferay-commerce-configuration-overview/images/01.png)

*グローバルメニュー* (![Global Menu](../images/icon-applications-menu.png)) を開き、 *コマース* タブに移動します。 このタブには、次のアプリケーションが含まれています。

## 注文管理

* [順番](../order-management/orders/orders-menu-reference-guide.md)
* [注文タイプ](../order-management/order-types.md)
* [出荷](../order-management/shipments/introduction-to-shipments.md)
* [変更通知を受け取る（購読する）](../order-management/subscriptions/managing-subscriptions.md)
* [利用規約](../order-management/terms-and-conditions.md)

## 在庫管理

* [在庫](../inventory-management.md)
* [倉庫](../inventory-management/warehouse-reference-guide.md)

## 価格

* [価格表](../pricing/creating-a-price-list.md)
* [プロモーション](../pricing/promoting-products/introduction-to-promotions.md)
* [割引](../pricing/promoting-products/introduction-to-discounts.md)
* [製品グループ](../pricing/promoting-products/introduction-to-product-groups.md)
* [税カテゴリー](../pricing/configuring-taxes.md)

## 製品管理

* [カタログ](../product-management/catalogs/creating-a-new-catalog.md)
* [プロダクト](../product-management/creating-and-managing-products/products/products-overview.md)
* [オプション](../product-management/creating-and-managing-products/products/using-product-options.md)
* [仕様](../product-management/creating-and-managing-products/products/specifications.md)

## 店舗管理

* [チャンネル](./channels/managing-channels.md)
* [通貨](./currencies/adding-a-new-currency.md)

## 設定

* [在庫数の見積もり](../inventory-management/availability-estimates.md)
* [国](./configuring-countries-and-regions.md)
* [計量単位](./configuring-shipping-methods/measurement-units.md)

## Liferay Commerce 2.1以前

Liferay Commerce 2.1の設定は、Liferay*［商品メニュー］*のいくつかの場所に分かれています。 Commerce *Control Panel* ドロップダウンには、Liferay Commerce のインストールに *グローバルに* 適用される設定と構成が含まれています。 Commerce *Site Menu* ドロップダウンには、特定のストアサイトにスコープされるコンフィギュレーションと設定が含まれています。

### Commerceのコントロールパネル

*コントロールパネル* &rarr; *コマース*に移動します。 以下の設定のいずれかを変更すると、すべてのサイトに適用されます。

![Commerceのグローバルメニューには、すべての設定項目が含まれています。](./liferay-commerce-configuration-overview/images/02.png)

* [チャンネル](./channels/managing-channels.md)
* [価格表](../pricing/creating-a-price-list.md)
* [順番](../order-management/orders/orders-menu-reference-guide.md)

［コマース Global Settings］メニューには、次のタブが含まれています。

![Settingsは、Commerceグローバルメニューの下にあります。](./liferay-commerce-configuration-overview/images/03.png)

* [在庫数の見積もり](../inventory-management/availability-estimates.md)
* [国](./configuring-countries-and-regions.md)
* [通貨](./currencies/adding-a-new-currency.md)
* デフォルト画像
* [計量単位](./configuring-shipping-methods/measurement-units.md)
* ヘルスチェック
* [倉庫](../inventory-management/warehouse-reference-guide.md)

### Commerceのサイト設定

{bdg-secondary}`Commerce 2.0以下`

次の設定は、選択したストアサイトに限定されます。 ここで行った変更は、同じLiferay Commerceインスタンスでホストされている他のストアには適用されません。

*コントロールパネル* &rarr; *ストアサイト* &rarr; *コマース*に移動します。

![Miniumサイトの設定は、左サイドメニューから行うことができます。](./liferay-commerce-configuration-overview/images/04.png)

ここには、以下のサイト設定があります。

* [お知らせ](./sending-emails/using-notification-templates.md)
* [注文ワークフローの概要](../order-management/order-workflows/introduction-to-order-workflows.md)
* [支払方法](./configuring-payment-methods.md)
* [製品表示ページ](../creating-store-content/creating-product-display-pages.md)
* [配送方法](./configuring-shipping-methods/shipping-method-reference.md)
* [サイトの種類](../starting-a-store/sites-and-site-types.md)
