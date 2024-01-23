# 옵션 값 API 기본 사항

옵션 애플리케이션에서 또는 REST API를 사용하여 옵션 값을 관리할 수 있습니다. [headless-commerce-admin-catalog](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/openapi.json) 서비스를 호출하여 옵션 값을 생성하고 관리합니다.

## 옵션 값 추가

```{include} /_snippets/run-liferay-dxp.md
```

Liferay가 실행되면,

1. [옵션 값 API 기본 사항](./liferay-c7w9.zip) 을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/product-management/developer-guide/liferay-c7w9.zip -O
   ```

   ```bash
   unzip liferay-c7w9.zip
   ```

1. 옵션 값은 옵션으로 범위가 지정됩니다. 옵션을 생성하지 않은 경우 [옵션 API 기본 사항](./option-api-basics.md) 참조하십시오. 새 옵션 값을 생성할 때 옵션의 `id` , 고유 키 및 옵션 값의 이름을 제공해야 합니다.

   cURL 스크립트를 사용하여 새 옵션 값을 추가하십시오. 명령줄에서 `curl` 폴더로 이동합니다. 적절한 옵션 ID를 매개변수로 사용하여 `OptionValue_POST_ToOption.sh` 스크립트를 실행합니다.

   ```bash
   ./OptionValue_POST_ToOption.sh 1234
   ```

   JSON 응답은 새 옵션 값이 추가되었음을 보여줍니다.

   ```json
   {
      "actions" : {
         "get" : {
            "method" : "GET",
            "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/optionValues/{id}"
         },
         "update" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/optionValues/{id}"
         },
         "delete" : {
            "method" : "DELETE",
            "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/optionValues/{id}"
         }
      },
      "externalReferenceCode" : "c63216c7-9043-90ab-35b9-6efbe36b47ff",
      "id" : 46709,
      "key" : "able",
      "name" : {
         "en_US" : "Able"
      },
      "priority" : 0.0
   }
   ```

1. 옵션 값 추가를 확인하려면 **글로벌 메뉴**(![Applications Menu icon](../../images/icon-applications-menu.png))을 열고 **상거래** &rarr; **옵션** 으로 이동합니다. 적절한 옵션을 선택합니다. 새 옵션 값이 값 섹션에 나타납니다.

   ![새 옵션 값이 추가되었는지 확인합니다.](./option-value-api-basics/images/01.png)

1. 또는 Java 클라이언트를 사용하여 REST 서비스를 호출하십시오. `java` 폴더로 이동하여 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. `OptionValue_POST_ToOption` 클래스를 실행하여 `optionId` 적절한 값으로 바꿉니다.

   ```bash
   java -classpath .:* -DoptionId=1234 OptionValue_POST_ToOption
   ```

## cURL 명령 검사

`OptionValue_POST_ToOption.sh` 스크립트는 cURL 명령으로 REST 서비스를 호출합니다.

```{literalinclude} ./option-value-api-basics/resources/liferay-c7w9.zip/curl/OptionValue_POST_ToOption.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                                         | 묘사                            |
|:------------------------------------------------------------------------------------------ |:----------------------------- |
| `-H "Content-Type: application/json"`                                                      | 요청 본문 형식을 JSON으로 설정합니다.       |
| `-X POST`                                                                                  | 지정된 끝점에서 호출할 HTTP 메서드를 설정합니다. |
| `"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/options/${1}/optionValues"` | REST 서비스 끝점을 지정합니다.           |
| `-d "{\"key\": \"able\", \"name\": {\"en_US\": \"Able\"}}"`                      | 게시할 데이터를 입력합니다.               |
| `-u "test@liferay.com:learn"`                                                              | 기본 인증 자격 증명을 입력합니다.           |

```{note}
여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth 2.0 사용](https://learn.liferay.com/dxp/latest/ko/headless-delivery/using-oauth2.html) 을 통해 사용자를 인증해야 합니다. 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증](https://learn.liferay.com/dxp/latest/ko/headless-delivery/using-oauth2/using-oauth2-to-authorize-users.html) 를 참조하세요. OAuth2를 사용합니다.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검토

`OptionValue_POST_ToOption.java` 클래스는 `OptionValueResource` 서비스를 호출하여 옵션 값을 추가합니다.

```{literalinclude} ./option-value-api-basics/resources/liferay-c7w9.zip/java/OptionValue_POST_ToOption.java
   :dedent: 1
   :language: java
   :lines: 11-31
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                                           | 묘사                                                                      |
|:-------------------------------------------------------------------------------- |:----------------------------------------------------------------------- |
| `OptionValueResource.Builder builder = ...`                                      | `OptionValueResource` 서비스 인스턴스를 생성하기 위한 `빌더` 가져옵니다.                     |
| `OptionValueResource optionValueResource = builder.authentication(...).build();` | 기본 인증을 사용하고 `OptionValueResource` 서비스 인스턴스를 생성합니다.                      |
| `optionValueResource.postOption(...);`                                           | `optionValueResource.postOptionIdOptionValue` 메서드를 호출하고 데이터를 게시에 전달합니다. |

프로젝트는 `com.liferay.headless.commerce.admin.catalog.client.jar` 파일을 종속성으로 포함합니다. `/o/api` (예: <http://localhost:8080/o/api>)에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메서드의 주석은 클래스 실행을 보여줍니다.
```

나머지 예제 Java 클래스는 서로 다른 `OptionValueResource` 메서드를 호출합니다.

```{important}
[OptionValueResource]$LIFERAY_LEARN_PORTAL_GIT_TAG$/com/liferay/headless/commerce/admin/catalog/client/resource/v1_0/OptionValueResource.java)를 참조하십시오.
```

다음은 cURL 및 Java를 사용하여 다른 `OptionValue` REST 서비스를 호출하는 예입니다.

## 옵션에서 옵션 값 가져오기

cURL 또는 Java 명령을 사용하여 옵션의 모든 옵션 값을 나열합니다. `1234` 옵션의 ID로 바꿉니다.

### OptionValues_GET_FromOption.sh

명령:

```bash
./OptionValues_GET_FromOption.sh 1234
```

부호:

```{literalinclude} ./option-value-api-basics/resources/liferay-c7w9.zip/curl/OptionValues_GET_FromOption.sh
   :language: bash
```

### OptionValues_GET_FromOption.java

명령:

```bash
java -classpath .:* -DoptionId=1234 OptionValues_GET_FromOption
```

부호:

```{literalinclude} ./option-value-api-basics/resources/liferay-c7w9.zip/java/OptionValues_GET_FromOption.java
   :dedent: 1
   :language: java
   :lines: 9-20
```

옵션의 `OptionValue` 개체는 JSON 형식입니다.

## 옵션 값 얻기

cURL 또는 Java `get` 명령을 사용하여 특정 옵션 값을 가져옵니다. `1234` 옵션 값의 ID로 바꿉니다.

```{tip}
`OptionValues_GET_FromOption.[java|sh]`를 사용하여 옵션과 관련된 모든 옵션 값 목록을 가져오고 구체적으로 원하는 옵션 값의 `id`를 기록해 둡니다.
```

### OptionValue_GET_ById.sh

명령:

```bash
./OptionValue_GET_ById.sh 1234
```

부호:

```{literalinclude} ./option-value-api-basics/resources/liferay-c7w9.zip/curl/OptionValue_GET_ById.sh
   :language: bash
```

### OptionValue_GET_ById.java

명령:

```bash
java -classpath .:* -DoptionValueId=1234 OptionValue_GET_ById
```

부호:

```{literalinclude} ./option-value-api-basics/resources/liferay-c7w9.zip/java/OptionValue_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`OptionValue` 필드는 JSON에 나열됩니다.

## 옵션 값 패치

cURL 및 Java `패치` 명령으로 기존 옵션 값을 업데이트합니다. `1234` 옵션 값의 ID로 바꿉니다.

### OptionValue_PATCH_ById.sh

명령:

```bash
./OptionValue_PATCH_ById.sh 1234
```

부호:

```{literalinclude} ./option-value-api-basics/resources/liferay-c7w9.zip/curl/OptionValue_PATCH_ById.sh
   :language: bash
```

### OptionValue_PATCH_ById.java

명령:

```bash
java -classpath .:* -DoptionValueId=1234 OptionValue_PATCH_ById
```

부호:

```{literalinclude} ./option-value-api-basics/resources/liferay-c7w9.zip/java/OptionValue_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-27
```

## 옵션 값 삭제

cURL 및 Java `delete` 명령을 사용하여 기존 옵션 값을 삭제합니다. `1234` 옵션 값의 ID로 바꿉니다.

### OptionValue_DELETE_ById.sh

명령:

```bash
./OptionValue_DELETE_ById.sh 1234
```

부호:

```{literalinclude} ./option-value-api-basics/resources/liferay-c7w9.zip/curl/OptionValue_DELETE_ById.sh
   :language: bash
```

### OptionValue_DELETE_ById.java

명령

```bash
java -classpath .:* -DoptionValueId=1234 OptionValue_DELETE_ById
```

부호:

```{literalinclude} ./option-value-api-basics/resources/liferay-c7w9.zip/java/OptionValue_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[REST 서비스 사용](https://learn.liferay.com/dxp/latest/ko/headless-delivery/consuming-apis/consuming-rest-services.html) 은 `OptionValue` 서비스 및 스키마를 보여주고 각 서비스를 테스트하기 위한 인터페이스를 가지고 있습니다.
