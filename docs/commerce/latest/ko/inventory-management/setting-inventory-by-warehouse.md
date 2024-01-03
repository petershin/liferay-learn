# 창고별 재고 설정

여러 창고가 있는 매장에서는 창고별로 제품 재고를 관리할 수 있습니다. 인벤토리 메뉴에서는 각 창고에서 구매할 수 있는 제품의 개수를 관리할 수 있습니다.

창고별 재고를 설정하려면,

1. _글로벌 메뉴_(![글로벌 메뉴](../images/icon-applications-menu.png))를 열고 _Commerce_ &rarr; _제품_으로 이동합니다.

1. 제품을 클릭하세요.

1. _SKU_ 탭을 클릭하고 SKU를 선택합니다.

1. _인벤토리_ 탭을 클릭합니다.

1. 사용 가능한 창고의 수량을 입력하세요.

   {bdg-secondary}`Liferay DXP 2023.Q4+/Portal 7.4 GA98+` SKU에 대해 [측정 단위](../product-management/creating-and-managing-products/products/units-of-measure.md) 구성된 경우 창고당 각 단위에 대한 수량을 입력할 수 있습니다.

   ![Enter the quantity of available units for an SKU in each warehouse.](./setting-inventory-by-warehouse/images/01.png)

1. 각 창고에 대해 _저장_을 클릭하세요.

1. 제품과 관련된 다른 SKU에 대해 이 단계를 반복합니다.

이제 각 창고에는 판매 가능한 정확한 수량이 있습니다.

## 창고 간 재고 이전

{bdg-secondary}`Liferay DXP 2023.Q4+/Portal 7.4 GA98+` SKU에 대해 [측정 단위](../product-management/creating-and-managing-products/products/units-of-measure.md) 가 구성된 경우 재고는 SKU에 대해 구성된 단위로 추적됩니다. 그렇지 않으면 재고가 SKU 수준에서 추적됩니다. 이 정보는 인벤토리 페이지에서 확인할 수 있습니다.

상점에 창고가 여러 개 있는 경우 한 창고에서 다른 창고로 재고를 이전할 수 있습니다.

창고 간에 재고를 이전하려면

1. _글로벌 메뉴_(![글로벌 메뉴](../images/icon-applications-menu.png))를 열고 _Commerce_ &rarr; _Inventory_로 이동합니다.

1. SKU를 선택하세요.

1. _추가_(![추가 버튼](../images/icon-add.png))를 클릭한 다음 _전송 만들기_를 선택합니다.

   ![You can transfer stock from one warehouse to another.](./setting-inventory-by-warehouse/images/02.png)

1. 수량, 출처, 목적지를 입력하세요.

   이 예에서는 선택한 SKU의 40개 단위를 미국 - 남서부 창고에서 미국 - 북서부 창고로 이전합니다.

   * **수량**: 40
   * **출처**: 미국 - 남서부
   * **목적지**: 미국 - 북서부

   ![Enter the quantity, source, and destination to transfer stock.](./setting-inventory-by-warehouse/images/03.png)

1. _제출_을 클릭하세요.

이제 각 창고의 재고가 업데이트됩니다.

## 커머스 2.1 이하

창고별 재고를 설정하려면,

1. _제어판_ &rarr; _상거래_ &rarr; _제품_으로 이동합니다.

1. 제품을 클릭하세요.

1. _SKU_ 탭을 클릭하고 SKU를 선택합니다.

1. _인벤토리_ 탭을 클릭합니다.

1. 사용 가능한 창고의 수량을 입력하세요.

   ![Enter the number of available units for an SKU in each warehouse.](./setting-inventory-by-warehouse/images/04.png)

1. 각 창고에 대해 _저장_을 클릭하세요.

1. 제품과 관련된 다른 모든 제품 변형(SKU)에 대해 이 단계를 반복합니다.

이제 각 창고에는 판매 가능한 정확한 수량이 있습니다.

### 창고 간 재고 이전

상점에 [창고](./setting-up-warehouses.md) 둘 이상 있는 경우 사용자는 한 창고에서 다른 창고로 재고를 이동할 수 있습니다. 재고는 SKU 수준에서 추적되며 _재고_ 페이지에 반영됩니다.

창고 간에 재고를 이전하려면

1. _제어판_ &rarr; _상거래_ &rarr; _재고_로 이동합니다.

1. SKU를 선택하세요.

1. _추가_(![아이콘 추가](../images/icon-add.png)) 버튼을 클릭한 다음 _전송 만들기_를 클릭하세요.

   ![Users can transfer stock between warehouses](./setting-inventory-by-warehouse/images/05.png)

1. 선택한 SKU의 40개 단위를 미국 - 남서부 창고에서 미국 - 북서부 창고로 이전하려면 다음 정보를 입력하십시오.

   * **수량**: 40
   * **출처**: 미국 - 남서부
   * **목적지**: 미국 - 북서부

   ![Enter the quantity, source, and destination to transfer stock.](./setting-inventory-by-warehouse/images/03.png)

1. _제출_을 클릭하세요.

이제 각 창고에 대해 업데이트된 재고를 볼 수 있습니다.

## 관련 주제

* [상업 창고 설치](./setting-up-warehouses.md) 
* [재고관리 참고가이드](./inventory-management-reference-guide.md) 
