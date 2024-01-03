# 관계 REST API 사용

{bdg-secondary}`liferay 7.4 U70+/GA70+`

사용자 정의 또는 시스템 개체에 관계를 추가하면 Liferay는 해당 관계에 액세스하기 위한 REST 끝점을 생성합니다. 항목을 연결 및 연결 해제할 수 있을 뿐만 아니라 항목의 관련 항목을 반환할 수도 있습니다. 이러한 끝점은 일대다 관계에서는 상위 개체에 추가되고 다대다 관계에서는 두 개체 모두에 추가됩니다.

계속하려면 [설정](#setting-up-a-liferay-instance) Liferay 7.4 인스턴스를 설정하고 [제공된 튜토리얼 코드](#preparing-the-sample-code) 준비합니다. 그런 다음 스크립트를 실행하여 개체 항목을 만들고 개체 항목 간의 관계를 관리합니다.

## Liferay 인스턴스 설정

```{include} /_snippets/run-liferay-portal.md
```

다음으로, [만들다](../../creating-and-managing-objects/creating-objects.md) 개의 세 가지 관련 사용자 정의 개체를 만듭니다.

1. _전역 메뉴_(![전역 메뉴](../../../../images/icon-applications-menu.png))를 열고 _제어판_ 탭으로 이동한 후 *개체를 클릭합니다*.

1. 세 개의 개체 초안을 만듭니다.

   첫 번째 개체:

   | 분야    | 가치      |
   | :---- | :------ |
   | 라벨    | `Able`  |
   | 복수 라벨 | `Ables` |
   | 이름    | `Able`  |

   두 번째 개체:

   | 분야    | 가치       |
   | :---- | :------- |
   | 라벨    | `Baker`  |
   | 복수 라벨 | `Bakers` |
   | 이름    | `Baker`  |

   세 번째 개체:

   | 분야    | 가치         |
   | :---- | :--------- |
   | 라벨    | `Charlie`  |
   | 복수 라벨 | `Charlies` |
   | 이름    | `Charlie`  |

1. 각 개체 초안에 '이름' 필드를 추가합니다.

   | 라벨     | 필드 이름  | 유형 | 요구하는 |
   | :----- | :----- | :- | :--- |
   | `Name` | `name` | 원본 | ✔    |

1. 가능 개체에 다음 관계를 추가합니다.

   | 라벨                | 관계 이름           | 유형   | Object  |
   | :---------------- | :-------------- | :--- | :------ |
   | `Able to Baker`   | `ableToBaker`   | 원투멀리 | 빵 굽는 사람 |
   | `Able to Charlie` | `ableToCharlie` | 원투멀리 | 백인      |

1. [각 개체를](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) 게시합니다.

게시되면 다음 관계 API를 포함하여 해당 REST API에 액세스할 수 있습니다.

| Object | HTTP 방법 | HTTP 엔드포인트                                                         | 자바 방법                             |
| :----- | :------ | :----------------------------------------------------------------- | :-------------------------------- |
| 할 수 있는 | 얻다      | `/{ableId}/ableToBaker`                                            | `getAbleAbleToBakerBakerPage`     |
| 할 수 있는 | 얻다      | `/{ableId}/ableToCharlie`                                          | `getAbleAbleToCharlieCharliePage` |
| 할 수 있는 | 삭제      | `/{ableId}/ableToBaker/{bakerId}`                                  | `deleteAbleAbleToBakerBaker`      |
| 할 수 있는 | 놓다      | `/{ableId}/ableToBaker/{bakerId}`                                  | `putAbleAbleToBakerBaker`         |
| 할 수 있는 | 삭제      | `/{ableId}/ableToCharlie/{charlieId}`                              | `deleteAbleAbleToCharlieCharlie`  |
| 할 수 있는 | 놓다      | `/{ableId}/ableToCharlie/{charlieId}`                              | `putAbleAbleToCharlieCharlie`     |
| 할 수 있는 | 놓다      | `/by-external-reference-code/{ableERC}/ableToBaker/{bakerERC}`     | `putAbleAbleToBakerBaker`         |
| 할 수 있는 | 놓다      | `/by-external-reference-code/{ableERC}/ableToCharlie/{charlieERC}` | `putAbleAbleToCharlieCharlie`     |
| 백인     | 얻다      | `/{charlieId}/ableToCharlie`                                       | `getCharlieAbleToCharlieAblePage` |
| 백인     | 삭제      | `/{charlieId}/ableToCharlie/{ableId}`                              | `deleteCharlieAbleToCharlieAble`  |
| 백인     | 놓다      | `/{charlieId}/ableToCharlie/{ableId}`                              | `putCharlieAbleToCharlieAble`     |
| 백인     | 놓다      | `/by-external-reference-code/{ableERC}/ableToCharlie/{charlieERC}` | `putCharlieAbleToCharlieAble`     |

```{tip}
사이트 및 회사 개체에 대해 생성된 API의 전체 목록은 [개체 Headless Framework Integration](../../understanding-object-integrations/using-custom-object-apis.md) 을 참조하세요. `[서버]:[포트]/o/api`(예: `localhost:8080/o/api`)에서 Liferay API 탐색기를 통해 사용자 정의 개체 API를 보고 테스트할 수 있습니다. *REST 애플리케이션*을 클릭하고 API를 선택하세요.
```

## 샘플 코드 준비

제공된 샘플 코드를 다운로드하고 압축을 풀려면 다음 명령을 실행하세요.

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/understanding-object-integrations/using-custom-object-apis/liferay-f9m2.zip -O
```

```bash
unzip liferay-f9m2.zip
```

샘플 코드에는 각 개체에 대한 항목을 만들고 해당 관계 API를 사용하기 위한 명령이 포함되어 있습니다.

## 샘플 코드 사용

REST API를 사용하여 객체 항목을 추가하고 해당 관계를 관리합니다.

1. `liferay-f9m2` 프로젝트의 `curl` 폴더로 이동합니다.

   ```bash
   cd liferay-f9m2/curl
   ```

1. `POST` 명령을 실행하여 각 개체에 대해 세 개의 항목을 만듭니다. 이러한 항목에는 `[objectname]-[number]` 명명 패턴(예: `able-one`)에 따라 사전 정의된 외부 참조 코드(ERC)가 있습니다.

   ```bash
   ./Able_POST_Batch.sh
   ```

   ```bash
   ./Baker_POST_Batch.sh
   ```

   ```bash
   ./Charlie_POST_Batch.sh
   ```

1. `able-one` ERC와 3개의 베이커 ERC를 모두 사용하여 `Able_PUT_AbleToBaker_ByExternalReferenceCode`를 실행하세요.

   ```bash
   ./Able_PUT_AbleToBaker_ByExternalReferenceCode.sh able-one baker-one baker-two baker-three
   ```

   이는 가능 항목을 베이커 항목과 연관시키고 응답을 인쇄합니다.

   ```json
   {
     ...
     "externalReferenceCode" : "baker-one",
     "id" : 42427,
     ...
     "name" : "Baker 1",
     "r_ableToBaker_c_ableId" : 42421,
     "r_ableToBaker_c_ableERC" : "able-one"
   }

   {
     ...
     "externalReferenceCode" : "baker-two",
     "id" : 42429,
     ...
     "name" : "Baker 2",
     "r_ableToBaker_c_ableId" : 42421,
     "r_ableToBaker_c_ableERC" : "able-one"
   }

   {
     ...
     "externalReferenceCode" : "baker-three",
     "id" : 42431,
     ...
     "name" : "Baker 3",
     "r_ableToBaker_c_ableId" : 42421,
     "r_ableToBaker_c_ableERC" : "able-one"
   }
   ```

1. 두 개의 ID(`able-one` ID와 `baker-3` ID)를 사용하여 `Able_DELETE_AbleToBaker_ById`를 실행합니다.

   ```bash
   ./Able_DELETE_AbleToBaker_ById.sh {able-entry-id} {baker-entry-id}
   ```

   이렇게 하면 항목의 연결이 해제됩니다.

1. 동일한 가능 ID로 `Able_GET_AbleToBaker_ById`를 실행하여 더 이상 관련이 없는지 확인하세요.

   ```bash
   ./Able_GET_AbleToBaker_ById.sh {able-entry-id}
   ```

   ```json
   {
     ...
     "externalReferenceCode" : "baker-two",
     "id" : 42429,
     ...
     "name" : "Baker 2",
     "r_ableToBaker_c_ableId" : 42421,
     "r_ableToBaker_c_ableERC" : "able-one"
   },
   {
     ...
     "externalReferenceCode" : "baker-one",
     "id" : 42427,
     ...
     "name" : "Baker 1",
     "r_ableToBaker_c_ableId" : 42421,
     "r_ableToBaker_c_ableERC" : "able-one"
   }
   ```

1. `able-one` ERC와 세 가지 charlie ERC를 모두 사용하여 `Able_PUT_AbleToCharlie_ByExternalReferenceCode`를 실행하세요.

   ```bash
   ./Able_PUT_AbleToCharlie_ByExternalReferenceCode.sh able-one charlie-one charlie-two charlie-three
   ```

   이는 가능한 항목을 charlie 항목과 연결하고 응답을 인쇄합니다.

   ```json
   {
     ...
     "externalReferenceCode" : "charlie-one",
     "id" : 42433,
     ...
     "name" : "Charlie 1"
   }
   {
     ...
     "externalReferenceCode" : "charlie-two",
     "id" : 42435,
     ...
     "name" : "Charlie 2"
   }
   {
     ...
     "externalReferenceCode" : "charlie-three",
     "id" : 42437,
     ...
     "name" : "Charlie 3"
   }
   ```

1. `charlie-one`의 ID로 `Charlie_GET_AbleToCharlie_ById`를 실행합니다.

   ```bash
   ./Charlie_GET_AbleToCharlie_ById.sh {charlie-entry-id}
   ```

   지정된 charlie 항목과 관련된 모든 가능한 항목 목록이 반환됩니다.

   ```json
   {
     ...
     "items" : [ {
       ...
       "externalReferenceCode" : "able-one",
       "id" : 42421,
       ...
       "name" : "Able 1"
     } ],
     "lastPage" : 1,
     "page" : 1,
     "pageSize" : 1,
     "totalCount" : 1
   }
   ```

1. `charlie-one` 및 `able-two` ERC를 사용하여 `Charlie_PUT_AbleToCharlie_ByExternalReferenceCode`를 실행합니다.

   ```bash
   ./Charlie_PUT_AbleToCharlie_ByExternalReferenceCode.sh charlie-one able-two
   ```

   이는 찰리 항목을 다른 유능한 항목과 연결합니다.

   ```json
   {
     ...
     "externalReferenceCode" : "able-two",
     "id" : 42423,
     ...
     "name" : "Able 2"
   }
   ```

1. `charlie-one`의 ID로 `Charlie_GET_AbleToCharlie_ById`를 실행하고 이제 관련 가능한 항목이 두 개 있는지 확인하세요.

   ```bash
   ./Charlie_GET_AbleToCharlie_ById.sh {charlie-entry-id}
   ```

   ```json
   {
     ...
     "items" : [ {
       ...
       "externalReferenceCode" : "able-two",
       "id" : 42423,
       ...
       "name" : "Able 2"
     }, {
       ...
       "externalReferenceCode" : "able-one",
       "id" : 42421,
       ...
       "name" : "Able 1"
     } ],
     "lastPage" : 1,
     "page" : 1,
     "pageSize" : 2,
     "totalCount" : 2
   }
   ```

1. `able-one`의 ID로 `Able_GET_ById`를 실행합니다.

    ```bash
    ./Able_GET_ById.sh {able-entry-id}
    ```

    이 명령은 'nestedFields' 매개변수를 사용하여 관련된 모든 Baker 및 Charlie 항목을 반환합니다.

    ```json
    {
      "externalReferenceCode" : "able-one",
      "id" : 42421,
      ...
      "ableToCharlie" : [ {
        ...
        "externalReferenceCode" : "charlie-one",
        "id" : 42433,
        ...
        "name" : "Charlie 1"
      }, {
        ...
        "externalReferenceCode" : "charlie-two",
        "id" : 42435,
        ...
        "name" : "Charlie 2"
      }, {
        ...
        "externalReferenceCode" : "charlie-three",
        "id" : 42437,
        ...
        "name" : "Charlie 3"
      } ],
      "name" : "Able 1",
      "ableToBaker" : [ {
        ...
        "externalReferenceCode" : "baker-one",
        "id" : 42427,
        ...
        "name" : "Baker 1",
        "r_ableToBaker_c_ableId" : 42421,
        "r_ableToBaker_c_ableERC" : "able-one"
      }, {
        ...
        "externalReferenceCode" : "baker-two",
        "id" : 42429,
        ...
        "name" : "Baker 2",
        "r_ableToBaker_c_ableId" : 42421,
        "r_ableToBaker_c_ableERC" : "able-one"
      } ]
    }
    ```

    `nestedFields` 매개변수에 대한 자세한 내용은 [NestedFields를 사용하여 관련 항목 쿼리](./using-nestedfields-to-query-related-entries.md) 참조하세요.

## 코드 검토

### `Charlie_PUT_AbleToCharlie_ByExternalReferenceCode`

```{literalinclude} ./using-relationship-rest-apis/resources/liferay-f9m2.zip/curl/Charlie_PUT_AbleToCharlie_ByExternalReferenceCode.sh
   :language: bash
```

### `Charlie_GET_AbleToCharlie_ById`

```{literalinclude} ./using-relationship-rest-apis/resources/liferay-f9m2.zip/curl/Charlie_GET_AbleToCharlie_ById.sh
   :language: bash
```

### `Able_DELETE_AbleToBaker_ById`

```{literalinclude} ./using-relationship-rest-apis/resources/liferay-f9m2.zip/curl/Able_DELETE_AbleToBaker_ById.sh
   :language: bash
```

### `Able_GET_ById.sh`

```{literalinclude} ./using-relationship-rest-apis/resources/liferay-f9m2.zip/curl/Able_GET_ById.sh
   :language: bash
```

## 관련 주제

* [헤드리스 프레임워크 통합](../../understanding-object-integrations/using-custom-object-apis.md) 
* [REST API와 함께 중첩 필드 사용](./using-nestedfields-to-query-related-entries.md) 
* [개체 관계 정의](../../creating-and-managing-objects/relationships/defining-object-relationships.md) 
