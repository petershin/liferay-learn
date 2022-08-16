# REST APIによるストラクチャーとテンプレートの管理

Webコンテンツストラクチャーとは、Webコンテンツの記事に含まれる情報を定義するものです。 ストラクチャーにより、Webコンテンツの作成・管理がしやすくなり、コンテンツに必要な情報がすべて確実に含まれるようにします。 ストラクチャーをWebコンテンツテンプレートに関連付けることができます。 テンプレートは、ページ上でコンテンツ項目がどのようにレンダリングされるかを決定します。 次の表は、Webコンテンツストラクチャーとテンプレートと共にLiferay DXP REST APIを使用して、利用可能なオプションをまとめたものです。

| 利用可能なオプション                | 利用不可のオプション                |
|:------------------------- |:------------------------- |
| <ul><li>ストラクチャーとテンプレートの情報収集</li><li>ストラクチャー権限の置換</li></ul> | <ul><li>ストラクチャーやテンプレートの作成</li><li>ストラクチャーやテンプレートの削除</li></ul> |

ここでは、いくつかの [cURL](https://curl.haxx.se/) コードサンプルとともに、ビルド済みのLiferay DXP Dockerイメージを使って、構造化コンテンツの管理方法について学習していきます。 以下のトピックについて学習することができます。

- [環境のセットアップ](#setting-up-your-environment)
- [使用するサービスの特定](#identifying-the-service-to-consume)
- [サイトストラクチャーの取得](#getting-the-site-structures)
- [サイトテンプレートの取得](#getting-the-site-templates)
- [ストラクチャー権限の取得](#getting-the-structure-permissions)
- [ストラクチャー権限の置換](#replacing-the-structure-permissions)

## 環境のセットアップ
```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順に従います。

1. [サンプルプロジェクト](https://learn.liferay.com/dxp/latest/en/content-authoring-and-management/web-content/developer-guide/liferay-m7b1.zip) をダウンロードし、解凍します：

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/content-authoring-and-management/web-content/developer-guide/liferay-m7b1.zip -O
    ```

    ```bash
    unzip liferay-m7b1.zip
    ```

    ```{note}
    これらのスクリプトは基本認証を使用し、テスト用に設計されています。 本番のLiferay DXP環境では、基本認証を使用しないでください。
    ```

1. 以下の手順で環境をセットアップします。

   1. [サイトIDを特定します。](#identifying-the-site-id)
   1. [サンプルストラクチャーを作成します。](#create-a-sample-structure)
   1. [ストラクチャーIDを特定します。](#identifying-the-structure-id)

### サイトIDの特定

1. サイトメニュー（![Site menu](../../../images/icon-menu.png)）を開き、 ［**Configuration**］ &rarr; ［**Site Settings**］ に移動します。
1. ［プラットフォーム］セクションで、 ［**Site Configuration**］ をクリックします。
1. サイトIDの下でサイト識別子を見つけます。

   ![［サイト設定］と［Site Configuration］オプションでサイトIDを特定します。](./managing-structures-and-templates-by-using-the-rest-api/images/01.png)

### ストラクチャーとテンプレートサンプルの作成

```{note}
REST APIを使用してプログラム的にストラクチャーとテンプレートを作成することはできません。
```

ストラクチャーを作成するには、[ストラクチャーの作成](../web-content-structures/creating-structures.md)を参照してください。 テンプレートを作成するには、 [Webコンテンツテンプレートの作成](../web-content-templates/creating-web-content-templates.md)を参照し、サンプルストラクチャーを元にテンプレートを作成します。 このチュートリアルでは、1つのテキストフィールドを持つ基本的なストラクチャーを使用して、`ContentStructure` サービスを実演します。

![単一のテキストフィールドを使用した基本的なサンプルストラクチャーです。](./managing-structures-and-templates-by-using-the-rest-api/images/02.png)

### サンプルストラクチャーとテンプレートの特定

1. サイトメニュー（![Site menu](../../../images/icon-menu.png)）を開き、 ［**コンテンツ & データ**］ &rarr; ［**Webコンテンツ**］ に移動します。
1. ［**ストラクチャー**］ タブをクリックします。
1. IDの欄で、ストラクチャーのIDを特定します。

   ![［ストラクチャー］タブで、ID欄の下にあるストラクチャーの IDを確認します。](./managing-structures-and-templates-by-using-the-rest-api/images/01.png)

また、プログラム的にストラクチャーIDを特定することも可能です。 詳しくは、 [REST APIによるストラクチャーとテンプレートの管理](./managing-structures-and-templates-by-using-the-rest-api.md)をご覧ください。

## 使用するサービスの特定

Webコンテンツの管理には、Liferay DXP Headless Delivery API の`StructuredContent`サービスを使用します。 このサービスとすべての異なるHTTPメソッドを識別するには、Liferay APIエクスプローラーを使用します。 詳しくは、 [RESTサービスの使用](../../../headless-delivery/consuming-apis/consuming-rest-services.md)を参照してください。

## サイトストラクチャーの取得

`ContentStructures_GET_FromSite.sh`cURLスクリプトは、既存のサイトストラクチャーを一覧表示します。 このスクリプトは、サイトIDを唯一のパラメーターとして、`GET` HTTPメソッドで`ContentStructure`サービスを使用します。

テーブル
| メソッド | サービス               | エンドポイント                                 |
|:---- |:------------------ |:--------------------------------------- |
| GET  | `ContentStructure` | /v1.0/sites/{siteId}/content-structures |

```bash
   ./ContentStructures_GET_FromSite.sh 20125
```

| パラメーター # | 説明       |
|:-------- |:-------- |
| $1       | `siteId` |

次のコードは、スクリプトが生成するJSON出力を示しています。 このスクリプトは、サイト内のすべてのストラクチャーを返します。 この例では、 `id` と `name`で識別される単一のストラクチャーを確認できます。

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

ストラクチャーには、 `contentStructureFields`の`dataType`セクションで説明される単一のテキストフィールドがあります。 ストラクチャーにさらに要素を含めると、 `contentStructureFields`の下に追加のセクションが表示されます。 以下は、テキストフィールド（`"dataType" : "string"`）と画像フィールド（`"dataType" : "image"`）を持つストラクチャーのJSON出力部分です。

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
        }, {
        "dataType" : "image",
        "label" : "Image",
        "localizable" : true,
        "multiple" : false,
        "name" : "Image96876678",
        "nestedContentStructureFields" : [ ],
        "options" : [ ],
        "predefinedValue" : "{}",
        "repeatable" : false,
        "required" : false,
        "showLabel" : true
        } ],
```

## サイトテンプレートの取得

`ContentTemplates_GET_FromSite.sh`cURLスクリプトは、既存のサイトテンプレートを一覧表示します。 このスクリプトは、サイトIDを唯一のパラメーターとして、`GET` HTTPメソッドで`ContentTemplate`サービスを使用します。

テーブル
| メソッド | サービス              | エンドポイント                                |
|:---- |:----------------- |:-------------------------------------- |
| GET  | `ContentTemplate` | /v1.0/sites/{siteId}/content-templates |

```bash
   ./ContentTemplates_GET_FromSite.sh 20125
```

cURLスクリプトのパラメーター：

| パラメーター # | 説明       |
|:-------- |:-------- |
| $1       | `siteId` |

以下は、このスクリプトが生成するJSON出力の一部です。 このスクリプトは、サイト内のすべてのテンプレートを返します。 この例では、 `id` と `name`で識別される単一のテンプレートを確認できます。 `contentStructureId` は関連するストラクチャーIDに、 `templateScript` はテンプレートを記述したFreeMarker テンプレート言語に対応します。

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
テンプレートについて詳しくは、[Webコンテンツテンプレートの作成](../web-content-templates/creating-web-content-templates.md)をご覧ください。
```

## ストラクチャー権限の取得

`ContentStructure_GET_Permissions.sh` cURLスクリプトは、ストラクチャーの権限を一覧表示します。 このスクリプトは、ストラクチャーIDを唯一のパラメーターとして、`GET` HTTPメソッドで`ContentStructure`サービスを使用します。

| メソッド | サービス               | エンドポイント                                                     |
|:---- |:------------------ |:----------------------------------------------------------- |
| PUT  | `ContentStructure` | `/v1.0/content-structures/{contentStructureId}/permissions` |

```bash
   ./ContentStructure_GET_Permissions.sh 41837
```

cURLスクリプトのパラメーター：

| パラメーター # | 説明           |
|:-------- |:------------ |
| $1       | ストラクチャー `id` |

JSON出力には、`items`セクションの下に権限が含まれます。 この例では、 `roleName`にサンプルストラクチャーの権限を持つロールが1つだけあり、 `actionIds`に権限リストがあります 。

```json
    {
    "actions" : {
        "get" : {
        "method" : "GET",
        "href" : "http://localhost:8080/o/headless-delivery/v1.0/content-structures/41837/permissions"
        },
        "replace" : {
        "method" : "PUT",
        "href" : "http://localhost:8080/o/headless-delivery/v1.0/content-structures/41837/permissions"
        }
    },
    "facets" : [ ],
    "items" : [ {
        "actionIds" : [ "DELETE", "PERMISSIONS", "UPDATE", "VIEW" ],
        "roleName" : "Owner"
    } ],
    "lastPage" : 1,
    "page" : 1,
    "pageSize" : 2,
    "totalCount" : 2
    }
```

```{note}
権限の管理方法については、[Webコンテンツストラクチャーとテンプレートへのアクセス許可の割り当て](../web-content-structures/assigning-permissions-to-structures-and-templates.md) をご覧ください。
```

## ストラクチャー権限の置換

`PUT`HTTPメソッドで、 `ContentStructure`サービスを使って、オリジナルのストラクチャー権限を置き換えることができます。 このスクリプトの例では、構造化コンテンツ識別子 `id` を使用して、パワーユーザーロールの `DELETE` と `VIEW` 権限を含んでいます。

| メソッド | サービス               | エンドポイント                                                     |
|:---- |:------------------ |:----------------------------------------------------------- |
| PUT  | `ContentStructure` | `/v1.0/content-structures/{contentStructureId}/permissions` |

```bash
   ./ContentStructure_PUT_Permissions.sh 41837
```

cURLスクリプトのパラメーター：

| パラメーター # | 説明           |
|:-------- |:------------ |
| $1       | ストラクチャー `id` |

JSON出力では、 `items` セクションの下に、各ロールについて2つのエントリーが表示されます。

```json
    {
    "actions" : {
        "get" : {
        "method" : "GET",
        "href" : "http://localhost:8080/o/headless-delivery/v1.0/content-structures/41837/permissions"
        },
        "replace" : {
        "method" : "PUT",
        "href" : "http://localhost:8080/o/headless-delivery/v1.0/content-structures/41837/permissions"
        }
    },
    "facets" : [ ],
    "items" : [ {
        "actionIds" : [ "DELETE", "PERMISSIONS", "UPDATE", "VIEW" ],
        "roleName" : "Owner"
    }, {
        "actionIds" : [ "DELETE", "VIEW" ],
        "roleName" : "Power User"
    } ],
    "lastPage" : 1,
    "page" : 1,
    "pageSize" : 2,
    "totalCount" : 2
    }
```
