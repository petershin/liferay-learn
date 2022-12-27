# Zapierを使用して、オブジェクトデータをGoogle シートと同期する

{bdg-secondary}`7.4以降で利用可能`

ここでは、 [Zapier](https://zapier.com/) を使用して、Liferay Objectと Google シート間の同期タスクをトリガーするWebhooksの使用方法について説明します。 この方法でデータを同期するには、Zapierのプレミアムアカウント、Googleスプレッドシート、およびアクティブなDXP 7.4インスタンスが必要です。 DXPインスタンスには、Googleスプレッドシートにデータを送受信するための必要なフィールドを持つ公開オブジェクトも必要です。

## オブジェクトデータをGoogle シートに同期させる

以下の手順で、オブジェクトデータをGoogle シートに同期させます。

1. [Zapier](https://zapier.com/) にログインし、 ［**Create Zap**］ をクリックします。

   ![Zapを作成します。](./using-zapier-to-sync-object-data-with-google-sheets/images/01.png)

1. ［**Trigger**］ のステップをクリックし、 ［**Webhooks by Zapier**］ を選択します。

   ![［Trigger］をクリックし、Zapierによる［webhooks」を選択します。](./using-zapier-to-sync-object-data-with-google-sheets/images/02.png)

   ```{note}
   WebhookはZapierのプレミアム機能です。
   ```

1. ［**Trigger Event**］ ドロップダウンメニューをクリックし、 ［**Catch Hook**］ を選択して、 ［**Continue**］ をクリックします。

   ![トリガーイベントの［Catch Hook］を選択します。](./using-zapier-to-sync-object-data-with-google-sheets/images/03.png)

1. 生成された **Webhook URL** をコピーします。

   ![生成されたWebhookのURLをコピーしてください。](./using-zapier-to-sync-object-data-with-google-sheets/images/04.png)

1. Liferayインスタンスでは、コピーしたURLを使って [オブジェクトアクションを定義し](../../creating-and-managing-objects/actions/defining-object-actions.md)、新しいオブジェクトエントリーが追加されるたびにwebhookエンドポイントにリクエストを送ります。

   ![エントリーが追加されるたびに、webhookエンドポイントにリクエストを送信するアクションを定義します。](./using-zapier-to-sync-object-data-with-google-sheets/images/05.png)

1. Webhookをトリガーするためのテストオブジェクトエントリを追加します。

   これにより、Webhookモジュールがオブジェクトのデータ構造を自動的に決定することができます。

1. ［**Test Trigger**］ ボタンをクリックします。

   ![［Test Trigger］ボタンをクリックします。](./using-zapier-to-sync-object-data-with-google-sheets/images/06.png)

1. テストが成功したことを確認し、 ［**Continue**］ をクリックします。

   ![テストが正常に行われたことを確認します。](./using-zapier-to-sync-object-data-with-google-sheets/images/07.png)

1. **Action** 手順をクリックし、 ［**Google Sheets**］ アプリを選択してください。

   ![Google シートを選択します。](./using-zapier-to-sync-object-data-with-google-sheets/images/08.png)

1. ［**Action Event**］ ドロップダウンメニューをクリックし、 ［**Create Spreadsheet Row**］ を選択します。

   ![［Create Spreadsheet Row］を選択します。](./using-zapier-to-sync-object-data-with-google-sheets/images/09.png)

1. Google SheetsアプリをGoogleアカウントに接続し、 ［**Continue**］ をクリックします。

   ![Google シートアプリをGoogleアカウントに接続します。](./using-zapier-to-sync-object-data-with-google-sheets/images/10.png)

1. オブジェクトと同期させたい ［**Spreadsheet**］ と ［**Worksheet**］ を選択します。

   ![目的のスプレッドシートとワークシートを選択します。](./using-zapier-to-sync-object-data-with-google-sheets/images/11.png)

   ```{important}
   ［Create Spreadsheet Row］アクションを使用する場合、最初の列のヘッダーにテキストが含まれている必要があります。 そうしないと、Zapはデータをシートの下部ではなく上部に送ります。
   ```

1. シートの列をオブジェクトの構造のデータフィールドにマッピングし、 ［**Continue**］ をクリックします。

   ![シートの列をオブジェクトのフィールドにマッピングします。](./using-zapier-to-sync-object-data-with-google-sheets/images/12.png)

1. ［**Test Action**］ ボタンをクリックし、テストが正常に行われたことを確認します。

   ![［Test Action］ ボタンをクリックし、テストが正常に行われたことを確認します。](./using-zapier-to-sync-object-data-with-google-sheets/images/13.png)

1. Zapをオンにします。

   ![Zapをオンにします。](./using-zapier-to-sync-object-data-with-google-sheets/images/14.png)

## 追加情報

* [オブジェクト](../../../objects.md)
* [オブジェクトの作成と管理](../../creating-and-managing-objects.md)
* [オブジェクト統合を理解する](../../understanding-object-integrations.md)