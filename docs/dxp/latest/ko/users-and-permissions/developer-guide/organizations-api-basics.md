# 조직 API 기본 사항

응용 프로그램 메뉴에서 조직을 [하고 관리할 수 있지만](../organizations/creating-and-managing-organizations.md) Liferay의 REST API를 사용할 수도 있습니다. 조직을 관리하려면 다음 서비스를 호출하세요.

## 조직 추가

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르세요.

1. [조직 API 기본 사항](./liferay-w2h3.zip) 다운로드 및 압축 해제.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-w2h3.zip -O
   ```

   ```bash
   unzip liferay-w2h3.zip
   ```

1. cURL 스크립트를 사용하여 인스턴스에 새 조직을 추가합니다. 명령줄에서 `curl` 폴더로 이동합니다. `Organization_POST_ToInstance.sh` 스크립트를 실행합니다.

   ```bash
   ./Organization_POST_ToInstance.sh
   ```

   JSON 응답은 새 조직이 추가되었음을 보여줍니다.

   ```json
   {
     "comment": "",
     "customFields": [],
     "dateCreated": "2022-05-19T17:38:19Z",
     "dateModified": "2022-05-19T17:38:19Z",
     "externalReferenceCode": "",
     "id": "40922",
     "keywords": [],
     "location": {},
     "name": "Able",
     "numberOfAccounts": 0,
     "numberOfOrganizations": 0,
     "numberOfUsers": 0,
     "organizationContactInformation": {
       "emailAddresses": [],
       "postalAddresses": [],
       "telephones": [],
       "webUrls": []
     }
   }
   ```

1. **글로벌 메뉴** &rarr; **제어판** &rarr; **사용자 및 조직** 으로 이동합니다. **조직** 탭을 클릭합니다. 새 조직이 추가되었는지 확인하세요.

   ![See that a new organization has been added.](./organizations-api-basics/images/01.png)

1. REST 서비스는 Java 클라이언트를 사용하여 호출할 수도 있습니다. `curl` 폴더에서 `java` 폴더로 이동합니다. 다음 명령을 사용하여 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. 다음 명령을 사용하여 `Organization_POST_ToInstance.java` 클래스를 실행합니다.

   ```bash
   java -classpath .:* Organization_POST_ToInstance
   ```

## cURL 명령 검사

`Organization_POST_ToInstance.sh` 스크립트는 cURL 명령을 사용하여 REST 서비스를 호출합니다.

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/curl/Organization_POST_ToInstance.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                 | 묘사                       |
| :----------------------------------------------------------------- | :----------------------- |
| `-H "Content-Type: application/json"`                              | 요청 본문 형식이 JSON임을 나타냅니다.  |
| `-X POST`                                                          | 지정된 엔드포인트에서 호출할 HTTP 메서드 |
| `"http://localhost:8080/o/headless-admin-user/v1.0/organizations"` | REST 서비스 엔드포인트           |
| `-d "{\"name\": \"Able\"}"`                                        | 귀하가 게시를 요청하는 데이터         |
| `-u "test@liferay.com:learn"`                                      | 기본 인증 자격 증명              |

```{note}
여기서는 데모 목적으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth2](../../headless-delivery/using-oauth2.md) 을 통해 사용자에게 권한을 부여해야 합니다. OAuth2를 사용하는 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증](../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) 참조하세요.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검사

`Organization_POST_ToInstance.java` 클래스는 Organization 관련 서비스를 호출하여 조직을 추가합니다.

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/java/Organization_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-24
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약어)                                                          | 묘사                                                                |
| :--------------------------------------------------------------------------------- | :---------------------------------------------------------------- |
| `OrganizationResource.Builder builder = ...`                                       | `OrganizationResource` 서비스 인스턴스를 생성하기 위한 `Builder`를 가져옵니다.        |
| `OrganizationResource organizationResource = builder.authentication(...).build();` | 기본 인증을 지정하고 'OrganizationResource' 서비스 인스턴스를 생성합니다.               |
| `Organization organization = organizationResource.postOrganization(...);`          | `organizationResource.postOrganization` 메소드를 호출하고 데이터를 게시에 전달합니다. |

프로젝트에는 `com.liferay.headless.admin.user.client.jar` 파일이 종속성으로 포함되어 있습니다. 설치된 API 탐색기의 `/o/api`에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메소드의 주석은 클래스 실행을 보여줍니다.
```
다른 예제 Java 클래스는 이와 유사하지만 다른 `OrganizationResource` 메소드를 호출합니다.

```{important}
서비스 세부정보는 [OrganizationResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-user/headless-admin-user-client/src/main/java/com/liferay/headless/admin/user/client/resource/v1_0/OrganizationResource.java) 참조하세요.
```

다음은 cURL 및 Java를 사용하여 다른 `Organization` REST 서비스를 호출하는 예입니다.

## 인스턴스에서 조직 가져오기

다음 cURL 또는 Java 명령을 실행하여 조직을 나열할 수 있습니다.

### Organizations_GET_FromInstance.sh

명령:

```bash
./Organizations_GET_FromInstance.sh
```

부호:

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/curl/Organizations_GET_FromInstance.sh
   :language: bash
```

### Organizations_GET_FromInstance.java

명령:

```bash
java -classpath .:* Organizations_GET_FromInstance
```

부호:

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/java/Organizations_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

인스턴스의 `Organization` 객체가 JSON에 나타납니다.

## 조직 확보

다음 cURL 또는 Java 명령을 사용하여 특정 조직을 가져옵니다.

```{tip}
``Organizations_GET_FromInstance.[java|sh]``를 사용하여 인스턴스 ``Organization`` ID를 가져옵니다.
```

### Organization_GET_ById.sh

명령:

```bash
./Organization_GET_ById.sh 1234
```

부호:

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/curl/Organization_GET_ById.sh
   :language: bash
```

### Organization_GET_ById.java

명령:

```bash
java -classpath .:* -DorganizationId=1234 Organization_GET_ById
```

부호:

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/java/Organization_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

'조직' 필드는 JSON으로 표시됩니다.

## 조직 패치

다음 cURL 및 Java 명령을 사용하여 기존 조직을 부분적으로 편집합니다. '1234'를 조직의 ID로 바꾸세요.

### Organization_PATCH_ById.sh

명령:

```bash
./Organization_PATCH_ById.sh 1234
```

부호:

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/curl/Organization_PATCH_ById.sh
   :language: bash
```

### Organization_PATCH_ById.java

명령:

```bash
java -classpath .:* -DorganizationId=1234 Organization_PATCH_ById
```

부호:

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/java/Organization_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## 조직을 넣어

다음 cURL 및 Java 명령을 사용하여 기존 조직을 완전히 덮어씁니다. '1234'를 조직의 ID로 바꾸세요.

### Organization_PUT_ById.sh

명령:

```bash
./Organization_PUT_ById.sh 1234
```

부호:

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/curl/Organization_PUT_ById.sh
   :language: bash
```

### Organization_PUT_ById.java

명령:

```bash
java -classpath .:* -DorganizationId=1234 Organization_PUT_ById
```

부호:

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/java/Organization_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## 조직 삭제

다음 cURL 및 Java 명령을 사용하여 기존 조직을 삭제합니다. '1234'를 조직의 ID로 바꾸세요.

### Organization_DELETE_ById.sh

명령:

```bash
./Organization_DELETE_ById.sh 1234
```

부호:

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/curl/Organization_DELETE_ById.sh
   :language: bash
```

### Organization_DELETE_ById.java

명령

```bash
java -classpath .:* -DorganizationId=1234 Organization_DELETE_ById
```

부호:

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/java/Organization_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md) 은 모든 '조직' 서비스와 스키마를 표시하고 각 서비스를 시험해 볼 수 있는 인터페이스를 갖추고 있습니다.

!!! note
   [PostalAddresses_GET_FromOrganization](./postal-address-api-basics.md#get-postal-addresses-from-organization) 로 조직 우편 주소를 가져옵니다.
