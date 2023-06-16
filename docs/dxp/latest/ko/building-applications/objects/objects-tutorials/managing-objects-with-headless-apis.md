# 헤드리스 API로 개체 관리

{bdg-secondary}사용 가능한 Liferay 7.4

애플리케이션 메뉴에서 [객체 생성 및 관리](../creating-and-managing-objects.md)를 할 수 있지만 Liferay의 REST API를 사용할 수도 있습니다. 이러한 서비스를 호출하여 개체를 만들고 관리합니다. Liferay의 코드베이스에서 개체는 **개체 정의** 라고 합니다. 각 개체 정의는 다양한 개체 필드로 구성됩니다.

## 개체 정의 및 개체 필드 추가

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르십시오.

1. 제공된 샘플 코드를 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/objects-tutorials/liferay-r4g6.zip -O
   ```

   ```bash
   unzip liferay-r4g6.zip
   ```

1. cURL 스크립트를 사용하여 인스턴스에 새 개체 정의를 추가합니다. 명령줄에서 `curl` 폴더로 이동합니다. `ObjectDefinition_POST_ToInstance.sh` 스크립트를 실행합니다. 

   ```bash
   ./ObjectDefinition_POST_ToInstance.sh
   ```

JSON 응답은 새 객체 정의가 추가되었음을 보여줍니다. 

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

1. **글로벌 메뉴** &rarr; **애플리케이션** &rarr; **개체** 로 이동합니다. 새 개체가 추가되었는지 확인합니다. 
   
   ![새 개체 정의가 추가되었는지 확인합니다.](./managing-objects-with-headless-apis/images/01.png)
   
**Foo** 개체를 클릭합니다. 개체의 ID 번호를 기록해 둡니다.

1. cURL 스크립트를 사용하여 개체 정의에 새 개체 필드를 추가합니다. 명령줄에서 `ObjectField_POST_ToObjectDefinition.sh` 스크립트를 실행합니다. 1234를 개체의 ID로 바꿉니다. 

   ```bash
   ./ObjectField_POST_ToObjectDefinition.sh 1234
   ```

1. Liferay에서 **Foo** 개체를 다시 클릭합니다. **필드** 탭을 클릭합니다. 새 Able 필드가 추가되었습니다.
   
   ![새 개체 필드가 추가되었는지 확인합니다.](./managing-objects-with-headless-apis/images/02.png)

1. REST 서비스는 Java 클라이언트를 사용하여 호출할 수도 있습니다. `curl` 폴더에서 `java` 폴더로 이동합니다. 소스 파일을 컴파일합니다. 

   ```bash
   javac -classpath .:* *.java
   ```

1. `ObjectDefinition_POST_ToInstance.java` 클래스를 실행합니다. 

   ```bash
   java -classpath .:* ObjectDefinition_POST_ToInstance
   ```

1. **Foo** 개체의 ID 번호를 기록해 둡니다. 그런 다음 `ObjectField_POST_ToObjectDefinition.java` 클래스를 실행합니다. 1234를 개체의 ID로 바꿉니다. 

   ```bash
   java -classpath .:* -DobjectDefinitionId=1234 ObjectField_POST_ToObjectDefinition
   ```

새로 생성된 객체는 아직 초안 상태입니다. 게시하기 전에 필요한 사항을 변경하거나 수정하십시오. 개체가 게시되면 편집이 비활성화됩니다. 자세한 내용은 [개체 초안 게시](../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) 참조하세요.

## cURL 명령 검사

`ObjectDefinition_POST_ToInstance.sh` 스크립트는 cURL 명령으로 REST 서비스를 호출합니다.

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/curl/ObjectDefinition_POST_ToInstance.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                                                                                              | 묘사                     |
|:----------------------------------------------------------------------------------------------------------------------------------------------- |:---------------------- |
| `-H "Content-Type: application/json"`                                                                                                           | JSON의 요청 본문 형식을 정의합니다. |
| `-X POST`                                                                                                                                       | 지정된 끝점에서 호출할 HTTP 메서드  |
| `"http://localhost:8080/o/object-admin/v1.0/object-definitions"`                                                                                | REST 서비스 끝점            |
| `-d "{\"label\": {\"en_US\": \"Foo\"}, \"name\": \"Foo\", \"pluralLabel\": {\"en_US\": \"Foos\"}, \"scope\": \"company\"}"` | 게시를 요청하는 데이터           |
| `-u "test@liferay.com:learn"`                                                                                                                   | 기본 인증 자격 증명            |

```{note}
여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth2](../../../headless-delivery/using-oauth2.md)을 통해 사용자를 인증해야 합니다. OAuth2를 사용하는 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증하기](../../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md)를 참조하세요.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검토

`ObjectDefinition_POST_ToInstance.java` 클래스는 관련 서비스를 호출하여 객체 정의를 추가합니다.

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/java/ObjectDefinition_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 11-32
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                                                     | 묘사                                                                        |
|:------------------------------------------------------------------------------------------ |:------------------------------------------------------------------------- |
| `ObjectDefinitionResource.Builder builder = ...`                                           | `ObjectDefinitionResource` 서비스 인스턴스를 생성하기 위한 `빌더` 가져옵니다.                  |
| `ObjectDefinitionResource objectDefinitionResource = builder.authentication(...).build();` | 기본 인증을 지정하고 `ObjectDefinitionResource` 서비스 인스턴스를 생성합니다.                   |
| `ObjectDefinition objectDefinition = objectDefinitionResource.postObjectDefinition(...);`  | `objectDefinitionResource.postObjectDefinition` 메서드를 호출하고 데이터를 게시에 전달합니다. |

프로젝트에는 `com.liferay.object.admin.rest.client.jar` 파일이 종속성으로 포함되어 있습니다. `/o/api`에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메서드의 주석은 클래스 실행을 보여줍니다.
```

다른 예제 Java 클래스는 이것과 유사하지만 다른 메소드를 호출합니다.

```{important}
서비스 세부 정보는 [ObjectDefinitionResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/object/object-admin-rest-client/src/main/java/com/liferay/object/admin/rest/client/resource/v1_0/ObjectDefinitionResource.java) 를 참조하십시오.
```

다음은 cURL 및 Java를 사용하여 기타 관련 REST 서비스를 호출하는 예입니다.

## 인스턴스에서 개체 가져오기

다음 cURL 또는 Java 명령을 실행하여 개체 정의를 나열할 수 있습니다.

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

인스턴스의 개체 정의가 JSON에 나타납니다.

## 개체 정의 가져오기

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

객체 정의의 필드는 JSON으로 나타납니다.

## 개체 정의 패치

다음 cURL 및 Java 명령을 사용하여 기존 개체 정의의 부분 편집을 수행합니다. `1234` 개체 정의의 ID로 바꿉니다.

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

## 개체 정의 넣기

다음 cURL 및 Java 명령으로 기존 개체 정의를 완전히 덮어씁니다. `1234` 개체 정의의 ID로 바꿉니다.

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

다음 cURL 및 Java 명령을 사용하여 기존 개체 정의를 삭제합니다. `1234` 개체 정의의 ID로 바꿉니다.

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

개체 필드에 대한 cURL 명령 및 Java 클래스는 개체 정의와 동일한 방식으로 작동합니다.

| 파일                                                  | 묘사                       |
|:--------------------------------------------------- |:------------------------ |
| `ObjectField_DELETE_ById.[java\|sh]`               | ID별로 개체 필드를 삭제합니다.       |
| `ObjectField_GET_ById.[java\|sh]`                  | ID로 특정 개체 필드를 가져옵니다.     |
| `ObjectField_PATCH_ById.[java\|sh]`                | 특정 개체 필드를 ID로 패치합니다.     |
| `ObjectField_POST_ToObjectDefinition.[java\|sh]`   | 개체 정의에 개체 필드를 게시합니다.     |
| `ObjectField_PUT_ById.[java\|sh]`                  | 특정 개체 필드를 ID로 바꿉니다.      |
| `ObjectFields_GET_FromObjectDefinition.[java\|sh]` | 개체 정의에서 개체 필드 목록을 가져옵니다. |

[API Explorer](../../../headless-delivery/consuming-apis/consuming-rest-services.md) 은 객체에 대한 모든 서비스와 스키마를 보여주고 각 서비스를 시험해 볼 수 있는 인터페이스를 가지고 있습니다.
