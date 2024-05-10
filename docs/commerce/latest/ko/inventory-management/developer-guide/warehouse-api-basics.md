# 창고 API 기본 사항

애플리케이션 메뉴 또는 REST API에서 웨어하우스를 관리할 수 있습니다. [headless-commerce-admin-inventory](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-commerce-admin-inventory/v1.0/openapi.json) 서비스를 호출하여 창고를 만들고 관리합니다.

## 창고 추가

```{include} /_snippets/run-liferay-dxp.md
```

Liferay가 실행되면,

1. [Warehouse API 기본 사항](./liferay-v9s5.zip) 을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/inventory-management/developer-guide/liferay-v9s5.zip -O
   ```

   ```bash
   unzip liferay-v9s5.zip
   ```

1. 창고는 인스턴스로 범위가 지정됩니다. cURL 스크립트를 사용하여 새 창고를 추가하십시오. 명령줄에서 `curl` 폴더로 이동합니다. `Warehouse_POST_ToInstance.sh` 스크립트를 실행합니다.

   ```bash
   ./Warehouse_POST_ToInstance.sh
   ```

   JSON 응답은 새 창고가 추가되었음을 보여줍니다.

   ```bash
   {
      "actions" : {
         "permissions" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/headless-commerce-admin-inventory/v1.0/warehouses/46429"
         },
         "get" : {
            "method" : "GET",
            "href" : "http://localhost:8080/o/headless-commerce-admin-inventory/v1.0/warehouses"
         },
         "update" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/headless-commerce-admin-inventory/v1.0/warehouses/46429"
         },
         "delete" : {
            "method" : "DELETE",
            "href" : "http://localhost:8080/o/headless-commerce-admin-inventory/v1.0/warehouses/46429"
         }
      },
      "active" : false,
      "city" : "",
      "countryISOCode" : "",
      "description" : { },
      "externalReferenceCode" : "c441eb70-dcd4-e040-92e5-eae0727cc958",
      "id" : 46429,
      "latitude" : 0.0,
      "longitude" : 0.0,
      "name" : {
         "en_US" : "Foo"
      },
      "regionISOCode" : "",
      "street1" : "",
      "street2" : "",
      "street3" : "",
      "type" : "",
      "zip" : ""
   }
   ```

1. 창고 추가를 확인하려면 **전역 메뉴**(![Applications Menu icon](../../images/icon-applications-menu.png))을 열고 **Commerce** &rarr; **Warehouses** 로 이동합니다. 새로운 창고가 나타납니다.

   ![창고가 추가되었는지 확인합니다.](./warehouse-api-basics/images/01.png)

   ```{note}
   새 창고가 비활성 상태입니다. 활성화하기 전에 `위도` 및 `경도` 좌표를 설정하십시오.
   ```

1. 또는 Java 클라이언트를 사용하여 REST 서비스를 호출하십시오. `java` 폴더로 이동하여 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. `Warehouse_POST_ToInstance` 클래스를 실행합니다.

   ```bash
   java -classpath .:* Warehouse_POST_ToInstance
   ```

## cURL 명령 검사

`Warehouse_POST_ToInstance.sh` 스크립트는 cURL 명령으로 REST 서비스를 호출합니다.

```{literalinclude} ./warehouse-api-basics/resources/liferay-v9s5.zip/curl/Warehouse_POST_ToInstance.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                            | 설명                            |
|:----------------------------------------------------------------------------- |:----------------------------- |
| `-H "Content-Type: application/json"`                                         | 요청 본문 형식을 JSON으로 설정합니다.       |
| `-X POST`                                                                     | 지정된 끝점에서 호출할 HTTP 메서드를 설정합니다. |
| `"http://localhost:8080/o/headless-commerce-admin-inventory/v1.0/warehouses"` | REST 서비스 끝점을 지정합니다.           |
| `-d "{\"active\": false, \"name\": {\"en_US\": \"Foo\"}}"`            | 게시할 데이터를 입력합니다.               |
| `-u "test@liferay.com:learn"`                                                 | 기본 인증 자격 증명을 입력합니다.           |

```{note}
여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth 2.0 사용](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2) 을 통해 사용자를 인증해야 합니다. 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2/using-oauth2-to-authorize-users) 를 참조하세요. OAuth2를 사용합니다.
```

다른 cURL 명령은 유사한 JSON 인수를 사용합니다.

## Java 클래스 검토

`Warehouse_POST_ToInstance.java` 클래스는 `WarehouseResource` 서비스를 호출하여 창고를 추가합니다.

```{literalinclude} ./warehouse-api-basics/resources/liferay-v9s5.zip/java/Warehouse_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 11-30
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                                       | 설명                                                           |
|:---------------------------------------------------------------------------- |:------------------------------------------------------------ |
| `WarehouseResource.Builder builder = ...`                                    | `WarehouseResource` 서비스 인스턴스를 생성하기 위해 `Builder` 가져옵니다.       |
| `WarehouseResource warehouseResource = builder.authentication(...).build();` | 기본 인증을 사용하고 `WarehouseResource` 서비스 인스턴스를 생성합니다.             |
| `warehouseResource.postWarehouse(...);`                                      | `WarehouseResource.postWarehouse` 메소드를 호출하고 데이터를 게시에 전달하십시오. |

프로젝트는 `com.liferay.headless.commerce.admin.inventory.client.jar` 파일을 종속성으로 포함합니다. `/o/api` (예: <http://localhost:8080/o/api>)에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메서드의 주석은 클래스 실행을 보여줍니다.
```

나머지 예제 Java 클래스는 서로 다른 `WarehouseResource` 메소드를 호출합니다.

```{important}
[WarehouseResource]$LIFERAY_LEARN_PORTAL_GIT_TAG$/com/liferay/headless/commerce/admin/inventory/client/resource/v1_0/WarehouseResource.java)를 참조하십시오.
```

다음은 cURL 및 Java를 사용하여 다른 `Warehouse` REST 서비스를 호출하는 예입니다.

## 인스턴스에서 창고 가져오기

cURL 또는 Java 명령을 사용하여 Liferay 인스턴스의 모든 창고를 나열합니다.

### Warehouses_GET_FromInstance.sh

명령:

```bash
./Warehouses_GET_FromInstance.sh
```

암호:

```{literalinclude} ./warehouse-api-basics/resources/liferay-v9s5.zip/curl/Warehouses_GET_FromInstance.sh
   :language: bash
```

### Warehouses_GET_FromInstance.java

명령:

```bash
java -classpath .:* Warehouses_GET_FromInstance
```

암호:

```{literalinclude} ./warehouse-api-basics/resources/liferay-v9s5.zip/java/Warehouses_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

인스턴스의 `Warehouse` 객체는 JSON 형식입니다.

### 웨어하우스 필터링, 페이지 매기기 및 정렬

이 API는 웨어하우스를 필터링, 페이지 매기기 및 정렬하기 위한 매개변수도 허용합니다. 자세한 내용은 [`getWarehousesPage`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-inventory-client/src/main/java/com/liferay/headless/commerce/admin/inventory/client/resource/v1_0/WarehouseResource.java#L43-#L45) 방법을 참조하십시오. 쿼리에서 다음 `창고` 필드를 사용하여 결과를 필터링하고 정렬할 수 있습니다.

* 활동적인
* 도시
* 국가ISO코드
* 위도
* 경도
* 이름
* 지역ISO코드
* 거리1

| 필터 쿼리              | 설명                     |
|:------------------ |:---------------------- |
| `active eq true`   | 창고가 활성 상태여야 합니다.       |
| `name eq 'Foo'`    | 창고 이름은 'Foo'와 같아야 합니다. |
| `latitude eq 12.0` | 창고 위도는 12.0이어야 합니다.    |

| 쿼리 정렬                 | 설명                    |
|:--------------------- |:--------------------- |
| `name:desc`           | 내림차순으로 이름별로 정렬        |
| `countryISOCode:desc` | 국가 ISO 코드별로 내림차순으로 정렬 |

자세한 내용은 [API 쿼리 매개변수](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/api-query-parameters) 참조하세요.

## 창고 확보

cURL 또는 Java `get` 명령을 사용하여 특정 웨어하우스를 가져옵니다. `1234` 창고 ID로 바꿉니다.

```{tip}
`Warehouses_GET_FromInstance.[java|sh]`를 사용하여 모든 창고 목록을 가져오고 구체적으로 원하는 창고의 `id`를 기록하십시오.
```

### Warehouse_GET_ById.sh

명령:

```bash
./Warehouse_GET_ById.sh 1234
```

암호:

```{literalinclude} ./warehouse-api-basics/resources/liferay-v9s5.zip/curl/Warehouse_GET_ById.sh
   :language: bash
```

### Warehouse_GET_ById.java

명령:

```bash
java -classpath .:* -DwarehouseId=1234 Warehouse_GET_ById
```

암호:

```{literalinclude} ./warehouse-api-basics/resources/liferay-v9s5.zip/java/Warehouse_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`창고` 필드는 JSON으로 나열됩니다.

## 웨어하우스 패치

cURL 및 Java `패치` 명령으로 기존 웨어하우스를 업데이트합니다. `1234` 창고 ID로 바꿉니다.

### Warehouse_PATCH_ById.sh

명령:

```bash
./Warehouse_PATCH_ById.sh 1234
```

암호:

```{literalinclude} ./warehouse-api-basics/resources/liferay-v9s5.zip/curl/Warehouse_PATCH_ById.sh
   :language: bash
```

### Warehouse_PATCH_ById.java

명령:

```bash
java -classpath .:* -DwarehouseId=1234 Warehouse_PATCH_ById
```

암호:

```{literalinclude} ./warehouse-api-basics/resources/liferay-v9s5.zip/java/Warehouse_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 11-29
```

## 창고 삭제

cURL 및 Java `delete` 명령을 사용하여 기존 웨어하우스를 삭제합니다. `1234` 창고 ID로 바꿉니다.

### Warehouse_DELETE_ById.sh

명령:

```bash
./Warehouse_DELETE_ById.sh 1234
```

암호:

```{literalinclude} ./warehouse-api-basics/resources/liferay-v9s5.zip/curl/Warehouse_DELETE_ById.sh
   :language: bash
```

### Warehouse_DELETE_ById.java

명령

```bash
java -classpath .:* -DwarehouseId=1234 Warehouse_DELETE_ById
```

암호:

```{literalinclude} ./warehouse-api-basics/resources/liferay-v9s5.zip/java/Warehouse_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[REST 서비스 사용](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/consuming-rest-services) 은 `Warehouse` 서비스 및 스키마를 보여주고 각 서비스를 테스트하기 위한 인터페이스를 가지고 있습니다.
