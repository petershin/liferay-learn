# 채널 API 기본 사항

애플리케이션 메뉴 또는 REST API를 사용하여 채널을 관리할 수 있습니다. [headless-commerce-admin-channel](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-commerce-admin-channel/v1.0/openapi.json) 서비스를 호출하여 채널을 만들고 관리합니다.

## 채널 추가

```{include} /_snippets/run-liferay-dxp.md
```

LiferAy가 실행되면

1. [채널 API 기본 사항](./liferay-a2t5.zip) 을 다운로드하여 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/store-management/developer-guide/liferay-a2t5.zip -O
   ```

   ```bash
   unzip liferay-a2t5.zip
   ```

1. 채널은 인스턴스로 범위가 지정되며 각 채널은 `currencyCode`, `이름`및 `유형`를 지정해야 합니다. 한 가지 유형인 `사이트`은 즉시 사용할 수 있습니다.

   cURL 스크립트를 사용하여 새 채널을 추가하십시오. 명령줄에서 `curl` 폴더로 이동합니다. `Channel_POST_ToInstance.sh` 스크립트를 실행합니다.

   ```bash
   ./Channel_POST_ToInstance.sh
   ```

   JSON 응답은 새 채널이 추가되었음을 보여줍니다.

   ```json
   {
      "currencyCode" : "USD",
      "externalReferenceCode" : "29f395e8-779c-e95e-36f6-844a1ebf00c4",
      "id" : 46901,
      "name" : "Foo",
      "siteGroupId" : 0,
      "type" : "site"
   }
   ```

1. 채널 추가를 확인하려면 **글로벌 메뉴**(![Applications Menu icon](../../images/icon-applications-menu.png))을 열고 **상거래** &rarr; **채널** 로 이동합니다. 새 채널이 나타납니다.

   ![새 채널이 추가되었는지 확인합니다.](./channel-api-basics/images/01.png)

1. 또는 Java 클라이언트를 사용하여 REST 서비스를 호출하십시오. `java` 폴더로 이동하여 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. `Channel_POST_ToInstance` 클래스를 실행합니다.

   ```bash
   java -classpath .:* Channel_POST_ToInstance
   ```

## cURL 명령 검사

`Channel_POST_ToInstance.sh` 스크립트는 cURL 명령으로 REST 서비스를 호출합니다.

```{literalinclude} ./channel-api-basics/resources/liferay-a2t5.zip/curl/Channel_POST_ToInstance.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                                    | 묘사                            |
|:------------------------------------------------------------------------------------- |:----------------------------- |
| `-H "Content-Type: application/json"`                                                 | 요청 본문 형식을 JSON으로 설정합니다.       |
| `-X POST`                                                                             | 지정된 끝점에서 호출할 HTTP 메서드를 설정합니다. |
| `"http://localhost:8080/o/headless-commerce-admin-channel/v1.0/channels"`             | REST 서비스 끝점을 지정합니다.           |
| `-d "{\"currencyCode\": \"USD\", \"name\": \"Foo\", \"type\": \"site\"}"` | 게시할 데이터를 입력합니다.               |
| `-u "test@liferay.com:learn"`                                                         | 기본 인증 자격 증명을 입력합니다.           |

```{note}
여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth 2.0 사용](https://learn.liferay.com/ko/w/dxp/headless-delivery/using-oauth2) 을 통해 사용자를 인증해야 합니다. OAuth2를 사용하는 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증](https://learn.liferay.com/ko/w/dxp/headless-delivery/using-oauth2/using-oauth2-to-authorize-users) 를 참조하세요.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검토

`Channel_POST_ToInstance.java` 클래스는 `ChannelResource` 서비스를 호출하여 채널을 추가합니다.

```{literalinclude} ./channel-api-basics/resources/liferay-a2t5.zip/java/Channel_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                                   | 묘사                                                      |
|:------------------------------------------------------------------------ |:------------------------------------------------------- |
| `ChannelResource.Builder builder = ...`                                  | `ChannelResource` 서비스 인스턴스를 생성하기 위해 `Builder` 가져옵니다.    |
| `ChannelResource channelResource = builder.authentication(...).build();` | 기본 인증을 사용하고 `ChannelResource` 서비스 인스턴스를 생성합니다.          |
| `channelResource.postChannel(...);`                                      | `channelResource.postChannel` 메서드를 호출하고 데이터를 게시에 전달합니다. |

프로젝트는 `com.liferay.headless.commerce.admin.channel.client.jar` 파일을 종속성으로 포함합니다. `/o/api` (예: <http://localhost:8080/o/api>)에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메서드의 주석은 클래스 실행을 보여줍니다.
```

나머지 예제 Java 클래스는 서로 다른 `ChannelResource` 메소드를 호출합니다.

```{important}
[ChannelResource]$LIFERAY_LEARN_PORTAL_GIT_TAG$/com/liferay/headless/commerce/admin/channel/client/resource/v1_0/ChannelResource.java)를 참조하십시오.
```

다음은 cURL과 Java를 사용하여 다른 `채널` REST 서비스를 호출하는 예입니다.

## 인스턴스에서 채널 가져오기

cURL 또는 Java 명령을 사용하여 Liferay 인스턴스의 모든 채널을 나열합니다.

### Channels_GET_FromInstance.sh

명령:

```bash
./Channels_GET_FromInstance.sh
```

부호:

```{literalinclude} ./channel-api-basics/resources/liferay-a2t5.zip/curl/Channels_GET_FromInstance.sh
   :language: bash
```

### Channels_GET_FromInstance.java

명령:

```bash
java -classpath .:* Channels_GET_FromInstance
```

부호:

```{literalinclude} ./channel-api-basics/resources/liferay-a2t5.zip/java/Channels_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 9-19
```

인스턴스의 `채널` 객체는 JSON 형식입니다.

### 채널 필터링, 페이지 매기기, 검색 및 정렬

이 API는 또한 채널 필터링, 페이지 매기기, 검색 및 정렬을 위한 매개변수를 허용합니다. 자세한 내용은 [`getChannelsPage`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-channel-client/src/main/java/com/liferay/headless/commerce/admin/channel/client/resource/v1_0/ChannelResource.java#L43-#L46) 방법을 참조하십시오. 쿼리에서 다음 `채널` 필드를 사용하여 결과를 필터링, 검색 및 정렬할 수 있습니다.

* 이름
* 사이트 그룹 ID

| 필터 쿼리                    | 묘사                              |
|:------------------------ |:------------------------------- |
| `siteGroupId eq '12345'` | 채널 siteGroupId는 12345와 같아야 합니다. |
| `name eq 'Foo'`          | 채널 이름은 Foo와 같아야 합니다.            |

| 쿼리 정렬             | 묘사                              |
|:----------------- |:------------------------------- |
| `name:desc`       | 내림차순으로 이름을 기준으로 정렬합니다.          |
| `siteGroupId:asc` | 오름차순으로 siteGroupId를 기준으로 정렬합니다. |

자세한 내용은 [API 쿼리 매개변수](https://learn.liferay.com/dxp/latest/ko/headless-delivery/consuming-apis/api-query-parameters.html) 참조하세요.

## 채널 확보

cURL 또는 Java `get` 명령을 사용하여 특정 채널을 가져옵니다. `1234` 채널의 ID로 바꿉니다.

```{tip}
`Channels_GET_FromInstance.[java|sh]`를 사용하여 모든 채널 목록을 가져오고 구체적으로 원하는 채널의 `id`를 기록해 둡니다.
```

### Channel_GET_ById.sh

명령:

```bash
./Channel_GET_ById.sh 1234
```

부호:

```{literalinclude} ./channel-api-basics/resources/liferay-a2t5.zip/curl/Channel_GET_ById.sh
   :language: bash
```

### Channel_GET_ById.java

명령:

```bash
java -classpath .:* -DchannelId=1234 Channel_GET_ById
```

부호:

```{literalinclude} ./channel-api-basics/resources/liferay-a2t5.zip/java/Channel_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`채널` 필드는 JSON에 나열됩니다.

## 채널 패치

cURL 및 Java `패치` 명령으로 기존 채널을 업데이트합니다. `1234` 채널 ID로 바꿉니다.

### Channel_PATCH_ById.sh

명령:

```bash
./Channel_PATCH_ById.sh 1234
```

부호:

```{literalinclude} ./channel-api-basics/resources/liferay-a2t5.zip/curl/Channel_PATCH_ById.sh
   :language: bash
```

### Channel_PATCH_ById.java

명령:

```bash
java -classpath .:* -DchannelId=1234 Channel_PATCH_ById
```

부호:

```{literalinclude} ./channel-api-basics/resources/liferay-a2t5.zip/java/Channel_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-23
```

## 채널 삭제

cURL 및 Java `delete` 명령을 사용하여 기존 채널을 삭제합니다. `1234` 채널 ID로 바꿉니다.

### Channel_DELETE_ById.sh

명령:

```bash
./Channel_DELETE_ById.sh 1234
```

부호:

```{literalinclude} ./channel-api-basics/resources/liferay-a2t5.zip/curl/Channel_DELETE_ById.sh
   :language: bash
```

### Channel_DELETE_ById.java

명령

```bash
java -classpath .:* -DchannelId=1234 Channel_DELETE_ById
```

부호:

```{literalinclude} ./channel-api-basics/resources/liferay-a2t5.zip/java/Channel_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[REST 서비스 사용](https://learn.liferay.com/dxp/latest/ko/headless-delivery/consuming-apis/consuming-rest-services.html) 은 `채널` 서비스와 스키마를 보여주고 각 서비스를 테스트하기 위한 인터페이스를 가지고 있습니다.
