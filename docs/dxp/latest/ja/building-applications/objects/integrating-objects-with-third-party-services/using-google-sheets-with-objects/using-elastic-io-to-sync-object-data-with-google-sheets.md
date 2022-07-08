# Elastic.ioを使用して、オブジェクトデータをGoogle シートと同期する

{bdg-secondary}`7.4以降で利用可能`

Liferay Objectをデータ統合ツールと併用することで、Objectのデータを外部サービスと同期するための自動タスクを作成することができます。 これらのタスクは、Webhooksを使用してトリガーされ、GoogleアプリケーションやMicrosoft Officeなどと接続することができます。

ここでは、 [Elastic.io](https://www.elastic.io/)を使用して、Liferay Objectと Google シート間の同期タスクをトリガーするWebhooksの使用方法について説明します。 この方法でデータを同期するには、Elastic.ioのアカウント、Googleスプレッドシート、およびアクティブなDXP 7.4インスタンスが必要です。 DXPインスタンスには、Googleスプレッドシートにデータを送受信するための必要なフィールドを持つ公開オブジェクトも必要です。

## オブジェクトデータをGoogle シートに同期させる

以下の手順で、オブジェクトデータをGoogle シートに同期させます。

1. [Elastic.io](https://www.elastic.io/)にサインインし、*［Integrate］*ページに移動し、*［Flows］*をクリックします。

   ![統合ページに移動し、［フロー］をクリックします。](./using-elastic-io-to-sync-object-data-with-google-sheets/images/01.png)

1. *［Add New Flow］*をクリックします。

   ![新しいフローを追加します。](./using-elastic-io-to-sync-object-data-with-google-sheets/images/02.png)

1. *［Add the Initial Trigger］*をクリックします。

   ![初期トリガーを追加します。](./using-elastic-io-to-sync-object-data-with-google-sheets/images/03.png)

1. *Trigger*については、 *Webhook*コンポーネントを選択してください。

   ![Webhookを検索して選択します。](./using-elastic-io-to-sync-object-data-with-google-sheets/images/04.png)

1. 生成された*Webhook URL*をコピーします。

   ![生成されたWebhookのURLをコピーしてください。](./using-elastic-io-to-sync-object-data-with-google-sheets/images/05.png)

1. Liferayインスタンスでは、コピーしたURLを使って [オブジェクトアクションを定義し](../../creating-and-managing-objects/defining-object-actions.md)、新しいオブジェクトエントリーが追加されるたびにwebhookエンドポイントにリクエストを送ります。

   ![エントリーが追加されるたびに、webhookエンドポイントにリクエストを送信するアクションを定義します。](./using-elastic-io-to-sync-object-data-with-google-sheets/images/06.png)

1. Webhookをトリガーするためのテストオブジェクトエントリを追加します。

   これにより、Webhookコンポーネントがオブジェクトのデータ構造を自動的に決定することができます。

1. *［Send Sample Request］*ボタンをクリックします。

   ![［Send Sample Request］ボタンをクリックします。](./using-elastic-io-to-sync-object-data-with-google-sheets/images/07.png)

1. テストでオブジェクトのデータ構造が正常に決定されたことを確認します。 Webhook URLに送信されたデータが見つかった場合、ステップには成功したことが表示されます。

   ![テストが正常に行われたことを確認します。](./using-elastic-io-to-sync-object-data-with-google-sheets/images/08.png)

1. *［Add New Action］*をクリックします。

   ![新しいアクションを追加します。](./using-elastic-io-to-sync-object-data-with-google-sheets/images/09.png)

1. *Action* 手順では、 *［Google シート］* アプリを選択してください。

   ![Google シートのコンポーネントを選択します。](./using-elastic-io-to-sync-object-data-with-google-sheets/images/10.png)

1. *［ Add Spreadsheet Row］* 機能を選択します。

   ![［Add Spreadsheet Row］ 機能を選択します。](./using-elastic-io-to-sync-object-data-with-google-sheets/images/11.png)

1. オブジェクトと同期させたい*［Spreadsheet］*と*［Worksheet］*を選択します。

   ![オブジェクトと同期させたいスプレッドシートとシートを選択します。](./using-elastic-io-to-sync-object-data-with-google-sheets/images/12.png)

1. 選択されたシートがヘッダーが含まれているかどうかを示します。

   ![選択されたシートがヘッダーが含まれているかどうかを示します。](./using-elastic-io-to-sync-object-data-with-google-sheets/images/13.png)

1. シートの列をオブジェクトのストラクチャーのデータフィールドにマッピングします。

   ![シートの列をオブジェクトのフィールドにマッピングします。](./using-elastic-io-to-sync-object-data-with-google-sheets/images/14.png)

1. *［Retrieve Sample from Google Spreadsheet］* ボタンをクリックします。

   ![［Retrieve Sample from Google Spreadsheet］ ボタンをクリックします。](./using-elastic-io-to-sync-object-data-with-google-sheets/images/15.png)

1. テストが正常に行われたことを確認します。

   ![テストが正常に行われたことを確認します。](./using-elastic-io-to-sync-object-data-with-google-sheets/images/16.png)

1. *［Publish Draft］*をクリックします。

   ![［Publish Draft］をクリックします。](./using-elastic-io-to-sync-object-data-with-google-sheets/images/17.png)

1. *［Start Flow］* をクリックし、新しいフローを有効にします。

   ![［Start Flow］をクリックします。](./using-elastic-io-to-sync-object-data-with-google-sheets/images/18.png)

## 追加情報

* [Objects](../../../objects.md)
* [オブジェクトの作成と管理](../../creating-and-managing-objects.md)
* [オブジェクト統合を理解する](../../understanding-object-integrations.md)