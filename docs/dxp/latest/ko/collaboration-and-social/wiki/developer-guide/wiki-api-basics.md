# 위키 API 기초

Liferay의 Headless Delivery 애플리케이션은 [Wiki](../getting-started-with-wikis.md) 애플리케이션에 REST 서비스를 제공합니다. 이러한 서비스를 사용하여 Wiki 노드 및 페이지를 추가하고, 해당 정보를 나열하고, 콘텐츠를 수정하거나 모두 제거할 수 있습니다. 여기에서 cURL 명령과 Java 클래스를 사용하여 해당 서비스를 호출합니다.

## 자습서 리소스 준비

자습서를 진행하기 전에 먼저 깨끗한 Liferay Docker 컨테이너를 설정하고 제공된 자습서 코드를 사용할 준비를 합니다.

### Liferay 도커 컨테이너

```{include} /_snippets/run-liferay-portal.md
```

일단 시작되면 사이트 ID를 검색하십시오. 사이트 ID를 찾으려면 **사이트 메뉴**(![사이트 메뉴](../../../images/icon-menu.png))를 열고 **구성** &rarr; **사이트 설정** &rarr; **사이트 구성** .

![사이트 구성 설정에서 사이트 ID를 찾습니다.](./wiki-api-basics/images/01.png)

### 튜토리얼 코드

이 자습서에서는 Headless API를 시연하는 샘플 코드를 제공합니다. 이 코드에는 자습서 전체에서 사용할 수 있는 샘플 cURL 및 Java 파일이 모두 포함되어 있습니다.

다음 명령을 실행하여 [샘플 코드](https://learn.liferay.com/dxp/latest/en/collaboration-and-social/wiki/developer-guide/liferay-q8u2.zip) 를 다운로드하고 압축을 풉니다.

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/collaboration-and-social/wiki/developer-guide/liferay-q8u2.zip -O
```

```bash
unzip liferay-q8u2.zip
```

cURL 스크립트를 사용할 수 있는 동안 실행하려면 먼저 Java 소스 파일을 수동으로 컴파일해야 합니다. 이렇게 하려면 프로젝트의 `java` 폴더로 이동하여 `javac` 명령을 실행합니다.

```bash
cd liferay-q8u2/java
```

```bash
javac -classpath .:* *.java
```

프로젝트에는 `com.liferay.headless.delivery.client.jar` 파일이 종속 항목으로 포함되어 있습니다. `/o/api`에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

제공된 코드에는 `WikiNode` 및 `WikiPage` 서비스용 API가 포함되어 있습니다. 포함된 모든 샘플 API 목록은 [Tutorial Code Reference](#tutorial-code-reference) 참조하십시오.

```{important}
제공된 코드는 데모용으로 기본 인증을 사용합니다. 프로덕션의 경우 [OAuth2](../../../headless-delivery/using-oauth2.md)으로 사용자를 인증해야 합니다.
```

## 샘플 WikiNode API 호출

이 연습에서는 cURL 명령 또는 Java 클래스를 사용하여 `WikiNode` API를 호출할 수 있습니다. 다음 출력 예는 제공된 Java 클래스의 출력과 약간 다른 cURL 명령에 해당합니다.

1. `liferay-q8u2` 프로젝트의 `curl` 또는 `java` 폴더로 이동합니다.

   **cURL의 경우:**

   ```bash
   cd liferay-q8u2/curl
   ```

   **자바의 경우:**

   ```bash
   cd liferay-q8u2/java
   ```

1. 사이트 ID를 매개변수로 사용하여 `WikiNode_POST_ToSite` 을 실행합니다. 이렇게 하면 지정된 사이트에 새 Wiki 노드가 생성됩니다.

   **cURL의 경우:**

   ```bash
   ./WikiNode_POST_ToSite.sh {site-id}
   ```

   **자바의 경우:**

   ```bash
   java -classpath .:* -DsiteId={site-id} WikiNode_POST_ToSite
   ```

   터미널은 새로 생성된 Wiki 노드의 전체 스키마를 표시합니다. 제공된 API 호출은 새 노드에 대한 `설명` 및 `이름` 필드만 정의합니다.

1. 다음 GET, PUT 및 DELETE 메서드와 함께 사용할 노드의 ID를 복사합니다.

   ```json
   {
...
     "description" : "Foo",
     ...
     "id" : 38405,
     "name" : "Able Node",
     ...
   }
   ```

1. 해당 매개변수에 사이트 ID를 사용하여 `WikiNodes_GET_FromSite` 을 실행합니다. 지정된 사이트의 모든 Wiki 노드 목록을 반환합니다.

   **cURL의 경우:**

   ```bash
   ./WikiNodes_GET_FromSite.sh {site-id}
   ```

   **자바의 경우:**

   ```bash
   java -classpath .:* -DsiteId={site-id} WikiNodes_GET_FromSite
   ```

   ```{note}
   모든 DXP/Portal 인스턴스에는 'Main'이라는 기본 Wiki 노드가 있습니다. 이 노드는 생성한 모든 노드와 함께 위 출력에 표시됩니다.
   ```

1. 해당 매개변수에 Wiki 노드 ID를 사용하여 `WikiNode_PUT_ById` 을 실행합니다. 이렇게 하면 지정된 Wiki 노드의 세부 정보가 API 호출에 제공된 세부 정보로 대체됩니다.

   **cURL의 경우:**

   ```bash
   ./WikiNode_PUT_ById.sh {wiki-node-id}
   ```

   **자바의 경우:**

   ```bash
   java -classpath .:* -DwikiNodeId={wiki-node-id} WikiNode_PUT_ById
   ```

   ```json
   {
...
     "description" : "Bar",
     ...
     "id" : 38405,
     "name" : "Baker Node",
     ...
   }
   ```

1. 해당 매개변수에 대해 동일한 Wiki 노드 ID를 사용하여 `WikiNode_DELETE_ById` 을 실행합니다. 이것은 지정된 노드를 삭제합니다.

   **cURL의 경우:**

   ```bash
   ./WikiNode_DELETE_ById.sh {wiki-node-id}
   ```

   **자바의 경우:**

   ```bash
   java -classpath .:* -DwikiNodeId={wiki-node-id} WikiNode_DELETE_ById
   ```

1. 해당 매개변수에 대해 동일한 Wiki 노드 ID를 사용하여 `WikiNode_GET_ById` 을 실행합니다. 지정된 노드가 있는 경우 해당 노드에 대한 세부 정보를 반환합니다.

   **cURL의 경우:**

   ```bash
   ./WikiNode_GET_ById.sh {wiki-node-id}
   ```

   **자바의 경우:**

   ```bash
   java -classpath .:* -DwikiNodeId={wiki-node-id} WikiNode_GET_ById
   ```

   이전 단계에서 노드를 삭제했으므로 다음 메시지를 반환합니다.

   ```json
   {
     "status" : "NOT_FOUND",
     "title" : "No WikiNode exists with the primary key 38405"
   }
   ```

## 샘플 WikiPage API 호출

cURL 명령 또는 Java 클래스를 사용하여 `WikiPage` API를 호출할 수 있습니다. 다음 출력 예는 제공된 Java 클래스의 출력과 약간 다른 cURL 명령에 해당합니다.

1. `liferay-q8u2` 프로젝트의 `curl` 또는 `java` 폴더로 이동합니다.

   **cURL의 경우:**

   ```bash
   cd liferay-q8u2/curl
   ```

   **자바의 경우:**

   ```bash
   cd liferay-q8u2/java
   ```

1. `WikiNode_POST_ToSite` 을 실행하여 Wiki 페이지에 대한 노드를 만듭니다.

   **cURL의 경우:**

   ```bash
   ./WikiNode_POST_ToSite.sh {site-id}
   ```

   **자바의 경우:**

   ```bash
   java -classpath .:* -DsiteId={site-id} WikiNode_POST_ToSite
   ```

   ```{note}
   Wiki 페이지는 Wiki 노드에 저장되므로 Wiki 페이지를 만들려면 하나 이상의 노드가 있어야 합니다.
   ```

1. `WikiPage_POST_ToNode` 호출과 함께 사용하기 위해 출력에서 노드의 ID를 복사합니다.

   ```json
   {
...
     "description" : "Foo",
     ...
     "id" : 38504,
     "name" : "Able Node",
     ...
   }
   ```

1. 위의 노드 ID를 매개변수로 사용하여 `WikiPage_POST_ToNode` 을 실행합니다. 이렇게 하면 지정된 노드에 대한 새 Wiki 페이지가 생성됩니다.

   **cURL의 경우:**

   ```bash
   ./WikiPage_POST_ToNode.sh {wiki-node-id}
   ```

   **자바의 경우:**

   ```bash
   java -classpath .:* -DwikiNodeId={wiki-node-id} WikiPage_POST_ToNode
   ```

1. `WikiPage_POST_ToParent` 호출과 함께 사용할 페이지의 ID를 복사합니다.

   ```json
   {
...
     "content" : "Foo",
     ...
     "description" : "Able Page",
     "encodingFormat" : "text/x-wiki",
     ...
     "headline" : "Able Page",
     "id" : 38506,
     ...
   }
   ```

1. 위의 위키 페이지 ID를 매개변수로 사용하여 `WikiPage_POST_ToParent` 실행합니다. 이렇게 하면 지정된 Wiki 페이지에 대한 하위 페이지가 생성됩니다.

   **cURL의 경우:**

   ```bash
   ./WikiPage_POST_ToNode.sh {wiki-page-id}
   ```

   **자바의 경우:**

   ```bash
   java -classpath .:* -DparentWikiPageId={wiki-page-id} WikiPage_POST_ToParent
   ```

   ```json
   {
...
      "content" : "Foo",
      ...
      "description" : "Charlie Page",
      "encodingFormat" : "text/x-wiki",
      ...
      "headline" : "Charlie Page",
      "id" : 38510,
      ...
   }
   ```

1. 해당 매개변수에 Wiki 노드 ID를 사용하여 `WikiPages_GET_FromNode` 을 실행합니다. 그러면 새로 생성된 Wiki 페이지를 모두 포함하는 지정된 노드에 추가된 모든 Wiki 페이지 목록이 반환됩니다.

   **cURL의 경우:**

   ```bash
   ./WikiPages_GET_FromNode.sh {wiki-node-id}
   ```

   **자바의 경우:**

   ```bash
   java -classpath .:* -DwikiNodeId={wiki-node-id} WikiPages_GET_FromNode
   ```

1. 해당 매개변수에 Wiki 상위 페이지 ID를 사용하여 `WikiPages_GET_FromParent` 을 실행합니다. 이것은 지정된 Wiki 페이지에 대한 기존 하위 페이지를 반환합니다.

   **cURL의 경우:**

   ```bash
   ./WikiPages_GET_FromParent.sh {wiki-page-id}
   ```

   **자바의 경우:**

   ```bash
   java -classpath .:* -DparentWikiPageId={wiki-page-id} WikiPages_GET_FromParent
   ```

1. 위의 Wiki 페이지 ID 중 하나를 매개변수로 사용하여 `WikiPage_PUT_ById` 을 실행합니다. 이렇게 하면 원본 페이지의 콘텐츠가 API 호출에 정의된 콘텐츠로 대체됩니다.

   **cURL의 경우:**

   ```bash
   ./WikiPage_PUT_ById.sh {wiki-page-id}
   ```

   **자바의 경우:**

   ```bash
   java -classpath .:* -DwikiPageId={wiki-page-id} WikiPage_PUT_ById
   ```

   ```json
   {
     "내용" : "바",
...
     "encodingFormat" : "text/x-wiki",
     ...
     "headline": "Baker Page",
     "id" : 38515,
     ...
   }
   ```

1. 해당 매개변수에 대해 원하는 Wiki 페이지 ID를 사용하여 `WikiPage_DELETE_ById` 을 실행합니다. 이것은 지정된 위키 페이지를 삭제합니다.

   **cURL의 경우:**

   ```bash
   ./WikiPage_DELETE_ById.sh {wiki-page-id}
   ```

   **자바의 경우:**

   ```bash
   java -classpath .:* -DwikiPageId={wiki-page-id} WikiPage_DELETE_ById
   ```

1. 삭제된 Wiki 페이지의 ID를 해당 매개변수로 사용하여 `WikiPage_GET_ById` 을 실행합니다. 지정된 페이지가 있는 경우 해당 페이지에 대한 세부 정보를 반환합니다.

   **cURL의 경우:**

   ```bash
   ./WikiPage_GET_ById.sh {wiki-page-id}
   ```

   **자바의 경우:**

   ```bash
   java -classpath .:* -DwikiPageId={wiki-page-id} WikiPage_GET_ById
   ```

   이전 단계에서 페이지가 삭제되었으므로 다음 메시지가 표시됩니다.

   ```json
   {
     "status" : "NOT_FOUND",
     "title" : "No WikiNode exists with the primary key 38515"
   }
   ```

## 튜토리얼 코드 참조

제공된 샘플 코드에는 다음 `WikiNode` 및 `WikiPage` API에 대한 cURL 스크립트 및 Java 클래스가 포함되어 있습니다.

### 샘플 WikiNode API

| 서비스  | HTTP 방법  | HTTP 끝점                           | 묘사                                                                           |
|:---- |:-------- |:--------------------------------- |:---------------------------------------------------------------------------- |
| 위키노드 | `POST`   | `/v1.0/sites/[siteId]/wiki-nodes` | API 호출에 제공된 세부 정보를 사용하여 지정된 사이트에 새 Wiki 노드를 만듭니다.                            |
| 위키노드 | `GET`    | `/v1.0/sites/[siteId]/wiki-nodes` | 지정된 사이트에 있는 모든 Wiki 노드의 전체 목록을 반환합니다. 결과에 페이지를 매기고, 필터링하고, 검색하고, 정렬할 수 있습니다. |
| 위키노드 | `GET`    | `/v1.0/wiki-nodes/[wikiNodeId]`   | 지정된 노드 엔터티에 대한 세부 정보를 반환합니다.                                                 |
| 위키노드 | `PUT`    | `/v1.0/wiki-nodes/[wikiNodeId]`   | 지정된 노드의 세부 정보를 API 호출에 제공된 세부 정보로 바꿉니다.                                      |
| 위키노드 | `DELETE` | `/v1.0/wiki-nodes/[wikiNodeId]`   | 지정된 노드를 삭제하고 작업이 성공하면 204를 반환합니다.                                            |

### 샘플 WikiPage API

| 서비스   | HTTP 방법  | HTTP 끝점                                          | 묘사                                                                                     |
|:----- |:-------- |:------------------------------------------------ |:-------------------------------------------------------------------------------------- |
| 위키페이지 | `POST`   | `/v1.0/wiki-nodes/[wikiNodeId]/wiki-pages`       | API 호출에 제공된 세부 정보를 사용하여 지정된 노드에 새 Wiki 페이지를 만듭니다.                                      |
| 위키페이지 | `POST`   | `/v1.0/wiki-pages/[parentWikiPageId]/wiki-pages` | API 호출에 제공된 세부 정보를 사용하여 지정된 Wiki 페이지에 대한 새 Wiki 하위 페이지를 만듭니다.                          |
| 위키페이지 | `GET`    | `/v1.0/wiki-nodes/[wikiNodeId]/wiki-pages`       | 지정된 Wiki 노드에 추가된 모든 Wiki 페이지의 전체 목록을 반환합니다. 결과에 페이지를 매기고, 필터링하고, 검색하고, 정렬할 수 있습니다.     |
| 위키페이지 | `GET`    | `/v1.0/wiki-pages/[parentWikiPageId]/wiki-pages` | 지정된 Wiki 페이지에 추가된 모든 Wiki 하위 페이지의 전체 목록을 반환합니다. 결과에 페이지를 매기고, 필터링하고, 검색하고, 정렬할 수 있습니다. |
| 위키페이지 | `GET`    | `/v1.0/wiki-pages/[wikiPageId]`                  | 지정된 Wiki 페이지 엔터티에 대한 세부 정보를 반환합니다.                                                     |
| 위키페이지 | `PUT`    | `/v1.0/wiki-pages/[wikiPageId]`                  | 지정된 페이지의 세부정보를 API 호출에 제공된 세부정보로 바꿉니다.                                                 |
| 위키페이지 | `DELETE` | `/v1.0/wiki-pages/[wikiPageId]`                  | 지정된 페이지를 삭제하고 작업이 성공하면 204를 반환합니다.                                                     |

```{important}
Wiki 페이지에 POST 및 PUT 메서드를 사용할 때 `headline` 및 `encodingFormat` 필드를 모두 정의해야 합니다. `headline` 필드는 페이지의 기본 제목을 설정하고 `encodingFormat` 필드는 페이지의 미디어 형식(예: HTML, BBCode 등)을 결정합니다.
```

## 샘플 cURL 스크립트 검사

다음은 튜토리얼의 cURL 명령의 대표적인 예입니다.

```{literalinclude} ./wiki-api-basics/resources/liferay-q8u2.zip/curl/WikiNode_POST_ToSite.sh
   :language: bash
```

### `WikiPage_POST_ToNode.sh`

```{literalinclude} ./wiki-api-basics/resources/liferay-q8u2.zip/curl/WikiPage_POST_ToNode.sh
   :language: bash
```

### `WikiPages_GET_FromNode.sh`

```{literalinclude} ./wiki-api-basics/resources/liferay-q8u2.zip/curl/WikiPages_GET_FromNode.sh
   :language: bash
```

## 샘플 Java 클래스 검사

다음은 자습서의 Java 명령의 대표적인 예입니다.

### `WikiNode_POST_ToSite.java`

```{literalinclude} ./wiki-api-basics/resources/liferay-q8u2.zip/java/WikiNode_POST_ToSite.java
   :language: java
   :lines: 4-28
```

### `WikiPage_POST_ToNode.java`

```{literalinclude} ./wiki-api-basics/resources/liferay-q8u2.zip/java/WikiPage_POST_ToNode.java
   :language: java
   :lines: 4-29
```

### `WikiPages_GET_FromNode.java`

```{literalinclude} ./wiki-api-basics/resources/liferay-q8u2.zip/java/WikiPages_GET_FromNode.java
   :language: java
   :lines: 6-25
```

## 관련 항목

* [Liferay를 헤드리스 플랫폼으로 사용](../../../headless-delivery/using-liferay-as-a-headless-platform.md)
* [휴식 서비스 이용](../../../headless-delivery/consuming-apis/consuming-rest-services.md)
