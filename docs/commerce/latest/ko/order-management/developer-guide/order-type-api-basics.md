# 주문 유형 API 기본 사항

[애플리케이션 메뉴](../order-types/using-order-types.md) 또는 REST API를 사용하여 주문 유형을 관리할 수 있습니다. [headless-admin-commerce-order](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-commerce-admin-order/v1.0/openapi.json) 의 `/order-types` 엔드포인트를 사용하여 주문 유형을 만들고 관리합니다.

## 주문 유형 추가

```{include} /_snippets/run-liferay-dxp.md
```

LiferAy가 실행되면

1. [주문 유형 API 기본 사항](./liferay-t5n8.zip) 을 다운로드하여 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/order-management/developer-guide/liferay-t5n8.zip -O
   ```

   ```bash
   unzip liferay-t5n8.zip
   ```

1. 주문 유형은 인스턴스로 범위가 지정되며 생성을 위해 `이름` 필요합니다.

   cURL 스크립트를 사용하여 주문 유형을 추가하십시오. 명령줄에서 `curl` 폴더로 이동합니다. `OrderType_POST_ToInstance.sh` 스크립트를 실행합니다.

   ```bash
   ./OrderType_POST_ToInstance.sh
   ```

   JSON 응답은 새로 추가된 주문 유형을 보여줍니다.

   ```json
   {
      "actions" : {
         "permissions" : {
            "method" : "PATCH",
            "href" : "http://localhost:9090/o/headless-commerce-admin-order/v1.0/order-types/48698"
         },
         "get" : {
            "method" : "GET",
            "href" : "http://localhost:9090/o/headless-commerce-admin-order/v1.0/order-types/48698"
         },
         "update" : {
            "method" : "PATCH",
            "href" : "http://localhost:9090/o/headless-commerce-admin-order/v1.0/order-types/48698"
         },
         "delete" : {
            "method" : "DELETE",
            "href" : "http://localhost:9090/o/headless-commerce-admin-order/v1.0/order-types/48698"
         }
      },
      "active" : false,
      "customFields" : { },
      "description" : { },
      "displayDate" : "2023-03-23T16:30:00Z",
      "displayOrder" : 0,
      "externalReferenceCode" : "fd8fbd90-0f19-0d4d-46db-c7807f3660ce",
      "id" : 48698,
      "name" : {
         "en_US" : "Foo"
      },
      "workflowStatusInfo" : {
         "code" : 0,
         "label" : "approved",
         "label_i18n" : "Approved"
      }
   }
   ```

1. **전역 메뉴**(![Applications Menu icon](../../images/icon-applications-menu.png)) &rarr; **상거래** &rarr; **주문 유형** 으로 이동 합니다 . 새로 추가된 주문 유형이 나타납니다.

   ![주문 유형 추가를 확인합니다.](./order-type-api-basics/images/01.png)

1. 또는 Java 클라이언트를 사용하여 REST 서비스를 호출하십시오. `java` 폴더로 이동하여 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. `OrderType_POST_ToInstance` 클래스를 실행합니다.

   ```bash
   java -classpath .:* OrderType_POST_ToInstance
   ```

## cURL 명령 검사

`OrderType_POST_ToInstance.sh` 스크립트는 cURL 명령으로 REST 서비스를 호출합니다.

```{literalinclude} ./order-type-api-basics/resources/liferay-t5n8.zip/curl/OrderType_POST_ToInstance.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                         | 묘사                            |
|:-------------------------------------------------------------------------- |:----------------------------- |
| `-H "Content-Type: application/json"`                                      | 요청 본문 형식을 JSON으로 설정합니다.       |
| `-X POST`                                                                  | 지정된 끝점에서 호출할 HTTP 메서드를 설정합니다. |
| `"http://localhost:8080/o/headless-commerce-admin-order/v1.0/order-types"` | REST 서비스 끝점을 지정합니다.           |
| `-d "{\"name\": {\"en_US\": \"Foo\"}}"`                              | 게시할 데이터를 입력합니다.               |
| `-u "test@liferay.com:learn"`                                              | 기본 인증 자격 증명을 입력합니다.           |

```{note}
여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth 2.0 사용](https://learn.liferay.com/ko/w/dxp/headless-delivery/using-oauth2) 을 통해 사용자를 인증해야 합니다. OAuth2를 사용하는 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증](https://learn.liferay.com/ko/w/dxp/headless-delivery/using-oauth2/using-oauth2-to-authorize-users) 를 참조하세요.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검토

`OrderType_POST_ToInstance.java` 클래스는 `OrderTypeResource` 서비스를 호출하여 주문 유형을 추가합니다.

```{literalinclude} ./order-type-api-basics/resources/liferay-t5n8.zip/java/OrderType_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 11-29
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                                       | 묘사                                                          |
|:---------------------------------------------------------------------------- |:----------------------------------------------------------- |
| `OrderTypeResource.Builder builder = ...`                                    | `OrderTypeResource` 서비스 인스턴스를 생성하기 위한 `빌더` 가져옵니다.           |
| `OrderTypeResource orderTypeResource = builder.authentication(...).build();` | 기본 인증을 사용하고 `OrderTypeResource` 서비스 인스턴스를 생성합니다.            |
| `orderTypeResource.postOrderType(...);`                                      | `orderTypeResource.postOrderType` 메서드를 호출하고 데이터를 게시에 전달합니다. |

프로젝트에는 `com.liferay.headless.commerce.admin.order.client.jar` 파일이 종속 항목으로 포함되어 있습니다. `/o/api` (예: <http://localhost:8080/o/api>)에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메서드의 주석은 클래스 실행을 보여줍니다.
```

나머지 예제 Java 클래스는 서로 다른 `OrderTypeResource` 메서드를 호출합니다.

```{important}
[OrderTypeResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-order-client/src/main/java/com/liferay/headless/commerce/admin/order/client/resource/v1_0/OrderResource.java) 를 참조하십시오.
```

다음은 cURL 및 Java를 사용하여 다른 `OrderType` REST 서비스를 호출하는 예입니다.

## 인스턴스에서 주문 유형 가져오기

cURL 또는 Java 명령을 사용하여 Liferay 인스턴스의 모든 주문 유형을 나열할 수 있습니다.

### OrderTypes_GET_FromInstance.sh

명령:

```bash
./OrderTypes_GET_FromInstance.sh
```

부호:

```{literalinclude} ./order-type-api-basics/resources/liferay-t5n8.zip/curl/OrderTypes_GET_FromInstance.sh
   :language: bash
```

### OrderTypes_GET_FromInstance.java

명령:

```bash
java -classpath .:* OrderTypes_GET_FromInstance
```

부호:

```{literalinclude} ./order-type-api-basics/resources/liferay-t5n8.zip/java/OrderTypes_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 9-19
```

인스턴스의 `OrderType` 객체가 JSON에 나타납니다.

### 순서 유형 페이지 매기기, 검색 및 정렬

반환된 주문 유형을 페이지 매기기, 검색 및 정렬할 수 있습니다. 자세한 내용은 [`getOrderTypesPage`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-order-client/src/main/java/com/liferay/headless/commerce/admin/order/client/resource/v1_0/OrderTypeResource.java#L50-L53) 메서드를 참조하십시오. `이름` 필드를 사용하여 결과를 검색하고 정렬합니다.

| 쿼리 정렬       | 묘사                   |
|:----------- |:-------------------- |
| `name:desc` | 내림차순으로 `이름` 로 정렬합니다. |

자세한 내용은 [API 쿼리 매개변수](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/api-query-parameters) 참조하세요.

## 주문 유형 가져오기

cURL 및 Java `get` 명령을 사용하여 특정 주문 유형을 가져옵니다. `1234` 주문 유형의 ID로 바꿉니다.

```{tip}
`OrderTypes_GET_FromInstance.[java|sh]`를 사용하여 모든 주문 유형 목록을 가져오고 구체적으로 원하는 주문 유형의 `id`를 기록해 둡니다.
```

### OrderType_GET_ById.sh

명령:

```bash
./OrderType_GET_ById.sh 1234
```

부호:

```{literalinclude} ./order-type-api-basics/resources/liferay-t5n8.zip/curl/OrderType_GET_ById.sh
   :language: bash
```

### OrderType_GET_ById.java

명령:

```bash
java -classpath .:* -DorderTypeId=1234 OrderType_GET_ById
```

부호:

```{literalinclude} ./order-type-api-basics/resources/liferay-t5n8.zip/java/OrderType_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`OrderType` 필드는 JSON 형식입니다.

## 주문 유형 패치

cURL 및 Java `패치` 명령으로 기존 주문 유형을 업데이트합니다. `1234` 주문 유형의 ID로 바꿉니다.

### OrderType_PATCH_ById.sh

명령:

```bash
./OrderType_PATCH_ById.sh 1234
```

부호:

```{literalinclude} ./order-type-api-basics/resources/liferay-t5n8.zip/curl/OrderType_PATCH_ById.sh
   :language: bash
```

### OrderType_PATCH_ById.java

명령:

```bash
java -classpath .:* -DorderTypeId=1234 OrderType_PATCH_ById
```

부호:

```{literalinclude} ./order-type-api-basics/resources/liferay-t5n8.zip/java/OrderType_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 11-29
```

## 주문 유형 삭제

cURL 및 Java `delete` 명령을 사용하여 기존 주문 유형을 삭제합니다. `1234` 주문 유형의 ID로 바꿉니다.

### OrderType_DELETE_ById.sh

명령:

```bash
./OrderType_DELETE_ById.sh 1234
```

부호:

```{literalinclude} ./order-type-api-basics/resources/liferay-t5n8.zip/curl/OrderType_DELETE_ById.sh
   :language: bash
```

### OrderType_DELETE_ById.java

명령

```bash
java -classpath .:* -DorderTypeId=1234 OrderType_DELETE_ById
```

부호:

```{literalinclude} ./order-type-api-basics/resources/liferay-t5n8.zip/java/OrderType_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[REST 서비스 사용](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/consuming-rest-services) 은 `OrderType` 서비스와 스키마를 보여주고 각 서비스를 테스트하기 위한 인터페이스를 가지고 있습니다.
