# 탐색 메뉴 API 기본 사항

Liferay의 REST API는 Liferay의 탐색 메뉴에 대한 서비스를 제공합니다. API를 사용하여 탐색 메뉴를 만들고 편집할 수 있습니다. 새 탐색 메뉴를 추가하는 예를 살펴보는 것부터 시작하십시오.

## 탐색 메뉴 추가

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르세요.

1. [Categories and Vocabulary API Basics](./liferay-p7s4.zip) 을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/site-building/site-navigation/developer-guide/liferay-p7s4.zip -O
   ```

   ```bash
   unzip liferay-p7s4.zip
   ```

2. [사이트 ID 찾기](../../../headless-delivery/consuming-apis/consuming-rest-services.md#identify-the-site-containing-the-data) . 아래의 다른 서비스 호출에서 이것을 사용합니다.

3. cURL 스크립트를 사용하여 사이트에 새 탐색 메뉴를 추가하십시오. 명령줄에서 `curl` 폴더로 이동합니다. 사이트 ID를 매개변수로 사용하여 `NavigationMenu_POST_ToSite.sh` 스크립트를 실행합니다.

    ```bash
    ./NavigationMenu_POST_ToSite.sh 1234
    ```

    JSON 응답은 새로운 탐색 메뉴가 추가되었음을 보여줍니다.

    ```bash
    "creator" : {
    "additionalName" : "",
    "contentType" : "UserAccount",
    "familyName" : "Test",
    "givenName" : "Test",
    "id" : 20129,
    "name" : "Test Test"
    },
    "dateCreated" : "2021-09-09T21:41:31Z",
    "dateModified" : "2021-09-09T21:41:31Z",
    "id" : 40131,
    "name" : "Foo",
    "navigationMenuItems" : [ ],
    "siteId" : 20125

    ```

4. *관리 메뉴* &rarr; *사이트 빌더* &rarr; *탐색 메뉴*로 이동하여 탐색 메뉴 애플리케이션으로 이동합니다. 새로운 내비게이션 메뉴가 추가된 것을 확인하세요.

    ![새로운 탐색 메뉴가 추가되었는지 확인하십시오.](./navigation-menu-api-basics/images/01.png)

5. REST 서비스는 Java 클라이언트를 사용하여 호출할 수도 있습니다. `curl` 폴더에서 `java` 폴더로 이동합니다. 다음 명령을 사용하여 소스 파일을 컴파일합니다.

    ```bash
    javac -classpath .:* *.java
    ```

6. 다음 명령으로 `NavigationMenu_POST_ToSite` 클래스를 실행합니다. `siteId` 값을 사이트 ID로 바꿉니다.

    ```bash
    java -classpath .:* -DsiteId=1234 NavigationMenu_POST_ToSite
    ```

## cURL 명령 검사

`NavigationMenu_POST_ToSite.sh` 스크립트는 cURL 명령으로 REST 서비스를 호출합니다.

```{literalinclude} ./navigation-menu-api-basics/resources/liferay-p7s4.zip/curl/NavigationMenu_POST_ToSite.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                             | 묘사                      |
|:------------------------------------------------------------------------------ |:----------------------- |
| `-H "Content-Type: application/json"`                                          | 요청 본문 형식이 JSON임을 나타냅니다. |
| `-X POST`                                                                      | 지정된 끝점에서 호출할 HTTP 메서드   |
| `"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/navigation-menus"` | REST 서비스 끝점             |
| `-d "{\"name\": \"Foo\"}"`                                                 | 게시를 요청하는 데이터            |
| `-u "test@liferay.com:learn"`                                                  | 기본 인증 자격 증명             |

```{note}
여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth2](../../../headless-delivery/using-oauth2.md)을 통해 사용자를 인증해야 합니다. OAuth2를 사용하는 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증하기](../../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md)를 참조하세요.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검토

`NavigationMenu_POST_ToSite.java` 클래스는 내비게이션 메뉴 관련 서비스를 호출하여 내비게이션 메뉴를 추가한다.

```{literalinclude} ./navigation-menu-api-basics/resources/liferay-p7s4.zip/java/NavigationMenu_POST_ToSite.java
   :dedent: 1
   :language: java
   :lines: 9-27
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                                                 | 묘사                                                                         |
|:-------------------------------------------------------------------------------------- |:-------------------------------------------------------------------------- |
| `NavigationMenuResource.Builder builder = ...`                                         | `NavigationMenuResource` 서비스 인스턴스를 생성하기 위한 `빌더` 을 가져옵니다.                   |
| `NavigationMenuResource navigationMenuResource = builder.authentication(...).build();` | 기본 인증을 지정하고 `NavigationMenuResource` 서비스 인스턴스를 생성합니다.                      |
| `NavigationMenu navigationMenu = navigationMenuResource.postSiteNavigationMenu(...);`  | `navigationMenuResource.postSiteNavigationMenu` 메서드를 호출하고 데이터를 게시물에 전달합니다. |

프로젝트에는 `com.liferay.headless.delivery.client.jar` 파일이 종속 항목으로 포함되어 있습니다. `/o/api`에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
``main`` 메소드의 주석은 클래스 실행을 보여줍니다.
```

다른 예제 Java 클래스는 이 클래스와 비슷하지만 다른 `NavigationMenuResource` 메서드를 호출합니다.

```{important}
[NavigationMenuResource]$LIFERAY_LEARN_PORTAL_GIT_TAG$/delivery/client/resource/v1_0/NavigationMenuResource.java)를 참조하십시오.
```

다음은 cURL 및 Java를 사용하여 다른 `NavigationMenu` REST 서비스를 호출하는 예입니다.

## 사이트에서 탐색 메뉴 가져오기

다음 cURL 또는 Java 명령을 실행하여 사이트의 탐색 메뉴를 나열할 수 있습니다. 위와 같이 `1234` 을 사이트 ID로 바꿉니다.

### NavigationMenus_GET_FromSite.sh

명령:

```bash
./NavigationMenus_GET_FromSite.sh 1234
```

부호:

```{literalinclude} ./navigation-menu-api-basics/resources/liferay-p7s4.zip/curl/NavigationMenus_GET_FromSite.sh
   :language: bash
```

### NavigationMenus_GET_FromSite.java

명령:

```bash
java -classpath .:* -DsiteId=1234 NavigationMenus_GET_FromSite
```

부호:

```{literalinclude} ./navigation-menu-api-basics/resources/liferay-p7s4.zip/java/NavigationMenus_GET_FromSite.java
   :dedent: 1
   :language: java
   :lines: 11-25
```

사이트의 `NavigationMenu` 개체는 JSON으로 나열됩니다.

## 탐색 메뉴 가져오기

다음 cURL 또는 Java 명령을 사용하여 특정 탐색 메뉴를 가져옵니다. `1234` 을 탐색 메뉴의 ID로 바꿉니다.

```{tip}
``NavigationMenu`` ID를 얻으려면 ``NavigationMenus_GET_FromSite.[java|sh]``를 사용하십시오.
```

### NavigationMenu_GET_ById.sh

명령:

```bash
./NavigationMenu_GET_ById.sh 1234
```

부호:

```{literalinclude} ./navigation-menu-api-basics/resources/liferay-p7s4.zip/curl/NavigationMenu_GET_ById.sh
   :language: bash
```

### NavigationMenu_GET_ById.java

명령:

```bash
java -classpath .:* -DnavigationMenuId=1234 NavigationMenu_GET_ById
```

부호:

```{literalinclude} ./navigation-menu-api-basics/resources/liferay-p7s4.zip/java/NavigationMenu_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

`NavigationMenu` 필드는 JSON에 나열됩니다.

## 탐색 메뉴 넣기

다음 cURL 및 Java 명령을 사용하여 기존 탐색 메뉴를 완전히 덮어씁니다. `1234` 을 탐색 메뉴의 ID로 바꾸십시오.

### NavigationMenu_PUT_ById.sh

명령:

```bash
./NavigationMenu_PUT_ById.sh 1234
```

부호:

```{literalinclude} ./navigation-menu-api-basics/resources/liferay-p7s4.zip/curl/NavigationMenu_PUT_ById.sh
   :language: bash
```

### NavigationMenu_PUT_ById.java

명령:

```bash
java -classpath .:* -DnavigationMenuId=1234 NavigationMenu_PUT_ById
```

부호:

```{literalinclude} ./navigation-menu-api-basics/resources/liferay-p7s4.zip/java/NavigationMenu_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-27
```

## 탐색 메뉴 삭제

다음 cURL 및 Java 명령을 사용하여 기존 탐색 메뉴를 삭제합니다. `1234` 을 탐색 메뉴의 ID로 바꾸십시오.

### NavigationMenu_DELETE_ById.sh

명령:

```bash
./NavigationMenu_DELETE_ById.sh 1234
```

부호:

```{literalinclude} ./navigation-menu-api-basics/resources/liferay-p7s4.zip/curl/NavigationMenu_DELETE_ById.sh
   :language: bash
```

### NavigationMenu_DELETE_ById.java

명령

```bash
java -classpath .:* -DnavigationMenuId=1234 NavigationMenu_DELETE_ById
```

부호:

```{literalinclude} ./navigation-menu-api-basics/resources/liferay-p7s4.zip/java/NavigationMenu_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

[API Explorer](../../../headless-delivery/consuming-apis/consuming-rest-services.md) 은 `NavigationMenu` 서비스 및 스키마를 모두 나열하고 각 서비스를 시험해 볼 수 있는 인터페이스가 있습니다.
