# プロモーションについて

Liferayで **Promotions** を作成し、すべての顧客または一組の顧客にプロモーション価格を提供することができます。 プロモーションでは、商品の定価とプロモーション価格の差額を視覚的に表示する。 これは、顧客が受けている割引を強調し、個人または顧客のグループに対して複数の価格をサポートするのに便利です。

![A Promotion showing difference between a product's list price and its promotion price](./introduction-to-promotions/images/01.png)

```{note}
Liferay DXP 7.4 U42/GA42以前では、プロモーション価格はセール価格と呼ばれていました。
```

## 適合性

**対象者** タブをクリックし、適切なオプションを選択して、すべての顧客または特定の顧客に対するプロモーション価格を定義します。 アカウント、アカウントグループ、チャネル、または注文タイプに基づいてプロモーションを絞り込むことができます。

![Use the eligibility tab to narrow down your promotion to specific accounts, account groups, channels, or order types.](./introduction-to-promotions/images/02.png)

## お知らせ一覧

Entriesタブを使用して、特定のSKUのプロモーションを定義することができます。 **Entries** タブをクリックし、SKUを検索し、 **Select** をクリックします。 選択したら、EntriesセクションからSKUをクリックし、プロモーション価格を追加します。 詳しくは [エントリーの追加](./using-the-promotion-base-list.md#adding-entries) を参照のこと。

{bdg-secondary}`Liferay DXP 2023.Q4+/Portal 7.4 GA98+` SKU に [単位](../../product-management/creating-and-managing-products/products/units-of-measure.md) を設定している場合、該当する場合は各単位ごとにプロモーション価格を入力できます。

## 価格修飾子

**価格修正** は、一定額またはパーセンテージで製品範囲の価格を調整することができます。 価格修飾子は、製品の基本価格を使用してプロモーション価格を計算することにより、プロモーションを簡単に維持することができます。 同じSKUを対象とした価格修正とエントリーがある場合、価格修正よりもエントリーの価格が優先されます。

価格修飾子を使用すると、カタログ、カテゴリー、商品グループ、または商品をターゲットにすることができます。 価格修正は、対象グループの全商品に適用される。 これは、各SKUを具体的にターゲットにしなければならないエントリーのセクションとは異なる。 詳細は、 [価格修正記号の追加](./creating-a-promotion.md#adding-a-price-modifier) を参照。

## プロモーションと価格表

プロモーションは、機能的には価格表に似ているが、割引価格を決定するために併用される。 下図を参照して計算方法を理解してください。

![Calculation of a product's active price.](./introduction-to-promotions/images/03.png)

商品の有効価格が決定されると、その有効価格に対して割引が適用される。 詳しくは [割引の紹介](./introduction-to-discounts.md) を参照。

ある顧客に対して、他の顧客の通常価格よりも安い特別価格を提供したい場合、価格リストとプロモーションの両方を使用できますが、価格リストでは価格の引き下げは表示されません。 下の画像をご覧ください。

![Comparison of a product's price with a promotion and a price list.](./introduction-to-promotions/images/04.png)

## 関連トピック

* [プロモーションの作成](./creating-a-promotion.md)
* [プロモーション・ベース・リストの使用](./using-the-promotion-base-list.md)
* [プロモーション・リファレンス](./promotions-reference.md)
