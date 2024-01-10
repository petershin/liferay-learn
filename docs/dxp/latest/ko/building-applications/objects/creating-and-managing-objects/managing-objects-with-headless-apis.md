# 헤드리스 API로 객체 관리

{bdg-secondary}`liferay 7.4+`

애플리케이션 메뉴에서 객체를 생성하고 관리할 [있지만](../creating-and-managing-objects.md) Liferay의 REST API를 사용할 수도 있습니다. 객체를 생성하고 관리하려면 이러한 서비스를 호출하세요. Liferay의 코드베이스에서는 객체를 **객체 정의** 라고 합니다. 각 개체 정의는 다양한 개체 필드로 구성됩니다.

## 개체 정의 및 개체 필드 추가

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르세요.

1. 제공된 샘플 코드를 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/creating-and-managing-objects/liferay-r4g6.zip -O
   ```

   ```bash
   unzip liferay-r4g6.zip
   ```

1. cURL 스크립트를 사용하여 인스턴스에 새 객체 정의를 추가합니다. 명령줄에서 `curl` 폴더로 이동합니다. `ObjectDefinition_POST_ToInstance.sh` 스크립트를 실행합니다.

   ```bash
   ./ObjectDefinition_POST_ToInstance.sh
   ```

   JSON 응답은 새로운 객체 정의가 추가되었음을 보여줍니다.

   ```json
   "active" : false,
   "dateCreated" : "2023-05-31T16:51:18Z",
   "dateModified" : "2023-05-31T16:51:18Z",
   "defaultLanguageId" : "en_US",
   "enableCategorization" : true,
   "enableComments" : false,
   "enableObjectEntryHistory" : false,
   "externalReferenceCode" : "4574eea8-03e9-d4c6-b9f9-23368b94350c",
   "id" : 44525,
   "label" : {
     "en_US" : "Foo"
   },
   "name" : "Foo",
   "objectActions" : [ ],
   ...
   "pluralLabel" : {
     "en_US" : "Foos"
   },
   "portlet" : false,
   "restContextPath" : "/o/c/foos",
   "scope" : "company",
   "status" : {
      "code" : 2,
      "label" : "draft",
      "label_i18n" : "Draft"
   },
   "system" : false,
   "titleObjectFieldName" : "id"
   ```

1. **글로벌 메뉴** &rarr; **응용 프로그램** &rarr; **개체** 로 이동합니다. 새로운 객체가 추가되었는지 확인하세요.

   ![See that a new object definition has been added.](./managing-objects-with-headless-apis/images/01.png)

**Foo** 개체를 클릭하세요. 개체의 ID 번호를 기록해 두십시오.

1. cURL 스크립트를 사용하여 개체 정의에 새 개체 필드를 추가합니다. 명령줄에서 `ObjectField_POST_ToObjectDefinition.sh` 스크립트를 실행합니다. 1234를 개체 ID로 바꿉니다.

   ```bash
   ./ObjectField_POST_ToObjectDefinition.sh 1234
   ```

1. Liferay에서 **Foo** 개체를 다시 클릭합니다. **필드** 탭을 클릭하세요. 새로운 Able 필드가 추가되었습니다.

   ![See that a new object field has been added.](./managing-objects-with-headless-apis/images/02.png)

1. REST 서비스는 Java 클라이언트를 사용하여 호출할 수도 있습니다. `curl` 폴더에서 `java` 폴더로 이동합니다. 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. `ObjectDefinition_POST_ToInstance.java` 클래스를 실행합니다.

   ```bash
   java -classpath .:* ObjectDefinition_POST_ToInstance
   ```

1. **Foo** 객체의 ID 번호를 기록해 두세요. 그런 다음 `ObjectField_POST_ToObjectDefinition.java` 클래스를 실행하세요. 1234를 개체 ID로 바꿉니다.

   ```bash
   java -classpath .:* -DobjectDefinitionId=1234 ObjectField_POST_ToObjectDefinition
   ```

새로 생성된 개체는 아직 초안 상태입니다. 게시하기 전에 필요한 사항을 변경하거나 수정하세요. 개체가 게시되면 편집이 비활성화됩니다. 자세한 내용은 게시 객체 초안 [객체 초안 게시](../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) 참조하세요.

## cURL 명령 검사

`ObjectDefinition_POST_ToInstance.sh` 스크립트는 cURL 명령을 사용하여 REST 서비스를 호출합니다.

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/curl/ObjectDefinition_POST_ToInstance.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                                                                          | 묘사                       |
| :-------------------------------------------------------------------------------------------------------------------------- | :----------------------- |
| `-H "Content-Type: application/json"`                                                                                       | JSON의 요청 본문 형식을 정의합니다.   |
| `-X POST`                                                                                                                   | 지정된 엔드포인트에서 호출할 HTTP 메서드 |
| `"http://localhost:8080/o/object-admin/v1.0/object-definitions"`                                                            | REST 서비스 엔드포인트           |
| `-d "{\"label\": {\"en_US\": \"Foo\"}, \"name\": \"Foo\", \"pluralLabel\": {\"en_US\": \"Foos\"}, \"scope\": \"company\"}"` | 귀하가 게시를 요청하는 데이터         |
| `-u "test@liferay.com:learn"`                                                                                               | 기본 인증 자격 증명              |

```{note}
여기서는 데모 목적으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth2](../../../headless-delivery/using-oauth2.md) 을 통해 사용자에게 권한을 부여해야 합니다. OAuth2를 사용하는 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증](../../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) 참조하세요.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검사

`ObjectDefinition_POST_ToInstance.java` 클래스는 관련 서비스를 호출하여 객체 정의를 추가합니다.

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/java/ObjectDefinition_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 11-32
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약어)                                                                  | 묘사                                                                        |
| :----------------------------------------------------------------------------------------- | :------------------------------------------------------------------------ |
| `ObjectDefinitionResource.Builder builder = ...`                                           | `ObjectDefinitionResource` 서비스 인스턴스를 생성하기 위한 `Builder`를 가져옵니다.            |
| `ObjectDefinitionResource objectDefinitionResource = builder.authentication(...).build();` | 기본 인증을 지정하고 `ObjectDefinitionResource` 서비스 인스턴스를 생성합니다.                   |
| `ObjectDefinition objectDefinition = objectDefinitionResource.postObjectDefinition(...);`  | `objectDefinitionResource.postObjectDefinition` 메소드를 호출하고 데이터를 게시에 전달합니다. |

프로젝트에는 `com.liferay.object.admin.rest.client.jar` 파일이 종속성으로 포함되어 있습니다. 설치된 API 탐색기의 `/o/api`에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메소드의 주석은 클래스 실행을 보여줍니다.
```

다른 예제 Java 클래스는 이와 유사하지만 다른 메소드를 호출합니다.

```{important}
서비스 세부사항은 [ObjectDefinitionResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/object/object-admin-rest-client/src/main/java/com/liferay/object/admin/rest/client/resource/v1_0/ObjectDefinitionResource.java) 참조하십시오.
```

다음은 cURL 및 Java를 사용하여 다른 관련 REST 서비스를 호출하는 예입니다.

## 인스턴스에서 객체 가져오기

다음 cURL 또는 Java 명령을 실행하여 객체 정의를 나열할 수 있습니다.

### ObjectDefinitions_GET_FromInstance.sh

명령:

```bash
./ObjectDefinitions_GET_FromInstance.sh
```

부호:

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/curl/ObjectDefinitions_GET_FromInstance.sh
   :language: bash
```

### ObjectDefinitions_GET_FromInstance.java

명령:

```bash
java -classpath .:* ObjectDefinitions_GET_FromInstance
```

부호:

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/java/ObjectDefinitions_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-25
```

인스턴스의 객체 정의는 JSON으로 표시됩니다.

## 객체 정의 가져오기

다음 cURL 또는 Java 명령을 사용하여 특정 개체 정의를 가져옵니다.

```{tip}
``ObjectDefinitions_GET_FromInstance.[java|sh]``를 사용하여 인스턴스 ``ObjectDefinition`` ID를 가져옵니다.
```
### ObjectDefinition_GET_ById.sh

명령:

```bash
./ObjectDefinition_GET_ById.sh 1234
```

부호:

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/curl/ObjectDefinition_GET_ById.sh
   :language: bash
```

### ObjectDefinition_GET_ById.java

명령:

```bash
java -classpath .:* -DobjectDefinitionId=1234 ObjectDefinition_GET_ById
```

부호:

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/java/ObjectDefinition_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-20
```

객체 정의의 필드는 JSON으로 표시됩니다.

## 객체 정의 패치

다음 cURL 및 Java 명령을 사용하여 기존 객체 정의를 부분적으로 편집합니다. '1234'를 개체 정의 ID로 바꿉니다.

### ObjectDefinition_PATCH_ById.sh

명령:

```bash
./ObjectDefinition_PATCH_ById.sh 1234
```

부호:

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/curl/ObjectDefinition_PATCH_ById.sh
   :language: bash
```

### ObjectDefinition_PATCH_ById.java

명령:

```bash
java -classpath .:* -DobjectDefinitionId=1234 ObjectDefinition_PATCH_ById
```

부호:

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/java/ObjectDefinition_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 11-32
```

## 객체 정의 넣기

다음 cURL 및 Java 명령을 사용하여 기존 개체 정의를 완전히 덮어씁니다. '1234'를 개체 정의 ID로 바꿉니다.

### ObjectDefinition_PUT_ById.sh

명령:

```bash
./ObjectDefinition_PUT_ById.sh 1234
```

부호:

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/curl/ObjectDefinition_PUT_ById.sh
   :language: bash
```

### ObjectDefinition_PUT_ById.java

명령:

```bash
java -classpath .:* -DobjectDefinitionId=1234 ObjectDefinition_PUT_ById
```

부호:

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/java/ObjectDefinition_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 11-33
```

## 객체 정의 삭제

다음 cURL 및 Java 명령을 사용하여 기존 개체 정의를 삭제합니다. '1234'를 개체 정의 ID로 바꿉니다.

### ObjectDefinition_DELETE_ById.sh

명령:

```bash
./ObjectDefinition_DELETE_ById.sh 1234
```

부호:

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/curl/ObjectDefinition_DELETE_ById.sh
   :language: bash
```

### ObjectDefinition_DELETE_ById.java

명령

```bash
java -classpath .:* -DobjectDefinitionId=1234 ObjectDefinition_DELETE_ById
```

부호:

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/java/ObjectDefinition_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## 개체 필드에 대한 서비스

개체 필드에 대한 cURL 명령과 Java 클래스는 개체 정의와 동일한 방식으로 작동합니다.

| 파일                                                  | 묘사                       |
| :-------------------------------------------------- | :----------------------- |
| `ObjectField_DELETE_ById.[java\|sh]`               | ID별로 개체 필드를 삭제합니다.       |
| `ObjectField_GET_ById.[java\|sh]`                  | ID별로 특정 개체 필드를 가져옵니다.    |
| `ObjectField_PATCH_ById.[java\|sh]`                | 특정 객체 필드를 ID별로 패치합니다.    |
| `ObjectField_POST_ToObjectDefinition.[java\|sh]`   | 개체 필드를 개체 정의에 게시합니다.     |
| `ObjectField_PUT_ById.[java\|sh]`                  | 특정 개체 필드를 ID로 바꿉니다.      |
| `ObjectFields_GET_FromObjectDefinition.[java\|sh]` | 개체 정의에서 개체 필드 목록을 가져옵니다. |

[API Explorer](../../../headless-delivery/consuming-apis/consuming-rest-services.md) 은 객체에 대한 모든 서비스와 스키마를 표시하고 각 서비스를 시험해 볼 수 있는 인터페이스를 가지고 있습니다.
