# Automate.ioを使用して、オブジェクトデータをGoogle シートと同期する

{bdg-secondary}`7.4以降で利用可能`

ここでは、 [Automate.io](https://automate.io/) を使用して、Liferay Objectと Google シート間の同期タスクをトリガーするWebhooksの使用方法について説明します。 この方法でデータを同期するには、Automate.ioのプレミアムアカウント、Googleスプレッドシート、およびアクティブなDXP 7.4インスタンスが必要です。 DXPインスタンスには、Googleスプレッドシートにデータを送受信するための必要なフィールドを持つ公開オブジェクトも必要です。

## オブジェクトデータをGoogle シートに同期させる

以下の手順で、オブジェクトデータをGoogle シートに同期させます。

1. [Automate.io](https://automate.io/) にサインインし、 ［**Create a Bot**］ をクリックします。

   ![Automate.ioを開き、Create a Botをクリックします。](./using-automate-io-to-sync-object-data-with-google-sheets/images/01.png)

1. **Trigger** 手順では、 ［**Webhooks**］ アプリを選択してください。

   ![Webhooksを選択します。](./using-automate-io-to-sync-object-data-with-google-sheets/images/02.png)

   ```{note}
   Webhooksは、Automate.ioのプレミアム機能です。
   ```

1. ［**Trigger Event**］ については、 ［**Incoming Hook**］ を選択してください。

   ![Incoming Hookを選択します。](./using-automate-io-to-sync-object-data-with-google-sheets/images/03.png)

1. 生成された **Webhook URL** をコピーします。

   ![WebhooksのURLをコピーします。](./using-automate-io-to-sync-object-data-with-google-sheets/images/04.png)

1. Liferayインスタンスでは、コピーしたURLを使って [オブジェクトアクションを定義し](../../creating-and-managing-objects/actions/defining-object-actions.md)、新しいオブジェクトエントリーが追加されるたびにwebhookエンドポイントにリクエストを送ります。

   ![エントリーが追加されるたびに、webhookエンドポイントにリクエストを送信するアクションを定義します。](./using-automate-io-to-sync-object-data-with-google-sheets/images/05.png)

1. Webhookをトリガーするためのテストオブジェクトエントリを追加します。

   これにより、Automate.ioボットのWebhooksアプリがオブジェクトデータ構造を自動的に決定することができます。

1. **Action** 手順では、 ［**Google Sheets**］ アプリを選択してください。

   ![Google シートを選択します。](./using-automate-io-to-sync-object-data-with-google-sheets/images/06.png)

1. ［**Authorize**］ をクリックして、Googleアカウントとアプリを連携させます。

   ![接続するGoogleアカウントを選択します。](./using-automate-io-to-sync-object-data-with-google-sheets/images/07.png)

1. アクションフィールドでは、 ［**Add Row**］ を選択します。

   ![［行を追加する］を選択します。](./using-automate-io-to-sync-object-data-with-google-sheets/images/08.png)

1. オブジェクトと同期させたい **スプレッドシート** と **ワークシート** を選択し、 ［**保存**］ をクリックします。

   ![目的のスプレッドシートとワークシートを選択します。](./using-automate-io-to-sync-object-data-with-google-sheets/images/09.png)

1. ボットを **オンにします** 。

   ![ボットをオンにします。](./using-automate-io-to-sync-object-data-with-google-sheets/images/10.png)

1. オブジェクトエントリを追加して、ボットをテストします。

   ![本番データを使ってボットをテストします。](./using-automate-io-to-sync-object-data-with-google-sheets/images/11.png)

1. ボットがオブジェクトデータを正常に受信し、Google シートのアクションをトリガーしたことを確認します。

   ![テストが正常に行われたことを確認します。](./using-automate-io-to-sync-object-data-with-google-sheets/images/12.png)

## 関連トピック

* [オブジェクト](../../../objects.md)
* [オブジェクトの作成と管理](../../creating-and-managing-objects.md)
* [オブジェクト統合を理解する](../../understanding-object-integrations.md)