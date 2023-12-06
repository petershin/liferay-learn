# Makeを使用して、オブジェクトデータをGoogle シートと同期する

{bdg-secondary}`Liferay 7.4+`

ここでは、 [Make](https://www.make.com/) （旧称：Integromat）を使用して、Liferay Objectと Google シート間の同期タスクをトリガーするWebhooksの使用方法について説明します。 この方法でデータを同期するには、Makeのアカウント、Googleスプレッドシート、およびアクティブなDXP 7.4インスタンスが必要です。 DXPインスタンスには、Googleスプレッドシートにデータを送受信するための必要なフィールドを持つ公開オブジェクトも必要です。

## オブジェクトデータをGoogle シートに同期させる

以下の手順で、オブジェクトデータをGoogle シートに同期させます。

1. [Make](https://www.make.com/) にサインインし、 ［**Scenarios**］ ページに移動し、 ［**Create a new scenario**］ をクリックします。

   ![［Create a new scenario］をクリックします。](./using-make-to-sync-object-data-with-google-sheets/images/01.png)

1. **追加** ボタンをクリックし、 ［**Webhooks**］ モジュールを選択し、 ［**Custom webhook**］ トリガーを選びます。

   Webhookがデータを受信した際にシナリオを実行します。

   ![Webhooksを選択します。](./using-make-to-sync-object-data-with-google-sheets/images/02.png)

   ![［Custom webhook］を選択します。](./using-make-to-sync-object-data-with-google-sheets/images/03.png)

1. 新しいモジュールを選択し、 **追加** をクリックして、新しいWebhookを生成します。

   ![モジュールを選択し、追加をクリックします。](./using-make-to-sync-object-data-with-google-sheets/images/04.png)

1. 作成後、生成された **Webhook URL** をコピーします。

   ![生成されたWebhookのURLをコピーしてください。](./using-make-to-sync-object-data-with-google-sheets/images/05.png)

1. Liferayインスタンスでは、コピーしたURLを使って [オブジェクトアクションを定義し](../../creating-and-managing-objects/actions/defining-object-actions.md)、新しいオブジェクトエントリーが追加されるたびにwebhookエンドポイントにリクエストを送ります。

   ![エントリーが追加されるたびに、webhookエンドポイントにリクエストを送信するアクションを定義します。](./using-make-to-sync-object-data-with-google-sheets/images/06.png)

1. Webhookをトリガーするためのテストオブジェクトエントリを追加します。

   これにより、Webhookモジュールがオブジェクトのデータ構造を自動的に決定することができます。

1. モジュールがオブジェクトのデータ構造を正常に決定したことを確認し、 ［**OK**］ をクリックします。

   ![オブジェクトのデータ構造が正常に決定されたことを確認します。](./using-make-to-sync-object-data-with-google-sheets/images/07.png)

   ```{note}
   オブジェクトの構造が変更された場合は、Webhookモジュールの編集に戻り、［**Redetermine data structure**］**をクリックします。
   ```

1. ［**Add new module**］ ボタンをクリックし、 ［**Google Sheets**］ モジュールを選択し、 ［**Add a Row**］ アクションを選びます。

   ![Google シートを選択します。](./using-make-to-sync-object-data-with-google-sheets/images/08.png)

   ![［Add a Row］を選択します。](./using-make-to-sync-object-data-with-google-sheets/images/09.png)

1. 新しいモジュールを選択し、 **追加** をクリックして、Googleアカウントを接続します。

1. ［Connection name］を入力し、 ［**Save**］ をクリックします。

   これにより、連携したいGoogleアカウントを選択し、そのアカウントのファイルにアクセスするMake権限を付与するためのウィンドウが開きます。

   ![Google接続を追加します。](./using-make-to-sync-object-data-with-google-sheets/images/10.png)

   Make権限を付与した後、Google Sheetsモジュールの編集に戻ります。

1. モジュールのモードを決定してから、目的の **Spreadsheet** と **Sheet** を選択し、オブジェクトと同期させます。

1. 選択されたシートがヘッダーが含まれているかどうかを示します。

1. シートの列をオブジェクトのストラクチャーのデータフィールドにマッピングします。 利用可能なオブジェクトフィールドは、 **Webhooks** モジュールによって提供されます。

   ![シートの列をオブジェクトのフィールドにマッピングします。](./using-make-to-sync-object-data-with-google-sheets/images/11.png)

1. ［**Scheduling**］ をオンにし、このシナリオを **保存** します。

   ![スケジューリングをオンにします。](./using-make-to-sync-object-data-with-google-sheets/images/12.png)

保存後、選択したシートに新しいオブジェクトの入力データが追加されます。

## シートデータをオブジェクトに同期する

以下の手順で、Google シートのデータをオブジェクトに同期させます。

1. Makeを開き、［Scenarios］ページに移動し、 ［**Create a new scenario**］ をクリックします。

   ![［Create a new scenario］をクリックします。](./using-make-to-sync-object-data-with-google-sheets/images/13.png)

1. **追加** ボタンをクリックし、 ［**Google Sheets**］ モジュールを選択し、 ［**Watch Rows**］ トリガーを選びます。

   シートの新しい行を監視するようモジュールを設定します。

   ![Google シートを選択します。](./using-make-to-sync-object-data-with-google-sheets/images/14.png)

   ![［Watch rows］を選択します。](./using-make-to-sync-object-data-with-google-sheets/images/15.png)

1. 新しいモジュールを選択し、 **追加** をクリックして、Googleアカウントを接続します。

1. ［接続名］を入力し、 ［**保存**］ をクリックします。

   これにより、連携したいGoogleアカウントを選択し、そのアカウントのファイルにアクセスするMake権限を付与するためのウィンドウが開きます。

   ![Google接続を追加します。](./using-make-to-sync-object-data-with-google-sheets/images/16.png)

1. 目的の ［**Spreadsheet**］ と ［**Sheet**］ を選択します。

1. 選択したシートがヘッダーを含むかどうかを示し、監視する列の範囲を入力します（例： `A1:E1` は、A列からE列にデータ入力を送信します）。

1. 1回の実行サイクルで処理される結果の制限を設定します。

1. 完了したら、 ［**OK**］ をクリックします。

1. ［**Add new module**］ ボタンをクリックし、 ［**HTTP**］ モジュールを選択し、 ［**Make a Basic Auth request**］ アクションを選びます。

   ![HTTPを選択します。](./using-make-to-sync-object-data-with-google-sheets/images/17.png)

   ![［Make a Basic Auth request］を選択します。](./using-make-to-sync-object-data-with-google-sheets/images/18.png)

   ```{important}
   デモ目的でのみベーシック認証を使用しています。 ビジネスユースケースでは、より安全な認証方法を使用してください（例：*Make an OAuth 2.0 request*）。
   ```

1. 新しいモジュールを選択し、 **追加** をクリックして、基本認証情報を追加します。

1. 追加されたら、オブジェクトのHeadless APIのURLを入力し、次のフォーマット：`https://<your-domain>/o/c/<objectname>/`を使用します。  詳細は、 [ヘッドレスフレームワークの統合](../../understanding-object-integrations/using-custom-object-apis.md) を参照してください。

1. **post** 方式タイプを選択します。

   ![認証情報を追加し、オブジェクトのHeadless APIのURLを入力し、post方式を選択します。](./using-make-to-sync-object-data-with-google-sheets/images/19.png)

1. 目的の［Body type］（例： **RAW**）とリクエストの［Content type］（例： **JSON**）を選択してください。

1. 選択したコンテンツの種類とターゲットオブジェクトに適した書式でリクエスト本文を入力します。

   ![［Make a Basic Auth request］を選択します。](./using-make-to-sync-object-data-with-google-sheets/images/20.png)

1. ［**OK**］ をクリックします。

1. ［**Scheduling**］ をオンにし、このシナリオを **保存** します。

   ![スケジューリングをオンにして、シナリオを保存します。](./using-make-to-sync-object-data-with-google-sheets/images/21.png)

   ```{note}
   デフォルトでは、このシナリオは15分ごとに自動的にトリガーされます。 
   ```

## 関連トピック

* [オブジェクト概要](../../../objects.md)
* [オブジェクトの作成と管理](../../creating-and-managing-objects.md)
* [オブジェクト統合を理解する](../../understanding-object-integrations.md)
