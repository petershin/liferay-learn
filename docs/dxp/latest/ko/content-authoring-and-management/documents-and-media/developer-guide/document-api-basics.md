# 문서 API 기본 사항

Liferay의 헤드리스 전송 애플리케이션은 문서와 폴더를 추가하고, 정보를 나열하고, 수정하고, 삭제하는 등의 작업을 수행할 수 있는 [문서 및 미디어](../../documents-and-media.md) 용 REST 서비스를 제공합니다. 여기서는 cURL 명령과 Java 클래스를 사용하여 이러한 서비스를 호출합니다.

예제 cURL 명령과 Java 클래스를 사용하여 문서를 업로드하는 것으로 시작하세요.

## 문서 게시

```{include} /_snippets/run-liferay-portal.md
```

로그인하면 [사이트 ID 검색](../../../headless-delivery/consuming-apis/consuming-rest-services.md#identify-the-site-containing-the-data) . 여러 서비스 호출에서 이 ID를 사용합니다.

그런 다음 다음 단계를 따르십시오.

1. [예제 프로젝트](https://learn.liferay.com/dxp/latest/en/content-authoring-and-management/documents-and-media/developer-guide/liferay-g9i6.zip) 를 다운로드하고 압축을 풉니다. ):

    ```bash
    curl https://resources.learn.liferay.com/dxp/latest/en/content-authoring-and-management/documents-and-media/developer-guide/liferay-g9i6.zip -O
    ```

    ```bash
    unzip liferay-g9i6.zip
    ```

cURL 스크립트를 사용하여 [문서 및 미디어](../../documents-and-media.md)에 파일을 업로드합니다.

1. 명령줄에서 `curl` 폴더로 이동합니다.

    ```bash
    cd liferay-g9i6.zip/curl
    ```

1. 사이트 ID를 매개변수로 사용하여 `Document_POST_ToSite.sh` 스크립트를 실행하여 파일을 업로드합니다. 예를 들어

    ```bash
    ./Document_POST_ToSite.sh 1234
    ```

    ```{note}
    사용자 및 비밀번호가 각각 `test@liferay.com` 및 `test`가 아닌 경우 실행하기 전에 `Document_POST_ToSite.sh` 스크립트에서 해당 값을 바꾸세요.
    ```

스크립트는 사이트의 문서 및 미디어에 자동으로 업로드됩니다.

![문서 및 미디어에 업로드된 파일입니다.](./document-api-basics/images/01.png)

명령 응답은 다음과 같이 새 문서 및 미디어 파일을 JSON으로 설명합니다:

```json
{
  ...
  "description": "",
  ...
  "id": 38301,
  ...
  "title": "Document_POST_ToSite.sh"
}
```

응답에는 파일 설명, 새로 할당된 ID, 제목 등이 포함됩니다. 이후 명령을 위해 `아이디` 값에 유의하세요.

다음으로 Java 클래스를 사용하여 파일을 업로드합니다.

1. `java` 폴더로 이동하여 Java 소스 파일을 컴파일합니다.

    ```bash
    cd ../java
    ```

    ```bash
    javac -classpath .:* *.java
    ```

1. 아래의 `Document_POST_ToSite` 클래스를 실행하여 `siteId` 시스템 속성 값을 사이트의 ID로 바꾸어 문서 및 미디어에 파일을 업로드합니다.

    ```bash
    java -classpath .:* -DsiteId=1234 Document_POST_ToSite
    ```

    ```{note}
    사용자 및 비밀번호가 각각 `test@liferay.com` 및 `test`가 아닌 경우 `Document_POST_ToSite.java` 파일에서 해당 값을 바꾸고 클래스를 다시 컴파일한 후 실행하세요.
    ```

이 클래스는 소스 파일 `Document_POST_ToSite.java` 을 문서 및 미디어에 업로드합니다.

![Java 클래스에서 Java 소스 파일을 업로드했습니다.](./document-api-basics/images/02.png)

cURL 명령과 Java 클래스가 어떻게 작동하는지 계속 읽어보세요.

## cURL 명령 살펴보기

`Document_POST_ToSite.sh` 스크립트는 `헤드리스-딜리버리` 애플리케이션 REST 서비스를 cURL로 호출하여 파일을 업로드합니다.

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/curl/Document_POST_ToSite.sh
   :language: bash
```

명령의 인수는 다음과 같습니다:

| 인수                                                                      | 묘사                                                                    |
|:----------------------------------------------------------------------- |:--------------------------------------------------------------------- |
| `-F "file=@Document_POST_ToSite.sh"`                                    | 게시할 파일입니다.                                                            |
| `-H "Content-Type: multipart/form-data"`                                | 게시 중인 미디어 유형( [MIME 유형](https://en.wikipedia.org/wiki/Media_type) )입니다. |
| `-X POST`                                                               | 지정된 엔드포인트에서 호출할 HTTP 메서드입니다.                                          |
| `"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/documents"` | REST 서비스 엔드포인트입니다. 사이트 ID 매개 변수가 `${1}`를 대체합니다.                       |
| `-u "test@liferay.com:learn"`                                           | 기본 인증 자격 증명.                                                          |

```{note}
여기서는 데모 목적으로 기본 인증이 사용됩니다. 프로덕션의 경우, [OAuth 2.0](../../../헤드리스-딜리버리/using-oauth2.md)을 통해 사용자에게 권한을 부여해야 합니다. OAuth2를 사용하는 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증](../../../헤드리스-딜리버리/using-oauth2/using-oauth2-to-authorize-users.md)를 참조하세요.
```

`Document` 및 `DocumentFolder` REST 서비스에 대한 다른 cURL 명령은 유사한 인수를 사용합니다.

다음으로 Java 호출이 얼마나 유사한지 확인할 수 있습니다.

## Java 클래스 살펴보기

`Document_POST_ToSite.java` 클래스는 `헤드리스-딜리버리` 애플리케이션 REST 서비스를 호출하여 파일을 업로드합니다.

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/java/Document_POST_ToSite.java
   :dedent: 1
   :language: java
   :lines: 10-29
```

이 클래스는 단 세 줄의 코드만 사용하여 REST 서비스를 호출합니다:

| 라인(축약)                                                                     | 묘사                                                                                                                                                                       |
|:-------------------------------------------------------------------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `DocumentResource.Builder builder = ...`                                   | `DocumentResource` 서비스 인스턴스를 생성하기 위한 `빌더` 를 가져옵니다.                                                                                                                       |
| `DocumentResource documentResource = builder.authentication(...).build();` | 기본 인증을 지정하고 `DocumentResource` 서비스 인스턴스를 생성합니다.                                                                                                                          |
| `Document document = documentResource.postSiteDocument(...);`              | `DocumentResource.postSiteDocument` 메서드를 호출하여 사이트 ID, 업로드된 파일을 나타내는 `Document` 객체, 업로드할 파일을 지정하는 해시 맵을 전달합니다. 이 예제에서는 편의를 위해 로컬 파일 `Document_POST_ToSite.java` 을 사용했습니다. |

이 프로젝트에는 종속성으로 `com.liferay.headless.delivery.client.jar` 파일이 포함되어 있습니다. 설치에 있는 API 탐색기( `/o/api`)에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
main` 메서드의 주석은 클래스를 실행하는 것을 보여줍니다.
```

다른 예제 Java 클래스는 이 클래스와 유사하지만 다른 `DocumentResource` 메서드를 호출합니다.

```{important}
자세한 서비스 내용은 [DocumentResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-divery/headless-divery-client/src/main/java/com/liferay/headless/divery/client/resource/v1_0/DocumentResource.java) 를 참조하세요.
```

다음은 cURL 및 Java를 사용하여 다른 `문서` REST 서비스를 호출하는 예입니다.

## 사이트 문서 가져오기

다음 cURL 또는 Java 명령을 실행하여 사이트의 문서를 나열할 수 있습니다. 위와 같이 `1234` 을 사이트 ID로 바꿉니다.

### Documents_GET_FromSite.sh

명령:

```bash
./Documents_GET_FromSite.sh 1234
```

부호:

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/curl/Documents_GET_FromSite.sh
   :language: bash
```

### Documents_GET_FromSite.java

명령:

```bash 
java -classpath .:* -DsiteId=1234 Documents_GET_FromSite
```

부호:

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/java/Documents_GET_FromSite.java
   :dedent: 1
   :language: java
   :lines: 11-23
```

사이트의 `문서` 개체가 JSON으로 나열됩니다.

## 문서 받기

다음 cURL 또는 Java 명령을 실행하여 `문서`의 필드를 가져올 수 있습니다. `1234` 을 `문서`의 ID로 바꿉니다.

```{tip}
도큐먼트` 사이트 `도큐먼트` ID를 가져오려면 `Documents_GET_FromSite.[java|sh]`를 사용합니다.
```

### Document_GET_ById.sh

명령:

```bash
./Document_GET_ById.sh 1234
```

부호:

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/curl/Document_GET_ById.sh
   :language: bash
```

### Document_GET_ById.java

명령:

```bash
java -classpath .:* -DdocumentId=1234 Document_GET_ById
```

부호:

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/java/Document_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`문서` 필드는 JSON으로 나열됩니다.

## 문서 콘텐츠 가져오기

`문서` 콘텐츠는 Base64로 인코딩되어 `문서`의 `nestedFields`에 임베드됩니다. 다음 cURL 또는 Java 명령을 실행하여 콘텐츠를 가져올 수 있습니다. `1234` 을 `문서`의 ID로 바꿉니다.

### Document_GET_ById_ContentValue.sh

명령:

```bash
./Document_GET_ById_ContentValue.sh 1234
```

부호:

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/curl/Document_GET_ById_ContentValue.sh
   :language: bash
```

첫 번째 인수 줄은 각각 서비스 엔드포인트와 인증 자격 증명을 지정합니다. URL의 `/o/headless-divery/v1.0/documents/${1}` 부분은 해당 ID로 `문서` 를 가져오는 REST 서비스 엔드포인트입니다. 이 URL은 `Document_GET_ById.sh` 스크립트의 URL과 동일합니다. `?nestedFields=contentValue` 부분은 `문서`의 `nestedFields`에 임베드된 `contentValue` 를 요청합니다. 마지막으로 `&fields=contentValue` 부분은 `contentValue` 필드를 필터링하여 콘텐츠 필드만 반환되도록 합니다. 그러나 서비스만 호출하면 다음과 같이 JSON으로 래핑된 Base64 인코딩된 콘텐츠가 반환됩니다:

```json
{
  "contentValue" : "Y3VybCBcCgktRiAiZmlsZT1ARG9jdW1lbnRfUE9TVF9Ub1NpdGUuc2giIFwKCS1IICJDb250ZW50LVR5cGU6IG11bHRpcGFydC9mb3JtLWRhdGEiIFwKCS1YIFBPU1QgXAoJImh0dHA6Ly9sb2NhbGhvc3Q6ODA4MC9vL2hlYWRsZXNzLWRlbGl2ZXJ5L3YxLjAvc2l0ZXMvJHsxfS9kb2N1bWVudHMiIFwKCS11ICJ0ZXN0QGxpZmVyYXkuY29tOnRlc3Qi"
}
```

서비스 호출 이후의 루틴은 인코딩된 콘텐츠를 처리합니다. `sed` 및 `awk` 루틴은 `Document` 콘텐츠 값을 분리하고 `tr` 루틴은 이를 디코딩합니다. 다음은 업로드한 `Document_POST_ToSite.sh` `문서` 에 대해 반환된 디코딩된 콘텐츠입니다:

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/curl/Document_GET_ById_ContentValue.sh
   :language: bash
```

### Document_GET_ById_ContentValue.java

`문서` 콘텐츠를 가져와서 디코딩하는 Java 코드는 이전 cURL 명령보다 간단합니다.

명령:

```bash
java -classpath .:* -DdocumentId=1234 Document_GET_ById_ContentValue
```

부호:

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/java/Document_GET_ById_ContentValue.java
   :dedent: 1
   :language: java
   :lines: 11-27
```

대부분의 코드는 `Document_POST_ToSite.java`의 코드와 유사합니다. 몇 가지 주요 차이점이 있습니다.

다음 줄은 `contentValue` 중첩 필드를 요청 매개변수로 추가합니다.

```java
builder.parameter("nestedFields", "contentValue");
```

`문서` 를 ID로 가져온 후, `Base64.Decoder` 가 `문서`의 콘텐츠를 디코딩합니다.

```java
Base64.Decoder decoder = Base64.getDecoder();
```

## 문서 패치

`문서`의 패치 서비스가 `문서` 와 해당 필드를 업데이트합니다. 다음 cURL 또는 Java 명령을 실행하여 `문서` 를 업데이트할 수 있습니다. `1234` 을 `문서`의 ID로 바꿉니다.

### Document_PATCH_ById.sh

명령:

```bash
./Document_PATCH_ById.sh 1234
```

부호:

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/curl/Document_PATCH_ById.sh
   :language: bash
```

첫 번째 양식 데이터 부분( `-F`다음)은 `문서`의 `설명` 필드에 대한 새 값을 지정합니다. 두 번째 양식 데이터 부분은 업로드할 업데이트된 파일을 지정합니다. 두 가지 모두 필수는 아닙니다. 파일만 패치하거나 문서의 메타데이터만 패치할 수 있습니다.

### Document_PATCH_ById.java

명령:

```bash 
java -classpath .:* -DdocumentId=1234 Document_PATCH_ById
```

부호:

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/java/Document_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 13-34
```

위의 Java 코드는 `DocumentResource`의 `patchDocument` 메서드를 호출하여 `Document`의 ID, 업데이트할 필드가 포함된 `Document` 객체 및 업로드할 업데이트된 파일을 전달합니다.

위의 명령은 `문서`의 설명을 "바"로 업데이트합니다.

![cURL 명령으로 문서 설명이 변경되었습니다.](./document-api-basics/images/03.png)

## 문서 넣기

`문서`의 PUT 서비스는 `문서` 와 해당 필드를 완전히 대체합니다. 다음 cURL 또는 Java 명령을 실행하여 `문서` 를 대체할 수 있습니다. `1234` 을 `문서`의 ID로 바꿉니다.

### Document_PUT_ById.sh

명령:

```bash
./Document_PUT_ById.sh 1234
```

부호:

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/curl/Document_PUT_ById.sh
   :language: bash
```

첫 번째 양식 데이터 부분은 새로운 `설명` 및 `제목` 필드 값을 설정합니다. 두 번째 양식 데이터 부분은 업로드할 대체 파일을 지정합니다.

### Document_PUT_ById.java

명령:

```bash
java -classpath .:* -DdocumentId=1234 Document_PUT_ById
```

부호:

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/java/Document_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 13-35
```

위의 Java 코드는 `DocumentResource`의 `putDocument` 메서드를 호출하여 `Document`의 ID, `Document` 객체( `Document`의 `description` 및 `title` 필드에 대한 값을 포함), 업로드할 대체 파일을 전달합니다.

위의 cURL 명령과 Java 클래스는 `Document` 인스턴스를 각각 새 제목 "Document_PUT_ById.sh"와 "Document_PUT_ById.java"를 가진 완전히 새로운 인스턴스로 바꾸고 설명을 "Goo"로 지정합니다.

```{warning}
현재 `문서`의 제목을 사용하지 않으려면 대체 `문서`에 원하는 `제목` 값을 지정해야 합니다.
```

![cURL 명령이 문서를 대체했습니다.](./document-api-basics/images/04.png)

## 문서 삭제

다음 cURL 또는 Java 명령을 실행하여 `문서` 를 삭제할 수 있습니다. `1234` 을 `문서`의 ID로 바꿉니다.

### Document_DELETE_ById.sh

명령:

```bash
./Document_DELETE_ById.sh 1234
```

부호:

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/curl/Document_DELETE_ById.sh
   :language: bash
```

### Document_DELETE_ById.java

명령

```bash 
java -classpath .:* -DdocumentId=1234 Document_DELETE_ById
```

부호:

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/java/Document_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

`문서`가 문서 및 미디어에서 제거되었습니다.

## 더 많은 문서 및 문서 폴더 서비스

다음 cURL 명령과 Java 클래스는 `Document` 서비스 및 `DocumentFolder` 서비스에 대해 자세히 설명합니다.

| 파일                                           | 묘사                   |
|:-------------------------------------------- |:-------------------- |
| `Document_POST_ToDocumentFolder.[java\|sh]` | 폴더에 문서를 게시합니다.       |
| `DocumentFolder_GET_ById.[java\|sh]`        | 폴더의 필드를 나열합니다.       |
| `DocumentFolder_PATCH_ById.[java\|sh]`      | 폴더와 해당 필드를 업데이트합니다.  |
| `DocumentFolder_POST_ToSite.[java\|sh]`     | 사이트에 문서 폴더를 게시합니다.   |
| `DocumentFolder_PUT_ById.[java\|sh]`        | 폴더와 해당 필드를 완전히 바꿉니다. |
| `DocumentFolders_GET_FromSite.[java\|sh]`   | 사이트의 폴더를 나열합니다.      |

[API 탐색기](../../../headless-delivery/consuming-apis/consuming-rest-services.md) 에는 `Document` 및 `DocumentFolder` 서비스 및 스키마가 모두 나열되어 있으며 각 서비스를 사용해 볼 수 있는 인터페이스가 있습니다.

[DocumentResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-delivery/headless-delivery-client/src/main/java/com/liferay/headless/delivery/client/resource/v1_0/DocumentResource.java) 및 [DocumentFolderResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-delivery/headless-delivery-client/src/main/java/com/liferay/headless/delivery/client/resource/v1_0/DocumentFolderResource.java) Java 인터페이스도 참조하세요.

## 관련 주제

* [문서 및 미디어](../../documents-and-media.md)
* [REST 서비스 사용](../../../headless-delivery/consuming-apis/consuming-rest-services.md)
* [API 헤더 참조](../../../headless-delivery/consuming-apis/api-headers-reference.md)
* [GraphQL API 사용](../../../headless-delivery/consuming-apis/consuming-graphql-apis.md)
