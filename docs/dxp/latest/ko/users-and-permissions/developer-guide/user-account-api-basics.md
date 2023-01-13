# 사용자 계정 API 기본 사항

제어판에서 [사용자를 추가하고 관리할 수 있지만](../users/adding-and-managing-users.md) 의 REST API를 사용할 수도 있습니다. 이러한 서비스를 호출하여 사용자를 추가, 편집, 삭제할 수 있습니다.

새 사용자를 추가하는 것으로 시작하십시오.

## 사용자 추가
```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps:

1. Download and unzip [User Account API Basics](./liferay-y6q4.zip).

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-y6q4.zip -O
   ```

   ```bash
   unzip liferay-y6q4.zip
   ```

1. cURL 스크립트를 사용하여 Liferay 인스턴스에 새 사용자를 추가하십시오. 명령줄에서 `curl` 폴더로 이동합니다. `User_POST_ToInstance.sh` 스크립트를 실행합니다.

    ```bash
    ./User_POST_ToInstance.sh
    ```

    JSON 응답은 새 사용자가 추가되었음을 보여줍니다.

    ```bash
    {
        "additionalName" : "",
        "alternateName" : "able",
        "birthDate" : "1977-01-01T00:00:00Z",
        "customFields" : [ ],
        "dashboardURL" : "",
        "dateCreated" : "2021-05-19T16:04:46Z",
        "dateModified" : "2021-05-19T16:04:46Z",
        "emailAddress" : "able@liferay.com",
        "familyName" : "Foo",
        "givenName" : "Able",
        "id" : 39321,
        "jobTitle" : "",
        "keywords" : [ ],
        "name" : "Able Foo",
        "organizationBriefs" : [ ],
        "profileURL" : "",
        "roleBriefs" : [ {
            "id" : 20113,
            "name" : "User"
        } ],
        "siteBriefs" : [ {
            "id" : 20127,
            "name" : "Global"
        }, {
            "id" : 20125,
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
    }%   
    ```

    제어판에서 새로 추가된 사용자를 확인합니다. 나중 명령을 위해 사용자의 `id` 번호를 기록하십시오.

    ![제어판에서 추가된 사용자를 확인하십시오.](./user-account-api-basics/images/01.png)

1. REST 서비스는 Java 클래스로 호출할 수도 있습니다. `curl` 폴더에서 `java` 폴더로 이동합니다. 다음 명령을 사용하여 소스 파일을 컴파일합니다.

    ```bash
    javac -classpath .:* *.java
    ```

1. 다음 명령을 사용하여 `User_POST_ToInstance` 클래스를 실행합니다.

    ```bash
    java -classpath .:* User_POST_ToInstance
    ```

    제어판에서 다른 사용자가 추가되었는지 확인하십시오.

    ![제어판에서 다른 사용자가 추가되었습니다.](user-account-api-basics/images/02.png)

cURL 명령과 Java 클래스의 작동 방식을 보려면 계속 읽으십시오.

## cURL 명령 검사

`User_POST_ToInstance.sh` 스크립트는 cURL 명령으로 REST 서비스를 호출합니다.

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/curl/User_POST_ToInstance.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                                                                                             | 묘사                      |
|:---------------------------------------------------------------------------------------------------------------------------------------------- |:----------------------- |
| `-H "Content-Type: application/json"`                                                                                                          | 요청 본문 형식이 JSON임을 나타냅니다. |
| `-X POST`                                                                                                                                      | 지정된 끝점에서 호출할 HTTP 메서드   |
| `"http://localhost:8080/o/headless-admin-user/v1.0/user-accounts"`                                                                             | REST 서비스 끝점             |
| `-d "{\"alternateName\": \"Able\", \"emailAddress\": \"able@liferay.com\", \"familyName\": \"Foo\", \"givenName\": \"Able\"}"` | 게시를 요청하는 데이터            |
| `-u "test@liferay.com:learn"`                                                                                                                  | 기본 인증 자격 증명             |

```{note}
여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth2](../../headless-delivery/using-oauth2/using-oauth2.md)을 통해 사용자에게 권한을 부여해야 합니다. OAuth2를 사용하는 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증하기](../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md)를 참조하세요.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검토

`User_POST_ToInstance.java` 클래스는 사용자 관련 서비스를 호출하여 사용자를 추가합니다.

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/java/User_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-27
```

이 클래스는 단 세 줄의 코드로 REST 서비스를 호출합니다.

| 라인(약칭)                                                                          | 묘사                                                               |
|:------------------------------------------------------------------------------- |:---------------------------------------------------------------- |
| `UserAccountResource.Builder builder = ...`                                     | `UserAccountResource` 서비스 인스턴스를 생성하기 위한 `빌더` 을 가져옵니다.            |
| `UserAccountResource userAccountResource = builder.authentication(...).build()` | 기본 인증을 지정하고 `UserAccountResources` 서비스 인스턴스를 생성합니다.              |
| `UserAccount userAccount = userAccountResource.postUserAccount(...)`            | `userAccountResource.postUserAccount` 메서드를 호출하고 데이터를 게시물에 전달합니다. |

프로젝트에는 `com.liferay.headless.admin.user.client.jar` 파일이 종속성으로 포함되어 있습니다. `/o/api`에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메서드의 주석은 클래스 실행을 보여줍니다.
```

다른 예제 Java 클래스는 이것과 유사하지만 다른 `UserAccountResource` 메소드를 호출합니다.

```{important}
[UserAccountResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-user/headless-admin-user-client/src/main/java/com 참조) /liferay/headless/admin/user/client/resource/v1_0/UserAccountResource.java)를 참조하십시오.
```

다음은 cURL 및 Java를 사용하여 다른 사용자 REST 서비스를 호출하는 예입니다.

## 인스턴스 사용자 가져오기

다음 cURL 및 Java 명령을 사용하여 모든 사용자 목록을 가져옵니다.

### Users_GET_FromInstance.sh

명령:

```bash
./Users_GET_FromInstance.sh
```

부호:

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/curl/Users_GET_FromInstance.sh
   :language: bash
```

### Users_GET_FromInstance.java

명령:

```bash 
java -classpath .:* Users_GET_FromInstance
```

부호:

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/java/Users_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

인스턴스의 모든 사용자가 JSON 응답에 나열됩니다.

## 사용자 확보

다음 cURL 및 Java 명령을 사용하여 특정 사용자를 가져옵니다. `1234` 을 사용자 ID로 바꾸십시오.

### User_GET_ById.sh

명령:

```bash
./User_GET_ById.sh 1234
```

부호:

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/curl/User_GET_ById.sh
   :language: bash
```

### User_GET_ById.java

명령:

```bash 
java -classpath .:* -DuserId=1234 User_GET_ById
```

부호:

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/java/User_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

사용자는 JSON 응답으로 반환됩니다.

## 사용자 패치

다음 cURL 및 Java 명령을 사용하여 기존 사용자의 부분 편집을 수행하십시오. `1234` 을 사용자 ID로 바꾸십시오.

### User_PATCH_ById.sh

명령:

```bash
./User_PATCH_ById.sh 1234
```

부호:

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/curl/User_PATCH_ById.sh
   :language: bash
```

### User_PATCH_ById.java

명령:

```bash 
java -classpath .:* -DuserId=1234 User_PATCH_ById
```

부호:

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/java/User_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

예에서 Able과 Baker의 성이 이제 Foo에서 Bar로 변경되었습니다.

## 사용자 넣기

다음 cURL 및 Java 명령을 사용하여 기존 사용자를 완전히 덮어씁니다. `1234` 을 사용자 ID로 바꾸십시오.

### User_PUT_ById.sh

명령:

```bash
./User_PUT_ById.sh 1234
```

부호:

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/curl/User_PUT_ById.sh
   :language: bash
```

### User_PUT_ById.java

명령:

```bash 
java -classpath .:* -DuserId=1234 User_PUT_ById
```

부호:

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/java/User_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-28
```

예에서 이전 데이터는 이제 Able Goo 및 Baker Goo로 대체되었습니다.

![이전 사용자 데이터는 패치 서비스로 대체되었습니다.](./user-account-api-basics/images/03.png)

## 사용자 삭제

다음 cURL 및 Java 명령을 사용하여 기존 사용자를 삭제합니다. `1234` 을 사용자 ID로 바꾸십시오.

### User_DELETE_ById.sh

명령:

```bash
./User_DELETE_ById.sh 1234
```

부호:

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/curl/User_DELETE_ById.sh
   :language: bash
```

### User_DELETE_ById.java

명령:

```bash 
java -classpath .:* -DuserId=1234 User_DELETE_ById
```

부호:

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/java/User_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

이제 사용자 Able Goo 및 Baker Goo가 삭제되었습니다.

## 추가 정보

[API 탐색기](../../headless-delivery/consuming-apis/consuming-rest-services.md) 을 확인하여 모든 사용자 관련 REST 서비스 목록을 확인하십시오.
