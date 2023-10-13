# 외부 참조 코드 사용

{bdg-secondary}라이프레이 DXP/포탈 7.4+

Liferay의 헤드리스 API 엔드포인트 중 다수는 외부 참조 코드(ERC)를 지원합니다. ERC 필드는 다양한 시나리오에서 유용합니다. 예를 들어 콘텐츠를 Liferay로 마이그레이션할 때 ERC 필드에 다른 시스템의 고유 참조 ID를 유지할 수 있습니다. 또는 ERC를 사용하여 사이트 콘텐츠에 대해 사람이 읽을 수 있는 키를 확보하세요. 예를 들어 Liferay는 생성된 각 블로그 게시물에 고유 ID를 할당하지만 더 쉽게 참조할 수 있도록 사람이 읽을 수 있는 키를 할당할 수도 있습니다.

각 ERC는 고유해야 하며 동일한 ERC는 동일한 범위의 다른 엔터티와 함께 사용할 수 없습니다. 예를 들어, 블로그 게시물과 동일한 사이트의 문서는 동일한 ERC를 가질 수 없습니다. 시도하면 `중복 항목` 오류가 발생합니다.

## 블로그 게시물 ERC 예

ERC를 사용하여 블로그 게시물을 만들고 액세스하세요.

1. 귀하의 [사이트의 ID](./consuming-rest-services.md#identify-the-site-containing-the-data) 기록해 두십시오.

1. 다음 컬 명령을 실행하여 새 블로그 게시물을 만듭니다. `{siteId}` 사이트 ID로 바꾸세요.

   ```bash
   curl \
    -H "Content-Type: application/json" \
    -X POST \
    "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings" \
    -d "{\"articleBody\": \"Foo\", \"externalReferenceCode\": \"blog_post_able\", \"headline\": \"Able\"}" \
    -u "test@liferay.com:learn"
   ```

   출력에는 새 블로그 게시물이 생성되었음을 표시합니다.

   ```bash
   ...
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
     "dateCreated" : "2023-09-21T21:21:48Z",
     "dateModified" : "2023-09-21T21:21:48Z",
     "datePublished" : "2023-09-21T21:21:00Z",
     "description" : "Foo",
     "encodingFormat" : "text/html",
     "externalReferenceCode" : "blog_post_able",
     "friendlyUrlPath" : "able",
     "headline" : "Able",
     "id" : 42617,
     "keywords" : [ ],
     "numberOfComments" : 0,
     "relatedContents" : [ ],
     "renderedContents" : [ ],
     "siteId" : 20119,
     "taxonomyCategoryBriefs" : [ ]
   ...
      ```

1. 이제 이 블로그 게시물은 ID 또는 ERC로 참조될 수 있습니다. 예를 들어, 해당 ID로 블로그 게시물을 가져옵니다.

   ```bash
   curl \
    "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/42617" \
    -u "test@liferay.com:learn"
   ```

   또는 ERC를 통해 블로그 게시물을 가져옵니다.

   ```bash
   curl \
    "http://localhost:8080/o/headless-delivery/v1.0/sites/20119/blog-postings/by-external-reference-code/blog_post_able" \
    -u "test@liferay.com:learn"
   ```

   ERC의 블로그 게시물에 대한 이 GET 방법에는 사이트 ID(예 `20119`)와 ERC(예 `blog_post_able`)가 필요합니다.

외부 참조 코드를 지원하는 다양한 API 엔드포인트를 보려면 [API Explorer](../using-liferay-as-a-headless-platform.md#ways-to-connect) 을 확인하세요.
