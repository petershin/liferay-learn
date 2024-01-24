# 웹 콘텐츠 API 기본 사항

Liferay DXP REST 서비스를 사용하여 사이트에서 구조화된 콘텐츠를 만들고 관리할 수 있습니다. 구조화된 콘텐츠는 웹 콘텐츠 구조를 사용하는 [웹 콘텐츠](../web-content-articles/adding-a-basic-web-content-article.md) 입니다. 구조는 웹 콘텐츠 기사에 포함된 작성자, 요약 및 콘텐츠와 같은 정보를 정의합니다. 구조는 콘텐츠에 필요한 모든 정보가 포함되도록 합니다. 자세한 내용은 [웹 콘텐츠 구조 이해](../web-content-structures/understanding-web-content-structures.md)참조하십시오.

```{note}
[웹 콘텐츠 템플릿](../web-content-templates/creating-web-content-templates.md)과 함께 구조를 사용하여 구조화된 콘텐츠를 렌더링할 수 있지만 구조화된 콘텐츠를 만드는 데 템플릿이 필요하지는 않습니다.
```

아래의 구조 및 구조화된 콘텐츠에 대한 cURL 및 Java 샘플을 참조하세요. 구조화된 콘텐츠 관리에 대한 고급 예제는 [고급 웹 콘텐츠 API](./advanced-web-content-api.md) 을 참조하십시오. Liferay DXP에서 REST API 사용에 대한 개요는 [REST 서비스 사용](../../../headless-delivery/consuming-apis/consuming-rest-services.md)참조하십시오.

## 환경 설정

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르십시오.

1. [Web Content API Basics](./liferay-r4h9.zip) 파일을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/content-authoring-and-management/web-content/developer-guide/liferay-r4h9.zip -O
   ```

   ```bash
   unzip liferay-r4h9.zip
   ```

   !!! note
      이러한 스크립트는 기본 인증을 사용하며 테스트용으로 설계되었습니다. 프로덕션 Liferay DXP 환경에서 기본 인증을 사용하지 마십시오.

1. 환경을 설정하려면 다음 단계를 완료하십시오.

   1. [사용할 서비스 식별](#identify-the-services-to-consume)
   1. [사이트 ID 식별](#identify-the-site-id)

### 사용할 서비스 식별

Liferay DXP Headless Delivery API에서 다음 서비스를 사용하여 웹 콘텐츠를 관리합니다.

- 웹 콘텐츠 기사용 `StructuredContent`.
- `웹 컨텐츠 구조용 ContentStructure`.
- `웹 콘텐츠 템플릿용 ContentTemplate`.

이러한 서비스와 사용 가능한 HTTP 메서드를 식별하려면 Liferay API 탐색기를 사용하십시오. 자세한 내용은 [REST 서비스 사용](../../../headless-delivery/consuming-apis/consuming-rest-services.md)참조하십시오.

### 사이트 ID 식별

사이트 ID를 식별하려면 [여기](../../../headless-delivery/consuming-apis/consuming-rest-services.md#identify-the-site-containing-the-data) 지침을 따르십시오.

### 사용자 인터페이스에서 기본 웹 콘텐츠 기사 만들기

웹 콘텐츠를 생성하려면 웹 콘텐츠 구조가 필요합니다. 구조를 선언하지 않고 사용자 인터페이스에서 웹 콘텐츠를 생성하면 Liferay DXP는 기본 기본 웹 콘텐츠 구조를 사용합니다.

!!! note
   기본 웹 콘텐츠 구조는 Liferay DXP 사용자 인터페이스에 표시되지 않습니다.

이러한 예에서는 단일 텍스트 필드와 기본 기본 웹 콘텐츠 구조가 있는 기본 웹 콘텐츠 기사를 사용합니다. 다음 단계를 사용하여 웹 콘텐츠를 만듭니다.

1. 사이트 메뉴(![Site menu](../../../images/icon-menu.png))를 열고 **콘텐츠 & 데이터** &rarr; **웹 콘텐츠** 으로 이동합니다.
1. **웹 콘텐츠** 탭에서 추가(![Add](../../../images/icon-add.png))를 클릭하고 **기본 웹 콘텐츠** 선택합니다.

   ![웹 콘텐츠 패널에서 기본 웹 콘텐츠 기사를 만듭니다.](./web-content-api-basics/images/01.png)

1. New Web Content 이름으로 **Foo** 입력하고 **Publish** 클릭합니다.

   ![웹 콘텐츠 기사는 기본적으로 기본 웹 콘텐츠 구조를 사용합니다.](./web-content-api-basics/images/02.png)

자세한 내용은 [기본 웹 콘텐츠 추가 기사](../web-content-articles/adding-a-basic-web-content-article.md)을 참조하십시오.

## 사이트에서 웹 콘텐츠 기사 가져오기

다음 cURL 또는 Java 명령을 실행하여 사이트의 웹 콘텐츠 기사를 검색할 수 있습니다. `1234` 사이트 ID로 바꿉니다.

### StructuredContents_GET_FromSite.sh

`StructuredContents_GET_FromSite.sh` cURL 스크립트는 사이트의 모든 웹 콘텐츠 기사를 나열합니다. 이 스크립트는 `StructuredContent` 서비스를 `GET` HTTP 메서드와 함께 사용하고 사이트 ID는 유일한 매개변수로 사용합니다.

| 방법    | 서비스                 | 끝점                                         |
|:----- |:------------------- |:------------------------------------------ |
| `GET` | `StructuredContent` | `/v1.0/sites/{siteID}/structured-contents` |

```bash
./StructuredContents_GET_FromSite.sh 1234
```

| 매개 변수 # | 묘사       |
|:------- |:-------- |
| `$1`    | `siteId` |

아래는 스크립트에 의해 생성된 부분 JSON 출력입니다. 이 출력에서 `id` 및 `friendlyUrlPath`의 친숙한 URL로 식별되는 단일 웹 콘텐츠 기사를 볼 수 있습니다. 웹 콘텐츠는 `contentStructureId`의 구조를 사용합니다. 이 구조에는 `contentFields`아래의 `contentFieldValue` 섹션에 설명된 단일 텍스트 필드가 있습니다. 구조에 더 많은 요소를 포함하면 이러한 요소를 설명하는 추가 `contentFieldValue` 섹션을 볼 수 있습니다.

```json
{
  "actions" : {
    ...
  },
  "facets" : [ ],
  "items" : [ {
    "actions" : {
   ...
    },
    "availableLanguages" : [ "en-US" ],
    "contentFields" : [ {
      "contentFieldValue" : {
        "data" : ""
      },
      "dataType" : "string",
      "label" : "content",
      "name" : "content",
      "nestedContentFields" : [ ],
      "repeatable" : false
    } ],
    "contentStructureId" : 40697,
    "creator" : {
      "additionalName" : "",
      "contentType" : "UserAccount",
      "familyName" : "Bowman",
      "givenName" : "David",
      "id" : 20129,
      "name" : "David Bowman"
    },
    "customFields" : [ ],
    "dateCreated" : "2021-08-10T08:10:21Z",
    "dateModified" : "2021-08-10T08:10:21Z",
    "datePublished" : "2021-08-10T08:10:00Z",
    "description" : "",
    "externalReferenceCode" : "41537",
    "friendlyUrlPath" : "foo",
    "id" : 41539,
    "key" : "41537",
    "keywords" : [ ],
    "numberOfComments" : 0,
    "relatedContents" : [ ],
    "renderedContents" : [ {
      "contentTemplateId" : "BASIC-WEB-CONTENT",
      "contentTemplateName" : "Basic Web Content",
      "markedAsDefault" : true,
      "renderedContentURL" : "http://localhost:8080/o/headless-delivery/v1.0/structured-contents/41539/rendered-content/BASIC-WEB-CONTENT"
    } ],
    "siteId" : 20125,
    "subscribed" : false,
    "taxonomyCategoryBriefs" : [ ],
    "title" : "Foo",
    "uuid" : "162155dc-c9aa-96b0-df5c-a61c591d1389"
  } ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 1
}
```

JSON 출력에서 다음 정보를 검토하십시오.

- 출력에는 `id: 41539`, `제목: Foo`및 친근한 URL `friendlyUrlPath: foo`로 식별되는 단일 웹 콘텐츠 기사가 표시됩니다.
- 이 웹 콘텐츠는 `contentStructureId`에서 식별된 기본 Liferay DXP 웹 콘텐츠 구조를 사용합니다.
- 웹 콘텐츠 구조에는 `contentFields`아래의 `contentFieldValue` 섹션에 설명된 단일 텍스트 필드가 있습니다. 구조에 더 많은 요소를 포함하면 이러한 요소를 설명하는 추가 `contentFieldValue` 섹션을 볼 수 있습니다.
- 사용자 인터페이스의 웹 콘텐츠 ID는 JSON 출력의 `키` 속성에 해당합니다.

   ![JSON 키 속성은 사용자 인터페이스의 구조화된 콘텐츠 식별자에 해당합니다.](./web-content-api-basics/images/03.png)

### StructuredContents_GET_FromSite.java

`StructuredContents_GET_FromSite.java` 클래스는 구조화된 콘텐츠 관련 서비스를 호출하여 웹 콘텐츠 기사 목록을 가져옵니다.

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/java/StructuredContents_GET_FromSite.java
   :dedent: 1
   :language: java
   :lines: 11-26
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                                                               | 묘사                                                                              |
|:---------------------------------------------------------------------------------------------------- |:------------------------------------------------------------------------------- |
| `StructuredContentResource.Builder builder = ...`                                                    | `StructuredContentResource` 서비스 인스턴스를 생성하기 위한 `빌더` 가져옵니다.                       |
| `StructuredContentResource structuredContentResource = builder.authentication(...).build();`         | 기본 인증을 지정하고 `StructuredContentResource` 서비스 인스턴스를 생성합니다.                        |
| `Page<StructuredContent> page = structuredContentResource.getSiteStructuredContentsPage(...);` | `structuredContentResource.getSiteStructuredContentsPage` 메서드를 호출하고 데이터를 검색합니다. |

프로젝트에는 `com.liferay.headless.delivery.client.jar` 파일이 종속 항목으로 포함되어 있습니다. `/o/api`에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메서드의 주석은 클래스 실행을 보여줍니다.
```

다른 예제 Java 클래스는 이 클래스와 비슷하지만 다른 `StructuredContentResource` 메서드를 호출합니다.

!!! important
   [StructuredContentResource]$LIFERAY_LEARN_PORTAL_GIT_TAG$/delivery/client/resource/v1_0/StructuredContentResource.java)를 참조하세요.

다음은 cURL 및 Java를 사용하여 다른 REST 서비스를 호출하는 예입니다.

## 웹 콘텐츠 기사 받기

[이전 단계](#get-web-content-articles-from-site) 의 스크립트는 사이트의 모든 웹 콘텐츠 기사를 반환합니다. 특정 기사를 가져오려면 `StructuredContent_GET_ById.[java|sh]` 스크립트를 사용하십시오. `1234` 웹 콘텐츠 기사의 ID로 바꿉니다.

### StructuredContent_GET_ById.sh

명령:

```bash
./StructuredContent_GET_ById.sh 1234
```

부호:

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/curl/StructuredContent_GET_ById.sh
   :language: bash
```

### StructuredContent_GET_ById.java

명령:

```bash
java -classpath .:* -DstructuredContentId=1234 StructuredContent_GET_ById
```

부호:

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/java/StructuredContent_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-20
```

`StructuredContent` 필드가 JSON에 나타납니다.

## 웹 콘텐츠 구조 가져오기

다음 cURL 또는 Java 명령을 실행하여 사이트의 콘텐츠 구조를 검색할 수 있습니다. `1234` 사이트 ID로 바꿉니다.

!!! note
   기본 기본 웹 콘텐츠 구조는 이 끝점을 사용하여 볼 수 없습니다.

### ContentStructures_GET_FromSite.sh

명령:

```bash
./ContentStructures_GET_FromSite.sh 1234
```

부호:

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/curl/ContentStructures_GET_FromSite.sh
   :language: bash
```

### ContentStructures_GET_FromSite.java

명령:

```bash
java -classpath .:* -DsiteId=1234 ContentStructures_GET_FromSite
```

부호:

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/java/ContentStructures_GET_FromSite.java
   :dedent: 1
   :language: java
   :lines: 11-26
```

사이트의 `ContentStructure` 개체가 JSON에 나타납니다.

## ID로 웹 콘텐츠 구조 가져오기

샘플 웹 콘텐츠 기사의 기본 웹 콘텐츠 구조는 Liferay DXP 사용자 인터페이스에 표시되지 않습니다. 그러나 `ContentStructure` 서비스를 사용하여 구조의 설명을 수집할 수 있습니다.

`ContentStructure_GET_ById.[java|sh]` 스크립트는 웹 콘텐츠 구조 설명을 반환합니다.

### ContentStructure_GET_ById.sh

| 방법    | 서비스                | 끝점                                              |
|:----- |:------------------ |:----------------------------------------------- |
| `GET` | `ContentStructure` | `/v1.0/content-structures/{contentStructureId}` |

```bash
./ContentStructure_GET_ById.sh 40697
```

| 매개 변수 # | 묘사                   |
|:------- |:-------------------- |
| $1      | `contentStructureId` |

아래는 JSON 출력입니다. `ID` 및 `이름`으로 Liferay DXP의 기본 웹 콘텐츠 구조를 식별할 수 있습니다. `contentStructureFields` 섹션에는 구조 필드에 대한 설명이 포함되어 있습니다. 이 구조에는 유형 `문자열` 및 이름 `내용`의 단일 컨텐츠 필드가 포함되어 있습니다. [기본 웹 콘텐츠 기사 게시](#post-a-basic-web-content-article) 에서 이 콘텐츠 필드에 정보를 추가하는 새 웹 콘텐츠 기사를 만듭니다.

```json
{
  "availableLanguages" : [ "en-US" ],
  "contentStructureFields" : [ {
    "dataType" : "string",
    "label" : "content",
    "localizable" : true,
    "multiple" : false,
    "name" : "content",
    "nestedContentStructureFields" : [ ],
    "options" : [ ],
    "repeatable" : false,
    "required" : false,
    "showLabel" : true
  } ],
  "dateCreated" : "2021-08-09T23:30:23Z",
  "dateModified" : "2021-08-09T23:30:23Z",
  "description" : "Basic Web Content",
  "id" : 40697,
  "name" : "Basic Web Content",
  "siteId" : 20127
}
```

### ContentStructure_GET_ById.java

명령:

```bash
java -classpath .:* -DcontentStructureId=1234 ContentStructure_GET_ById
```

부호:

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/java/ContentStructure_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-20
```

`ContentStructure` 필드가 JSON에 나타납니다.

## 기본 웹 콘텐츠 기사 게시

`StructuredContent_POST_ToSite[java|sh]` 스크립트를 사용하여 새 웹 콘텐츠 기사를 만듭니다. `1234` 웹 콘텐츠 구조 ID로 바꿉니다. `5678` 사이트 ID로 바꿉니다.

### StructuredContent_POST_ToSite.sh

`StructuredContent_POST_ToSite.sh` cURL 스크립트 예제는 `POST` HTTP 메서드와 기본 웹 콘텐츠 구조를 사용하여 새 웹 콘텐츠 기사를 생성합니다. 스크립트는 [사이트 ID](#identifying-the-site-id) 및 구조 `ID` 을 매개변수로 사용합니다.

| 방법    | 서비스                 | 끝점                                         |
|:----- |:------------------- |:------------------------------------------ |
| `PUT` | `StructuredContent` | `/v1.0/sites/{siteId}/structured-contents` |

```bash
./StructuredContent_POST_ToSite.sh 20125 40697
```

cURL 스크립트 매개변수:

| 매개 변수 # | 묘사                   |
|:------- |:-------------------- |
| $1      | `siteId`             |
| $2      | `contentStructureId` |

Liferay DXP에서 새 웹 콘텐츠 기사를 찾으려면 사이트 메뉴(![Site menu](../../../images/icon-menu.png))를 열고 **콘텐츠 & 데이터** &rarr; **웹 콘텐츠** 으로 이동합니다.

아래는 스크립트에 의해 생성된 부분 JSON 출력입니다. 스크립트는 Structure `contentField` `content` 참조로 사용하여 간단한 `<p>Foo</p>` HTML 문자열을 게시합니다.

```json
{
  "actions" : {
    ...
  },
  "availableLanguages" : [ "en-US" ],
  "contentFields" : [ {
    "contentFieldValue" : {
      "data" : "<p>Foo</p>"
    },
    "dataType" : "string",
    "label" : "content",
    "name" : "content",
    "nestedContentFields" : [ ],
    "repeatable" : false
  } ],
  "contentStructureId" : 40697,
  "creator" : {
    "additionalName" : "",
    "contentType" : "UserAccount",
    "familyName" : "Bowman",
    "givenName" : "David",
    "id" : 20129,
    "name" : "David Bowman"
  },
  "customFields" : [ ],
  "dateCreated" : "2021-08-10T09:19:40Z",
  "dateModified" : "2021-08-10T09:19:40Z",
  "datePublished" : "2021-08-10T09:19:00Z",
  "description" : "",
  "externalReferenceCode" : "41569",
  "friendlyUrlPath" : "able-article",
  "id" : 41571,
  "key" : "41569",
  "keywords" : [ ],
  "numberOfComments" : 0,
  "relatedContents" : [ ],
  "renderedContents" : [ {
    "contentTemplateId" : "BASIC-WEB-CONTENT",
    "contentTemplateName" : "Basic Web Content",
    "markedAsDefault" : true,
    "renderedContentURL" : "http://localhost:8080/o/headless-delivery/v1.0/structured-contents/41571/rendered-content/BASIC-WEB-CONTENT"
  } ],
  "siteId" : 20125,
  "subscribed" : false,
  "taxonomyCategoryBriefs" : [ ],
  "title" : "Able Article",
  "uuid" : "c7005ffb-5677-e030-9eb9-9b1a24a85054"
}
```

### StructuredContent_POST_ToSite.java

`StructuredContent_POST_ToSite.java` 클래스는 구조화된 콘텐츠 관련 서비스를 호출하여 웹 콘텐츠 기사를 추가합니다.

명령:

```bash
java -classpath .:* -DcontentStructureId=1234 -DsiteId=5678 StructuredContent_POST_ToSite
```

부호:

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/java/StructuredContent_POST_ToSite.java
   :dedent: 1
   :language: java
   :lines: 11-45
```

`StructuredContent` 필드가 JSON에 나타납니다.

## 패치 웹 콘텐츠 기사

`PATCH` 메서드를 `StructuredContent` 서비스와 함께 사용하여 웹 콘텐츠 기사를 업데이트합니다. `StructuredContent_PATCH_ById.[java|sh]` 스크립트는 구조화된 콘텐츠 식별자 `id` 을 사용하여 기사의 콘텐츠를 'Foo'에서 'Bar'로 업데이트합니다.

### StructuredContent_PATCH_ById.sh

명령:

```bash
./StructuredContent_PATCH_ById.sh 1234
```

부호:

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/curl/StructuredContent_PATCH_ById.sh
   :language: bash
```

### StructuredContent_PATCH_ById.java

명령:

```bash
java -classpath .:* -DcontentStructureId=1234 -DstructuredContentId=5678 StructuredContent_PATCH_ById
```

부호:

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/java/StructuredContent_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 11-44
```

## 웹 콘텐츠 기사 넣기

`PUT` 메서드를 `StructuredContent` 서비스와 함께 사용하여 원본 웹 콘텐츠 정보를 바꿉니다. `StructuredContent_PUT_ById.[java|sh]` 스크립트는 웹 콘텐츠 및 구조 식별자를 사용하여 기사의 이름과 기사의 콘텐츠를 `Bar` 에서 `Goo`로 바꿉니다.

### StructuredContent_PUT_ById.sh

명령:

```bash
./StructuredContent_PUT_ById.sh 1234
```

부호:

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/curl/StructuredContent_PUT_ById.sh
   :language: bash
```

### StructuredContent_PUT_ById.java

명령:

```bash
java -classpath .:* -DcontentStructureId=1234 -DstructuredContentId=5678 StructuredContent_PUT_ById
```

부호:

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/java/StructuredContent_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 11-45
```

## 웹 콘텐츠 기사 삭제

`DELETE` 메서드를 `StructuredContent` 서비스와 함께 사용하여 웹 콘텐츠 기사를 삭제합니다. `StructuredContent_DELETE_ById.[java|sh]` 스크립트 예제는 웹 콘텐츠 `id` 을 사용하여 웹 콘텐츠를 삭제합니다.

!!! important
   REST API를 사용하여 웹 콘텐츠를 삭제하면 [Liferay DXP 휴지통](../../../content-authoring-and-management/recycle-bin/recycle-bin-overview.md)을 사용하지 않고 영구 삭제됩니다.

### StructuredContent_DELETE_ById.sh

명령:

```bash
./StructuredContent_DELETE_ById.sh 1234
```

부호:

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/curl/StructuredContent_DELETE_ById.sh
   :language: bash
```

### StructuredContent_DELETE_ById.java

명령

```bash
java -classpath .:* -DstructuredContentId=1234 StructuredContent_DELETE_ById
```

부호:

```{literalinclude} ./web-content-api-basics/resources/liferay-r4h9.zip/java/StructuredContent_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## 더 많은 웹 콘텐츠 및 웹 콘텐츠 폴더 서비스

다른 cURL 명령 및 Java 클래스는 더 많은 `StructuredContent` 및 `StructuredContentFolder` 서비스를 보여줍니다. [Web Content API Basics](./liferay-r4h9.zip) 에서 찾을 수 있습니다.

| 파일                                                             | 묘사                       |
|:-------------------------------------------------------------- |:------------------------ |
| `StructuredContentFolder_GET_ById.[java\|sh]`                 | 웹 콘텐츠 폴더의 필드를 나열합니다.     |
| `StructuredContentFolders_GET_FromSite.[java\|sh]`            | 사이트의 모든 웹 콘텐츠 폴더를 나열합니다. |
| `StructuredContentFolder_POST_ToSite.[java\|sh]`              | 웹 콘텐츠 폴더를 사이트에 게시합니다.    |
| `StructuredContentFolder_PATCH_ById.[java\|sh]`               | 웹 콘텐츠 폴더를 업데이트합니다.       |
| `StructuredContentFolder_PUT_ById.[java\|sh]`                 | 웹 콘텐츠 폴더를 대체합니다.         |
| `StructuredContentFolder_DELETE_ById.[java\|sh]`              | 웹 콘텐츠 폴더를 삭제합니다.         |
| `StructuredContent_POST_ToStructuredContentFolder.[java\|sh]` | 웹 콘텐츠 기사를 폴더에 게시합니다.     |

!!! important
   REST API를 사용하여 웹 콘텐츠 폴더를 삭제하면 [Liferay DXP 휴지통](../../../content-authoring-and-management/recycle-bin/recycle-bin-overview.md).

## 관련 정보

- [고급 웹 콘텐츠 API](./advanced-web-content-api.md)
- [REST 서비스 사용](../../../headless-delivery/consuming-apis/consuming-rest-services.md)
- [웹 콘텐츠 구조 이해](../web-content-structures/understanding-web-content-structures.md)