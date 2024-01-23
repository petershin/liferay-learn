# 사양 API 기본 사항

애플리케이션 메뉴 또는 REST API를 사용하여 제품 사양을 관리할 수 있습니다. [headless-commerce-admin-catalog](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/openapi.json) 서비스를 호출하여 사양을 만들고 관리합니다.

## 사양 추가

```{include} /_snippets/run-liferay-dxp.md
```

LiferAy가 실행되면

1. [사양 API 기본 사항](./liferay-u9x9.zip) 을 다운로드하여 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/product-management/developer-guide/liferay-u9x9.zip -O
   ```

   ```bash
   unzip liferay-u9x9.zip
   ```

1. 사양은 인스턴스로 범위가 지정되며 각 사양은 고유한 `키` 및 `제목`을 지정해야 합니다.

   cURL 스크립트를 사용하여 새 사양을 추가합니다. 명령줄에서 `curl` 폴더로 이동합니다. `Specification_POST_ToInstance.sh` 스크립트를 실행합니다.

   ```bash
   ./Specification_POST_ToInstance.sh
   ```

   JSON 응답은 새로운 사양이 추가되었음을 보여줍니다.

   ```bash
   {
      "description" : { },
      "facetable" : false,
      "id" : 45936,
      "key" : "foo",
      "title" : {
         "en_US" : "Foo"
      }
   }
   ```

1. 사양 추가를 확인하려면 **글로벌 메뉴**(![Applications Menu icon](../../images/icon-applications-menu.png))을 열고 **상거래** &rarr; **사양** 로 이동합니다. 사양 레이블 탭 아래에 새 사양이 나타납니다.

   ![새 사양이 추가되었는지 확인합니다.](./specification-api-basics/images/01.png)

   ```{note}
   현재 API는 사양 그룹에 사양 레이블을 추가하거나 사양 그룹을 생성할 수 없습니다. 대신 사양 UI를 사용해야 합니다. *Global Menu*(![응용 프로그램 메뉴 아이콘](../../images/icon-applications-menu.png))를 열고 *Commerce* &rarr; *Specifications*로 이동합니다. 자세한 내용은 [사양 그룹](../creating-and-managing-products/products/specifications.md#specification-groups) 을 참조하십시오.
   ```

1. 또는 Java 클라이언트를 사용하여 REST 서비스를 호출하십시오. `java` 폴더로 이동하여 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. `Specification_POST_ToInstance` 클래스를 실행합니다.

   ```bash
   java -classpath .:* Specification_POST_ToInstance
   ```

## cURL 명령 검사

`Specification_POST_ToInstance.sh` 스크립트는 cURL 명령으로 REST 서비스를 호출합니다.

```{literalinclude} ./specification-api-basics/resources/liferay-u9x9.zip/curl/Specification_POST_ToInstance.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                              | 묘사                            |
|:------------------------------------------------------------------------------- |:----------------------------- |
| `-H "Content-Type: application/json"`                                           | 요청 본문 형식을 JSON으로 설정합니다.       |
| `-X POST`                                                                       | 지정된 끝점에서 호출할 HTTP 메서드를 설정합니다. |
| `"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/specifications"` | REST 서비스 끝점을 지정합니다.           |
| `-d "{\"key\": \"foo\", \"title\": {\"en_US\": \"Foo\"}}"`            | 게시할 데이터를 입력합니다.               |
| `-u "test@liferay.com:learn"`                                                   | 기본 인증 자격 증명을 입력합니다.           |

```{note}
여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth 2.0 사용](https://learn.liferay.com/ko/w/dxp/headless-delivery/using-oauth2) 을 통해 사용자를 인증해야 합니다. OAuth2를 사용하는 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증](https://learn.liferay.com/ko/w/dxp/headless-delivery/using-oauth2/using-oauth2-to-authorize-users) 를 참조하세요.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검토

`Specification_POST_ToInstance.java` 클래스는 `SpecificationResource` 서비스를 호출하여 사양을 추가합니다.

```{literalinclude} ./specifications-api-basics/resources/liferay-u9x9.zip/java/Specification_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 11-31
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                                               | 묘사                                                                  |
|:------------------------------------------------------------------------------------ |:------------------------------------------------------------------- |
| `SpecificationResource.Builder builder = ...`                                        | `SpecificationResource` 서비스 인스턴스를 생성하기 위해 `Builder` 가져옵니다.          |
| `SpecificationResource specificationResource = builder.authentication(...).build();` | 기본 인증을 사용하고 `SpecificationResource` 서비스 인스턴스를 생성합니다.                |
| `specificationResource.postSpecification(...);`                                      | `specificationResource.postSpecification` 메서드를 호출하고 데이터를 게시에 전달합니다. |

프로젝트는 `com.liferay.headless.commerce.admin.catalog.client.jar` 파일을 종속성으로 포함합니다. `/o/api` (예: <http://localhost:8080/o/api>)에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메서드의 주석은 클래스 실행을 보여줍니다.
```

나머지 예제 Java 클래스는 서로 다른 `SpecificationResource` 메서드를 호출합니다.

```{important}
[SpecificationResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-catalog-client/src/main/java/com/liferay/headless/commerce/admin/catalog/client/resource/v1_0/SpecificationResource.java) 를 참조하십시오.
```

다음은 cURL과 Java를 사용하여 다른 `사양` REST 서비스를 호출하는 예입니다.

## 인스턴스에서 사양 가져오기

cURL 또는 Java 명령을 사용하여 Liferay 인스턴스의 모든 사양을 나열합니다.

### Specifications_GET_FromInstance.sh

명령:

```bash
./Specifications_GET_FromInstance.sh
```

부호:

```{literalinclude} ./specifications-api-basics/resources/liferay-u9x9.zip/curl/Specifications_GET_FromInstance.sh
   :language: bash
```

### Specifications_GET_FromInstance.java

명령:

```bash
java -classpath .:* Specifications_GET_FromInstance
```

부호:

```{literalinclude} ./specifications-api-basics/resources/liferay-u9x9.zip/java/Specifications_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

인스턴스의 `사양` 개체는 JSON 형식입니다.

### 필터링, 페이지 매기기, 검색 및 정렬 사양

이 API는 사양을 필터링, 페이지 매기기, 검색 및 정렬하기 위한 매개변수도 허용합니다. 자세한 내용은 [`getSpecificationsPage`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-catalog-client/src/main/java/com/liferay/headless/commerce/admin/catalog/client/resource/v1_0/SpecificationResource.java#L43-#L46) 메서드를 참조하십시오. 쿼리에서 다음 `사양` 필드를 사용하여 결과를 필터링, 검색 및 정렬할 수 있습니다.

* 열쇠
* 제목

| 필터 쿼리            | 묘사                  |
|:---------------- |:------------------- |
| `key eq 'foo'`   | 사양 키는 foo와 같아야 합니다. |
| `title eq 'Bar'` | 사양 제목은 Bar여야 합니다.   |

| 쿼리 정렬       | 묘사                    |
|:----------- |:--------------------- |
| `key:desc`  | 키를 기준으로 내림차순으로 정렬합니다. |
| `title:asc` | 제목별로 오름차순으로 정렬합니다.    |

자세한 내용은 [API 쿼리 매개변수](https://learn.liferay.com/dxp/latest/ko/headless-delivery/consuming-apis/api-query-parameters.html) 참조하세요.

## 사양 받기

cURL 또는 Java `get` 명령을 사용하여 특정 사양을 가져옵니다. `1234` 사양의 ID로 바꿉니다.

```{tip}
`Specifications_GET_FromInstance.[java|sh]`를 사용하여 모든 사양 목록을 가져오고 구체적으로 원하는 사양의 `id`를 기록해 둡니다.
```

### Specification_GET_ById.sh

명령:

```bash
./Specification_GET_ById.sh 1234
```

부호:

```{literalinclude} ./specifications-api-basics/resources/liferay-u9x9.zip/curl/Specification_GET_ById.sh
   :language: bash
```

### Specification_GET_ById.java

명령:

```bash
java -classpath .:* -DspecificationId=1234 Specification_GET_ById
```

부호:

```{literalinclude} ./specifications-api-basics/resources/liferay-u9x9.zip/java/Specification_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`사양` 필드는 JSON에 나열됩니다.

## 사양 패치

cURL 및 Java `패치` 명령으로 기존 사양을 업데이트합니다. `1234` 사양의 ID로 바꿉니다.

### Specification_PATCH_ById.sh

명령:

```bash
./Specification_PATCH_ById.sh 1234
```

부호:

```{literalinclude} ./specifications-api-basics/resources/liferay-u9x9.zip/curl/Specification_PATCH_ById.sh
   :language: bash
```

### Specification_PATCH_ById.java

명령:

```bash
java -classpath .:* -DspecificationId=1234 Specification_PATCH_ById
```

부호:

```{literalinclude} ./specifications-api-basics/resources/liferay-u9x9.zip/java/Specification_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 11-30
```

## 사양 삭제

cURL 및 Java `delete` 명령을 사용하여 기존 사양을 삭제합니다. `1234` 사양의 ID로 바꿉니다.

### Specification_DELETE_ById.sh

명령:

```bash
./Specification_DELETE_ById.sh 1234
```

부호:

```{literalinclude} ./specifications-api-basics/resources/liferay-u9x9.zip/curl/Specification_DELETE_ById.sh
   :language: bash
```

### Specification_DELETE_ById.java

명령

```bash
java -classpath .:* -DspecificationId=1234 Specification_DELETE_ById
```

부호:

```{literalinclude} ./specifications-api-basics/resources/liferay-u9x9.zip/java/Specification_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[REST 서비스 사용](https://learn.liferay.com/dxp/latest/ko/headless-delivery/consuming-apis/consuming-rest-services.html) 은 `사양` 서비스 및 스키마를 보여주고 각 서비스를 테스트하기 위한 인터페이스를 가지고 있습니다.
