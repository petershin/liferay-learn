# 사용자 그룹 API 기본 사항

애플리케이션 메뉴에서 [사용자 그룹 생성 및 관리](../user-groups/creating-and-managing-user-groups.md) 를 할 수 있지만 Liferay의 REST API를 사용할 수도 있습니다. 사용자 그룹을 관리하려면 이러한 서비스를 호출하십시오.

## 사용자 그룹 추가
```{include} /_snippets/run-liferay-dxp.md
```

Then follow these steps:

1. Download and unzip [User Groups API Basics](./liferay-y6f2.zip).

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-y6f2.zip -O
   ```

   ```bash
   unzip liferay-y6f2.zip
   ```

1. cURL 스크립트를 사용하여 새 사용자 그룹을 인스턴스에 추가하십시오. 명령줄에서 `curl` 폴더로 이동합니다. `UserGroup_POST_ToInstance.sh` 스크립트를 실행합니다.

   ```bash
   ./UserGroup_POST_ToInstance.sh
   ```

   JSON 응답은 새 사용자 그룹이 추가되었음을 보여줍니다.

   ```bash
   "description" : "",
   "externalReferenceCode" : "72c5739f-a6e9-d4b8-5481-7cf1a427ea79",
   "id" : 43099,
   "name" : "Able",
   "usersCount" : 0

   ```

2. *전역 메뉴* &rarr; *제어판* &rarr; *사용자 그룹*로 이동합니다. 새 사용자 그룹이 추가되었는지 확인합니다.

   ![새 사용자 그룹이 추가되었는지 확인합니다.](./user-groups-api-basics/images/01.png)

3. REST 서비스는 Java 클라이언트를 사용하여 호출할 수도 있습니다. `curl` 폴더에서 `java` 폴더로 이동합니다. 다음 명령을 사용하여 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

4. 다음 명령을 사용하여 `UserGroup_POST_ToInstance.java` 클래스를 실행합니다.

   ```bash
   java -classpath .:* UserGroup_POST_ToInstance
   ```

## cURL 명령 검사

`UserGroup_POST_ToInstance.sh` 스크립트는 cURL 명령으로 REST 서비스를 호출합니다.

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/curl/UserGroup_POST_ToInstance.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                               | 묘사                      |
|:---------------------------------------------------------------- |:----------------------- |
| `-H "Content-Type: application/json"`                            | 요청 본문 형식이 JSON임을 나타냅니다. |
| `-X POST`                                                        | 지정된 끝점에서 호출할 HTTP 메서드   |
| `"http://localhost:8080/o/headless-admin-user/v1.0/user-groups"` | REST 서비스 끝점             |
| `-d "{\"name\": \"Able\"}"`                                  | 게시를 요청하는 데이터            |
| `-u "test@liferay.com:learn"`                                    | 기본 인증 자격 증명             |

```{note}
여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth2](../../headless-delivery/using-oauth2.md)을 통해 사용자를 인증해야 합니다. OAuth2를 사용하는 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증하기](../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md)를 참조하세요.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검토

`UserGroup_POST_ToInstance.java` 클래스는 사용자 그룹 관련 서비스를 호출하여 사용자 그룹을 추가한다.

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/java/UserGroup_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-24
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                                       | 묘사                                                          |
|:---------------------------------------------------------------------------- |:----------------------------------------------------------- |
| `UserGroupResource.Builder builder = ...`                                    | `UserGroupResource` 서비스 인스턴스를 생성하기 위한 `빌더` 을 가져옵니다.         |
| `UserGroupResource userGroupResource = builder.authentication(...).build();` | 기본 인증을 지정하고 `UserGroupResource` 서비스 인스턴스를 생성합니다.            |
| `UserGroup userGroup = userGroupResource.postUserGroup(...);`                | `userGroupResource.postUserGroup` 메서드를 호출하고 데이터를 게시에 전달합니다. |

프로젝트에는 `com.liferay.headless.admin.user.client.jar` 파일이 종속성으로 포함되어 있습니다. `/o/api`에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메서드의 주석은 클래스 실행을 보여줍니다.
```

다른 예제 Java 클래스는 이것과 유사하지만 다른 `UserGroupResource` 메소드를 호출합니다.

```{important}
[UserGroupResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-user-client/src/main/java/com/liferay/headless/admin 참조) /user/client/resource/v1_0/UserGroupResource.java)를 참조하십시오.
```

다음은 cURL 및 Java를 사용하여 다른 `UserGroup` REST 서비스를 호출하는 예입니다.

## 인스턴스에서 사용자 그룹 가져오기

다음 cURL 또는 Java 명령을 실행하여 사용자 그룹을 나열할 수 있습니다.

### UserGroups_GET_FromInstance.sh

명령:

```bash
./UserGroups_GET_FromInstance.sh
```

부호:

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/curl/UserGroups_GET_FromInstance.sh
   :language: bash
```

### UserGroups_GET_FromInstance.java

명령:

```bash
java -classpath .:* UserGroups_GET_FromInstance
```

부호:

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/java/UserGroups_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

인스턴스의 `UserGroup` 개체가 JSON에 나타납니다.

## 사용자 그룹 가져오기

다음 cURL 또는 Java 명령을 사용하여 특정 사용자 그룹을 가져옵니다.

```{tip}
``UserGroups_GET_FromInstance.[java|sh]``를 사용하여 인스턴스 ``User Group`` ID를 가져옵니다.
```

### UserGroup_GET_ById.sh

명령:

```bash
./UserGroup_GET_ById.sh 1234
```

부호:

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/curl/UserGroup_GET_ById.sh
   :language: bash
```

### UserGroup_GET_ById.java

명령:

```bash
java -classpath .:* -DuserGroupId=1234 UserGroup_GET_ById
```

부호:

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/java/UserGroup_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`UserGroup` 필드가 JSON에 나타납니다.

## 사용자 그룹 패치

다음 cURL 및 Java 명령을 사용하여 기존 사용자 그룹을 부분적으로 편집합니다. `1234` 을 사용자 그룹의 ID로 바꿉니다.

### UserGroup_PATCH_ById.sh

명령:

```bash
./UserGroup_PATCH_ById.sh 1234
```

부호:

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/curl/UserGroup_PATCH_ById.sh
   :language: bash
```

### UserGroup_PATCH_ById.java

명령:

```bash
java -classpath .:* -DuserGroupId=1234 UserGroup_PATCH_ById
```

부호:

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/java/UserGroup_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## 사용자 그룹 넣기

다음 cURL 및 Java 명령으로 기존 사용자 그룹을 완전히 덮어씁니다. `1234` 을 사용자 그룹의 ID로 바꿉니다.

### UserGroup_PUT_ById.sh

명령:

```bash
./UserGroup_PUT_ById.sh 1234
```

부호:

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/curl/UserGroup_PUT_ById.sh
   :language: bash
```

### UserGroup_PUT_ById.java

명령:

```bash
java -classpath .:* -DuserGroupId=1234 UserGroup_PUT_ById
```

부호:

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/java/UserGroup_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## 사용자 그룹 삭제

다음 cURL 및 Java 명령을 사용하여 기존 사용자 그룹을 삭제합니다. `1234` 을 사용자 그룹의 ID로 바꿉니다.

### UserGroup_DELETE_ById.sh

명령:

```bash
./UserGroup_DELETE_ById.sh 1234
```

부호:

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/curl/UserGroup_DELETE_ById.sh
   :language: bash
```

### UserGroup_DELETE_ById.java

명령

```bash
java -classpath .:* -DuserGroupId=1234 UserGroup_DELETE_ById
```

부호:

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/java/UserGroup_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[API 탐색기](../../headless-delivery/consuming-apis/consuming-rest-services.md) 은 `UserGroup` 서비스 및 스키마를 모두 표시하고 각 서비스를 시도할 수 있는 인터페이스가 있습니다.
