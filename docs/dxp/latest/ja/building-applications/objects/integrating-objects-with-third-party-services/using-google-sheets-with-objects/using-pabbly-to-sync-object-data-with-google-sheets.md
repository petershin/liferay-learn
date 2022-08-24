# Pabblyを使用して、オブジェクトデータをGoogle シートと同期する

{bdg-secondary}`7.4以降で利用可能`

ここでは、 [Pabbly](https://www.pabbly.com/) を使用して、Liferay Objectと Google シート間の同期タスクをトリガーするWebhooksの使用方法について説明します。 この方法でデータを同期するには、Pabblyのアカウント、Googleスプレッドシート、およびアクティブなDXP 7.4インスタンスが必要です。 DXPインスタンスには、Googleスプレッドシートにデータを送受信するための必要なフィールドを持つ公開オブジェクトも必要です。

## オブジェクトデータをGoogle シートに同期させる

以下の手順で、オブジェクトデータをGoogle シートに同期させます。

1. [Pabbly](https://www.pabbly.com/) にサインインし、 ［**All Apps**］ ページに移動し、 ［**Pabbly Connect**］ をクリックします。

   ![［All Apps］ページに移動し、［Pabbly Connect］をクリックします。](./using-pabbly-to-sync-object-data-with-google-sheets/images/01.png)

1. ［**Dashboard**］ ページで、 ［**Create Workflow**］ をクリックします。

   ![［Create Workflow］をクリックします。](./using-pabbly-to-sync-object-data-with-google-sheets/images/02.png)

1. 名前を入力し、 ［**Create**］ をクリックします。

   ![名前を選択して、［Create］をクリックします。](./using-pabbly-to-sync-object-data-with-google-sheets/images/03.png)

1. ［**Trigger**］ では、 ［**Webhook**］ アプリを選択してください。

   ![Webhookアプリを検索して選択します。](./using-pabbly-to-sync-object-data-with-google-sheets/images/04.png)

1. 生成された **Webhook URL** をコピーします。

   ![生成された **WebhookのURL** をコピーしてください。](./using-pabbly-to-sync-object-data-with-google-sheets/images/05.png)

1. Liferayインスタンスでは、コピーしたURLを使って [オブジェクトアクションを定義し](../../creating-and-managing-objects/defining-object-actions.md)、新しいオブジェクトエントリーが追加されるたびにwebhookエンドポイントにリクエストを送ります。

   ![エントリーが追加されるたびに、webhookエンドポイントにリクエストを送信するアクションを定義します。](./using-pabbly-to-sync-object-data-with-google-sheets/images/06.png)

1. Webhookをトリガーとするオブジェクトエントリーを追加し、Pabblyで ［**Capture Response**］ をクリックします。

   これにより、Webhookアプリがオブジェクトのデータ構造を自動的に決定することができます。

   ![Webhookをトリガーします。](./using-pabbly-to-sync-object-data-with-google-sheets/images/07.png)

1. ［**Action**］ では、 ［**Google Sheets**］ アプリを選択してください。

   ![Google シートアプリを選択します。](./using-pabbly-to-sync-object-data-with-google-sheets/images/08.png)

1. ［**Action Event**］ ドロップダウンメニューで、 ［**Add New Row**］ を選択して、 ［**Connect**］ をクリックします。

   ![［Add New Row］を選択します。](./using-pabbly-to-sync-object-data-with-google-sheets/images/09.png)

1. 目的のGoogleアカウントをアプリに接続し、 ［**Save**］ をクリックします。

   ![目的のGoogleアカウントを接続します。](./using-pabbly-to-sync-object-data-with-google-sheets/images/10.png)

1. オブジェクトと同期させたい ［**Spreadsheet**］ と ［**Sheet**］ を選択します。

   ![オブジェクトと同期させたいスプレッドシートとシートを選択します。](./using-pabbly-to-sync-object-data-with-google-sheets/images/11.png)

1. シートの列をオブジェクトのストラクチャーのデータフィールドにマッピングします。

   ![ シートの列をオブジェクトのストラクチャーのデータフィールドにマッピングします。](./using-pabbly-to-sync-object-data-with-google-sheets/images/12.png)

1. ［**Save & Send Test Request**］ ボタンをクリックし、テストが正常に行われたことを確認します。

   ![［Save & send Test Request］をクリックします。](./using-pabbly-to-sync-object-data-with-google-sheets/images/13.png)

   成功すると、 **ワークフロー** が有効になり、使用できるようになります。

## 追加情報

* [オブジェクト](../../../objects.md)
* [オブジェクトの作成と管理](../../creating-and-managing-objects.md)
* [オブジェクト統合を理解する](../../understanding-object-integrations.md)