# 블로그 API 기본 사항

Liferay의 REST API는 블로그 게시물 및 이미지를 추가, 수정 및 삭제하는 서비스를 제공합니다.

새 블로그 게시물을 추가하는 예부터 살펴보세요.

## 블로그 게시물 추가

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르세요.

1. [블로그 API 기본 사항](./liferay-r3g4.zip) 을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/content-authoring-and-management/blogs/developer-guide/liferay-r3g4.zip -O
   ```

   ```bash
   unzip liferay-r3g4.zip
   ```

2. [사이트 ID 찾기](../../../headless-delivery/consuming-apis/consuming-rest-services.md#identify-the-site-containing-the-data) . 아래의 다른 서비스 호출에서 이것을 사용합니다.

3. cURL 스크립트를 사용하여 사이트에 새 블로그 게시물을 추가하십시오. 명령줄에서 `curl` 폴더로 이동합니다. 사이트 ID를 매개변수로 사용하여 `BlogPosting_POST_ToSite.sh` 스크립트를 실행합니다.

    ```bash
    ./BlogPosting_POST_ToSite.sh 1234
    ```

    JSON 응답은 새 블로그 게시물이 추가되었음을 보여줍니다.

    ```bash
    "alternativeHeadline" : "",
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
    "dateCreated" : "2021-07-21T21:26:55Z",
    "dateModified" : "2021-07-21T21:26:55Z",
    "datePublished" : "2021-07-21T21:26:00Z",
    "description" : "",
    "encodingFormat" : "text/html",
    "friendlyUrlPath" : "able",
    "headline" : "Able",
    "id" : 38511,
    "keywords" : [ ],
    "numberOfComments" : 0,
    "relatedContents" : [ ],
    "siteId" : 20121,
    "taxonomyCategoryBriefs" : [ ]
    ```

1. *관리 메뉴* &rarr; *콘텐츠 & 데이터* &rarr; *블로그*로 이동하여 블로그 애플리케이션으로 이동합니다. 새 블로그 게시물이 추가되었는지 확인합니다.

    ![새 블로그 게시물이 추가되었는지 확인합니다.](./blog-api-basics/images/01.png)

1. REST 서비스는 Java 클래스로 호출할 수도 있습니다. `curl` 폴더에서 `java` 폴더로 이동합니다. 소스 파일을 컴파일합니다.

    ```bash
    javac -classpath .:* *.java
    ```

1. `BlogPosting_POST_ToSite` 클래스를 실행합니다. `siteId` 값을 사이트 ID로 바꿉니다.

    ```bash
    java -classpath .:* -DsiteId=1234 BlogPosting_POST_ToSite
    ```

## cURL 명령 검사

`BlogPosting_POST_ToSite.sh` 스크립트는 cURL 명령으로 REST 서비스를 호출합니다.

```{literalinclude} ./blog-api-basics/resources/liferay-r3g4.zip/curl/BlogPosting_POST_ToSite.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                          | 묘사                      |
|:--------------------------------------------------------------------------- |:----------------------- |
| `-H "Content-Type: application/json"`                                       | 요청 본문 형식이 JSON임을 나타냅니다. |
| `-X POST`                                                                   | 지정된 끝점에서 호출할 HTTP 메서드   |
| `"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/blog-postings"` | REST 서비스 끝점             |
| `-d "{\"articleBody\": \"Foo\", \"headline\": \"Able\"}"`           | 게시를 요청하는 데이터            |
| `-u "test@liferay.com:learn"`                                               | 기본 인증 자격 증명             |

```{note}
여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth2](../../../headless-delivery/using-oauth2.md)을 통해 사용자를 인증해야 합니다. OAuth2를 사용하는 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증하기](../../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md)를 참조하세요.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검토

`BlogPosting_POST_ToSite.java` 클래스는 블로그 포스팅 관련 서비스를 호출하여 블로그 포스트를 추가합니다.

```{literalinclude} ./blog-api-basics/resources/liferay-r3g4.zip/java/BlogPosting_POST_ToSite.java
   :dedent: 1
   :language: java
   :lines: 9-26
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                                           | 묘사                                                                   |
|:-------------------------------------------------------------------------------- |:-------------------------------------------------------------------- |
| `BlogPostingResource.Builder builder = ...`                                      | `BlogPostingResource` 서비스 인스턴스를 생성하기 위한 `빌더` 을 가져옵니다.                |
| `BlogPostingResource blogPostingResource = builder.authentication(...).build();` | 기본 인증을 지정하고 `BlogPostingResource` 서비스 인스턴스를 생성합니다.                   |
| `BlogPosting blogPosting = blogPostingResource.postSiteBlogPosting(...);`        | `BlogPostingResource.postSiteBlogPosting` 메서드를 호출하고 데이터를 게시물에 전달합니다. |

프로젝트에는 `com.liferay.headless.delivery.client.jar` 파일이 종속 항목으로 포함되어 있습니다. `/o/api`에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메서드의 주석은 클래스 실행을 보여줍니다.
```

다른 예제 Java 클래스는 이것과 유사하지만 다른 `BlogPostingResource` 메소드를 호출합니다.

```{important}
[BlogPostingResource]$LIFERAY_LEARN_PORTAL_GIT_TAG$/delivery/client/resource/v1_0/BlogPostingResource.java)에서 서비스 세부정보를 참조하세요.
```

다음은 cURL과 Java를 사용하여 다른 `BlogPosting` REST 서비스를 호출하는 예입니다.

## 사이트에서 블로그 게시물 가져오기

다음 cURL 또는 Java 명령을 실행하여 사이트의 블로그 게시물을 나열할 수 있습니다. 위와 같이 `1234` 을 사이트 ID로 바꿉니다.

### BlogPostings_GET_FromSite.sh

명령:

```bash
./BlogPostings_GET_FromSite.sh 1234
```

부호:

```{literalinclude} ./blog-api-basics/resources/liferay-r3g4.zip/curl/BlogPostings_GET_FromSite.sh
   :language: bash
```

### BlogPostings_GET_FromSite.java

명령:

```bash 
java -classpath .:* -DsiteId=1234 BlogPostings_GET_FromSite
```

부호:

```{literalinclude} ./blog-api-basics/resources/liferay-r3g4.zip/java/BlogPostings_GET_FromSite.java
   :dedent: 1
   :language: java
   :lines: 11-23
```

사이트의 `BlogPosting` 개체가 JSON에 나열됩니다.

## 블로그 게시물 받기

다음 cURL 또는 Java 명령을 사용하여 특정 블로그 게시물을 가져옵니다. `1234` 을 블로그 게시물의 ID로 바꿉니다.

```{tip}
`BlogPostings_GET_FromSite.[java|sh]`를 사용하여 `BlogPosting` ID를 가져옵니다.
```

### BlogPosting_GET_ById.sh

명령:

```bash
./BlogPosting_GET_ById.sh 1234
```

부호:

```{literalinclude} ./blog-api-basics/resources/liferay-r3g4.zip/curl/BlogPosting_GET_ById.sh
   :language: bash
```

### BlogPosting_GET_ById.java

명령:

```bash
java -classpath .:* -DblogPostingId=1234 BlogPosting_GET_ById
```

부호:

```{literalinclude} ./blog-api-basics/resources/liferay-r3g4.zip/java/BlogPosting_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`BlogPosting` 필드는 JSON에 나열됩니다.

## 블로그 게시물 패치

다음 cURL 및 Java 명령을 사용하여 기존 블로그 게시물을 부분적으로 편집합니다. 참고: `1234` 을 블로그 게시물의 ID로 바꾸십시오.

### BlogPosting_PATCH_ById.sh

명령:

```bash
./BlogPosting_PATCH_ById.sh 1234
```

부호:

```{literalinclude} ./blog-api-basics/resources/liferay-r3g4.zip/curl/BlogPosting_PATCH_ById.sh
   :language: bash
```

### BlogPosting_PATCH_ById.java

명령:

```bash 
java -classpath .:* -DblogPostingId=1234 BlogPosting_PATCH_ById
```

부호:

```{literalinclude} ./blog-api-basics/resources/liferay-r3g4.zip/java/BlogPosting_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

이 예에서 기사 본문 내용은 Foo에서 Bar로 변경됩니다.

## 블로그 게시물 올리기

다음 cURL 및 Java 명령을 사용하여 기존 블로그 게시물을 완전히 덮어씁니다. `1234` 을 블로그 게시물의 ID로 바꾸십시오.

### BlogPosting_PUT_ById.sh

명령:

```bash
./BlogPosting_PUT_ById.sh 1234
```

부호:

```{literalinclude} ./blog-api-basics/resources/liferay-r3g4.zip/curl/BlogPosting_PUT_ById.sh
   :language: bash
```

### BlogPosting_PUT_ById.java

명령:

```bash
java -classpath .:* -DblogPostingId=1234 BlogPosting_PUT_ById
```

부호:

```{literalinclude} ./blog-api-basics/resources/liferay-r3g4.zip/java/BlogPosting_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-26
```

## 블로그 게시물 삭제

다음 cURL 및 Java 명령을 사용하여 기존 블로그 게시물을 삭제합니다. `1234` 을 블로그 게시물의 ID로 바꾸십시오.

### BlogPosting_DELETE_ById.sh

명령:

```bash
./BlogPosting_DELETE_ById.sh 1234
```

부호:

```{literalinclude} ./blog-api-basics/resources/liferay-r3g4.zip/curl/BlogPosting_DELETE_ById.sh
   :language: bash
```

### BlogPosting_DELETE_ById.java

명령

```bash 
java -classpath .:* -DblogPostingId=1234 BlogPosting_DELETE_ById
```

부호:

```{literalinclude} ./blog-api-basics/resources/liferay-r3g4.zip/java/BlogPosting_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

## 블로그 게시물 이미지 서비스

블로그 이미지에 대한 cURL 명령 및 Java 클래스는 블로그 게시물과 동일한 방식으로 작동합니다.

| 파일                                           | 묘사                           |
|:-------------------------------------------- |:---------------------------- |
| `BlogPostingImage_DELETE_ById.[java\|sh]`   | ID별로 블로그 게시물 이미지를 삭제합니다.     |
| `BlogPostingImage_GET_ById.[java\|sh]`      | 특정 블로그 게시물 이미지를 ID로 가져옵니다.   |
| `BlogPostingImage_POST_ToSite.[java\|sh]`   | 블로그 게시물 이미지를 사이트에 게시합니다.     |
| `BlogPostingImages_GET_FromSite.[java\|sh]` | 사이트에서 블로그 게시물 이미지 목록을 가져옵니다. |

[API Explorer](../../../headless-delivery/consuming-apis/consuming-rest-services.md) 은 `BlogPosting` 및 `BlogPostingImage` 서비스 및 스키마를 모두 나열하고 각 서비스를 시험해 볼 수 있는 인터페이스가 있습니다.
