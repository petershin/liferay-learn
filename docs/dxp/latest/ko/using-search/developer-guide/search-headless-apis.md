# 헤드리스 API 검색

{bdg-link-primary}` [베타 기능](../../시스템-관리/설정-라이프웨이/기능-플래그.md#베타-기능-플래그) `

{bdg-secondary}`7.4 U88+ 및 GA88+`

[Liferay 검색 페이지에서](../../using-search/getting-started/searching-for-content.md) 콘텐츠를 검색할 수 있지만 `포털 검색-휴식` API 엔드포인트를 사용할 수도 있습니다. 로컬에서 Liferay를 실행하는 경우, 로그인한 상태에서 <http://localhost:8080/o/api?endpoint=http://localhost:8080/o/portal-search-rest/v1.0/openapi.json> 를 방문하여 API를 살펴볼 수 있습니다.

## 검색 헤드리스 API 사용

검색 헤드리스 API를 활성화하려면 [베타 기능 플래그](../../system-administration/configuring-liferay/feature-flags.md) 를 `true`로 설정하세요. [포털 속성](../../installation-and-upgrades/reference/portal-properties.md)을 사용하도록 설정하려면 `portal-ext.properties`에 추가합니다:

```properties
feature.flag.LPS-179669=true
```

[환경 변수](../../installation-and-upgrades/installing-liferay/using-liferay-docker-images/configuring-containers.md#using-liferay-env-variables) 를 사용하도록 설정하려면 이 변수를 설정에 추가하세요:

```properties
LIFERAY_FEATURE_PERIOD_FLAG_PERIOD__UPPERCASEL__UPPERCASEP__UPPERCASES__MINUS__NUMBER1__NUMBER7__NUMBER9__NUMBER6__NUMBER6__NUMBER9_=true
```

## 샘플 콘텐츠 검색

샘플 콘텐츠를 생성하고 검색하려면 다음 단계를 따르세요. 아래 명령은 기본 인증과 함께 작동하며, 이메일 `test@liferay.com` 및 비밀번호 `learn`를 가진 관리자를 사용하여 <http://localhost:8080>에서 로컬로 Liferay를 실행하고 있다고 가정합니다.

1. [사이트 ID](../../site-building/site-settings/site-settings-ui-reference.md#site-configuration) 를 찾거나 다음 명령을 사용하여 검색합니다:

   ```bash
   curl \
       "http://localhost:8080/o/headless-admin-user/v1.0/sites/by-friendly-url-path/guest" \
       -u "test@liferay.com:learn"
   ```

1. 다음 명령을 실행하여 블로그 글을 생성합니다. `1234` 을 사이트 ID로 바꿉니다.

   ```bash
   curl \
      -H "Content-Type: application/json" \
      -X POST \
      "http://localhost:8080/o/headless-delivery/v1.0/sites/1234/blog-postings" \
      -d "{\"articleBody\": \"Foo\", \"headline\": \"Able\"}" \
      -u "test@liferay.com:learn" 
   ```

### 간단한 쿼리

다음은 키워드 `able`에 대한 간단한 쿼리입니다:

```bash
curl \
    -H "Content-Type: application/json" \
    -X POST \
    "http://localhost:8080/o/portal-search-rest/v1.0/search?search=able" \
    -d "{}" \
    -u "test@liferay.com:learn"
```

응답은 블로그 게시물에 대한 정보가 포함된 검색 결과를 반환합니다.

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

### 포함된 항목이 있는 간단한 쿼리

검색 결과뿐만 아니라 반환된 엔티티의 필드를 자체 API 스키마에 따라 반환하려면 `nestedField` 파라미터를 `embedded`로 설정합니다. `able` 키워드에 대한 이 쿼리는 임베디드 항목도 요청합니다:

```bash
curl \
    -H "Content-Type: application/json" \
    -X POST \
    "http://localhost:8080/o/portal-search-rest/v1.0/search?nestedFields=embedded&&search=able" \
    -d "{}" \
    -u "test@liferay.com:learn"
```

응답은 블로그 게시물에 대한 더 많은 세부 정보를 반환합니다:

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

지원되는 매개변수와 요청 본문 속성을 사용하여 더 복잡한 요청을 작성할 수 있습니다.

## 검색 매개변수

쿼리 매개변수를 사용하여 결과를 추가로 필터링할 수 있습니다.

| 매개 변수             | 주                                                                                                                                                                              |
|:----------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `entryClassNames` | 쉼표로 구분된 `entryClassNames` 검색할 목록입니다. 기본값은 검색 가능한 모든 유형입니다.                                                                                                                     |
| `fields`          | fields 매개 변수는 응답의 각 요소에서 특정 필드만 열거하도록 요청합니다.                                                                                                                                   |
| `nestedFields`    | 중첩된 데이터를 다시 가져오기 위해 `임베디드` 를 지원합니다.                                                                                                                                            |
| `restrictFields`  | 지정된 필드를 반환 대상에서 제외합니다.                                                                                                                                                         |
| `filter`          | 다양한 분야에 걸쳐 필터링하세요. 지원되는 필드는 `groupIds`, `taxonomyCategoryIds`, `keywords`, `dateCreated`, `dateModified`, `creatorId`, `title`입니다. 더 많은 필터링 옵션을 사용하려면 검색 블루프린트(DXP 구독)를 사용하세요. |
| `page`            | 반환할 페이지를 지정합니다.                                                                                                                                                                |
| `pageSize`        | 페이지당 원하는 항목 수를 지정합니다.                                                                                                                                                          |
| `search`          | 키워드로 검색하세요.                                                                                                                                                                    |
| `sort`            | 오름차순 또는 내림차순으로 정렬합니다.                                                                                                                                                          |

자세한 내용은 [API 쿼리 매개변수](../../headless-delivery/consuming-apis/api-query-parameters.md) 를 참조하세요.

## 검색 요청 본문

빈 요청도 허용되지만(예: 요청 본문으로 `{}` 지정) 응답에 영향을 줄 수 있는 두 가지 속성을 사용할 수 있습니다:

| 재산                   | 묘사                                                                                                                            |
|:-------------------- |:----------------------------------------------------------------------------------------------------------------------------- |
| `attributes`         | 사용 가능한 검색 컨텍스트 속성을 설정하여 검색 블루프린트를 구성하거나 빈 검색을 활성화합니다. 자세한 내용은 [사용 가능한 검색 요청 속성](#available-search-request-attributes) 을 참조하세요. |
| `facetConfiguration` | 응답에서 패싯을 반환하도록 패싯 구성을 설정합니다. [요청에 패싯 구성 추가하기](#adding-facet-configurations-to-the-request) 를 참조하세요.                            |

### 요청에 속성 추가하기

블루프린트로 검색하려면 이 요청 본문 구문을 사용하세요:

```json
{
  "attributes": {
    "search.experiences.blueprint.external.reference.code": ""
  }
}
```

### 사용 가능한 검색 요청 속성

요청에 다음 `속성`을 설정할 수 있습니다.

| 부동산 | 설명 |
| :--- | :--- |
| `search.empty.search` | 요청에서 `search` 매개변수가 생략된 경우에도 결과를 반환하려면 이를 true로 설정합니다. |
| DXP 전용<br />`search.experiences.blueprint.external.reference.code` | (선호) [검색 청사진](../liferay-enterprise-search/search-experiences/search-blueprints.md)을 설정하여 검색 쿼리 및 구성을 제어합니다. |
| DXP 전용<br />`search.experiences.blueprint.id` | 검색 쿼리 및 구성을 제어하려면 [검색 청사진](../liferay-enterprise-search/search-experiences/search-blueprints.md)을 설정하세요.|
| DXP 전용<br />`search.experiences.ip.address` | 자동으로 설정합니다. [지리적 사이트와 함께] 청사진을 테스트하는 데에만 이것을 사용하십시오(../liferay-enterprise-search/search-experiences/search-blueprints/personalizing-the-search-experience.md#building-a-blueprint-to-personalize-search- 결과)는 다양한 사이트를 시뮬레이션하도록 구성되었습니다. |
| DXP 전용<br />`search.experiences.scope.group.id` | 청사진이 이를 필요로 하는 [요소](../liferay-enterprise-search/search-experiences/search-blueprints/search-blueprints-elements-reference.md)를 사용할 때 이를 설정하십시오. 검색을 현재 사이트로 제한, Boost 사용자 세그먼트 또는 스테이징 인식에 대한 카테고리의 콘텐츠. |

### 요청에 패싯 구성 추가하기

패싯 구성으로 검색하려면 이 요청 본문 구문을 사용하세요:

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

패싯 구성에는 여러 속성이 있을 수 있습니다:

| 재산                   | 묘사                                                                                                                                                                                                                                                                              |
|:-------------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `aggregationName`    | 집계의 고유한 이름을 선택합니다. 이는 동일한 유형(예: 동일한 `이름` 속성을 가진)의 인스턴스를 구분하는 데 필요합니다.                                                                                                                                                                                                           |
| `attributes`         | 일부 패싯에는 추가 속성이 필요합니다. `사용자 지정`, `날짜 범위`, `중첩된` 패싯에는 결과를 집계할 필드를 설정하기 위해 `필드` 라는 문자열 속성이 필요합니다. `날짜 범위` 패싯에는 날짜 형식을 지정하는 `형식` 문자열(예: `yyyyMMddHHmmss`)과 범위를 제공하는 `범위` 객체 배열이 필요합니다. `중첩된` 패싯에는 `필터필드` 문자열, `필터값` 문자열, `경로` 문자열이 필요합니다. `어휘` 패싯에는 `vocabularyIds`의 문자열 배열이 필요합니다. |
| `frequencyThreshold` | 패싯 용어 목록에 용어가 표시되는 데 필요한 최소 빈도를 설정합니다.                                                                                                                                                                                                                                          |
| `maxTerms`           | 패싯에 대해 검색된 일치하는 용어 수에 관계없이 표시할 패싯 용어의 최대 개수를 설정합니다.                                                                                                                                                                                                                             |
| `name`               | `카테고리`, `사용자 지정`, `날짜 범위`, `폴더`, `중첩된`, `사이트`, `태그`, `유형`, 또는 `사용자`. 각 유형에 대한 자세한 내용은 [패싯 검색](https://learn.liferay.com/ko/w/dxp/using-search/search-pages-and-widgets/search-facets) 문서를 참조하세요.                                                                                |
| `values`             | 값을 선택하여 결과를 필터링합니다. 이는 패싯 위젯에서 패싯 용어를 클릭하는 것과 같습니다.                                                                                                                                                                                                                             |


예를 들어, 다음은 `날짜 범위` 패싯의 `범위` 속성입니다:

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

## API에 대한 게스트 액세스 활성화

게스트가 API에 액세스할 수 있도록 하려면 [다음과 같이 새 서비스 액세스 정책](../../installation-and-upgrades/securing-liferay/securing-web-services/setting-service-access-policies.md#creating-a-service-access-policy) 을 만듭니다:

| 분야         | 입장                                                                               |
|:---------- |:-------------------------------------------------------------------------------- |
| 이름         | 검색                                                                               |
| 가능하게 하는    | 선택                                                                               |
| 기본         | 선택                                                                               |
| 제목         | 검색 API에 대한 공개 액세스                                                                |
| 서비스 클래스 이름 | `com.liferay.portal.search.rest.internal.resource.v1_0.SearchResultResourceImpl` |
| 메서드 이름     | `postSearchPage`                                                                 |

## 응답의 집계 및 검색 패싯

API 응답에서 [집계](ES) 및 [검색 패싯](../search-pages-and-widgets/search-facets.md) 을 확인할 수 있습니다. 집계를 보려면,

1. 검색 블루프린트에 [집계를 추가](../liferay-enterprise-search/search-experiences/search-blueprints/search-blueprints-configuration-reference.md#aggregation-configuration) .
1. 검색 요청에 `search.experiences.blueprint.external.reference.code` 속성을 설정합니다.

요청에 [패싯 구성](#adding-facet-configurations-to-the-request) 을 추가하면 검색 패싯이 반환됩니다. 예를 들어, 이 요청 본문은 태그 패싯을 요청합니다:

```json
{
  "facetConfigurations": [
    {
      "name": "tag"
    }
  ]
}
```

응답에서 반환된 검색 패싯은 다음과 같이 표시됩니다:

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
