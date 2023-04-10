# Batch Engine API 기본 사항 - 데이터 가져오기

Liferay의 헤드리스 배치 엔진은 데이터를 가져오고 내보내는 REST API를 제공합니다. Liferay로 데이터를 가져오려면 이러한 서비스를 호출하십시오.

<!-- TASK: Link to Batch Engine Overview in the introduction once it is ready !-->

## 데이터 가져오기

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르십시오.

1. [Batch Engine API 기본 사항](./liferay-g4j2.zip) 을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/headless-delivery/consuming-apis/liferay-g4j2.zip -O
   ```

   ```bash
   unzip liferay-g4j2.zip
   ```

1. 데이터를 가져오려면 가져오는 엔터티의 정규화된 클래스 이름이 있어야 합니다. `/o/api`에 설치된 API 탐색기에서 클래스 이름을 얻을 수 있습니다. **Schemas** 섹션까지 아래로 스크롤하고 가져오려는 엔터티의 `x-class-name` 필드를 기록해 둡니다.

1. 다음 cURL 스크립트를 사용하여 계정을 Liferay 인스턴스로 가져옵니다. 명령줄에서 `curl` 폴더로 이동합니다. **계정** 의 정규화된 클래스 이름을 매개변수로 사용하여 `ImportTask_POST_ToInstance.sh` 스크립트를 실행합니다.

   ```bash
   ./ImportTask_POST_ToInstance.sh com.liferay.headless.admin.user.dto.v1_0.Account
   ```

   JSON 응답은 새 가져오기 작업 생성을 보여줍니다. 작업의 `id` 에 유의하십시오.

   ```bash
   {
   "className" : "com.liferay.headless.admin.user.dto.v1_0.Account",
   "contentType" : "JSON",
   "errorMessage" : "",
   "executeStatus" : "INITIAL",
   "externalReferenceCode" : "4a6ab4b0-12cc-e8e3-fc1a-4726ebc09df2",
   "failedItems" : [ ],
   "id" : 1234,
   "importStrategy" : "ON_ERROR_FAIL",
   "operation" : "CREATE",
   "processedItemsCount" : 0,
   "startTime" : "2022-10-19T14:19:43Z",
   "totalItemsCount" : 0
   }
   ```

1. 현재 `인 executeStatus` `INITIAL`입니다. 배치 엔진에 대한 작업 제출을 나타냅니다. 데이터를 확인하려면 이것이 `COMPLETED` 이 될 때까지 기다려야 합니다. 명령줄에서 `ImportTask_GET_ById.sh` 스크립트를 실행하고 `1234` 가져오기 작업의 ID로 바꿉니다.

   ```bash
   ./ImportTask_GET_ById.sh 1234
   ```

   ```bash
   {
   "className" : "com.liferay.headless.admin.user.dto.v1_0.Account",
   "contentType" : "JSON",
   "endTime" : "2022-10-19T12:18:59Z",
   "errorMessage" : "",
   "executeStatus" : "COMPLETED",
   "externalReferenceCode" : "7d256faa-9b7e-9589-e85c-3a72f68b8f08",
   "failedItems" : [ ],
   "id" : 1234,
   "importStrategy" : "ON_ERROR_FAIL",
   "operation" : "CREATE",
   "processedItemsCount" : 2,
   "startTime" : "2022-10-19T12:18:58Z",
   "totalItemsCount" : 2
   }
   ```

   `executeStatus` `COMPLETED`이면 가져온 데이터를 확인할 수 있습니다. 그렇지 않은 경우 명령을 다시 실행하여 태스크 실행이 완료되었는지 확인하십시오. `executeStatus` `FAILED`표시되면 `errorMessage` 필드를 확인하여 무엇이 잘못되었는지 확인하십시오.

1. **전역 메뉴**(![Applications Menu icon](../../images/icon-applications-menu.png))을 열고 **제어판** &rarr; **계정** 으로 이동하여 가져온 데이터를 확인합니다. 두 개의 새 계정이 추가되었는지 확인합니다.

   ![두 개의 새 계정이 추가되었는지 확인합니다.](./batch-engine-api-basics/images/01.png)

1. Java 클라이언트를 사용하여 REST 서비스를 호출할 수도 있습니다. `curl` 폴더에서 `java` 폴더로 이동합니다. 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. `ImportTask_POST_ToInstance` 클래스를 실행합니다. `가능` 클래스의 정규화된 이름으로 바꾸고 `베이커` 가져오려는 JSON 데이터로 바꿉니다.

   ```bash
   java -classpath .:* -DclassName=able -Ddata=baker ImportTask_POST_ToInstance
   ```

   예를 들어 `계정` 데이터를 가져옵니다.

   ```bash
   java -classpath .:* -DclassName=com.liferay.headless.admin.user.dto.v1_0.Account -Ddata="[{\"name\": \"Able\", \"type\": \"business\"}, {\"name\": \"Baker\", \"type\": \"guest\"}]" ImportTask_POST_ToInstance
   ```

   JSON 응답에서 가져오기 작업의 `id` 에 유의하십시오.

1. `ImportTask_GET_ById` 클래스를 실행합니다. `1234` 가져오기 작업의 ID로 바꿉니다. `executeStatus` `COMPLETED`표시되면 위 단계에 표시된 대로 데이터를 확인할 수 있습니다.

   ```bash
   java -cp .:* -DimportTaskId=1234 ImportTask_GET_ById
   ```

## cURL 명령 검사

`ImportTask_POST_ToInstance.sh` 스크립트는 cURL을 사용하여 REST 서비스를 호출합니다.

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ImportTask_POST_ToInstance.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                                                                | 묘사                      |
|:----------------------------------------------------------------------------------------------------------------- |:----------------------- |
| `-H "Content-Type: application/json"`                                                                             | 요청 본문 형식이 JSON임을 나타냅니다. |
| `-X POST`                                                                                                         | 지정된 끝점에서 호출할 HTTP 메서드   |
| `"http://localhost:8080/o/headless-batch-engine/v1.0/import-task/${1}"`                                           | REST 서비스 끝점             |
| `-d "[{\"name\": \"Able\", \"type\": \"business\"}, {\"name\": \"Baker\", \"type\": \"guest\"}]"` | 게시를 요청하는 데이터            |
| `-u "test@liferay.com:learn"`                                                                                     | 기본 인증 자격 증명             |

```{note}
여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth 2.0 사용](https://learn.liferay.com/dxp/latest/ko/headless-delivery/using-oauth2.html) 을 통해 사용자를 인증해야 합니다. Oauth2를 사용하는 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증](../using-oauth2/using-oauth2-to-authorize-users.md)을 참조하세요.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검토

`ImportTask_POST_ToInstance.java` 클래스는 Batch Engine 관련 서비스를 호출하여 데이터를 가져옵니다.

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ImportTask_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 8-20
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                                         | 묘사                                                            |
|:------------------------------------------------------------------------------ |:------------------------------------------------------------- |
| `ImportTaskResource.Builder builder = ...`                                     | `ImportTaskResource` 서비스 인스턴스를 생성하기 위한 `빌더` 가져옵니다.            |
| `ImportTaskResource importTaskResource = builder.authentication(...).build();` | 기본 인증을 지정하고 `ImportTaskResource` 서비스 인스턴스를 생성합니다.             |
| `importTaskResource.postImportTask(...);`                                      | `importTaskResource.postImportTask` 메서드를 호출하고 데이터를 게시에 전달합니다. |

프로젝트에는 `com.liferay.headless.batch.engine.client.jar` 파일이 종속성으로 포함되어 있습니다. `/o/api`에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메서드의 주석은 클래스 실행을 보여줍니다.
```

다른 예제 Java 클래스는 이 클래스와 유사하지만 다른 `ImportTaskResource` 메서드를 호출합니다.

```{important}
[ImportTaskResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-batch-engine/headless-batch-engine-client/src/main/java/com 참조) /liferay/headless/batch/engine/client/resource/v1_0/ImportTaskResource.java)를 참조하십시오.
```

다음은 cURL 및 Java를 사용하여 다른 Batch Engine 가져오기 REST 서비스를 호출하는 예입니다.

## ImportTask 상태 가져오기

다음 cURL 또는 Java 명령을 실행하여 가져오기 작업의 상태를 가져올 수 있습니다. `1234` 가져오기 작업의 ID로 바꿉니다.

### ImportTask_GET_ById.sh

명령:

```bash
./ImportTask_GET_ById.sh 1234
```

부호:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ImportTask_GET_ById.sh
   :language: bash
```

### ImportTask_GET_ById.java

`ImportTask_GET_ById` 클래스를 실행합니다. `1234` 가져오기 작업의 ID로 바꿉니다.

명령:

```bash
java -classpath .:* -DimportTaskId=1234 ImportTask_GET_ById
```

부호:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ImportTask_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

## 사이트로 데이터 가져오기

다음 cURL 또는 Java 명령을 실행하여 사이트로 데이터를 가져올 수 있습니다. 이 예에서는 블로그 게시물을 사이트로 가져옵니다. [사이트의 ID](https://learn.liferay.com/dxp/latest/en/headless-delivery/consuming-apis/consuming-rest-services.html#identify-the-site-containing-the-data) 을 찾아 `1234` 으로 바꿉니다. 다른 엔터티를 사용하는 경우 cURL 스크립트에서 가져올 데이터와 정규화된 클래스 이름 매개 변수도 업데이트해야 합니다.

### ImportTask_POST_ToSite.sh

명령:

```bash
./ImportTask_POST_ToSite.sh com.liferay.headless.delivery.dto.v1_0.BlogPosting 1234
```

부호:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ImportTask_POST_ToSite.sh
   :language: bash
```

### ImportTask_POST_ToSite.java

`ImportTask_POST_ToSite` 클래스를 실행합니다. `1234` 사이트의 ID로 바꾸고, `` 클래스의 정규화된 이름으로, `가져올 JSON 데이터로 베이커` 바꿉니다.

명령:

```bash
java -classpath .:* -DsiteId=1234 -DclassName=able -Ddata=baker ImportTask_POST_ToSite
```

예를 들어 `BlogPosting` 데이터를 가져옵니다.

```bash
java -classpath .:* -DsiteId=1234 -DclassName=com.liferay.headless.delivery.dto.v1_0.BlogPosting -Ddata="[{\"articleBody\": \"Foo\", \"headline\": \"Able\"}, {\"articleBody\": \"Bar\", \"headline\": \"Baker\"}]" ImportTask_POST_ToSite
```

부호:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ImportTask_POST_ToSite.java
   :dedent: 1
   :language: java
   :lines: 8-22
```

JSON 응답은 새로 생성된 가져오기 작업의 정보를 표시합니다. `executeStatus`을 추적하려면 `id` 에 유의하십시오.

## 가져온 데이터 넣기

다음 cURL 또는 Java 명령을 사용하여 배치 엔진을 사용하여 기존 데이터를 완전히 덮어쓸 수 있습니다. 이 예는 기존 계정 데이터 업데이트를 보여줍니다. 다른 엔터티를 사용하는 경우 cURL 스크립트에서 덮어쓸 데이터와 정규화된 클래스 이름 매개 변수를 업데이트해야 합니다.

### ImportTask_PUT_ById.sh

명령:

```bash
./ImportTask_PUT_ById.sh com.liferay.headless.admin.user.dto.v1_0.Account
```

부호:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ImportTask_PUT_ById.sh
   :language: bash
```

### ImportTask_PUT_ById.java

`ImportTask_PUT_ById` 클래스를 실행합니다. `가능` 클래스의 정규화된 이름으로 바꾸고 `베이커` JSON 데이터로 대체하여 거기에 있는 내용을 덮어씁니다. 데이터에는 덮어쓰려는 엔터티의 ID가 포함되어야 합니다.

명령:

```bash
java -classpath .:* -DclassName=able -Ddata=baker ImportTask_PUT_ById
```

예를 들어 기존 `계정` 데이터를 덮어쓰려면 `1234` 및 `5678` 기존 계정의 ID로 바꿉니다.

```bash
java -classpath .:* -DclassName=com.liferay.headless.admin.user.dto.v1_0.Account -Ddata="[{\"id\" :1234, \"name\": \"Bar\", \"type\": \"business\"}, {\"id\": 5678, \"name\": \"Goo\", \"type\": \"guest\"}]" ImportTask_PUT_ById
```

부호:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ImportTask_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## 가져온 데이터 삭제

다음 cURL 또는 Java 명령을 사용하여 배치 엔진을 사용하여 기존 데이터를 삭제할 수 있습니다. 이 예에서는 계정 데이터를 삭제합니다. 다른 엔터티를 사용하는 경우 정규화된 클래스 이름 매개 변수와 cURL 스크립트에서 삭제할 데이터를 업데이트해야 합니다.

### ImportTask_DELETE_ById.sh

명령:

```bash
./ImportTask_DELETE_ById.sh com.liferay.headless.admin.user.dto.v1_0.Account
```

부호:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ImportTask_DELETE_ById.sh
   :language: bash
```

### ImportTask_DELETE_ById.java

`ImportTask_DELETE_ById` 클래스를 실행합니다. `가능` 클래스의 정규화된 이름으로 바꾸고 `베이커` JSON 데이터로 대체하여 거기에 있는 내용을 덮어씁니다. 데이터에는 삭제할 항목의 ID가 포함되어야 합니다.

명령:

```bash
java -classpath .:* -DclassName=able -Ddata=baker ImportTask_DELETE_ById
```

예를 들어 `계정` 데이터를 삭제하려면 `1234` 및 `5678` 를 기존 계정의 ID로 바꿉니다.

```bash
java -classpath .:* -DclassName=com.liferay.headless.admin.user.dto.v1_0.Account -Ddata="[{\"id\": 1234}, {\"id\": 5678}]" ImportTask_DELETE_ById
```

부호:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ImportTask_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## 가져온 데이터의 내용 가져오기

다음 cURL 및 Java 명령을 사용하여 가져온 데이터를 검색할 수 있습니다. `1234` 가져오기 작업의 ID로 바꿉니다. 그런 다음 현재 디렉터리에 `.zip` 파일로 다운로드됩니다.

### ImportTaskContent_GET_ById.sh

명령:

```bash
./ImportTaskContent_GET_ById.sh 1234
```

부호:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ImportTaskContent_GET_ById.sh
   :language: bash
```

### ImportTaskContent_GET_ById.java

명령

```bash
java -classpath .:* -DimportTaskId=1234 ImportTaskContent_GET_ById
```

부호:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ImportTaskContent_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 11-27
```

[REST 서비스 사용](https://learn.liferay.com/dxp/latest/ko/headless-delivery/consuming-apis/consuming-rest-services.html) 은 모든 헤드리스 배치 엔진 서비스 및 스키마를 나열하고 각 서비스를 시도할 수 있는 인터페이스가 있습니다.

## 추가 정보

* [Batch Engine API 기본 사항 - 데이터 내보내기](./batch-engine-api-basics-exporting-data.md)
