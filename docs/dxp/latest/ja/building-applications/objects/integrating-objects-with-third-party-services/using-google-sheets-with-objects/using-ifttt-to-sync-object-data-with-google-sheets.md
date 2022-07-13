# IFTTTを使用して、オブジェクトデータをGoogle シートと同期する

{bdg-secondary}`7.4以降で利用可能`

ここでは、 [IFTTT](https://ifttt.com/)を使用して、Liferay Objectと Google シート間の同期タスクをトリガーするWebhooksの使用方法について説明します。 この方法でデータを同期するには、IFTTTのアカウント、Googleスプレッドシート、およびアクティブなDXP 7.4インスタンスが必要です。 DXPインスタンスには、Googleスプレッドシートにデータを送受信するための必要なフィールドを持つ公開オブジェクトも必要です。

## オブジェクトデータをGoogle シートに同期させる

以下の手順で、オブジェクトデータをGoogle シートに同期させます。

1. [IFTTT](https://ifttt.com/)にサインインし、 ［**Create**］ をクリックします。

    ![［作成］をクリックします。](./using-ifttt-to-sync-object-data-with-google-sheets/images/01.png)

1. ［**If This**］ ステップで、 ［**Add**］ をクリックします。

    ![［If This］ステップの［Add］をクリックします。](./using-ifttt-to-sync-object-data-with-google-sheets/images/02.png)

1. ［**Webhooks**］ を選択します。

    ![Webhooksを選択します。](./using-ifttt-to-sync-object-data-with-google-sheets/images/03.png)

1. トリガータイプは、 ［**Receive a web request**］ をクリックします。

    ![トリガータイプを選択します。](./using-ifttt-to-sync-object-data-with-google-sheets/images/04.png)

1. ［**Event Name**］ にイベント名を入力し、 ［**Create Trigger**］ をクリックしてください。

    ![［イベント名」を入力し、「トリガー作成」をクリックします。](./using-ifttt-to-sync-object-data-with-google-sheets/images/05.png)

1. ［**Then That**］ ステップで、 ［**Add**］ をクリックします。

    ![［Then That］のステップの追加をクリックします。](./using-ifttt-to-sync-object-data-with-google-sheets/images/06.png)

1. ［**Google Sheets**］ を選択します。

    ![Google シートを検索して選択します。](./using-ifttt-to-sync-object-data-with-google-sheets/images/07.png)

1. アクションタイプは、 ［**Add row to spreadsheet**］ をクリックします。

    ![［スプレッドシートに行を追加する］をクリックします。](./using-ifttt-to-sync-object-data-with-google-sheets/images/08.png)

1. アクションを設定し、 ［**Create Action**］ をクリックします。

    ![アクションを設定します。](./using-ifttt-to-sync-object-data-with-google-sheets/images/09.png)

    ```{note}
    Googleアカウントに接続すると、連携したいGoogleアカウントを選択し、そのアカウントのファイルにアクセスするIFTTT権限を付与するためのウィンドウが開きます。
    ```

1. ［**Continue**］ をクリックします。

    ![［続行］をクリックします。](./using-ifttt-to-sync-object-data-with-google-sheets/images/10.png)

1. 確認し、 ［**Finish**］ をクリックします。

    ![確認後、［完了］をクリックします。](./using-ifttt-to-sync-object-data-with-google-sheets/images/11.png)

1. 処理を終了すると、 **アプレット** はすでに **接続された** 状態となっています。

    ![確認後、［完了］をクリックします。](./using-ifttt-to-sync-object-data-with-google-sheets/images/12.png)

1. 作成したら、 **Webhookアイコン** &rarr; ［**ドキュメンテーション**］ をクリックし、生成した **Webhook URL** をコピーしてください。

    ![Webhookアイコンをクリックします。](./using-ifttt-to-sync-object-data-with-google-sheets/images/13.png)

    ![生成されたWebhookのURLをコピーしてください。](./using-ifttt-to-sync-object-data-with-google-sheets/images/14.png)

1. Liferayインスタンスでは、コピーしたURLを使って [オブジェクトアクションを定義し、新しいオブジェクトエントリーが追加されるたびにwebhookエンドポイントにリクエストを送ります](../../creating-and-managing-objects/defining-object-actions.md) 。

    ![エントリーが追加されるたびに、webhookエンドポイントにリクエストを送信するアクションを定義します。](./using-ifttt-to-sync-object-data-with-google-sheets/images/15.png)

## 追加情報

* [オブジェクト](../../../objects.md)
* [オブジェクトの作成と管理](../../creating-and-managing-objects.md)
* [オブジェクト統合を理解する](../../understanding-object-integrations.md)