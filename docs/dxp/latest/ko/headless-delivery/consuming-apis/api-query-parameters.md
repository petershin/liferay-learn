# API 쿼리 매개변수

[개의 REST API](./consuming-rest-services.md) 또는 [GraphQL API](./consuming-graphql-apis.md)을 사용하든 응답을 필터링하는 데 도움이 되는 다양한 쿼리 매개변수를 사용할 수 있습니다.

## 필드 매개변수

지정된 필드만 지정하고 반환하려면 이 매개변수를 사용하십시오. 예를 들어 국가 API를 쿼리하여 2자로 된 국가 코드와 국가 이름만 반환합니다.

### REST API 예제

cURL 요청:

```bash
curl \
    "http://localhost:8080/o/headless-admin-address/v1.0/countries?fields=a2,name" \
    -u "test@liferay.com:learn"
```

### GraphQL API 예제

GraphQL 요청:

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

JSON 응답:

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

## 편평화 매개변수

이 매개변수를 사용하여 계층 구조(즉, 상위 및 하위) 내에 존재하는 항목을 검색합니다. 예를 들어 상위 사용자 그룹과 그 내부의 하위 사용자 그룹을 가져옵니다(예: Raylife Global은 다른 지역 Raylife 조직의 상위 조직입니다.).

### REST API 예제

cURL 요청:

```bash
curl \
    "http://localhost:8080/o/headless-admin-user/v1.0/organizations?fields=id,name&flatten=true" \
    -u "test@liferay.com:learn"
```

### GraphQL API 예제

GraphQL 요청:

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

JSON 응답:

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

## 페이지 및 페이지 크기 매개변수

이 매개변수를 사용하여 반환할 항목의 하위 집합을 지정합니다. `페이지` 매개변수는 사용 가능한 모든 페이지 중 리턴할 페이지를 지정합니다. `pageSize` 매개변수는 페이지당 원하는 항목 수를 지정합니다. 예를 들어, 국가 API에 `pageSize=10` 및 `page=22` (예: 항목의 22번째 페이지)을 쿼리합니다.

### REST API 예제

cURL 요청:

```bash
curl \
    "http://localhost:8080/o/headless-admin-address/v1.0/countries?fields=a2,name&page=22&pageSize=10" \
    -u "test@liferay.com:learn"
```

### GraphQL API 예제

GraphQL 요청:

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

JSON 응답:

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

## 검색 매개변수

검색어별로 항목을 필터링하려면 이 매개변수를 사용하십시오. 예를 들어 국가 API에서 검색어 `united`을 검색합니다.

### REST API 예제

cURL 요청:

```bash
curl \
    "http://localhost:8080/o/headless-admin-address/v1.0/countries?fields=a2,name&search=united" \
    -u "test@liferay.com:learn"
```

### GraphQL API 예제

GraphQL 요청:

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

JSON 응답:

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

## 매개변수 정렬

이 매개변수를 사용하여 반환된 항목을 정렬하는 방법을 지정합니다(예: `asc` 오름차순 또는 `desc` 내림차순). 예를 들어 국가 API를 이름별로 내림차순으로 정렬합니다.

### REST API 예제

cURL 요청:

```bash
curl \
    "http://localhost:8080/o/headless-admin-address/v1.0/countries?fields=a2,name&sort=name:desc" \
    -u "test@liferay.com:learn"
```

### GraphQL API 예제

GraphQL 요청:

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

JSON 응답:

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
