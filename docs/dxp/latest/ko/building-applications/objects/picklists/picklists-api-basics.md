# 선택 목록 API 기본 사항

애플리케이션 메뉴 또는 REST API를 사용하여 [선택 목록 생성 및 관리](./using-picklists.md) 을 수행할 수 있습니다. [`headless-admin-list-types`](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-admin-list-type/v1.0/openapi.json) 서비스를 호출하여 선택 목록을 만들고 관리합니다.

## 선택 목록 추가

```{include} /_snippets/run-liferay-dxp.md
```

Liferay가 실행되면,

1. [Picklists API 기본 사항](./liferay-v3n6.zip) 을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/building-applications/objects/picklists/liferay-v3n6.zip -O
   ```

   ```bash
   unzip liferay-v3n6.zip
   ```

1. cURL 스크립트를 사용하여 인스턴스에 새 선택 목록을 추가합니다. 명령줄에서 `curl` 폴더로 이동합니다. `ListTypeDefinition_POST_ToInstance.sh` 스크립트를 실행합니다.

   ```bash
   ./ListTypeDefinition_POST_ToInstance.sh
   ```

   JSON 응답은 새 선택 목록이 추가되었음을 보여줍니다.

   ```json
   "dateCreated" : "2022-11-17T18:42:13Z",
   "dateModified" : "2022-11-17T18:42:13Z",
   "id" : 47502,
   "listTypeEntries" : [ ],
   "name" : "Foo",
   "name_i18n" : {
      "en-US" : "Foo"
   }
   ```

1. **전역 메뉴** &rarr; **제어판** &rarr; **선택 목록** 로 이동합니다. 새 선택 목록이 나타납니다.

   ![새 선택 목록이 추가되었는지 확인합니다.](./picklists-api-basics/images/01.png)

1. 또는 Java 클라이언트를 사용하여 REST 서비스를 호출할 수 있습니다. `java` 폴더로 이동하여 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. `ListTypeDefinition_POST_ToInstance.java` 클래스를 실행합니다.

   ```bash
   java -classpath .:* ListTypeDefinition_POST_ToInstance
   ```

## cURL 명령 검사

`ListTypeDefinition_POST_ToInstance.sh` 스크립트는 cURL을 사용하여 REST 서비스를 호출합니다.

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/curl/ListTypeDefinition_POST_ToInstance.sh
   :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                              | 묘사                      |
|:------------------------------------------------------------------------------- |:----------------------- |
| `-H "Content-Type: application/json"`                                           | 요청 본문 형식이 JSON임을 나타냅니다. |
| `-X POST`                                                                       | 지정된 끝점에서 호출할 HTTP 메서드   |
| `"http://localhost:8080/o/headless-admin-list-type/v1.0/list-type-definitions"` | REST 서비스 끝점             |
| `-d "{\"name\": \"Foo\", \"name_i18n\": {\"en_US\": \"Foo\"}}"`       | 게시를 요청하는 데이터            |
| `-u "test@liferay.com:learn"`                                                   | 기본 인증 자격 증명             |

```{note}
여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth2](../../../headless-delivery/using-oauth2.md)을 통해 사용자를 인증해야 합니다.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검토

`ListTypeDefinition_POST_ToInstance.java` 클래스는 `ListType`관련 서비스를 호출하여 선택 목록을 추가합니다.

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/java/ListTypeDefinition_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 11-30
```

이 클래스는 세 줄의 코드를 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                                                                    | 묘사                                                                            |
|:--------------------------------------------------------------------------------------------------------- |:----------------------------------------------------------------------------- |
| `ListTypeDefinitionResource.Builder builder = ...`                                                        | `ListTypeDefinitionResource` 서비스 인스턴스를 생성하기 위한 `빌더` 을 가져옵니다.                  |
| `ListTypeDefinitionResource listTypeDefinitionResource = builder.authentication(...).build();`            | 기본 인증을 지정하고 `ListTypeDefinitionResource` 서비스 인스턴스를 생성합니다.                     |
| `ListTypeDefinition listTypeDefinitionResource = listTypeDefinitionResource.postListTypeDefinition(...);` | `listTypeDefinitionResource.postListTypeDefinition` 메서드를 호출하고 데이터를 게시에 전달합니다. |

프로젝트에는 `com.liferay.headless.admin.list.type.client` 파일이 종속성으로 포함되어 있습니다. 설치 API 탐색기의 `/o/api` (예: <http://localhost:8080/o/api>)에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메서드의 주석은 클래스 실행을 보여줍니다.
```

다른 Java 클래스는 유사하게 다른 `ListTypeDefinitionResource` 메서드를 호출합니다.

```{important}
[ListTypeDefinitionResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-list-type/headless-admin-list-type-client/src/main 참조) /java/com/liferay/headless/admin/list/type/client/resource/v1_0/ListTypeDefinitionResource.java)를 참조하십시오.
```

다음은 cURL 및 Java를 사용하여 다른 `ListTypeDefinition` REST 서비스를 호출하는 예입니다.

## 인스턴스에서 선택 목록 가져오기

다음 cURL 또는 Java 명령을 실행하여 선택 목록을 나열할 수 있습니다.

### ListTypeDefinitions **GET** FromInstance.sh

명령:

```bash
./ListTypeDefinitions_GET_FromInstance.sh
```

부호:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/curl/ListTypeDefinitions_GET_FromInstance.sh
   :language: bash
```

### ListTypeDefinitions **GET** FromInstance.java

명령:

```bash
java -classpath .:* ListTypeDefinitions_GET_FromInstance
```

부호:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/java/ListTypeDefinitions_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-25
```

인스턴스의 `Picklist` 개체가 JSON에 나타납니다.

## 선택 목록 가져오기

다음 cURL 또는 Java 명령을 사용하여 특정 선택 목록을 가져옵니다.

```{tip}
``ListTypeDefinitions_GET_FromInstance.[java|sh]``를 사용하여 인스턴스 ``Picklist`` ID를 가져옵니다.
```

### ListTypeDefinition **GET** ById.sh

명령:

```bash
./ListTypeDefinition_GET_ById.sh 1234
```

부호:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/curl/ListTypeDefinition_GET_ById.sh
   :language: bash
```

### ListTypeDefinition **GET** ById.java

명령:

```bash
java -classpath .:* -DlistTypeDefinitionId=1234 ListTypeDefinition_GET_ById
```

부호:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/java/ListTypeDefinition_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-20
```

`선택 목록` 필드가 JSON에 나타납니다.

## 선택 목록 패치

cURL 및 Java 패치 명령을 사용하여 기존 선택 목록을 편집합니다. `1234` 을 선택 목록의 ID로 바꿉니다.

### ListTypeDefinition **PATCH** ById.sh

명령:

```bash
./ListTypeDefinition_PATCH_ById.sh 1234
```

부호:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/curl/ListTypeDefinition_PATCH_ById.sh
   :language: bash
```

### ListTypeDefinition **PATCH** ById.java

명령:

```bash
java -classpath .:* -DlistTypeDefinitionId=1234 ListTypeDefinition_PATCH_ById
```

부호:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/java/ListTypeDefinition_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 11-31
```

## 선택 목록 넣기

cURL 및 Java `put` 명령으로 기존 선택 목록을 완전히 덮어씁니다. `1234` 을 선택 목록의 ID로 바꿉니다.

### ListTypeDefinition **PUT** ById.sh

명령:

```bash
./ListTypeDefinition_PUT_ById.sh 1234
```

부호:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/curl/ListTypeDefinition_PUT_ById.sh
   :language: bash
```

### ListTypeDefinition **PUT** ById.java

명령:

```bash
java -classpath .:* -DlistTypeDefinitionId=1234 ListTypeDefinition_PUT_ById
```

부호:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/java/ListTypeDefinition_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 11-31
```

## 선택 목록 삭제

cURL 및 Java `delete` 명령을 사용하여 기존 선택 목록을 삭제합니다. `1234` 을 선택 목록의 ID로 바꿉니다.

### ListTypeDefinition **DELETE** ById.sh

명령:

```bash
./Picklist_DELETE_ById.sh 1234
```

부호:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/curl/ListTypeDefinition_DELETE_ById.sh
   :language: bash
```

### ListTypeDefinition **DELETE** ById.java

명령

```bash
java -classpath .:* -DlistTypeDefinitionId=1234 ListTypeDefinition_DELETE_ById
```

부호:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/java/ListTypeDefinition_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## 선택 목록 입력 서비스

선택 목록을 만든 후 아래 서비스를 사용하여 선택 목록 항목을 만들고 관리합니다. `ListTypeEntry` 에 대한 cURL 명령 및 Java 클래스는 `ListTypeDefinition`처럼 작동합니다. 일부 서비스는 선택 목록 ID를 전달해야 합니다.

| 파일                                                       | 묘사                          |
|:-------------------------------------------------------- |:--------------------------- |
| `ListTypeEntries_GET_FromListTypeDefinition.[java\|sh]` | 선택 목록에서 선택 목록 항목 목록을 가져옵니다. |
| `ListTypeEntry_DELETE_ById.[java\|sh]`                  | 선택 목록 항목을 삭제합니다.            |
| `ListTypeEntry_GET_ById[java\|sh]`                      | ID별로 특정 선택 목록 항목을 가져옵니다.    |
| `ListTypeEntry_POST_ToListTypeDefinition.[java\|sh]`    | 선택 목록에 항목을 게시합니다.           |
| `ListTypeEntry_PUT_ById.[java\|sh]`                     | 선택 목록 항목을 넣습니다.             |

[API 탐색기](../../../headless-delivery/consuming-apis/consuming-rest-services.md) 은 `ListTypeDefinition` 및 `ListTypeEntry` 서비스 및 스키마를 모두 표시하고 각 서비스를 테스트할 수 있는 인터페이스가 있습니다.
