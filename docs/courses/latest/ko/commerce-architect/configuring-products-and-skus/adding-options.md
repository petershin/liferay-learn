# 옵션 추가

첫 번째 모듈에서는 모두 단일 SKU(재고 관리 단위)가 있는 세 가지 제품을 생성했습니다. 제품에는 여러 SKU가 있는 경우가 많습니다. 예를 들어, 수량이 다른 제품입니다. 이 레슨에서는 옵션을 사용하여 기존 제품을 편집하고 여러 SKU를 추가하는 방법을 알아봅니다.

1. _글로벌 메뉴_(![글로벌 메뉴](../../images/icon-applications-menu.png))를 열고 _Commerce_ &rarr; _옵션_으로 이동합니다.

1. _추가_(![추가](../../images/icon-add.png))를 클릭하고 다음 정보를 입력합니다.

   **이름:** 렌즈 유형

   **옵션 필드 유형:** 목록에서 선택

   ![Create a new option for quantity.](./adding-options/images/01.png)

1. _제출_을 클릭하세요.

1. 생성된 옵션을 선택하세요.

1. _패싯 탐색에 사용_, _필수_, _SKU 기여자_의 세 가지 토글을 모두 활성화합니다.

1. 값 섹션에서 _추가_(![추가](../../images/icon-add.png))를 클릭합니다.

1. 이름을 _Single Vision_으로 입력하고 사이트
를 _0_으로 입력합니다.

1. _제출_을 클릭하세요.

1. 두 개의 추가 값에 대해 동일한 작업을 반복합니다. _1_ 사이트
의 _프로그레시브_ 및 사이트
 _2_의 _이중초점_.

   ![Enter selectable values for the option.](./adding-options/images/02.png)

1. _저장_을 클릭하세요.

이렇게 하면 여러 제품에 추가할 수 있는 렌즈 유형이라는 옵션 템플릿이 생성됩니다. 제품 구성 페이지에서 직접 옵션을 생성할 수도 있습니다. 다음 값을 사용하여 다른 옵션인 _렌즈 코팅_에 대해 단계를 반복합니다.

* 블루라이트 필터
* 블루라이트 필터 + 자외선 차단

## 제품에 옵션 추가

SKU 기여 옵션을 제품에 추가하면 기존 SKU가 비활성화됩니다. 제품에 옵션을 추가한 후 사용 가능한 옵션을 기반으로 모든 SKU 조합을 생성할 수 있습니다. 두 개의 옵션(값이 3개 있는 옵션과 값이 2개인 옵션)을 생성했으므로 단일 제품에 SKU 6개가 추가됩니다.

1. _글로벌 메뉴_(![글로벌 메뉴](../../images/icon-applications-menu.png))를 열고 _Commerce_ &rarr; _제품_으로 이동합니다.

1. _말리야_를 선택하세요.

1. SKU 탭으로 이동하여 _CLA-FR-EYE-001_ SKU를 삭제합니다.

1. 옵션 탭으로 이동하여 _렌즈 유형_을 검색하세요.

1. _선택_을 클릭하세요. 렌즈 코팅에도 동일한 과정을 반복합니다.

1. _저장_을 클릭하세요.

1. _SKU_ 탭으로 이동하여 _추가_(![추가](../../images/icon-add.png))를 클릭합니다.

1. _모든 SKU 조합 생성_을 선택합니다.

   ![Select the option to generate all SKU combinations based on the added options.](./adding-options/images/03.png)

1. 각 SKU 옵션을 클릭하고 이름을 다음과 같이 변경합니다.

   | SKU                             | 이름               |
   | :------------------------------ | :--------------- |
   | 단일 VISIONBLUE 조명 필터             | CLA-EYE-FR-0001A |
   | SINGLE VISION블루 라이트 필터 + 자외선 차단 | CLA-EYE-FR-0001B |
   | 이중초점블루라이트 필터                    | CLA-EYE-FR-0001C |
   | 이중초점블루라이트 필터 + UV 차단            | CLA-EYE-FR-0001D |
   | 프로그레시브블루라이트 필터                  | CLA-EYE-FR-0001E |
   | 프로그레시브블루라이트 필터 + UV 차단          | CLA-EYE-FR-0001F |

   ![Enter new names for all the created SKUs.](./adding-options/images/04.png)

1. 다음 정보를 사용하여 다른 두 제품에 대해 위 단계를 반복합니다.

    | 제품   | SKUs                                                                                                       |
    | :--- | :--------------------------------------------------------------------------------------------------------- |
    | 플뢰레트 | CLA-EYE-FR-0002A, CLA-EYE-FR-0002B, CLA-EYE-FR-0002C, CLA-EYE-FR-0002D, CLA-EYE-FR-0002E, CLA-EYE-FR-0002F |
    | 라테파  | CLA-EYE-FR-0003A, CLA-EYE-FR-0003B, CLA-EYE-FR-0003C, CLA-EYE-FR-0003D, CLA-EYE-FR-0003E, CLA-EYE-FR-0003F |

1. _게시_를 클릭하세요.

이렇게 하면 카탈로그의 3개 제품에 대해 각각 6개의 SKU가 생성되어 총 18개의 SKU가 됩니다. 다음 연습에서는 생성된 각 제품에 대한 제품 이미지를 추가합니다.

다음: [미디어 추가](./adding-media.md) 
