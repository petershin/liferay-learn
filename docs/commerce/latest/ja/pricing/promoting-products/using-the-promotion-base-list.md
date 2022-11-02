# プロモーションベースリストの活用

新しいカタログを作成すると、新しい **Promotion Base List** が自動的に作成されます。 プロモーションベースリストでは、対象者のコントロールやプライスモディファイアの追加を行うことはできません。 プロモーション価格の対象となる特定のエントリーを追加する場合にのみ使用することができます。

プロモーションベースリストを使用するには

1. **グローバルメニュー**(![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 **コマース** &rarr; **カタログ** を開きます。

   ![カタログをクリックし、製品用の新しいカタログを作成します。](./using-the-promotion-base-list/images/01.png)

1. **追加** ボタン (![Add icon](../../images/icon-add.png)) をクリックし、以下の情報を入力します。

   **名称** テストカタログ

   **デフォルトのカタログ言語。** 英語 (アメリカ合衆国)

   **通貨** USドル

   ![新しいカタログの名前、デフォルトのカタログ言語、および通貨を入力します。](./using-the-promotion-base-list/images/02.png)

1. ［**Submit**］ をクリックします 。

これにより、新しいカタログと新しいプロモーションベースリストが作成されます。 これを見るには、 **グローバルメニュー**(![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 **コマース** &rarr; **プロモーション** をクリックしてください。 **Test Catalog Base Promotion** という新しいエントリーが表示されるはずです。

## エントリーの追加

プロモーションベースリストは、対応するカタログの全製品を自動的にエントリとして追加します。 カタログの特定のSKUをターゲットにする場合。

1. EntriesセクションでSKUを検索し、クリックする。

1. [プロモーション価格、有効期限を入力し、SKUのバルク価格または段階価格](../using-price-tiers.md#bulk-pricing-vs-tier-pricing) を設定することができます。

   ![プロモーション価格、有効期限を入力し、SKUのバルク価格やティアード価格を設定することができます。](./using-the-promotion-base-list/images/03.png)

1. ［**Save**］ をクリックします。

また、Override Discountトグルを使用すると、プロモーション価格が有効なDiscountよりも優先されます。 プロモーションで20％割引を上書きした場合と、そうでない場合の比較をご覧ください。

![プロモーションの設定にあるOverride Discountトグルを使用すると、有効な割引を上書きすることができます。](./using-the-promotion-base-list/images/04.png)

```{note}
プロモーション価格でSKUをターゲットにするもう一つの方法は、*グローバルメニュー* ((![Applications Menu icon](../../images/icon-applications-menu.png)) を開いて*Commerce* &rarr; *Products*に移動することです。 製品を検索して選択し、*SKUs*タブをクリックします。 対象となるSKUを選択し、そのSKUにプロモーション価格を設定します。 *［公開］*をクリックします。 これは、ベースプロモーションリストのSKUの価格を設定します。 Liferay DXP 7.4 U42/GA42以前では、Promotion PriceはSale Priceと呼ばれていました。
```

## 追加情報

* [プロモーションについて](./introduction-to-promotions.md)
* [プロモーションを作成する](./creating-a-promotion.md)
* [プロモーション参照](./promotions-reference.md)
