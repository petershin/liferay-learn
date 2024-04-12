# WebコンテンツAPIの基本

Liferay DXP RESTサービスを使用すると、サイトで構造化コンテンツを作成・管理することができます。 構造化コンテンツとは、Webコンテンツストラクチャーを使用する[Webコンテンツ](../web-content-articles/adding-a-basic-web-content-article.md) です。 ストラクチャーは、Webコンテンツの記事に含まれる作成者、概要、内容などの情報を定義します。 ストラクチャーにより、必要な情報がコンテンツにすべて含まれるようになります。 詳細については、 [Webコンテンツストラクチャーを理解する](../web-content-structures/understanding-web-content-structures.md)をご覧ください。

!!! note
   構造化コンテンツをレンダリングするために、[Webコンテンツテンプレート](../web-content-templates/creating-web-content-templates.md)でストラクチャーを使用できますが、構造化コンテンツの作成にテンプレートは必要ありません。

ストラクチャーや構造化コンテンツのcURLとJavaのサンプルについては以下を参照してください。 構造化コンテンツの管理に関するより詳細な例については、 [WebコンテンツAPIの詳細設定](./advanced-web-content-api.md)を参照してください。 Liferay DXPでのREST APIの使用については、 [RESTサービスの使用](../../../headless-delivery/consuming-apis/consuming-rest-services.md)をご覧ください。

## 環境のセットアップ

```{include} /_snippets/run-liferay-portal.md
```

次に、以下の手順を実行します。

1. [Web Content API Basics](./liferay-r4h9.zip) ファイルをダウンロードし、解凍します：

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/content-authoring-and-management/web-content/developer-guide/liferay-r4h9.zip -O
   ```

   ```bash
   unzip liferay-r4h9.zip
   ```

   !!! note
      これらのスクリプトは基本認証を使用し、テスト用に設計されています。 本番のLiferay DXP環境では、基本認証を使用しないでください。

1. 以下の手順で環境をセットアップします。

   1. [使用するサービスの特定](#identify-the-services-to-consume)
   1. [サイトIDを特定します。](#identify-the-site-id)

### 使用するサービスの特定

Webコンテンツの管理には、Liferay DXP Headless Delivery API で下記のサービスを使用します。

- Webコンテンツ記事用の`StructuredContent` 。
- Webコンテンツストラクチャー用の`ContentStructure`。
- Webコンテンツテンプレート用の`ContentTemplate` 。

このサービスと利用可能なHTTPメソッドを識別するには、Liferay APIエクスプローラーを使用します。 詳しくは、[RESTサービスの使用](../../../headless-delivery/consuming-apis/consuming-rest-services.md)を参照してください。

### サイトIDの特定

サイトIDの特定は、 [こちらの](../../../headless-delivery/consuming-apis/consuming-rest-services.md#identify-the-site-containing-the-data) の説明に従ってください。

### ユーザーインターフェースでの基本Webコンテンツ記事の作成

Webコンテンツを作成するには、Webコンテンツストラクチャーが必要です。 ユーザーインターフェースでストラクチャーを宣言せずにWebコンテンツを作成した場合、Liferay DXPでは、デフォルトの基本Webコンテンツストラクチャーを使用します。

!!! note
   基本Webコンテンツストラクチャーは、Liferay DXPのユーザーインターフェースには表示されません。

これらの例では、単一のテキストフィールドとデフォルトの基本Webコンテンツストラクチャーを持つ基本Webコンテンツ記事を使用しています。 以下の手順で、Webコンテンツを作成します。

1. サイトメニュー（![Site menu](../../../images/icon-menu.png)）を開き、 ［**Content & Data**］ &rarr; ［**Web Content**］ に移動します。
1. ［**Web Content**］ タブで、追加 (![Add](../../../images/icon-add.png))をクリックし、 ［**Basic Web Content**］ を選択します。

   ![Webコンテンツパネルから基本Webコンテンツ記事を作成する。](./web-content-api-basics/images/01.png)

1. 新しいWebコンテンツの名前として **Foo** を入力し、 ［**Publish**］ をクリックします。

   ![Webコンテンツ記事は、デフォルトで基本Webコンテンツストラクチャーを使用します。](./web-content-api-basics/images/02.png)

詳しくは、 [基本Webコンテンツ記事の追加](../web-content-articles/adding-a-basic-web-content-article.md)を参照してください。

## Webコンテンツ記事のサイトからの取得

次のcURLまたはJavaコマンドを実行すると、サイトのWebコンテンツ記事を取得できます。 `1234` をサイトのIDに置き換えてください。

### StructuredContents_GET_FromSite.sh

`StructuredContents_GET_FromSite.sh` cURLスクリプトは、サイトのすべてのWebコンテンツ記事を一覧表示します。 このスクリプトは、サイトIDを唯一のパラメーターとして、`GET` HTTPメソッドで`StructuredContent`サービスを使用します。

| メソッド  | サービス                | エンドポイント                                    |
|:----- |:------------------- |:------------------------------------------ |
| `GET` | `StructuredContent` | `/v1.0/sites/{siteID}/structured-contents` |

```bash
./StructuredContents_GET_FromSite.sh 1234
```

| パラメーター # | 説明       |
|:-------- |:-------- |
| `$1`     | `siteId` |

以下は、このスクリプトが生成するJSON出力の一部です。 この出力では、`id`と`friendlyUrlPath`のフレンドリーURLによって識別される単一のWebコンテンツ記事が表示されます。 Webコンテンツは、`contentStructureId`のストラクチャーを使用します。 ストラクチャーには、`contentFields`の`contentFieldValue`セクションで説明される単一のテキストフィールドがあります。 ストラクチャーにさらに多くの要素を含めると、これらの要素を説明する`contentFieldValue`セクションが追加で表示されます。

```json
{
  "actions" : {
    ...
  },
  "facets" : [ ],
  "items" : [ {
    "actions" : {
   ...
    },
    "availableLanguages" : [ "en-US" ],
    "contentFields" : [ {
      "contentFieldValue" : {
        "data" : ""
      },
      "dataType" : "string",
      "label" : "content",
      "name" : "content",
      "nestedContentFields" : [ ],
      "repeatable" : false
    } ],
    "contentStructureId" : 40697,
    "creator" : {
      "additionalName" : "",
      "contentType" : "UserAccount",
      "familyName" : "Bowman",
      "givenName" : "David",
      "id" : 20129,
      "name" : "David Bowman"
    },
    "customFields" : [ ],
    "dateCreated" : "2021-08-10T08:10:21Z",
    "dateModified" : "2021-08-10T08:10:21Z",
    "datePublished" : "2021-08-10T08:10:00Z",
    "description" : "",
    "externalReferenceCode" : "41537",
    "friendlyUrlPath" : "foo",
    "id" : 41539,
    "key" : "41537",
    "keywords" : [ ],
    "numberOfComments" : 0,
    "relatedContents" : [ ],
    "renderedContents" : [ {
      "contentTemplateId" : "BASIC-WEB-CONTENT",
      "contentTemplateName" : "Basic Web Content",
      "markedAsDefault" : true,
      "renderedContentURL" : "http://localhost:8080/o/headless-delivery/v1.0/structured-contents/41539/rendered-content/BASIC-WEB-CONTENT"
    } ],
    "siteId" : 20125,
    "subscribed" : false,
    "taxonomyCategoryBriefs" : [ ],
    "title" : "Foo",
    "uuid" : "162155dc-c9aa-96b0-df5c-a61c591d1389"
  } ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 1
}
```

JSON出力で以下の情報を確認します。

- 出力には、`id: 41539`、`title: Foo`、そしてフレンドリーURL `friendlyUrlPath: foo`で識別される単一の Webコンテンツ記事が表示されます。
- このWebコンテンツは、`contentStructureId`で特定されるデフォルトのLiferay DXP Webコンテンツストラクチャーを使用します。
- Webコンテンツストラクチャーには、`contentFields`の`contentFieldValue`セクションで説明される単一のテキストフィールドがあります。 ストラクチャーにさらに多くの要素を含めると、これらの要素を説明する`contentFieldValue`セクションが追加で表示されます。
- ユーザーインターフェースのWebコンテンツIDは、JSON出力の`キー`プロパティに対応します。

   ![JSONキープロパティは、ユーザーインターフェースにおける構造化コンテンツ識別子に相当します。](./web-content-api-basics/images/03.png)

### StructuredContents_GET_FromSite.java

`StructuredContents_GET_FromSite.java`クラスは、構造化コンテンツ関連サービスを呼び出してWebコンテンツの記事一覧を取得します。

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/java/StructuredContents_GET_FromSite.java
   :dedent: 1
   :language: java
   :lines: 11-26
```

このクラスは、わずか3行のコードでRESTサービスを呼び出します。

| 行（省略形）                                                                                               | 説明                                                                            |
|:---------------------------------------------------------------------------------------------------- |:----------------------------------------------------------------------------- |
| `StructuredContentResource.Builder builder = ...`                                                    | `Builder`を取得し、`StructuredContentResource`サービスインスタンスを生成します。                    |
| `StructuredContentResource structuredContentResource = builder.authentication(...).build();`         | 基本認証を指定し、`StructuredContentResource` サービスインスタンスを生成します。                        |
| `Page<StructuredContent> page = structuredContentResource.getSiteStructuredContentsPage(...);` | `structuredContentResource.getSiteStructuredContentsPage`メソッドを呼び出し、データを取得します。 |

プロジェクトには、依存関係として`com.liferay.headless.delivery.client.jar`ファイルが含まれていることに注意してください。 すべてのRESTアプリケーションのクライアントJAR依存関係情報は、`/o/api`でインストール先のAPIエクスプローラーで確認できます。

!!! note
   `main`メソッドのコメントでは、クラスの実行を実演しています。

他の例のJavaクラスはこれと類似していますが、異なる`StructuredContentResource`メソッドを呼び出します。

!!! important
   サービスの詳細は、 [StructuredContentResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-delivery/headless-delivery-client/src/main/java/com/liferay/headless/delivery/client/resource/v1_0/StructuredContentResource.java) を参照してください。

以下は、cURLとJavaを使って、他のRESTサービスを呼び出す例です。

## Webコンテンツ記事の取得

[前の手順の](#get-web-content-articles-from-site) スクリプトは、サイトのすべてのWebコンテンツ記事を返します。 特定の記事を取得するには、 `StructuredContent_GET_ById.[java|sh]`スクリプトを使用します。 `1234`をWebコンテンツ記事のIDに置き換えてください。

### StructuredContent_GET_ById.sh

コマンド：

```bash
./StructuredContent_GET_ById.sh 1234
```

コード：

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/curl/StructuredContent_GET_ById.sh
   :language: bash
```

### StructuredContent_GET_ById.java

コマンド：

```bash
java -classpath .:* -DstructuredContentId=1234 StructuredContent_GET_ById
```

コード：

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/java/StructuredContent_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-20
```

`StructuredContent`フィールドはJSONで表示されます。

## Webコンテンツストラクチャーの取得

次のcURLまたはJavaコマンドを実行すると、サイトのコンテンツストラクチャーを取得できます。 `1234`をサイトのIDに置き換えてください。

!!! note
   デフォルトの基本Webコンテンツストラクチャーは、このエンドポイントを使用すると表示されません。

### ContentStructures_GET_FromSite.sh

コマンド：

```bash
./ContentStructures_GET_FromSite.sh 1234
```

コード：

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/curl/ContentStructures_GET_FromSite.sh
   :language: bash
```

### ContentStructures_GET_FromSite.java

コマンド：

```bash
java -classpath .:* -DsiteId=1234 ContentStructures_GET_FromSite
```

コード：

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/java/ContentStructures_GET_FromSite.java
   :dedent: 1
   :language: java
   :lines: 11-26
```

サイトの`ContentStructure`オブジェクトは、JSONで表示されます。

## IDによるWebコンテンツストラクチャーの取得

サンプルのWebコンテンツ記事にあるデフォルトのWebコンテンツストラクチャーは、Liferay DXPのユーザーインターフェースでは表示されません。 しかし、`ContentStructure`サービスを使用すれば、ストラクチャーの説明を収集することができます。

`ContentStructure_GET_ById.[java|sh]`スクリプトは、Webコンテンツストラクチャーの説明を返します。

### ContentStructure_GET_ById.sh

| メソッド  | サービス               | エンドポイント                                         |
|:----- |:------------------ |:----------------------------------------------- |
| `GET` | `ContentStructure` | `/v1.0/content-structures/{contentStructureId}` |

```bash
./ContentStructure_GET_ById.sh 40697
```

| パラメーター # | 説明                   |
|:-------- |:-------------------- |
| $1       | `contentStructureId` |

以下は、JSON出力です。 Liferay DXPのデフォルトのWebコンテンツストラクチャーは、 `id`と`name`で識別できます。 `contentStructureFields`セクションには、ストラクチャー項目の説明が含まれています。 このストラクチャーには、タイプ `string` と名前 `content`の単一のコンテンツ項目が含まれていることに注目してください。 [基本Webコンテンツの記事の投稿](#post-a-basic-web-content-article) では、このコンテンツ項目に情報を追加して新規Webコンテンツ記事を作成します。

```json
{
  "availableLanguages" : [ "en-US" ],
  "contentStructureFields" : [ {
    "dataType" : "string",
    "label" : "content",
    "localizable" : true,
    "multiple" : false,
    "name" : "content",
    "nestedContentStructureFields" : [ ],
    "options" : [ ],
    "repeatable" : false,
    "required" : false,
    "showLabel" : true
  } ],
  "dateCreated" : "2021-08-09T23:30:23Z",
  "dateModified" : "2021-08-09T23:30:23Z",
  "description" : "Basic Web Content",
  "id" : 40697,
  "name" : "Basic Web Content",
  "siteId" : 20127
}
```

### ContentStructure_GET_ById.java

コマンド:

```bash
java -classpath .:* -DcontentStructureId=1234 ContentStructure_GET_ById
```

コード：

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/java/ContentStructure_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-20
```

`ContentStructure`フィールドは、JSONで表示されます。

## 基本的なWebコンテンツの記事の投稿

`StructuredContent_POST_ToSite[java|sh]`スクリプトを使って、新規Webコンテンツ記事を作成します。 `1234`をWebコンテンツストラクチャーIDに置き換えてください。 `5678`をサイトのIDに置き換えてください。

### StructuredContent_POST_ToSite.sh

`StructuredContent_POST_ToSite.sh`cURLスクリプトサンプルは、`POST`HTTPメソッドとデフォルトのWebコンテンツストラクチャーを使って新規Webコンテンツの記事を作成します。 このスクリプトでは、 [サイトID](#identifying-the-site-id) とストラクチャー`ID`をパラメーターとして使用しています。

| メソッド  | サービス                | エンドポイント                                    |
|:----- |:------------------- |:------------------------------------------ |
| `PUT` | `StructuredContent` | `/v1.0/sites/{siteId}/structured-contents` |

```bash
./StructuredContent_POST_ToSite.sh 20125 40697
```

cURLスクリプトのパラメーター：

| パラメーター # | 説明                   |
|:-------- |:-------------------- |
| $1       | `siteId`             |
| $2       | `contentStructureId` |

Liferay DXPで新規Webコンテンツの記事を見つけるには、サイトメニュー (![Site menu](../../../images/icon-menu.png))を開いて、 ［**コンテンツ & データ**］ &rarr; ［**Webコンテンツ**］ に移動します。

以下は、このスクリプトが生成するJSON出力の一部です。 このスクリプトは、ストラクチャー` contentField` `content`を参照として使用し、シンプルな `<p>Foo</p>` HTMLストリングを投稿します。

```json
{
  "actions" : {
    ...
  },
  "availableLanguages" : [ "en-US" ],
  "contentFields" : [ {
    "contentFieldValue" : {
      "data" : "<p>Foo</p>"
    },
    "dataType" : "string",
    "label" : "content",
    "name" : "content",
    "nestedContentFields" : [ ],
    "repeatable" : false
  } ],
  "contentStructureId" : 40697,
  "creator" : {
    "additionalName" : "",
    "contentType" : "UserAccount",
    "familyName" : "Bowman",
    "givenName" : "David",
    "id" : 20129,
    "name" : "David Bowman"
  },
  "customFields" : [ ],
  "dateCreated" : "2021-08-10T09:19:40Z",
  "dateModified" : "2021-08-10T09:19:40Z",
  "datePublished" : "2021-08-10T09:19:00Z",
  "description" : "",
  "externalReferenceCode" : "41569",
  "friendlyUrlPath" : "able-article",
  "id" : 41571,
  "key" : "41569",
  "keywords" : [ ],
  "numberOfComments" : 0,
  "relatedContents" : [ ],
  "renderedContents" : [ {
    "contentTemplateId" : "BASIC-WEB-CONTENT",
    "contentTemplateName" : "Basic Web Content",
    "markedAsDefault" : true,
    "renderedContentURL" : "http://localhost:8080/o/headless-delivery/v1.0/structured-contents/41571/rendered-content/BASIC-WEB-CONTENT"
  } ],
  "siteId" : 20125,
  "subscribed" : false,
  "taxonomyCategoryBriefs" : [ ],
  "title" : "Able Article",
  "uuid" : "c7005ffb-5677-e030-9eb9-9b1a24a85054"
}
```

### StructuredContent_POST_ToSite.java

`StructuredContent_POST_ToSite.java`クラスは、サービスに関連した構造化コンテンツを呼び出して、Webコンテンツ記事を追加します。

コマンド：

```bash
java -classpath .:* -DcontentStructureId=1234 -DsiteId=5678 StructuredContent_POST_ToSite
```

コード：

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/java/StructuredContent_POST_ToSite.java
   :dedent: 1
   :language: java
   :lines: 11-45
```

`StructuredContent`フィールドはJSONで表示されます。

## Webコンテンツ記事のパッチ適用

`StructuredContent`サービスで`PATCH`メソッドを使用して、Webコンテンツ記事を更新します。 `StructuredContent_PATCH_ById.[java|sh]`スクリプトは構造化コンテンツ識別子 `id`を使用して、記事のコンテンツを'Foo'から'Bar'に更新します。

### StructuredContent_PATCH_ById.sh

コマンド：

```bash
./StructuredContent_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/curl/StructuredContent_PATCH_ById.sh
   :language: bash
```

### StructuredContent_PATCH_ById.java

コマンド：

```bash
java -classpath .:* -DcontentStructureId=1234 -DstructuredContentId=5678 StructuredContent_PATCH_ById
```

コード:

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/java/StructuredContent_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 11-44
```

## Webコンテンツ記事の配置

`StructuredContent`サービスと共に`PUT`HTTPメソッドを使って、オリジナルのWebコンテンツ情報を置き換えることができます。 `StructuredContent_PUT_ById.[java|sh]`スクリプトはWebコンテンツやストラクチャー識別子を使用して、記事のコンテンツを`Bar`から`Goo`へ更新します。

### StructuredContent_PUT_ById.sh

コマンド：

```bash
./StructuredContent_PUT_ById.sh 1234
```

コード：

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/curl/StructuredContent_PUT_ById.sh
   :language: bash
```

### StructuredContent_PUT_ById.java

コマンド:

```bash
java -classpath .:* -DcontentStructureId=1234 -DstructuredContentId=5678 StructuredContent_PUT_ById
```

コード:

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/java/StructuredContent_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 11-45
```

## Webコンテンツ記事の削除

`StructuredContent`サービスで`DELETE`メソッドを使用して、Webコンテンツ記事を削除します。 `StructuredContent_DELETE_ById.java|sh]` スクリプトサンプルでは、Webコンテンツ`id`を使用してWebコンテンツを削除しています。

!!! important
   REST APIを使用してWebコンテンツを削除すると、[Liferay DXPゴミ箱](../../recycle-bin/recycle-bin-overview.md) を使用せずに、永久に削除されます。

### StructuredContent_DELETE_ById.sh

コマンド:

```bash
./StructuredContent_DELETE_ById.sh 1234
```

コード:

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/curl/StructuredContent_DELETE_ById.sh
   :language: bash
```

### StructuredContent_DELETE_ById.java

コマンド

```bash
java -classpath .:* -DstructuredContentId=1234 StructuredContent_DELETE_ById
```

コード：

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/java/StructuredContent_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## その他のWebコンテンツとWebコンテンツフォルダーのサービス

他のcURLコマンドとJavaクラスは、その他の `StructuredContent`と`StructuredContentFolder` サービスの詳細を示しています。 [WebコンテンツAPIの基本](./liferay-r4h9.zip) でそれらを確認できます。

| ファイル                                                           | 説明                              |
|:-------------------------------------------------------------- |:------------------------------- |
| `StructuredContentFolder_GET_ById.[java\|sh]`                 | Webコンテンツフォルダーのフィールドを一覧表示します。    |
| `StructuredContentFolders_GET_FromSite.[java\|sh]`            | サイト内のすべてのWebコンテンツフォルダーを一覧表示します。 |
| `StructuredContentFolder_POST_ToSite.[java\|sh]`              | Webコンテンツフォルダーをサイトに投稿します。        |
| `StructuredContentFolder_PATCH_ById.[java\|sh]`               | Webコンテンツフォルダーを更新します。            |
| `StructuredContentFolder_PUT_ById.[java\|sh]`                 | Webコンテンツフォルダーを置き換えます。           |
| `StructuredContentFolder_DELETE_ById.[java\|sh]`              | Webコンテンツフォルダーを削除します。            |
| `StructuredContent_POST_ToStructuredContentFolder.[java\|sh]` | Webコンテンツ記事をフォルダーに投稿します。         |

!!! important
   REST APIを使用してWebコンテンツフォルダーを削除すると、フォルダとそのコンテンツは [Liferay DXPゴミ箱](../../recycle-bin/recycle-bin-overview.md) を使わずに永久に削除されます。

## 関連情報

- [WebコンテンツAPIの詳細設定](./advanced-web-content-api.md)
- [RESTサービスの使用](../../../headless-delivery/consuming-apis/consuming-rest-services.md)
- [Webコンテンツストラクチャーを理解する](../web-content-structures/understanding-web-content-structures.md)