# 우편 주소 API 기본 사항

{bdg-secondary}`liferay DXP/포탈 7.4+`

Liferay의 REST API를 사용하여 우편 주소를 관리하세요.

## 계정에 우편 주소 추가

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르세요.

1. [우편 주소 API 기본 사항](./liferay-n8y7.zip) 다운로드 및 압축 해제.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-n8y7.zip -O
   ```

   ```bash
   unzip liferay-n8y7.zip
   ```

1. [Accounts_GET_FromInstance](./accounts-api-basics.md#get-accounts-from-instance) 사용하여 계정 목록을 가져옵니다. 우편 주소를 추가할 계정의 ID를 기록해 두세요. **글로벌 메뉴** &rarr; **제어판** &rarr; **계정** 으로 이동하여 계정 목록을 볼 수도 있습니다.

1. cURL 스크립트를 사용하여 선택한 계정에 새 우편 주소를 추가하세요. 명령줄에서 `curl` 폴더로 이동합니다. 'PostalAddress **POST** ToAccount.sh' 스크립트를 실행합니다. '1234'를 계정 ID로 바꾸세요.

   ```bash
   ./PostalAddress_POST_ToAccount.sh 1234
   ```

   JSON 응답은 새 우편 주소가 추가되었음을 보여줍니다.

   ```json
    {
      "addressCountry" : "United States",
      "addressLocality" : "Diamond Bar",
      "addressRegion" : "California",
      "addressType" : "shipping",
      "id" : 35706,
      "name" : "Able Address",
      "postalCode" : "12345",
      "primary" : false,
      "streetAddressLine1" : "123 Foo St",
      "streetAddressLine2" : "",
      "streetAddressLine3" : ""
    }
   ```

1. **글로벌 메뉴** &rarr; **제어판** &rarr; **계정** 으로 이동합니다. 2단계에서 선택한 계정을 선택하고 **주소** 로 이동합니다. 새 우편 주소가 계정에 추가되었는지 확인하세요.

   ![See that a new postal address has been added.](./postal-address-api-basics/images/01.png)

1. REST 서비스는 Java 클라이언트를 사용하여 호출할 수도 있습니다. `curl` 폴더에서 `java` 폴더로 이동합니다. 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. `PostalAddress_POST_ToAccount.java` 클래스를 실행합니다. '1234'를 계정 ID로 바꾸세요.

   ```bash
   java -classpath .:* -DaccountId=1234 PostalAddress_POST_ToAccount
   ```

## cURL 명령 검사

`PostalAddress_POST_ToAccount.sh` 스크립트는 cURL 명령을 사용하여 REST 서비스를 호출합니다.

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/curl/PostalAddress_POST_ToAccount.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                                                                                                                                                                                                                                                                                    | 묘사                       |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :----------------------- |
| `-H "Content-Type: application/json"`                                                                                                                                                                                                                                                                                                 | 요청 본문 형식이 JSON임을 나타냅니다.  |
| `-X POST`                                                                                                                                                                                                                                                                                                                             | 지정된 엔드포인트에서 호출할 HTTP 메서드 |
| `"http://localhost:8080/o/headless-admin-user/v1.0/accounts/${1}/postal-addresses"`                                                                                                                                                                                                                                                   | REST 서비스 엔드포인트           |
| `-d "{\"addressCountry\": \"United States\", \"addressLocality\": \"Diamond Bar\", \"addressRegion\": \"California\", \"addressType\": \"shipping\", \"name\": \"Able Address\", \"postalCode\": \"12345\", \"primary\": false, \"streetAddressLine1\": \"123 Foo St\", \"streetAddressLine2\": \"\", \"streetAddressLine3\": \"\"}"` | 귀하가 게시를 요청하는 데이터         |
| `-u "test@liferay.com:learn"`                                                                                                                                                                                                                                                                                                         | 기본 인증 자격 증명              |

!!! note
   여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth2](../../headless-delivery/using-oauth2.md) 을 통해 사용자에게 권한을 부여해야 합니다. OAuth2를 사용하는 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증](../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) 참조하세요.

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검사

`PostalAddress_POST_ToAccount.java` 클래스는 우편 주소 관련 서비스를 호출하여 우편 주소를 추가합니다.

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/java/PostalAddress_POST_Account.java
   :dedent: 1
   :language: java
   :lines: 9-35
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약어)                                                            | 묘사                                                                         |
| :----------------------------------------------------------------------------------- | :------------------------------------------------------------------------- |
| `PostalAddress.Builder builder = ...`                                                | 'PostalAddressResource' 서비스 인스턴스를 생성하기 위한 'Builder'를 가져옵니다.                |
| `PostalAddressResource postalAddressResource = builder.authentication(...).build();` | 기본 인증을 지정하고 'PostalAddressResource' 서비스 인스턴스를 생성합니다.                       |
| `PostalAddress postalAddress = postalAddressResource.postAccountPostalAddress(...);` | `postalAddressResource.postAccountPostalAddress` 메소드를 호출하고 데이터를 게시에 전달합니다. |

프로젝트에는 `com.liferay.headless.admin.user.client.jar` 파일이 종속성으로 포함되어 있습니다. 설치된 API 탐색기의 `/o/api`에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

!!! note
   `main` 메소드의 주석은 클래스 실행을 보여줍니다.

다른 예제 Java 클래스는 이와 유사하지만 다른 `PostalAddressResource` 메소드를 호출합니다.

!!! important
    서비스 세부정보는 [PostalAddressResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-user/headless-admin-user-client/src/main/java/com/liferay/headless/admin/user/client/resource/v1_0/PostalAddressResource.java) 참조하세요.

다음은 cURL 및 Java를 사용하여 다른 `PostalAddress` REST 서비스를 호출하는 예입니다.

## 계정에서 우편 주소 가져오기

다음 cURL 또는 Java 명령을 사용하여 계정에서 우편 주소 목록을 가져옵니다. '1234'를 계정 ID로 바꿉니다.

### PostalAddresses_GET_FromAccount.sh

명령:

```bash
./PostalAddresses_GET_FromAccount.sh 1234
```

부호:

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/curl/PostalAddresses_GET_FromAccount.sh
   :language: bash
```

### PostalAddresses_GET_FromAccount.java

명령:

```bash
java -classpath .:* -DaccountId=1234 PostalAddresses_GET_FromAccount
```

부호:

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/java/PostalAddresses_GET_FromAccount.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

계정의 우편 주소가 JSON 응답으로 반환됩니다.

## 조직에서 우편 주소 가져오기

다음 cURL 또는 Java 명령을 사용하여 조직의 우편 주소 목록을 가져옵니다. '1234'를 조직의 ID로 바꿉니다.

### PostalAddresses_GET_FromOrganization.sh

명령:

```bash
./PostalAddresses_GET_FromOrganization.sh 1234
```

부호:

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/curl/PostalAddresses_GET_FromOrganization.sh
   :language: bash
```

### PostalAddresses_GET_FromOrganization.java

명령:

```bash
java -classpath .:* -DorganizationId=1234 PostalAddresses_GET_FromOrganization
```

부호:

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/java/PostalAddresses_GET_FromOrganization.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

조직의 우편 주소가 JSON 응답으로 반환됩니다.

## 사용자로부터 우편 주소 얻기

다음 cURL 또는 Java 명령을 사용하여 사용자로부터 우편 주소 목록을 가져옵니다. '1234'를 사용자 ID로 바꿉니다.

### PostalAddresses_GET_FromUser.sh

명령:

```bash
./PostalAddresses_GET_FromUser.sh 1234
```

부호:

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/curl/PostalAddresses_GET_FromUser.sh
   :language: bash
```

### PostalAddresses_GET_FromUser.java

명령:

```bash
java -classpath .:* -DuserAccountId=1234 PostalAddresses_GET_FromUser
```

부호:

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/java/PostalAddresses_GET_FromUser.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

사용자의 우편 주소가 JSON 응답으로 반환됩니다.

## 우편 주소 받기

다음 cURL 또는 Java 명령을 사용하여 특정 우편 주소를 가져옵니다. '1234'를 우편 주소의 ID로 바꿉니다.

!!! tip
    `PostalAddress_GET_FromAccount.[java|sh]`를 사용하여 계정 `우편 주소` ID를 가져옵니다.

    조직의 ``우편 주소`` ID를 얻으려면 ``PostalAddress_GET_FromOrganization.[java|sh]``를 사용하십시오.

    ``PostalAddress_GET_FromUser.[java|sh]``를 사용하여 사용자 ``우편 주소`` ID를 가져옵니다.

### PostalAddress_GET_ById.sh

명령:

```bash
./PostalAddress_GET_ById.sh 1234
```

부호:

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/curl/PostalAddress_GET_ById.sh
   :language: bash
```

### PostalAddress_GET_ById.java

명령:

```bash
java -classpath .:* -DpostalAddressId=1234 PostalAddress_GET_ById
```

부호:

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/java/PostalAddress_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

우편 주소는 JSON 응답으로 반환됩니다.

## 우편 주소 패치

다음 cURL 또는 Java 명령을 사용하여 기존 우편 주소를 부분적으로 편집합니다. '1234'를 우편 주소의 ID로 바꿉니다.

### PostalAddress_PATCH_ById.sh

명령:

```bash
./PostalAddress_PATCH_ById.sh 1234
```

부호:

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/curl/PostalAddress_PATCH_ById.sh.sh
   :language: bash
```

### PostalAddress_PATCH_ById.java

명령:

```bash
java -classpath .:* -DpostalAddressId=1234 PostalAddress_PATCH_ById
```

부호:

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/java/PostalAddress_PATCH_ById.sh.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## 우편 주소를 입력하세요

다음 cURL 또는 Java 명령을 사용하여 기존 우편 주소를 완전히 덮어씁니다. '1234'를 우편 주소의 ID로 바꿉니다.

### PostalAddress_PUT_ById.sh

명령:

```bash
./PostalAddress_PUT_ById.sh 1234
```

부호:

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/curl/PostalAddress_PUT_ById.sh.sh
   :language: bash
```

### PostalAddress_PUT_ById.java

명령:

```bash
java -classpath .:* -DpostalAddressId=1234 PostalAddress_PUT_ById
```

부호:

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/java/PostalAddress_PUT_ById.sh.java
   :dedent: 1
   :language: java
   :lines: 9-34
```

## 우편 주소 삭제

다음 cURL 또는 Java 명령을 사용하여 기존 우편 주소를 삭제합니다. '1234'를 우편 주소의 ID로 바꿉니다.

### PostalAddress_DELETE_ById.sh

명령:

```bash
./PostalAddress_DELETE_ById.sh 1234
```

부호:

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/curl/PostalAddress_DELETE_ById.sh.sh
   :language: bash
```

### PostalAddress_DELETE_ById.java

명령:

```bash
java -classpath .:* -DpostalAddressId=1234 PostalAddress_DELETE_ById
```

부호:

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/java/PostalAddress_DELETE_ById.sh.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md) 에는 모든 'PostalAddress' 서비스와 스키마가 표시되며 각 서비스를 시험해 볼 수 있는 인터페이스가 있습니다.
