# APIクエリパラメータ

[REST API](./consuming-rest-services.md) または [GraphQL API](./consuming-graphql-apis.md)のいずれを利用する場合でも、応答をフィルタリングするのに役立つさまざまなクエリパラメータが用意されています。

## フィールド パラメータ

このパラメータは、指定されたフィールドのみを指定し、返す場合に使用する。 例えば、countries APIに問い合わせると、2文字の国コードと国名のみが返されます。

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

JSONレスポンス。

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

## パラメータをフラットにする

このパラメータは、階層構造（親と子など）内に存在する項目を取得するために使用します。 例えば、親ユーザーグループとその中の子ユーザーグループを取得します（例：Raylife Globalは、異なる地域のRaylife組織の親組織です）。

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

JSONレスポンス。

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

これらのパラメータを使用して、どの項目のサブセットを返すかを指定します。 `page` パラメータは、利用可能なすべてのページのうち、どのページを返すかを指定します。 `pageSize` パラメーターは、1ページに何個のアイテムを入れたいかを指定します。 例えば、 `pageSize=10` と `page=22` (つまり、22ページ目の項目)について、countries APIに問い合わせる。

### REST APIの例

cURLのリクエストです。

```bash
curl \
    "http://localhost:8080/o/headless-admin-address/v1.0/countries?fields=a2,name&page=22&pageSize=10" \
    -u "test@liferay.com:learn"
```

### GraphQL APIの例

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

JSONレスポンス。

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

このパラメータは、検索ワードで項目を絞り込むために使用します。 例えば、 `united`という検索語句でcountries APIを検索します。

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

JSONレスポンス。

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

このパラメータを使用して、返されるアイテムのソート方法を指定します (すなわち、 `asc` ascending or `desc` descending order)。 例えば、国別APIを名前の降順でソートする。

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

JSONレスポンス。

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
