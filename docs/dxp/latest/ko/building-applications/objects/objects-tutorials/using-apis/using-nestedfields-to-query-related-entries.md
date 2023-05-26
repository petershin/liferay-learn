# REST API에서 중첩 필드 사용

{bdg-secondary}`사용 가능한 Liferay 7.4 U69+/GA69+`

사용자 정의 객체 API를 사용하면 `nestedFields` 매개변수를 사용하여 단일 GET 요청에서 여러 수준의 관련 객체를 반환할 수 있습니다. `nestedFieldsDepth` 매개변수는 쿼리에 포함된 객체 항목의 깊이를 결정합니다: `0-5`.

```{tip}
`nestedFields` 매개변수는 일반적으로 여러 요청이 필요한 정보를 검색하는 편리한 방법입니다. 이를 통해 관련 항목과 함께 항목을 검색할 수 있습니다. 관련 항목만 반환하기 위해 Liferay는 전용 [관계 API](../../understanding-object-integrations/headless-framework-integration.md#relationship-rest-apis) 를 제공합니다. 소개는 [관계 REST API 사용](./using-relationship-rest-apis.md)을 참조하세요.
```

계속하려면 [설정](#setting-up-a-liferay-instance) 새 Liferay 7.4 인스턴스 및 [준비](#preparing-the-sample-code) 제공된 튜토리얼 코드. 그런 다음 스크립트를 실행하여 관련 항목을 만들고 `nestedFields` 매개변수를 사용하여 쿼리합니다.

## Liferay 인스턴스 설정

```{include} /_snippets/run-liferay-portal.md
```

다음으로 [create](../../creating-and-managing-objects/creating-objects.md) 세 가지 개체:

1. **글로벌 메뉴**(![글로벌 메뉴](../../../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 다음 클릭 **사물** .

1. 세 개의 개체 초안을 만듭니다.

    첫 번째 개체:

    | 필드 | 가치 |
    | :--- | :--- |
    | 라벨 | '가능' |
    | 복수 라벨 | '에이블스' |
    | 이름 | '가능' |

    두 번째 개체:

    | 필드 | 가치 |
    | :--- | :--- |
    | 라벨 | '베이커' |
    | 복수 라벨 | '베이커스' |
    | 이름 | '베이커' |

    세 번째 개체:

    | 필드 | 가치 |
    | :--- | :--- |
    | 라벨 | '찰리' |
    | 복수 라벨 | '찰리' |
    | 이름 | '찰리' |

1. 각 개체 초안에 `이름` 텍스트 필드를 추가합니다.

    | 라벨 | 필드 이름 | 유형 | 필수 |
    | :--- | :--- | :--- | :--- |
    | `이름` | `이름` | 텍스트 | &#10004; |

1. 다음 관계를 정의합니다.

    에이블:

    | 라벨 | 관계 이름 | 유형 | 개체 |
    | :--- | :--- | :--- | :--- |
    | '제빵 가능' | `ableToBaker` | 일대다 | 베이커 |

    베이커:

    | 라벨 | 관계 이름 | 유형 | 개체 |
    | :--- | :--- | :--- | :--- |
    | '베이커가 찰리에게' | `베이커투찰리` | 일대다 | 찰리 |

1. [게시](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) 각 개체.

게시되면 Headless API를 통해 각 개체에 액세스할 수 있습니다.

## 샘플 코드 준비

아래 명령을 실행하여 제공된 샘플 코드를 다운로드하고 압축을 풉니다.

```bash
curl https://learn.liferay.com/dxp/latest/en/building-applications/objects/objects-tutorials/using-apis/liferay-w4s7.zip -O
```

```bash
unzip liferay-w4s7.zip
```

샘플 코드에는 각 개체에 대한 POST 명령과 `Charlie`에 대한 GET 명령이 포함되어 있습니다.

```{tip}
사이트 및 회사 개체에 대해 생성된 API의 전체 목록은 [Objects Headless Framework Integration](../../understanding-object-integrations/headless-framework-integration.md)을 참조하세요. `[server]:[port]/o/api`(예: `localhost:8080/o/api`)에서 Liferay API 탐색기를 통해 사용자 정의 개체 API를 보고 테스트할 수 있습니다. *REST 애플리케이션*을 클릭하고 API를 선택합니다.
```

## 샘플 코드 사용

관련 개체 항목을 추가하고 쿼리하려면 다음 단계를 따르십시오.

1. `liferay-w4s7` 프로젝트의 `curl` 폴더로 이동합니다.

   ```bash
   cd liferay-w4s7/curl
   ```

1. `Able_POST_ToCompany` 실행하여 `Able` 항목을 생성합니다.

   ```bash
   ./Able_POST_ToCompany.sh
   ```

   다음 POST 명령과 함께 사용할 첫 번째 항목의 ID를 복사합니다.

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

1. `Able` 항목 ID를 매개변수로 사용하여 `Baker_POST_ToCompany` 을 실행합니다.

   ```bash
   ./Baker_POST_ToCompany.sh {able-entry-id}
   ```

   이렇게 하면 지정된 `Able` 항목과 관련된 `Baker` 항목이 생성됩니다. 다음 POST 명령과 함께 사용할 첫 번째 `Baker` 항목 ID를 복사합니다.

   ```json
   {
     "id" : 41975,
     ...
     "name" : "Baker 1"
     "r_ableToBaker_c_ableId" : 41969
   }

   {
     "id" : 41977,
     ...
     "name" : "Baker 2"
     "r_ableToBaker_c_ableId" : 41969
   }

   {
     "id" : 41979,
     ...
     "name" : "Baker 3"
     "r_ableToBaker_c_ableId" : 41969
   }
   ```

1. `Baker` 항목 ID를 매개변수로 사용하여 `Charlie_POST_ToCompany` 실행합니다.

   ```bash
   ./Charlie_POST_ToCompany.sh {baker-entry-id}
   ```

   이렇게 하면 이전 `Baker` 항목과 관련된 `Charlie` 항목이 생성됩니다. 다음 GET 명령과 함께 사용할 첫 번째 항목의 ID를 복사합니다.

   ```json
   {
     "id" : 41981,
     ...
     "name" : "Charlie 1",
     "r_bakerToCharlie_c_bakerId" : 41975
   }

   {
     "id" : 41983,
     ...
     "name" : "Charlie 2",
     "r_bakerToCharlie_c_bakerId" : 41975
   }

   {
     "id" : 41985,
     ...
     "name" : "Charlie 3",
     "r_bakerToCharlie_c_bakerId" : 41975
   }
   ```

1. `Charlie` 항목 ID를 매개변수로 사용하여 `Charlie_GET_ById` 실행합니다.

   ```bash
   ./Charlie_GET_ById.sh [charlie-entry-id]
   ```

   중첩 필드를 사용하여 항목을 쿼리하고 관련 개체의 세 가지 수준 모두에 대한 스키마를 반환합니다.

   ```json
   {
     "r_bakerToCharlie_c_baker" : {
       ...
       "id" : 41975,
       ...
       "r_ableToBaker_c_able" : {
         ...
         "id" : 41969,
         ...
         "name" : "Able 1"
       },
       "name" : "Baker 1",
       "r_ableToBaker_c_ableId" : 41969
     },
     "name" : "Charlie 1",
     "r_bakerToCharlie_c_bakerId" : 41975
   }
   ```

## GET 스크립트 검사

```{literalinclude} ./using-nestedfields-to-query-related-entries/resources/liferay-w4s7.zip/curl/Charlie_GET_ById.sh
   :language: bash
```

제공된 GET 메서드는 `nestedFields` 및 `nestedFieldsDepth` 매개변수가 있는 URL을 호출합니다.

`nestedFields`: 쿼리에 포함된 항목 유형을 결정합니다(예: `,bakerToCharlie`).

`nestedFieldsDepth`: 포함하려는 항목의 깊이를 결정하며 0-5 사이에서 설정할 수 있습니다.

## 관련 주제

* [개체 API 기본 사항](./object-api-basics.md)
* [배치 API 사용](./using-batch-apis.md)
* [REST API에서 집계 용어 사용](./using-aggregation-terms-with-rest-apis.md)
