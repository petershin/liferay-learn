# 4.0 Breaking Changes

本ドキュメントは、Commerce 4.0 において、既存の機能、API、サードパーティの Liferay Commerce 開発者やユーザーとの契約を破壊する変更点を時系列で紹介します。 私たちはこれらの混乱を最小限にするために最善を尽くしていますが、時には避けられないこともあります。

このファイルに記載されている変更の種類の一部を次に示します。

* 削除または置換される機能

* 旧バージョンと非互換の変更：パブリックJavaまたはJavaScript APIの変更

* テンプレートで利用可能なコンテキスト変数の変更

* Liferayテーマおよびポートレットで利用可能なCSSクラスの変更

* 設定の変更。 `com.liferay.commerce.*.cfg` などの設定ファイルの変更。

* 実行要件。Javaバージョン、JEEバージョン、ブラウザバージョンなど。

* 非推奨またはサポート終了：たとえば、次のバージョンで特定の機能またはAPIが停止されると警告している

* 推奨事項：たとえば、後方互換性のためにLiferay Portalに古いAPIが保持されているにもかかわらず、古いAPIに代わる、新しく導入されたAPIを使用することを推奨している

## 宛先名の変更

* **日付：** 2020年9月10日

* **JIRAチケット：** [COMMERCE-4762](https://issues.liferay.com/browse/COMMERCE-4762)

### 変更点

プレフィックス `commerce_` が `com.liferay.commerce.constants.CommerceDestinationNames`で定義された Commerceの宛先に追加されました。

* `liferay/commerce_order_status`;

* `liferay/commerce_payment_status`;

* `liferay/commerce_order_status`;

* `liferay/commerce_payment_status`;

* `liferay/commerce_subscription_status`.

### 影響を受ける人

これらの目的地を参照または使用するすべての人。

### コードの更新方法

Commerce デスティネーションへの明示的な参照をすべて新しい名前に更新します。

### 変更が行われた理由

この変更により、Liferay のコマースデスティネーションの命名パターンが導入されます。

## 宛先名の変更

* **日付：** 2021年2月22日

* **JIRAチケット：** [COMMERCE-4762](https://issues.liferay.com/browse/COMMERCE-5788)

### 変更点

`externalReferenceCode を参照するメソッドの再整理`.

メソッドを更新したクラス。

* `com.liferay.commerce.inventory.service.CommerceInventoryWarehouseLocalService`

* `com.liferay.commerce.inventory.service.CommerceInventoryWarehouseService`

* `com.liferay.commerce.price.list.service.CommercePriceEntryLocalService`

* `com.liferay.commerce.price.list.service.CommercePriceEntryService`

* `com.liferay.commerce.price.list.service.CommercePriceListLocalService`

* `com.liferay.commerce.price.list.service.CommercePriceListService`

* `com.liferay.commerce.price.list.service.CommerceTierPriceEntryLocalService`

* `com.liferay.commerce.price.list.service.CommerceTierPriceEntryService`

* `com.liferay.commerce.pricing.service.CommercePriceModifierLocalService`

* `com.liferay.commerce.pricing.service.CommercePriceModifierService`

* `com.liferay.commerce.pricing.service.CommercePricingClassLocalService`

* `com.liferay.commerce.pricing.service.CommercePricingClassService`

* `com.liferay.commerce.product.service.CommerceCatalogLocalService`

* `com.liferay.commerce.product.service.CommerceCatalogService`

* `com.liferay.commerce.product.service.CommerceChannelLocalService`

* `com.liferay.commerce.product.service.CommerceChannelService`

* `com.liferay.commerce.product.service.CPAttachmentFileEntryLocalService`

* `com.liferay.commerce.product.service.CPAttachmentFileEntryService`

* `com.liferay.commerce.product.service.CPDefinitionLocalService`

* `com.liferay.commerce.product.service.CPDefinitionService`

* `com.liferay.commerce.product.service.CPInstanceLocalService`

* `com.liferay.commerce.product.service.CPInstanceService`

* `com.liferay.commerce.product.service.CPOptionLocalService`

* `com.liferay.commerce.product.service.CPOptionService`

* `com.liferay.commerce.product.service.CPOptionValueLocalService`

* `com.liferay.commerce.product.service.CPOptionValueService`

* `com.liferay.commerce.product.service.CProductLocalService`

* `com.liferay.commerce.product.service.CProductService`

* `com.liferay.commerce.service.CommerceAddressLocalService`

* `com.liferay.commerce.service.CommerceAddressService`

* `com.liferay.commerce.service.CommerceOrderItemLocalService`

* `com.liferay.commerce.service.CommerceOrderItemService`

* `com.liferay.commerce.service.CommerceOrderLocalService`

* `com.liferay.commerce.service.CommerceOrderNoteLocalService`

* `com.liferay.commerce.service.CommerceOrderNoteService`

* `com.liferay.commerce.service.CommerceOrderService`

### 影響を受ける人

これらのクラスからメソッドを参照または使用する人。

### コードの更新方法

対応する新しいメソッドを使用するようにメソッドを更新します。

### 変更が行われた理由

この変更は、Liferay のソースフォーマットに従うために導入されました。

## ミニカートコンポーネントの拡張性

* **日付：** 2021年2月12日

* **JIRAチケット：** [COMMERCE-4974](https://issues.liferay.com/browse/COMMERCE-4974)

### 変更点

* `MiniCart` TagとFE React Componentは、そのコンポーネントビューとラベルの部分的および全体的な置き換えをサポートし、その機能の一部を標準のタグ属性、またはJS実装の直接インポートによって設定できるように拡張されています。

  * 公開されている `MiniCartTag` の属性が変更されました。

  * `commerce-frontend-js` モジュールは、そのコンテンツ（特に `MiniCartContext` `MiniCart` の統合に必要）へのアクセスや公開を制御できるように、適切なインターフェイスで公開されるようになりました。

  * MiniCartコンポーネントのユーザビリティと拡張性については、こちらのドキュメント（ [）](https://issues.liferay.com/browse/LRDOCS-9462) に記載されています。

### 影響を受ける人

古い `MiniCartTag`に依存している開発者、または拡張している開発者。

### なぜこの変更が行われたのですか？

Liferay DXP 標準との整合性により、コンポーネントの拡張性をサポートします。

## CommerceCountry と CommerceRegion が削除されました。

* **日付：** 2021年3月02日

* **JIRAチケット：** [LPS-125991](https://issues.liferay.com/browse/LPS-125991)

### 変更点

* `CommerceCountry` および `CommerceRegion` テーブルは、データベースから削除されました。

* `CommerceCountry` および `CommerceRegion` のサービスおよび永続性クラスは削除されました。

* `com.liferay.commerce.model.CommerceCountry` および `com.liferay.commerce.model.CommerceRegion` への参照は、 `com.liferay.portal.kernel.model.Country` および `com.liferay.portal.kernel.model.Region`へ置き換わりました。

* `CommerceCountry` と `CommerceRegion` を参照する外部キーの名前が、 `commerceCountryId` と `commerceRegionId` から、それぞれ `countryId` と `regionId` に変更されました。 更新されたカラムを持つテーブルは

  * `CommerceAddress`

  * `CommerceAddressRestriction`

  * `CommerceShippingFixedOptionRel`

  * `CommerceTaxFixedRateAddressRel`

  * `com.liferay.commerce.country.CommerceCountryManager` が、Commerce 固有の国を取得するために追加されました。 利用できる方式は

  * `getBillingCountries`

  * `getBillingCountriesByChannelId`

  * `getShippingCountries`

  * `getShippingCountriesByChannelId`

  * `getWarehouseCountries`

### 影響を受ける人

これらのモデルおよびサービスを参照または使用するすべての人。

### コードを更新するにはどうすればよいですか？

`CommerceCountry` および/または `CommerceRegion` への明示的な参照を、新しい対応するモデルおよびサービス に更新します。

### なぜこの変更が行われたのですか？

この変更により、Liferay Portal の重複するモデルやサービスが削除されます。

## ミニコンペアウィジェット＋ミニコンペア コンポーネント

* **日付：** 2021年3月26日

* **JIRAチケット：** [COMMERCE-2909](https://issues.liferay.com/browse/COMMERCE-2909)

### 変更点

* `MiniCompare` FEの実装をJSP/vanilla JavaScriptからReactに移行（in `commerce-frontend-js`）。 `commerce-product-content-web`にある同じJSPのソースから直接読み込まれます。

* CP定義IDは、セッションを使用する代わりに、クッキーに保存され、最終的にクッキーから読み取られるようになりました。

* `CompareCheckboxTag` を JSP 経由でレンダリングするようにリファクタリングしました。 JSP は順番に、 `CompareCheckbox` React コンポーネントをレンダリングします。

  * **Deprecated** and **removed** 古い Soy/MetalJS の実装である `CompareCheckbox` in `commerce-frontend-taglib` モジュールを削除しました。

### 影響を受ける人

MiniCompareコンポーネント/ウィジェットの古い実装に依存している開発者、または拡張している開発者。

### なぜこの変更が行われたのですか？

* Soy/MetalJSの非推奨に伴い

* Liferay DXPと連携し、Liferay Classic ThemeをCommerceでサポートし、将来のDXP WEM統合への道を開くこと。

## アカウントセレクターを刷新

* **日付：** 2021年4月27日

* **JIRAチケット：** [COMMERCE-5888](https://issues.liferay.com/browse/COMMERCE-6315)

### 変更点

* `AccountSelectorTag` をJSPでレンダリングし、 `IncludeTag`から拡張するようにリファクタリングしました。 JSP は、Soy/MetalJS から移行した `AccountSelector` React コンポーネントをハイドレートしてレンダリングしています。

* Commerce Headless API を介して実行時のライフサイクルで伝達される Account/Order の変更について、他のコンポーネントに通知するイベント名を変更しました。

### 影響を受ける人

旧Soy/MetalJSコンポーネントとその関連Tagに依存または拡張している開発者の方。

### なぜこの変更が行われたのですか？

* Soy/MetalJSの非推奨に伴い

* Liferay DXPと連携し、Liferay Classic ThemeをCommerceでサポートし、将来のDXP WEM統合への道を開くこと。

## ストアフロントにおける商品カードと商品レンダリング戦略

* **日付：** 2021年4月27日

* **JIRAチケット：** [COMMERCE-5889](https://issues.liferay.com/browse/COMMERCE-5889)

### 変更点

* 商品カードコンポーネントをJSPテンプレートに移植し、商品情報を表示するようにしました。 `CPContentListRenderer` &rarr; `CPContentListEntryRenderer`を介してハイドレーションとレンダリングを行います。

  * Product Publisher、Search Results、Compare ウィジェットで、これらのレンダリング方法が使用されるようになりました。

  * Commerce Theme Minium Site Initializer が、これらのレンダリング戦略を使用するように設定されました。

  * この実装は現在 `commerce-product-content-web` モジュールにあり、 `CPContentRenderer` override, JSP override, または Liferay Dynamic Include によって拡張可能になっています。

  * **Deprecated** and **removed** 古い Soy/MetalJS の実装である `commerce-frontend-taglib` モジュールの Product Card は、 **deprecated** and **removed** となりました。

  * 古い Minium 専用 `CPContentRenderer`'s in `commerce-theme-minium-impl` module has been **deprecated** and **removed** ...。

* `AddToCartTag` をJSP経由でレンダリングするようにリファクタリングし、現在は `IncludeTag`から継承しています。 JSP は順番に、 `AddToCart` React コンポーネントをレンダリングし、 `QuantitySelector` React コンポーネントもレンダリングします。

  * **Deprecated** and **removed** 古い Soy/MetalJS の実装である `AddToCartButton` in `commerce-frontend-taglib` モジュールを削除しました。

  * **非推奨** と `commerce-frontend-taglib` モジュールにある `QuantitySelector` の古い Soy/MetalJS の実装を削除しました。

  * **非推奨** と **削除** 古い `QuantitySelectorTag` を `commerce-frontend-taglib` モジュールで削除しました。

* `PriceTag` は、JSPでレンダリングするようにリファクタリングされ、現在は `IncludeTag`から継承されています。 JSPは、正しく構造化されたテンプレート（SEO対策用）と、最終的に（ユーザーページの着地用） `Price` Reactコンポーネントの両方をレンダリングします。

  * **非推奨** と を削除 `commerce-frontend-taglib` モジュールにある `価格` の古い Soy/MetalJS の実装を削除しました。

### 影響を受ける人

開発者が依存している、または拡張している。

* `commerce-theme-minium-impl`の Minium 専用の CP コンテンツレンダラー。

* Soy/MetalJS `AddToCartTag` と `AddToCartButton*`.

* Soy/MetalJS `QuantitySelectorTag` と `QuantitySelector*`.

* the Soy/MetalJS `PriceTag` and `Price*`.

### 変更が行われた理由

* Soy/MetalJSの非推奨に伴い

* Liferay DXPと連携し、Liferay Classic ThemeをCommerceでサポートし、将来のDXP WEM統合への道を開くこと。

## ServiceImplクラスでAddOrUpdateとUpsertを使い分けるためのメソッド名の標準化

* **日付：** 2021年6月4日

* **JIRAチケット：** [COMMERCE-6095](https://issues.liferay.com/browse/COMMERCE-6095)

### 変更点

Commerce `*ServiceImpl` クラスのメソッドで `upsert*` という名前のものは、 `addOrUpdate*`という名前に変更されました。

### 影響を受ける人

`*ServiceImpl` `upsert*` のいずれかのメソッドを使用している開発者は、対応するメソッド `addOrUpdate*`を使用する必要があります。

### なぜこの変更が行われたのですか？

この変更により、上記のメソッドにLiferayのソースフォーマットが導入されます。

## BOM機能は、Shop by Diagram機能に置き換わりました。

* **日付：** 2021年10月14日

* **JIRAチケット：** [COMMERCE-3030](https://issues.liferay.com/browse/COMMERCE-3030)

### 変更点

Shop by Diagramは、BOM機能に代わるものです。 つまり、FolderとBOMの項目は存在せず、Diagramという新しい製品タイプが存在することになります。

### 影響を受ける人

ショップのためにダイアグラムを作成しなければならない商品スペシャリストは、ダイアグラム商品タイプで商品を作成する必要はありません。

### なぜこの変更が行われたのですか？

この変更により、BOMの問題が修正され、スペアパーツのユースケースをより良く満たすことができるようになりました。

## Accounts ウィジェットを削除し、Liferay Commerce のモジュールではなくなりました。

* **日付：** 2021年11月21日

* **JIRAチケット：** [COMMERCE-7288](https://issues.liferay.com/browse/COMMERCE-7288)

### 変更点

アカウントウィジェットは、コマースアカウントウィジェットを置き換えたものです。 既存のランニングシステム上のすべてのインスタンスが更新されました。

### 影響を受ける人

* Commerce Accountウィジェットをカスタマイズしたり、サイトのイニシャライザーで使用したことのある開発者。

* エンドユーザー（アカウントマネージャー）は、アカウントを管理するために別のウィジェットを使用することになります。

### なぜこの変更が行われたのですか？

この変更は、Commerce AccountからAccountへの移行に合わせるために必要なものです。

## CommerceOrderLocalServiceImpl をリファクタリングしました。

* **日付：** 2022年2月16日

* **JIRAチケット：** [COMMERCE-8440](https://issues.liferay.com/browse/COMMERCE-8440)

### 変更点

* `updateCommerceOrder` メソッドのインスタンスが、4つから3つになりました。

* `updateCustomFields` メソッドを削除しました。

* `updateOrderStatus` メソッドを削除した。

* `updateTransactionId` メソッドを削除しました。

* `updateUser` メソッドを削除しました。

### 影響を受ける人

コード内でこれらのメソッドを呼び出している開発者の方。

### コードを更新するにはどうすればよいですか？

* 残りの 3 つの `updateCommerceOrder` メソッドをそのまま代用してください。

* `expandoBridgeAttributes` を `commerceOrder.setExpandoBridgeAttributes(ServiceContext serviceContext)` で設定した後に `updateCommerceOrder(CommerceOrder commerceOrder)` メソッドを使用して `customFields`を更新してください。

* `orderStatus` を `commerceOrder.setOrderStatus(int orderStatus)` で設定した後に `updateCommerceOrder(CommerceOrder)` メソッドを使用して `orderStatus`を更新してください。

* `updateCommerceOrder(CommerceOrder commerceOrder)` メソッドを使用し、 `transactionId` を `commerceOrder.setTransactionId(String transactionId)` で設定後、 `transactionId`を更新してください。

* `userId` と `userName` を `commerceOrder.setUserId(long userId)` と `commerceOrder.setUserName(String userName)` で設定し、ユーザー情報を更新してから `updateCommerceOrder(CommerceOrder)` メソッドを使用してください。

### なぜこの変更が行われたのですか？

この変更は、クラス `CommerceOrderLocalServiceImpl`をすっきりさせるために導入されました。

## commerce-service service.xml で CommerceOrder を絞り込む。

* **日付：** 2022年4月13日

* **JIRAチケット：** [COMMERCE-8408](https://issues.liferay.com/browse/COMMERCE-8408)

### 変更点

* `CommerceOrderLocalService` および `CommerceOrderService`の `addCommerceOrder` メソッドのパラメーターの再調整を行いました。

* `CommerceOrderLocalService` および `CommerceOrderService`における `addOrUpdateCommerceOrder` メソッドのパラメーターの再調整を行いました。

* `CommerceOrderLocalService` および `CommerceOrderService`の `updateCommerceOrder` メソッドのパラメーターの再整理を行う。

* `CommerceOrderLocalService` および `CommerceOrderService`の `updateCommerceOrderPrices` メソッドのパラメーターの再整理。

### 影響を受ける人

コード内でこれらのメソッドを呼び出している開発者の方。

### コードを更新するにはどうすればよいですか？

* パラメータが新しい `addCommerceOrder` メソッド（複数可）と正しく整合していることを確認する。

* パラメータが新しい `addOrUpdateCommerceOrder` メソッド（複数可）と正しく整合していることを確認する。

* パラメータが新しい `updateCommerceOrder` メソッド（複数可）と正しく整合していることを確認する。

* パラメータが新しい `updateCommerceOrderPrices` メソッド（複数可）と正しく整合していることを確認する。

### なぜこの変更が行われたのですか？

この変更により、 `CommerceOrder` in `commerce-service` `service.xml`のエンティティがクリーンアップされました。

## CPContentHelperとCPContentHelperImplをリファクタリングしました。

* **日付：** 2021年12月16日

* **JIRAチケット：** [COMMERCE-7830](https://issues.liferay.com/browse/COMMERCE-7830)

### 変更点

* `CPContentHelper.java` および `CPContentHelperImpl.java`のメソッドのシグネチャを変更しました。
  * `getReplacementCommerceProductFriendlyURL(long cProductId, String cpIntanceUuid, ThemeDisplay themeDisplay)` to `getReplacementCommerceProductFriendlyURL(CPSku cpSku, ThemeDisplay themeDisplay)`
* `getCPAttachmentFileEntries()` メソッド `CPContentHelper.java` および `CPContentHelperImpl.java` を `getCPMedias()`へ改名しました。

### 影響を受ける人

これは、これらのメソッドをコード内で参照または使用している開発者に影響します。

### コードを更新するにはどうすればよいですか？

上記の方法の参照や使用は、すべて新しい方法に置き換えてください。

### なぜこの変更が行われたのですか？

メソッドは、可読性、一貫性、保守性を高めるためにリファクタリングされました。
