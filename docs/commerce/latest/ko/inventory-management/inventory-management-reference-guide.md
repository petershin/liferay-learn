# 재고 관리 참조 안내서

재고 설정에 액세스하려면 **전역 메뉴**(![Global Menu](../images/icon-applications-menu.png))을 열고 **Commerce** &rarr; **Inventory** 로 이동합니다.

![전역 메뉴에서 인벤토리 설정으로 이동합니다.](./inventory-management-reference-guide/images/01.png)

이 페이지에는 제품 SKU 및 해당 가용성이 표시됩니다.

![이 페이지는 모든 카탈로그 SKU를 추적하고 해당 SKU의 가용성을 표시합니다.](./inventory-management-reference-guide/images/02.png)

| 분야   | 묘사                                                                                                       |
|:---- |:-------------------------------------------------------------------------------------------------------- |
| SKU  | 인벤토리 시스템의 기본 식별자입니다.                                                                                     |
| 손에   | 모든 창고에서 SKU에 대해 사용 가능한 총 단위 수입니다.                                                                        |
| 유효한  | SKU에 대해 구매 가능한 단위 수입니다. Liferay의 계산: [사용 가능한 수량] = [보유 수량] - [주문 수량] - [안전 재고 수량].                       |
| 주문 시 | SKU에 대한 미결 주문에 할당된 단위 수입니다. 이 수량은 주문이 배송될 때 소비됩니다.                                                       |
| 들어오는 | SKU에 대한 보충으로 예약되었지만 아직 수령하지 않은 단위 수입니다. 값은 정보를 제공할 뿐이며 계산을 기반으로 하지 않습니다. 관리자는 이를 사용하여 향후 수량을 추적할 수 있습니다. |

## SKU 세부 정보

개별 SKU를 볼 때 개요, 주문 시, 수신 및 변경 로그의 네 가지 탭이 있습니다.

### 개요

개요 탭에는 모든 창고의 SKU 재고 요약이 표시됩니다.

![개요 탭에는 모든 창고의 재고 요약이 표시됩니다.](./inventory-management-reference-guide/images/03.png)

| 분야    | 묘사                           |
|:----- |:---------------------------- |
| 창고    | SKU가 있는 창고 목록입니다.            |
| 손에    | 안전 재고를 포함하여 소유하고 있는 단위 수입니다. |
| 안전 재고 | 안전 재고로 예약된 단위 수입니다.          |
| 유효한   | 구매 가능한 단위 수입니다.              |
| 들어오는  | 창고에 예정된 입고 단위 수입니다.          |

**추가**(![Add Button](../images/icon-add.png))을 클릭하여 재고를 업데이트하거나 창고 간에 재고를 이동합니다.

![재고를 추가하거나 창고 간에 재고를 이동합니다.](./inventory-management-reference-guide/images/04.png)

### 주문 시

On Order 탭에는 이 SKU를 주문한 계정 목록이 표시됩니다. 이 탭에는 주문 ID, 주문 수량 및 만료 날짜도 표시됩니다.

![주문 중 탭에는 선택한 SKU를 주문한 계정이 나열됩니다.](./inventory-management-reference-guide/images/05.png)

### 들어오는

수신 탭에는 SKU에 대해 예약된 재고 보충이 있는 창고가 나열됩니다.

![수신 탭에는 SKU에 대해 예약된 재고 보충이 있는 창고가 나열됩니다.](./inventory-management-reference-guide/images/06.png)

**추가**(![Add Button](../images/icon-add.png))을 클릭하여 선택한 SKU에 대한 수신 항목을 생성합니다.

![특정 창고에 대한 수량을 추가하십시오.](./inventory-management-reference-guide/images/07.png)

| 분야     | 묘사                |
|:------ |:----------------- |
| 양      | 들어오는 아이템 수량.      |
| 대상     | 들어오는 물품이 보관되는 창고. |
| 예상 배송일 | 배송 예정일.           |

### 변경 로그

자세한 내용은 [인벤토리 변경 보기](./using-the-inventory-management-system.md#viewing-inventory-changes) 참조하십시오.

## 상거래 2.1 이하

인벤토리 설정은 제어판에 있습니다. 액세스하려면 **제어판** &rarr; **상거래** &rarr; **재고** 로 이동하십시오.

## 추가 정보

* [제품 변형에 대한 SKU 만들기](../product-management/creating-and-managing-products/products/creating-skus-for-product-variants.md)
* [재고 부족 조치](./low-stock-action.md)
* [상업 창고 설정](./setting-up-warehouses.md)
* [창고 참조 가이드](./warehouse-reference-guide.md)
