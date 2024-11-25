# 객체 API 기본 사항

객체를 게시하면 Liferay가 해당 객체에 대한 REST API를 자동으로 생성합니다. 이러한 API는 회사 및 사이트 범위 개체에 따라 다르지만 모두 `c/[pluralobjectlabel]` 명명 패턴(예: `c/timeoffrequests`)을 사용합니다. 이러한 API를 사용하여 개체 항목을 생성, 액세스, 업데이트 및 제거할 수 있습니다.

여기서는 cURL 명령을 사용하여 사용자 정의 개체에 대한 기본 CRUD 작업을 수행합니다. 계속하기 전에 [설정](#setting-up-a-liferay-instance) Liferay DXP/Portal 7.4 인스턴스를 설정하고 [제공된 튜토리얼 코드](#preparing-the-sample-code) 준비합니다.

```{tip}
사이트 및 회사 오브젝트 모두에 대해 생성된 API의 전체 목록은 [오브젝트의 헤드리스 프레임워크 통합](../using-custom-object-apis.md)을 참조하세요. Liferay API 탐색기를 통해 '[server]:[port]/o/api'에서 사용자 지정 개체 API를 보고 테스트할 수 있습니다(예: `localhost:8080/o/api`). 이는 *REST 애플리케이션* 아래에 나열되어 있습니다.
```

## Liferay 인스턴스 설정

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계에 따라 이 튜토리얼에 대한 기본 [를](../../creating-and-managing-objects/creating-objects.md) .

1. **글로벌 메뉴**(![글로벌 메뉴](../../../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 다음 **개체** 를 클릭하세요.

1. **추가** 버튼(![추가 버튼](../../../../images/icon-add.png))을 클릭하고 다음 값을 입력합니다.

   | 분야    | 가치      |
   | :---- | :------ |
   | 라벨    | `Able`  |
   | 복수 라벨 | `Ables` |
   | 이름    | `Able`  |

1. 새 **Object** 초안을 선택하고 **Fields** 탭으로 이동하여 단일 텍스트 필드를 추가하세요.

   | 라벨 | 필드 이름 | 유형 | 요구하는 |
   | :- | :---- | :- | :--- |
   | 이름 | 이름    | 원본 | ✔    |

1. **세부정보** 탭으로 이동하여 **게시** 를 클릭하세요.

   ```{important}
   이 튜토리얼에서는 위의 값을 사용해야 합니다.
   ```

[객체 게시](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) 은 데이터 수신 및 저장을 위한 새 애플리케이션을 생성하고 활성화합니다. 이제 Headless API를 통해 액세스할 수 있습니다.

## 샘플 코드 준비

다음 명령을 실행하여 제공된 샘플 코드를 다운로드하고 압축을 풉니다.

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/understanding-object-integrations/using-custom-object-apis/liferay-v1s4.zip -O
```

```bash
unzip liferay-v1s4.zip
```

이러한 스크립트에는 다음 API가 포함됩니다.

| HTTP 방법 | HTTP 엔드포인트        | 묘사                                                                     |
| :------ | :---------------- | :--------------------------------------------------------------------- |
| 얻다      | `/`               | Liferay 인스턴스에 있는 개체 항목의 전체 목록을 반환합니다. 결과는 페이지 매김, 필터링, 검색 및 정렬이 가능합니다. |
| 우편      | `/`               | API 호출에 제공된 세부정보를 사용하여 새 개체 항목을 만듭니다.                                  |
| 삭제      | `/{objectNameId}` | 지정된 개체 항목을 삭제하고 작업이 성공하면 204를 반환합니다.                                   |
| 얻다      | `/{objectNameId}` | 지정된 개체 항목에 대한 세부 정보를 반환합니다.                                            |
| 놓다      | `/{objectNameId}` | 지정된 개체 항목의 세부 정보를 API 호출에 제공된 세부 정보로 바꿉니다.                             |

## 사용자 정의 개체의 API 호출

1. 샘플 코드를 다운로드한 후 `liferay-v1s4` 프로젝트의 `curl` 폴더로 이동합니다.

   ```bash
   cd liferay-v1s4/curl
   ```

1. `Able_POST_ToCompany` 를 실행합니다. 이렇게 하면 세 개의 항목이 생성됩니다.

   ```bash
   ./Able_POST_ToCompany.sh
   ```

   터미널에는 새로 생성된 항목에 대한 전체 스키마가 표시됩니다. 다음 방법에 사용할 첫 번째 항목의 ID를 복사합니다.

   ```json
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

1. `Ables_GET_FromCompany`를 실행합니다. 그러면 개체 항목 목록이 반환됩니다.

   ```bash
   ./Ables_GET_FromCompany.sh
   ```

1. 첫 번째 항목의 ID를 매개변수로 `Able_PUT_ById`를 실행합니다. 그러면 지정된 항목의 세부 정보가 API 호출에 제공된 세부 정보로 대체됩니다.

   ```bash
   ./Able_PUT_ById.sh {entry-id}
   ```

   ```json
   {
     "id" : 41969,
     ...
     "name" : "Able One"
   }
   ```

1. 해당 매개변수와 동일한 ID로 `Able_DELETE_ById`를 실행합니다. 그러면 지정된 항목이 삭제됩니다.

   ```bash
   ./Able_DELETE_ById.sh {entry-id}
   ```

1. 해당 매개변수와 동일한 ID로 `Able_GET_ById`를 실행합니다. 지정된 항목이 있는 경우 해당 항목에 대한 세부 정보를 반환합니다.

   ```bash
   ./Able_GET_ById.sh {entry-id}
   ```

   이전 단계에서 항목을 삭제했으므로 다음 메시지가 반환됩니다.

   ```json
   {
   	"status": "NOT_FOUND",
   	"title": "No ObjectEntry exists with the primary key 41969"
   }
   ```

## 샘플 cURL 스크립트 검사

다음은 튜토리얼의 cURL 명령의 예입니다.

### `Able_POST_ToCompany.sh`

```{literalinclude} ./object-api-basics/resources/liferay-v1s4.zip/curl/Able_POST_ToCompany.sh
:language: bash
```

### `Able_PUT_ById.sh`

```{literalinclude} ./object-api-basics/resources/liferay-v1s4.zip/curl/Able_PUT_ById.sh
:language: bash
```

## 객체 태그 및 범주 관리

객체 API를 사용하면 분류가 활성화된 객체 항목에 대한 태그와 범주를 읽고 설정하고 업데이트할 수 있습니다. 자세한 내용은 [태그 및 카테고리](../../../../content-authoring-and-management/tags-and-categories.md) 을 참조하세요.

태그는 `keywords` 속성으로 표시됩니다. POST, PUT 또는 PATCH 요청의 본문에 `keywords` 배열을 추가하여 태그를 설정하거나 업데이트할 수 있습니다.

```json
"keywords" : [
   "tag1", "tag2", "tag3"
]
```

객체 항목에 대해 GET 요청을 한 후 동일한 `keywords` 배열에서 해당 태그를 읽을 수 있습니다.

POST, PUT 또는 PATCH 요청에 `taxonomyCategoryIds` 배열을 추가하여 객체 항목의 카테고리를 설정하고 업데이트할 수 있습니다.

```json
"taxonomyCategoryIds" : [
   1234, 5678
]
```

!!! note
개체 항목에 범주를 할당하려면 기존 범주 어휘가 있어야 합니다. 자세한 내용은 [콘텐츠에 대한 범주 및 어휘 정의](../../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) 참조하세요.

객체 항목에 대한 GET 요청을 수행한 후 할당된 각 카테고리에 대한 `taxonomyCategoryId` 및 `taxonomyCategoryName`을 포함하는 `taxonomyCategoryBriefs` 배열에서 해당 카테고리를 읽을 수 있습니다.

```json
"taxonomyCategoryBriefs": [
   {
      "taxonomyCategoryId": 1234,
      "taxonomyCategoryName": "Category A"
   },
   {
      "taxonomyCategoryId": 5678,
      "taxonomyCategoryName": "Category B"
   }
]
```

API 쿼리 [API 쿼리 매개변수](../../../../headless-delivery/consuming-apis/api-query-parameters.md) 설명된 규칙에 따라 `keywords` 및 `taxonomyCategoryIds`를 기준으로 개체 항목을 필터링할 수 있습니다. 예제 필터 문자열은 다음과 같습니다.

- `keywords/any(k:k in ('tag1','tag2'))`는 `tag1` 또는 `tag2` 태그가 지정된 모든 개체 항목을 검색합니다.

- `taxonomyCategoryIds/any(k:k in (1234,5678))`는 ID가 '1234' 또는 '5678'인 카테고리에 연결된 모든 항목을 검색합니다.

## 관련 주제

- [배치 API 사용](./using-batch-apis.md)
- [NestedFields를 사용하여 관련 항목 쿼리](./using-nestedfields-to-query-related-entries.md)
- [REST API와 함께 집계 용어 사용](./using-aggregation-terms-with-rest-apis.md)
