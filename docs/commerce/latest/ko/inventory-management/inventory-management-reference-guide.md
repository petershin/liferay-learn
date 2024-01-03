# 재고 관리 참조 가이드

인벤토리 설정에 액세스하려면 _글로벌 메뉴_(![글로벌 메뉴](../images/icon-applications-menu.png))를 열고 _Commerce_ &rarr; _Inventory_로 이동하세요.

![Navigate to the inventory settings from the Global Menu.](./inventory-management-reference-guide/images/01.png)

페이지에는 제품 SKU, 해당 단위 및 가용성이 표시됩니다.

![This page tracks all catalog SKUs and displays their availability.](./inventory-management-reference-guide/images/02.png)

| 분야   | 묘사                                                                                                                                                                                                                                                                                                          |
| :--- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| SKU  | 인벤토리 시스템의 기본 식별자입니다.                                                                                                                                                                                                                                                                                        |
| 어옴   | [SKU에 대해 측정 단위](../product-management/creating-and-managing-products/products/units-of-measure.md) 이 구성되었습니다. {bdg-secondary}`liferay DXP 2023.Q4+/포탈 7.4 GA98+`                                                                                                                                   |
| 손에   | SKU에 사용 가능한 총 단위 수 또는 모든 창고의 측정 단위입니다.                                                                                                                                                                                                                                                                      |
| 유효한  | SKU 또는 측정 단위에 대해 구매 가능한 단위 수입니다. Liferay의 계산: [사용 가능한 수량] = [보유 수량] - [주문 수량] - [안전 재고 수량]. |
| 주문 시 | SKU 또는 측정 단위에 대한 미결 주문에 할당된 단위 수입니다. 이 수량은 주문이 배송될 때 소비됩니다.                                                                                                                                                                                                                                                 |
| 들어오는 | SKU에 대한 보충이 예정되어 있지만 아직 수령되지 않은 상품 수입니다. 값은 정보 제공용일 뿐이며 계산을 기반으로 하지 않습니다. 관리자는 이를 사용하여 향후 수량을 추적할 수 있습니다.                                                                                                                                                                                                   |

## SKU 세부정보

개별 SKU를 볼 때 개요, 주문 중, 수신 및 변경 로그의 네 가지 탭이 있습니다.

### 개요

개요 탭에는 모든 창고의 SKU 재고 요약이 표시됩니다.

![The Overview tab displays a summary of the inventory across all warehouses.](./inventory-management-reference-guide/images/03.png)

| 분야    | 묘사                     |
| :---- | :--------------------- |
| 창고    | SKU가 있는 창고 목록입니다.      |
| 손에    | 안전 재고를 포함한 보유 단위 수입니다. |
| 안전 재고 | 안전 재고로 예약된 단위 수입니다.    |
| 유효한   | 구매할 수 있는 단위 수입니다.      |
| 들어오는  | 창고에 예정된 입고 단위 수입니다.    |

재고를 업데이트하거나 창고 간 재고를 이동하려면 _추가_(![추가 버튼](../images/icon-add.png))를 클릭하세요.

![Add inventory or transfer inventory between warehouses.](./inventory-management-reference-guide/images/04.png)

### 주문 시

주문 중 탭에는 이 SKU를 주문한 계정 목록이 표시됩니다. 탭에는 주문 ID, 주문 수량 및 만료 날짜도 표시됩니다.

![The On Order tab lists the accounts that have placed an order for the selected SKU.](./inventory-management-reference-guide/images/05.png)

### 들어오는

수신 탭에는 SKU에 대한 재고 보충이 예정된 창고가 나열됩니다.

![The Incoming tab lists warehouses with scheduled inventory replenishment for the SKU.](./inventory-management-reference-guide/images/06.png)

_추가_(![추가 버튼](../images/icon-add.png))를 클릭하여 선택한 SKU에 대한 수신 항목을 생성합니다.

![Add a quantity for a particular warehouse.](./inventory-management-reference-guide/images/07.png)

| 분야     | 묘사                  |
| :----- | :------------------ |
| 양      | 들어오는 품목의 수량입니다.     |
| 대상     | 입고된 물품을 보관하는 창고입니다. |
| 예상 배송일 | 배송예정일.              |

### 변경 로그

자세한 내용은 [재고 변경 보기](./using-the-inventory-management-system.md#viewing-inventory-changes) 참조하십시오.

## 커머스 2.1 이하

인벤토리 설정은 제어판에 있습니다. 액세스하려면 _제어판_ &rarr; _상거래_ &rarr; _인벤토리_로 이동하세요.

## 관련 주제

* [제품 변형에 대한 SKU 생성](../product-management/creating-and-managing-products/products/creating-skus-for-product-variants.md) 
* [재고 부족 조치](./low-stock-action.md) 
* [상업 창고 설치](./setting-up-warehouses.md) 
* [창고 참조 가이드](./warehouse-reference-guide.md) 
