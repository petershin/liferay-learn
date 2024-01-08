# 주문 유형 사용

{bdg-secondary}`liferay DXP 7.4 U4+/GA8+`

재고 및 긴급 주문의 예시 시나리오를 지원하기 위해 두 가지 주문 유형을 생성할 수 있습니다. 재고 주문에는 일반 가격이 적용되며, 긴급 주문에는 추가 요금이 부과됩니다.

```{important}
*주문 추가* 또는 *새 주문 생성* 버튼을 사용하여 생성된 주문의 경우 구매자는 주문 유형을 선택할 수 있습니다. 그러면 해당 주문 유형에 연결된 올바른 가격으로 제품 페이지가 업데이트됩니다(있는 경우).
```

## 주문 유형 생성

주문 유형이 하나만 존재하는 경우 새 주문에 자동으로 할당됩니다. 장바구니에 직접 추가된 제품의 경우 주문 번호가 낮은 주문 유형이 다른 주문 유형보다 우선합니다. 언제든지 주문 유형에서 주문 번호를 변경하여 원하는 기본값을 설정할 수 있습니다.

![You can change the Order number of an Order Type to set the default to what you want.](./using-order-types/images/04.png)

1. **글로벌 메뉴**(![애플리케이션 메뉴 아이콘](../../images/icon-applications-menu.png))를 열고 **Commerce** &rarr; **Order Types** 를 클릭합니다.

1. **추가** 버튼(![아이콘 추가](../../images/icon-add.png))을 클릭하고 다음 정보를 입력합니다.

   **이름:** 주식

   **설명:** 모든 일반 주문에 대한 주문 유형

1. **저장** 을 클릭하세요.

   그러면 새 주문 유형이 생성되고 구성 페이지가 열립니다. 주문 필드는 드롭다운 메뉴에 있는 주문 유형의 정렬 순서를 결정합니다. 재고 주문 유형에 대해 주문 필드의 값을 0으로 설정합니다. 다음 정보를 사용하여 주문 유형을 하나 더 생성합니다.

   **이름:** 긴급

   **설명:** 10% 추가 요금이 적용되는 긴급 주문의 주문 유형

이 주문 유형에 대한 주문 값을 1로 설정합니다. **활성** 토글을 사용하여 활성화할 수 있습니다. **자격** 탭에서 주문 유형을 특정 채널 또는 모든 채널에 연결할 수 있습니다.

## 주문 유형과 주문 연결

사용자 정의 가격표를 생성하고 이를 긴급 주문 유형에 연결할 수 있습니다. 추가 요금을 추가하려면 가격표에 가격 수정자를 생성하세요.

1. **글로벌 메뉴**(![애플리케이션 메뉴 아이콘](../../images/icon-applications-menu.png))를 열고 **Commerce** &rarr; **Price Lists** 를 클릭합니다.

1. **추가** 버튼(![아이콘 추가](../../images/icon-add.png))을 클릭하여 새로운 가격표를 생성하고 다음 정보를 입력하세요.

   **이름:** 긴급 주문 추가 요금

   **카탈로그:** 미니엄

   **통화:** USD

   ![Enter the name, catalog, and default currency and click Submit to create the Price List.](./using-order-types/images/01.png)

1. **제출** 을 클릭하세요.

1. 가격 수정자 탭에서 **추가** 버튼(![아이콘 추가](../../images/icon-add.png))을 클릭하여 새 가격 수정자를 생성하고 다음 정보를 입력합니다.

   **이름:** 10% 추가요금

   **대상:** 카탈로그

   **수정자:** 백분율

   ![Enter the name, target, and modifier, and click Submit to create the Price Modifier.](./using-order-types/images/02.png)

1. **제출** 을 클릭하세요.

1. 새 가격 수정자를 클릭하고 **활성** 토글을 사용하여 활성화하세요. **금액** 을 10으로 설정합니다.

1. **저장** 을 클릭하세요.

   그러면 가격 수정자가 포함된 새 가격 목록이 생성됩니다. 추가 요금을 추가하려면 주문 유형에 연결해야 합니다.

1. **자격** 탭을 클릭하고 **주문 유형 자격** 까지 아래로 스크롤합니다.

1. 긴급 주문 유형을 검색하고 **선택** 을 클릭하세요.

1. **게시** 를 클릭하세요.

    ![Based on the Order Type, Products in the catalog automatically display their correct prices.](./using-order-types/images/03.gif)
