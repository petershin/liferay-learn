# プロモーションを作成する

以下の手順で、 **Promotion** を作成し、 **Catalog** の全製品の価格を7月4日に20％引き下げることができます。 **アカウント** , **アカウントグループ** , **チャンネル** , **オーダータイプ** のすべてがこのプロモーションの対象となります。

1. **グローバルメニュー**(![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 **コマース** &rarr; **プロモーション** をクリックします。

   ![グローバルメニューの「プロモーション」をクリックし、新しいプロモーションを作成します。](./creating-a-promotion/images/01.png)

1. **追加** ボタン (![Add icon](../../images/icon-add.png)) をクリックし、次の情報を入力します。

   **名称** 4th of Julyプロモーション

   **カタログ:** Minium

   **通貨：** USD

   ![新しいプロモーションの名前、カタログ、通貨を入力します。](./creating-a-promotion/images/02.png)

1. ［**Submit**］ をクリックします 。

選択したカタログに新しいプロモーションが作成されます。 **ベースプロモーションリスト** というカタログがすでに用意されていることに注目してください。 詳しくは、 [プロモーションベースリストの使用](./using-the-promotion-base-list.md) をお読みください。

![プロモーション名の変更、優先順位の割り当て、 **親価格表** の選択、 **価格タイプ** の選択が可能です。](./creating-a-promotion/images/03.png)

詳細」では、プロモーション名の変更、優先度の割り当て、親価格表と価格タイプの選択が可能です。 7月4日のプロモーションなので、Scheduleの項目からPublish DateとExpiration Dateを選択し、スケジュールを設定することができます。 **Publish** をクリックし、プロモーションを有効にします。 1つのアカウントに複数のプロモーションが適用される場合、より優先順位の高いプロモーションが優先されます。 特定のフィールドの詳細については、 [プロモーション参照](./promotions-reference.md) を参照してください。

## プライスモディファイアの追加

この例では、プロモーションによって、カタログに掲載されているすべての商品の価格が20％引き下げられます。 そのためには、Price Modifierを追加する必要があります。

1. **Price Modifiers** タブをクリックします。

1. **追加** ボタン (![Add icon](../../images/icon-add.png)) をクリックし、以下の情報を入力します。

   **名称** 20％オフ

   **ターゲット：** カタログ

   **修飾子：** パーセント

   ![新しい価格修正項目の名前、ターゲット、修正項目を入力します。](./creating-a-promotion/images/04.png)

1. ［**送信**］ をクリックします 。

```{note}
プロモーション自体に有効期限が設定されている場合は、価格修飾子に有効期限を設定する必要はありません。
```

ここで、新しいPrice Modifierを設定する必要があります。 リストから項目をクリックし、パーセンテージの金額を「-20」と入力します。 その後、 **Active** のトグルでアクティブにします。 その後、 **保存** をクリックし、 **公開** をクリックします。 詳しくは、 [Price Modifiers Reference](./promotions-reference.md#price-modifiers-reference) をご覧ください。

![プライスモディファイアを設定し、アクティベートする。](./creating-a-promotion/images/05.png)

これによりキャンペーンが発動し、予定日にカタログ掲載の全商品が20％値下げされます。 有効な割引がある場合は、割引後の価格に計算されます。 特定の製品を対象としたプロモーションを行う場合は、「Entries」タブでエントリーを追加し、その価格を設定します。 また、 [Tiered Pricing または Bulk Pricing](./../using-price-tiers.md#bulk-pricing-vs-tier-pricing) をここで設定することができます。 詳しくは、 [エントリーの追加](./using-the-promotion-base-list.md#adding-entries) をご覧ください。

![予定日にカタログ掲載の全商品を20％値下げします](./creating-a-promotion/images/06.png)

## 追加情報

* [プロモーションについて](./introduction-to-promotions.md)
* [プロモーションベースリストの活用](./using-the-promotion-base-list.md)
* [プロモーション参照](./promotions-reference.md)
