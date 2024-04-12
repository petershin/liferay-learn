# REST APIによるストラクチャーとテンプレートの管理

Webコンテンツストラクチャーとは、Webコンテンツの記事に含まれる情報を定義するものです。 ストラクチャーにより、Webコンテンツの作成・管理がしやすくなり、コンテンツに必要な情報がすべて確実に含まれるようにします。 ストラクチャーをWebコンテンツテンプレートに関連付けることができます。 テンプレートは、ページ上でコンテンツ項目がどのようにレンダリングされるかを決定します。 次の表は、Webコンテンツストラクチャーとテンプレートと共にLiferay DXP REST APIを使用して、利用可能なオプションをまとめたものです。

| 利用可能なオプション          | 利用不可のオプション     |
|:--------------------|:---------------|
| 構造体とテンプレートの情報を集める | 構造またはテンプレートの作成 |
| 構造体のアクセス権を置き換える   | 構造またはテンプレートの削除 |

ここでは、いくつかの [cURL](https://curl.haxx.se/) コードサンプルとともに、ビルド済みのLiferay DXP Dockerイメージを使って、構造化コンテンツの管理方法について学習していきます。 以下のトピックについて学習することができます。

* [環境の設定](#setting-up-your-environment)
* [消費するサービスの特定](#identifying-the-service-to-consume)
* [サイト構造の取得](#getting-the-web-content-structures)
* [サイト・テンプレートの取得](#getting-the-web-content-templates)
* [構造パーミッションの取得](#getting-the-web-content-structure-permissions)
* [構造パーミッションの置き換え](#replacing-the-web-content-structure-permissions)

## 環境のセットアップ

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順に従います。

1. [サンプルのプロジェクト](https://learn.liferay.com/dxp/latest/en/content-authoring-and-management/web-content/developer-guide/liferay-m7b1.zip) をダウンロードして解凍します。

   <!-- This project isn't in the repo -->

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/content-authoring-and-management/web-content/developer-guide/liferay-m7b1.zip -O
   ```

   ```bash
   unzip liferay-m7b1.zip
   ```

    ```{note}
    これらのスクリプトは基本認証を使用し、テスト用に設計されています。 本番のLiferay DXP環境では、基本認証を使用しないでください。
    ```
1. 以下の手順で環境をセットアップします。

   1. [サイトIDの特定](#identifying-the-site-id)
   1. [サンプル構造の作成](#create-a-sample-structure)
   1. [構造IDの特定](#identifying-the-structure-id)

### サイトIDの特定

1. サイトメニュー(![サイトメニュー](../../../images/icon-menu.png))を開き、 **設定** &rarr; **サイト設定** に進みます。
1. ［プラットフォーム］セクション下で、 ［**サイト設定**］ をクリックします。
1. ［Site ID］の下でサイト識別子を見つけます。

   ![Identify the Site ID under the Site Settings and Site Configuration option.](./managing-web-content-structures-and-templates-by-using-the-rest-api/images/01.png)

### ストラクチャーとテンプレートサンプルの作成

```{note}
REST API を使用して、構造またはテンプレートをプログラムで作成することはできません。
```

ストラクチャーを作成するには、 [ストラクチャーの作成](../web-content-structures/creating-structures.md) を参照してください。 テンプレートを作成するには、 [Webコンテンツテンプレートの作成](../web-content-templates/creating-web-content-templates.md) を参照し、サンプルストラクチャーを元にテンプレートを作成します。 このチュートリアルでは、単一のテキストフィールドを持つ基本的な構造体を使用して `ContentStructure` サービスをデモします。

![Basic sample Structure using a single Text field.](./managing-web-content-structures-and-templates-by-using-the-rest-api/images/02.png)

### サンプルストラクチャーとテンプレートの特定

1. サイトメニュー(![サイトメニュー](../../../images/icon-menu.png))を開き、 **コンテンツ＆データ** &rarr; **ウェブコンテンツ** に移動します。
1. **構造** タブをクリックする。
1. IDの欄で、ストラクチャーのIDを特定します。

   ![In the Structures tab, identify the ID for your Structure under the ID column.](./managing-web-content-structures-and-templates-by-using-the-rest-api/images/01.png)

また、プログラム的にストラクチャーIDを特定することも可能です。 詳しくは、 [REST APIによるストラクチャーとテンプレートの管理](./managing-web-content-structures-and-templates-by-using-the-rest-api.md) をご覧ください。

## 使用するサービスの特定

Web コンテンツの管理には、Liferay DXP Headless Delivery API の `StructuredContent` サービスを使用します。 このサービスとすべての異なるHTTPメソッドを識別するには、Liferay APIエクスプローラーを使用します。 詳しくは、 [RESTサービスの使用](../../../headless-delivery/consuming-apis/consuming-rest-services.md) を参照してください。

## サイトストラクチャーの取得

`ContentStructures_GET_FromSite.sh`cURLスクリプトは、既存のサイト構造を一覧表示します。 このスクリプトは `GET`HTTP メソッドで`ContentStructure` サービスを使用し、唯一のパラメータとしてサイト ID を使用します。

テーブル

| メソッド | サービス               | エンドポイント                                 |
| :--- | :----------------- | :-------------------------------------- |
| GET  | `ContentStructure` | /v1.0/sites/{siteId}/content-structures |

```bash
   ./ContentStructures_GET_FromSite.sh 20125
```

| パラメーター # | 説明       |
| :------- | :------- |
| $1       | `siteId` |

次のコードは、スクリプトが生成するJSON出力を示しています。 このスクリプトは、サイト内のすべてのストラクチャーを返します。 この例では、`id`と`name`で識別される1つの構造体を見ることができる。

```json
   {
    "actions" : { },
    "facets" : [ ],
    "items" : [ {
        "availableLanguages" : [ "en-US" ],
        "contentStructureFields" : [ {
        "dataType" : "string",
        "inputControl" : "text",
        "label" : "Text",
        "localizable" : true,
        "multiple" : false,
        "name" : "Text86549034",
        "nestedContentStructureFields" : [ ],
        "options" : [ ],
        "predefinedValue" : "",
        "repeatable" : false,
        "required" : false,
        "showLabel" : true
        } ],
        "creator" : {
        "additionalName" : "",
        "contentType" : "UserAccount",
        "familyName" : "Bowman",
        "givenName" : "David",
        "id" : 20129,
        "name" : "David Bowman"
        },
        "dateCreated" : "2021-08-02T13:15:42Z",
        "dateModified" : "2021-08-02T13:16:57Z",
        "description" : "",
        "id" : 41837,
        "name" : "Simple Structure",
        "siteId" : 20125
    } ],
    "lastPage" : 1,
    "page" : 1,
    "pageSize" : 20,
    "totalCount" : 1
   }
```

構造体には、`contentStructureFields`の`dataType`セクションで説明されている1つのテキストフィールドがあります。 Structureにさらに要素を含めると、`contentStructureFields`の下に追加のセクションが表示されます。 以下は、Textフィールド(`"dataType" : "string"`)とImageフィールド(`"dataType" : "image"`)を持つStructureの部分的なJSON出力である：

```json
{
  "actions": {},
  "facets": [],
  "items": [
    {
      "availableLanguages": ["en-US"],
      "contentStructureFields": [
        {
          "dataType": "string",
          "inputControl": "text",
          "label": "Text",
          "localizable": true,
          "multiple": false,
          "name": "Text86549034",
          "nestedContentStructureFields": [],
          "options": [],
          "predefinedValue": "",
          "repeatable": false,
          "required": false,
          "showLabel": true
        },
        {
          "dataType": "image",
          "label": "Image",
          "localizable": true,
          "multiple": false,
          "name": "Image96876678",
          "nestedContentStructureFields": [],
          "options": [],
          "predefinedValue": "{}",
          "repeatable": false,
          "required": false,
          "showLabel": true
        }
      ]
    }
  ]
}
```

## サイトテンプレートの取得

`ContentTemplates_GET_FromSite.sh`cURLスクリプトは、既存のサイトテンプレートを一覧表示します。 このスクリプトは `ContentTemplate`サービスを`GET` HTTP メソッドで使用し、唯一のパラメータとしてサイト ID を使用する。

テーブル

| メソッド | サービス              | エンドポイント                                |
| :--- | :---------------- | :------------------------------------- |
| GET  | `ContentTemplate` | /v1.0/sites/{siteId}/content-templates |

```bash
   ./ContentTemplates_GET_FromSite.sh 20125
```

cURLスクリプトのパラメーター：

| パラメーター # | 説明       |
| :------- | :------- |
| $1       | `siteId` |

以下は、このスクリプトが生成するJSON出力の一部です。 このスクリプトは、サイト内のすべてのテンプレートを返します。 この例では、`id`と`name`で識別される1つのテンプレートが表示されています。 `contentStructureId` は関連する構造 ID に対応し、`templateScript` はテンプレートを記述する FreeMarker テンプレート言語に対応します。

```json
{
  ...
    "availableLanguages" : [ "en-US" ],
    "contentStructureId" : 41837,
    "creator" : {
      "additionalName" : "",
      "contentType" : "UserAccount",
      "familyName" : "Bowman",
      "givenName" : "David",
      "id" : 20129,
      "name" : "David Bowman"
    },
    "dateCreated" : "2021-08-02T13:24:32Z",
    "dateModified" : "2021-08-02T14:33:24Z",
    "description" : "",
    "id" : "41847",
    "name" : "Simple Template",
    "programmingLanguage" : "ftl",
    "siteId" : 20125,
    "templateScript" : "<#if (Text86549034.getData())??>\n\t${Text86549034.getData()}\n</#if>"
  } ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 1
}
```

```{note}
テンプレートについての詳細は、 [ウェブ・コンテンツ・テンプレートの作成](../web-content-templates/creating-web-content-templates.md) をお読みください。
```
## ストラクチャー権限の取得

`ContentStructure_GET_Permissions.sh`cURLスクリプトは、Structureのパーミッションを一覧表示します。 このスクリプトは `ContentStructure`サービスを`GET` HTTP メソッドで使用し、構造体 ID を唯一のパラメータとして使用します。

| メソッド | サービス               | エンドポイント                                                     |
| :--- | :----------------- | :---------------------------------------------------------- |
| PUT  | `ContentStructure` | `/v1.0/content-structures/{contentStructureId}/permissions` |

```bash
   ./ContentStructure_GET_Permissions.sh 41837
```

cURLスクリプトのパラメーター：

| パラメーター # | 説明       |
| :------- | :------- |
| $1       | 構造体 `id` |

JSON出力には、`items`セクションの下のパーミッションが含まれる。 この例では、`roleName`にサンプルの構造体に対するパーミッションを持つRoleが1つだけあり、`actionIds`にパーミッションのリストがあります：

```json
{
  "actions": {
    "get": {
      "method": "GET",
      "href": "http://localhost:8080/o/headless-delivery/v1.0/content-structures/41837/permissions"
    },
    "replace": {
      "method": "PUT",
      "href": "http://localhost:8080/o/headless-delivery/v1.0/content-structures/41837/permissions"
    }
  },
  "facets": [],
  "items": [
    {
      "actionIds": ["DELETE", "PERMISSIONS", "UPDATE", "VIEW"],
      "roleName": "Owner"
    }
  ],
  "lastPage": 1,
  "page": 1,
  "pageSize": 2,
  "totalCount": 2
}
```

```{note}
パーミッションの管理方法については、[Webコンテンツ構造とテンプレートへのパーミッションの割り当て](../web-content-structures/assigning-permissions-to-structures-and-templates.md)を参照してください。
```

## ストラクチャー権限の置換

HTTP メソッド `PUT` を `ContentStructure` サービスと一緒に使って、元の Structure 権限を置き換える。 このスクリプトの例では、構造化コンテンツ識別子 `id` を使用して、パワーユーザー役割の `DELETE` と `VIEW` 権限を含めます：

| メソッド | サービス               | エンドポイント                                                     |
| :--- | :----------------- | :---------------------------------------------------------- |
| PUT  | `ContentStructure` | `/v1.0/content-structures/{contentStructureId}/permissions` |

```bash
   ./ContentStructure_PUT_Permissions.sh 41837
```

cURLスクリプトのパラメーター：

| パラメーター # | 説明       |
| :------- | :------- |
| $1       | 構造体 `id` |

JSONの出力では、`items`セクションの下に2つのエントリーが表示される：

```json
{
  "actions": {
    "get": {
      "method": "GET",
      "href": "http://localhost:8080/o/headless-delivery/v1.0/content-structures/41837/permissions"
    },
    "replace": {
      "method": "PUT",
      "href": "http://localhost:8080/o/headless-delivery/v1.0/content-structures/41837/permissions"
    }
  },
  "facets": [],
  "items": [
    {
      "actionIds": ["DELETE", "PERMISSIONS", "UPDATE", "VIEW"],
      "roleName": "Owner"
    },
    {
      "actionIds": ["DELETE", "VIEW"],
      "roleName": "Power User"
    }
  ],
  "lastPage": 1,
  "page": 1,
  "pageSize": 2,
  "totalCount": 2
}
```
