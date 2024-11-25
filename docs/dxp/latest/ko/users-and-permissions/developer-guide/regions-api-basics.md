# 지역 API 기본 사항

{bdg-secondary}`liferay 7.4 U24+ 및 GA24+`

Liferay의 REST API를 사용하여 지역을 생성하고 관리하세요.

## 지역 추가

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르세요.

1. [지역 API 기본 사항](./liferay-r2p3.zip) 다운로드 및 압축 해제.

   ```bash
   컬 https://resources.learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-r2p3.zip -O
   ```

   ```bash
   unzip liferay-r2p3.zip
   ```

1. cURL 스크립트를 사용하여 국가에 새 지역을 추가합니다. 명령줄에서 `curl` 폴더로 이동합니다. 'Region_POST_ToCountry.sh' 스크립트를 실행합니다.

   ```bash
   ./Region_POST_ToCountry.sh 1234
   ```

   `1234`를 국가 ID로 바꾸세요. 인스턴스 [에서](./countries-api-basics.md#get-countries-from-instance) 국가 가져오기를 사용하여 ID 목록을 가져옵니다.

   JSON 응답은 새 지역이 추가되었음을 보여줍니다.

   ```json
   {
     "active" : true,
     "countryId" : 43501,
     "id" : 43503,
     "name" : "Foo",
     "position" : 0.0,
     "regionCode" : "ABL",
     "title_i18n" : { }
   }
   ```

1. REST 서비스는 Java 클라이언트를 사용하여 호출할 수도 있습니다. `curl` 폴더에서 `java` 폴더로 이동합니다. 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. `Region_POST_ToCountry.java` 클래스를 실행합니다.

   ```bash
   java -classpath .:* -DcountryId=1234 Region_POST_ToCountry
   ```

## cURL 명령 검사

'Region_POST_ToCountry.sh' 스크립트는 cURL 명령을 사용하여 REST 서비스를 호출합니다.

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/curl/Region_POST_ToCountry.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                             | 묘사                       |
| :----------------------------------------------------------------------------- | :----------------------- |
| `-H "Content-Type: application/json"`                                          | 요청 본문 형식이 JSON임을 나타냅니다.  |
| `-X POST`                                                                      | 지정된 엔드포인트에서 호출할 HTTP 메서드 |
| `"http://localhost:8080/o/headless-admin-address/v1.0/countries/${1}/regions"` | REST 서비스 엔드포인트           |
| `-d "{\"name\": \"Foo\", \"regionCode\": \"ABL\"}"`                            | 귀하가 게시를 요청하는 데이터         |
| `-u "test@liferay.com:learn"`                                                  | 기본 인증 자격 증명              |

```{note}
여기서는 데모 목적으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth2](../../headless-delivery/using-oauth2.md) 을 통해 사용자에게 권한을 부여해야 합니다. OAuth2를 사용하는 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증](../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) 참조하세요.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검사

`Region_POST_ToCountry.java` 클래스는 지역 관련 서비스를 호출하여 지역을 추가합니다.

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/java/Region_POST_ToCountry.java
   :dedent: 1
   :language: java
   :lines: 9-26
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약어)                                              | 묘사                                                    |
| :--------------------------------------------------------------------- | :---------------------------------------------------- |
| `RegionResource.Builder builder = ...`                                 | 'RegionResource' 서비스 인스턴스를 생성하기 위한 'Builder'를 가져옵니다.  |
| `RegionResource regionResource = builder.authentication(...).build();` | 기본 인증을 지정하고 `RegionResource` 서비스 인스턴스를 생성합니다.         |
| `Region region = regionResource.postRegion(...);`                      | `regionResource.postRegion` 메소드를 호출하고 데이터를 게시에 전달합니다. |

프로젝트에는 `com.liferay.headless.admin.address.client.jar` 파일이 종속성으로 포함되어 있습니다. 설치된 API 탐색기의 `/o/api`에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메소드의 주석은 클래스 실행을 보여줍니다.
```
다른 예제 Java 클래스는 이와 유사하지만 다른 `RegionResource` 메소드를 호출합니다.

```{important}
서비스 세부정보는 [RegionResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-address/headless-admin-address-client/src/main/java/com/liferay/headless/admin/address/client/resource/v1_0/RegionResource.java) 참조하세요.
```

다음은 cURL 및 Java를 사용하여 다른 `Region` REST 서비스를 호출하는 예입니다.

## 인스턴스에서 지역 가져오기

다음 cURL 또는 Java 명령을 실행하여 지역을 나열할 수 있습니다.

### Regions_GET_FromInstance.sh

명령:

```bash
./Regions_GET_FromInstance.sh
```

부호:

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/curl/Regions_GET_FromInstance.sh
   :language: bash
```

### Regions_GET_FromInstance.java

명령:

```bash
java -classpath .:* Regions_GET_FromInstance
```

부호:

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/java/Regions_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

인스턴스의 `Region` 객체가 JSON에 표시됩니다.

## 지역 가져오기

다음 cURL 또는 Java 명령을 사용하여 특정 지역을 가져옵니다.

```{tip}
``Regions_GET_FromInstance.[java|sh]``를 사용하여 인스턴스 ``Region`` ID를 가져옵니다.
```

### Region_GET_ById.sh

명령:

```bash
./Region_GET_ById.sh 1234
```

부호:

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/curl/Region_GET_ById.sh
   :language: bash
```

### Region_GET_ById.java

명령:

```bash
java -classpath .:* -DregionId=1234 Region_GET_ById
```

부호:

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/java/Region_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

'지역' 필드는 JSON에 표시됩니다.

## 지역 패치

다음 cURL 및 Java 명령을 사용하여 기존 지역을 부분적으로 편집합니다. '1234'를 해당 지역의 ID로 바꾸세요.

### Region_PATCH_ById.sh

명령:

```bash
./Region_PATCH_ById.sh 1234
```

부호:

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/curl/Region_PATCH_ById.sh
   :language: bash
```

### Region_PATCH_ById.java

명령:

```bash
java -classpath .:* -DregionId=1234 Region_PATCH_ById
```

부호:

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/java/Region_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## 지역을 넣어

다음 cURL 및 Java 명령을 사용하여 기존 영역을 완전히 덮어씁니다. '1234'를 해당 지역의 ID로 바꾸세요.

### Region_PUT_ById.sh

명령:

```bash
./Region_PUT_ById.sh 1234
```

부호:

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/curl/Region_PUT_ById.sh
   :language: bash
```

### Region_PUT_ById.java

명령:

```bash
java -classpath .:* -DregionId=1234 Region_PUT_ById
```

부호:

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/java/Region_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-26
```

## 지역 삭제

다음 cURL 및 Java 명령을 사용하여 기존 지역을 삭제합니다. '1234'를 해당 지역의 ID로 바꾸세요.

### Region_DELETE_ById.sh

명령:

```bash
./Region_DELETE_ById.sh 1234
```

부호:

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/curl/Region_DELETE_ById.sh
   :language: bash
```

### Region_DELETE_ById.java

명령

```bash
java -classpath .:* -DregionId=1234 Region_DELETE_ById
```

부호:

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/java/Region_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md) 에는 모든 'Region' 서비스와 스키마가 표시되며 각 서비스를 시험해 볼 수 있는 인터페이스가 있습니다.
