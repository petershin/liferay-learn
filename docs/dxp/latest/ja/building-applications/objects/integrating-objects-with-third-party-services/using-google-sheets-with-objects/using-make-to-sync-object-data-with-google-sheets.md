# Makeを使用して、オブジェクトデータをGoogle シートと同期する

{bdg-secondary}`Liferay 7.4+`

ここでは、 [Make](https://www.make.com/) （旧称：Integromat）を使用して、Liferay Objectと Google シート間の同期タスクをトリガーするWebhooksの使用方法について説明します。 この方法でデータを同期するには、Makeのアカウント、Googleスプレッドシート、およびアクティブなDXP 7.4インスタンスが必要です。 DXPインスタンスには、Googleスプレッドシートにデータを送受信するための必要なフィールドを持つ公開オブジェクトも必要です。

## オブジェクトデータをGoogle シートに同期させる

以下の手順で、オブジェクトデータをGoogle シートに同期させます。

1. [Make](https://www.make.com/) にサインインし、 **Scenarios** ページに移動し、 **Create new scenario** をクリックします。

   ![Click Create a new scenario.](./using-make-to-sync-object-data-with-google-sheets/images/01.png)

1. **Add** ボタンをクリックし、 **Webhooks** モジュールを選択し、 **Custom webhook** トリガーを選択します。

   Webhookがデータを受信した際にシナリオを実行します。

   ![Select Webhooks.](./using-make-to-sync-object-data-with-google-sheets/images/02.png)

   ![Select Custom webhook.](./using-make-to-sync-object-data-with-google-sheets/images/03.png)

1. 新しいモジュールを選択し、 **追加** をクリックして新しいWebhookを生成します。

   ![Select the module and click Add.](./using-make-to-sync-object-data-with-google-sheets/images/04.png)

1. 作成したら、生成された **webhook URL** をコピーする。

   ![Copy the generated webhook URL.](./using-make-to-sync-object-data-with-google-sheets/images/05.png)

1. Liferayインスタンスでは、コピーしたURLを使って [オブジェクトアクションを定義し](../../creating-and-managing-objects/actions/defining-object-actions.md) 、新しいオブジェクトエントリーが追加されるたびにwebhookエンドポイントにリクエストを送ります。

   ![Define an action that sends a request to the webhook endpoint whenever an entry is added.](./using-make-to-sync-object-data-with-google-sheets/images/06.png)

1. Webhookをトリガーするためのテストオブジェクトエントリを追加します。

   これにより、Webhookモジュールがオブジェクトのデータ構造を自動的に決定することができます。

1. モジュールがオブジェクトのデータ構造を正常に決定したことを確認し、 **OK** をクリックします。

   ![Verify the Object's data structure was determined successfully.](./using-make-to-sync-object-data-with-google-sheets/images/07.png)

   ```{note}
   Object の構造が変更された場合は、Webhooks モジュールの編集に戻り、*Redetermine data structure* をクリックします。
   ```
1. **Add new module** ボタンをクリックし、 **Google Sheets** モジュールを選択し、 **Add a row** アクションを選択します。

   ![Select Google Sheets.](./using-make-to-sync-object-data-with-google-sheets/images/08.png)

   ![Select Add a row.](./using-make-to-sync-object-data-with-google-sheets/images/09.png)

1. 新しいモジュールを選択し、 **追加** をクリックしてGoogleアカウントを接続します。

1. 接続名を入力し、 **Save** をクリックします。

    これにより、連携したいGoogleアカウントを選択し、そのアカウントのファイルにアクセスするMake権限を付与するためのウィンドウが開きます。

    ![Add a Google connection.](./using-make-to-sync-object-data-with-google-sheets/images/10.png)

    Make権限を付与した後、Google Sheetsモジュールの編集に戻ります。

1. モジュールのモードを決定し、オブジェクトと同期する **スプレッドシート** と **シート** を選択します。

1. 選択されたシートがヘッダーが含まれているかどうかを示します。

1. シートの列をオブジェクトのストラクチャーのデータフィールドにマッピングします。 利用可能な Object フィールドは、 **Webhooks** モジュールによって提供されます。

    ![Map the Sheet's columns to Object fields.](./using-make-to-sync-object-data-with-google-sheets/images/11.png)

1. スケジューリング **をオンにして、シナリオを保存** してください。

    ![Turn on scheduling.](./using-make-to-sync-object-data-with-google-sheets/images/12.png)

保存後、選択したシートに新しいオブジェクトの入力データが追加されます。

## シートデータをオブジェクトに同期する

以下の手順で、Google シートのデータをオブジェクトに同期させます。

1. Makeを開き、シナリオページに移動し、 **新しいシナリオを作成** をクリックします。

   ![Click Create a new scenario.](./using-make-to-sync-object-data-with-google-sheets/images/13.png)

1. Add "ボタンをクリックし、"Google Sheets "モジュールを選択し、"Watch rows "トリガーを選択する。

   シートの新しい行を監視するようモジュールを設定します。

   ![Select Google Sheets.](./using-make-to-sync-object-data-with-google-sheets/images/14.png)

   ![Select Watch rows.](./using-make-to-sync-object-data-with-google-sheets/images/15.png)

1. 新しいモジュールを選択し、 **追加** をクリックしてGoogleアカウントを接続します。

1. 接続名を入力し、 **Save** をクリックします。

   これにより、連携したいGoogleアカウントを選択し、そのアカウントのファイルにアクセスするMake権限を付与するためのウィンドウが開きます。

   ![Add a Google connection.](./using-make-to-sync-object-data-with-google-sheets/images/16.png)

1. 目的の **スプレッドシート** と **シート** を選択する。

1. 選択したシートがヘッダーを含むかどうかを示し、監視する列の範囲を入力します（例：`A1:E1`はA列からE列のデータ入力を送信します）。

1. 1回の実行サイクルで処理される結果の制限を設定します。

1. 完了したら **OK** をクリックします。

1. **Add new module** ボタンをクリックし、 **HTTP** モジュールを選択し、 **Make a Basic Auth request** アクションを選択します。

   ![Select HTTP.](./using-make-to-sync-object-data-with-google-sheets/images/17.png)

   ![Select Make a Basic Auth request.](./using-make-to-sync-object-data-with-google-sheets/images/18.png)

   ```{important}
   デモ目的でのみベーシック認証を使用しています。 ビジネスユースケースでは、より安全な認証方法を使用してください（例：*Make an OAuth 2.0 request*）。
   ```
1. 新しいモジュールを選択し、 **Add** をクリックして基本認証情報を追加します。

1. 追加したら、オブジェクトのヘッドレスAPI URLを入力する：`https://<your-domain>/o/c/<objectname>/`. 詳細は、 [ヘッドレスフレームワークの統合](../../understanding-object-integrations/using-custom-object-apis.md) を参照してください。

1. **post** メソッドのタイプを選択します。

    ![Add credentials, enter the Object's Headless API URL, and select the post method.](./using-make-to-sync-object-data-with-google-sheets/images/19.png)

1. 希望のボディタイプ（例： **RAW**）とリクエストのコンテンツタイプ（例： **JSON**）を選択する。

1. 選択したコンテンツの種類とターゲットオブジェクトに適した書式でリクエスト本文を入力します。

    ![Select Make a Basic Auth request.](./using-make-to-sync-object-data-with-google-sheets/images/20.png)

1. **OK** をクリックしてください。

1. スケジューリング **をオンにして、シナリオを保存** してください。

    ![Turn on scheduling and save the scenario.](./using-make-to-sync-object-data-with-google-sheets/images/21.png)

    ```{note}
    デフォルトでは、このシナリオは15分ごとに自動的にトリガーされる。 
    ```
## 関連トピック

* [オブジェクトの概要](../../../objects.md)
* [オブジェクトの作成と管理](../../creating-and-managing-objects.md)
* [オブジェクト統合を理解する](../../understanding-object-integrations.md)
