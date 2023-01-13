# 개체 API 기본 사항

객체를 게시하면 Liferay가 자동으로 이에 대한 REST API를 생성합니다. 이러한 API는 회사 및 사이트 범위 개체에 따라 다르지만 모두 `c/[pluralobjectlabel]` 명명 패턴(예: `c/timeoffrequests`)을 사용합니다. 이러한 API를 사용하여 개체 항목을 생성, 액세스, 업데이트 및 제거할 수 있습니다.

여기에서 cURL 명령을 사용하여 사용자 정의 개체에 대한 기본 CRUD 작업을 수행합니다. 진행하기 전에 [설정](#setting-up-a-liferay-instance) 새 Liferay DXP/Portal 7.4 인스턴스 및 [준비](#preparing-the-sample-code) 제공된 튜토리얼 코드.

```{tip}
사이트 및 회사 개체 모두에 대해 생성된 API의 전체 목록은 [객체의 헤드리스 프레임워크 통합](../../understanding-object-integrations/headless-framework-integration.md)을 참조하세요. `[server]:[port]/o/api`(예: `localhost:8080/o/api`)에서 Liferay API 탐색기를 통해 사용자 정의 개체 API를 보고 테스트할 수 있습니다. *REST 애플리케이션* 아래에 나열됩니다.
```

## Liferay 인스턴스 설정
```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps to [create](../../creating-and-managing-objects/creating-objects.md) a basic Object for this tutorial:

1. Open the *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Objects*.

1. Click the *Add* button (![Add Button](../../../../images/icon-add.png)) and enter these values:

   | Field | Value |
   | :--- | :--- |
   | Label | `Able` |
   | Plural Label | `Ables` |
   | Name | `Able` |

1. Select the new *Object* draft, go to the *Fields* tab, and add a single text field:

   | Label | Field Name | Type | Required |
   | :--- | :--- | :--- | :--- |
   | Name | name | Text | &#10004; |

1. Go to the *Details* tab and click *Publish*.

   ```{important}
   For this tutorial, you must use the above values.
   ```

[Publishing an Object](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) 은 데이터 수신 및 저장을 위한 새로운 애플리케이션을 생성하고 활성화합니다. 이제 Headless API를 통해 액세스할 수 있습니다.

## 샘플 코드 준비

다음 명령을 실행하여 제공된 샘플 코드를 다운로드하고 압축을 풉니다.

```bash
curl https://learn.liferay.com/dxp/latest/en/building-applications/objects/objects-tutorials/using-apis/liferay-v1s4.zip -O
```

```bash
unzip liferay-v1s4.zip
```

이러한 스크립트에는 다음 API가 포함됩니다.

| HTTP 방법 | HTTP 끝점           | 묘사                                                                       |
|:------- |:----------------- |:------------------------------------------------------------------------ |
| 가져 오기   | `/`               | Liferay 인스턴스의 전체 객체 항목 목록을 반환합니다. 결과에 페이지를 매기고, 필터링하고, 검색하고, 정렬할 수 있습니다. |
| 우편      | `/`               | API 호출에 제공된 세부 정보를 사용하여 새 객체 항목을 생성합니다.                                  |
| 삭제      | `/{objectNameId}` | 지정된 개체 항목을 삭제하고 작업이 성공하면 204를 반환합니다.                                     |
| 가져 오기   | `/{objectNameId}` | 지정된 개체 항목에 대한 세부 정보를 반환합니다.                                              |
| 놓다      | `/{objectNameId}` | 지정된 개체 항목의 세부 정보를 API 호출에 제공된 세부 정보로 바꿉니다.                               |

## 사용자 정의 개체의 API 호출

1. 샘플 코드를 다운로드한 후 `liferay-v1s4` 프로젝트의 `curl` 폴더로 이동합니다.

   ```bash
   cd liferay-v1s4/curl
   ```

1. `Able_POST_ToCompany`을 실행합니다. 이렇게 하면 세 개의 항목이 생성됩니다.

   ```bash
   ./Able_POST_ToCompany.sh
   ```

   터미널은 새로 생성된 항목에 대한 전체 스키마를 표시합니다. 다음 방법에 사용할 첫 번째 항목의 ID를 복사합니다.

   ```bash
   {
     "id" : 41969,
     ...
     "name" : "Able 1"
   }

   {
     "id" : 41971,
     ...
     "name" : "Able 2"
   }

   {
     "id" : 41973,
     ...
     "name" : "Able 3"
   }
   ```

1. `Ables_GET_FromCompany`을 실행합니다. 객체의 항목 목록을 반환합니다.

   ```bash
   ./Ables_GET_FromCompany.sh
   ```

1. 첫 번째 항목의 ID를 매개변수로 사용하여 `Able_PUT_ById` 을 실행합니다. 이렇게 하면 지정된 항목의 세부 정보가 API 호출에 제공된 세부 정보로 대체됩니다.

   ```bash
   ./Able_PUT_ById.sh {entry-id}
   ```

   ```bash
   {
     "id" : 41969,
     ...
     "name" : "Able One"
   }
   ```

1. 매개변수와 동일한 ID로 `Able_DELETE_ById` 을 실행합니다. 이것은 지정된 항목을 삭제합니다.

   ```bash
   ./Able_DELETE_ById.sh {entry-id}
   ```

1. 매개변수와 동일한 ID로 `Able_GET_ById` 을 실행합니다. 지정된 항목이 있는 경우 해당 항목에 대한 세부 정보를 반환합니다.

   ```bash
   ./Able_GET_ById.sh {entry-id}
   ```

   이전 단계에서 항목을 삭제했으므로 다음 메시지가 반환됩니다.

   ```bash
   {
     "status" : "NOT_FOUND",
     "title" : "No ObjectEntry exists with the primary key 41969"
   }
   ```

## 샘플 cURL 스크립트 검사

다음은 자습서의 cURL 명령에 대한 예입니다.

### `Able_POST_ToCompany.sh`

```{literalinclude} ./object-api-basics/resources/liferay-v1s4.zip/curl/Able_POST_ToCompany.sh
   :language: bash
```

### `Able_PUT_ById.sh`

```{literalinclude} ./object-api-basics/resources/liferay-v1s4.zip/curl/Able_PUT_ById.sh
   :language: bash
```

## 추가 정보

* [배치 API 사용](./using-batch-apis.md)
* [REST API에서 중첩 필드 사용](./using-nested-fields-with-rest-apis.md)
* [REST API에서 집계 용어 사용](./using-aggregation-terms-with-rest-apis.md)
