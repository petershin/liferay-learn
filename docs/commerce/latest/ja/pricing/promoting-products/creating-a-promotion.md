# プロモーションを作成する

以下の例では、7月4日にカタログの全商品を20％値下げするプロモーションを作成しています。 すべてのアカウント、アカウントグループ、チャネル、注文タイプが対象となります。

1. *グローバルメニュー* ([アプリケーションメニューアイコン](../../images/icon-applications-menu.png))を開き、_Commerce_ &rarr; _Promotions_に移動します。

   ![Click on promotions from the Global Menu and create a new promotion.](./creating-a-promotion/images/01.png)

1. *Add* (![Add icon](../../images/icon-add.png)) をクリックし、以下の情報を入力する。

   **名称：**7月4日プロモーション

   **カタログ:** Minium

   **通貨：**米ドル

   ![Enter a name, catalog, and currency for the new promotion.](./creating-a-promotion/images/02.png)

1. *Submit*をクリックしてください。

これにより、選択したカタログに新しいプロモーションが作成される。 すでにカタログの_ベース・プロモーション・リスト_が用意されていることに注目してほしい。 詳しくは [Using Promotion Base List](./using-the-promotion-base-list.md) をお読みください。

![You can change the name of the promotion, assign a priority, and select the Parent Price List and the Price Type.](./creating-a-promotion/images/03.png)

詳細セクションでは、プロモーション名の変更、優先順位の割り当て、親価格リストと価格タイプの選択ができます。 7月4日のプロモーションなので、スケジュールセクションから_公開日_と_有効期限_を選択してスケジュールを設定することができます。 プロモーションを有効にするには、_Publish_をクリックしてください。 1つのアカウントに複数のプロモーションが適用される場合、優先順位の高いプロモーションが優先されます。 特定のフィールドの詳細については、 [Promotions Reference](./promotions-reference.md) 。

## 価格修正の追加

この例では、カタログに掲載されている全商品の価格を20％引き下げるプロモーションである。 そのためには、価格修正を加える必要がある。

1. *価格修正*タブをクリックします。

1. *Add* (![Add icon](../../images/icon-add.png)) をクリックし、以下の情報を入力する。

   **名称：** 20％オフ

   **カタログ

   **モディファイア:**パーセンテージ

   ![Enter a name, target, and modifier for the new price modifier.](./creating-a-promotion/images/04.png)

1. *Submit*をクリックしてください。

```{note}
すでにプロモーション自体に有効期限を設定している場合は、価格修飾子に有効期限を設定する必要はありません。
```

新しい価格修飾子を設定する必要があります。 リストからエントリーをクリックし、パーセンテージを-20と入力する。 その後、_Active_トグルを使ってアクティブにする。 その後、_Save_をクリックし、_Publish_をクリックします。 詳細については、 [価格修正条項リファレンス](./promotions-reference.md#price-modifiers-reference) を参照のこと。

![Configure the price modifier and activate it.](./creating-a-promotion/images/05.png)

これにより、プロモーションが有効になり、カタログに掲載されている全商品の価格が、予定日に20％値下げされます。 有効な割引がある場合は、割引後の価格で計算されます。 特定の商品をターゲットにプロモーションを行う場合は、「エントリー」タブでエントリーを追加し、価格を設定します。 また、 [Tiered PricingまたはBulk Pricing](./../using-price-tiers.md#bulk-pricing-vs-tier-pricing) 。 詳しくは [エントリーの追加](./using-the-promotion-base-list.md#adding-entries) を参照のこと。

![The prices of all products in the catalog are reduced by 20% on the scheduled date](./creating-a-promotion/images/06.png)

## 関連トピック

* [プロモーション入門](./introduction-to-promotions.md)
* [プロモーション・ベース・リストの使用](./using-the-promotion-base-list.md)
* [プロモーション・リファレンス](./promotions-reference.md)
