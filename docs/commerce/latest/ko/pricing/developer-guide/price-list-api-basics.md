# 가격표 API 기본 사항

애플리케이션 메뉴 또는 REST API를 사용하여 가격표를 관리할 수 있습니다. [headless-admin-commerce-pricing](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/openapi.json) 서비스를 호출하여 가격 목록을 만들고 관리합니다.

## 가격 목록 추가

```{include} /_snippets/run-liferay-dxp.md
```

Liferay가 실행되면,

1. [가격표 API 기본 사항](./liferay-c2v4.zip) 을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/pricing/developer-guide/liferay-c2v4.zip -O
   ```

   ```bash
   unzip liferay-c2v4.zip
   ```

1. 가격 목록은 카탈로그로 범위가 지정되므로 목록을 만들려면 카탈로그 ID가 필요합니다.

   카탈로그의 ID를 얻으려면 **글로벌 메뉴**(![Applications Menu icon](../../images/icon-applications-menu.png))를 열고 **상거래** &rarr; **카탈로그** 로 이동하십시오. 카탈로그를 선택하고 해당 ID를 복사합니다.

   ![카탈로그 ID를 복사합니다.](./price-list-api-basics/images/01.png)

1. cURL 스크립트를 사용하여 카탈로그에 새 가격 목록을 추가하십시오. 명령줄에서 `curl` 폴더로 이동합니다. 적절한 카탈로그 ID 값을 매개변수로 사용하여 `PriceList_POST_ToCatalog.sh` 스크립트를 실행하십시오.

   ```bash
   ./PriceList_POST_ToCatalog.sh 1234
   ```

   JSON 응답은 새 가격표가 추가되었음을 보여줍니다.

   ```bash
   {
      "actions" : {
         "permissions" : {
         "method" : "PATCH",
         "href" : "http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/price-lists/46002"
         },
         "get" : {
         "method" : "GET",
         "href" : "http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/price-lists/46002"
         },
         "update" : {
         "method" : "PATCH",
         "href" : "http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/price-lists/46002"
         },
         "delete" : {
         "method" : "DELETE",
         "href" : "http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/price-lists/46002"
         }
      },
      "active" : true,
      "author" : "Test Test",
      "catalogBasePriceList" : false,
      "catalogId" : 1234,
      "catalogName" : "Master",
      "createDate" : "2023-01-04T12:41:03Z",
      "currencyCode" : "USD",
      "customFields" : { },
      "displayDate" : "2023-01-04T12:41:00Z",
      "externalReferenceCode" : "b314f22b-72ff-c47c-4fb6-c34539257821",
      "id" : 46002,
      "name" : "Able",
      "netPrice" : true,
      "parentPriceListId" : 0,
      "priority" : 0.0,
      "type" : "price-list",
      "workflowStatusInfo" : {
         "code" : 0,
         "label" : "approved",
         "label_i18n" : "Approved"
      }
   }
   ```

1. 가격표 추가를 확인하려면 **글로벌 메뉴**(![Applications Menu icon](../../images/icon-applications-menu.png))을 열고 **Commerce** &rarr; **Price Lists** 로 이동합니다. 새 가격 목록이 나타납니다.

   ![새 가격표가 추가되었는지 확인합니다.](./price-list-api-basics/images/02.png)

1. 또는 Java 클라이언트를 사용하여 REST 서비스를 호출하십시오. `java` 폴더로 이동하여 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. `PriceList_POST_ToCatalog` 클래스를 실행하여 `catalogId` 을 적절한 값으로 바꿉니다.

   ```bash
   java -classpath .:* -DcatalogId=1234 PriceList_POST_ToCatalog
   ```

## cURL 명령 검사

`PriceList_POST_ToCatalog.sh` 스크립트는 cURL 명령으로 REST 서비스를 호출합니다.

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/curl/PriceList_POST_ToCatalog.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                                                                  | 묘사                            |
|:------------------------------------------------------------------------------------------------------------------- |:----------------------------- |
| `-H "Content-Type: application/json"`                                                                               | 요청 본문 형식을 JSON으로 설정합니다.       |
| `-X POST`                                                                                                           | 지정된 끝점에서 호출할 HTTP 메서드를 설정합니다. |
| `"http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/price-lists"`                                        | REST 서비스 끝점을 지정합니다.           |
| `-d "{\"catalogId\": ${1}, \"currencyCode\": \"USD\", \"name\": \"Able\", \"type\": \"price-list\"}"` | 게시할 데이터를 입력합니다.               |
| `-u "test@liferay.com:learn"`                                                                                       | 기본 인증 자격 증명을 입력합니다.           |

```{note}
여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth 2.0 사용](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2) 을 통해 사용자를 인증해야 합니다. 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2/using-oauth2-to-authorize-users) 를 참조하세요. OAuth2를 사용합니다.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검토

`PriceList_POST_ToCatalog.java` 클래스는 `PriceListResource` 서비스를 호출하여 가격표를 추가합니다.

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/java/PriceList_POST_ToCatalog.java
   :dedent: 1
   :language: java
   :lines: 9-27
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                                       | 묘사                                                          |
|:---------------------------------------------------------------------------- |:----------------------------------------------------------- |
| `PriceListResource.Builder builder = ...`                                    | `PriceListResource` 서비스 인스턴스를 생성하기 위해 `빌더` 가져옵니다.           |
| `PriceListResource priceListResource = builder.authentication(...).build();` | 기본 인증을 사용하고 `PriceListResource` 서비스 인스턴스를 생성합니다.            |
| `priceListResource.postPriceList(...);`                                      | `priceListResource.postPriceList` 메서드를 호출하고 데이터를 게시에 전달합니다. |

프로젝트에는 `com.liferay.headless.commerce.admin.pricing.client.jar` 파일이 종속성으로 포함되어 있습니다. `/o/api` (예: <http://localhost:8080/o/api>)에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메서드의 주석은 클래스 실행을 보여줍니다.
```

나머지 예제 Java 클래스는 서로 다른 `PriceListResource` 메서드를 호출합니다.

```{important}
[PriceListResource]$LIFERAY_LEARN_PORTAL_GIT_TAG$/com/liferay/headless/commerce/admin/pricing/client/resource/v2_0/PriceListResource.java)를 참조하십시오.
```

다음은 cURL 및 Java를 사용하여 다른 `PriceList` REST 서비스를 호출하는 예입니다.

## 인스턴스에서 가격 목록 가져오기

cURL 또는 Java 명령을 사용하여 Liferay 인스턴스의 모든 가격표를 나열합니다.

### PriceLists_GET_FromInstance.sh

명령:

```bash
./PriceLists_GET_FromInstance.sh
```

부호:

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/curl/PriceLists_GET_FromInstance.sh
   :language: bash
```

### PriceLists_GET_FromInstance.java

명령:

```bash
java -classpath .:* PriceLists_GET_FromInstance
```

부호:

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/java/PriceLists_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

인스턴스의 `PriceList` 객체는 JSON 형식입니다.

### 가격 목록 필터링, 페이지 매기기, 검색 및 정렬

이 API는 가격 목록을 필터링, 페이지 매기기, 검색 및 정렬하기 위한 매개변수도 허용합니다. 자세한 내용은 [`getPriceListsPage`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-pricing-client/src/main/java/com/liferay/headless/commerce/admin/pricing/client/resource/v2_0/PriceListResource.java#L43-#L46) 방법을 참조하십시오. 다음 `PriceList` 필드를 사용하여 결과를 필터링, 검색 및 정렬하십시오.

* 계정 ID
* 계정 그룹 ID
* 카탈로그 ID
* 채널 ID
* orderTypeId
* 이름
* catalogBasePriceList
* 유형
* 생성일

| 필터 쿼리                                            | 묘사                                                                                      |
|:------------------------------------------------ |:--------------------------------------------------------------------------------------- |
| `name eq 'Able'`                                 | 가격 목록 이름은 Able과 같아야 합니다.                                                                |
| `createDate gt 2022-12-31T12:00:00Z`             | 가격표 생성 날짜는 2022년 12월 31일 12:00:00 이후여야 합니다.                                             |
| `catalogId/any(x:(x eq 43956) and (x eq 43199))` | 카탈로그 43956 및 43199와 관련된 가격표를 일치시킵니다. `any` 이라는 용어는 후속 표현식 중 하나 이상이 `true`반환해야 함을 의미합니다. |

`accountId`, `accountGroupId`, `catalogId`, `channelId`및 `orderTypeId` 필터 필드는 컬렉션 필드입니다. 컬렉션 필드에 의한 필터링은 위 표의 세 번째 행과 같이 수행되어야 합니다.

| 쿼리 정렬                       | 묘사                                               |
|:--------------------------- |:------------------------------------------------ |
| `createDate:desc`           | 내림차순으로 createDate를 기준으로 정렬합니다.                   |
| `createDate:desc,type:desc` | 먼저 createDate별로 내림차순으로 정렬한 다음 유형별로 내림차순으로 정렬합니다. |

자세한 내용은 [API 쿼리 매개변수](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/api-query-parameters) 참조하세요.

## 가격표 받기

cURL 또는 Java `get` 명령을 사용하여 특정 가격표를 가져옵니다. `1234` 가격 목록의 ID로 바꿉니다.

```{tip}
`PriceLists_GET_FromInstance.[java|sh]`를 사용하여 모든 가격표 목록을 가져오고 구체적으로 원하는 가격표의 `id`를 기록해 둡니다.
```

### PriceList_GET_ById.sh

명령:

```bash
./PriceList_GET_ById.sh 1234
```

부호:

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/curl/PriceList_GET_ById.sh
   :language: bash
```

### PriceList_GET_ById.java

명령:

```bash
java -classpath .:* -DpriceListId=1234 PriceList_GET_ById
```

부호:

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/java/PriceList_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`PriceList` 필드는 JSON으로 나열됩니다.

## 가격표 패치

cURL 및 Java `패치` 명령으로 기존 가격표를 업데이트합니다. `1234` 가격 목록의 ID로 바꿉니다.

### PriceList_PATCH_ById.sh

명령:

```bash
./PriceList_PATCH_ById.sh 1234
```

부호:

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/curl/PriceList_PATCH_ById.sh
   :language: bash
```

### PriceList_PATCH_ById.java

명령:

```bash
java -classpath .:* -DpriceListId=1234 PriceList_PATCH_ById
```

부호:

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/java/PriceList_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-23
```

## 가격 목록 삭제

cURL 및 Java `delete` 명령을 사용하여 기존 가격표를 삭제합니다. `1234` 가격 목록의 ID로 바꿉니다.

### PriceList_DELETE_ById.sh

명령:

```bash
./PriceList_DELETE_ById.sh 1234
```

부호:

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/curl/PriceList_DELETE_ById.sh
   :language: bash
```

### PriceList_DELETE_ById.java

명령

```bash
java -classpath .:* -DpriceListId=1234 PriceList_DELETE_ById
```

부호:

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/java/PriceList_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[REST 서비스 사용](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/consuming-rest-services) 은 `PriceList` 서비스 및 스키마를 보여주고 각 서비스를 테스트하기 위한 인터페이스를 가지고 있습니다.
