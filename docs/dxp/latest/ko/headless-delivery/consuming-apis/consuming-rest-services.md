# REST 서비스 사용

Liferay DXP에는 대부분의 애플리케이션에 대한 REST 서비스가 포함되어 있습니다. 이러한 서비스는 [OpenAPI](https://app.swaggerhub.com/apis/liferayinc/headless-delivery)와 완전히 호환됩니다. 여기에서 섭취 방법을 배웁니다. 세 단계만 거치면 됩니다. 

1. 사용하려는 서비스를 식별합니다.
1. 필요한 데이터가 포함된 사이트를 식별합니다.
1. 데이터에 대한 액세스 권한이 있는 자격 증명을 사용하여 서비스 호출을 수행합니다.

이 예에서는 Liferay DXP를 새로 설치한 Docker 이미지를 사용합니다.

## 사용할 서비스 식별

REST 서비스를 호출하려면 실행 중인 Liferay DXP가 필요합니다. 

```{include} /_snippets/run-liferay-portal.md
```

Liferay DXP의 REST 서비스는 다음 URL에 게시됩니다.

```
http[s]://[hostname]:[port]/o/api
```

Docker 인스턴스에서 다음 사이트에서 찾을 수 있습니다.

```
http://localhost:8080/o/api
```

API는 여러 범주로 나뉩니다. 이 예에서는 `BlogPosting` 서비스를 사용하여 블로그 위젯에서 블로그 게시물을 검색하지만 게시된 모든 서비스에서 이 절차를 사용할 수 있습니다.

1. *Headless Delivery* 카테고리를 선택합니다. 이 범주에는 `BlogPosting` 서비스가 포함됩니다. 필터를 사용하여 서비스를 검색할 수 있습니다.

1. *Show Schemas* 버튼을 클릭하면 화면 오른쪽에 해당 카테고리의 모든 스키마 목록이 나타납니다.

1. 브라우저 탭을 스키마 브라우저에 열어 둡니다. `BlogPosting`을 PUT하려면 해당 스키마가 필요합니다.

![스키마 브라우저를 사용하면 원하는 서비스를 편리하게 찾아 호출할 수 있습니다. ](./소비-휴식-서비스/이미지/01.png)

## 데이터가 포함된 사이트 식별

이제 기본 사이트 ID를 찾아야 합니다.

1. 사이트 메뉴(![사이트 메뉴](../../images/icon-menu.png))를 열고 *구성* &rarr; *사이트 설정*.
1. 플랫폼 섹션에서 *사이트 구성*을 클릭합니다. Liferay DXP 버전 7.3 이하의 경우 *일반* 탭을 클릭합니다.
1. 사이트 ID 아래에서 사이트 식별자를 찾습니다.

    ![사이트 설정 및 사이트 구성 옵션에서 사이트 ID를 식별합니다.](./ 소모-rest-services/images/03.png)

## 데이터에 액세스할 수 있는 자격 증명을 사용하여 서비스 호출하기

이제 전화를 거는 데 필요한 모든 것이 있습니다. 요청하는 데이터에 액세스할 수 있는 자격 증명을 사용하여 모든 웹 서비스에 액세스해야 합니다. 가장 간단한 방법은 URL에서 자격 증명 데이터를 전달하는 기본 인증을 사용하는 것입니다. 이 방법은 안전하지 않으므로 개발 중에만 이 방법을 사용해야 합니다. 프로덕션의 경우 애플리케이션에서 [OAuth2](../using-oauth2/using-oauth2.md)를 통해 사용자에게 권한을 부여해야 합니다.

아래 예시는 [cURL](https://curl.haxx.se)을 사용합니다.

### 기본 인증을 사용하여 서비스 호출(개발 중에만 해당)

기본 인증을 사용하여 서비스를 호출하려면 URL에 자격 증명을 제공합니다.

```bash
curl "http://localhost:8080/o/headless-delivery/v1.0/sites/20122/blog-postings/" -u 'test@liferay.com:learn'
```

### OAuth2를 사용하여 서비스 호출

프로덕션의 경우 [OAuth2 애플리케이션](../using-oauth2/creating-oauth2-applications.md) 을 만들고 OAuth2 프로세스를 사용하여 인증 토큰을 가져옵니다. 토큰이 있으면 HTTP 헤더에 제공하십시오.

```bash
curl -H "Authorization: Bearer d5571ff781dc555415c478872f0755c773fa159" http://localhost:8080/o/headless-delivery/v1.0/sites/20122/blog-postings
```

## 데이터 가져오기 및 게시

위의 쿼리를 실행하여 모든 블로그 게시물을 가져오면 아무것도 없는 것을 볼 수 있습니다.

```json
{
  "actions" : {
    "subscribe" : {
      "method" : "PUT",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings/subscribe"
    },
    "unsubscribe" : {
      "method" : "PUT",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings/unsubscribe"
    },
    "create" : {
      "method" : "POST",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings"
    }
  },
  "items" : [ ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 0
}
```

먼저 블로그 항목을 게시합니다.

### 블로그 항목 게시

스키마 브라우저를 사용하여 블로그 항목을 게시하는 방법을 배울 수 있습니다. 

![모든 서비스의 스키마는 Liferay DXP 인스턴스에 게시됩니다.](./consuming-rest-services/images/02.png)

1. 스키마 브라우저가 포함된 브라우저 탭으로 돌아갑니다. 오른쪽에서 `BlogPosting` 항목을 클릭하여 해당 스키마를 표시합니다(위 참조). 이것은 `BlogPosting`에 대한 전체 데이터 구조를 보여주지만 필수 필드는 두 개뿐입니다.

    * `articleBody`
    * `headline`

2. 블로그 항목을 게시할 간단한 JSON 문서를 구성합니다. 

    ```json
    {
        "headline": "REST 서비스의 테스트 블로그 항목",
        "articleBody": "이 기사는 Liferay DXP에서 제공하는 REST 서비스를 통해 게시되었습니다."
    }
    ```

3. 요청하기: 

    ```bash
    curl --header "Content-Type: application/json" --request POST --data '{ "headline": "Test Blog Entry from REST Services", "articleBody": "This article was posted via REST services provided by Liferay DXP." }' http://localhost:8080/o/headless-delivery/v1.0/sites/20122/blog-postings -u test@liferay.com:learn
    ```

Liferay DXP는 블로그 항목의 전체 JSON 표현을 반환합니다.

```json
{
  "actions" : {
    "get" : {
      "method" : "GET",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
    },
    "replace" : {
      "method" : "PUT",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
    },
    "update" : {
      "method" : "PATCH",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
    },
    "delete" : {
      "method" : "DELETE",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
    }
  },
  "alternativeHeadline" : "",
  "articleBody" : "This article was posted via REST services provided by Liferay DXP.",
  "creator" : {
    "additionalName" : "",
    "contentType" : "UserAccount",
    "familyName" : "Test",
    "givenName" : "Test",
    "id" : 20125,
    "name" : "Test Test",
    "profileURL" : "/web/test"
  },
  "customFields" : [ ],
  "dateCreated" : "2020-03-06T18:02:26Z",
  "dateModified" : "2020-03-06T18:02:27Z",
  "datePublished" : "2020-03-06T18:02:00Z",
  "description" : "",
  "encodingFormat" : "text/html",
  "friendlyUrlPath" : "test-blog-entry-from-rest-services",
  "headline" : "Test Blog Entry from REST Services",
  "id" : 35215,
  "keywords" : [ ],
  "numberOfComments" : 0,
  "relatedContents" : [ ],
  "siteId" : 20122,
  "taxonomyCategories" : [ ]
}
```

### 모든 블로그 항목 가져오기

이제 게시한 블로그 항목이 있는지 확인하기 위해 수행한 첫 번째 쿼리를 반복할 수 있습니다.

```bash
curl "http://localhost:8080/o/headless-delivery/v1.0/sites/20122/blog-postings/" -u 'test@liferay.com:learn'
```

이것은 블로그 항목 목록을 반환합니다. 추가한 항목은 목록에 있는 유일한 항목입니다.

```json
{
  "actions" : {
    "subscribe" : {
      "method" : "PUT",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings/subscribe"
    },
    "unsubscribe" : {
      "method" : "PUT",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings/unsubscribe"
    },
    "create" : {
      "method" : "POST",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings"
    }
  },
  "items" : [ {
    "actions" : {
      "get" : {
        "method" : "GET",
        "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
      },
      "replace" : {
        "method" : "PUT",
        "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
      },
      "update" : {
        "method" : "PATCH",
        "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
      },
      "delete" : {
        "method" : "DELETE",
        "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
      }
    },
    "alternativeHeadline" : "",
    "articleBody" : "This article was posted via REST services provided by Liferay DXP.",
    "creator" : {
      "additionalName" : "",
      "contentType" : "UserAccount",
      "familyName" : "Test",
      "givenName" : "Test",
      "id" : 20125,
      "name" : "Test Test",
      "profileURL" : "/web/test"
    },
    "customFields" : [ ],
    "dateCreated" : "2020-03-06T18:02:26Z",
    "dateModified" : "2020-03-06T18:02:27Z",
    "datePublished" : "2020-03-06T18:02:00Z",
    "description" : "",
    "encodingFormat" : "text/html",
    "friendlyUrlPath" : "test-blog-entry-from-rest-services",
    "headline" : "Test Blog Entry from REST Services",
    "id" : 35215,
    "keywords" : [ ],
    "numberOfComments" : 0,
    "relatedContents" : [ ],
    "siteId" : 20122,
    "taxonomyCategories" : [ ]
  } ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 1
}
```

### 단일 블로그 항목 얻기

요청할 때마다 Liferay DXP는 다른 가능한 끝점을 반환했습니다. 그 중 하나는 ID로 단일 블로그 항목을 가져오는 것입니다. 항목의 ID를 알고 있으면 검색할 수 있습니다.

```bash
curl "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/35215" -u test@liferay.com:learn
```

이것은 동일한 블로그 항목을 반환합니다.

### 블로그 항목 삭제

ID를 알고 있는 경우 블로그 항목을 삭제할 수도 있습니다.

```bash
curl -X DELETE "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/35215" -u test@liferay.com:learn
```

이 경우 아무 것도 반환되지 않지만 위와 같이 요청하여 항목이 사라진 것을 확인할 수 있습니다.

```bash
curl "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/35215" -u test@liferay.com:learn
```

Liferay DXP는 응답으로 이 JSON 문서를 반환합니다.

```json
{
  "status" : "NOT_FOUND",
  "title" : "No BlogsEntry exists with the primary key 35215"
}
```

축하합니다! 이제 Liferay DXP의 REST 서비스를 호출하는 방법을 배웠습니다. 위의 예에서는 기본 인증을 사용한다는 점을 기억하세요. 프로덕션의 경우 OAuth2를 사용하여 안전한 방식으로 서비스를 호출합니다.
