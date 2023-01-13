# 창고별 재고 설정

여러 창고가 있는 상점은 창고별로 제품 재고를 관리할 수 있습니다. _재고_ 메뉴는 사용자가 각 창고에서 판매할 수 있는 제품의 수를 관리하는 곳입니다. [Miniium Accelerator](../starting-a-store/using-the-minium-accelerator-to-jump-start-your-b2b-store.md) 을 사용하여 상점을 만들었다면 이미 생성된 창고가 3개 있습니다.

창고별로 재고를 설정하려면:

1. _글로벌 애플리케이션_ → _커머스_ → _제품_로 이동합니다.
1. 제품을 클릭합니다(예: _U-Joint_).
1. _SKU_ 하위 탭을 클릭합니다.
1. SKU ID(_MIN-55861_)를 클릭합니다.
1. 왼쪽 메뉴에서 _인벤토리_ 을 클릭합니다.
1. 해당 창고의 수량을 입력합니다.

    ![창고별 재고수량 설정](./setting-inventory-by-warehouse/images/01.png)

1. 각 창고에 대해 _저장_ 을 클릭합니다.
1. 제품과 연결된 다른 모든 제품 변형(SKU)에 대해 이 단계를 반복합니다.

이제 각 창고에서 판매할 수 있는 정확한 수량을 갖게 되었습니다.

## 창고 간 재고 이동

상점에 [창고](./setting-up-commerce-warehouses.md)이상이 있는 경우 사용자는 한 창고에서 다른 창고로 재고를 이전할 수 있습니다. 재고는 SKU 수준에서 추적되며 _재고_ 관리에 반영됩니다.

창고 간에 재고를 이전하려면 다음을 수행하십시오.

1. _글로벌 애플리케이션_ 메뉴 &rarr; _상거래_ &rarr; _재고_로 이동합니다.
1. SKU(CREAM-12PACK)를 클릭합니다.
1. (![Add icon](../images/icon-add.png))을 클릭한 다음 _Create Transfer_를 클릭합니다.

    ![사용자는 창고 간에 재고를 이전할 수 있습니다.](./setting-inventory-by-warehouse/images/02.png)

1. 다음을 입력:

    * **수량**: 40
    * **출처**: 미국 - 남서부
    * **목적지**: 미국 - 북서부

    ![수량, 소스 및 대상을 지정합니다.](./setting-inventory-by-warehouse/images/03.png)

1. _제출_을 클릭합니다.

이제 각 창고의 재고 수가 업데이트됩니다.

## 상거래 2.1 이하

제품 및 하위 메뉴 관리는 _제어판_에서 수행됩니다.

창고별로 재고를 설정하려면:

1. _제어판_ → _상거래_ → _제품_로 이동합니다.
1. 제품을 클릭합니다(예: _U-Joint_).
1. _SKU_ 하위 탭을 클릭합니다.
1. SKU ID(_MIN-55861_)를 클릭합니다.
1. 왼쪽 메뉴에서 _인벤토리_ 을 클릭합니다.
1. 해당 창고의 수량을 입력합니다.

    ![창고별 재고수량 설정](./setting-inventory-by-warehouse/images/01.png)

1. 각 창고에 대해 _저장_ 을 클릭합니다.
1. 제품과 연결된 다른 모든 제품 변형(SKU)에 대해 이 단계를 반복합니다.

이제 각 창고에서 판매할 수 있는 정확한 수량을 갖게 되었습니다.

### 창고 간 재고 이동

상점에 [창고](./setting-up-commerce-warehouses.md)이상이 있는 경우 사용자는 한 창고에서 다른 창고로 재고를 이전할 수 있습니다. 재고는 SKU 수준에서 추적되며 _재고_ 관리에 반영됩니다.

창고 간에 재고를 이전하려면 다음을 수행하십시오.

1. _제어판_ &rarr; _상거래_ &rarr; _인벤토리_로 이동합니다.
1. SKU(CREAM-12PACK)를 클릭합니다.
1. (![Add icon](../images/icon-add.png))을 클릭한 다음 _Create Transfer_를 클릭합니다.

    ![사용자는 창고 간에 재고를 이전할 수 있습니다.](./setting-inventory-by-warehouse/images/02.png)

1. 다음을 입력:

    * **수량**: 40
    * **출처**: 미국 - 남서부
    * **목적지**: 미국 - 북서부

    ![수량, 소스 및 대상을 지정합니다.](./setting-inventory-by-warehouse/images/03.png)

1. _제출_을 클릭합니다.

이제 각 창고의 재고 수가 업데이트되었습니다.

## 추가 정보

* [상업 창고 설정](./setting-up-commerce-warehouses.md)
* [재고 관리 참조 가이드](./inventory-management-reference-guide.md)
