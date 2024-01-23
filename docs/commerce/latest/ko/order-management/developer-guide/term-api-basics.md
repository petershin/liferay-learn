# 용어 API 기본 사항

애플리케이션 메뉴 또는 REST API를 사용하여 이용약관을 관리할 수 있습니다. [headless-admin-commerce-order](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-commerce-admin-order/v1.0/openapi.json) 의 `/terms` 엔드포인트를 사용하여 이용 약관을 만들고 관리합니다.

## 용어 추가

```{include} /_snippets/run-liferay-dxp.md
```

Liferay가 실행되면,

1. [Term API 기본 사항](./liferay-a9v8.zip) 을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/order-management/developer-guide/liferay-a9v8.zip -O
   ```

   ```bash
   unzip liferay-a9v8.zip
   ```

1. 이용약관을 만들려면 라벨, 이름, 우선순위, 유형의 네 가지 매개변수가 필요합니다.

   | 모수    | 값 유형   | 설명/<br />예                                                         |
   |:----- |:------ |:------------------------------------------------------------------------ |
   | 상표    | 텍스트    | 쉼표로 구분된 로캘/값 속성 목록을 입력하세요.<br />`{"en_US": "Foo", "es_ES": "Bar"}` |
   | 이름    | 텍스트    | 이용약관 항목에 대한 고유한 이름을 입력하십시오:<br />`"name": "foo"`                   |
   | 우선 사항 | 숫자(더블) | 고유한 숫자 우선순위 입력:<br />`"우선순위": 1.2`                                 |
   | 유형    | 텍스트    | `"결제 조건" 지정` 또는 `"배송 조건"`:<br />`"유형": "결제 조건"`                    |

   cURL 스크립트를 사용하여 인스턴스에 이용 약관을 추가합니다. 명령줄에서 `curl` 폴더로 이동합니다. `Term_POST_ToInstance.sh` 스크립트를 실행합니다.

   ```bash
   ./Term_POST_ToInstance.sh
   ```

   JSON 응답은 새로 추가된 이용약관을 보여줍니다.

   ```bash
   {
      "actions" : {
         "permissions" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/headless-commerce-admin-order/v1.0/terms/46418"
         },
         "get" : {
            "method" : "GET",
            "href" : "http://localhost:8080/o/headless-commerce-admin-order/v1.0/terms/46418"
         },
         "update" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/headless-commerce-admin-order/v1.0/terms/46418"
         },
         "delete" : {
            "method" : "DELETE",
            "href" : "http://localhost:8080/o/headless-commerce-admin-order/v1.0/terms/46418"
         }
      },
      "active" : false,
      "description" : {
         "en_US" : ""
      },
      "displayDate" : "2023-03-03T13:16:00Z",
      "externalReferenceCode" : "7fa19a0c-4c98-6c36-f1bc-5a2c4257220c",
      "id" : 46418,
      "label" : {
         "en_US" : "Foo"
      },
      "name" : "foo",
      "priority" : 0.0,
      "type" : "payment-terms",
      "typeLocalized" : "Payment Terms",
      "typeSettings" : "",
      "workflowStatusInfo" : {
         "code" : 0,
         "label" : "approved",
         "label_i18n" : "Approved"
      }
   }
   ```

1. **글로벌 메뉴**(![Applications Menu icon](../../images/icon-applications-menu.png)) &rarr; **상거래** &rarr; **이용 약관** 으로 이동 합니다 . 새로 추가된 이용약관이 나타납니다.

   ![이용약관 추가를 확인합니다.](./term-api-basics/images/01.png)

1. 또는 Java 클라이언트를 사용하여 REST 서비스를 호출하십시오. `java` 폴더로 이동하여 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. `Term_POST_ToInstance` 클래스를 실행합니다.

   ```bash
   java -classpath .:* Term_POST_ToInstance
   ```

## cURL 명령 검사

`Term_POST_ToInstance.sh` 스크립트는 cURL 명령으로 REST 서비스를 호출합니다.

```{literalinclude} ./term-api-basics/resources/liferay-a9v8.zip/curl/Term_POST_ToInstance.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                                                                        | 설명                            |
|:------------------------------------------------------------------------------------------------------------------------- |:----------------------------- |
| `-H "Content-Type: application/json"`                                                                                     | 요청 본문 형식을 JSON으로 설정합니다.       |
| `-X POST`                                                                                                                 | 지정된 끝점에서 호출할 HTTP 메서드를 설정합니다. |
| `"http://localhost:8080/o/headless-commerce-admin-order/v1.0/terms"`                                                      | REST 서비스 끝점을 지정합니다.           |
| `-d "{\"label\": {\"en_US\": \"Foo\"}, \"name\": \"foo\", \"priority\": 0, \"type\": \"payment-terms\"}"` | 게시할 데이터를 입력합니다.               |
| `-u "test@liferay.com:learn"`                                                                                             | 기본 인증 자격 증명을 입력합니다.           |

```{note}
여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth 2.0 사용](https://learn.liferay.com/dxp/latest/ko/headless-delivery/using-oauth2.html) 을 통해 사용자를 인증해야 합니다. 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증](https://learn.liferay.com/dxp/latest/ko/headless-delivery/using-oauth2/using-oauth2-to-authorize-users.html) 를 참조하세요. OAuth2를 사용합니다.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검토

`Term_POST_ToInstance.java` 클래스는 `TermResource` 서비스를 호출하여 약관을 추가합니다.

```{literalinclude} ./term-api-basics/resources/liferay-a9v8.zip/java/Term_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 11-32
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                             | 설명                                                |
|:------------------------------------------------------------------ |:------------------------------------------------- |
| `TermResource.Builder builder = ...`                               | `TermResource` 서비스 인스턴스를 생성하기 위한 `빌더` 가져옵니다.      |
| `TermResource termResource = builder.authentication(...).build();` | 기본 인증을 사용하고 `TermResource` 서비스 인스턴스를 생성합니다.       |
| `termResource.postTerm(...);`                                      | `termResource.postTerm` 메서드를 호출하고 데이터를 게시에 전달합니다. |

프로젝트에는 `com.liferay.headless.commerce.admin.order.client.jar` 파일이 종속성으로 포함되어 있습니다. `/o/api` (예: <http://localhost:8080/o/api>)에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메서드의 주석은 클래스 실행을 보여줍니다.
```

나머지 예제 Java 클래스는 서로 다른 `TermResource` 메서드를 호출합니다.

```{important}
[TermResource]$LIFERAY_LEARN_PORTAL_GIT_TAG$/com/liferay/headless/commerce/admin/order/client/resource/v1_0/TermResource.java)를 참조하십시오.
```

다음은 cURL 및 Java를 사용하여 다른 `Term` REST 서비스를 호출하는 예입니다.

## 인스턴스에서 용어 가져오기

cURL 또는 Java 명령을 사용하여 Liferay 인스턴스의 모든 이용 약관을 나열할 수 있습니다.

### Terms **GET** FromInstance.sh

명령:

```bash
./Terms_GET_FromInstance.sh
```

암호:

```{literalinclude} ./term-api-basics/resources/liferay-a9v8.zip/curl/Terms_GET_FromInstance.sh
   :language: bash
```

### Terms **GET** FromInstance.java

명령:

```bash
java -classpath .:* Terms_GET_FromInstance
```

암호:

```{literalinclude} ./term-api-basics/resources/liferay-a9v8.zip/java/Terms_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 9-18
```

인스턴스의 `Term` 객체가 JSON에 나열됩니다.

### 용어 필터링, 페이지 매기기, 검색 및 정렬

반환된 이용약관을 필터링, 페이지 매기기, 검색 및 정렬할 수 있습니다. 자세한 내용은 [`getTermsPage`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-order-client/src/main/java/com/liferay/headless/commerce/admin/order/client/resource/v1_0/TermResource.java#L43-L46) 메서드를 참조하십시오. `우선 순위` 및 `유형` 필드를 사용하여 결과를 필터링, 검색 및 정렬합니다.

| 필터 쿼리                     | 설명                     |
|:------------------------- |:---------------------- |
| `type eq 'payment-terms'` | 이용약관은 지불 조건 유형이어야 합니다. |
| `priority eq 0`           | 이용약관의 우선순위는 0이어야 합니다.  |

| 쿼리 정렬                     | 설명                                            |
|:------------------------- |:--------------------------------------------- |
| `priority:desc`           | 내림차순으로 `우선 순위` 로 정렬합니다.                       |
| `priority:desc,type:desc` | `우선 순위` 내림차순으로 먼저 정렬한 다음 `기준으로 내림차순으로` 입력합니다. |

자세한 내용은 [API 쿼리 매개변수](https://learn.liferay.com/dxp/latest/ko/headless-delivery/consuming-apis/api-query-parameters.html) 참조하세요.

## 기간을 얻을

cURL 및 Java `get` 명령을 사용하여 특정 이용 약관을 가져옵니다. `1234` 이용 약관의 ID로 바꿉니다.

```{tip}
`Terms_GET_FromInstance.[java|sh]`를 사용하여 모든 이용약관 목록을 가져오고 구체적으로 원하는 이용약관의 `id`를 기록해 둡니다.
```

### Term **GET** ById.sh

명령:

```bash
./Term_GET_ById.sh 1234
```

암호:

```{literalinclude} ./term-api-basics/resources/liferay-a9v8.zip/curl/Term_GET_ById.sh
   :language: bash
```

### Term **GET** ById.java

명령:

```bash
java -classpath .:* -DtermId=1234 Term_GET_ById
```

암호:

```{literalinclude} ./term-api-basics/resources/liferay-a9v8.zip/java/Term_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

`Term` 필드는 JSON 형식입니다.

## 용어 패치

cURL 및 Java `패치` 명령으로 기존 이용 약관을 업데이트합니다. `1234` 이용 약관의 ID로 바꿉니다.

### Term **PATCH** ById.sh

명령:

```bash
./Term_PATCH_ById.sh 1234
```

암호:

```{literalinclude} ./term-api-basics/resources/liferay-a9v8.zip/curl/Term_PATCH_ById.sh
   :language: bash
```

### Term **PATCH** ById.java

명령:

```bash
java -classpath .:* -DtermId=1234 Term_PATCH_ById
```

암호:

```{literalinclude} ./term-api-basics/resources/liferay-a9v8.zip/java/Term_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 11-29
```

## 용어 삭제

cURL 및 Java `delete` 명령을 사용하여 기존 이용 약관을 삭제합니다. `1234` 이용 약관의 ID로 바꿉니다.

### Term **DELETE** ById.sh

명령:

```bash
./Term_DELETE_ById.sh 1234
```

암호:

```{literalinclude} ./term-api-basics/resources/liferay-a9v8.zip/curl/Term_DELETE_ById.sh
   :language: bash
```

### Term **DELETE** ById.java

명령

```bash
java -classpath .:* -DtermId=1234 Term_DELETE_ById
```

암호:

```{literalinclude} ./term-api-basics/resources/liferay-a9v8.zip/java/Term_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-16
```

[REST 서비스 사용](https://learn.liferay.com/dxp/latest/ko/headless-delivery/consuming-apis/consuming-rest-services.html) 은 `Term` 서비스 및 스키마를 보여주고 각 서비스를 테스트하기 위한 인터페이스를 가지고 있습니다.
