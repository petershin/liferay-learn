# 価格の概要

Liferayでは、商品の価格を微調整するための価格設定システムを提供しています。 1つの商品SKUに対して複数の価格エントリを定義し、どのアカウント、アカウントグループ、チャネルが各価格を受け取る資格があるかを決定することができます。 同じSKUに複数の価格エンティティが存在する場合、Commerceの価格設定エンジンは、チャネルの顧客ごとにどのエンティティを使用すべきかを計算します。

{bdg-secondary}`Liferay DXP 2023.Q4+/Portal GA98+` SKU に [単位](../product-management/creating-and-managing-products/products/units-of-measure.md) が設定されている場合、各単位に複数の価格エントリーを定義し、通常の SKU と同じ適格基準を決定することができます。

```{note}
次の概要では、Commerce Pricing Engine v2.0+ について説明します。 これは、Commerce 3.0 以降および Portal/DXP 7.3 以降で使用されるデフォルトの価格設定アルゴリズムです。 Commerce 2.1.x 以前のバージョンでは、デフォルトで [Pricing Engine v1.0](#pricing-engine-v1-0-reference) を使用します。 必要に応じて、インスタンスに使用される [価格設定エンジンのバージョンを変更](#enabling-pricing-engine-v2-0-in-commerce-2-1-x) できます。
```

## Commerceの価格設定システムのコンポーネント

カタログには商品が含まれ、各カタログにはデフォルトの [基本価格リスト](#base-price-list) と [基本プロモーションリスト](#base-promotion-list) がある。 これらのリストには、カタログに掲載されているすべての商品SKUの基本価格項目が格納されており、すべての顧客が利用できます。 [価格表](#price-lists) および [プロモーションリスト](#promotion-lists) を作成して、よりターゲットを絞った構成可能な価格エンティティを定義することもできます。 また、各エントリの一部として、数量に応じて商品の特別価格を設定する [価格レート](#price-tiers) を定義することができます。 最後に、 [ディスカウント](#discounts) 、価格エントリーを上書きすることなく、その上に適用される。

{bdg-secondary}`Liferay DXP 2023.Q4+/Portal GA98+` SKU に [単位](../product-management/creating-and-managing-products/products/units-of-measure.md) が設定されている場合、基本価格リスト、基本販促リスト、カスタム価格リスト、カスタム販促リストに各単位の項目があります。

![The base price list also stores the starting price for every unit configured for an SKU.](./introduction-to-pricing/images/09.png)

### 基本価格表

基本価格リストは、カタログ内のすべての製品SKUの開始価格を格納します。 これらのエントリは、各SKUに上書きが適用されていないときに使用される標準通貨と価格を設定します。 このリストは、すべてのカタログに対して自動的に作成され、すべてのアカウントとチャンネルで利用可能です。 詳細は、 [商品の基本価格を設定する](./setting-a-products-base-price.md) を参照してください。

![The base price list stores the starting price entry for every product SKU in a catalog.](./introduction-to-pricing/images/02.png)

### 基本プロモーション表

基準プロモーション表には、カタログに掲載されているすべての商品SKUの基準プロモーション価格のエントリが保存されています。 SKUに適用されると、基本プロモーション価格エントリはすべての顧客に対して基本価格を上書きします。 このリストは、すべてのカタログに対して自動的に作成され、すべてのアカウントとチャンネルで利用可能です。 詳しくは [プロモーションベースリストリファレンス](./promoting-products/promotions-reference.md) を参照してください。

![The base promotion list stores base promotional price entries for all product SKUs in a catalog.](./introduction-to-pricing/images/03.png)

### 価格表

カスタム価格表は、特定の商品の価格エントリを保存し、対象となる顧客のみが利用できるようになっています。 これらのリストは、基本価格表とは異なる通貨を使用し、カタログのすべての、または一部の商品を含むことができます。 カスタム価格表のエントリーは、対象となる顧客のSKUの基本価格を上書きします。 また、 [価格修飾子](./using-price-modifiers.md) を定義して、特定の価格エントリを変更することもできます。 詳細は、 [価格表の作成](./creating-a-price-list.md) を参照してください。

![Use custom price lists to store more targeted price entries.](./introduction-to-pricing/images/04.png)

### プロモーションリスト

カスタムプロモーションリストは、特定の商品のプロモーション価格エントリーを保存し、対象となる顧客のみが利用できるようになっています。 これらのリストは、基本価格表とは異なる通貨を使用し、カタログのすべての、または一部の商品を含むことができます。 これを適用すると、対象となるユーザーに対してSKUの他の価格エントリー（基本価格、段階価格など）が上書きされます。 これらのリストでは、 [価格修飾子](./using-price-modifiers.md) を定義して、特定の価格エントリを変更することもできます。 有効にされている場合は、元の価格とプロモーション価格、両方が商品ページに表示され、購入者が値下げを確認できます。 詳細は、 [プロモーションの作成](./promoting-products/creating-a-promotion.md) を参照してください。

![Use custom promotion lists to store targeted promotion price entries.](./introduction-to-pricing/images/05.png)

```{note}
Liferay DXP 7.4 U42/GA42以前では、プロモーション価格はセール価格と呼ばれていました。
```

### 価格レート

価格レートは、価格エントリ内に直接設定されていて、最小数量の要件を満たす注文に対する特定の価格を定義します。 これらの価格は、割引注文オプションとして顧客に表示されます。 詳細は、 [価格レートを使う](./using-price-tiers.md) を参照してください。

### 割引

割引は、価格に上乗せして適用され、価格に影響を与えることなく変更されます。 これらは、既存の価格エントリ内で定義することもできますし、独立したエンティティとして作成し、商品、商品グループ、カテゴリー、送料、小計、合計を対象に使用することもできます。 詳細は、 [割引の概要](./promoting-products/introduction-to-discounts.md) を参照してください。

![Discounts are applied on top of the price and modify it without superseding it.](./introduction-to-pricing/images/06.png)

## Pricing Engineによる商品価格の算出方法

Pricing Engineは、各価格コンポーネントがチャンネルにおけるSKUの価格にどのように貢献するかを決定します。 エンジンは価格要求を受け取ると、まず商品の_単価_と_プロモーション価格_を計算します。 これらの価格は、顧客に提供される_最終価格_を決定するために使用される。

{bdg-secondary}`Liferay DXP 2023.Q4+/Portal GA98+` 価格設定エンジンは、 [の単位を含む SKU に対して、](../product-management/creating-and-managing-products/products/units-of-measure.md) の単位を含まない SKU と同じように単価、プロモーション価格、最終価格、注文価格を計算します。

<!--TASK: Consider adding details about net/gross price types and how taxes are calculated-->

### SKUの単価を計算する

SKUの単価を計算する際、Pricing Engineは対象となるカスタム価格表を検索します。 複数のリストが存在する場合、エンジンは最も高い優先度を持つリストを選択します。 そして、選択されたリストの価格エントリーから商品SKUを検索します。

* SKUのエントリがある場合、アルゴリズムは既存の価格修飾子のそのSKUのエントリを適用し、SKUの単価の合計を使用します。

* SKUのエントリーが存在しない場合、エンジンはSKUの基本価格を使用し、最も優先度の高い価格リストの中から修飾子を適用します。 合計がSKUの単価となります。

   ```{note}
   このエンジンは、最も優先度の高いリストのみを検索し、優先度の低いリストのSKUは検索しません。 これは、同じカタログ内のSKUに異なる価格表の価格が適用されるのを避けるためです。
   ```

適格なカスタム価格表が存在しない場合、エンジンはSKUの基本価格表のエントリーを単価に使用します。

![The engine searches eligible custom price lists for the SKU.](./introduction-to-pricing/images/07.png)

```{note}
このプロセスの間に、エンジンは該当する価格レートもチェックします。 価格レートがある場合は、その価格が特定の数量のデフォルトの価格の代わりに使用されます。
```

### SKUのプロモーション価格を計算する

SKUの単価を計算した後、Pricing EngineはSKUのプロモーション価格を計算します。 この計算は、2つの例外を除き、基本的には単価の計算プロセスと同じです：

* 該当するプロモーションリストにSKUの価格エントリーがない場合、既存の価格修飾子が単価に適用され、合計がプロモーション価格に使用されます。

* 該当するプロモーションリストがなく、基本プロモーションリストが0に設定されている場合、プロモーション価格は0に設定されます。

### SKUの最終価格を計算する

単価とプロモーション価格を計算した後、Pricing Engineが両者を比較し、より安い価格を選択します。 そして、価格アルゴリズムは、適用可能なすべての割引を検索し、価格に適用します。 合計はSKUの最終価格、つまり顧客が商品を購入するために支払う価格となります。

## Pricing Engineによる注文価格の算出方法

注文価格を計算する際、Pricing Engineはまず送料を取得し、送料を対象とした割引を適用します。

次に、エンジンは注文に含まれるすべてのSKUの最終価格を加算して小計を決定します。 小計を対象とした割引が適用されます。

最後に、Pricing Engineは割引後の送料と割引後の小計を合計し、注文の合計金額を算出します。 合計を対象とした割引が適用されます。

![The engine determines the order's shipping, subtotal, and total.](./introduction-to-pricing/images/08.png)

## 価格設定エンジン v1.0 リファレンス

| 価格設定方法                   | 概要                                            | 基本価格のオーバーライドの有無 | 設定場所      | 適用者                                            |         適用対象         |
| :----------------------- | :-------------------------------------------- | :-------------: | :-------- | :--------------------------------------------- | :------------------: |
| 基本価格                     | 基本価格                                          |       n/a       | コマース製品SKU | すべての購入者                                        |       コマース製品SKU      |
| 基本プロモーション                | 値下げ価格                                         |        はい       | コマース製品SKU | すべての購入者                                        |       コマース製品SKU      |
| 価格表（定価、プロモーション価格）        | 商品および購入者ごとの特別価格（または通貨）                        |        はい       | 価格表       | 選択されたバイヤー（アカウントとアカウントグループ）                     |       個々の商品SKU       |
| レート価格表（レート価格、プロモーションレート） | 製品およびバイヤーごとの特別価格（または通貨） _バルク数量_の場合            |        はい       | 価格表       | 選択されたバイヤー（アカウントとアカウントグループ）                     |       個々の商品SKU       |
| 割引                       | 商品または購入者のグループの価格を変更します（数量を制限し、クーポンコードを使用できます） |       いいえ       | 割引        | 厳選されたバイヤー（アカウントおよびアカウントグループ、または一定の資格を満たしたバイヤー） | 商品のグループ（または個々の商品SKU） |

```{note}
Commerce Pricing Engine v1.0では、価格エントリーには、SKU、標準価格、プロモ価格の3つのコンポーネントが含まれています。 v2.0では、それぞれが個別のエンティティとなっています。
```

![Pricing Hierarchy Diagram](./introduction-to-pricing/images/01.png)

## Commerce2.1.xでのPricing Engine v2.0の有効化

デフォルトでは、Commerce 2.1.x以前のバージョンではCommerce Pricing Engine v1.0が使用されています。 以下の手順に従って、Commerce Pricing Engine v2.0を有効にします：

1. コントロールパネルを開き、_システム設定_ &rarr; _コマース_ &rarr; _価格設定_に進みます。

1. 左のパネルにある_Commerce Pricing Configuration_をクリックします。

1. *プライシング計算キー*フィールドの`v1.0`を`v2.0`に置き換える。

1. *保存*をクリックしてください。

保存すると、インスタンスはすべての価格計算にPricing Engine v2.0を使用します。

## 関連トピック

* [商品の基本価格設定](./setting-a-products-base-price.md)
* [価格表の作成](./creating-a-price-list.md)
* [価格表への商品の追加](./adding-products-to-a-price-list.md)
* [価格帯の使用](./adding-products-to-a-price-list.md)
* [割引の作成](./promoting-products/creating-a-discount.md)
