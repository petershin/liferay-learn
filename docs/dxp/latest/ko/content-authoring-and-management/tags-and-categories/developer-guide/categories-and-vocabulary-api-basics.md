# 범주 및 어휘 API 기본 사항

Liferay의 REST API는 Liferay의 범주 및 어휘 기능에 대한 서비스를 제공합니다. API를 사용하여 어휘를 만들고 편집할 수 있습니다. 범주를 API와 연결하고 편집할 수도 있습니다. 새로운 어휘를 추가하는 예를 보는 것부터 시작하세요.

## 어휘 추가

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르십시오.

1. [Categories and Vocabulary API Basics](./liferay-f5w3.zip) 을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/content-authoring-and-management/tags-and-categories/developer-guide/liferay-f5w3.zip -O
   ```

   ```bash
   unzip liferay-f5w3.zip
   ```

1. [사이트 ID 찾기](../../../headless-delivery/consuming-apis/consuming-rest-services.md#identify-the-site-containing-the-data) . 아래의 다른 서비스 호출에서 이것을 사용합니다.

1. cURL 스크립트를 사용하여 사이트에 새 어휘를 추가하십시오. 명령줄에서 `curl` 폴더로 이동합니다. 사이트 ID를 매개변수로 사용하여 `TaxonomyVocabulary_POST_ToSite.sh` 스크립트를 실행합니다.

   ```bash
   ./TaxonomyVocabulary_POST_ToSite.sh 1234
   ```

   JSON 응답은 새로운 어휘가 추가되었음을 보여줍니다.

   ```json
   {
     "availableLanguages" : [ "en-US" ],
     "creator" : {
       "additionalName" : "",
       "contentType" : "UserAccount",
       "familyName" : "Test",
       "givenName" : "Test",
       "id" : 20129,
       "name" : "Test Test",
       "profileURL" : "/web/test"
     },
     "dateCreated" : "2021-09-09T21:03:15Z",
     "dateModified" : "2021-09-09T21:03:15Z",
     "description" : "Foo",
     "id" : 40126,
     "name" : "Able",
     "numberOfTaxonomyCategories" : 0,
     "siteId" : 20125
   }
   ```

1. **관리 메뉴** &rarr; **분류** &rarr; **범주** 로 이동하여 범주 애플리케이션으로 이동합니다. 새로운 어휘가 추가되었는지 확인하십시오.

   ![새로운 어휘가 추가되었습니다.](./categories-and-vocabulary-api-basics/images/01.png)

1. REST 서비스는 Java 클라이언트를 사용하여 호출할 수도 있습니다. `curl` 폴더에서 `java` 폴더로 이동합니다. 다음 명령을 사용하여 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. 다음 명령을 사용하여 `TaxonomyVocabulary_POST_ToSite` 클래스를 실행합니다. `siteId` 값을 사이트 ID로 바꿉니다.

   ```bash
   java -classpath .:* -DsiteId=1234 TaxonomyVocabulary_POST_ToSite
   ```

## cURL 명령 검사

`TaxonomyVocabulary_POST_ToSite.sh` 스크립트는 cURL 명령으로 REST 서비스를 호출합니다.

```{literalinclude} ./categories-and-vocabulary-api-basics/resources/liferay-f5w3.zip/curl/TaxonomyVocabulary_POST_ToSite.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                                        | 묘사                      |
|:----------------------------------------------------------------------------------------- |:----------------------- |
| `-H "Content-Type: application/json"`                                                     | 요청 본문 형식이 JSON임을 나타냅니다. |
| `-X POST`                                                                                 | 지정된 끝점에서 호출할 HTTP 메서드   |
| `"http://localhost:8080/o/headless-admin-taxonomy/v1.0/sites/${1}/taxonomy-vocabularies"` | REST 서비스 끝점             |
| `-d "{\"description\": \"Foo\", \"name\": \"Able\"}"`                             | 게시를 요청하는 데이터            |
| `-u "test@liferay.com:learn"`                                                             | 기본 인증 자격 증명             |

```{note}
여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth2](../../../headless-delivery/using-oauth2.md)을 통해 사용자를 인증해야 합니다. OAuth2를 사용하는 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증하기](../../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md)를 참조하세요.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검토

`TaxonomyVocabulary_POST_ToSite.java` 클래스는 어휘 관련 서비스를 호출하여 어휘를 추가한다.

```{literalinclude} ./categories-and-vocabulary-api-basics/resources/liferay-f5w3.zip/java/TaxonomyVocabulary_POST_ToSite.java
   :dedent: 1
   :language: java
   :lines: 9-26
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                                                                | 묘사                                                         |
|:----------------------------------------------------------------------------------------------------- |:---------------------------------------------------------- |
| `TaxonomyVocabularyResource.Builder builder = ...`                                                    | `TaxonomyVocabularyResource` 서비스 인스턴스를 생성하기 위한 `빌더` 가져옵니다. |
| `TaxonomyVocabularyResource taxonomyVocabularyResource = builder.authentication(...).build();`        | 기본 인증을 지정하고 `TaxonomyVocabularyResource` 서비스 인스턴스를 생성합니다.  |
| `TaxonomyVocabulary taxonomyVocabulary = taxonomyVocabularyResource.postSiteTaxonomyVocabulary(...);` | `postSiteTaxonomyVocabulary` 메소드를 호출하고 데이터를 post로 전달합니다.   |

프로젝트에는 `com.liferay.headless.admin.taxonomy.client.jar` 파일이 종속성으로 포함되어 있습니다. `/o/api`에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메서드의 주석은 클래스 실행을 보여줍니다.
```

다른 예제 Java 클래스는 이 클래스와 유사하지만 다른 `TaxonomyVocabularyResource` 메서드를 호출합니다.

```{important}
서비스 상세 내용은 [TaxonomyVocabularyResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-taxonomy/headless-admin-taxonomy-client/src/main/java/com/liferay/headless/admin/taxonomy/client/resource/v1_0/TaxonomyVocabularyResource.java) 참조하시기 바랍니다.
```

다음은 cURL 및 Java를 사용하여 다른 `TaxonomyVocabulary` REST 서비스를 호출하는 예입니다.

## 사이트에서 어휘 가져오기

다음 cURL 또는 Java 명령을 실행하여 사이트의 어휘를 나열할 수 있습니다. 위와 같이 `1234` 사이트 ID로 바꿉니다.

### TaxonomyVocabularies_GET_FromSite.sh

명령:

```bash
./TaxonomyVocabularies_GET_FromSite.sh 1234
```

부호:

```{literalinclude} ./categories-and-vocabulary-api-basics/resources/liferay-f5w3.zip/curl/TaxonomyVocabularies_GET_FromSite.sh
   :language: bash
```

### TaxonomyVocabularies_GET_FromSite.java

명령:

```bash
java -classpath .:* -DsiteId=1234 TaxonomyVocabularies_GET_FromSite
```

부호:

```{literalinclude} ./categories-and-vocabulary-api-basics/resources/liferay-f5w3.zip/java/TaxonomyVocabularies_GET_FromSite.java
   :dedent: 1
   :language: java
   :lines: 11-23
```

사이트의 `TaxonomyVocabulary` 개체는 JSON으로 나열됩니다.

## 어휘를 얻으십시오

다음 cURL 또는 Java 명령을 사용하여 특정 어휘를 가져옵니다. `1234` 어휘의 ID로 바꿉니다.

```{tip}
`TaxonomyVocabularies_GET_FromSite.[java|sh]`를 사용하여 `Vocabulary` ID를 가져옵니다.
```

### TaxonomyVocabulary_GET_ById.sh

명령:

```bash
./TaxonomyVocabulary_GET_ById.sh 1234
```

부호:

```{literalinclude} ./categories-and-vocabulary-api-basics/resources/liferay-f5w3.zip/curl/TaxonomyVocabulary_GET_ById.sh
   :language: bash
```

### TaxonomyVocabulary_GET_ById.java

명령:

```bash
java -classpath .:* -DtaxonomyVocabularyId=1234 TaxonomyVocabulary_GET_ById
```

부호:

```{literalinclude} ./categories-and-vocabulary-api-basics/resources/liferay-f5w3.zip/java/TaxonomyVocabulary_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-20
```

`TaxonomyVocabulary` 필드는 JSON에 나열됩니다.

## 어휘 패치

다음 cURL 및 Java 명령을 사용하여 기존 어휘를 부분적으로 편집합니다. `1234` 어휘 ID로 바꾸십시오.

### TaxonomyVocabulary_PATCH_ById.sh

명령:

```bash
./TaxonomyVocabulary_PATCH_ById.sh 1234
```

부호:

```{literalinclude} ./categories-and-vocabulary-api-basics/resources/liferay-f5w3.zip/curl/TaxonomyVocabulary_PATCH_ById.sh
   :language: bash
```

### TaxonomyVocabulary_PATCH_ById.java

명령:

```bash
java -classpath .:* -DtaxonomyVocabularyId=1234 TaxonomyVocabulary_PATCH_ById
```

부호:

```{literalinclude} ./categories-and-vocabulary-api-basics/resources/liferay-f5w3.zip/java/TaxonomyVocabulary_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

이 예에서는 설명이 Foo에서 Bar로 변경되었습니다.

## 어휘 넣기

다음 cURL 및 Java 명령으로 기존 어휘를 덮어씁니다. `1234` 어휘 ID로 바꾸십시오.

### TaxonomyVocabulary_PUT_ById.sh

명령:

```bash
./TaxonomyVocabulary_PUT_ById.sh 1234
```

부호:

```{literalinclude} ./categories-and-vocabulary-api-basics/resources/liferay-f5w3.zip/curl/TaxonomyVocabulary_PUT_ById.sh
   :language: bash
```

### TaxonomyVocabulary_PUT_ById.java

명령:

```bash
java -classpath .:* -DtaxonomyVocabularyId=1234 TaxonomyVocabulary_PUT_ById
```

부호:

```{literalinclude} ./categories-and-vocabulary-api-basics/resources/liferay-f5w3.zip/java/TaxonomyVocabulary_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-29
```

## 어휘 삭제

다음 cURL 및 Java 명령을 사용하여 기존 어휘를 삭제합니다. `1234` 어휘 ID로 바꾸십시오.

### TaxonomyVocabulary_DELETE_ById.sh

명령:

```bash
./TaxonomyVocabulary_DELETE_ById.sh 1234
```

부호:

```{literalinclude} ./categories-and-vocabulary-api-basics/resources/liferay-f5w3.zip/curl/TaxonomyVocabulary_DELETE_ById.sh
   :language: bash
```

### TaxonomyVocabulary_DELETE_ById.java

명령

```bash
java -classpath .:* -DtaxonomyVocabularyId=1234 TaxonomyVocabulary_DELETE_ById
```

부호:

```{literalinclude} ./categories-and-vocabulary-api-basics/resources/liferay-f5w3.zip/java/TaxonomyVocabulary_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

## 분류 범주 서비스

분류 범주에 대한 cURL 명령 및 Java 클래스는 분류 어휘와 유사하게 작동합니다. 일부 서비스에는 분류 어휘 ID가 필요합니다.

| 파일                                                          | 묘사                  |
|:----------------------------------------------------------- |:------------------- |
| `TaxonomyCategories_GET_FromTaxonomyVocabulary.[java\|sh]` | 어휘에서 범주 목록을 가져옵니다.  |
| `TaxonomyCategory_DELETE_ById.[java\|sh]`                  | 카테고리를 삭제합니다.        |
| `TaxonomyCategory_GET_ById[java\|sh]`                      | ID로 특정 카테고리를 가져옵니다. |
| `TaxonomyCategory_PATCH_ById.[java\|sh]`                   | 범주를 패치합니다.          |
| `TaxonomyCategory_POST_ToTaxonomyVocabulary.[java\|sh]`    | 카테고리를 어휘에 게시합니다.    |
| `TaxonomyCategory_PUT_ById.[java\|sh]`                     | 카테고리를 넣습니다.         |

[API Explorer](../../../headless-delivery/consuming-apis/consuming-rest-services.md) 은 `TaxonomyVocabulary` 및 `TaxonomyCategory` 서비스 및 스키마를 모두 나열하고 각 서비스를 시험해 볼 수 있는 인터페이스가 있습니다.
