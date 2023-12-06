# Wyzebulbを使用して、オブジェクトデータをGoogle シートと同期する

{bdg-secondary}`Liferay 7.4+`

ここでは、 [Wyzebulb](https://www.wyzebulb.com/) を使用して、Liferay Objectと Google シート間の同期タスクをトリガーするWebhooksの使用方法について説明します。 この方法でデータを同期するには、Wyzebulbのアカウント、Googleスプレッドシート、およびアクティブなDXP 7.4インスタンスが必要です。 DXPインスタンスには、Googleスプレッドシートにデータを送受信するための必要なフィールドを持つ公開オブジェクトも必要です。

## オブジェクトデータをGoogle シートに同期させる

以下の手順で、オブジェクトデータをGoogle シートに同期させます。

1. [Wyzebulb](https://www.wyzebulb.com/) にログインし、Flowを作成します。

1. ［Trigger］では、 ［**Webhook**］ アプリを選択してください。

    ![トリガーのアプリを選択します。](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/01.png)

    ![Webhooksを選択します。](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/02.png)

1. ［**Catch Hook**］ トリガーを選択し、 ［**Save + Continue**］ をクリックします。

    ![Catch Hookトリガーを選択します。](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/03.png)

    ![［Save and Continue］をクリックします。](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/04.png)

1. **Webhooks URL** をクリックし、生成されたURLをコピーします。

    ![WebhooksのURLを選択します。](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/05.png)

    ![WebhooksのURLをコピーします。](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/06.png)

1. Liferayインスタンスでは、コピーしたURLを使って [オブジェクトアクションを定義し](../../creating-and-managing-objects/actions/defining-object-actions.md)、新しいオブジェクトエントリーが追加されるたびにwebhookエンドポイントにリクエストを送ります。

    ![エントリーが追加されるたびに、webhookエンドポイントにリクエストを送信するアクションを定義します。](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/07.png)

1. Webhookをトリガーするためのテストオブジェクトエントリを追加します。

   これにより、Webhookモジュールがオブジェクトのデータ構造を自動的に決定することができます。

1. テストが成功したことを確認し、 ［**Save + Continue**］ をクリックします。

    ![テストに成功しました。](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/08.png)

1. ［**Action**］ では、 ［**Google Sheets**］ アプリを選択してください。

    ![［App］をクリックして、アプリを選択します。](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/09.png)

    ![Google シートを選択します。](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/10.png)

1. ［**Create a new row in Google Sheets**］ アクションを選択し、 ［**Save + Continue**］ をクリックします。

    ![［Action］をクリックして、アクションを選択します。](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/11.png)

    ![［Create a new row in Google Sheets］を選択します。](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/12.png)

1. Google シートアプリをGoogleアカウントに接続します。

    ![Google シートアプリをGoogleアカウントに接続します。](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/13.png)

1. 目的の ［**Spreadsheet**］ と ［**Worksheet**］ を選択します。

    ![目的のスプレッドシートとワークシートを選択します。](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/14.png)

1. シートの列をオブジェクトのストラクチャーのデータフィールドにマッピングします。

    ![シートの列をオブジェクトのフィールドにマッピングします。](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/15.png)

1. ［**Test Action**］ ボタンをクリックし、テストが正常に行われたことを確認します。

    ![テストに成功しました。](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/16.png)

1. ［**My Flows**］ ページに移動し、フローが実行されていることを確認します。

    ![フローが実行されていることを確認します。](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/17.png)

## 関連トピック

* [オブジェクト概要](../../../objects.md)
* [オブジェクトの作成と管理](../../creating-and-managing-objects.md)
* [オブジェクト統合を理解する](../../understanding-object-integrations.md)
