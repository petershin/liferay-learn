# Headless API を検索

`{bdg-link-primary}` [ベータ機能](../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags) `

{bdg-secondary}`7.4 U88+ および GA88+`

[Liferay の検索ページからコンテンツ](../../using-search/getting-started/searching-for-content.md) を検索できますが、 `portal-search-rest` API エンドポイントを使うこともできます。 Liferay をローカルで実行している場合、ログインした状態で <http://localhost:8080/o/api?endpoint=http://localhost:8080/o/portal-search-rest/v1.0/openapi.json> にアクセスして API を調べることができます。

## 検索ヘッドレスAPIの有効化

検索ヘッドレスAPIを有効にするには、 [beta feature flag](../../system-administration/configuring-liferay/feature-flags.md) を `true`に設定する。 [ポータル・プロパティ](../../installation-and-upgrades/reference/portal-properties.md)を使用できるようにするには、これを `portal-ext.properties`に追加します：

```properties
feature.flag.LPS-179669=true
```

[環境変数](../../installation-and-upgrades/installing-liferay/using-liferay-docker-images/configuring-containers.md#using-liferay-env-variables) を有効にするには、これを設定に追加する：

```properties
LIFERAY_FEATURE_PERIOD_FLAG_PERIOD__UPPERCASEL__UPPERCASEP__UPPERCASES__MINUS__NUMBER1__NUMBER7__NUMBER9__NUMBER6__NUMBER6__NUMBER9_=true
```

## サンプルコンテンツの検索

以下の手順に従って、サンプルコンテンツを生成し、検索してください。 以下のコマンドはベーシック認証で動作し、 <http://localhost:8080>でローカルに Liferay を実行し、電子メール `test@liferay.com` とパスワード `learn`で管理者を使用していると仮定しています。

1. [サイトID](../../site-building/site-settings/site-settings-ui-reference.md#site-configuration) を検索するか、以下のコマンドで検索してください：

   ```bash
   curl \
       "http://localhost:8080/o/headless-admin-user/v1.0/sites/by-friendly-url-path/guest" \
       -u "test@liferay.com:learn"
   ```

1. 以下のコマンドを実行してブログ記事を生成する。 `1234`をサイトのIDに置き換えてください。

   ```bash
   curl \
      -H "Content-Type: application/json" \
      -X POST \
      "http://localhost:8080/o/headless-delivery/v1.0/sites/1234/blog-postings" \
      -d "{\"articleBody\": \"Foo\", \"headline\": \"Able\"}" \
      -u "test@liferay.com:learn" 
   ```

### 簡単なクエリー

以下は、 `able`というキーワードに対する簡単なクエリーである：

```bash
curl \
    -H "Content-Type: application/json" \
    -X POST \
    "http://localhost:8080/o/portal-search-rest/v1.0/search?search=able" \
    -d "{}" \
    -u "test@liferay.com:learn"
```

レスポンスは、ブログ記事に関する情報を含む検索結果を返す。

```bash
{
  "items" : [ {
    "dateModified" : "2023-07-20T17:15:32Z",
    "description" : "Foo",
    "itemURL" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/35384",
    "score" : 318.95966,
    "title" : "Able"
  } ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 1
}%  
```

### 項目を埋め込んだシンプルなクエリ

検索結果だけでなく、返されたエンティティのフィールドを独自のAPIスキーマに従って返すには、 `nestedField` パラメータを `embedded`に設定します。 `able` というキーワードのこのクエリーは、埋め込みアイテムもリクエストする：

```bash
curl \
    -H "Content-Type: application/json" \
    -X POST \
    "http://localhost:8080/o/portal-search-rest/v1.0/search?nestedFields=embedded&&search=able" \
    -d "{}" \
    -u "test@liferay.com:learn"
```

その返答は、ブログ記事に関する多くの詳細を返す：

```bash
{
  "items" : [ {
    "dateModified" : "2023-07-20T17:15:32Z",
    "description" : "Foo",
    "embedded" : {
      "actions" : { },
      "alternativeHeadline" : "",
      "articleBody" : "Foo",
      "creator" : {
        "additionalName" : "",
        "contentType" : "UserAccount",
        "familyName" : "Test",
        "givenName" : "Test",
        "id" : 20123,
        "name" : "Test Test"
      },
      "customFields" : [ ],
      "dateCreated" : "2023-07-20T17:15:32Z",
      "dateModified" : "2023-07-20T17:15:32Z",
      "datePublished" : "2023-07-20T17:15:00Z",
      "description" : "Foo",
      "encodingFormat" : "text/html",
      "externalReferenceCode" : "f73109ce-8db6-36e3-f2c7-4505c6454ed8",
      "friendlyUrlPath" : "able",
      "headline" : "Able",
      "id" : 35384,
      "keywords" : [ ],
      "numberOfComments" : 0,
      "relatedContents" : [ ],
      "renderedContents" : [ ],
      "siteId" : 20119,
      "taxonomyCategoryBriefs" : [ ]
    },
    "itemURL" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/35384",
    "score" : 318.95966,
    "title" : "Able"
  } ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 1
}%   
```

サポートされているパラメータとリクエストボディのプロパティを使用して、より複雑なリクエストを構築することができます。

## 検索パラメータ

クエリーパラメーターを使用すると、結果をさらに絞り込むことができる。

| パラメーター            | メモ                                                                                                                                                                                |
|:----------------- |:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entryClassNames` | 検索する `entryClassNames` のカンマ区切りリスト。 デフォルトはすべての検索可能なタイプ。                                                                                                                            |
| `fields`          | fieldsパラメータは、応答の各要素に列挙される特定のフィールドのみを要求する。                                                                                                                                         |
| `nestedFields`    | `、ネストされたデータを取得するために`。                                                                                                                                                             |
| `restrictFields`  | 指定されたフィールドが返されないようにします。                                                                                                                                                           |
| `filter`          | 異なる分野にまたがるフィルター。 `groupIds`, `taxonomyCategoryIds`, `keywords`, `dateCreated`, `dateModified`, `creatorId`, and `title`。 より多くのフィルタリングオプションについては、検索ブループリント（DXPサブスクリプション）を使用してください。 |
| `page`            | どのページに戻るかを指定する。                                                                                                                                                                   |
| `pageSize`        | 1ページあたりのアイテム数を指定します。                                                                                                                                                              |
| `search`          | キーワードで検索                                                                                                                                                                          |
| `sort`            | 昇順または降順で並べ替える。                                                                                                                                                                    |

詳しくは [APIクエリパラメータ](../../headless-delivery/consuming-apis/api-query-parameters.md) を参照。

## 検索リクエスト本文

空のリクエストも許されるが（例えば、 `{}` をリクエスト・ボディとして指定する）、レスポンスに影響を与えるために利用できるプロパティが2つある：

| プロパティ                | 説明                                                                                                                                      |
|:-------------------- |:--------------------------------------------------------------------------------------------------------------------------------------- |
| `attributes`         | 利用可能な検索コンテキスト属性を設定し、検索ブループリントを構成するか、空の検索を有効にします。 詳細は [Available Search Request Attributes](#available-search-request-attributes) を参照のこと。 |
| `facetConfiguration` | レスポンスにファセットを返すようにファセット設定を設定します。 [ファセット設定をリクエストに追加する](#adding-facet-configurations-to-the-request) を参照。                                   |

### リクエストに属性を追加する

ブループリントで検索するには、このリクエストボディの構文を使用します：

```json
{
  "attributes": {
    "search.experiences.blueprint.external.reference.code": ""
  }
}
```

### 利用可能な検索リクエスト属性

これらの`属性`をリクエストに設定することができる：


### リクエストにファセット設定を追加する

ファセット構成で検索するには、このリクエストボディの構文を使用します：

```json
{
  "facetConfigurations": [
    {
      "aggregationName": "",
      "attributes": {},
      "frequencyThreshold": "",
      "maxTerms": "",
      "name": "",
      "values": []
    }
  ]
}
```

ファセット構成はいくつかのプロパティを持つことができる：

| プロパティ                | 説明                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
|:-------------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `aggregationName`    | アグリゲーションの一意な名前を選択する。 これは、同じ型のインスタンス（すなわち、同じ `名` プロパティを持つインスタンス）を区別するために必要である。                                                                                                                                                                                                                                                                                                                                                                                |
| `attributes`         | ファセットによっては追加の属性を必要とするものもある。 `custom`, `date-range`, and `nested` facets requires String attribute called `field` to set field to aggregate results by（結果を集約するフィールドを設定するために、 フィールド と呼ばれる文字列属性が必要です。 `date-range` ファセットには、日付フォーマットを指定する `format` String（例えば、 `yyyyMMddHHmmss`）と、範囲を指定する `ranges` object arrayも必要である。 `ネストされた` ファセットは、 `filterfield` String、 `filtervalue` String、 `path` String を必要とする。 `vocabulary` ファセットには、 `vocabularyIds`の String 配列が必要です。 |
| `frequencyThreshold` | ファセット用語のリストに表示される用語に必要な最小頻度を設定する。                                                                                                                                                                                                                                                                                                                                                                                                                            |
| `maxTerms`           | ファセットに一致する用語の数に関係なく、表示するファセット用語の最大数を設定する。                                                                                                                                                                                                                                                                                                                                                                                                                    |
| `name`               | ファセットのタイプを設定する： `カテゴリ`、 `カスタム`、 `日付範囲`、 `フォルダー`、 `入れ子`、 `サイト`、 `タグ`、 `タイプ`、または `ユーザー`。 各タイプの詳細については、 [検索ファセット](https://learn.liferay.com/ja/w/dxp/using-search/search-pages-and-widgets/search-facets) ドキュメントを参照してください。                                                                                                                                                                                                                                |
| `values`             | 値を選択して結果をフィルタリングする。 これは、ファセット・ウィジェットのファセット・タームをクリックするようなものである。                                                                                                                                                                                                                                                                                                                                                                                               |


例えば、 `日付範囲` ファセットの `範囲` 属性です：

```json
{
  "ranges": [
    {
      "label": "range-1",
      "range": "[20220411085757 TO 20230413075757]"
    },
    {
      "label": "range-2",
      "range": "[20230409085757 TO 20230413075757]"
    }
  ]
}
```

## APIへのゲストアクセスを有効にする

APIへのゲスト・アクセスを有効にするには、 [、以下のように新しいサービス・アクセス・ポリシー](../../installation-and-upgrades/securing-liferay/securing-web-services/setting-service-access-policies.md#creating-a-service-access-policy) ：

| 項目        | エントリ                                                                             |
|:--------- |:-------------------------------------------------------------------------------- |
| 名前        | 検索                                                                               |
| 有効        | チェック済み                                                                           |
| デフォルト     | チェック済み                                                                           |
| タイトル      | 検索APIへの一般アクセス                                                                    |
| サービス・クラス名 | `com.liferay.portal.search.rest.internal.resource.v1_0.SearchResultResourceImpl` |
| メッソド名     | `postSearchPage`                                                                 |

## レスポンスにおける集約と検索ファセット

APIレスポンスに [集計](ES) と [検索ファセット](../search-pages-and-widgets/search-facets.md) を見ることができる。 集合体を見る、

1. [集約を検索ブループリントに追加](../liferay-enterprise-search/search-experiences/search-blueprints/search-blueprints-configuration-reference.md#aggregation-configuration) .
1. 検索リクエストに属性 `search.experiences.blueprint.external.reference.code` を設定します。

[ファセット設定](#adding-facet-configurations-to-the-request) をリクエストに追加すると、検索ファセットが返されます。 たとえば、このリクエストボディはタグファセットを要求する：

```json
{
  "facetConfigurations": [
    {
      "name": "tag"
    }
  ]
}
```

レスポンスでは、返された検索ファセットは次のようになる：

```json
"searchFacets": {
  "tag": [
    {
      "displayName": "business",
      "term": "business",
      "frequency": 26
    },
    {
      "displayName": "fun",
      "term": "fun",
      "frequency": 1
    }
  ]
}
```
