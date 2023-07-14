# 역할 API 기본 사항

애플리케이션 메뉴에서 [역할 생성 및 관리](../roles-and-permissions/creating-and-managing-roles.md) 를 수행할 수 있지만 Liferay의 REST API를 사용할 수도 있습니다. 이러한 서비스를 호출하여 역할을 관리하십시오.

## 사용자를 일반 역할에 연결

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르십시오.

1. [역할 API 기본 사항](./liferay-z3v5.zip) 을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-z3v5.zip -O
   ```

   ```bash
   unzip liferay-z3v5.zip
   ```

1. [Users_GET_FromInstance](./user-account-api-basics.md#get-instance-users) 을 사용하여 사용자 ID 목록을 가져옵니다. 일반 역할과 연결하려는 사용자 ID를 기록해 둡니다.

1. [Roles_GET_FromInstance](#get-roles-from-instance) 사용하여 모든 역할 ID 목록을 가져옵니다. 연결하려는 역할 ID `인 roleType: regular`기록해 둡니다. 예를 들어 Analytics 관리자 일반 역할 유형입니다.

1. cURL 스크립트를 사용하여 사용자를 일반 역할에 연결합니다. 명령줄에서 `curl` 폴더로 이동합니다. `RoleUserAssociation_POST_ToInstance.sh` 스크립트를 실행합니다. `1234` 일반 역할의 ID로 바꿉니다. `5678` 사용자 ID로 바꿉니다.

   ```bash
   ./RoleUserAssociation_POST_ToInstance.sh 1234 5678
   ```

1. **전역 메뉴** &rarr; **제어판** &rarr; **역할** 로 이동합니다. 일반 역할 탭에서 사용자를 연결하는 데 사용한 특정 역할을 클릭합니다. **담당자** 탭을 클릭합니다. 사용자가 선택한 역할과 연결되었는지 확인합니다.

   ![사용자가 연결되었는지 확인합니다.](./roles-api-basics/images/01.png)

1. REST 서비스는 Java 클라이언트를 사용하여 호출할 수도 있습니다. `curl` 폴더에서 `java` 폴더로 이동합니다. 다음 명령을 사용하여 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. 다음 명령을 사용하여 `RoleUserAssociation_POST_ToInstance.java` 클래스를 실행합니다.

   ```bash
   java -classpath .:* -DroleId=1234 -DuserAccountId=5678 RoleUserAssociation_POST_ToInstance
   ```

## cURL 명령 검사

`RoleUserAssociation_POST_ToInstance.sh` 스크립트는 cURL 명령으로 REST 서비스를 호출합니다.

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/RoleUserAssociation_POST_ToInstance.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                                            | 묘사                      |
|:--------------------------------------------------------------------------------------------- |:----------------------- |
| `-H "Content-Type: application/json"`                                                         | 요청 본문 형식이 JSON임을 나타냅니다. |
| `-X POST`                                                                                     | 지정된 끝점에서 호출할 HTTP 메서드   |
| `"http://localhost:8080/o/headless-admin-user/v1.0/roles/${1}/association/user-account/${2}"` | REST 서비스 끝점             |
| `-u "test@liferay.com:learn"`                                                                 | 기본 인증 자격 증명             |

```{note}
여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth2](../../headless-delivery/using-oauth2.md)을 통해 사용자를 인증해야 합니다. OAuth2를 사용하는 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증하기](../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md)를 참조하세요.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검토

`RoleUserAssociation_POST_ToInstance.java` 클래스는 역할 관련 서비스를 호출하여 사용자를 일반 역할에 연결했습니다.

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/RoleUserAssociation_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                             | 묘사                                                          |
|:------------------------------------------------------------------ |:----------------------------------------------------------- |
| `RoleResource.Builder builder = ...`                               | `RoleResource` 서비스 인스턴스를 생성하기 위한 `빌더` 가져옵니다.                |
| `RoleResource roleResource = builder.authentication(...).build();` | 기본 인증을 지정하고 `RoleResource` 서비스 인스턴스를 생성합니다.                 |
| `roleResource.postRoleUserAccountAssociation(...);`                | `postRoleUserAccountAssociation` 메서드를 호출하고 데이터를 게시물에 전달합니다. |

프로젝트에는 `com.liferay.headless.admin.user.client.jar` 파일이 종속성으로 포함되어 있습니다. `/o/api`에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메서드의 주석은 클래스 실행을 보여줍니다.
```

다른 예제 Java 클래스는 이것과 유사하지만 다른 `RoleResource` 메서드를 호출합니다.

```{important}
[RoleResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-user/headless-admin-user-client/src/main/java/com 참조) /liferay/headless/admin/user/client/resource/v1_0/AccountResource.java)를 참조하십시오.
```

다음은 cURL 및 Java를 사용하여 다른 `Role` REST 서비스를 호출하는 예입니다.

## 인스턴스에서 역할 가져오기

다음 cURL 또는 Java 명령을 실행하여 역할을 나열할 수 있습니다.

### Roles_GET_FromInstance.sh

명령:

```bash
./Roles_GET_FromInstance.sh
```

부호:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/Roles_GET_FromInstance.sh
   :language: bash
```

### Roles_GET_FromInstance.java

명령:

```bash
java -classpath .:* Roles_GET_FromInstance
```

부호:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/Roles_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-21
```

인스턴스의 `Roles` 개체가 JSON에 나타납니다.

## 역할 얻기

다음 cURL 또는 Java 명령을 사용하여 특정 역할을 가져옵니다.

```{tip}
``Roles_GET_FromInstance.[java|sh]``를 사용하여 인스턴스 ``Role`` ID를 가져옵니다.
```

### Role_GET_ById.sh

명령:

```bash
./Role_GET_ById.sh 1234
```

부호:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/Role_GET_ById.sh
   :language: bash
```

### Role_GET_ById.java

명령:

```bash
java -classpath .:* -DroleId=1234 Role_GET_ById
```

부호:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/Role_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

`개의 역할` 필드가 JSON에 나타납니다.

## 사용자를 사이트 역할에 연결

사용자를 특정 사이트 역할과 연결할 수 있습니다. `1234` 역할의 ID로 바꿉니다. `5678` 사이트 ID로 바꿉니다. `9012` 사용자 ID로 바꾸십시오.

### RoleUserAssociation_POST_ToSite.sh

명령:

```bash
./RoleUserAssociation_POST_ToSite.sh 1234 5678 9012
```

부호:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/RoleUserAssociation_POST_ToSite.sh
   :language: bash
```

### RoleUserAssociation_POST_ToSite.java

명령:

```bash
java -classpath .:* -DroleId=1234 -DsiteId=5678 -DuserAccountId=9012 RoleUserAssociation_POST_ToSite
```

부호:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/RoleUserAssociation_POST_ToSite.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## 사용자를 조직 역할에 연결

사용자를 특정 조직 역할과 연결할 수 있습니다. `1234` 조직의 ID로 바꿉니다. `5678` 역할의 ID로 바꿉니다. `9012` 사용자 ID로 바꾸십시오.

### RoleUserAssociation_POST_ToOrganization.sh

명령:

```bash
./RoleUserAssociation_POST_ToOrganization.sh 1234 5678 9012
```

부호:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/RoleUserAssociation_POST_ToOrganization.sh
   :language: bash
```

### RoleUserAssociation_POST_ToOrganization.java

명령:

```bash
java -classpath .:* -DorganizationId=1234 -DroleId=5678 -DuserAccountId=9012 RoleUserAssociation_POST_ToOrganization
```

부호:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/RoleUserAssociation_POST_ToOrganization.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## 일반 역할 연결 제거

특정 사용자에서 일반 역할 연결을 제거합니다. `1234` 역할의 ID로 바꿉니다. `5678` 사용자 ID로 바꿉니다.

### RoleUserAssociation_DELETE_FromInstance.sh

명령:

```bash
./RoleUserAssociation_DELETE_FromInstance.sh 1234 5678
```

부호:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/RoleUserAssociation_DELETE_FromInstance.sh
   :language: bash
```

### RoleUserAssociation_DELETE_FromInstance.java

명령

```bash
java -classpath .:* -DroleId=1234 -DuserAccountId=5678 RoleUserAssociation_DELETE_FromInstance
```

부호:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/RoleUserAssociation_DELETE_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

## 사이트 역할 연결 제거

특정 사용자로부터 사이트 역할 연결을 제거합니다. `1234` 역할의 ID로 바꿉니다. `5678` 사이트 ID로 바꿉니다. `9012` 사용자 ID로 바꾸십시오.

### RoleUserAssociation_DELETE_FromSite.sh

명령:

```bash
./RoleUserAssociation_DELETE_FromSite.sh 1234 5678 9012
```

부호:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/RoleUserAssociation_DELETE_FromSite.sh
   :language: bash
```

### RoleUserAssociation_DELETE_FromSite.java

명령

```bash
java -classpath .:* -DroleId=1234 -DsiteId=5678 -DuserAccountId=9012 RoleUserAssociation_DELETE_FromSite
```

부호:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/RoleUserAssociation_DELETE_FromSite.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## 조직 역할 연결 제거

특정 사용자로부터 조직 역할 연결을 제거합니다. `1234` 조직의 ID로 바꿉니다. `5678` 역할의 ID로 바꿉니다. `9012` 사용자 ID로 바꾸십시오.

### RoleUserAssociation_DELETE_FromOrganization.sh

명령:

```bash
./RoleUserAssociation_DELETE_FromOrganization.sh 1234 5678 9012
```

부호:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/RoleUserAssociation_DELETE_FromOrganization.sh
   :language: bash
```

### RoleUserAssociation_DELETE_FromOrganization.java

명령

```bash
java -classpath .:* -DorganizationId=1234 -DroleId=5678 -DuserAccountId=9012 RoleUserAssociation_DELETE_FromOrganization
```

부호:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/RoleUserAssociation_DELETE_FromOrganization.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

[API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md) `Role` 서비스 및 스키마를 모두 보여주고 각 서비스를 시험해 볼 수 있는 인터페이스를 가지고 있습니다.
