# オーダーインポーターの使用

{bdg-secondary}`利用可能な Liferay DXP 7.4 U1+/GA5+`

Miniumサイトで新規注文を作成するには、2つの方法があります。

1. 右上の **アカウントセレクタ** をクリックし、 **新規注文の作成** を選択します。

1. **Pending Orders** 画面を表示し、 **Add Order** をクリックします。

![新規注文の作成」ボタンまたは「注文の追加」ボタンをクリックして、新規注文を作成します。](./using-order-importer/images/01.png)

## CSVファイルからの注文の取り込み

まず、オーダーを含むファイルを特定のフォーマットで用意する必要があります。 下記のフォーマットをご参照ください。

`sku,quantity,requestedDeliveryDate`

`requestedDeliveryDate` はオプションで、デフォルトのフォーマット `yyyy-MM-dd`であることが期待される。 デフォルトの動作を変更するには、 [Order Importer Configuration](#order-importer-configuration) を参照してください。

CSVファイルからOrderをインポートする場合。

1. グローバルメニュー（![Applications Menu icon](../../images/icon-applications-menu.png)）から、コントロールパネル（ &rarr; Sites ）を開いて、Miniumサイトを作成します。 **追加** ボタンをクリックし、「Minium」を選択します。

1. 新規注文を作成し、右下の3点アイコン(![3-dot icon](../../images/icon-actions.png))をクリックし、 **CSVからインポート** を選択します。

   ![CSVからインポートオプションを使用すると、CSVファイルから注文をインポートすることができます。](./using-order-importer/images/02.png)

1. **Select File** をクリックし、インポートするCSVファイルを選択します。 また、 **Download Template** をクリックすることで、テンプレートファイルをダウンロードすることができます。

   ![テンプレートをダウンロードするか、CSVファイルを選択して注文をインポートすることができます。](./using-order-importer/images/03.png)

1. **インポート** を一度クリックすると、注文のアイテムがプレビューされ、 **インポート** をもう一度クリックすると、注文にアイテムが追加されます。

   ![インポート］をクリックすると、注文がプレビューされ、新しい注文にインポートされます。](./using-order-importer/images/04.gif)

## ウィッシュリストからの注文の取り込み

ウィッシュリストには、すぐに注文に加えたい商品を入れておくことができます。 そのためには、まずウィッシュリストに希望の商品があることを確認してください。 詳しくは、 [ウィッシュリストの使用](../../creating-store-content/using-wish-lists.md) をご覧ください。

1. 新規注文を作成し、右下の3点アイコン(![3-dot icon](../../images/icon-actions.png))をクリックします。

1. **Import from Wish Lists** を選択し、希望のウィッシュリストを選択します。

   ![ウィッシュリストからのインポート」オプションを使用すると、ウィッシュリストからの注文をインポートすることができます。](./using-order-importer/images/05.png)

1. **Select** をクリックして、ご注文の商品をプレビューし、 **Import** をクリックして、ご注文に商品を追加します。

   ![ご注文の商品をプレビューして、「インポート」をクリックすると、ご注文に追加されます。](./using-order-importer/images/07.gif)

## 過去の注文をインポートする

また、過去の注文から注文をインポートすることもできます。

1. 新規注文を作成し、右下の3点アイコン(![3-dot icon](../../images/icon-actions.png))をクリックします。

1. **Import from Past Orders** を選択し、該当する注文を選択します。

   ![過去の注文からインポートするオプションを使用すると、過去の注文から注文をインポートすることができます。](./using-order-importer/images/06.png)

1. **Select** をクリックして、ご注文の商品をプレビューし、 **Import** をクリックして、ご注文に商品を追加します。

   ![ご注文の商品をプレビューして、「インポート」をクリックすると、ご注文に追加されます。](./using-order-importer/images/08.gif)

## オーダーインポーターの設定

オーダーインポーターのデフォルトのCSVセパレーターと要求される納期フォーマットを変更できます。

**デフォルトの CSV セパレーターです。** グローバルメニュー (![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** &rarr; **システム設定** を開きます。 **オーダー** をクリックし、 **オーダーインポーターの種類** を選択します。 **CSV Separator** の値を変更し、 **Save** をクリックします。

![デフォルトのCSVセパレーターを変更する場合は、「デフォルトのCSVセパレーター」オプションを使用します。](./using-order-importer/images/09.png)

**リクエストされた納品日のフォーマット。** グローバルメニュー (![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** &rarr; **インスタンス設定** . **オーダー** をクリックし、 **オーダーインポーターの日付形式設定** を選択します。 希望の形式に変更し、 **保存** をクリックします。

![納品希望日形式オプションで、納品希望日のデフォルトの形式を変更することができます。](./using-order-importer/images/10.png)
