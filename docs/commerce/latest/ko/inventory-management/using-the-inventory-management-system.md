# 재고 관리 시스템 사용

Liferay의 재고 관리 시스템을 사용하여 인스턴스의 제품 SKU에 대한 재고를 관리할 수 있습니다. 이 시스템은 SKU 관리를 위해 다음 기능을 제공합니다.

* 인벤토리 추가
* 주문 보기
* 안전 재고 추가
* 기록 변경사항 보기

제품 SKU 또는 [측정 단위](../product-management/creating-and-managing-products/products/units-of-measure.md) 에 대한 재고를 추가하기 전에 재고를 보관할 창고를 하나 이상 생성해야 합니다. 자세한 내용은 [창고 설정](./setting-up-warehouses.md) 참조하십시오.

인벤토리 페이지에 액세스하려면 **글로벌 메뉴**(![글로벌 메뉴](../images/icon-applications-menu.png))를 열고 **Commerce** &rarr; **Inventory** 로 이동하세요.

```{note}
Commerce 2.0 또는 2.1을 사용하는 경우 재고 관리 옵션은 제어판에 있습니다.
```

## SKU에 대한 재고 추가

{bdg-secondary}`Liferay DXP 2023.Q4+/Portal 7.4 GA98+` SKU에 대해 [측정 단위](../product-management/creating-and-managing-products/products/units-of-measure.md) 가 구성된 경우 재고는 SKU에 대해 해당 단위로 추적됩니다. 그렇지 않으면 재고가 SKU 수준에서 추적됩니다.

재고 항목을 생성할 때 SKU, 창고 및 수량을 지정해야 합니다. SKU가 없으면 제품에 재고를 추가할 수 없습니다.

다음과 같이하세요:

1. **글로벌 메뉴**(![글로벌 메뉴](../images/icon-applications-menu.png))를 열고 **Commerce** &rarr; **Inventory** 로 이동합니다.

1. **추가**(![추가 버튼](../images/icon-add.png))를 클릭하고 SKU, 창고, 수량을 입력하세요. 예를 들어,

   * **SKU** : 도자기-회색
   * **창고** : 미국 - 남서부
   * **수량** : 120

   ![Enter the SKU, warehouse and quantity for the new inventory item.](./using-the-inventory-management-system/images/01.png)

1. **제출** 을 클릭하세요.

선택한 창고의 SKU에 대한 재고가 추가됩니다.

```{tip}
제품 애플리케이션에서 SKU를 편집하는 동안 SKU에 대한 재고를 추가할 수 있습니다. 자세한 내용은 [SKU 재고](../product-management/creating-and-managing-products/products/creating-skus-for-product-variants.md#adding-sku-inventory) 추가를 참조하십시오.
```

## 안전 재고 설정

안전 재고는 별도로 보관되어 판매가 불가능한 창고의 제품 재고입니다. 이는 배송 지연, 공급망 중단, 다른 채널에서의 판매 또는 기타 여러 가지 이유로 인해 발생할 수 있습니다. 안전 재고 수량은 선택한 창고의 가용 재고를 줄입니다.

안전 재고 수량을 설정하려면

1. **글로벌 메뉴**(![글로벌 메뉴](../images/icon-applications-menu.png))를 열고 **Commerce** &rarr; **Inventory** 로 이동합니다.

1. **SKU** 를 클릭합니다.

1. 창고 옆에 있는 **작업**(![작업 버튼](../images/icon-actions.png))을 클릭하고 **편집** 을 선택합니다.

1. **안전 재고 수량** 필드에 값을 입력합니다.

   ![Set a safety stock quantity for the selected SKU.](./using-the-inventory-management-system/images/02.png)

1. 완료되면 **저장** 을 클릭하세요.

사용 가능한 단위 수는 안전 재고 수량에 따라 감소됩니다. 사용 가능 열에서 이를 확인할 수 있습니다.

![Setting a safety stock quantity reduces available stock in a warehouse.](./using-the-inventory-management-system/images/03.png)

## 주문 시 SKU 보기

1. **글로벌 메뉴**(![글로벌 메뉴](../images/icon-applications-menu.png))를 열고 **Commerce** &rarr; **Inventory** 로 이동합니다.

1. **SKU** 를 클릭합니다.

1. **주문 시** 탭을 클릭하세요.

   ![View all orders that include the selected SKU.](./using-the-inventory-management-system/images/04.png)

이 페이지에는 선택한 SKU가 포함된 모든 주문이 나열됩니다. 주문한 계정, 주문ID, 수량, 유효기간 등을 확인할 수 있습니다.

## 입고 재고 추가

입고 재고는 향후 창고에 도착할 예정인 SKU 재고입니다. 입고되는 재고 수량과 예상 배송 날짜를 추가할 수 있습니다.

1. **글로벌 메뉴**(![글로벌 메뉴](../images/icon-applications-menu.png))를 열고 **Commerce** &rarr; **Inventory** 로 이동합니다.

1. **SKU** 를 클릭합니다.

1. **수신** 탭을 클릭하세요.

1. **추가**(![추가 버튼](../images/icon-add.png))를 클릭하고 수량, 도착 창고, 예상 배송 날짜를 입력하세요. 예를 들어,

   * **수량** : 20
   * **목적지** : 미국 - 북동부
   * **예상 배송 날짜** : 2022년 11월 20일(향후 날짜임)

   ![Add incoming stock for the selected SKU.](./using-the-inventory-management-system/images/05.png)

1. **제출** 을 클릭하세요.

입고 재고를 추가하면 개요 페이지의 입고 열 아래에 해당 재고가 표시됩니다.

![The incoming stock quantity appears on the SKU's Overview page.](./using-the-inventory-management-system/images/06.png)

## 재고 변경 사항 보기

변경 로그 페이지에서 SKU 재고의 변경 사항을 볼 수 있습니다.

1. **글로벌 메뉴**(![글로벌 메뉴](../images/icon-applications-menu.png))를 열고 **Commerce** &rarr; **Inventory** 로 이동합니다.

1. **SKU** 를 클릭합니다.

1. **Changelog** 탭을 클릭하세요.

변경 로그에서 이 정보를 볼 수 있습니다.

* 주문 후 주문을 이행하기 위해 예약된 SKU 단위입니다.
* 배송을 생성하고 이전에 예약된 금액을 약정한 후 재고에서 제거된 SKU의 단위입니다.
* 창고의 재고에 추가된 SKU의 단위입니다.
* SKU의 단위가 창고 간에 이동되었습니다.
* 배송 취소 후 SKU 단위가 반품되었습니다.
* 재고의 SKU를 업데이트합니다.

![View different events associated to the inventory of the selected SKU.](./using-the-inventory-management-system/images/07.png)

## 관련 주제

* [재고관리 참고가이드](./inventory-management-reference-guide.md)
* [창고 참조 가이드](./warehouse-reference-guide.md)
* [창고별 재고 설정](./setting-inventory-by-warehouse.md)
