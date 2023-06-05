# WebコンテンツAPIの詳細設定

Liferay DXP RESTサービスを使用すると、サイトの構造化コンテンツを作成・管理することができます。 構造化コンテンツとは、Webコンテンツストラクチャーを使用する[Webコンテンツ](../web-content-articles/adding-a-basic-web-content-article.md) です。 ストラクチャーは、Webコンテンツの記事に含まれる作成者、概要、内容などの情報を定義します。 ストラクチャーにより、必要な情報がコンテンツにすべて含まれるようになります。 ストラクチャーの詳細については、 [Webコンテンツストラクチャーを理解する](../web-content-structures/understanding-web-content-structures.md)をご覧ください。

ここでは、いくつかの [cURL](https://curl.haxx.se/) コードサンプルとともに、ビルド済みのLiferay DXP Dockerイメージを使って、ストラクチャーと構造化コンテンツについて学習していきます。 Liferay DXPでのREST APIの使用については、 [RESTサービスの使用](../../../headless-delivery/consuming-apis/consuming-rest-services.md)をご覧ください。

```{note}
WebコンテンツAPI の概要については、[WebコンテンツAPIの基本](./web-content-api-basics.md) をご覧ください。
```

## 環境のセットアップ

```{include} /_snippets/run-liferay-dxp.md
```

次に、 [サンプルプロジェクト](https://learn.liferay.com/dxp/latest/en/content-authoring-and-management/web-content/developer-guide/liferay-m7b2.zip) をダウンロードし、解凍してください：

```bash
curl https://learn.liferay.com/dxp/latest/en/content-authoring-and-management/web-content/developer-guide/liferay-m7b2.zip -O
```

```bash
unzip liferay-m7b2.zip
```

```{note}
これらのスクリプトは基本認証を使用し、テスト用に設計されています。 本番のLiferay DXP環境では、基本認証を使用しないでください。
```

### サイトIDを特定します。

1. サイトメニュー(![Site menu](../../../images/icon-menu.png)）を開き、 ［**Configuration**］ &rarr; ［**Site Settings**］ に移動します。
1. ［プラットフォーム］セクションで、 ［**Site Configuration**］ をクリックします。 Liferay DXPバージョン7.3以前の場合は、 **一般** タブをクリックします。
1. ［Site ID］の下でサイト識別子を見つけます。

   ![［サイト設定］と［Site Configuration］オプションでサイトIDを特定します。](./advanced-web-content-api/images/05.png)

### Liferay DXPに画像を追加する

ここでは、画像を含むさまざまなコンテンツフィールドを含むWebコンテンツの記事を扱います。 サンプルのWebコンテンツ記事にこれらの画像を追加するには、次の手順に従います。

1. サイトメニュー(![Site menu](../../../images/icon-menu.png))を開き、 ［**コンテンツ & データ**］ &rarr; ［**ドキュメントとメディア**］ に移動します。
1. **追加** ボタン(![Add](../../../images/icon-add.png)）をクリックし、 ［**複数ファイルのアップロード**］ を選択します。
1. `foo.png`、`bar.png`、`goo.png`イメージを [サンプルプロジェクトフォルダー](https://learn.liferay.com/dxp/latest/en/content-authoring-and-management/web-content/developer-guide/liferay-m7b2.zip) からドロップエリアにドラッグ＆ドロップします。
1. ［**公開**］ をクリックします。

また、 `Document_POST_ToSite.sh`スクリプトを使って、REST API`ドキュメント`サービスにより、それぞれの画像を別々にポストすることも可能です。

```bash
curl \
    -F "file=@${1}" \
    -H "Content-Type: multipart/form-data" \
    -X POST \
    "http://localhost:8080/o/headless-delivery/v1.0/sites/${2}/documents" \
    -u "test@liferay.com:learn"
```

この例では、 相対画像ファイルパスとサイトIDをパラメーターとして使用して、`foo.png` の画像を投稿しています。

| メソッド | サービス       | エンドポイント                      |
|:---- |:---------- |:---------------------------- |
| GET  | `Document` | `/v1.0/sites/${2}/documents` |

```bash
./Document_POST_ImageToSite.sh "../images/foo.png" 20125
```

| パラメーター # | 説明         |
|:-------- |:---------- |
| $1       | ファイルへの相対パス |
| $2       | `siteId`   |

JSON出力には、`id`フィールドに画像識別子が含まれます。

```json
{
  ...
  "encodingFormat" : "image/png",
  "externalReferenceCode" : "44339",
  "fileExtension" : "png",
  "id" : 44339,
  ...
  "title" : "foo.png"
}
```

REST APIを使ったドキュメントの操作については、 [ドキュメントAPIの基本](../../documents-and-media/developer-guide/document-api-basics.md)を参照してください。

### サンプルストラクチャーの作成

```{note}
REST APIを使用してプログラム的にWebコンテンツストラクチャーを作成することはできません。
```

1. サイトメニュー(![Site menu](../../../images/icon-menu.png)）を開き、 ［**Content & Data**］ &rarr; ［**Web Content**］ に移動します。
1. ［**ストラクチャー**］ タブを選択し、 **追加** ボタン(![Add](../../../images/icon-add.png)）をクリックします。
1. 以下の内容で、新しいWebコンテンツストラクチャーを作成します。

    - 名前： `Foo`
    - フィールド(この順で）：`Text`、`Image`、`Date`、`Single Selection`

1. ［Single Selection］フィールドには、これらの値を使用します。

   - 第一のオプション値：`Foo`
   - 第二のオプション値：`Goo`

   ![ユーザーインターフェースで新しいWebコンテンツストラクチャーを作成します。](./advanced-web-content-api/images/01.png)

1. 各ストラクチャー項目をクリックし、そのフィールド参照値を更新します(下表参照）。 フィールド参照値は、サイドバーの［Advanced］セクションにあります。

1. ［**Save**］ をクリックします。

  | 項目       | 新規フィールド参照値                 |
  |:-------- |:-------------------------- |
  | テキストボックス | `TextReference`            |
  | 画像       | `ImageReference`           |
  | 日付       | `DateReference`            |
  | 選択       | `SingleSelectionReference` |

  ![ストラクチャー項目フィールド参照値を更新する。](./advanced-web-content-api/images/03.gif)

詳細は、[ストラクチャーの作成](../web-content-structures/creating-structures.md)を参照してください。

### サンプルテンプレートの作成

```{note}
REST APIを使用してプログラム的にWeb コンテンツ テンプレートを作成することはできません。
```

ストラクチャーの `image`フィールドを含むWebコンテンツテンプレートを作成します。

1. サイトメニュー(![Site menu](../../../images/icon-menu.png)）を開き、 ［**Content & Data**］ &rarr; ［**Web Content**］ に移動します。
1. ［**Templates**］ タブを選択し、 **追加** ボタン(![Add](../../../images/icon-add.png)）をクリックします。
1. テンプレート名として **Foo** をタイプします。
1. ［Properties］サイドパネルから、［Structure］フィールドの横にある **追加** ボタン(![Add](../../../images/icon-plus.png))をクリックします。

   ![ストラクチャー項目の横にある追加ボタンをクリックすると、テンプレートがストラクチャーにリンクされます。](./advanced-web-content-api/images/06.png)

1. **Foo** Webコンテンツストラクチャーを [前のセクション](#create-the-structure-sample) から選択します。
1. FreeMarkerエディターに含まれるデフォルトの`<#-- --> `ブロックコメントを削除します。
1. サイドバーで、 **Elements**(![Elements](../../../images/icon-list-ul.png))をクリックします。
1. ［Fields］グループで、 ［**Text**］ 、 ［**Image**］ 、 ［**Date**］ 、 ［**Single Selection**］ フィールドをクリックし、自分のテンプレートに追加します。 FreeMarkerエディターで、各フィールドが新しい行で始まることを確認します。

   ![FreeMarkerエディターでWebコンテンツテンプレートのフィールドを編集します。](./advanced-web-content-api/images/07.gif)

1. ［**Save**］ をクリックします。

ストラクチャーの`image`フィールドを含まない第二のWebコンテンツテンプレートを作成します。

1. ［Templates］タブで、 **アクション** ボタン(![Actions](../../../images/icon-actions.png))をクリックし、 ［**Copy**］ を選択します。

   ![**Actions** メニューを使用して、最初のテンプレートをコピーします。](./advanced-web-content-api/images/10.png)

1. テンプレートの名前を **Goo** に更新し、 ［**Copy**］ をクリックします。

   ![テンプレートの名前を"Goo"に更新します。](./advanced-web-content-api/images/09.png)

1. ［テンプレート］タブで、新規の ［**Goo**］ テンプレートをクリックします。
1. テンプレートエディターで、FreeMarkerスクリプトから画像情報 `<#if (ImageReference.getData())></#if>`を削除します。

   ![テンプレートから画像情報を削除します。](./advanced-web-content-api/images/11.gif)

1. ［**Save**］ をクリックします。

 詳しくは、 [Webコンテンツテンプレートの作成](../web-content-templates/creating-web-content-templates.md)を参照してください。

## WebコンテンツストラクチャーIDの取得

既存のすべてのサイト構造を返すには、 `ContentStructures_GET_FromSite.sh`スクリプトを使用します。 このスクリプトでは、`ContentStructure`サービスが`GET` HTTPメソッドおよび [サイトID](#identify-the-site-id) パラメーターと共に使用されています。

| メソッド | サービス               | エンドポイント                               |
|:---- |:------------------ |:------------------------------------- |
| GET  | `ContentStructure` | `/v1.0/sites/${1}/content-structures` |

```bash
./ContentStructures_GET_FromSite.sh 20125
```

| パラメーター # | 説明       |
|:-------- |:-------- |
| $1       | `siteId` |

このコードはスクリプトのJSON出力を示しており、Webコンテンツストラクチャー`id` (`"id" : 43563`) と `name` (`"name" : "Foo"`)が確認できることを示しています。 `contentStructureFields`セクションでは、ストラクチャー項目について説明しています。 このストラクチャーは、`TextReference`、`ImageReference`、`DateReference`、`SingleSelectionReference`という4種類のフィールドを含んでいます。

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
      "name" : "TextReference",
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
      "name" : "ImageReference",
      "nestedContentStructureFields" : [ ],
      "options" : [ ],
      "predefinedValue" : "{}",
      "repeatable" : false,
      "required" : false,
      "showLabel" : true
    }, {
      "dataType" : "date",
      "label" : "Date",
      "localizable" : true,
      "multiple" : false,
      "name" : "DateReference",
      "nestedContentStructureFields" : [ ],
      "options" : [ ],
      "predefinedValue" : "",
      "repeatable" : false,
      "required" : false,
      "showLabel" : true
    }, {
      "dataType" : "string",
      "inputControl" : "radio",
      "label" : "Single Selection",
      "localizable" : true,
      "multiple" : false,
      "name" : "SingleSelectionReference",
      "nestedContentStructureFields" : [ ],
      "options" : [ {
        "label" : "Foo",
        "value" : "Option13142925"
      }, {
        "label" : "Goo",
        "value" : "Option50805674"
      } ],
      "predefinedValue" : "[]",
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
    "dateCreated" : "2021-08-25T07:52:46Z",
    "dateModified" : "2021-08-25T08:01:58Z",
    "description" : "",
    "id" : 43563,
    "name" : "Foo",
    "siteId" : 20125
  } ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 1
}
```

## 画像IDの取得

[以前投稿した](#adding-the-images-to-liferay-dxp) 画像のIDを取得するには、`Documents_GET_FromSite.sh`スクリプトを使用します。 このスクリプトでは、 `Document`サービスが、 `GET` HTTPメソッドおよび [サイトID](#identify-the-site-id) パラメーターと共に使用されています。

| メソッド | サービス       | エンドポイント                      |
|:---- |:---------- |:---------------------------- |
| GET  | `Document` | `/v1.0/sites/${1}/documents` |

```bash
./Documents_GET_FromSite.sh 20125
```

| パラメーター # | 説明       |
|:-------- |:-------- |
| $1       | `siteId` |

## Webコンテンツテンプレートの取得

`ContentTemplates_GET_FromSite`スクリプトを使用して、サイトのすべてのテンプレートを取得します。 このスクリプトでは、`ContentTemplate` サービスが、 `GET` HTTPメソッドと [サイトID](#identify-the-site-id) パラメーターと共に使用されています。

| メソッド | サービス              | エンドポイント                              |
|:---- |:----------------- |:------------------------------------ |
| GET  | `ContentTemplate` | `/v1.0/sites/${1}/content-templates` |

```bash
./ContentTemplates_GET_FromSite.sh 20125
```

| パラメーター # | 説明       |
|:-------- |:-------- |
| $1       | `siteId` |

以下は、このスクリプトからのJSON出力です。 以下の情報を参照してください：

- このJSON出力には、2種類のテンプレートがあります。 `"name": "Foo"`と`"name": "Goo"`.
- `contentStructureId`フィールドは、テンプレートにリンクされているWebコンテンツストラクチャーを示します。
- `templateScript`には、`programmingLanguage`で指定された言語のスクリプトが含まれていません。 この例では、FreeMarkerが言語となります。
- `Foo`テンプレートの`templateScript`フィールドには、`<#if (ImageReference.getData())></#if>`で参照される画像フィールドが含まれています。 `Goo`テンプレートの`templateScript`フィールドには、この参照は含まれていません。

```json
{
  "actions" : {
    "get" : {
      "method" : "GET",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/20125/content-templates"
    }
  },
  "facets" : [ ],
  "items" : [ {
    "actions" : {
      "get" : {
        "method" : "GET",
        "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/20125/content-templates/{contentTemplateId}"
      }
    },
    "availableLanguages" : [ "en-US" ],
    "contentStructureId" : 43563,
    "creator" : {
      "additionalName" : "",
      "contentType" : "UserAccount",
      "familyName" : "Bowman",
      "givenName" : "David",
      "id" : 20129,
      "name" : "David Bowman"
    },
    "dateCreated" : "2021-08-25T13:39:20Z",
    "dateModified" : "2021-08-25T13:39:20Z",
    "description" : "",
    "id" : "43823",
    "name" : "Foo",
    "programmingLanguage" : "ftl",
    "siteId" : 20125,
    "templateScript" : "<#if (TextReference.getData())??>\n\t${TextReference.getData()}\n</#if>\n<#if (ImageReference.getData())?? && ImageReference.getData() != \"\">\n\t<img alt=\"${ImageReference.getAttribute(\"alt\")}\" data-fileentryid=\"${ImageReference.getAttribute(\"fileEntryId\")}\" src=\"${ImageReference.getData()}\" />\n</#if>\n<#assign DateReference_Data = getterUtil.getString(DateReference.getData())>\n\n<#if validator.isNotNull(DateReference_Data)>\n\t<#assign DateReference_DateObj = dateUtil.parseDate(\"yyyy-MM-dd\", DateReference_Data, locale)>\n\n\t${dateUtil.getDate(DateReference_DateObj, \"dd MMM yyyy - HH:mm:ss\", locale)}\n</#if>\n<#if (SingleSelectionReference.getData())??>\n\t${SingleSelectionReference.getData()}\n</#if>"
  }, {
    "actions" : {
      "get" : {
        "method" : "GET",
        "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/20125/content-templates/{contentTemplateId}"
      }
    },
    "availableLanguages" : [ "en-US" ],
    "contentStructureId" : 43563,
    "creator" : {
      "additionalName" : "",
      "contentType" : "UserAccount",
      "familyName" : "Bowman",
      "givenName" : "David",
      "id" : 20129,
      "name" : "David Bowman"
    },
    "dateCreated" : "2021-08-26T10:10:22Z",
    "dateModified" : "2021-08-26T14:08:53Z",
    "description" : "",
    "id" : "44177",
    "name" : "Goo",
    "programmingLanguage" : "ftl",
    "siteId" : 20125,
    "templateScript" : "<#if (TextReference.getData())??>\n\t${TextReference.getData()}\n</#if>\n<#assign DateReference_Data = getterUtil.getString(DateReference.getData())>\n\n<#if validator.isNotNull(DateReference_Data)>\n\t<#assign DateReference_DateObj = dateUtil.parseDate(\"yyyy-MM-dd\", DateReference_Data, locale)>\n\n\t${dateUtil.getDate(DateReference_DateObj, \"dd MMM yyyy - HH:mm:ss\", locale)}\n</#if>\n<#if (SingleSelectionReference.getData())??>\n\t${SingleSelectionReference.getData()}\n</#if>"
  } ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 2
}
```

### IDによるWebコンテンツテンプレートの取得

[上記の](#getting-the-web-content-templates) スクリプトは、サイトのすべてのWebコンテンツテンプレートを収集しますが、そのIDを参照することで特定のテンプレートに関する情報を取得することができます。 このためには、 `ContentTemplate_GET_ById.sh`cURLスクリプトを使用してください。 このスクリプトは、サイトIDとテンプレートIDのパラメーターを使用します。

| メソッド | サービス              | エンドポイント                                   |
|:---- |:----------------- |:----------------------------------------- |
| GET  | `ContentTemplate` | `/v1.0/sites/${1}/content-templates/${2}` |

```bash
./ContentTemplate_GET_ById.sh 20125 43823
```

| パラメーター # | 説明         |
|:-------- |:---------- |
| $1       | `siteId`   |
| $2       | テンプレート`id` |

## Webコンテンツの記事を投稿する

`StructuredContent_POST_ToSite.sh`cURLスクリプトは、`POST`HTTPメソッドと [以前に作成した](#create-the-sample-structure) サンプルストラクチャーを使って新規Webコンテンツの記事を作成します。 このスクリプトでは、 [サイトID](#identifying-the-site-id) 、ストラクチャーID、 foo.pngの [画像ID](#getting-the-images-ids) をパラメーターとして使用しています。

| メソッド | サービス                | エンドポイント                                    |
|:---- |:------------------- |:------------------------------------------ |
| PUT  | `StructuredContent` | `/v1.0/sites/{siteId}/structured-contents` |

```bash
./StructuredContent_POST_ToSite.sh 20125 43563 43795
```

cURLスクリプトのパラメーター：

| パラメーター # | 説明                   |
|:-------- |:-------------------- |
| $1       | `siteId`             |
| $2       | `contentStructureId` |
| $3       | 画像`id`               |

Liferay DXPで新規Webコンテンツの記事を見つけるには、 **サイトメニュー**(![Site menu](../../../images/icon-menu.png))を開いて、 ［**コンテンツ & データ**］ &rarr; ［**Webコンテンツ**］ に移動します。

![POST HTTPメソッドによるWebコンテンツ記事。](./advanced-web-content-api/images/08.png)

以下は、このスクリプトからのJSON出力です。 スクリプトは以下を投稿します。

- `"title" : "Able"`という名前の新規Webコンテンツの記事
- 記事の本文を定義している下記4つの`contentFields`の値
  - `TextReference`内の文字列。
  - `ImageReference`内の画像。
  - `DateReference`内の日付情報。
  - `SingleSelectionReference`内のラジオボタンコントロール。

```json
{
  "actions" : {
    ...
  },
  "availableLanguages" : [ "en-US" ],
  "contentFields" : [ {
    "contentFieldValue" : {
      "data" : "This text describes Foo."
    },
    "dataType" : "string",
    "inputControl" : "text",
    "label" : "Text",
    "name" : "TextReference",
    "nestedContentFields" : [ ],
    "repeatable" : false
  }, {
    "contentFieldValue" : {
      "image" : {
        "contentType" : "Document",
        "contentUrl" : "/documents/20125/0/foo.png/50956e56-9571-8f73-ae6e-9fca20fe0e3a?t=1629897455431",
        "description" : "This text describes Foo's image.",
        "encodingFormat" : "image/png",
        "fileExtension" : "png",
        "id" : 43795,
        "sizeInBytes" : 6232,
        "title" : "Foo"
      }
    },
    "dataType" : "image",
    "label" : "Image",
    "name" : "ImageReference",
    "nestedContentFields" : [ ],
    "repeatable" : false
  }, {
    "contentFieldValue" : {
      "data" : "2021-08-30T00:00:00Z"
    },
    "dataType" : "date",
    "label" : "Date",
    "name" : "DateReference",
    "nestedContentFields" : [ ],
    "repeatable" : false
  }, {
    "contentFieldValue" : {
      "data" : "Foo"
    },
    "dataType" : "string",
    "inputControl" : "radio",
    "label" : "Single Selection",
    "name" : "SingleSelectionReference",
    "nestedContentFields" : [ ],
    "repeatable" : false
  } ],
  "contentStructureId" : 43563,
  "creator" : {
    "additionalName" : "",
    "contentType" : "UserAccount",
    "familyName" : "Bowman",
    "givenName" : "David",
    "id" : 20129,
    "name" : "David Bowman"
  },
  "customFields" : [ ],
  "dateCreated" : "2021-08-26T06:14:06Z",
  "dateModified" : "2021-08-26T06:14:06Z",
  "datePublished" : "2021-08-26T06:14:00Z",
  "description" : "",
  "externalReferenceCode" : "43847",
  "friendlyUrlPath" : "able",
  "id" : 43849,
  "key" : "43847",
  "keywords" : [ ],
  "numberOfComments" : 0,
  "relatedContents" : [ ],
  "renderedContents" : [ {
    "contentTemplateId" : "43823",
    "contentTemplateName" : "Foo",
    "markedAsDefault" : true,
    "renderedContentURL" : "http://localhost:8080/o/headless-delivery/v1.0/structured-contents/43849/rendered-content/43823"
  }, {
    "contentTemplateId" : "43868",
    "contentTemplateName" : "Goo",
    "markedAsDefault" : false,
    "renderedContentURL" : "http://localhost:8080/o/headless-delivery/v1.0/structured-contents/44060/rendered-content/43868"
  } ],
  "siteId" : 20125,
  "subscribed" : false,
  "taxonomyCategoryBriefs" : [ ],
  "title" : "Able",
  "uuid" : "01ace059-814a-132d-d46d-21737ef2ec53"
}
```


<!--
Note: PATCH option information will be included in a follow-up (see LPS-137932).

## Updating the Web Content Article
-->

## 特定のテンプレートでレンダリングされたWebコンテンツの記事を取得する

Webコンテンツの記事は、特定のテンプレートにリンクされているわけではありません。 テンプレートは、Webコンテンツのレンダリング方法を定義するもので、同じWebコンテンツに異なるテンプレートを使用することができます。 詳細については、 [Webコンテンツストラクチャーを理解する](../web-content-structures/understanding-web-content-structures.md)をご覧ください。

```{tip}
Webコンテンツの記事は特定のテンプレートにリンクされているわけではないので、新しい記事を`POST`するときにテンプレートを指定することはできません(HTTPの`POST`メソッドはテンプレートを記述した`renderedContents`セクションを無視します）。
```

スクリプト`./StructuredContentRendered_GET_ById.sh`は、選択したWebコンテンツとテンプレートを使ってWebコンテンツをレンダリングします。 このスクリプトでは、`GET`HTTPメソッドを `StructuredContent`サービスで使用します。

| メソッド | サービス                | エンドポイント                                                |
|:---- |:------------------- |:------------------------------------------------------ |
| PUT  | `StructuredContent` | `/v1.0/structured-contents/${1}/rendered-content/${2}` |

```bash
./StructuredContentRendered_GET_ById.sh 43849 43868
```

以下は、 `image`フィールドを持つテンプレートを使用したスクリプトの出力です。

```html
Foo<picture data-fileentryid="43795"><source media="(max-width:300px)" srcset="http://localhost:8080/o/adaptive-media/image/43795/Thumbnail-300x300/foo.png?t=1629897455431, /o/adaptive-media/image/43795/Preview-1000x0/foo.png?t=1629897455431 2x" /><source media="(max-width:600px) and (min-width:300px)" srcset="http://localhost:8080/o/adaptive-media/image/43795/Preview-1000x0/foo.png?t=1629897455431" /><img alt="Foo alt-image description" data-fileentryid="43795" src="http://localhost:8080/documents/20125/0/foo.png/50956e56-9571-8f73-ae6e-9fca20fe0e3a?t=1629897455431" /></picture>30 Aug 2021 - 00:00:00Option1314292
```

代わりに`画像`フィールドを含まないWebコンテンツテンプレートを指定した場合、`<picture></picture>`情報は出力でレンダリングされません。 以下は、 `image`フィールドを含まないテンプレートを使用したスクリプトの出力です。

```bash
./StructuredContentRendered_GET_ById.sh 43849 43823 
```

```html
Foo30 Aug 2021 - 00:00:00Option13142925
```

cURLスクリプトのパラメーター：

| パラメーター # | 説明                  |
|:-------- |:------------------- |
| $1       | 構造化コンテンツ`id`        |
| $2       | `contentTemplateId` |

## Webコンテンツの記事を配置する

`PUT`HTTPメソッドで、 `StructuredContent`サービスを使って、オリジナルのWebコンテンツ情報を置き換えることができます。 `StructuredContent_PUT_ById`スクリプトはWebコンテンツとストラクチャー識別子を使って、記事の名前を`Baker`と置き換え、さらに記事の内容を`Bar`から`Goo`に置き換えます。

| メソッド | サービス                | エンドポイント                                           |
|:---- |:------------------- |:------------------------------------------------- |
| PUT  | `StructuredContent` | `/v1.0/structured-contents/{structuredContentId}` |

```bash
./StructuredContent_PUT_ById.sh 43849 43563 43805
```

cURLスクリプトのパラメーター：

| パラメーター # | 説明                   |
|:-------- |:-------------------- |
| $1       | 構造化コンテンツ`id`         |
| $2       | `contentStructureId` |
| $3       | 画像`id`               |

## 関連トピック

- [WebコンテンツAPIの基本](./web-content-api-basics.md)
- [RESTサービスの使用](../../../headless-delivery/consuming-apis/consuming-rest-services.md)
- [Webコンテンツストラクチャーを理解する](../web-content-structures/understanding-web-content-structures.md)
