# Integratelyを使用して、オブジェクトデータをGoogle シートと同期する

{bdg-secondary}`Liferay 7.4+`

ここでは、 [Integrately](https://integrately.com/) を使用して、Liferay Objectと Google シート間の同期タスクをトリガーするWebhooksの使用方法について説明します。 この方法でデータを同期するには、Integratelyのアカウント、Googleスプレッドシート、およびアクティブなDXP 7.4インスタンスが必要です。 DXPインスタンスには、Googleスプレッドシートにデータを送受信するための必要なフィールドを持つ公開オブジェクトも必要です。

## オブジェクトデータをGoogle シートに同期させる

以下の手順で、オブジェクトデータをGoogle シートに同期させます。

1. [Integrately](https://integrately.com/) にサインインし、 ［**New Automation**］ をクリックします。

   ![［New Automation］をクリックします。](./using-integrately-to-sync-object-data-with-google-sheets/images/01.png)

1. ［**Webhook/API Integration**］ アプリをオートメーションに追加します。

   ![Webhook/API Integrationを検索し、選択します。](./using-integrately-to-sync-object-data-with-google-sheets/images/02.png)

1. ［**Google Sheets**］ アプリをオートメーションに追加します。

   ![Google シートを検索して選択します。](./using-integrately-to-sync-object-data-with-google-sheets/images/03.png)

1. オートメーションのトリガーとアクションを定義し、 ［**Go**］ をクリックします。

   ![フローを定義し、*Goをクリックする。](./using-integrately-to-sync-object-data-with-google-sheets/images/04.png)

1. 生成された **Webhook URL** をコピーします。

   ![生成されたWebhookのURLをコピーしてください。](./using-integrately-to-sync-object-data-with-google-sheets/images/05.png)

1. Liferayインスタンスでは、コピーしたURLを使って [オブジェクトアクションを定義し](../../creating-and-managing-objects/actions/defining-object-actions.md)、新しいオブジェクトエントリーが追加されるたびにwebhookエンドポイントにリクエストを送ります。

   ![エントリーが追加されるたびに、webhookエンドポイントにリクエストを送信するアクションを定義します。](./using-integrately-to-sync-object-data-with-google-sheets/images/06.png)

1. Webhookをトリガーするためのテストオブジェクトエントリを追加します。

   これにより、Webhookアプリがオブジェクトのデータ構造を自動的に決定することができます。

1. Integratelyでは、 ［**I have set this URL in Webhook/API Integration**］ をクリックします。

1. ［**Done, Check if received**］ をクリックします。

   ![［Done, Check if received］をクリックします。](./using-integrately-to-sync-object-data-with-google-sheets/images/07.png)

1. テストが成功したことを確認し、 ［**Continue**］ をクリックします。

   ![テストが正常に行われたことを確認し、［続行］をクリックします。](./using-integrately-to-sync-object-data-with-google-sheets/images/08.png)

1. Google シートアプリをGoogleアカウントに接続します。

   ![Google シートアプリをGoogleアカウントに接続します。](./using-integrately-to-sync-object-data-with-google-sheets/images/09.png)

1. オブジェクトと同期させたい ［**Spreadsheet**］ と ［**Worksheet**］ を選択します。

   ![目的のスプレッドシートとワークシートを選択します。](./using-integrately-to-sync-object-data-with-google-sheets/images/10.png)

1. シートの列をオブジェクトのストラクチャーのデータフィールドにマッピングします。

   ![シートの列をオブジェクトのフィールドにマッピングします。](./using-integrately-to-sync-object-data-with-google-sheets/images/11.png)

1. ［**My Automations**］ ページに移動し、 **Power** ボタンをクリックし、接続をオンにします。

   ![接続をオンにします。](./using-integrately-to-sync-object-data-with-google-sheets/images/12.png)

## 関連トピック

* [オブジェクト概要](../../../objects.md)
* [オブジェクトの作成と管理](../../creating-and-managing-objects.md)
* [オブジェクト統合を理解する](../../understanding-object-integrations.md)
