# APIクエリパラメータ

[REST API](./consuming-rest-services.md) または [GraphQL API](./consuming-graphql-apis.md)のいずれを利用する場合でも、レスポンスをフィルタリングするのに役立つさまざまなクエリパラメータが利用できます。

## フィールド パラメータ

このパラメータは、指定されたフィールドのみを指定して返す場合に使用します。 例えば、countries APIに問い合わせて、2文字の国コードと国名だけを返すようにします。

### REST APIの例

cURLのリクエストです。

```bash
curl \
    "http://localhost:8080/o/headless-admin-address/v1.0/countries?fields=a2,name" \
    -u "test@liferay.com:learn"
```

### GraphQL APIの例

GraphQLのリクエストです。

```graphql
query {
    countries {
      actions
        items {
           a2
           name
        }
      lastPage
      page
      pageSize
      totalCount
  }
} 
```

JSONレスポンスです。

```json
{
  "actions" : { },
  "facets" : [ ],
  "items" : [ {
    "a2" : "CD",
    "name" : "democratic-republic-of-congo"
  }, {
    "a2" : "ML",
    "name" : "mali"
  }, {
    "a2" : "BV",
    "name" : "bouvet-island"
  }, {
    "a2" : "UY",
    "name" : "uruguay"
  }, {
    "a2" : "SB",
    "name" : "solomon-islands"
  }, {
    "a2" : "LT",
    "name" : "lithuania"
  }, {
    "a2" : "LV",
    "name" : "latvia"
  }, {
    "a2" : "KN",
    "name" : "st-kitts"
  }, {
    "a2" : "MD",
    "name" : "moldova"
  }, {
    "a2" : "IO",
    "name" : "british-indian-ocean-territory"
  }, {
    "a2" : "NP",
    "name" : "nepal"
  }, {
    "a2" : "SC",
    "name" : "seychelles"
  }, {
    "a2" : "PH",
    "name" : "philippines"
  }, {
    "a2" : "AO",
    "name" : "angola"
  }, {
    "a2" : "MT",
    "name" : "malta"
  }, {
    "a2" : "SL",
    "name" : "sierra-leone"
  }, {
    "a2" : "PT",
    "name" : "portugal"
  }, {
    "a2" : "GG",
    "name" : "guernsey"
  }, {
    "a2" : "DM",
    "name" : "dominica"
  }, {
    "a2" : "NF",
    "name" : "norfolk-island"
  } ],
  "lastPage" : 13,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 247
}%             
```

## フィルターパラメーター

`filter` パラメータを使用すると、APIエンドポイントのレスポンスをフィルタリングすることができます。 例えば、ブログの記事をタイトルでフィルタリングすることができます（例： `headline eq 'Able'`）。

API のパラメータを発見するには、 [API Explorer](./consuming-rest-services.md) を使用します。

```{note}
キーワードとしてインデックスされたフィールドのみがフィルタリングをサポートします。 テキストフィールドでコンテンツを検索する場合は、代わりに [search](#search-parameter) パラメータを使用します。
```

### REST APIの例

cURLのリクエストです。

```bash
curl \
    "http://localhost:8080/o/headless-delivery/v1.0/sites/20121/blog-postings?fields=articleBody,headline&filter=headline%20eq%20%27Able%27" \
    -u "test@liferay.com:learn"
```

### GraphQL APIの例

GraphQLのリクエストです。

```graphql
query {
  blogPostings(filter:"headline eq 'Able'",siteKey:"20121")
    {page
     items {
        articleBody
        headline
  }
  }
}
```

JSONレスポンスです。

```json
"data": {
  "blogPostings": {
    "page": 1,
    "items": [
      {
        "articleBody": "<p>Able able able</p>",
        "headline": "Able"
      }
    ]
  }
}
```

フィルタリングには、さまざまな演算子を使用することができます。

**比較演算子**

| 演算子  | 説明      | 例                                     |
|:---- |:------- |:------------------------------------- |
| `eq` | イコール    | `addressLocality eq 'Redmond'`        |
|      | イコールヌル  | `addressLocality eq null`             |
| `ne` | 同等ではない  | `addressLocality ne 'London'`         |
|      | イコールヌル  | `addressLocality ne null`             |
| `gt` | より大きい   | `price gt 20`                         |
| `ge` | 大なり小なり  | `price ge 10`                         |
| `lt` | 未満      | `dateCreated lt 2018-02-13T12:33:12Z` |
| `le` | 以下であること | `dateCreated le 2012-05-29T09:13:28Z` |

**論理演算子**

| 演算子   | 説明     | 例                               |
|:----- |:------ |:------------------------------- |
| `and` | ロジカルで  | `price le 200 and price gt 3.5` |
| `or`  | 論理的または | `price le 3.5 or price gt 200`  |
| `not` | 論理的でない | `not (price le 3.5)`            |

`not` の演算子の後にスペース文字が必要です。

**グルーピングオペレーター**

| 演算子   | 説明        | 例                                               |
|:----- |:--------- |:----------------------------------------------- |
| `( )` | 優先順位グループ化 | `(price eq 5) or (addressLocality eq 'London')` |

**文字列関数**

| 関数           | 説明        | 例                                     |
|:------------ |:--------- |:------------------------------------- |
| `contains`   | が以下を含む    | `contains(title,'edmon')`             |
| `startswith` | でスタートします。 | `startswith(addressLocality, 'Lond')` |

**ラムダ演算子**

ラムダ演算子は、コレクションフィールド（例えば、リソースの `キーワード`）に対してブーリアン式を評価します。 コレクションを識別するためのナビゲーションパスを先頭に付ける必要がある。

| ラムダ演算子 | 説明 | 例                                    |
|:------ |:-- |:------------------------------------ |
| `any`  | 任意 | `keywords/any(k:contains(k,'news'))` |

`any` 演算子は、各コレクション要素にブーリアン式を適用し、いずれかの要素に対して式が真であれば `true` と評価する。

**演算子の組み合わせとODataの構文**

構文例やその他の演算子の組み合わせについては、 [OData標準リファレンス](https://docs.oasis-open.org/odata/odata/v4.01/csprd06/part1-protocol/odata-v4.01-csprd06-part1-protocol.html#sec_BuiltinFilterOperations) に記載されています。

## パラメータを平らにする

このパラメータは、階層構造（親と子など）の中に存在するアイテムを取得する場合に使用します。 例えば、親ユーザーグループとその中の子ユーザーグループを取得します（例：Raylife Globalは、異なる地域のRaylife組織の親組織です）。

### REST APIの例

cURLのリクエストです。

```bash
curl \
    "http://localhost:8080/o/headless-admin-user/v1.0/organizations?fields=id,name&flatten=true" \
    -u "test@liferay.com:learn"
```

### GraphQL APIの例

GraphQLのリクエストです。

```graphql
query {
    organizations (flatten: true) {
        actions
        items {
           id
           name
        }
    lastPage
    page
    pageSize
    totalCount
  }
} 
```

JSONレスポンスです。

```json
{
  "actions" : {
   ...
  },
  "facets" : [ ],
  "items" : [ {
    "id" : "46367",
    "name" : "Raylife APAC"
  }, {
    "id" : "46372",
    "name" : "Raylife EMEA"
  }, {
    "id" : "46377",
    "name" : "Raylife LATAM"
  }, {
    "id" : "46382",
    "name" : "Raylife NA"
  }, {
    "id" : "46616",
    "name" : "Raylife Global"
  } ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 5
}%       
```

## ページおよびページサイズパラメーター

これらのパラメータを使用して、返すアイテムのサブセットを指定します。 `page` パラメータは、利用可能なすべてのページのうち、どのページを返すかを指定します。 `pageSize` パラメーターは、1ページに何個のアイテムを入れるかを指定します。 例えば、 `pageSize=10` と `page=22` (つまり22ページ目の項目)について、countries APIに問い合わせをします。

### REST APIの例

cURLのリクエストです。

```bash
curl \
    "http://localhost:8080/o/headless-admin-address/v1.0/countries?fields=a2,name&page=22&pageSize=10" \
    -u "test@liferay.com:learn"
```

### GraphQL API の例

GraphQLのリクエストです。

```graphql
query {
    countries (page: 22, pageSize: 10) {
       actions
        items {
           a2
           name
        }
      lastPage
      page
      pageSize
      totalCount
  }
} 
```

JSONレスポンスです。

```json
{
  "actions" : { },
  "facets" : [ ],
  "items" : [ {
    "a2" : "KG",
    "name" : "kyrgyzstan"
  }, {
    "a2" : "RE",
    "name" : "reunion-island"
  }, {
    "a2" : "CK",
    "name" : "cook-islands"
  }, {
    "a2" : "ER",
    "name" : "eritrea"
  }, {
    "a2" : "GE",
    "name" : "georgia"
  }, {
    "a2" : "MW",
    "name" : "malawi"
  }, {
    "a2" : "CO",
    "name" : "colombia"
  }, {
    "a2" : "GW",
    "name" : "guinea-bissau"
  }, {
    "a2" : "SN",
    "name" : "senegal"
  }, {
    "a2" : "TW",
    "name" : "taiwan"
  } ],
  "lastPage" : 25,
  "page" : 22,
  "pageSize" : 10,
  "totalCount" : 247
}%
```

## 検索パラメーター

このパラメータは、検索語によって項目を絞り込むために使用します。 例えば、 `united`という検索語について、countries API を検索します。

### REST APIの例

cURLのリクエストです。

```bash
curl \
    "http://localhost:8080/o/headless-admin-address/v1.0/countries?fields=a2,name&search=united" \
    -u "test@liferay.com:learn"
```

### GraphQL APIの例

GraphQLのリクエストです。

```graphql
query {
    countries (search: "united") {
       actions
        items {
           a2
           name
        }
      lastPage
      page
      pageSize
      totalCount
  }
} 
```

JSONレスポンスです。

```json
{
  "actions" : { },
  "facets" : [ ],
  "items" : [ {
    "a2" : "GB",
    "name" : "united-kingdom"
  }, {
    "a2" : "US",
    "name" : "united-states"
  }, {
    "a2" : "UM",
    "name" : "united-states-minor-outlying-islands"
  }, {
    "a2" : "VI",
    "name" : "united-states-virgin-islands"
  }, {
    "a2" : "AE",
    "name" : "united-arab-emirates"
  } ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 5
}%     
```

## ソートパラメータ

`sort` パラメータを使用すると、APIエンドポイントのレスポンスを昇順（`asc`）または降順（`desc`）にソートすることができます。 API のパラメータを発見するには、 [API Explorer](./consuming-rest-services.md) を使用します。

複数のパラメータでソートする場合は、パラメータ名をカンマで区切り、優先順位で並べます。 例えば、最初にタイトルで、次に作成日でソートするには、 `sort=title,dataCreated` をリクエストに追加します。

1つのパラメータにのみ降順を指定する場合、他のパラメータには明示的に昇順のソート順（`:asc`）を指定する必要があります。 例えば、 `sort=headline:desc,dateCreated:asc`.

以下の例では、countries API レスポンスを名前の降順でソートしています。

### REST APIの例

cURLのリクエストです。

```bash
curl \
    "http://localhost:8080/o/headless-admin-address/v1.0/countries?fields=a2,name&sort=name:desc" \
    -u "test@liferay.com:learn"
```

### GraphQL APIの例

GraphQLのリクエストです。

```graphql
query {
    countries (sort: "name:desc") {
       actions
        items {
           a2
           name
        }
      lastPage
      page
      pageSize
      totalCount
  }
} 
```

JSONレスポンスです。

```json
{
  "actions" : { },
  "facets" : [ ],
  "items" : [ {
    "a2" : "ZW",
    "name" : "zimbabwe"
  }, {
    "a2" : "ZM",
    "name" : "zambia"
  }, {
    "a2" : "YE",
    "name" : "yemen"
  }, {
    "a2" : "WS",
    "name" : "western-samoa"
  }, {
    "a2" : "EH",
    "name" : "western-sahara"
  }, {
    "a2" : "WF",
    "name" : "wallis-futuna"
  }, {
    "a2" : "VN",
    "name" : "vietnam"
  }, {
    "a2" : "VE",
    "name" : "venezuela"
  }, {
    "a2" : "VA",
    "name" : "vatican-city"
  }, {
    "a2" : "VU",
    "name" : "vanuatu"
  }, {
    "a2" : "UZ",
    "name" : "uzbekistan"
  }, {
    "a2" : "UY",
    "name" : "uruguay"
  }, {
    "a2" : "VI",
    "name" : "united-states-virgin-islands"
  }, {
    "a2" : "UM",
    "name" : "united-states-minor-outlying-islands"
  }, {
    "a2" : "US",
    "name" : "united-states"
  }, {
    "a2" : "GB",
    "name" : "united-kingdom"
  }, {
    "a2" : "AE",
    "name" : "united-arab-emirates"
  }, {
    "a2" : "UA",
    "name" : "ukraine"
  }, {
    "a2" : "UG",
    "name" : "uganda"
  }, {
    "a2" : "TV",
    "name" : "tuvalu"
  } ],
  "lastPage" : 13,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 247
}%      
```

