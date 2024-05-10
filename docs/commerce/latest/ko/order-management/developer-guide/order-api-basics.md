# 주문 API 기본 사항

애플리케이션 메뉴 또는 REST API를 사용하여 주문을 관리할 수 있습니다. [headless-admin-commerce-order](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-commerce-admin-order/v1.0/openapi.json) 서비스를 호출하여 주문을 생성하고 관리합니다.

## 주문 추가

```{include} /_snippets/run-liferay-dxp.md
```

Liferay가 실행되면,

1. [주문 API 기본 사항](./liferay-w6c8.zip) 을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/order-management/developer-guide/liferay-w6c8.zip -O
   ```

   ```bash
   unzip liferay-w6c8.zip
   ```

1. 주문을 생성하려면 계정 ID, 채널 ID 및 사용 통화의 [ISO 4217 통화 코드](https://en.wikipedia.org/wiki/ISO_4217) (예: USD)의 세 가지 매개변수가 필요합니다.

   계정 ID를 얻으려면 **글로벌 메뉴**(![Applications Menu icon](../../images/icon-applications-menu.png))를 열고 **제어판** &rarr; **계정** 로 이동합니다. 계정을 찾아 해당 ID를 복사합니다. 또는 계정을 선택하고 **계정 ID** 을 복사합니다.

   ![계정 ID를 복사합니다.](./order-api-basics/images/01.png)

   채널 ID를 얻으려면 **글로벌 메뉴**(![Applications Menu icon](../../images/icon-applications-menu.png))를 열고 **상거래** &rarr; **채널** 로 이동하십시오. 주문을 추가할 채널을 선택하고 해당 ID를 복사합니다.

   ![채널 ID를 복사합니다.](./order-api-basics/images/02.png)

1. cURL 스크립트를 사용하여 채널에 새 주문을 추가하십시오. 명령줄에서 `curl` 폴더로 이동합니다. 계정 ID, 채널 ID 및 통화 코드에 대한 적절한 값을 사용하여 `Order_POST_ToChannel.sh` 스크립트를 실행합니다.

   ```bash
   ./Order_POST_ToChannel.sh 1234 5678 USD
   ```

   JSON 응답은 해당 계정 및 채널에 대한 새 주문이 추가되었음을 보여줍니다.

   ```bash
   {
      "accountExternalReferenceCode" : "cc-west",
      "accountId" : 1234,
      "actions" : {
         "get" : {
            "method" : "GET",
            "href" : "http://localhost:8080/o/headless-commerce-admin-order/v1.0/orders/{id}"
         },
         "update" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/headless-commerce-admin-order/v1.0/orders/{id}"
         },
         "delete" : {
            "method" : "DELETE",
            "href" : "http://localhost:8080/o/headless-commerce-admin-order/v1.0/orders/{id}"
         }
      },
      "advanceStatus" : "",
      "billingAddressId" : 0,
      "channelExternalReferenceCode" : "c8957c2f-4eb1-ce8f-4a38-5251bf740198",
      "channelId" : 5678,
      "couponCode" : "",
      "createDate" : "2023-01-03T12:25:15Z",
      "currencyCode" : "USD",
      "customFields" : { },
      "deliveryTermDescription" : "",
      "deliveryTermId" : 0,
      "deliveryTermName" : "",
      "externalReferenceCode" : "3ebcbc91-7240-2763-c2ce-f2a592851053",
      "id" : 45955,
      "modifiedDate" : "2023-01-03T12:25:15Z",
      "orderDate" : "2023-01-03T12:25:15Z",
      "orderStatus" : 1,
      "orderStatusInfo" : {
         "code" : 1,
         "label" : "pending",
         "label_i18n" : "Pending"
      },
      "orderTypeId" : 0,
      "paymentMethod" : "",
      "paymentStatus" : 1,
      "paymentStatusInfo" : {
         "code" : 1,
         "label" : "pending",
         "label_i18n" : "Pending"
      },
      "paymentTermDescription" : "",
      "paymentTermId" : 0,
      "paymentTermName" : "",
      "printedNote" : "",
      "purchaseOrderNumber" : "",
      "shippingAddressId" : 0,
      "shippingAmountFormatted" : "$ 0.00",
      "shippingAmountValue" : 0.0,
      "shippingDiscountAmount" : 0,
      "shippingDiscountAmountFormatted" : "$ 0.00",
      "shippingDiscountPercentageLevel1" : 0,
      "shippingDiscountPercentageLevel1WithTaxAmount" : 0,
      "shippingDiscountPercentageLevel2" : 0,
      "shippingDiscountPercentageLevel2WithTaxAmount" : 0,
      "shippingDiscountPercentageLevel3" : 0,
      "shippingDiscountPercentageLevel3WithTaxAmount" : 0,
      "shippingDiscountPercentageLevel4" : 0,
      "shippingDiscountPercentageLevel4WithTaxAmount" : 0,
      "shippingDiscountWithTaxAmount" : 0,
      "shippingDiscountWithTaxAmountFormatted" : "$ 0.00",
      "shippingOption" : "",
      "shippingWithTaxAmountFormatted" : "$ 0.00",
      "shippingWithTaxAmountValue" : 0.0,
      "subtotalAmount" : 0.0,
      "subtotalDiscountAmount" : 0,
      "subtotalDiscountAmountFormatted" : "$ 0.00",
      "subtotalDiscountPercentageLevel1" : 0,
      "subtotalDiscountPercentageLevel1WithTaxAmount" : 0,
      "subtotalDiscountPercentageLevel2" : 0,
      "subtotalDiscountPercentageLevel2WithTaxAmount" : 0,
      "subtotalDiscountPercentageLevel3" : 0,
      "subtotalDiscountPercentageLevel3WithTaxAmount" : 0,
      "subtotalDiscountPercentageLevel4" : 0,
      "subtotalDiscountPercentageLevel4WithTaxAmount" : 0,
      "subtotalDiscountWithTaxAmount" : 0,
      "subtotalDiscountWithTaxAmountFormatted" : "$ 0.00",
      "subtotalFormatted" : "$ 0.00",
      "subtotalWithTaxAmountFormatted" : "$ 0.00",
      "subtotalWithTaxAmountValue" : 0.0,
      "taxAmount" : 0,
      "taxAmountFormatted" : "$ 0.00",
      "taxAmountValue" : 0.0,
      "totalAmount" : 0.0,
      "totalDiscountAmount" : 0,
      "totalDiscountAmountFormatted" : "$ 0.00",
      "totalDiscountPercentageLevel1" : 0,
      "totalDiscountPercentageLevel2" : 0,
      "totalDiscountPercentageLevel3" : 0,
      "totalDiscountPercentageLevel4" : 0,
      "totalDiscountWithTaxAmount" : 0,
      "totalDiscountWithTaxAmountFormatted" : "$ 0.00",
      "totalFormatted" : "$ 0.00",
      "totalWithTaxAmountFormatted" : "$ 0.00",
      "totalWithTaxAmountValue" : 0.0,
      "transactionId" : "",
      "workflowStatusInfo" : {
         "code" : 0,
         "label" : "approved",
         "label_i18n" : "Approved"
      }
   }
   ```

1. **전역 메뉴**(![Applications Menu icon](../../images/icon-applications-menu.png)) &rarr; **상거래** &rarr; **주문** 으로 이동 합니다 . 새 주문이 나타납니다.

   ![새 주문이 추가되었는지 확인합니다.](./order-api-basics/images/03.png)

1. 또는 Java 클라이언트를 사용하여 REST 서비스를 호출하십시오. `java` 폴더로 이동하여 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. `Order_POST_ToChannel` 클래스를 실행하여 `accountId`, `channelId`및 `currenyCode` 을 적절한 값으로 바꿉니다.

   ```bash
   java -classpath .:* -DaccountId=1234 -DchannelId=5678 -DcurrencyCode=Foo Order_POST_ToChannel
   ```

## cURL 명령 검사

`Order_POST_ToChannel.sh` 스크립트는 cURL 명령으로 REST 서비스를 호출합니다.

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/curl/Order_POST_ToChannel.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                                    | 묘사                            |
|:------------------------------------------------------------------------------------- |:----------------------------- |
| `-H "Content-Type: application/json"`                                                 | 요청 본문 형식을 JSON으로 설정합니다.       |
| `-X POST`                                                                             | 지정된 끝점에서 호출할 HTTP 메서드를 설정합니다. |
| `"http://localhost:8080/o/headless-commerce-admin-order/v1.0/orders"`                 | REST 서비스 끝점을 지정합니다.           |
| `-d "{\"accountId\": ${1}, \"channelId\": ${2}, \"currencyCode\": \"${3}\"}"` | 게시할 데이터를 입력합니다.               |
| `-u "test@liferay.com:learn"`                                                         | 기본 인증 자격 증명을 입력합니다.           |

```{note}
여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth 2.0 사용](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2) 을 통해 사용자를 인증해야 합니다. 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2/using-oauth2-to-authorize-users) 를 참조하세요. OAuth2를 사용합니다.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검토

`Order_POST_ToChannel.java` 클래스는 주문 관련 서비스를 호출하여 주문을 추가합니다.

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/java/Order_POST_ToChannel.java
   :dedent: 1
   :language: java
   :lines: 9-28
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                               | 묘사                                                  |
|:-------------------------------------------------------------------- |:--------------------------------------------------- |
| `OrderResource.Builder builder = ...`                                | `OrderResource` 서비스 인스턴스를 생성하기 위해 `빌더` 가져옵니다.       |
| `OrderResource orderResource = builder.authentication(...).build();` | 기본 인증을 사용하고 `OrderResource` 서비스 인스턴스를 생성합니다.        |
| `orderResource.postOrder(...);`                                      | `orderResource.postOrder` 메서드를 호출하고 데이터를 게시에 전달합니다. |

프로젝트에는 `com.liferay.headless.commerce.admin.order.client.jar` 파일이 종속성으로 포함되어 있습니다. `/o/api` (예: <http://localhost:8080/o/api>)에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

!!! note
   `main` 메서드의 주석은 클래스 실행을 보여줍니다.

다른 예제 Java 클래스는 서로 다른 `OrderResource` 메서드를 호출합니다.

!!! important
   [OrderResource]($LIFERAY_LEARN_PORTAL_GIT_TAG$/com/liferay/headless/commerce/admin/order/client/resource/v1_0/OrderResource.java)를 참조하십시오.

다음은 cURL 및 Java를 사용하여 다른 `Order` REST 서비스를 호출하는 예입니다.

## 인스턴스에서 주문 받기

cURL 또는 Java 명령을 사용하여 Liferay 인스턴스의 모든 주문을 나열할 수 있습니다.

### Orders_GET_FromInstance.sh

명령:

```bash
./Orders_GET_FromInstance.sh
```

부호:

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/curl/Orders_GET_FromInstance.sh
   :language: bash
```

### Orders_GET_FromInstance.java

명령:

```bash
java -classpath .:* Orders_GET_FromInstance
```

부호:

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/java/Orders_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 9-18
```

인스턴스의 `주문` 객체가 JSON에 나열됩니다.

### 필터링, 페이지 매기기, 검색 및 정렬 순서

이 API에서 반환된 주문은 필터링, 페이지 매기기, 검색 및 정렬이 가능합니다. 자세한 내용은 [`getOrdersPage`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-order-client/src/main/java/com/liferay/headless/commerce/admin/order/client/resource/v1_0/OrderResource.java#L43-L46) 메서드를 참조하십시오. 다음 `개의 주문` 필드를 사용하여 결과를 필터링, 검색 및 정렬합니다.

- 계정 ID
- 채널 ID
- 주문 상태
- 주문 아이디
- 생성일
- 수정 날짜
- 주문일

| 필터 쿼리                                           | 묘사                                                                                     |
|:----------------------------------------------- |:-------------------------------------------------------------------------------------- |
| `orderId eq 45958`                              | 주문 ID는 45958이어야 합니다.                                                                   |
| `createDate gt 2022-12-31T12:00:00Z`            | 주문 생성 날짜는 2022년 12월 31일 12:00:00 이후여야 합니다.                                             |
| `orderStatus/any(x:(x eq 10) or (x eq 1))`      | 주문 상태는 처리 중(10) 또는 보류 중(1)이어야 합니다. `any` 이라는 용어는 후속 표현식 중 적어도 하나가 `true`반환해야 함을 지정합니다. |
| `accountId/any(x:(x eq 44170) or (x eq 44178))` | 계정 ID는 `44170` 또는 `44178`이어야 합니다. `any` 이라는 용어는 후속 표현식 중 적어도 하나가 `true`반환해야 함을 지정합니다.  |

`orderStatus`로 필터링하려면 연관된 정수 값을 사용해야 합니다. 아래 표는 각 주문 상태를 정수 값에 매핑합니다.

| 주문 상태. | 정수 값 |
|:------ |:---- |
| 열려있는   | 2    |
| 진도안에   | 6    |
| 미정     | 1    |
| 처리중    | 10   |
| 배송됨    | 15   |
| 완료하는   | 0    |
| 취소 된   | 8    |
| 부분 배송  | 14   |
| 파악에    | 20   |

| 쿼리 정렬                               | 묘사                                                         |
|:----------------------------------- |:---------------------------------------------------------- |
| `createDate:desc`                   | 내림차순으로 `createDate` 을 기준으로 정렬합니다.                          |
| `createDate:desc,modifiedDate:desc` | 먼저 `createDate` 을 내림차순으로 정렬한 다음 `modifyDate` 내림차순으로 정렬합니다. |

자세한 내용은 [API 쿼리 매개변수](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/api-query-parameters) 참조하세요.

## 주문 받기

cURL 및 Java `get` 명령을 사용하여 특정 주문을 가져옵니다. `1234` 주문 ID로 바꿉니다.

!!! tip
   `Orders_GET_FromInstance.[java|sh]`를 사용하여 모든 주문 목록을 가져오고 구체적으로 원하는 주문의 `id`를 기록해 둡니다.

### Order_GET_ById.sh

명령:

```bash
./Order_GET_ById.sh 1234
```

부호:

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/curl/Order_GET_ById.sh
   :language: bash
```

### Order_GET_ById.java

명령:

```bash
java -classpath .:* -DorderId=1234 Order_GET_ById
```

부호:

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/java/Order_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`주문` 필드는 JSON 형식입니다.

## 주문 패치

cURL 및 Java `패치` 명령으로 기존 주문을 업데이트합니다. `1234` 주문 ID로 바꿉니다.

### Order_PATCH_ById.sh

명령:

```bash
./Order_PATCH_ById.sh 1234
```

부호:

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/curl/Order_PATCH_ById.sh
   :language: bash
```

### Order_PATCH_ById.java

명령:

```bash
java -classpath .:* -DorderId=1234 Order_PATCH_ById
```

부호:

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/java/Order_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-23
```

## 주문 삭제

cURL 및 Java `delete` 명령을 사용하여 기존 주문을 삭제합니다. `1234` 주문 ID로 바꿉니다.

### Order_DELETE_ById.sh

명령:

```bash
./Order_DELETE_ById.sh 1234
```

부호:

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/curl/Order_DELETE_ById.sh
   :language: bash
```

### Order_DELETE_ById.java

명령

```bash
java -classpath .:* -DorderId=1234 Order_DELETE_ById
```

부호:

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/java/Order_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-16
```

[REST 서비스 사용](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/consuming-rest-services) 은 `Order` 서비스와 스키마를 보여주고 각 서비스를 테스트하기 위한 인터페이스를 가지고 있습니다.