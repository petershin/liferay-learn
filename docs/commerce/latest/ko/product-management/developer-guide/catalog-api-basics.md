# 카탈로그 API 기본 사항

애플리케이션 메뉴 또는 REST API에서 카탈로그를 관리할 수 있습니다. [headless-commerce-admin-catalog](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/openapi.json) 서비스를 호출하여 카탈로그를 만들고 관리합니다.

## 카탈로그 추가

```{include} /_snippets/run-liferay-dxp.md
```

Liferay가 실행되면,

1. [Catalog API 기본 사항](./liferay-q2v8.zip) 을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/product-management/developer-guide/liferay-q2v8.zip -O
   ```

   ```bash
   unzip liferay-q2v8.zip
   ```

1. 카탈로그는 인스턴스로 범위가 지정됩니다. cURL 스크립트를 사용하여 새 카탈로그를 추가하십시오. 명령줄에서 `curl` 폴더로 이동합니다. `Catalog_POST_ToInstance.sh` 스크립트를 실행합니다.

   ```bash
   ./Catalog_POST_ToInstance.sh
   ```

   JSON 응답은 새 카탈로그가 추가되었음을 보여줍니다.

   ```bash
   {
      "actions" : {
         "get" : {
            "method" : "GET",
            "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/catalog/46110"
         },
         "update" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/catalog/46110"
         },
         "delete" : {
            "method" : "DELETE",
            "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/catalog/46110"
         }
      },
      "currencyCode" : "USD",
      "defaultLanguageId" : "en_US",
      "externalReferenceCode" : "246ad89e-8da1-546c-0d62-06ac7061e1da",
      "id" : 46110,
      "name" : "Able",
      "system" : false
   }
   ```

1. 카탈로그 추가를 확인하려면 **글로벌 메뉴**(![Applications Menu icon](../../images/icon-applications-menu.png))을 열고 **상거래** &rarr; **카탈로그** 로 이동합니다. 새 카탈로그가 나타납니다.

   ![카탈로그가 추가되었는지 확인합니다.](./catalog-api-basics/images/01.png)

1. 또는 Java 클라이언트를 사용하여 REST 서비스를 호출하십시오. `java` 폴더로 이동하여 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. `Catalog_POST_ToInstance` 클래스를 실행합니다.

   ```bash
   java -classpath .:* Catalog_POST_ToInstance
   ```

## cURL 명령 검사

`Catalog_POST_ToInstance.sh` 스크립트는 cURL 명령으로 REST 서비스를 호출합니다.

```{literalinclude} ./catalog-api-basics/resources/liferay-q2v8.zip/curl/Catalog_POST_ToInstance.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                                                   | 설명                            |
|:---------------------------------------------------------------------------------------------------- |:----------------------------- |
| `-H "Content-Type: application/json"`                                                                | 요청 본문 형식을 JSON으로 설정합니다.       |
| `-X POST`                                                                                            | 지정된 끝점에서 호출할 HTTP 메서드를 설정합니다. |
| `"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/catalogs"`                            | REST 서비스 끝점을 지정합니다.           |
| `-d "{\"currencyCode\": \"USD\", \"defaultLanguageId\": \"en_US\", \"name\": \"Able\"}"` | 게시할 데이터를 입력합니다.               |
| `-u "test@liferay.com:learn"`                                                                        | 기본 인증 자격 증명을 입력합니다.           |

```{note}
여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth 2.0 사용](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2) 을 통해 사용자를 인증해야 합니다. 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2/using-oauth2-to-authorize-users) 를 참조하세요. OAuth2를 사용합니다.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검토

`Catalog_POST_ToInstance.java` 클래스는 `CatalogResource` 서비스를 호출하여 카탈로그를 추가합니다.

```{literalinclude} ./catalog-api-basics/resources/liferay-q2v8.zip/java/Catalog_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                                   | 설명                                                      |
|:------------------------------------------------------------------------ |:------------------------------------------------------- |
| `CatalogResource.Builder builder = ...`                                  | `CatalogResource` 서비스 인스턴스를 생성하기 위해 `Builder` 가져옵니다.    |
| `CatalogResource catalogResource = builder.authentication(...).build();` | 기본 인증을 사용하고 `CatalogResource` 서비스 인스턴스를 생성합니다.          |
| `catalogResource.postCatalog(...);`                                      | `catalogResource.postCatalog` 메서드를 호출하고 데이터를 게시에 전달합니다. |

프로젝트는 `com.liferay.headless.commerce.admin.catalog.client.jar` 파일을 종속성으로 포함합니다. `/o/api` (예: <http://localhost:8080/o/api>)에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메서드의 주석은 클래스 실행을 보여줍니다.
```

나머지 예제 Java 클래스는 서로 다른 `CatalogResource` 메서드를 호출합니다.

```{important}
[CatalogResource]$LIFERAY_LEARN_PORTAL_GIT_TAG$/com/liferay/headless/commerce/admin/catalog/client/resource/v1_0/CatalogResource.java)를 참조하십시오.
```

다음은 cURL 및 Java를 사용하여 다른 `Catalog` REST 서비스를 호출하는 예입니다.

## 인스턴스에서 카탈로그 가져오기

cURL 또는 Java 명령을 사용하여 Liferay 인스턴스의 모든 카탈로그를 나열합니다.

### Catalogs_GET_FromInstance.sh

명령:

```bash
./Catalogs_GET_FromInstance.sh
```

암호:

```{literalinclude} ./catalog-api-basics/resources/liferay-q2v8.zip/curl/Catalogs_GET_FromInstance.sh
   :language: bash
```

### Catalogs_GET_FromInstance.java

명령:

```bash
java -classpath .:* Catalogs_GET_FromInstance
```

암호:

```{literalinclude} ./catalog-api-basics/resources/liferay-q2v8.zip/java/Catalogs_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

인스턴스의 `카탈로그` 객체는 JSON 형식입니다.

### 카탈로그 필터링, 페이지 매기기, 검색 및 정렬

이 API는 카탈로그를 필터링, 페이지 매기기, 검색 및 정렬하기 위한 매개변수도 허용합니다. 자세한 내용은 [`getCatalogsPage`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-catalog-client/src/main/java/com/liferay/headless/commerce/admin/catalog/client/resource/v1_0/CatalogResource.java#L93-#L96) 메서드를 참조하십시오. `이름` 필드를 사용하여 결과를 필터링, 검색 및 정렬할 수 있습니다.

| 필터 쿼리            | 설명                      |
|:---------------- |:----------------------- |
| `name eq 'Able'` | 카탈로그 이름은 Able과 같아야 합니다. |
|                  |                         |

| 쿼리 정렬       | 설명                 |
|:----------- |:------------------ |
| `name:desc` | 내림차순으로 이름별로 정렬합니다. |

자세한 내용은 [API 쿼리 매개변수](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/api-query-parameters) 참조하세요.

## 카탈로그 받기

cURL 또는 Java `get` 명령을 사용하여 특정 카탈로그를 가져옵니다. `1234` 카탈로그의 ID로 바꿉니다.

```{tip}
`Catalogs_GET_FromInstance.[java|sh]`를 사용하여 모든 카탈로그 목록을 가져오고 구체적으로 원하는 카탈로그의 `id`를 기록해 둡니다.
```

### Catalog_GET_ById.sh

명령:

```bash
./Catalog_GET_ById.sh 1234
```

암호:

```{literalinclude} ./catalog-api-basics/resources/liferay-q2v8.zip/curl/Catalog_GET_ById.sh
   :language: bash
```

### Catalog_GET_ById.java

명령:

```bash
java -classpath .:* -DcatalogId=1234 Catalog_GET_ById
```

암호:

```{literalinclude} ./catalog-api-basics/resources/liferay-q2v8.zip/java/Catalog_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`카탈로그` 필드는 JSON에 나열됩니다.

## 카탈로그 패치

cURL 및 Java `패치` 명령으로 기존 카탈로그를 업데이트합니다. `1234` 카탈로그 ID로 바꿉니다.

### Catalog_PATCH_ById.sh

명령:

```bash
./Catalog_PATCH_ById.sh 1234
```

암호:

```{literalinclude} ./catalog-api-basics/resources/liferay-q2v8.zip/curl/Catalog_PATCH_ById.sh
   :language: bash
```

### Catalog_PATCH_ById.java

명령:

```bash
java -classpath .:* -DcatalogId=1234 Catalog_PATCH_ById
```

암호:

```{literalinclude} ./catalog-api-basics/resources/liferay-q2v8.zip/java/Catalog_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-23
```

## 카탈로그 삭제

cURL 및 Java `delete` 명령을 사용하여 기존 카탈로그를 삭제합니다. `1234` 카탈로그 ID로 바꿉니다.

### Catalog_DELETE_ById.sh

명령:

```bash
./Catalog_DELETE_ById.sh 1234
```

암호:

```{literalinclude} ./catalog-api-basics/resources/liferay-q2v8.zip/curl/Catalog_DELETE_ById.sh
   :language: bash
```

### Catalog_DELETE_ById.java

명령

```bash
java -classpath .:* -DcatalogId=1234 Catalog_DELETE_ById
```

암호:

```{literalinclude} ./catalog-api-basics/resources/liferay-q2v8.zip/java/Catalog_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[REST 서비스 사용](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/consuming-rest-services) 은 `Catalog` 서비스 및 스키마를 보여주고 각 서비스를 테스트하기 위한 인터페이스를 가지고 있습니다.
