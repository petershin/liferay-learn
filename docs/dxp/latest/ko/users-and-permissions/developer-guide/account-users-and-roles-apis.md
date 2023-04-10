# 계정 사용자 및 역할 API

애플리케이션 메뉴에서 [계정 사용자](../accounts/account-users.md) 및 [계정 역할](../accounts/account-roles.md) 관리할 수 있지만 Liferay의 REST API를 사용할 수도 있습니다. 이러한 서비스를 호출하여 계정 사용자 및 역할을 만들고 관리합니다.

## 계정 사용자 추가

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르십시오.

1. [계정 API 기본 사항](./liferay-t5p9.zip) 을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-t5p9.zip -O
   ```

   ```bash
   unzip liferay-t5p9.zip
   ```

1. [Accounts_GET_FromInstance](./accounts-api-basics.html#get-an-account) 리소스를 사용하여 계정 ID 목록을 가져옵니다. 사용자를 추가하려는 계정 ID를 기록해 둡니다.

1. cURL 스크립트를 사용하여 새 계정 사용자를 계정에 추가합니다. 명령줄에서 `curl` 폴더로 이동합니다. 계정 ID를 매개변수로 사용하여 `AccountUser_POST_ToAccount.sh` 스크립트를 실행합니다.

   ```bash
   ./AccountUser_POST_ToAccount.sh 1234
   ```

   JSON 응답은 새 계정이 추가되었음을 보여줍니다.

   ```bash
        {
        "accountBriefs" : [ {
            "id" : 38935,
            "name" : "Able",
            "roleBriefs" : [ ]
        } ],
        "additionalName" : "",
        "alternateName" : "dog",
        "birthDate" : "1977-01-01T00:00:00Z",
        "customFields" : [ ],
        "dashboardURL" : "",
        "dateCreated" : "2021-10-12T21:00:59Z",
        "dateModified" : "2021-10-12T21:01:01Z",
        "emailAddress" : "dog@liferay.com",
        "externalReferenceCode" : "",
        "familyName" : "Easy",
        "givenName" : "Dog",
        "id" : 39005,
        "jobTitle" : "",
        "keywords" : [ ],
        "name" : "Dog Easy",
        "organizationBriefs" : [ ],
        "profileURL" : "",
        "roleBriefs" : [ {
            "id" : 20111,
            "name" : "User"
        } ],
        "siteBriefs" : [ {
            "id" : 20125,
            "name" : "Global"
        }, {
            "id" : 20123,
            "name" : "Guest"
        } ],
        "userAccountContactInformation" : {
            "emailAddresses" : [ ],
            "facebook" : "",
            "jabber" : "",
            "postalAddresses" : [ ],
            "skype" : "",
            "sms" : "",
            "telephones" : [ ],
            "twitter" : "",
            "webUrls" : [ ]
        }
        }     
    ```

1. **글로벌 메뉴** &rarr; **애플리케이션** &rarr; **계정** 으로 이동합니다. 사용자를 만든 계정을 클릭합니다. **사용자** 탭을 클릭하고 생성된 새 사용자를 확인합니다.

  ![새 계정 사용자가 추가되었는지 확인합니다.](./account-users-and-roles-apis/images/01.png)

1. REST 서비스는 Java 클라이언트를 사용하여 호출할 수도 있습니다. `curl` 폴더에서 `java` 폴더로 이동합니다. 다음 명령을 사용하여 소스 파일을 컴파일합니다.

    ```bash
    javac -classpath .:* *.java
    ```

2. 다음 명령을 사용하여 `AccountUser_POST_ToAccount.java` 클래스를 실행합니다. `1234` 계정의 ID로 바꿉니다.

   ```bash
   java -classpath .:* -DaccountId=1234 AccountUser_POST_ToAccount
   ```

## cURL 명령 검사

`AccountUser_POST_ToAccount.sh` 스크립트는 cURL 명령으로 REST 서비스를 호출합니다.

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/curl/AccountUser_POST_ToAccount.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                                                                                           | 묘사                      |
|:-------------------------------------------------------------------------------------------------------------------------------------------- |:----------------------- |
| `-H "Content-Type: application/json"`                                                                                                        | 요청 본문 형식이 JSON임을 나타냅니다. |
| `-X POST`                                                                                                                                    | 지정된 끝점에서 호출할 HTTP 메서드   |
| `"http://localhost:8080/o/headless-admin-user/v1.0/accounts/${1}/user-accounts"`                                                             | REST 서비스 끝점             |
| `-d "{\"alternateName\": \"Dog\", \"emailAddress\": \"dog@liferay.com\", \"familyName\": \"Easy\", \"givenName\": \"Dog\"}"` | 게시를 요청하는 데이터            |
| `-u "test@liferay.com:learn"`                                                                                                                | 기본 인증 자격 증명             |

```{note}
여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth2](../../headless-delivery/using-oauth2.md)을 통해 사용자를 인증해야 합니다. OAuth2를 사용하는 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증하기](../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md)를 참조하세요.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검토

`Account_POST_ToInstance.java` 클래스는 관련 서비스를 호출하여 계정 사용자를 추가합니다.

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/java/Account_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                                           | 묘사                                                                      |
|:-------------------------------------------------------------------------------- |:----------------------------------------------------------------------- |
| `UserAccountResource.Builder builder = ...`                                      | `UserAccountResource` 서비스 인스턴스를 생성하기 위한 `빌더` 가져옵니다.                     |
| `UserAccountResource userAccountResource = builder.authentication(...).build();` | 기본 인증을 지정하고 `UserAccountResource` 서비스 인스턴스를 생성합니다.                      |
| `UserAccount userAccount = userAccountResource.postAccountUserAccount(...);`     | `userAccountResource.postAccountUserAccount` 메서드를 호출하고 데이터를 게시물에 전달합니다. |

프로젝트에는 `com.liferay.headless.admin.user.client.jar` 파일이 종속성으로 포함되어 있습니다. `/o/api`에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메서드의 주석은 클래스 실행을 보여줍니다.
```

다른 예제 Java 클래스는 이것과 유사하지만 다른 메소드를 호출합니다.

```{important}
[AccountResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-user/headless-admin-user-client/src/main/java/com 참조) /liferay/headless/admin/user/client/resource/v1_0/AccountResource.java)를 참조하십시오.
```

다음은 cURL 및 Java를 사용하여 기타 관련 REST 서비스를 호출하는 예입니다.

## 계정에서 계정 사용자 가져오기

다음 cURL 또는 Java 명령을 실행하여 계정의 사용자를 나열할 수 있습니다. 위와 같이 `1234` 계정 ID로 바꿉니다.

### AccountUsers_GET_FromAccount.sh

명령:

```bash
./AccountUsers_GET_FromAccount 1234
```

부호:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/curl/AccountUsers_GET_FromAccount.sh
   :language: bash
```

### AccountUsers_GET_FromAccount.java

명령:

```bash
java -classpath .:* -DaccountId=1234 AccountUsers_GET_FromAccount
```

부호:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/java/AccountUsers_GET_FromAccount.java
   :dedent: 1
   :language: java
   :lines: 11-23
```

계정의 `UserAccount` 개체가 JSON에 나타납니다.

## 계정 역할 게시

특정 계정에 대한 새 계정 역할을 생성합니다. `1234` 계정 ID로 바꾸십시오.

### AccountRole_POST_ToAccount.sh

명령:

```bash
./AccountRole_POST_ToAccount.sh 1234
```

부호:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/curl/AccountRole_POST_ToAccount.sh
   :language: bash
```

### AccountRole_POST_ToAccount.java

명령:

```bash
java -classpath .:* -DaccountId=1234 AccountRole_POST_ToAccount
```

부호:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/java/AccountRole_POST_ToAccount.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## 사용자를 계정 역할에 연결

사용자를 특정 계정 역할과 연결할 수 있습니다. `1234` 계정 ID로 바꿉니다. `5678` 계정 역할의 ID로 바꿉니다. `9012` 계정 사용자 ID로 바꿉니다.

### AccountRole_POST_UserAssociation.sh

명령:

```bash
./AccountRole_POST_UserAssociation.sh 1234 5678 9012
```

부호:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/curl/AccountRole_POST_UserAssociation.sh
   :language: bash
```

### AccountRole_POST_UserAssociation.java

명령:

```bash
java -classpath .:* -DaccountId=1234 -DaccountRoleId=5678 -DuserAccountId=9012 AccountRole_POST_UserAssociation
```

부호:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/java/AccountRole_POST_UserAssociation.java
   :dedent: 1
   :language: java
   :lines: 9-19
```

## 계정에서 계정 역할 가져오기

다음 cURL 또는 Java 명령을 실행하여 계정의 계정 역할을 나열할 수 있습니다. `1234` 계정 ID로 바꿉니다.

### AccountRoles_GET_FromAccount.sh

명령:

```bash
./AccountRoles_GET_FromAccount.sh 1234
```

부호:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/curl/AccountRoles_GET_FromAccount.sh
   :language: bash
```

### AccountRoles_GET_FromAccount.java

명령:

```bash
java -classpath .:* -DaccountId=1234 AccountRoles_GET_FromAccount
```

부호:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/java/AccountRoles_GET_FromAccount.java
   :dedent: 1
   :language: java
   :lines: 11-23
```

계정의 `AccountRole` 개체가 JSON에 나타납니다.

## 계정 역할 사용자 연결 제거

특정 계정 사용자에서 계정 역할 연결을 제거합니다. `1234` 계정 ID로 바꿉니다. `5678` 계정 역할의 ID로 바꿉니다. `9012` 계정 사용자 ID로 바꿉니다.

### AccountRole_DELETE_UserAssociation.sh

명령:

```bash
./AccountRole_DELETE_UserAssociation.sh 1234 5678 9012
```

부호:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/curl/AccountRole_DELETE_UserAssociation.sh
   :language: bash
```

### AccountRole_DELETE_UserAssociation.java

명령

```bash
java -classpath .:* -DaccountId=1234 -DaccountRoleId=5678 -DuserAccountId=9012 AccountRole_DELETE_UserAssociation
```

부호:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/java/AccountRole_DELETE_UserAssociation.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

[API 탐색기](../../headless-delivery/consuming-apis/consuming-rest-services.md) `계정` 서비스 및 스키마를 모두 표시하고 각 서비스를 시도할 수 있는 인터페이스가 있습니다.
