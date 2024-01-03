# 국가 API 기본 사항

{bdg-secondary}`liferay 7.4 U24+ 및 GA24+`

Liferay의 Rest API를 사용하여 국가를 생성하고 관리하세요.

## 국가 추가

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르세요.

1. [개 국가 API 기본 사항](./liferay-g6m8.zip) 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-g6m8.zip -O
   ```

   ```bash
   unzip liferay-g6m8.zip
   ```

1. cURL 스크립트를 사용하여 인스턴스에 새 국가를 추가합니다. 명령줄에서 `curl` 폴더로 이동합니다. `Country_POST_ToInstance.sh` 스크립트를 실행합니다.

   ```bash
   ./Country_POST_ToInstance.sh
   ```

   JSON 응답은 새로운 국가가 추가되었음을 보여줍니다.

   ```json
   {
     "a2" : "AB",
     "a3" : "ABL",
     "active" : true,
     "billingAllowed" : true,
     "groupFilterEnabled" : false,
     "id" : 43501,
     "name" : "Foo",
     "number" : 1234,
     "position" : 0.0,
     "regions" : [ ],
     "shippingAllowed" : true,
     "subjectToVAT" : false,
     "title_i18n" : { },
     "zipRequired" : true
   }
   ```

1. REST 서비스는 Java 클라이언트를 사용하여 호출할 수도 있습니다. `curl` 폴더에서 `java` 폴더로 이동합니다. 다음과 같이 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. `Country_POST_ToInstance.java` 클래스를 실행합니다.

   ```bash
   java -classpath .:* Country_POST_ToInstance
   ```

## cURL 명령 검사

`Country_POST_ToInstance.sh` 스크립트는 cURL 명령을 사용하여 REST 서비스를 호출합니다.

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/curl/Country_POST_ToInstance.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                                | 묘사                       |
| :-------------------------------------------------------------------------------- | :----------------------- |
| `-H "Content-Type: application/json"`                                             | 요청 본문 형식이 JSON임을 나타냅니다.  |
| `-X POST`                                                                         | 지정된 엔드포인트에서 호출할 HTTP 메서드 |
| `"http://localhost:8080/o/headless-admin-address/v1.0/countries"`                 | REST 서비스 엔드포인트           |
| `-d "{\"a2\": \"AB\", \"a3\": \"ABL\", \"name\": \"Foo\", \"number\": \"1234\"}"` | 귀하가 게시를 요청하는 데이터         |
| `-u "test@liferay.com:learn"`                                                     | 기본 인증 자격 증명              |

```{note}
여기서는 데모 목적으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth2](../../headless-delivery/using-oauth2.md) 을 통해 사용자에게 권한을 부여해야 합니다. OAuth2를 사용하는 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증](../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) 참조하세요.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검사

`Country_POST_ToInstance.java` 클래스는 국가 관련 서비스를 호출하여 국가를 추가합니다.

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/java/Country_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-27
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약어)                                                | 묘사                                                      |
| :----------------------------------------------------------------------- | :------------------------------------------------------ |
| `CountryResource.Builder builder = ...`                                  | 'CountryResource' 서비스 인스턴스를 생성하기 위한 'Builder'를 가져옵니다.   |
| `CountryResource countryResource = builder.authentication(...).build();` | 기본 인증을 지정하고 `CountryResource` 서비스 인스턴스를 생성합니다.          |
| `Country country = countryResource.postCountry(...);`                    | `countryResource.postCountry` 메소드를 호출하고 데이터를 게시에 전달합니다. |

프로젝트에는 `com.liferay.headless.admin.address.client.jar` 파일이 종속성으로 포함되어 있습니다. 설치된 API 탐색기의 `/o/api`에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메소드의 주석은 클래스 실행을 보여줍니다.
```

다른 예제 Java 클래스는 이와 유사하지만 다른 `CountryResource` 메소드를 호출합니다.

```{important}
서비스 세부정보는 [CountryResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-address/headless-admin-address-client/src/main/java/com/liferay/headless/admin/address/client/resource/v1_0/CountryResource.java) 참조하세요.
```

다음은 cURL 및 Java를 사용하여 다른 `Country` REST 서비스를 호출하는 예입니다.

## 인스턴스에서 국가 가져오기

다음 cURL 또는 Java 명령을 실행하여 국가를 나열할 수 있습니다.

### Countries_GET_FromInstance.sh

명령:

```bash
./Countries_GET_FromInstance.sh
```

부호:

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/curl/Countries_GET_FromInstance.sh
   :language: bash
```

### Countries_GET_FromInstance.java

명령:

```bash
java -classpath .:* Countries_GET_FromInstance
```

부호:

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/java/Countries_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

인스턴스의 `Country` 객체가 JSON에 표시됩니다.

## 국가를 얻으세요

다음 cURL 또는 Java 명령을 사용하여 특정 국가를 가져옵니다.

```{tip}
``Countries_GET_FromInstance.[java|sh]``를 사용하여 인스턴스 ``Country`` ID를 가져옵니다.
```
### Country_GET_ById.sh

명령:

```bash
./Country_GET_ById.sh 1234
```

부호:

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/curl/Country_GET_ById.sh
   :language: bash
```

### Country_GET_ById.java

명령:

```bash
java -classpath .:* -DcountryId=1234 Country_GET_ById
```

부호:

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/java/Country_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

'국가' 필드는 JSON에 표시됩니다.

## 국가 패치

다음 cURL 및 Java 명령을 사용하여 기존 국가를 부분적으로 편집합니다. '1234'를 해당 국가의 ID로 바꾸세요.

### Country_PATCH_ById.sh

명령:

```bash
./Country_PATCH_ById.sh 1234
```

부호:

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/curl/Country_PATCH_ById.sh
   :language: bash
```

### Country_PATCH_ById.java

명령:

```bash
java -classpath .:* -DcountryId=1234 Country_PATCH_ById
```

부호:

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/java/Country_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## 국가를 넣어

다음 cURL 및 Java 명령을 사용하여 기존 국가를 완전히 덮어씁니다. '1234'를 해당 국가의 ID로 바꾸세요.

### Country_PUT_ById.sh

명령:

```bash
./Country_PUT_ById.sh 1234
```

부호:

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/curl/Country_PUT_ById.sh
   :language: bash
```

### Country_PUT_ById.java

명령:

```bash
java -classpath .:* -DcountryId=1234 Country_PUT_ById
```

부호:

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/java/Country_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-28
```

## 국가 삭제

다음 cURL 및 Java 명령을 사용하여 기존 국가를 삭제합니다. '1234'를 해당 국가의 ID로 바꾸세요.

### Country_DELETE_ById.sh

명령:

```bash
./Country_DELETE_ById.sh 1234
```

부호:

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/curl/Country_DELETE_ById.sh
   :language: bash
```

### Country_DELETE_ById.java

명령

```bash
java -classpath .:* -DcountryId=1234 Country_DELETE_ById
```

부호:

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/java/Country_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md) 은 모든 `Country` 서비스와 스키마를 표시하고 각 서비스를 시험해 볼 수 있는 인터페이스를 갖추고 있습니다.
