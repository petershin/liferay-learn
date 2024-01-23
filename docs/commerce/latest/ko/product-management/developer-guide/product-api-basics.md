# 제품 API 기본 사항

애플리케이션 메뉴에서 제품을 관리할 수 있지만 Liferay의 REST API를 사용할 수도 있습니다. 이러한 서비스를 호출하여 제품을 만들고 관리합니다.

## 제품 추가

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르십시오.

1. [제품 API 기본 사항](./liferay-z8v2.zip) 을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/product-management/developer-guide/liferay-z8v2.zip -O
   ```

   ```bash
   unzip liferay-z8v2.zip
   ```

1. 제품의 범위는 카탈로그로 지정되며 카탈로그 ID는 필수 매개변수 중 하나입니다. 이를 얻으려면 **글로벌 메뉴**(![Applications Menu icon](../../images/icon-applications-menu.png))을 열고 **상거래** &rarr; **카탈로그** 로 이동하십시오. 제품을 추가할 카탈로그를 선택하고 이름 옆에 있는 ID를 적어 둡니다.

   ![이름 옆에 있는 카탈로그의 ID를 기록해 둡니다.](./product-api-basics/images/01.png)

1. cURL 스크립트를 사용하여 카탈로그에 새 제품을 추가하십시오. 명령줄에서 `curl` 폴더로 이동합니다. 카탈로그 ID를 매개변수로 사용하여 `Product_POST_ToCatalog.sh` 스크립트를 실행하십시오.

   ```bash
   ./Product_POST_ToCatalog.sh 1234
   ```

   JSON 응답은 새 제품이 추가되었음을 보여줍니다.

   ```bash
   "actions" : {
    "get" : {
      "method" : "GET",
      "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/products/47738"
    },
    "update" : {
      "method" : "PATCH",
      "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/products/47738"
    },
    "delete" : {
      "method" : "DELETE",
      "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/products/47738"
    }
   },
   "active" : true,
   "catalogId" : 47734,
   "categories" : [ ],
   "createDate" : "2022-10-14T09:58:20Z",
   "customFields" : [ ],
   "description" : {
      "en_US" : ""
   },
   "displayDate" : "2022-10-14T09:58:00Z",
   "expando" : { },
   "externalReferenceCode" : "5ad0eabb-6c69-6eaf-75aa-ec4000408c66",
   "id" : 47738,
   "metaDescription" : {
      "en_US" : ""
   },
   "metaKeyword" : {
      "en_US" : ""
   },
   "metaTitle" : {
      "en_US" : ""
   },
   "modifiedDate" : "2022-10-14T09:58:20Z",
   "name" : {
      "en_US" : "Foo"
   },
   "productAccountGroupFilter" : false,
   "productChannelFilter" : false,
   "productId" : 47739,
   "productStatus" : 0,
   "productType" : "simple",
   "productTypeI18n" : "Simple",
   "shortDescription" : {
      "en_US" : ""
   },
   "skuFormatted" : "",
   "tags" : [ ],
   "thumbnail" : "/o/commerce-media/default/?groupId=47735",
   "urls" : {
      "en_US" : "foo"
   },
   "version" : 1,
   "workflowStatusInfo" : {
      "code" : 0,
      "label" : "approved",
      "label_i18n" : "Approved"
   }
   ```

1. **글로벌 메뉴**(![Applications Menu icon](../../images/icon-applications-menu.png))을 열고 **상거래** &rarr; **제품** 로 이동하여 이를 확인하십시오. 새 제품이 추가되었음을 확인하십시오.

   ![새 제품이 추가되었음을 확인하십시오.](./product-api-basics/images/02.png)

1. Java 클라이언트를 사용하여 REST 서비스를 호출할 수도 있습니다. `curl` 폴더에서 `java` 폴더로 이동합니다. 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. `Product_POST_ToCatalog` 클래스를 실행합니다. `catalogId` 값을 카탈로그 ID로 바꿉니다.

   ```bash
   java -classpath .:* -DcatalogId=1234 Product_POST_ToCatalog
   ```

## cURL 명령 검사

`Product_POST_ToCatalog.sh` 스크립트는 cURL 명령으로 REST 서비스를 호출합니다.

```{literalinclude} ./product-api-basics/resources/liferay-z8v2.zip/curl/Product_POST_ToCatalog.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                                                                              | 묘사                      |
|:------------------------------------------------------------------------------------------------------------------------------- |:----------------------- |
| `-H "Content-Type: application/json"`                                                                                           | 요청 본문 형식이 JSON임을 나타냅니다. |
| `-X POST`                                                                                                                       | 지정된 끝점에서 호출할 HTTP 메서드   |
| `"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/products"`                                                       | REST 서비스 끝점             |
| `-d "{\"active\": true, \"catalogId\": \"${1}\", \"name\": {\"en_US\": \"Foo\"}, \"productType\": \"simple\"}"` | 게시할 데이터                 |
| `-u "test@liferay.com:learn"`                                                                                                   | 기본 인증 자격 증명             |

!!! note
   여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth 2.0 사용](https://learn.liferay.com/dxp/latest/ko/headless-delivery/using-oauth2.html) 을 통해 사용자를 인증해야 합니다. 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증](https://learn.liferay.com/dxp/latest/ko/headless-delivery/using-oauth2/using-oauth2-to-authorize-users.html) 를 참조하세요. OAuth2를 활용합니다.

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검토

`Product_POST_ToCatalog.java` 클래스는 상품 관련 서비스를 호출하여 상품을 추가합니다.

```{literalinclude} ./product-api-basics/resources/liferay-z8v2.zip/java/Product_POST_ToCatalog.java
   :dedent: 1
   :language: java
   :lines: 11-33
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                                   | 묘사                                                      |
|:------------------------------------------------------------------------ |:------------------------------------------------------- |
| `ProductResource.Builder builder = ...`                                  | `ProductResource` 서비스 인스턴스를 생성하기 위한 `빌더` 을 가져옵니다.       |
| `ProductResource productResource = builder.authentication(...).build();` | 기본 인증을 지정하고 `ProductResource` 서비스 인스턴스를 생성합니다.          |
| `productResource.postProduct(...);`                                      | `productResource.postProduct` 메서드를 호출하고 데이터를 게시에 전달합니다. |

프로젝트에는 `com.liferay.headless.commerce.admin.catalog.client.jar` 파일이 종속성으로 포함되어 있습니다. `/o/api`에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

!!! note
   `main` 메서드의 주석은 클래스 실행을 보여줍니다.

다른 예제 Java 클래스는 이 클래스와 유사하지만 다른 `ProductResource` 메서드를 호출합니다.

!!! important
   [ProductResource]($LIFERAY_LEARN_PORTAL_GIT_TAG$/com/liferay/headless/commerce/admin/catalog/client/resource/v1_0/ProductResource.java)를 참조하십시오.

다음은 cURL과 Java를 사용하여 다른 `개 제품` REST 서비스를 호출하는 예입니다.

## 인스턴스에서 제품 가져오기

다음 cURL 또는 Java 명령을 실행하여 Liferay 인스턴스의 모든 제품을 나열할 수 있습니다.

### Products_GET_FromInstance.sh

명령:

```bash
./Products_GET_FromInstance.sh
```

부호:

```{literalinclude} ./product-api-basics/resources/liferay-z8v2.zip/curl/Products_GET_FromInstance.sh
   :language: bash
```

### Products_GET_FromInstance.java

명령:

```bash
java -classpath .:* Products_GET_FromInstance
```

부호:

```{literalinclude} ./product-api-basics/resources/liferay-z8v2.zip/java/Products_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

Liferay 인스턴스의 `Product` 개체가 JSON에 나열됩니다.

이 API는 또한 제품을 필터링, 페이지 매김, 검색 및 정렬하기 위한 매개변수를 허용합니다. 자세한 내용은 [`getProductsPage`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-catalog-client/src/main/java/com/liferay/headless/commerce/admin/catalog/client/resource/v1_0/ProductResource.java#L43-L46) 방법을 참조하십시오. 쿼리에서 다음 제품 필드를 사용하여 결과를 필터링, 검색 및 정렬할 수 있습니다.

- 카테고리 ID
- 채널 ID
- 상태 코드
- customFields
- 생성일
- 수정 날짜
- 카탈로그 ID
- 이름
- 상품 유형

| 필터 쿼리                              | 묘사                                 |
|:---------------------------------- |:---------------------------------- |
| productType eq '단순'                | 제품 유형은 단순함                         |
| 포함(이름, '바')                        | 제품 이름에 Bar 포함                      |
| customFields/sampleSize eq '100.0' | sampleSize라는 사용자 정의 필드는 100과 같습니다. |

| 쿼리 정렬             | 묘사                                                       |
|:----------------- |:-------------------------------------------------------- |
| 생성일:설명            | 내림차순으로 createDate를 기준으로 정렬                               |
| 이름:asc            | 오름차순으로 이름별로 정렬                                           |
| 생성날짜:desc,이름:desc | 먼저 내림차순으로 createDate를 기준으로 정렬한 다음 내림차순으로 이름을 기준으로 정렬합니다. |

자세한 내용은 [API 쿼리 매개변수](https://learn.liferay.com/dxp/latest/ko/headless-delivery/consuming-apis/api-query-parameters.html) 을 참조하세요.

## 제품 받기

다음 cURL 또는 Java 명령을 사용하여 특정 제품을 가져옵니다. `1234` 을 제품 ID로 바꿉니다.

!!! tip
   ``Products_GET_FromInstance.[java|sh]``를 사용하여 모든 제품 목록을 가져오고 구체적으로 원하는 제품의 `productId`를 기록해 둡니다.

### Product_GET_ById.sh

명령:

```bash
./Product_GET_ById.sh 1234
```

부호:

```{literalinclude} ./product-api-basics/resources/liferay-z8v2.zip/curl/Product_GET_ById.sh
   :language: bash
```

### Product_GET_ById.java

명령:

```bash
java -classpath .:* -DproductId=1234 Product_GET_ById
```

부호:

```{literalinclude} ./product-api-basics/resources/liferay-z8v2.zip/java/Product_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`개의 제품` 필드가 JSON에 나열됩니다.

## 제품 패치

다음 cURL 및 Java 명령을 사용하여 기존 제품을 업데이트합니다. `1234` 을 제품 ID로 바꿉니다.

### Product_PATCH_ById.sh

명령:

```bash
./Product_PATCH_ById.sh 1234
```

부호:

```{literalinclude} ./product-api-basics/resources/liferay-z8v2.zip/curl/Product_PATCH_ById.sh
   :language: bash
```

### Product_PATCH_ById.java

명령:

```bash
java -classpath .:* -DproductId=1234 Product_PATCH_ById
```

부호:

```{literalinclude} ./product-api-basics/resources/liferay-z8v2.zip/java/Product_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 11-29
```

## 제품 삭제

다음 cURL 및 Java 명령을 사용하여 기존 제품을 삭제합니다. `1234` 을 제품 ID로 바꿉니다.

### Product_DELETE_ById.sh

명령:

```bash
./Product_DELETE_ById.sh 1234
```

부호:

```{literalinclude} ./product-api-basics/resources/liferay-z8v2.zip/curl/Product_DELETE_ById.sh
   :language: bash
```

### Product_DELETE_ById.java

명령

```bash
java -classpath .:* -DproductId=1234 Product_DELETE_ById
```

부호:

```{literalinclude} ./product-api-basics/resources/liferay-z8v2.zip/java/Product_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[REST 서비스 사용](https://learn.liferay.com/dxp/latest/ko/headless-delivery/consuming-apis/consuming-rest-services.html) 은 `제품` 서비스 및 스키마를 모두 나열하고 각 서비스를 시도할 수 있는 인터페이스가 있습니다.