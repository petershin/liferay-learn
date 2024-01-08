# NestedField를 사용하여 관련 항목 쿼리

{bdg-secondary}`liferay 7.4 U69+/GA69+`

'nestedFields' 매개변수를 사용하면 Liferay가 단일 GET 요청에서 여러 수준의 관련 개체 항목을 반환합니다. 쿼리에 포함할 관계 이름과 함께 `nestedFields` 매개변수를 전달하고 각 관계를 쉼표로 구분합니다(`nestedFields=[firstObjectRelationship],[secondObjectRelationship]`). 관계가 여러 수준에 걸쳐 있는 경우 'nestedFieldsDepth' 매개변수를 필요한 깊이로 설정하세요. 최대 5개 수준을 포함할 수 있습니다(예: `nestedFieldsDepth=5`).

```{tip}
`nestedFields` 매개변수는 여러 요청이 필요한 관련 항목이 있는 항목을 검색하여 요청을 최적화합니다. 관련 항목만 반환하기 위해 Liferay는 [관계 API](../using-custom-object-apis.md#relationship-rest-apis) 제공합니다. 소개는 [관계 REST API 사용](./using-relationship-rest-apis.md) 참조하세요.
```

계속 진행하려면 새로운 Liferay 7.4 인스턴스를 [설정](#setting-up-a-liferay-instance) 하고 제공된 튜토리얼 코드를 [준비](#preparing-the-sample-code) 하세요. 그런 다음 [스크립트를 실행](#creating-and-querying-관련-객체 항목) 하여 관련 항목을 생성하고 `nestedFields` 매개변수를 사용하여 쿼리합니다.

## Liferay 인스턴스 설정

```{include} /_snippets/run-liferay-portal.md
```

다음으로 세 가지 개체 정의를 만들고 연결합니다.

### 관련 객체 정의 생성

1. **전역 메뉴**(![전역 메뉴](../../../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 후 **개체를 클릭합니다** .

1. [개체 초안](../../creating-and-managing-objects/creating-objects.md) 를 3개 만듭니다.

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

1. 각 개체 초안에 '이름' 텍스트 필드를 추가합니다.

   | 라벨     | 필드 이름  | 유형 | 요구하는 |
   | :----- | :----- | :- | :--- |
   | `Name` | `name` | 원본 | ✔    |

1. 다음 관계를 정의합니다.

   에이블의 경우:

   | 라벨              | 관계 이름         | 유형   | Object  |
   | :-------------- | :------------ | :--- | :------ |
   | `Able to Baker` | `ableToBaker` | 원투멀리 | 빵 굽는 사람 |

   베이커의 경우:

   | 라벨                 | 관계 이름            | 유형   | Object |
   | :----------------- | :--------------- | :--- | :----- |
   | `Baker to Charlie` | `bakerToCharlie` | 원투멀리 | 백인     |

   찰리의 경우:

   | 라벨                | 관계 이름           | 유형  | Object |
   | :---------------- | :-------------- | :-- | :----- |
   | `Charlie to Able` | `charlieToAble` | 다대다 | 할 수 있는 |

1. [각 개체를](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) 게시합니다.

게시되면 Headless API를 통해 각 객체에 액세스할 수 있습니다.

## 샘플 코드 준비

아래 명령을 실행하여 제공된 샘플 코드를 다운로드하고 압축을 풉니다.

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/understanding-object-integrations/using-custom-object-apis/liferay-w4s7.zip -O
```

```bash
unzip liferay-w4s7.zip
```

ZIP은 REST API를 사용하여 객체 항목을 생성, 관련 및 쿼리하기 위한 cURL 명령을 실행하는 셸 스크립트를 제공합니다. 여기에는 관련 항목을 쿼리하기 위한 두 개의 GET 명령이 포함됩니다.

```{tip}
사이트 및 회사 개체에 대해 생성된 API의 전체 목록은 [개체 Headless Framework Integration](../using-custom-object-apis.md) 을 참조하세요. `[서버]:[포트]/o/api`(예: `localhost:8080/o/api`)에서 Liferay API 탐색기를 통해 사용자 정의 개체 API를 보고 테스트할 수 있습니다. *REST 애플리케이션*을 클릭하고 API를 선택하세요.
```

## 관련 개체 항목 생성 및 쿼리

1. `liferay-w4s7` 프로젝트의 `curl` 폴더로 이동합니다.

   ```bash
   cd liferay-w4s7/curl
   ```

1. Able 항목을 생성하려면 `Able_POST_ToCompany`를 실행하세요.

   ```bash
   ./Able_POST_ToCompany.sh
   ```

   다음 POST 명령에 사용할 첫 번째 항목의 ID를 복사합니다.

   ```json
   {
     ...
     "externalReferenceCode" : "able-one",
     "id" : 47512,
     ...
     "name" : "Able 1"
   }

   {
     ...
     "externalReferenceCode" : "able-two",
     "id" : 47514,
     ...
     "name" : "Able 2"
   }

   {
     ...
     "externalReferenceCode" : "able-three",
     "id" : 47516,
     ...
     "name" : "Able 3"
   }
   ```

1. `able-one`의 ID를 매개변수로 사용하여 `Baker_POST_ToCompany`를 실행합니다.

   ```bash
   ./Baker_POST_ToCompany.sh [ableId]
   ```

   그러면 세 개의 Baker 항목이 생성되고 'ableToBaker' 관계를 사용하여 지정된 Able 항목과 연결됩니다.

   각 Baker 항목에는 `ableToBakerERC`, `r_ableToBaker_c_ableId`, `r_ableToBaker_c_ableERC`라는 세 개의 `ableToBaker` 관계 필드가 있습니다.

   ```json
   {
     ...
     "externalReferenceCode" : "baker-one",
     "id" : 47518,
     ...
     "name" : "Baker 1",
     "ableToBakerERC" : "able-one",
     "r_ableToBaker_c_ableId" : 47512,
     "r_ableToBaker_c_ableERC" : "able-one"
   }

   {
     ...
     "externalReferenceCode" : "baker-two",
     "id" : 47520,
     ...
     "name" : "Baker 2",
     "ableToBakerERC" : "able-one",
     "r_ableToBaker_c_ableId" : 47512,
     "r_ableToBaker_c_ableERC" : "able-one"
   }

   {
     ...
     "externalReferenceCode" : "baker-three",
     "id" : 47522,
     ...
     "name" : "Baker 3",
     "ableToBakerERC" : "able-one",
     "r_ableToBaker_c_ableId" : 47512,
     "r_ableToBaker_c_ableERC" : "able-one"
   }
   ```

   다음 POST 명령과 함께 사용할 첫 번째 Baker 항목 ID를 복사합니다.

1. `baker-one`의 ID를 매개변수로 사용하여 `Charlie_POST_ToCompany`를 실행합니다.

   ```bash
   ./Charlie_POST_ToCompany.sh [bakerId]
   ```

   그러면 세 개의 Charlie 항목이 생성되고 `bakerToCharlie` 관계를 사용하여 지정된 Baker 항목과 연결됩니다.

   ```json
   {
     ...
     "externalReferenceCode" : "charlie-one",
     "id" : 47524,
     ...
     "r_bakerToCharlie_c_bakerERC" : "baker-one",
     "bakerToCharlieERC" : "baker-one",
     "name" : "Charlie 1",
     "r_bakerToCharlie_c_bakerId" : 47518
   }

   {
     ...
     "externalReferenceCode" : "charlie-two",
     "id" : 47526,
     ...
     "r_bakerToCharlie_c_bakerERC" : "baker-one",
     "bakerToCharlieERC" : "baker-one",
     "name" : "Charlie 2",
     "r_bakerToCharlie_c_bakerId" : 47518
   }

   {
     ...
     "externalReferenceCode" : "charlie-three",
     "id" : 47528,
     ...
     "r_bakerToCharlie_c_bakerERC" : "baker-one",
     "bakerToCharlieERC" : "baker-one",
     "name" : "Charlie 3",
     "r_bakerToCharlie_c_bakerId" : 47518
   }
   ```

   이제 Able 항목과 관련된 Baker 항목과 관련된 세 개의 Charlie 항목이 있습니다. 그러나 기본 GET 요청을 사용하여 Charlie 항목을 쿼리하는 경우 응답에는 Charlie 항목에 대한 세부 정보만 포함됩니다. 관련 Baker 또는 Able 항목에 대한 세부정보는 포함되지 않습니다. 이러한 항목에 대한 세부정보를 반환하려면 'nestedFields' 및 'nestedFieldsDepth' 매개변수를 사용해야 합니다.

   다음 GET 명령과 함께 사용할 첫 번째 항목의 ID를 복사합니다.

1. Charlie 항목 ID를 매개변수로 사용하여 `Charlie_GET_ById`를 실행합니다.

   ```bash
   ./Charlie_GET_ById.sh [charlieId]
   ```

   이 GET 요청은 `nestedFields` 및 `nestedFieldsDepth` 매개변수를 사용하여 `o/c/charlies` 엔드포인트를 호출합니다.

   ```{literalinclude} ./using-nestedfields-to-query-related-entries/resources/liferay-w4s7.zip/curl/Charlie_GET_ById.sh
      :language: bash
   ```

   `nestedFields`: 쿼리에 포함할 관계를 결정합니다(`ableToBaker,bakerToCharlie`).

   `nestedFieldsDepth`: 포함할 항목의 깊이를 결정합니다(`2`).

   이 명령은 세 가지 수준의 관련 개체(예: Charlie, Baker 및 Able)를 모두 반환합니다.

   ```json
   {
     ...
     "externalReferenceCode" : "charlie-one",
     "id" : 47524,
     ...
     "r_bakerToCharlie_c_baker" : {
       ...
       "externalReferenceCode" : "baker-one",
       "id" : 47518,
       ...
       "r_ableToBaker_c_able" : {
         ...
         "externalReferenceCode" : "able-one",
         "id" : 47512,
         ...
         "name" : "Able 1"
       },
       "bakerToCharlie" : [ {
         ...
         "externalReferenceCode" : "charlie-one",
         "id" : 47524,
         ...
         "r_bakerToCharlie_c_bakerERC" : "baker-one",
         "bakerToCharlieERC" : "baker-one",
         "name" : "Charlie 1",
         "r_bakerToCharlie_c_bakerId" : 47518
       }, {
         ...
         "externalReferenceCode" : "charlie-two",
         "id" : 47526,
         ...
         "r_bakerToCharlie_c_bakerERC" : "baker-one",
         "bakerToCharlieERC" : "baker-one",
         "name" : "Charlie 2",
         "r_bakerToCharlie_c_bakerId" : 47518
       }, {
         ...
         "externalReferenceCode" : "charlie-three",
         "id" : 47528,
         ...
         "r_bakerToCharlie_c_bakerERC" : "baker-one",
         "bakerToCharlieERC" : "baker-one",
         "name" : "Charlie 3",
         "r_bakerToCharlie_c_bakerId" : 47518
       } ],
       "name" : "Baker 1",
       "ableToBaker" : {
         ...
         "externalReferenceCode" : "able-one",
         "id" : 47512,
         ...
         "name" : "Able 1"
       },
       "r_ableToBaker_c_ableId" : 47512,
       "r_ableToBaker_c_ableERC" : "able-one"
     },
     "r_bakerToCharlie_c_bakerERC" : "baker-one",
     "bakerToCharlie" : {
       ...
       "externalReferenceCode" : "baker-one",
       "id" : 47518,
       ...
       "r_ableToBaker_c_able" : {
         ...
         "externalReferenceCode" : "able-one",
         "id" : 47512,
         ...
         "name" : "Able 1"
       },
       "bakerToCharlie" : [ {
         ...
         "externalReferenceCode" : "charlie-one",
         "id" : 47524,
         ...
         "r_bakerToCharlie_c_bakerERC" : "baker-one",
         "bakerToCharlieERC" : "baker-one",
         "name" : "Charlie 1",
         "r_bakerToCharlie_c_bakerId" : 47518
       }, {
         ...
         "externalReferenceCode" : "charlie-two",
         "id" : 47526,
         ...
         "r_bakerToCharlie_c_bakerERC" : "baker-one",
         "bakerToCharlieERC" : "baker-one",
         "name" : "Charlie 2",
         "r_bakerToCharlie_c_bakerId" : 47518
       }, {
         ...
         "externalReferenceCode" : "charlie-three",
         "id" : 47528,
         ...
         "r_bakerToCharlie_c_bakerERC" : "baker-one",
         "bakerToCharlieERC" : "baker-one",
         "name" : "Charlie 3",
         "r_bakerToCharlie_c_bakerId" : 47518
       } ],
       "name" : "Baker 1",
       "ableToBaker" : {
         ...
         "externalReferenceCode" : "able-one",
         "id" : 47512,
         ...
         "name" : "Able 1"
       },
       "r_ableToBaker_c_ableId" : 47512,
       "r_ableToBaker_c_ableERC" : "able-one"
     },
     "name" : "Charlie 1",
     "r_bakerToCharlie_c_bakerId" : 47518
   }
   ```

1. 이러한 ERC를 사용하여 `Charlie_PUT_CharlieToAble_ByExternalReferenceCode`를 실행하세요.

   ```bash
   ./Charlie_PUT_CharlieToAble_ByExternalReferenceCode.sh charlie-one charlie-two charlie-three able-one
   ```

   이는 `charlieToAble` 관계를 사용하여 세 개의 Charlie 항목을 모두 지정된 `able-one` 항목과 직접 연결합니다.

1. Able 항목의 ERC로 `Able_GET_ByExternalReferenceCode`를 실행합니다.

   ```bash
   ./Able_GET_ByExternalReferenceCode.sh able-one
   ```

   이 GET 요청은 `nestedFields` 매개변수를 사용하여 `o/c/ables` 엔드포인트를 호출합니다.

   ```{literalinclude} ./using-nestedfields-to-query-related-entries/resources/liferay-w4s7.zip/curl/Able_GET_ByExternalReferenceCode.sh
      :language: bash
   ```

   `nestedFields`: 쿼리에 포함할 관계를 결정합니다(`charlieToAble`).

   이 명령은 관련된 세 가지 Charlie 항목에 대한 모든 세부정보와 함께 'able-one'에 대한 세부정보를 반환합니다.

   ```json
   {
     ...
     "externalReferenceCode" : "able-one",
     "id" : 47512,
     ...
     "charlieToAble" : [ {
       ...
       "externalReferenceCode" : "charlie-one",
       "id" : 47524,
       ...
       "r_bakerToCharlie_c_bakerERC" : "baker-one",
       "bakerToCharlieERC" : "baker-one",
       "name" : "Charlie 1",
       "r_bakerToCharlie_c_bakerId" : 47518
     }, {
       ...
       "externalReferenceCode" : "charlie-two",
       "id" : 47526,
       ...
       "r_bakerToCharlie_c_bakerERC" : "baker-one",
       "bakerToCharlieERC" : "baker-one",
       "name" : "Charlie 2",
       "r_bakerToCharlie_c_bakerId" : 47518
     }, {
       ...
       "externalReferenceCode" : "charlie-three",
       "id" : 47528,
       ...
       "r_bakerToCharlie_c_bakerERC" : "baker-one",
       "bakerToCharlieERC" : "baker-one",
       "name" : "Charlie 3",
       "r_bakerToCharlie_c_bakerId" : 47518
     } ],
     "name" : "Able 1"
   }
   ```

## `Charlie_GET_ById.sh`

```{literalinclude} ./using-nestedfields-to-query-related-entries/resources/liferay-w4s7.zip/curl/Charlie_GET_ById.sh
   :language: bash
```

## `Able_GET_ByExternalReferenceCode.sh`

```{literalinclude} ./using-nestedfields-to-query-related-entries/resources/liferay-w4s7.zip/curl/Able_GET_ByExternalReferenceCode.sh
   :language: bash
```

## 관련 주제

* [객체 API 기초](./object-api-basics.md) 
* [배치 API 사용](./using-batch-apis.md) 
* [REST API와 함께 집계 용어 사용](./using-aggregation-terms-with-rest-apis.md) 
