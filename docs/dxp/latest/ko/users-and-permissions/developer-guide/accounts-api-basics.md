# 계정 API 기본 사항

{bdg-secondary}`Liferay DXP/Portal 7.4+`

애플리케이션 메뉴에서 [계정](../accounts.md) 관리할 수 있지만 Liferay의 REST API를 사용할 수도 있습니다. 계정을 만들고 관리하려면 다음 서비스를 호출하세요.

## 계정 추가

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르세요.

1. [Accounts API 기본 사항](./liferay-t5p9.zip) 다운로드하고 압축을 풉니다.

    ```bash
    curl https://resources.learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-t5p9.zip -O
    ```

    ```bash
    unzip liferay-t5p9.zip
    ```

1. cURL 스크립트를 사용하여 인스턴스에 새 계정을 추가합니다. 명령줄에서 `curl` 폴더로 이동합니다. `Account_POST_ToInstance.sh` 스크립트를 실행합니다.

    ```bash
    ./Account_POST_ToInstance.sh
    ```

    JSON 응답은 새 계정이 추가되었음을 보여줍니다.

    ```json
    {
      "description" : "Foo",
      "domains" : [ ],
      "externalReferenceCode" : "",
      "id" : 39302,
      "name" : "Able",
      "numberOfUsers" : 0,
      "organizationIds" : [ ],
      "parentAccountId" : 0,
      "status" : 0,
      "type" : "business"
    }
    ```

1. **글로벌 메뉴** &rarr; **애플리케이션** &rarr; **계정** 으로 이동합니다. 새 계정이 추가되었는지 확인하세요.

    ![See that a new account has been added.](./accounts-api-basics/images/01.png)

1. REST 서비스는 Java 클라이언트를 사용하여 호출할 수도 있습니다. `curl` 폴더에서 `java` 폴더로 이동합니다. 다음 명령을 사용하여 소스 파일을 컴파일합니다.

    ```bash
    javac -classpath .:* *.java
    ```

1. 다음 명령을 사용하여 `Account_POST_ToInstance.java` 클래스를 실행합니다.

    ```bash
    java -classpath .:* Account_POST_ToInstance
    ```

## cURL 명령 검사

`Account_POST_ToInstance.sh` 스크립트는 cURL 명령을 사용하여 REST 서비스를 호출합니다.

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/curl/Account_POST_ToInstance.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                            | 묘사                       |
| :------------------------------------------------------------ | :----------------------- |
| `-H "Content-Type: application/json"`                         | 요청 본문 형식이 JSON임을 나타냅니다.  |
| `-X POST`                                                     | 지정된 엔드포인트에서 호출할 HTTP 메서드 |
| `"http://localhost:8080/o/headless-admin-user/v1.0/accounts"` | REST 서비스 엔드포인트           |
| `-d "{\"description\": \"Foo\", \"name\": \"Able\"}"`         | 귀하가 게시를 요청하는 데이터         |
| `-u "test@liferay.com:learn"`                                 | 기본 인증 자격 증명              |

!!! note
    여기서는 데모 목적으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth2](../../headless-delivery/using-oauth2.md) 을 통해 사용자에게 권한을 부여해야 합니다. OAuth2를 사용하는 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증](../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) 참조하세요.

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검사

`Account_POST_ToInstance.java` 클래스는 Account 관련 서비스를 호출하여 계정을 추가합니다.

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/java/Account_POST_ToInstance.java
    :dedent: 1
    :language: java
    :lines: 9-25
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약어)                                                | 묘사                                                      |
| :----------------------------------------------------------------------- | :------------------------------------------------------ |
| `AccountResource.Builder builder = ...`                                  | 'AccountResource' 서비스 인스턴스를 생성하기 위한 'Builder'를 가져옵니다.   |
| `AccountResource accountResource = builder.authentication(...).build();` | 기본 인증을 지정하고 'AccountResource' 서비스 인스턴스를 생성합니다.          |
| `Account account = accountResource.postAccount(...);`                    | `accountResource.postAccount` 메소드를 호출하고 데이터를 게시에 전달합니다. |

프로젝트에는 `com.liferay.headless.admin.user.client.jar` 파일이 종속성으로 포함되어 있습니다. 설치된 API 탐색기의 `/o/api`에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

!!! note
    `main` 메소드의 주석은 클래스 실행을 보여줍니다.

다른 예제 Java 클래스는 이와 유사하지만 다른 `AccountResource` 메소드를 호출합니다.

!!! important
    서비스 세부정보는 [AccountResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-user/headless-admin-user-client/src/main/java/com/liferay/headless/admin/user/client/resource/v1_0/AccountResource.java) 참조하세요.

다음은 cURL 및 Java를 사용하여 다른 `Account` REST 서비스를 호출하는 예입니다.

## 인스턴스에서 계정 가져오기

다음 cURL 또는 Java 명령을 실행하여 계정을 나열할 수 있습니다.

### Accounts_GET_FromInstance.sh

명령:

```bash
./Accounts_GET_FromInstance.sh
```

부호:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/curl/Accounts_GET_FromInstance.sh
    :language: bash
```

### Accounts_GET_FromInstance.java

명령:

```bash
java -classpath .:* Accounts_GET_FromInstance
```

부호:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/java/Accounts_GET_FromInstance.java
    :dedent: 1
    :language: java
    :lines: 11-22
```

인스턴스의 `Account` 객체가 JSON에 나타납니다.

## 계정을 만드세요

다음 cURL 또는 Java 명령을 사용하여 특정 계정을 가져옵니다.

!!! tip
    ``Accounts_GET_FromInstance.[java|sh]``를 사용하여 인스턴스 ``Account`` ID를 가져옵니다.

### Account_GET_ById.sh

명령:

```bash
./Account_GET_ById.sh 1234
```

부호:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/curl/Account_GET_ById.sh
    :language: bash
```

### Account_GET_ById.java

명령:

```bash
java -classpath .:* -DaccountId=1234 Account_GET_ById
```

부호:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/java/Account_GET_ById.java
    :dedent: 1
    :language: java
    :lines: 8-18
```

'계정' 필드는 JSON에 표시됩니다.

## 계정 패치

다음 cURL 및 Java 명령을 사용하여 기존 계정을 부분적으로 편집합니다. '1234'를 계정 ID로 바꾸세요.

### Account_PATCH_ById.sh

명령:

```bash
./Account_PATCH_ById.sh 1234
```

부호:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/curl/Account_PATCH_ById.sh
    :language: bash
```

### Account_PATCH_ById.java

명령:

```bash
java -classpath .:* -DaccountId=1234 Account_PATCH_ById
```

부호:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/java/Account_PATCH_ById.java
    :dedent: 1
    :language: java
    :lines: 9-25
```

## 계정을 넣어

다음 cURL 및 Java 명령을 사용하여 기존 계정을 완전히 덮어씁니다. '1234'를 계정 ID로 바꾸세요.

### Account_PUT_ById.sh

명령:

```bash
./Account_PUT_ById.sh 1234
```

부호:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/curl/Account_PUT_ById.sh
    :language: bash
```

### Account_PUT_ById.java

명령:

```bash
java -classpath .:* -DaccountId=1234 Account_PUT_ById
```

부호:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/java/Account_PUT_ById.java
    :dedent: 1
    :language: java
    :lines: 9-26
```

## 계정 삭제

다음 cURL 및 Java 명령을 사용하여 기존 계정을 삭제합니다. '1234'를 계정 ID로 바꾸세요.

### Account_DELETE_ById.sh

명령:

```bash
./Account_DELETE_ById.sh 1234
```

부호:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/curl/Account_DELETE_ById.sh
    :language: bash
```

### Account_DELETE_ById.java

명령

```bash
java -classpath .:* -DaccountId=1234 Account_DELETE_ById
```

부호:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/java/Account_DELETE_ById.java
    :dedent: 1
    :language: java
    :lines: 8-17
```

[API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md) 은 '계정' 서비스와 스키마를 모두 표시하고 각 서비스를 시험해 볼 수 있는 인터페이스를 갖추고 있습니다.

!!! note
    [PostalAddress_POST_ToAccount](./postal-address-api-basics.md#add-postal-address-to-account) 및 [PostalAddresses_GET_FromAccount](./postal-address-api-basics.md#get-postal-addresses-from-account) 로 계정 우편 주소를 생성하고 가져옵니다.