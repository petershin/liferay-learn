# Workatoを使用して、オブジェクトデータをGoogle シートと同期する

{bdg-secondary}`7.4以降で利用可能`

ここでは、 [Workato](https://www.workato.com/)を使用して、Liferay Objectと Google シート間の同期タスクをトリガーするWebhooksの使用方法について説明します。 この方法でデータを同期するには、Workatoのアカウント、Googleスプレッドシート、およびアクティブなDXP 7.4インスタンスが必要です。 DXPインスタンスには、Googleスプレッドシートにデータを送受信するための必要なフィールドを持つ公開オブジェクトも必要です。

## オブジェクトデータをGoogle シートに同期させる

以下の手順で、オブジェクトデータをGoogle シートに同期させます。

1. [Workato](https://www.workato.com/) にログインし、 *［Projects］* ページに移動します。

   ![［Projects］ページに移動します。](./using-workato-to-sync-object-data-with-google-sheets/images/01.png)

1. *［Recipes］* ページに移動し、 *［Create Recipe］*をクリックします。

   ![［Recipes］ページに移動し、［Create Recipe］をクリックします。](./using-workato-to-sync-object-data-with-google-sheets/images/02.png)

1. *［Name］*、 *［Location］*のレシピを入力して、*［Trigger from a webhook］* の開始点 <0>を選択します。 *［Start building］* をクリックします。

   ![［Name］と［Location］を入力し、開始地点を選びます。](./using-workato-to-sync-object-data-with-google-sheets/images/03.png)

1. セットアップパネルで、 *［Start guided setup］*をクリックします。

   ![［Start guided setup］をクリックします。](./using-workato-to-sync-object-data-with-google-sheets/images/04.png)

1. *［Event name］* を入力し、生成された *Webhook URL*をコピーします。

   ![［Event Name］を入力し、［Next］をクリックします。](./using-workato-to-sync-object-data-with-google-sheets/images/05.png)

1. Liferayインスタンスでは、コピーしたURLを使って [オブジェクトアクションを定義し](../../creating-and-managing-objects/defining-object-actions.md)、新しいオブジェクトエントリーが追加されるたびにwebhookエンドポイントにリクエストを送ります。

   ![エントリーが追加されるたびに、webhookエンドポイントにリクエストを送信するアクションを定義します。](./using-workato-to-sync-object-data-with-google-sheets/images/06.png)

1. *［Next］* をクリックし、Webhookをトリガーするためのテストオブジェクトエントリーを追加します。

   これにより、Webhookモジュールがオブジェクトのデータ構造を自動的に決定することができます。

   ![Webhookをトリガーします。](./using-workato-to-sync-object-data-with-google-sheets/images/07.png)

1. テストにより、オブジェクトのデータ構造が正常に決定されたことを確認し、 *［Setup Webhook］*をクリックします。

   ![テストでオブジェクトのデータ構造が正常に決定されたことを確認します。](./using-workato-to-sync-object-data-with-google-sheets/images/08.png)

1. *［Action］* では、 *［Action in an app］* を選択してください。

   ![［Action］で、［Action in an app］を選択します。](./using-workato-to-sync-object-data-with-google-sheets/images/09.png)

1. *［Google Sheets］*アプリを選択します。

   ![Google シートアプリを選択します。](./using-workato-to-sync-object-data-with-google-sheets/images/10.png)

1. *［Add Row］*アクションを選択します。

   ![［Add Row］アクションを選択します。](./using-workato-to-sync-object-data-with-google-sheets/images/11.png)

1. アプリをGoogleアカウントに接続します。

   ![アプリをGoogleアカウントに接続します。](./using-workato-to-sync-object-data-with-google-sheets/images/12.png)

1. オブジェクトと同期させたい*［Spreadsheet］*と*［Worksheet］*を選択します。

   ![目的のスプレッドシートとワークシートを選択します。](./using-workato-to-sync-object-data-with-google-sheets/images/13.png)

1. シートの列をオブジェクトのストラクチャーのデータフィールドにマッピングします。

   ![シートの列をマッピングします。](./using-workato-to-sync-object-data-with-google-sheets/images/14.png)

1. *［Save］* をクリックします。

   ![［保存］をクリックします。](./using-workato-to-sync-object-data-with-google-sheets/images/15.png)

1. *［Assets］* ページに移動し、 *［kebab］ボタン* をクリック、 *［Start］* を選択してレシピを有効にします。

   ![レシピを有効にします。](./using-workato-to-sync-object-data-with-google-sheets/images/16.png)

## 追加情報

* [Objects](../../../objects.md)
* [オブジェクトの作成と管理](../../creating-and-managing-objects.md)
* [オブジェクト統合を理解する](../../understanding-object-integrations.md)