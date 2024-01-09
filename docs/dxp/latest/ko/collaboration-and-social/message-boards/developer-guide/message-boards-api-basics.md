# 메시지 보드 API 기본 사항

Liferay의 Headless Delivery 애플리케이션은 [게시판](../../message-boards.md) 애플리케이션에 대한 REST 서비스를 제공합니다. 이러한 서비스를 사용하면 게시판 카테고리, 스레드 및 메시지를 추가하고 해당 정보를 나열하며 내용을 수정하거나 완전히 제거할 수 있습니다. 여기에서는 cURL 명령과 Java 클래스를 사용하여 해당 서비스를 호출합니다.

```{note}
메시지 보드 범주는 Liferay 백엔드에서 *섹션*으로 명명됩니다. 이 섹션에서는 스레드 구성에 대한 주제를 정의합니다.
```

## 튜토리얼 리소스 준비

튜토리얼을 진행하기 전에 먼저 깨끗한 Liferay Docker 컨테이너를 설정하고 제공된 튜토리얼 코드를 사용할 준비를 하세요.

### liferay 도커 컨테이너

```{include} /_snippets/run-liferay-portal.md
```

일단 시작되면 사이트 ID를 검색하십시오. 사이트 ID를 찾으려면 _사이트 메뉴_(![사이트 메뉴](../../../images/icon-menu.png))를 열고 _구성_ &rarr; _사이트 설정_ &rarr; _로 이동하세요. 사이트 구성_.

![Find the site ID under the Site Configuration settings.](./message-boards-api-basics/images/01.png)

### 튜토리얼 코드

다음은 Headless API를 시연하는 샘플 코드입니다. 이 코드에는 샘플 cURL 및 Java 파일이 모두 포함되어 있습니다.

다음 명령을 실행하여 [샘플 코드](https://resources.learn.liferay.com/dxp/latest/en/collaboration-and-social/message-boards/developer-guide/liferay-y3a6.zip) 을 다운로드하고 압축을 풉니다.

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/collaboration-and-social/message-boards/developer-guide/liferay-y3a6.zip -O
```

```bash
unzip liferay-y3a6.zip
```

cURL 스크립트는 사용할 준비가 되어 있지만 실행하기 전에 Java 소스 파일을 수동으로 컴파일해야 합니다. 이렇게 하려면 프로젝트의 `java` 폴더로 이동하여 `javac` 명령을 실행하세요.

```bash
cd liferay-y3a6/java
```

```bash
javac -classpath .:* *.java
```

프로젝트에는 `com.liferay.headless.delivery.client.jar` 파일이 종속성으로 포함되어 있습니다. 설치된 API 탐색기의 `/o/api`에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

제공된 코드에는 `MessageBoardSection`, `MessageBoardThread` 및 `MessageBoardMessage` 서비스용 API가 포함되어 있습니다. 포함된 모든 샘플 API 목록은 [Tutorial Code Reference](#tutorial-code-reference) 참조하세요.

```{important}
제공된 코드는 데모 목적으로 기본 인증을 사용합니다. 프로덕션의 경우 [OAuth2](../../../headless-delivery/using-oauth2.md) 로 사용자를 승인해야 합니다.
```

## 샘플 API 호출

이 연습에서는 cURL 명령이나 Java 클래스를 사용하여 `MessageBoardSection`, `MessageBoardThread` 및 `MessageBoardMessage` API를 호출할 수 있습니다. 다음 출력 예는 제공된 Java 클래스의 출력과 약간 다른 cURL 명령에 해당합니다.

1. `liferay-y3a6` 프로젝트의 `curl` 또는 `java` 폴더로 이동합니다.

   **cURL의 경우:**

   ```bash
   cd liferay-y3a6/curl
   ```

   **자바의 경우:**

   ```bash
   cd liferay-y3a6/java
   ```

1. 사이트 ID를 매개변수로 사용하여 `MessageBoardSection_POST_ToSite`를 실행합니다. 그러면 지정된 사이트에 새 게시판 섹션이 생성됩니다.

   **cURL의 경우:**

   ```bash
   ./MessageBoardSection_POST_ToSite.sh {site-id}
   ```

   **자바의 경우:**

   ```bash
   java -classpath .:* -DsiteId={site-id} MessageBoardSection_POST_ToSite
   ```

   터미널에는 새로 생성된 섹션에 대한 전체 스키마가 표시됩니다. 제공된 API 호출은 새 섹션에 대한 '설명' 및 '이름' 필드만 정의합니다.

1. 다음 GET, PATCH, PUT 및 DELETE 메소드와 함께 사용할 섹션 ID를 복사하십시오.

   ```json
   {
     ...
     "description" : "Foo",
     "id" : 43925,
     ...
     "name" : "Able Section",
     ...
   }
   ```

1. 해당 매개변수에 대한 사이트 ID를 사용하여 `MessageBoardSections_GET_FromSite`를 실행합니다. 그러면 지정된 사이트의 모든 섹션 목록이 반환됩니다.

   **cURL의 경우:**

   ```bash
   ./MessageBoardSections_GET_FromSite.sh {site-id}
   ```

   **자바의 경우:**

   ```bash
   java -classpath .:* -DsiteId={site-id} MessageBoardSections_GET_FromSite
   ```

1. 메시지보드 섹션의 ID를 해당 매개변수로 사용하여 `MessageBoardSection_PATCH_ById`를 실행합니다. 그러면 지정된 섹션의 세부정보가 API 호출에 제공된 세부정보로 업데이트됩니다.

   **cURL의 경우:**

   ```bash
   ./MessageBoardSection_PATCH_ById.sh {message-board-section-id}
   ```

   **자바의 경우:**

   ```bash
   java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardSection_PATCH_ById
   ```

   그러면 '설명' 필드가 'Bar'로 업데이트됩니다.

1. 해당 매개변수에 동일한 섹션 ID를 사용하여 `MessageBoardSection_PUT_ById`를 실행합니다. 그러면 지정된 섹션의 세부정보가 API 호출에 제공된 세부정보로 대체됩니다.

   **cURL의 경우:**

   ```bash
   ./MessageBoardSection_PUT_ById.sh {message-board-section-id}
   ```

   **자바의 경우:**

   ```bash
   java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardSection_PUT_ById
   ```

   그러면 'name' 필드가 'Baker Section'으로 업데이트되고 'description' 필드가 'Goo'로 업데이트됩니다.

1. 해당 매개변수에 대한 사이트 ID를 사용하여 `MessageBoardThread_POST_ToSite`를 실행합니다. 그러면 사이트에 대한 새 메시지 보드 스레드가 생성됩니다.

   **cURL의 경우:**

   ```bash
   ./MessageBoardThread_POST_ToSite.sh {site-id}
   ```

   **자바의 경우:**

   ```bash
   java -classpath .:* -DsiteId={site-id} MessageBoardThread_POST_ToSite
   ```

   ```bash
   {
     ...
     "articleBody" : "Foo",
     ...
     "headline" : "Able Thread",
     "id" : 43942,
     ...
     "messageBoardRootMessageId" : 43941,
   }
   ```

   모든 스레드는 스레드의 모든 직접 응답의 상위 메시지 역할을 하는 루트 메시지(예: `messageBoardRootMessageId`)로 생성됩니다.

1. 해당 매개변수에 위 섹션 ID를 사용하여 `MessageBoardThread_POST_ToSection`을 실행합니다. 그러면 지정된 섹션에 대한 새 게시판 스레드가 생성됩니다.

   **cURL의 경우:**

   ```bash
   ./MessageBoardThread_POST_ToSection.sh {message-board-section-id}
   ```

   **자바의 경우:**

   ```bash
   java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardThread_POST_ToSection
   ```

1. 다음 GET, PATCH 및 PUT 메소드와 함께 사용할 수 있도록 이 스레드의 ID를 복사하십시오.

   ```bash
   {
     ...
     "articleBody" : "Foo",
     ...
     "headline" : "Baker Thread",
     "id" : 43934,
     ...
     "messageBoardRootMessageId" : 43933,
     "messageBoardSectionId" : 43925,
     ...
   }
   ```

1. 매개변수로 스레드 ID를 사용하여 `MessageBoardThread_PATCH_ById`를 실행합니다. 그러면 지정된 스레드의 세부정보가 API 호출에 제공된 세부정보로 업데이트됩니다.

    **cURL의 경우:**

    ```bash
    ./MessageBoardThread_PATCH_ById.sh {message-board-thread-id}
    ```

    **자바의 경우:**

    ```bash
    java -classpath .:* -DmessageBoardThreadId={message-board-thread-id} MessageBoardThread_PATCH_ById
    ```

    그러면 `articleBody` 필드가 `Bar`로 업데이트됩니다.

1. 해당 매개변수에 동일한 스레드 ID를 사용하여 `MessageBoardThread_PUT_ById`를 실행합니다. 이는 지정된 스레드의 세부사항을 API 호출에 제공된 세부사항으로 대체합니다.

    **cURL의 경우:**

    ```bash
    ./MessageBoardThread_PUT_ById.sh {message-board-thread-id}
    ```

    **자바의 경우:**

    ```bash
    java -classpath .:* -DmessageBoardThreadId={message-board-thread-id} MessageBoardThread_PUT_ById
    ```

    그러면 `headline` 필드가 `Charlie Thread`로 업데이트되고 `articleBody` 필드가 `Goo`로 업데이트됩니다.

1. 해당 매개변수에 대한 사이트 ID를 사용하여 `MessageBoardThreads_GET_FromSite`를 실행합니다. 섹션이 없는 모든 사이트 스레드 목록이 반환됩니다.

    **cURL의 경우:**

    ```bash
    ./MessageBoardThreads_GET_FromSite.sh {site-id}
    ```

    **자바의 경우:**

    ```bash
    java -classpath .:* -DsiteId={site-id} MessageBoardThreads_GET_FromSite
    ```

1. 해당 매개변수의 섹션 ID를 사용하여 `MessageBoardThreads_GET_FromSection`을 실행합니다. 지정된 섹션의 모든 스레드 목록을 반환합니다.

    **cURL의 경우:**

    ```bash
    ./MessageBoardThreads_GET_FromSection.sh {message-board-section-id}
    ```

    **자바의 경우:**

    ```bash
    java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardThreads_GET_FromSection
    ```

1. 해당 매개변수에 위의 스레드 ID 중 하나를 사용하여 `MessageBoardMessage_POST_ToThread`를 실행합니다. 지정된 스레드에 대한 새 게시판 메시지가 생성됩니다.

    **cURL의 경우:**

    ```bash
    ./MessageBoardMessage_POST_ToThread.sh {message-board-thread-id}
    ```

    **자바의 경우:**

    ```bash
    java -classpath .:* -DmessageBoardThreadId={message-board-thread-id} MessageBoardMessage_POST_ToThread
    ```

1. 다음 PUT, PATCH 및 POST 명령과 함께 사용할 메시지 ID를 복사합니다.

    ```bash
    {
      ...
      "articleBody" : "Foo",
      ...
      "headline" : "Able Message",
      "id" : 43946,
      ...
      "messageBoardSectionId" : 43925,
      "messageBoardThreadId" : 43934,
      "parentMessageBoardMessageId" : 43933,
      ...
    }
    ```

    새 메시지는 스레드 루트 메시지(`messageBoardRootMessageId`)의 하위 메시지로 생성됩니다.

1. 해당 매개변수에 대한 메시지 ID를 사용하여 `MessageBoardMessage_PATCH_ById`를 실행합니다. 그러면 지정된 메시지의 세부정보가 API 호출에 제공된 세부정보로 업데이트됩니다.

    **cURL의 경우:**

    ```bash
    ./MessageBoardMessage_PATCH_ById.sh {message-board-message-id}
    ```

    **자바의 경우:**

    ```bash
    java -classpath .:* -DmessageBoardMessageId={message-board-message-id} MessageBoardMessage_PATCH_ById
    ```

    그러면 `articleBody` 필드가 `Bar`로 업데이트됩니다.

1. 해당 매개변수에 동일한 메시지 ID를 사용하여 `MessageBoardMessage_PUT_ById`를 실행합니다. 그러면 지정된 메시지의 세부정보가 API 호출에 제공된 세부정보로 대체됩니다.

    **cURL의 경우:**

    ```bash
    ./MessageBoardMessage_PUT_ById.sh {message-board-message-id}
    ```

    **자바의 경우:**

    ```bash
    java -classpath .:* -DmessageBoardMessageId={message-board-message-id} MessageBoardMessage_PUT_ById
    ```

    그러면 `headline` 필드가 `Baker Message`로 업데이트되고 `articleBody` 필드가 `Goo`로 업데이트됩니다.

1. 해당 매개변수에 대해 이전 메시지 ID를 사용하여 `MessageBoardMessage_POST_ToParent`를 실행합니다. 그러면 지정된 메시지에 대한 새 하위 메시지가 생성됩니다.

    **cURL의 경우:**

    ```bash
    ./MessageBoardMessage_POST_ToParent.sh {parent-message-board-message-id}
    ```

    **자바의 경우:**

    ```bash
    java -classpath .:* -DparentMessageBoardMessageId={parent-message-board-message-id} MessageBoardMessage_POST_ToParent
    ```

    ```bash
    {
      ...
      "articleBody" : "Foo",
      ...
      "headline" : "Charlie Message",
      "id" : 43949,
      ...
      "messageBoardSectionId" : 43925,
      "messageBoardThreadId" : 43934,
      ...
      "parentMessageBoardMessageId" : 43946,
      ...
    }
    ```

1. 해당 매개변수에 대한 스레드 ID를 사용하여 `MessageBoardMessages_GET_FromThread`를 실행합니다. 이는 스레드의 루트 메시지(예: `messageBoardRootMessage`)에 대한 하위 메시지 목록을 반환합니다.

    **cURL의 경우:**

    ```bash
    ./MessageBoardMessages_GET_FromThread.sh {message-board-thread-id}
    ```

    **자바의 경우:**

    ```bash
    java -classpath .:* -DmessageBoardThreadId={message-board-thread-id} MessageBoardMessages_GET_FromThread
    ```

    출력에는 스레드에서 생성한 첫 번째 메시지에 대한 데이터가 포함되어야 하며, 이 메시지 자체에는 하나의 하위 메시지가 있어야 합니다. 이는 메시지의 `numberOfMessageBoardMessages` 필드로 표시됩니다.

20. 매개변수로 이전 메시지의 ID를 사용하여 `MessageBoardMessages_GET_FromParent`를 실행합니다. 지정된 메시지에 대한 모든 하위 메시지 목록이 반환됩니다.

    **cURL의 경우:**

    ```bash
    ./MessageBoardMessages_GET_FromParent.sh {parent-message-board-message-id}
    ```

    **자바의 경우:**

    ```bash
    java -classpath .:* -DparentMessageBoardMessageId={parent-message-board-message-id} MessageBoardMessages_GET_FromParent
    ```

    출력에는 생성한 마지막 하위 메시지에 대한 데이터가 포함되어야 합니다.

21. 해당 매개변수에 동일한 섹션 ID를 사용하여 `MessageBoardSection_DELETE_ById`를 실행합니다. 그러면 스레드 및 메시지와 함께 지정된 섹션이 삭제됩니다.

    **cURL의 경우:**

    ```bash
    ./MessageBoardSection_DELETE_ById.sh {message-board-section-id}
    ```

    **자바의 경우:**

    ```bash
    java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardSection_DELETE_ById
    ```

21. 해당 매개변수에 동일한 섹션 ID를 사용하여 `MessageBoardSection_GET_ById`를 실행합니다. 지정된 섹션이 있는 경우 해당 섹션에 대한 세부 정보를 반환합니다.

    **cURL의 경우:**

    ```bash
    ./MessageBoardSection_GET_ById.sh {message-board-section-id}
    ```

    **자바의 경우:**

    ```bash
    java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardSection_GET_ById
    ```

    이전 단계에서 섹션을 삭제했으므로 다음 메시지가 반환됩니다.

    ```bash
    {
      "status" : "NOT_FOUND",
      "title" : "No MessageBoardSection exists with the primary key 43925"
    }
    ```

## 코드 참조

제공된 샘플 코드에는 다음 `MessageBoardSection`, `MessageBoardThread` 및 `MessageBoardMessage` API에 대한 cURL 스크립트와 Java 클래스가 포함되어 있습니다.

### 샘플 MessageBoardSection API

샘플 코드에는 다음 API를 호출하는 cURL 스크립트와 Java 클래스가 포함되어 있습니다.

| 서비스     | HTTP 방법  | HTTP 엔드포인트                                             | 묘사                                                                  |
| :------ | :------- | :----------------------------------------------------- | :------------------------------------------------------------------ |
| 메시지보드섹션 | `POST`   | `/v1.0/sites/[siteId]/message-board-sections`          | API 호출에 제공된 세부정보로 새 카테고리를 생성합니다.                                    |
| 메시지보드섹션 | `GET`    | `/v1.0/sites/[siteId]/message-board-sections`          | 지정된 사이트에 있는 모든 카테고리의 전체 목록을 반환합니다. 결과는 페이지 매김, 필터링, 검색 및 정렬이 가능합니다. |
| 메시지보드섹션 | `PATCH`  | `/v1.0/message-board-sections/[messageBoardSectionId]` | 카테고리에 대한 API 호출에 지정된 필드만 업데이트합니다.                                   |
| 메시지보드섹션 | `PUT`    | `/v1.0/message-board-sections/[messageBoardSectionId]` | 지정된 카테고리의 모든 필드를 API 호출에 제공된 필드로 바꿉니다.                              |
| 메시지보드섹션 | `DELETE` | `/v1.0/message-board-sections/[messageBoardSectionId]` | 지정된 카테고리를 삭제하고 작업이 성공하면 204를 반환합니다.                                 |

### 샘플 MessageBoardThread API

| 서비스      | HTTP 방법  | HTTP 엔드포인트                                                                   | 묘사                                                                   |
| :------- | :------- | :--------------------------------------------------------------------------- | :------------------------------------------------------------------- |
| 메시지보드스레드 | `POST`   | `/v1.0/sites/[siteId]/message-board-threads`                                 | API 호출에 제공된 세부정보를 사용하여 새 스레드를 생성합니다.                                 |
| 메시지보드스레드 | `POST`   | `/v1.0/message-board-sections/[messageBoardSectionId]/message-board-threads` | API 호출에 제공된 세부정보를 사용하여 지정된 카테고리 내에 새 스레드를 생성합니다.                     |
| 메시지보드스레드 | `GET`    | `/v1.0/sites/[siteId]/message-board-threads`                                 | 카테고리에 없는 모든 사이트 스레드의 전체 목록을 반환합니다. 결과를 페이지 매김, 필터링, 검색 및 정렬할 수 있습니다. |
| 메시지보드스레드 | `GET`    | `/v1.0/message-board-sections/[messageBoardSectionId]/message-board-threads` | 지정된 카테고리에 있는 모든 스레드의 전체 목록을 반환합니다. 결과를 페이지 매김, 필터링, 검색 및 정렬할 수 있습니다. |
| 메시지보드스레드 | `PATCH`  | `/v1.0/message-board-threads/[messageBoardThreadId]`                         | 스레드에 대한 API 호출에 지정된 필드만 업데이트합니다.                                     |
| 메시지보드스레드 | `PUT`    | `/v1.0/message-board-threads/[messageBoardThreadId]`                         | 지정된 스레드의 모든 필드를 API 호출에 제공된 필드로 바꿉니다.                                |
| 메시지보드스레드 | `DELETE` | `/v1.0/message-board-threads/[messageBoardThreadId]`                         | 지정된 스레드를 삭제하고 작업이 성공하면 204를 반환합니다.                                   |

### 샘플 MessageBoardMessage API

| 서비스      | HTTP 방법  | HTTP 엔드포인트                                                                  | 묘사                                                                 |
| :------- | :------- | :-------------------------------------------------------------------------- | :----------------------------------------------------------------- |
| 메시지보드메시지 | `POST`   | `/v1.0/message-board-threads/[messageBoardThreadId]/message-board-messages` | API 호출에 제공된 세부 정보를 사용하여 지정된 스레드에 새 메시지를 만듭니다.                      |
| 메시지보드메시지 | `GET`    | `/v1.0/message-board-threads/[messageBoardThreadId]/message-board-messages` | 지정된 스레드에 있는 모든 메시지의 전체 목록을 반환합니다. 결과는 페이지 매김, 필터링, 검색 및 정렬이 가능합니다. |
| 메시지보드메시지 | `PATCH`  | `/v1.0/message-board-messages/[messageBoardMessageId]`                      | 메시지에 대한 API 호출에 지정된 필드만 업데이트합니다.                                   |
| 메시지보드메시지 | `PUT`    | `/v1.0/message-board-messages/[messageBoardMessageId]`                      | 지정된 메시지의 모든 필드를 API 호출에 제공된 필드로 바꿉니다.                              |
| 메시지보드메시지 | `DELETE` | `/v1.0/message-board-messages/[messageBoardMessageId]`                      | 지정된 메시지를 삭제하고 작업이 성공하면 204를 반환합니다.                                 |

## 샘플 cURL 스크립트 검사

다음은 튜토리얼의 cURL 명령의 대표적인 예입니다.

### MessageBoardSection_POST_ToSite.sh

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/curl/MessageBoardSection_POST_ToSite.sh
   :language: bash
```

### MessageBoardSection_PUT_ById.sh

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/curl/MessageBoardSection_PUT_ById.sh
   :language: bash
```

### MessageBoardSections_GET_FromSite.sh

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/curl/MessageBoardSections_GET_FromSite.sh
   :language: bash
```

### MessageBoardSection_DELETE_ById.sh

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/curl/MessageBoardSection_DELETE_ById.sh
   :language: bash
```

### MessageBoardThread_POST_ToSection.sh

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/curl/MessageBoardThread_POST_ToSection.sh
   :language: bash
```

### MessageBoardMessage_POST_ToThread.sh

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/curl/MessageBoardMessage_POST_ToThread.sh
   :language: bash
```

### MessageBoardMessage_POST_ToParent.sh

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/curl/MessageBoardMessage_POST_ToParent.sh
   :language: bash
```

## 샘플 Java 클래스 검사

다음은 튜토리얼의 Java 명령의 대표적인 예입니다.

### MessageBoardSection_POST_ToSite.java

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/java/MessageBoardSection_POST_ToSite.java
   :language: java
   :lines: 4-31
```

### MessageBoardSection_PUT_ById.java

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/java/MessageBoardSection_PUT_ById.java
   :language: java
   :lines: 4-31
```

### MessageBoardSections_GET_FromSite.java

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/java/MessageBoardSections_GET_FromSite.java
   :language: java
   :lines: 6-28
```

### MessageBoardSection_DELETE_ById.java

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/java/MessageBoardSection_DELETE_ById.java
   :language: java
   :lines: 3-21
```

### MessageBoardThread_POST_ToSection.java

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/java/MessageBoardThread_POST_ToSection.java
   :language: java
   :lines: 4-32
```

### MessageBoardMessage_POST_ToThread.java

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/java/MessageBoardMessage_POST_ToThread.java
   :language: java
   :lines: 4-32
```

### MessageBoardMessage_POST_ToParent.java

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/java/MessageBoardMessage_POST_ToParent.java
   :language: java
   :lines: 4-33
```

## 관련 주제

* [메시지 보드 시작하기](../user-guide/getting-started-with-message-boards.md)
* [메시지 보드 구성 참조](./../user-guide/message-boards-configuration-reference.md)
