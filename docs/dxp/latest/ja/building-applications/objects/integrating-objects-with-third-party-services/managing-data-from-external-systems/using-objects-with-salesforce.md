# Salesforce でのオブジェクトの使用

{bdg-link-primary}`[ベータ版特集](../../../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)`

Liferay では、 [カスタム Salesforce オブジェクト](https://help.salesforce.com/s/) と統合するオブジェクトを作成し、Salesforce を外部ストレージシステムとして使用できます。 一度統合されると、LiferayオブジェクトのデータはSalesforceにのみ保存され、ユーザーがどちらのコンテキストでエントリを追加、更新、削除しても、両方のシステムが自動的に更新されます。

この統合を使用するには、標準またはカスタムのSalesforceオブジェクトと、OAuthが有効なLiferay用のSalesforce接続アプリが必要です。 詳細については、 [Salesforce](#preparing-salesforce) の準備を参照してください。

!!! note
    この機能を使用するには、プロキシ・オブジェクト（LPS-135430） [機能フラグ](../../../../system-administration/configuring-liferay/feature-flags.md) を有効にしてください。

## セールスフォースの準備

Salesforce [connected apps](https://help.salesforce.com/s/articleView?id=sf.connected_app_overview.htm&type=5) は、API や標準プロトコル (SAML、OAuth など) を介して、外部アプリケーションを Salesforce アカウントと統合できるようにするためのフレームワークです。 先に進む前に、 [接続アプリ](https://help.salesforce.com/s/articleView?id=sf.connected_app_create.htm&type=5) を作成し、Liferay インスタンスを Salesforce と統合できるようにします。

![Create a connected app in Salesforce for connecting with your Liferay server.](./using-objects-with-salesforce/images/01.png)

Salesforce で接続アプリを設定する際、 [Liferay との API 連携のために OAuth](https://help.salesforce.com/s/articleView?id=sf.connected_app_create_api_integration.htm&type=5) を有効にして設定します。 この過程で、OAuthコンシューマー・キーとシークレットを必ずコピーしてください。 これらの詳細は [Liferay インスタンスを設定する際に必要です](#configuring-your-liferay-instance) 。

![Enable OAuth for the Liferay connected app and retrieve the OAuth consumer key and secret for use in your Liferay instance.](./using-objects-with-salesforce/images/02.png)

Liferay オブジェクトを作成する前に、 [標準](https://help.salesforce.com/s/articleView?id=sf.extend_click_find_objectmgmt_parent.htm&type=5) または [カスタム](https://help.salesforce.com/s/articleView?id=sf.dev_objectedit.htm&type=5) Salesforce オブジェクトに必要なフィールドがすべて含まれていることを確認してください。 これらのフィールドは、Liferayオブジェクトフィールドをリンクする前に定義しておく必要があります。

![Ensure the custom Salesforce object includes all desired fields](./using-objects-with-salesforce/images/03.png)

## Liferay インスタンスを設定する

以下の手順に従って、LiferayインスタンスをSalesforceに接続します：

1. グローバルメニュー([グローバルメニュー](../../../../images/icon-applications-menu.png))を開き、[コントロールパネル(Control Panel)]タブに移動し、[インスタンス設定(Instance Settings)]をクリックします。

1. サードパーティ]をクリックし、[Salesforce Integration]タブに移動します。

1. [Liferay 接続アプリ](https://help.salesforce.com/s/articleView?id=sf.connected_app_overview.htm&type=5) の Salesforce ログイン情報と OAuth 認証情報を入力します。

   *ログイン URL* には、`https://login.salesforce.com/` または Salesforce ドメインのログイン URL を使用できます。

   ![Enter your Salesforce login and connected app OAuth credentials.](./using-objects-with-salesforce/images/04.png)

1. ［_保存_］をクリックします。

## Salesforce Storage Type で Liferay オブジェクトを作成する

Salesforceにデータを保存するためのLiferayオブジェクトの作成は、標準的なカスタムオブジェクトの作成と同じ標準的なプロセスに従います。 唯一の違いは、ドラフト作成時に _Salesforce_ ストレージタイプを選択する必要があることです。 これにより、Salesforce を外部ストレージとして使用するようにオブジェクトが構成されます。 [オブジェクトの作成](../../creating-and-managing-objects/creating-objects.md) を参照してください。

![Select the Salesforce storage type.](./using-objects-with-salesforce/images/05.png)

!!! note
    現在、Salesforce ストレージタイプは、カスタムの [フィールド](../../creating-and-managing-objects/fields.md)、[ビュー](../../creating-and-managing-objects/views.md)、および [レイアウト](../../creating-and-managing-objects/layouts.md) のみをサポートしています。

オブジェクトドラフトを作成したら、 [、Salesforce オブジェクトの各カスタムフィールドにフィールド](../../creating-and-managing-objects/fields/adding-fields-to-objects.md) を追加します。 データの損失を防ぐため、各フィールドが目的の Salesforce オブジェクトのカスタムフィールドに対応していることを確認してください。 次に、各フィールドを編集し、目的のSalesforceフィールドにリンクする外部参照コードを追加します。 各 ERC には、対応する Salesforce のカスタムフィールドの名前を使用します (例: `Title_c`、`Due_Date__c`)。

![Use the Salesforce field name for the external reference code.](./using-objects-with-salesforce/images/06.png)

いったん公開されると、LiferayオブジェクトのデータはSalesforceにのみ保存されます。 両システムは、ユーザーがリレーションシップのどちらかにエントリーを追加、更新、削除するたびに自動的に更新される。

## 関連トピック

* [オブジェクトの作成](../../creating-and-managing-objects/creating-objects.md)
* [フィールドの追加](../../creating-and-managing-objects/fields/adding-fields-to-objects.md)
