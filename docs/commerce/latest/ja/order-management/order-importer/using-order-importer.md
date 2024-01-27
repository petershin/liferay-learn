# オーダーインポーターの使用

{bdg-secondary}`liferay DXP 7.4 U1+/GA5+`.

Miniumサイトで新規注文を作成するには、2つの方法があります：

1. 右上の_Account Selector_をクリックし、_Create New Order_を選択します。

1. *保留中の注文*画面に移動し、_注文を追加_をクリックします。

![Create a new Order by clicking on the Create New Order button or the Add Order button.](./using-order-importer/images/01.png)

## CSVファイルからの注文のインポート

まず、オーダーを含むファイルを特定のフォーマットで用意する必要がある。 以下のフォーマットを参照：

`sku,quantity,requestedDeliveryDate`

`requestedDeliveryDate`はオプションであり、デフォルトの書式は`yyyy-MM-dd`である。 デフォルトの動作を変更するには、 [Order Importer Configuration](#order-importer-configuration) を参照してください。

CSVファイルから注文をインポートする、

1. グローバルメニュー（[アプリケーションメニューアイコン](../../images/icon-applications-menu.png)）を開き、コントロールパネル &rarr; サイトにアクセスして、ミニサイトを作成します。 Add_ボタンをクリックし、Miniumを選択する。

1. 新規注文を作成し、右下の3ドットアイコン(![3ドットアイコン](../../images/icon-actions.png))をクリックし、_Import from CSV_を選択します。

   ![You can use the Import from CSV option to import orders from a CSV file.](./using-order-importer/images/02.png)

1. *Select File*をクリックし、インポートしたいCSVファイルを選択します。 また、_Download Template_をクリックしてテンプレートファイルをダウンロードすることもできます。

   ![You can download a template or select the CSV file to import orders from.](./using-order-importer/images/03.png)

1. *インポート*を1回クリックすると、ご注文の商品がプレビューされ、もう一度*インポート*をクリックすると、ご注文に追加されます。

   ![Click Import to preview and import the orders to your new order.](./using-order-importer/images/04.gif)

## ウィッシュリストからの注文のインポート

ウィッシュリストには、すぐに注文に加えたい商品を入れておくことができます。 そのためには、まずウィッシュリストに希望の商品があることを確認してください。 詳しくは [ウィッシュリストの使用](../../creating-store-content/using-wish-lists.md) をご覧ください。

1. 新規注文を作成し、右下の3ドットアイコン(![3ドットアイコン](../../images/icon-actions.png))をクリックします。

1. *ウィッシュリストからインポート*を選択し、希望のウィッシュリストを選択します。

   ![You can use the Import from Wish Lists option to import orders from a wishlist.](./using-order-importer/images/05.png)

1. *選択* をクリックして注文の商品をプレビューし、_インポート_をクリックして注文に追加します。

   ![You can preview the items in your order and click Import to add them to your order.](./using-order-importer/images/07.gif)

## 過去の注文からのインポート

また、過去の注文から注文をインポートすることもできます。

1. 新規注文を作成し、右下の3ドットアイコン(![3ドットアイコン](../../images/icon-actions.png))をクリックします。

1. 過去の注文から*インポート*を選択し、該当する注文を選択します。

   ![You can use the Import from Past Orders option to import orders from a past order.](./using-order-importer/images/06.png)

1. *選択*をクリックして注文の商品をプレビューし、_インポート_をクリックして注文に追加します。

   ![You can preview the items in your order and click Import to add them to your order.](./using-order-importer/images/08.gif)

## オーダー・インポーターの設定

オーダーインポーターのデフォルトのCSVセパレータとリクエストされた納期フォーマットを変更することができます。

**デフォルトCSVセパレーター:**グローバルメニュー(![アプリケーションメニューアイコン](../../images/icon-applications-menu.png))を開き、_コントロールパネル_ &rarr; _システム設定_に移動します。 Orders_をクリックし、_Order Importer Types_を選択します。 CSV Separator_の値を変更し、_Save_をクリックします。

![Use the Default CSV Separator option to change the default CSV separator.](./using-order-importer/images/09.png)

**配送希望日のフォーマット：**グローバルメニュー(![アプリケーションメニューアイコン](../../images/icon-applications-menu.png))を開き、*［コントロールパネル］* &rarr; *［インスタンス設定］*に移動します。*［注文］*をクリックし、*［注文インポーターの日付形式設定］*を選択します。希望のフォーマットに変更し、*［保存］*をクリックします。

![Use the Requested Delivery Date Format option to change the default Requested Delivery Date format.](./using-order-importer/images/10.png)
