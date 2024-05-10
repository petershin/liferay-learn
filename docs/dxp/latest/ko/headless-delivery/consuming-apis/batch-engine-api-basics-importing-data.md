# 배치 엔진 API 기본 사항 - 데이터 가져오기

Liferay의 헤드리스 배치 엔진은 데이터 가져오기 및 내보내기를 위한 REST API를 제공합니다. Liferay로 데이터를 가져오려면 이러한 서비스를 호출하세요.

<!-- TASK: Link to Batch Engine Overview in the introduction once it is ready !-->

## 데이터 가져오기

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르십시오.

1. [배치 엔진 API 기본 사항](./liferay-g4j2.zip) 다운로드 및 압축 해제.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/headless-delivery/consuming-apis/liferay-g4j2.zip -O
   ```

   ```bash
   unzip liferay-g4j2.zip
   ```

1. 데이터를 가져오려면 가져오는 엔터티의 정규화된 클래스 이름이 있어야 합니다. `/o/api` 설치 시 API 탐색기에서 클래스 이름을 얻을 수 있습니다. **Schemas** 섹션까지 아래로 스크롤하고 가져오려는 엔터티의 `x-class-name` 필드를 적어둡니다.

1. Liferay 인스턴스로 계정을 가져오려면 다음 cURL 스크립트를 사용하십시오. 명령줄에서 `curl` 폴더로 이동합니다. 정규화된 클래스 이름 **Account** 를 매개변수로 사용하여 `ImportTask_POST_ToInstance.sh` 스크립트를 실행합니다.

   ```bash
   ./ImportTask_POST_ToInstance.sh com.liferay.headless.admin.user.dto.v1_0.Account
   ```

   JSON 응답은 새로운 가져오기 작업 생성을 보여줍니다. 작업의 `id`를 참고하세요.

   ```json
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

1. 현재 `executeStatus`는 `INITIAL`입니다. 배치 엔진에 작업이 제출되었음을 나타냅니다. 데이터를 확인하려면 `COMPLETED`가 될 때까지 기다려야 합니다. 명령줄에서 `ImportTask_GET_ById.sh` 스크립트를 실행하고 `1234`를 가져오기 작업의 ID로 바꿉니다.

   ```bash
   ./ImportTask_GET_ById.sh 1234
   ```

   ```json
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

   `executeStatus`가 `COMPLETED`인 경우 가져온 데이터를 확인할 수 있습니다. 그렇지 않은 경우 명령을 다시 실행하여 작업 실행이 완료되었는지 확인하세요. `executeStatus`에 `FAILED`가 표시되면 `errorMessage` 필드를 확인하여 무엇이 잘못되었는지 파악하세요.

1. **글로벌 메뉴**(![응용 프로그램 메뉴 아이콘](../../images/icon-applications-menu.png))를 열고 **제어판** &rarr; **계정** 으로 이동하여 가져온 데이터를 확인합니다. 두 개의 새 계정이 추가되었는지 확인하세요.

   ![Verify that two new accounts have been added.](./batch-engine-api-basics/images/01.png)

1. Java 클라이언트를 사용하여 REST 서비스를 호출할 수도 있습니다. `curl` 폴더에서 `java` 폴더로 이동합니다. 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. `ImportTask_POST_ToInstance` 클래스를 실행합니다. `able`을 클래스의 정규화된 이름으로 바꾸고, `baker`를 가져오려는 JSON 데이터로 바꾸세요.

   ```bash
   java -classpath .:* -DclassName=able -Ddata=baker ImportTask_POST_ToInstance
   ```

   예를 들어 `계정` 데이터를 가져옵니다.

   ```bash
   java -classpath .:* -DclassName=com.liferay.headless.admin.user.dto.v1_0.Account -Ddata="[{\"name\": \"Able\", \"type\": \"business\"}, {\"name\": \"Baker\", \"type\": \"guest\"}]" ImportTask_POST_ToInstance
   ```

   JSON 응답에서 가져오기 작업의 `id`를 확인하세요.

1. `ImportTask_GET_ById` 클래스를 실행합니다. `1234`를 가져오기 작업의 ID로 바꿉니다. `executeStatus`에 `COMPLETED`가 표시되면 위 단계에 표시된 대로 데이터를 확인할 수 있습니다.

   ```bash
   java -cp .:* -DimportTaskId=1234 ImportTask_GET_ById
   ```

## cURL 명령 검사

`ImportTask_POST_ToInstance.sh` 스크립트는 cURL을 사용하여 REST 서비스를 호출합니다.

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ImportTask_POST_ToInstance.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                                                | 묘사                       |
| :------------------------------------------------------------------------------------------------ | :----------------------- |
| `-H "Content-Type: application/json"`                                                             | 요청 본문 형식이 JSON임을 나타냅니다.  |
| `-X POST`                                                                                         | 지정된 엔드포인트에서 호출할 HTTP 메서드 |
| `"http://localhost:8080/o/headless-batch-engine/v1.0/import-task/${1}"`                           | REST 서비스 엔드포인트           |
| `-d "[{\"name\": \"Able\", \"type\": \"business\"}, {\"name\": \"Baker\", \"type\": \"guest\"}]"` | 귀하가 게시를 요청하는 데이터         |
| `-u "test@liferay.com:learn"`                                                                     | 기본 인증 자격 증명              |

```{note}
여기서는 데모 목적으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth 2.0 사용](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2) 을 통해 사용자에게 권한을 부여해야 합니다. Oauth2를 사용하는 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자에게 권한 부여](../using-oauth2/using-oauth2-to-authorize-users.md) 참조하세요.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검사

`ImportTask_POST_ToInstance.java` 클래스는 배치 엔진 관련 서비스를 호출하여 데이터를 가져옵니다.

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ImportTask_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 8-20
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약어)                                                      | 묘사                                                            |
| :----------------------------------------------------------------------------- | :------------------------------------------------------------ |
| `ImportTaskResource.Builder builder = ...`                                     | `ImportTaskResource` 서비스 인스턴스를 생성하기 위한 `Builder`를 가져옵니다.      |
| `ImportTaskResource importTaskResource = builder.authentication(...).build();` | 기본 인증을 지정하고 `ImportTaskResource` 서비스 인스턴스를 생성합니다.             |
| `importTaskResource.postImportTask(...);`                                      | `importTaskResource.postImportTask` 메소드를 호출하고 게시할 데이터를 전달합니다. |

프로젝트에는 `com.liferay.headless.batch.engine.client.jar` 파일이 종속성으로 포함되어 있습니다. 설치된 API 탐색기의 `/o/api`에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메소드의 주석은 클래스 실행을 보여줍니다.
```

다른 예제 Java 클래스는 이와 유사하지만 다른 `ImportTaskResource` 메소드를 호출합니다.

```{important}
서비스 세부정보는 [ImportTaskResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-batch-engine/headless-batch-engine-client/src/main/java/com/liferay/headless/batch/engine/client/resource/v1_0/ImportTaskResource.java) 참조하세요.
```

다음은 cURL 및 Java를 사용하여 다른 Batch Engine 가져오기 REST 서비스를 호출하는 예입니다.

## ImportTask 상태 가져오기

다음 cURL 또는 Java 명령을 실행하여 가져오기 작업의 상태를 가져올 수 있습니다. `1234`를 가져오기 작업의 ID로 바꿉니다.

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

`ImportTask_GET_ById` 클래스를 실행합니다. `1234`를 가져오기 작업의 ID로 바꿉니다.

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

다음 cURL 또는 Java 명령을 실행하여 사이트로 데이터를 가져올 수 있습니다. 이 예에서는 블로그 게시물을 사이트로 가져옵니다. [REST 서비스 사용](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/consuming-rest-services#identify-the-site-containing-the-data) 찾아 `1234`를 바꾸세요. 다른 엔터티를 사용하는 경우 cURL 스크립트에서 가져올 데이터와 정규화된 클래스 이름 매개변수도 업데이트해야 합니다.

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

`ImportTask_POST_ToSite` 클래스를 실행합니다. `1234`를 사이트 ID로 바꾸고, `able`을 클래스의 정규화된 이름으로, `baker`를 가져오려는 JSON 데이터로 바꾸세요.

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

JSON 응답은 새로 생성된 가져오기 작업의 정보를 표시합니다. `executeStatus`를 추적하려면 `id`를 기록해 두세요.

## 가져온 데이터 넣기

다음 cURL 또는 Java 명령을 사용하면 배치 엔진을 통해 기존 데이터를 완전히 덮어쓸 수 있습니다. 이 예에서는 기존 계정 데이터를 업데이트하는 방법을 보여줍니다. 다른 엔터티를 사용하는 경우 cURL 스크립트에서 덮어쓸 데이터와 정규화된 클래스 이름 매개변수를 업데이트해야 합니다.

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

`ImportTask_PUT_ById` 클래스를 실행합니다. `able`을 클래스의 정규화된 이름으로 바꾸고, `baker`를 JSON 데이터로 바꿔서 거기에 있는 내용을 덮어씁니다. 데이터에는 덮어쓰려는 엔터티의 ID가 포함되어 있어야 합니다.

명령:

```bash
java -classpath .:* -DclassName=able -Ddata=baker ImportTask_PUT_ById
```

예를 들어 기존 `계정` 데이터를 덮어쓰려면 `1234` 및 `5678`을 기존 계정의 ID로 바꾸세요.

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

다음 cURL 또는 Java 명령을 사용하면 배치 엔진을 통해 기존 데이터를 삭제할 수 있습니다. 이 예에서는 계정 데이터를 삭제합니다. 다른 엔터티를 사용하는 경우 정규화된 클래스 이름 매개변수와 cURL 스크립트에서 삭제할 데이터도 업데이트해야 합니다.

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

`ImportTask_DELETE_ById` 클래스를 실행합니다. `able`을 클래스의 정규화된 이름으로 바꾸고, `baker`를 JSON 데이터로 바꿔서 거기에 있는 내용을 덮어씁니다. 데이터에는 삭제하려는 엔터티의 ID가 포함되어 있어야 합니다.

명령:

```bash
java -classpath .:* -DclassName=able -Ddata=baker ImportTask_DELETE_ById
```

예를 들어 `계정` 데이터를 삭제하려면 `1234` 및 `5678`을 기존 계정의 ID로 바꾸세요.

```bash
java -classpath .:* -DclassName=com.liferay.headless.admin.user.dto.v1_0.Account -Ddata="[{\"id\": 1234}, {\"id\": 5678}]" ImportTask_DELETE_ById
```

부호:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ImportTask_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## 가져온 데이터의 콘텐츠 가져오기

다음 cURL 및 Java 명령을 사용하여 가져온 데이터를 검색할 수 있습니다. `1234`를 가져오기 작업의 ID로 바꿉니다. 그런 다음 현재 디렉터리에 `.zip` 파일로 다운로드됩니다.

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

[REST 서비스 사용](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/consuming-rest-services) 에는 모든 Headless Batch Engine 서비스 및 스키마가 나열되어 있으며 각 서비스를 시험해 볼 수 있는 인터페이스가 있습니다.

## 관련 주제

* [배치 엔진 API 기본 사항 - 데이터 내보내기](./batch-engine-api-basics-exporting-data.md)
* [데이터 마이그레이션 센터](./data-migration-center.md)
