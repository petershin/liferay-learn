# 注文タイプの使用

{bdg-secondary}`liferay DXP 7.4 U4+/GA8+`

在庫と緊急の注文の例のシナリオをサポートするために、2つの注文タイプを作成することができます。 在庫注文は通常価格、緊急注文は追加料金が発生します。

```{important}
*注文を追加する* または *新規注文を作成* ボタンを使って作成された注文では、バイヤーは注文タイプを選択することができます。 これにより、その注文タイプにリンクされた正しい価格で商品ページが更新されます（ある場合）。
```

## 注文タイプの作成

注文タイプが1つしか存在しない場合、新しい注文に自動的に割り当てられます。 直接カートに入れた商品については、注文番号の小さい方の注文タイプが優先されます。 注文タイプの注文番号はいつでも変更可能で、デフォルトを希望するものに設定することができます。

![You can change the Order number of an Order Type to set the default to what you want.](./using-order-types/images/04.png)

1. **グローバルメニュー**( ![アプリケーションメニューアイコン](../../images/icon-applications-menu.png) )を開き、 **Commerce** &rarr; **Order Types** をクリックします。

1. **追加** ボタン(![アイコンの追加](../../images/icon-add.png))をクリックし、以下の情報を入力します。

   **名称:** 株式

   **説明:** すべての通常の注文のための** 注文タイプ

1. ［**保存**］をクリックします。

   これにより、新しい注文タイプが作成され、設定ページが表示されます。 注文フィールドは、ドロップダウンメニューの注文タイプのソート順を決定します。 在庫注文タイプの注文フィールドの値を0に設定します。 以下の内容で注文タイプをもう1つ作成します。

   **名称:** 緊急

   **説明:** 緊急の注文には10％の追加料金がかかります。

この注文タイプでは、注文の値を1に設定します。 有効化するには、 **Active** トグルを使用します。 適格性*タブでは、オーダータイプを特定のチャネルまたはすべてのチャネルにリンクすることができます。

## 注文と注文タイプのリンク

カスタム価格表を作成し、緊急注文タイプにリンクさせることができます。 追加料金を追加するには、価格表上に価格修飾子を作成します。

1. **グローバルメニュー**（![アプリケーションメニューアイコン](../../images/icon-applications-menu.png)）を開き、 **Commerce** &rarr; **Price Lists** をクリックします。

1. **追加** ボタン( [追加アイコン](../../images/icon-add.png) )をクリックして、新しい価格表を作成し、以下の情報を入力します。

   **名称:** 緊急注文割増料金

   **カタログ:** Minium

   **通貨：** 米ドル

   ![Enter the name, catalog, and default currency and click Submit to create the Price List.](./using-order-types/images/01.png)

1. **Submit** をクリックしてください。

1. [価格修正]タブで、 **追加** ボタン(![アイコン追加](../../images/icon-add.png))をクリックして新しい価格修正を作成し、以下の情報を入力します。

   **名称：** 割増料金10

   **ターゲット：** カタログ

   **モディファイア:** パーセンテージ

   ![Enter the name, target, and modifier, and click Submit to create the Price Modifier.](./using-order-types/images/02.png)

1. **Submit** をクリックしてください。

1. 新しいPrice Modifierをクリックし、 **Active** トグルを使って有効にします。 **金額** を10に設定する。

1. ［**保存**］をクリックします。

   これにより、価格修飾子を持つ新しい価格表が作成されます。 追加料金を追加するには、注文タイプとリンクさせる必要があります。

1. **Eligibility** タブをクリックし、 **Order Type Eligibility** までスクロールダウンしてください。

1. 緊急注文タイプを検索し、 **選択** をクリックします。

1. ［**公開**］ をクリックします。

    ![Based on the Order Type, Products in the catalog automatically display their correct prices.](./using-order-types/images/03.gif)
