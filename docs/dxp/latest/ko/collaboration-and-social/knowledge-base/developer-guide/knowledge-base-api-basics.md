# 기술 자료 API 기본 사항

[기술 자료 문서 생성](../creating-knowledge-base-articles.md) 및 [Liferay의 기술 자료 앱으로 기술 자료를 관리](../managing-the-knowledge-base.md) 수 있지만 Liferay의 REST API를 사용할 수도 있습니다. 기술 자료에 대한 콘텐츠를 만들고 관리하려면 이러한 서비스를 호출하십시오.

## 기술 자료 문서 추가

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르십시오.

1. [Knowledge Base API 기본 사항](./liferay-t3x7.zip)을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/collaboration-and-social/knowledge-base/developer-guide/liferay-t3x7.zip -O
   ```

   ```bash
   unzip liferay-t3x7.zip
   ```

1. 로그인하면 [사이트의 ID를 검색합니다](../../../headless-delivery/consuming-apis/consuming-rest-services.md#identify-the-site-containing-the-data). 여러 서비스 호출에서 이 ID를 사용합니다.

1. cURL 스크립트를 사용하여 사이트에 새로운 기술 자료 문서를 추가하십시오. 명령줄에서 `curl` 폴더로 이동합니다. 사이트 ID를 매개변수로 사용하여 `KnowledgeBaseArticle_POST_ToSite.sh` 스크립트를 실행합니다. 예를 들어,

   ```bash
   ./KnowledgeBaseArticle_POST_ToSite.sh 1234
   ```

   JSON 응답은 새로운 기술 자료 문서가 추가되었음을 보여줍니다.

   ```json
   {
     "articleBody" : "Foo",
     "creator" : {
       "additionalName" : "",
       "contentType" : "UserAccount",
       "familyName" : "Test",
       "givenName" : "Test",
       "id" : 20125,
       "name" : "Test Test"
     },
     "customFields" : [ ],
     "dateCreated" : "2022-07-28T21:25:57Z",
     "dateModified" : "2022-07-28T21:25:57Z",
     "description" : "",
     "encodingFormat" : "text/html",
     "externalReferenceCode" : "0bace9ad-39ea-79b5-902e-c873806b8bd7",
     "friendlyUrlPath" : "able",
     "id" : 42447,
     "keywords" : [ ],
     "numberOfAttachments" : 0,
     "numberOfKnowledgeBaseArticles" : 0,
     "parentKnowledgeBaseArticleId" : 0,
     "relatedContents" : [ ],
     "siteId" : 20121,
     "subscribed" : false,
     "taxonomyCategoryBriefs" : [ ],
     "title" : "Able"
   }
   ```

1. *메뉴* 아이콘(![Menu icon](../../../images/icon-menu.png))을 클릭하고 *콘텐츠 및 데이터* &rarr; *지식 베이스*로 이동합니다. 새로운 기술 자료 문서가 추가되었는지 확인하십시오.

   ![새로운 기술 자료 문서가 추가되었는지 확인하십시오.](./knowledge-base-api-basics/images/01.png)

1. REST 서비스는 Java 클라이언트를 사용하여 호출할 수도 있습니다. `curl` 폴더에서 `java` 폴더로 이동합니다. 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. `KnowledgeBaseArticle_POST_ToSite.java` 클래스를 실행합니다. `siteId` 시스템 속성 값을 사이트의 ID로 바꿉니다.

   ```bash
   java -classpath .:* -DsiteId=1234 KnowledgeBaseArticle_POST_ToSite
   ```

   Java 클래스는 새로운 기술 자료 문서를 만들었습니다.

## cURL 명령 검사

`KnowledgeBaseArticle_POST_ToSite.sh` 스크립트는 cURL 명령으로 REST 서비스를 호출합니다.

```{literalinclude} ./knowledge-base-api-basics/resources/liferay-t3x7.zip/curl/KnowledgeBaseArticle_POST_ToSite.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                                    | 묘사                      |
|:------------------------------------------------------------------------------------- |:----------------------- |
| `-H "Content-Type: application/json"`                                                 | 요청 본문 형식이 JSON임을 나타냅니다. |
| `-X POST`                                                                             | 지정된 끝점에서 호출할 HTTP 메서드   |
| `"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/knowledge-base-articles"` | REST 서비스 끝점             |
| `-d "{\"articleBody\": \"Foo\", \"title\": \"Able\"}"`                        | 게시를 요청하는 데이터            |
| `-u "test@liferay.com:learn"`                                                         | 기본 인증 자격 증명             |

```{note}
기본 인증은 데모용으로 사용됩니다. 프로덕션의 경우 [OAuth2](../../../headless-delivery/using-oauth2.md)을 통해 사용자를 인증해야 합니다. OAuth2를 사용하는 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증하기](../../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md)를 참조하세요.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검토

`KnowledgeBaseArticle_POST_ToSite.java` 클래스는 지식 기반 관련 서비스를 호출하여 지식 기반 문서를 추가합니다.

```{literalinclude} ./knowledge-base-api-basics/resources/liferay-t3x7.zip/java/KnowledgeBaseArticle_POST_ToSite.java
   :dedent: 1
   :language: java
   :lines: 9-29
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                                                                        | 묘사                                                                                     |
|:------------------------------------------------------------------------------------------------------------- |:-------------------------------------------------------------------------------------- |
| `KnowledgeBaseArticleResource.Builder builder = ...`                                                          | `KnowledgeBaseArticleResource` 서비스 인스턴스를 생성하기 위한 `빌더` 가져옵니다.                           |
| `KnowledgeBaseArticleGroupResource knowledgeBaseArticleGroupResource = builder.authentication(...).build();`  | 기본 인증을 지정하고 `KnowledgeBaseArticleResource` 서비스 인스턴스를 생성합니다.                            |
| `KnowledgeBaseArticle knowledgeBaseArticle = knowledgeBaseArticleResource.postSiteKnowledgeBaseArticle(...);` | `knowledgeBaseArticleResource.postSiteKnowledgeBaseArticle` 메서드를 호출하고 데이터를 게시물에 전달합니다. |

프로젝트에는 `com.liferay.headless.delivery.client.jar` 파일이 종속 항목으로 포함되어 있습니다. `/o/api`에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메서드의 주석은 클래스 실행을 보여줍니다.
```

다른 예제 Java 클래스는 이 클래스와 유사하지만 다른 `KnowledgeBaseArticle` 메서드를 호출합니다.

```{important}
[KnowledgeBaseArticleResource]$LIFERAY_LEARN_PORTAL_GIT_TAG$/delivery/client/resource/v1_0/KnowledgeBaseArticleResource.java)를 참조하세요.
```

다음은 cURL 및 Java를 사용하여 다른 `KnowledgeBaseArticle` REST 서비스를 호출하는 예입니다.

## 사이트에서 기술 자료 문서 가져오기

다음 cURL 또는 Java 명령을 실행하여 모든 사이트에서 기술 자료 문서를 검색할 수 있습니다. `1234` 사이트 ID로 바꿉니다.

### KnowledgeBaseArticles_GET_FromSite.sh

명령:

```bash
./KnowledgeBaseArticles_GET_FromSite.sh 1234
```

부호:

```{literalinclude} ./knowledge-base-api-basics/resources/liferay-t3x7.zip/curl/KnowledgeBaseArticles_GET_FromSite.sh
   :language: bash
```

### KnowledgeBaseArticles_GET_FromSite.java

명령:

```bash
java -classpath .:* -DsiteId=1234 KnowledgeBaseArticles_GET_FromSite
```

부호:

```{literalinclude} ./knowledge-base-api-basics/resources/liferay-t3x7.zip/java/KnowledgeBaseArticles_GET_FromSite.java
   :dedent: 1
   :language: java
   :lines: 11-26
```

인스턴스의 `KnowledgeBaseArticles` 개체가 JSON에 나타납니다.

## 기술 자료 문서 가져오기

다음 cURL 또는 Java 명령을 사용하여 해당 ID로 특정 기술 자료 문서를 가져옵니다.

```{tip}
``KnowledgeBaseArticles_GET_FromSite.[java|sh]``를 사용하여 인스턴스 ``Knowledge Base Article`` ID를 가져옵니다.
```

### KnowledgeBaseArticle_GET_ById.sh

명령:

```bash
./KnowledgeBaseArticle_GET_ById.sh 1234
```

부호:

```{literalinclude} ./knowledge-base-api-basics/resources/liferay-t3x7.zip/curl/KnowledgeBaseArticle_GET_ById.sh
   :language: bash
```

### KnowledgeBaseArticle_GET_ById.java

명령:

```bash
java -classpath .:* -DknowledgeBaseArticleId=1234 KnowledgeBaseArticle_GET_ById
```

부호:

```{literalinclude} ./knowledge-base-api-basics/resources/liferay-t3x7.zip/java/KnowledgeBaseArticle_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-20
```

`KnowledgeBaseArticle` 필드가 JSON에 나타납니다.

## 기술 자료 문서 패치

다음 cURL 및 Java 명령을 사용하여 기존 기술 자료 문서를 부분적으로 편집합니다. `1234` 기술 자료 문서의 ID로 바꿉니다. 수정할 필드와 새 값을 지정합니다.

### KnowledgeBaseArticle_PATCH_ById.sh

명령:

```bash
./KnowledgeBaseArticle_PATCH_ById.sh 1234
```

부호:

```{literalinclude} ./knowledge-base-api-basics/resources/liferay-t3x7.zip/curl/KnowledgeBaseArticle_PATCH_ById.sh
   :language: bash
```

### KnowledgeBaseArticle_PATCH_ById.java

명령:

```bash
java -classpath .:* -DknowledgeBaseArticleId=1234 KnowledgeBaseArticle_PATCH_ById
```

부호:

```{literalinclude} ./knowledge-base-api-basics/resources/liferay-t3x7.zip/java/KnowledgeBaseArticle_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-28
```

## 기술 자료 문서 넣기

다음 cURL 및 Java 명령으로 기존 기술 자료 문서를 완전히 덮어씁니다. `1234` 기술 자료 문서의 ID로 바꿉니다.

### KnowledgeBaseArticle_PUT_ById.sh

명령:

```bash
./KnowledgeBaseArticle_PUT_ById.sh 1234
```

부호:

```{literalinclude} ./knowledge-base-api-basics/resources/liferay-t3x7.zip/curl/KnowledgeBaseArticle_PUT_ById.sh
   :language: bash
```

### KnowledgeBaseArticle_PUT_ById.java

명령:

```bash
java -classpath .:* -DknowledgeBaseArticleId=1234 KnowledgeBaseArticle_PUT_ById
```

부호:

```{literalinclude} ./knowledge-base-api-basics/resources/liferay-t3x7.zip/java/KnowledgeBaseArticle_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-29
```

## 기술 자료 문서 삭제

다음 cURL 및 Java 명령을 사용하여 기존 기술 자료 문서를 삭제합니다. `1234` 기술 자료 문서의 ID로 바꿉니다.

### KnowledgeBaseArticle_DELETE_ById.sh

명령:

```bash
./KnowledgeBaseArticle_DELETE_ById.sh 1234
```

부호:

```{literalinclude} ./knowledge-base-api-basics/resources/liferay-t3x7.zip/curl/KnowledgeBaseArticle_DELETE_ById.sh
   :language: bash
```

### KnowledgeBaseArticle_DELETE_ById.java

명령

```bash
java -classpath .:* -DknowledgeBaseArticleId=1234 KnowledgeBaseArticle_DELETE_ById
```

부호:

```{literalinclude} ./knowledge-base-api-basics/resources/liferay-t3x7.zip/java/KnowledgeBaseArticle_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

## 기술 자료 폴더 서비스

기술 자료 폴더에 대한 cURL 명령 및 Java 클래스는 기술 자료 문서와 동일한 방식으로 작동합니다.

| 파일                                              | 묘사                            |
|:----------------------------------------------- |:----------------------------- |
| `KnowledgeBaseFolder_DELETE_ById.[java\|sh]`   | 지식 기반 폴더를 ID별로 삭제합니다.         |
| `KnowledgeBaseFolder_GET_ById.[java\|sh]`      | 특정 기술 자료 폴더를 ID로 가져옵니다.       |
| `KnowledgeBaseFolder_PATCH_ById.[java\|sh]`    | 지식 기반 폴더를 ID로 패치합니다.          |
| `KnowledgeBaseFolder_POST_ToSite.[java\|sh]`   | 기술 자료 폴더를 사이트에 게시합니다.         |
| `KnowledgeBaseFolder_PUT_ToSite.[java\|sh]`    | Knowledge Base 폴더를 ID별로 넣습니다. |
| `KnowledgeBaseFolders_GET_FromSite.[java\|sh]` | 사이트에서 기술 자료 폴더 목록을 가져옵니다.     |

[API Explorer](../../../headless-delivery/consuming-apis/consuming-rest-services.md) 은 `KnowledgeBaseArticle` 및 `KnowledgeBaseFolder` 서비스 및 스키마를 모두 보여주고 각 서비스를 시험해 볼 수 있는 인터페이스가 있습니다.
