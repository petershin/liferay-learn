# 선택 목록 API 기본 사항

Liferay는 선택 목록 정의(`ListTypeDefinition`)와 해당 항목(`ListTypeEntry`)을 생성하고 관리하기 위한 [`headless-admin-list-types`](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-admin-list-type/v1.0/openapi.json) REST API를 제공합니다. REST 서비스 메뉴 아래 `[server]:[port]/o/api`(예: `localhost:8080/o/api`)에 있는 Liferay의 API 탐색기에서 사용 가능한 API를 보고 테스트할 수 있습니다.

![Access picklist APIs under headless-admin-list-type](./picklists-api-basics/images/01.png)

[`headless-admin-list-types`](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-admin-list-type/v1.0/openapi.json) 서비스를 통해 선택 목록을 생성하고 관리할 수 있습니다.

## 선택 목록 추가

```{include} /_snippets/run-liferay-dxp.md
```

다음으로 샘플 코드를 준비합니다.

1. [Picklists API 기본 사항](./liferay-v3n6.zip) 을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/picklists/liferay-v3n6.zip -O
   ```

   ```bash
   unzip liferay-v3n6.zip
   ```

1. cURL 스크립트를 사용하여 인스턴스에 새 선택 목록을 추가합니다. 명령줄에서 `curl` 폴더로 이동합니다. `ListTypeDefinition_POST_ToInstance.sh` 스크립트를 실행합니다.

   ```bash
   ./ListTypeDefinition_POST_ToInstance.sh
   ```

   JSON 응답은 새로운 선택 목록이 추가되었음을 보여줍니다.

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

1. **글로벌 메뉴** &rarr; **제어판** &rarr; **선택 목록** 으로 이동합니다. 새 선택 목록이 나타납니다.

   ![See that a new picklist has been added.](./picklists-api-basics/images/02.png)

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

| 인수                                                                              | 묘사                       |
| :------------------------------------------------------------------------------ | :----------------------- |
| `-H "Content-Type: application/json"`                                           | 요청 본문 형식이 JSON임을 나타냅니다.  |
| `-X POST`                                                                       | 지정된 엔드포인트에서 호출할 HTTP 메서드 |
| `"http://localhost:8080/o/headless-admin-list-type/v1.0/list-type-definitions"` | REST 서비스 엔드포인트           |
| `-d "{"name": "Foo", "name_i18n": {"en_US": "Foo"}}"`                 | 귀하가 게시를 요청하는 데이터         |
| `-u "test@liferay.com:learn"`                                                   | 기본 인증 자격 증명              |

```{note}
여기서는 데모 목적으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth2](../../../headless-delivery/using-oauth2.md)를 통해 사용자에게 권한을 부여해야 합니다.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검사

`ListTypeDefinition_POST_ToInstance.java` 클래스는 `ListType` 관련 서비스를 호출하여 선택 목록을 추가합니다.

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/java/ListTypeDefinition_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 11-30
```

이 클래스는 세 줄의 코드를 사용하여 REST 서비스를 호출합니다.

| 라인(약어)                                                                                                    | 묘사                                                                            |
| :-------------------------------------------------------------------------------------------------------- | :---------------------------------------------------------------------------- |
| `ListTypeDefinitionResource.Builder builder = ...`                                                        | `ListTypeDefinitionResource` 서비스 인스턴스를 생성하기 위한 `Builder`를 가져옵니다.              |
| `ListTypeDefinitionResource listTypeDefinitionResource = builder.authentication(...).build();`            | 기본 인증을 지정하고 `ListTypeDefinitionResource` 서비스 인스턴스를 생성합니다.                     |
| `ListTypeDefinition listTypeDefinitionResource = listTypeDefinitionResource.postListTypeDefinition(...);` | `listTypeDefinitionResource.postListTypeDefinition` 메소드를 호출하고 데이터를 게시에 전달합니다. |

프로젝트에는 `com.liferay.headless.admin.list.type.client` 파일이 종속성으로 포함되어 있습니다. 설치된 API 탐색기의 `/o/api`(예: http://localhost:8080/o/api)에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
The `main` method's comment demonstrates running the class.
```

다른 Java 클래스도 마찬가지로 다른 `ListTypeDefinitionResource` 메소드를 호출합니다.

```{important}
서비스 세부정보는 [ListTypeDefinitionResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-list-type/headless-admin-list-type-client/src/main/java/com/liferay/headless/admin/list/type/client/resource/v1_0/ListTypeDefinitionResource.java) 를 참조하세요.
```

다음은 cURL 및 Java를 사용하여 다른 `ListTypeDefinition` REST 서비스를 호출하는 예입니다.

## 인스턴스에서 선택 목록 가져오기

다음 cURL 또는 Java 명령을 실행하여 선택 목록을 나열할 수 있습니다.

### ListTypeDefinitions_GET_FromInstance.sh

명령:

```bash
./ListTypeDefinitions_GET_FromInstance.sh
```

부호:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/curl/ListTypeDefinitions_GET_FromInstance.sh
   :language: bash
```

### ListTypeDefinitions_GET_FromInstance.java

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

인스턴스의 `Picklist` 객체가 JSON에 표시됩니다.

## 선택 목록 받기

다음 cURL 또는 Java 명령을 사용하여 특정 선택 목록을 가져옵니다.

```{tip}
Use ``ListTypeDefinitions_GET_FromInstance.[java|sh]`` to get instance ``Picklist`` IDs.
```

### ListTypeDefinition_GET_ById.sh

명령:

```bash
./ListTypeDefinition_GET_ById.sh 1234
```

부호:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/curl/ListTypeDefinition_GET_ById.sh
   :language: bash
```

### ListTypeDefinition_GET_ById.java

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

'선택 목록' 필드는 JSON에 표시됩니다.

## 선택 목록 패치

cURL 및 Java 패치 명령을 사용하여 기존 선택 목록을 편집합니다. '1234'를 선택 목록의 ID로 바꾸세요.

### ListTypeDefinition_PATCH_ById.sh

명령:

```bash
./ListTypeDefinition_PATCH_ById.sh 1234
```

부호:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/curl/ListTypeDefinition_PATCH_ById.sh
   :language: bash
```

### ListTypeDefinition_PATCH_ById.java

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

cURL 및 Java `put` 명령을 사용하여 기존 선택 목록을 완전히 덮어씁니다. '1234'를 선택 목록의 ID로 바꾸세요.

### ListTypeDefinition_PUT_ById.sh

명령:

```bash
./ListTypeDefinition_PUT_ById.sh 1234
```

부호:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/curl/ListTypeDefinition_PUT_ById.sh
   :language: bash
```

### ListTypeDefinition_PUT_ById.java

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

cURL 및 Java `delete` 명령을 사용하여 기존 선택 목록을 삭제합니다. '1234'를 선택 목록의 ID로 바꾸세요.

### ListTypeDefinition_DELETE_ById.sh

명령:

```bash
./Picklist_DELETE_ById.sh 1234
```

부호:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/curl/ListTypeDefinition_DELETE_ById.sh
   :language: bash
```

### ListTypeDefinition_DELETE_ById.java

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

## 선택 목록 항목 서비스

선택 목록을 생성한 후 아래 서비스를 이용하여 선택 목록 항목을 생성하고 관리하세요. `ListTypeEntry`에 대한 cURL 명령과 Java 클래스는 `ListTypeDefinition`처럼 작동합니다. 일부 서비스에서는 선택 목록 ID를 전달해야 합니다.

| 파일                                                       | 묘사                          |
| :------------------------------------------------------- | :-------------------------- |
| `ListTypeEntries_GET_FromListTypeDefinition.[java|sh]` | 선택 목록에서 선택 목록 항목 목록을 가져옵니다. |
| `ListTypeEntry_DELETE_ById.[java|sh]`                  | 선택 목록 항목을 삭제합니다.            |
| `ListTypeEntry_GET_ById[java|sh]`                      | ID별로 특정 선택 목록 항목을 가져옵니다.    |
| `ListTypeEntry_POST_ToListTypeDefinition.[java|sh]`    | 선택 목록에 항목을 게시합니다.           |
| `ListTypeEntry_PUT_ById.[java|sh]`                     | 선택 목록 항목을 넣습니다.             |

[API 탐색기](../../../headless-delivery/consuming-apis/consuming-rest-services.md)에는 모든 'ListTypeDefinition' 및 'ListTypeEntry' 서비스와 스키마가 표시되며 각각을 테스트할 수 있는 인터페이스가 있습니다. 서비스.

## 관련 주제

* [선택 목록 생성](./creating-picklists.md)
* [선택 목록 내보내기 및 가져오기](./exporting-and-importing-picklists.md)
