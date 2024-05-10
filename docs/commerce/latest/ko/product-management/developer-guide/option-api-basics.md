# 옵션 API 기본 사항

애플리케이션 메뉴 또는 REST API를 사용하여 [옵션 템플릿](../../product-management/creating-and-managing-products/products/using-product-options.md) 을 관리할 수 있습니다. [headless-commerce-admin-catalog](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/openapi.json) 서비스를 호출하여 옵션을 만들고 관리합니다.

## 옵션 추가

```{include} /_snippets/run-liferay-dxp.md
```

Liferay가 실행되면,

1. [옵션 API 기본 사항](./liferay-d3g5.zip) 을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/product-management/developer-guide/liferay-d3g5.zip -O
   ```

   ```bash
   unzip liferay-d3g5.zip
   ```

1. 옵션은 인스턴스로 범위가 지정되며 각 옵션은 고유한 `키`지정해야 합니다.

   cURL 스크립트를 사용하여 새 옵션을 추가하십시오. 명령줄에서 `curl` 폴더로 이동합니다. `Option_POST_ToInstance.sh` 스크립트를 실행합니다.

   ```bash
   ./Option_POST_ToInstance.sh
   ```

   JSON 응답은 새 옵션이 추가되었음을 보여줍니다.

   ```bash
   {
      "actions" : {
         "get" : {
            "method" : "GET",
            "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/options/46438"
         },
         "update" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/options/46438"
         },
         "delete" : {
            "method" : "DELETE",
            "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/options/46438"
         }
      },
      "description" : { },
      "externalReferenceCode" : "f73e12cd-feae-9e78-5921-6b65f6b993f6",
      "facetable" : false,
      "fieldType" : "select",
      "id" : 46438,
      "key" : "foo",
      "name" : {
         "en_US" : "Foo"
      },
      "required" : false,
      "skuContributor" : false
   }
   ```

1. 옵션 추가를 확인하려면 **글로벌 메뉴**(![Applications Menu icon](../../images/icon-applications-menu.png))를 열고 **상거래** &rarr; **옵션** 으로 이동합니다. 새 옵션이 나타납니다.

   ![새 옵션이 추가되었는지 확인합니다.](./option-api-basics/images/01.png)

1. 또는 Java 클라이언트를 사용하여 REST 서비스를 호출하십시오. `java` 폴더로 이동하여 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. `Option_POST_ToInstance` 클래스를 실행합니다.

   ```bash
   java -classpath .:* Option_POST_ToInstance
   ```

![옵션을 생성할 때 다음 옵션 필드 유형을 사용할 수 있습니다.](./option-api-basics/images/02.png)

| 급식 유형   | API 값                              |
|:------- |:---------------------------------- |
| 원본      | `"fieldType": "text"`              |
| 목록에서 선택 | `"fieldType": "select"`            |
| 단일 선택   | `"fieldType": "radio"`             |
| 다중 선택   | `"fieldType": "checkbox_multiple"` |
| 날짜      | `"fieldType": "date"`              |
| 숫자      | `"fieldType": "numeric"`           |
| 불리언     | `"fieldType": "checkbox"`          |

## cURL 명령 검사

`Option_POST_ToInstance.sh` 스크립트는 cURL 명령으로 REST 서비스를 호출합니다.

```{literalinclude} ./option-api-basics/resources/liferay-d3g5.zip/curl/Option_POST_ToInstance.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                                                 | 묘사                            |
|:-------------------------------------------------------------------------------------------------- |:----------------------------- |
| `-H "Content-Type: application/json"`                                                              | 요청 본문 형식을 JSON으로 설정합니다.       |
| `-X POST`                                                                                          | 지정된 끝점에서 호출할 HTTP 메서드를 설정합니다. |
| `"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/options"`                           | REST 서비스 끝점을 지정합니다.           |
| `-d "{\"fieldType\": \"select\", \"key\": \"foo\", \"name\": {\"en_US\": \"Foo\"}}"` | 게시할 데이터를 입력합니다.               |
| `-u "test@liferay.com:learn"`                                                                      | 기본 인증 자격 증명을 입력합니다.           |

!!! note
   여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth 2.0 사용](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2) 을 통해 사용자를 인증해야 합니다. 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2/using-oauth2-to-authorize-users) 를 참조하세요. OAuth2를 사용합니다.

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검토

`Option_POST_ToInstance.java` 클래스는 `OptionResource` 서비스를 호출하여 옵션을 추가합니다.

```{literalinclude} ./option-api-basics/resources/liferay-d3g5.zip/java/Option_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 11-31
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                                 | 묘사                                                    |
|:---------------------------------------------------------------------- |:----------------------------------------------------- |
| `OptionResource.Builder builder = ...`                                 | `OptionResource` 서비스 인스턴스를 생성하기 위해 `빌더` 가져옵니다.        |
| `OptionResource optionResource = builder.authentication(...).build();` | 기본 인증을 사용하고 `OptionResource` 서비스 인스턴스를 생성합니다.         |
| `optionResource.postOption(...);`                                      | `optionResource.postOption` 메서드를 호출하고 데이터를 게시에 전달합니다. |

프로젝트는 `com.liferay.headless.commerce.admin.catalog.client.jar` 파일을 종속성으로 포함합니다. `/o/api` (예: <http://localhost:8080/o/api>)에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

!!! note
   `main` 메서드의 주석은 클래스 실행을 보여줍니다.

나머지 예제 Java 클래스는 서로 다른 `OptionResource` 메서드를 호출합니다.

!!! important
   [OptionResource]$LIFERAY_LEARN_PORTAL_GIT_TAG$/com/liferay/headless/commerce/admin/catalog/client/resource/v1_0/OptionResource.java)를 참조하십시오.

다음은 cURL과 Java를 사용하여 다른 `옵션` REST 서비스를 호출하는 예입니다.

## 인스턴스에서 옵션 가져오기

cURL 또는 Java 명령을 사용하여 Liferay 인스턴스의 모든 옵션을 나열합니다.

### Options_GET_FromInstance.sh

명령:

```bash
./Options_GET_FromInstance.sh
```

부호:

```{literalinclude} ./option-api-basics/resources/liferay-d3g5.zip/curl/Options_GET_FromInstance.sh
   :language: bash
```

### Options_GET_FromInstance.java

명령:

```bash
java -classpath .:* Options_GET_FromInstance
```

부호:

```{literalinclude} ./option-api-basics/resources/liferay-d3g5.zip/java/Options_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

인스턴스의 `옵션` 객체는 JSON 형식입니다.

### 필터링, 페이지 매기기, 검색 및 정렬 옵션

이 API는 옵션을 필터링, 페이지 매기기, 검색 및 정렬하기 위한 매개변수도 허용합니다. 자세한 내용은 [`getOptionsPage`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-catalog-client/src/main/java/com/liferay/headless/commerce/admin/catalog/client/resource/v1_0/OptionResource.java#L43-#L46) 메서드를 참조하십시오. 쿼리에서 다음 `옵션` 필드를 사용하여 결과를 필터링, 검색 및 정렬할 수 있습니다.

- 필드 유형
- 열쇠
- 이름

| 필터 쿼리                   | 묘사                    |
|:----------------------- |:--------------------- |
| `name eq 'Able'`        | 옵션 이름은 Able과 같아야 합니다. |
| `fieldType eq 'select'` | 옵션 유형은 선택해야 합니다.      |

| 쿼리 정렬       | 묘사                     |
|:----------- |:---------------------- |
| `key:desc`  | 내림차순으로 키를 기준으로 정렬합니다.  |
| `name:desc` | 내림차순으로 이름을 기준으로 정렬합니다. |

자세한 내용은 [API 쿼리 매개변수](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/api-query-parameters) 참조하세요.

## 옵션 받기

cURL 또는 Java `get` 명령을 사용하여 특정 옵션을 가져옵니다. `1234` 옵션의 ID로 바꿉니다.

!!! tip
   `Options_GET_FromInstance.[java|sh]`를 사용하여 모든 옵션 목록을 가져오고 구체적으로 원하는 옵션의 `id`를 기록해 둡니다.

### Option_GET_ById.sh

명령:

```bash
./Option_GET_ById.sh 1234
```

부호:

```{literalinclude} ./option-api-basics/resources/liferay-d3g5.zip/curl/Option_GET_ById.sh
   :language: bash
```

### Option_GET_ById.java

명령:

```bash
java -classpath .:* -DoptionId=1234 Option_GET_ById
```

부호:

```{literalinclude} ./option-api-basics/resources/liferay-d3g5.zip/java/Option_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`옵션` 필드는 JSON에 나열됩니다.

## 옵션 패치

cURL 및 Java `패치` 명령으로 기존 옵션을 업데이트합니다. `1234` 옵션의 ID로 바꾸십시오.

### Option_PATCH_ById.sh

명령:

```bash
./Option_PATCH_ById.sh 1234
```

부호:

```{literalinclude} ./option-api-basics/resources/liferay-d3g5.zip/curl/Option_PATCH_ById.sh
   :language: bash
```

### Option_PATCH_ById.java

명령:

```bash
java -classpath .:* -DoptionId=1234 Option_PATCH_ById
```

부호:

```{literalinclude} ./option-api-basics/resources/liferay-d3g5.zip/java/Option_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 11-31
```

## 옵션 삭제

cURL 및 Java `delete` 명령을 사용하여 기존 옵션을 삭제합니다. `1234` 옵션의 ID로 바꾸십시오.

### Option_DELETE_ById.sh

명령:

```bash
./Option_DELETE_ById.sh 1234
```

부호:

```{literalinclude} ./option-api-basics/resources/liferay-d3g5.zip/curl/Option_DELETE_ById.sh
   :language: bash
```

### Option_DELETE_ById.java

명령

```bash
java -classpath .:* -DoptionId=1234 Option_DELETE_ById
```

부호:

```{literalinclude} ./option-api-basics/resources/liferay-d3g5.zip/java/Option_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[REST 서비스 사용](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/consuming-rest-services) 은 `옵션` 서비스와 스키마를 보여주고 각 서비스를 테스트하기 위한 인터페이스를 가지고 있습니다.