# 할인 API 기본사항

애플리케이션 메뉴 또는 REST API를 사용하여 할인을 관리할 수 있습니다. 할인을 만들고 관리하려면 [headless-admin-commerce-pricing](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/openapi.json) 서비스를 호출하십시오.

## 할인 추가

```{include} /_snippets/run-liferay-dxp.md
```

Liferay가 실행되면,

1. [할인 API 기본 사항](./liferay-r6f7.zip) 을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/pricing/developer-guide/liferay-r6f7.zip -O
   ```

   ```bash
   unzip liferay-r6f7.zip
   ```

1. 할인은 인스턴스로 범위가 지정됩니다. cURL 스크립트를 사용하여 새 할인을 추가하십시오. 명령줄에서 `curl` 폴더로 이동합니다. `Discount_POST_ToInstance.sh` 스크립트를 실행합니다.

   ```bash
   ./Discount_POST_ToInstance.sh
   ```

   JSON 응답은 새로운 할인이 추가되었음을 보여줍니다.

   ```bash
   {
      "actions" : {
         "permissions" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/discounts/46111"
         },
         "get" : {
            "method" : "GET",
            "href" : "http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/discounts/46111"
         },
         "update" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/discounts/46111"
         },
         "delete" : {
            "method" : "DELETE",
            "href" : "http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/discounts/46111"
         }
      },
      "active" : false,
      "amountFormatted" : "0.00%",
      "couponCode" : "",
      "customFields" : { },
      "displayDate" : "2023-02-27T12:31:00Z",
      "externalReferenceCode" : "9df9ffc2-be00-680b-2a2c-69f572bbe65c",
      "id" : 46111,
      "level" : "L1",
      "limitationTimes" : 0,
      "limitationTimesPerAccount" : 0,
      "limitationType" : "unlimited",
      "numberOfUse" : 0,
      "rulesConjunction" : false,
      "target" : "Products",
      "title" : "Foo",
      "useCouponCode" : false,
      "usePercentage" : true
   }
   ```

1. 추가 할인을 확인하려면 **글로벌 메뉴**(![Applications Menu icon](../../images/icon-applications-menu.png))을 열고 **상거래** &rarr; **할인** 으로 이동하십시오. 새로운 할인이 나타납니다.

   ![새 할인이 추가되었는지 확인합니다.](./discount-api-basics/images/01.png)

1. 또는 Java 클라이언트를 사용하여 REST 서비스를 호출하십시오. `java` 폴더로 이동하여 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. `Discount_POST_ToInstance` 클래스를 실행합니다.

   ```bash
   java -classpath .:* Discount_POST_ToInstance
   ```

### 쿠폰 코드 추가

할인에 쿠폰 코드를 추가하려면 `useCouponCode` `true` 으로 설정하고 `couponCode` 필드에 값을 설정합니다. 쿠폰 코드의 사용을 제한하려면 아래 표에 설명된 설정을 사용하십시오.

| 제한 유형      | 설정                                                                                                                                  | 설명                                               |
|:---------- |:----------------------------------------------------------------------------------------------------------------------------------- |:------------------------------------------------ |
| 사용 횟수      | `"limitationType": "limited for total"`<br />`"limitationTimes": 5` (모든 정수)                                                   | 쿠폰 코드는 총 5회 사용할 수 있습니다.                          |
| 계정당 사용 횟수  | `"limitationType": "limited for account"`<br />`"limitationTimesPerAccount" : 5` (모든 정수)                                      | 각 계정은 쿠폰 코드를 최대 5회까지 사용할 수 있습니다.                 |
| 사용횟수 및 계정별 | `"limitationType": "계정 및 합계에 대해 제한됨"`<br />`"limitationTimesPerAccount": 2` (모든 정수)<br />`"limitationTimes": 5` (모든 정수) | 각 계정은 쿠폰 코드를 최대 2회까지 사용할 수 있으며 총 사용량은 5회로 제한됩니다. |

## cURL 명령 검사

`Discount_POST_ToInstance.sh` 스크립트는 cURL 명령으로 REST 서비스를 호출합니다.

```{literalinclude} ./discount-api-basics/resources/liferay-r6f7.zip/curl/Discount_POST_ToInstance.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                                                                                                     | 설명                            |
|:------------------------------------------------------------------------------------------------------------------------------------------------------ |:----------------------------- |
| `-H "Content-Type: application/json"`                                                                                                                  | 요청 본문 형식을 JSON으로 설정합니다.       |
| `-X POST`                                                                                                                                              | 지정된 끝점에서 호출할 HTTP 메서드를 설정합니다. |
| `"http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/discounts"`                                                                             | REST 서비스 끝점을 지정합니다.           |
| `-d "{\"level\": \"L1\", \"limitationType\": \"unlimited\", \"target\": \"products\", \"title\": \"Foo\", \"usePercentage\": true}"` | 게시할 데이터를 입력합니다.               |
| `-u "test@liferay.com:learn"`                                                                                                                          | 기본 인증 자격 증명을 입력합니다.           |

```{note}
여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth 2.0 사용](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2) 을 통해 사용자를 인증해야 합니다. 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2/using-oauth2-to-authorize-users) 를 참조하세요. OAuth2를 사용합니다.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검토

`Discount_POST_ToInstance.java` 클래스는 `DiscountResource` 서비스를 호출하여 할인을 추가합니다.

```{literalinclude} ./discount-api-basics/resources/liferay-r6f7.zip/java/Discount_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-27
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                                     | 설명                                                        |
|:-------------------------------------------------------------------------- |:--------------------------------------------------------- |
| `DiscountResource.Builder builder = ...`                                   | `DiscountResource` 서비스 인스턴스를 생성하기 위해 `빌더` 가져옵니다.          |
| `DiscountResource discountResource = builder.authentication(...).build();` | 기본 인증을 사용하고 `DiscountResource` 서비스 인스턴스를 생성합니다.           |
| `discountResource.postDiscount(...);`                                      | `discountResource.postDiscount` 메서드를 호출하고 데이터를 게시에 전달합니다. |

프로젝트에는 `com.liferay.headless.commerce.admin.pricing.client.jar` 파일이 종속성으로 포함되어 있습니다. `/o/api` (예: <http://localhost:8080/o/api>)에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메서드의 주석은 클래스 실행을 보여줍니다.
```

나머지 예제 Java 클래스는 서로 다른 `DiscountResource` 메소드를 호출합니다.

```{important}
[DiscountResource]$LIFERAY_LEARN_PORTAL_GIT_TAG$/com/liferay/headless/commerce/admin/pricing/client/resource/v2_0/DiscountResource.java)를 참조하십시오.
```

아래는 cURL과 자바를 이용하여 다른 `할인` REST 서비스를 호출하는 예입니다.

## 인스턴스에서 할인 받기

cURL 또는 Java 명령을 사용하여 Liferay 인스턴스의 모든 할인을 나열하십시오.

### Discounts_GET_FromInstance.sh

명령:

```bash
./Discounts_GET_FromInstance.sh
```

암호:

```{literalinclude} ./discount-api-basics/resources/liferay-r6f7.zip/curl/Discounts_GET_FromInstance.sh
   :language: bash
```

### Discounts_GET_FromInstance.java

명령:

```bash
java -classpath .:* Discounts_GET_FromInstance
```

암호:

```{literalinclude} ./discount-api-basics/resources/liferay-r6f7.zip/java/Discounts_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

인스턴스의 `할인` 객체는 JSON 형식입니다.

## 할인 받기

cURL 또는 Java `get` 명령으로 특정 할인을 받으십시오. `1234` 할인 ID로 바꿉니다.

```{tip}
`Discounts_GET_FromInstance.[java|sh]`를 사용하여 모든 할인 목록을 가져오고 구체적으로 원하는 할인의 `id`를 기록해 둡니다.
```

### Discount_GET_ById.sh

명령:

```bash
./Discount_GET_ById.sh 1234
```

암호:

```{literalinclude} ./discount-api-basics/resources/liferay-r6f7.zip/curl/Discount_GET_ById.sh
   :language: bash
```

### Discount_GET_ById.java

명령:

```bash
java -classpath .:* -DdiscountId=1234 Discount_GET_ById
```

암호:

```{literalinclude} ./discount-api-basics/resources/liferay-r6f7.zip/java/Discount_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`할인` 필드는 JSON에 나열됩니다.

## 할인 패치

cURL 및 Java `패치` 명령으로 기존 할인을 업데이트합니다. `1234` 할인 ID로 바꿉니다.

### Discount_PATCH_ById.sh

명령:

```bash
./Discount_PATCH_ById.sh 1234
```

암호:

```{literalinclude} ./discount-api-basics/resources/liferay-r6f7.zip/curl/Discount_PATCH_ById.sh
   :language: bash
```

### Discount_PATCH_ById.java

명령:

```bash
java -classpath .:* -DdiscountId=1234 Discount_PATCH_ById
```

암호:

```{literalinclude} ./discount-api-basics/resources/liferay-r6f7.zip/java/Discount_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## 할인 삭제

cURL 및 Java `delete` 명령을 사용하여 기존 할인을 삭제합니다. `1234` 할인 ID로 바꿉니다.

### Discount_DELETE_ById.sh

명령:

```bash
./Discount_DELETE_ById.sh 1234
```

암호:

```{literalinclude} ./discount-api-basics/resources/liferay-r6f7.zip/curl/Discount_DELETE_ById.sh
   :language: bash
```

### Discount_DELETE_ById.java

명령

```bash
java -classpath .:* -DdiscountId=1234 Discount_DELETE_ById
```

암호:

```{literalinclude} ./discount-api-basics/resources/liferay-r6f7.zip/java/Discount_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[REST 서비스 사용](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/consuming-rest-services) 은 `할인` 서비스 및 스키마를 보여주고 각 서비스를 테스트하기 위한 인터페이스를 가지고 있습니다.
