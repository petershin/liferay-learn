
# 재고 관리 시스템 사용

Liferay의 재고 관리 시스템을 사용하여 인스턴스에서 제품 SKU의 재고를 관리할 수 있습니다. 이 시스템은 SKU 관리를 위해 다음과 같은 기능을 제공합니다.

* 인벤토리 추가
* 주문 보기
* 안전 재고 추가
* 이전 변경 사항 보기

제품 SKU에 대한 재고를 추가하기 전에 재고를 저장할 창고를 하나 이상 생성해야 합니다. 자세한 내용은 [창고 설정](./setting-up-warehouses.md) 참조하십시오.

인벤토리 페이지에 액세스하려면 **글로벌 메뉴**(![Global Menu](../images/icon-applications-menu.png))을 열고 **Commerce** &rarr; **Inventory** 로 이동합니다.

```{note}
Commerce 2.0 또는 2.1을 사용하는 경우 인벤토리 관리 옵션은 제어판에 있습니다.
```

## SKU에 대한 재고 추가

재고는 SKU 수준에서 추적됩니다. 재고 항목을 생성할 때 SKU, 창고 및 수량을 지정해야 합니다. SKU가 없으면 제품에 재고를 추가할 수 없습니다.

다음과 같이하세요:

1. **글로벌 메뉴**(![Global Menu](../images/icon-applications-menu.png))을 열고 **Commerce** &rarr; **Inventory** 로 이동합니다.

1. **추가**(![Add Button](../images/icon-add.png))을 클릭하고 SKU, 창고 및 수량을 입력합니다. 예를 들어,

   * **SKU** : 도자기-회색
   * **창고** : 미국 - 남서부
   * **수량** : 120

   ![새 재고 항목에 대한 SKU, 창고 및 수량을 입력하십시오.](./using-the-inventory-management-system/images/01.png)

1. **제출** 클릭합니다.

이렇게 하면 선택한 창고에 SKU의 재고가 추가됩니다.

```{tip}
제품 애플리케이션에서 SKU를 편집하는 동안 SKU에 대한 재고를 추가할 수 있습니다. 자세한 내용은 [SKU 인벤토리 추가](../product-management/creating-and-managing-products/products/creating-skus-for-product-variants.md#adding-sku-inventory) 를 참조하세요.
```

## 안전 재고 설정

안전 재고는 창고에 보관되어 있어 판매할 수 없는 제품 재고입니다. 이는 배송 지연, 공급망 중단, 다른 채널에서의 판매 또는 기타 여러 가지 이유와 같은 상황일 수 있습니다. 안전 재고 수량은 선택한 창고의 사용 가능한 재고를 줄입니다.

안전 재고 수량을 설정하려면

1. **글로벌 메뉴**(![Global Menu](../images/icon-applications-menu.png))을 열고 **Commerce** &rarr; **Inventory** 로 이동합니다.

1. **SKU** 을 클릭합니다.

1. 창고 옆에 있는 **Actions**(![Actions Button](../images/icon-actions.png))를 클릭하고 **Edit** 선택합니다.

1. **안전 재고 수량** 필드에 값을 입력합니다.

   ![선택한 SKU의 안전 재고 수량을 설정합니다.](./using-the-inventory-management-system/images/02.png)

1. 완료되면 **저장** 클릭합니다.

사용 가능한 단위 수는 안전 재고 수량만큼 줄어듭니다. 사용 가능 열에서 이를 확인할 수 있습니다.

![안전 재고 수량을 설정하면 창고의 사용 가능한 재고가 줄어듭니다.](./using-the-inventory-management-system/images/03.png)

## 주문 시 SKU 보기

1. **글로벌 메뉴**(![Global Menu](../images/icon-applications-menu.png))을 열고 **Commerce** &rarr; **Inventory** 로 이동합니다.

1. **SKU** 을 클릭합니다.

1. **On Order** 탭을 클릭합니다.

   ![선택한 SKU가 포함된 모든 주문을 봅니다.](./using-the-inventory-management-system/images/04.png)

이 페이지에는 선택한 SKU가 포함된 모든 주문이 나열됩니다. 주문한 계정, 주문ID, 수량, 유통기한을 조회할 수 있습니다.

## 입고 재고 추가

입고 재고는 미래 날짜에 창고에 도착할 예정인 SKU 재고입니다. 들어오는 재고 수량과 예상 배송 날짜를 추가할 수 있습니다.

1. **글로벌 메뉴**(![Global Menu](../images/icon-applications-menu.png))을 열고 **Commerce** &rarr; **Inventory** 로 이동합니다.

1. **SKU** 을 클릭합니다.

1. **수신** 탭을 클릭합니다.

1. **추가**(![Add Button](../images/icon-add.png))을 클릭하고 수량, 목적지 창고 및 예상 배송 날짜를 입력합니다. 예를 들어,

    * **수량** : 20
    * **목적지** : 미국 - 북동부
    * **배송예정일** : 2022-11-20 (미래일)

   ![선택한 SKU에 대한 입고 재고를 추가하십시오.](./using-the-inventory-management-system/images/05.png)

1. **제출** 클릭합니다.

입고 재고를 추가하면 개요 페이지의 입고 열 아래에 나타납니다.

![입고 재고 수량이 SKU의 개요 페이지에 나타납니다.](./using-the-inventory-management-system/images/06.png)

## 인벤토리 변경 사항 보기

변경 로그 페이지에서 SKU의 재고 변경 사항을 볼 수 있습니다.

1. **글로벌 메뉴**(![Global Menu](../images/icon-applications-menu.png))을 열고 **Commerce** &rarr; **Inventory** 로 이동합니다.

1. **SKU** 을 클릭합니다.

1. **변경 로그** 탭을 클릭합니다.

변경 로그에서 이 정보를 볼 수 있습니다.

* 주문 후 주문을 이행하기 위해 예약된 SKU 단위입니다.
* 배송을 생성하고 이전에 예약한 금액을 약정한 후 재고에서 제거된 SKU 단위입니다.
* 창고 재고에 추가된 SKU 단위입니다.
* SKU 단위가 창고 사이를 이동했습니다.
* 배송 취소 후 반품된 SKU 단위입니다.
* 인벤토리의 SKU 업데이트.

![선택한 SKU의 인벤토리와 관련된 다양한 이벤트를 봅니다.](./using-the-inventory-management-system/images/07.png)

## 추가 정보

* [재고 관리 참조 안내서](./inventory-management-reference-guide.md)
* [창고 참조 가이드](./warehouse-reference-guide.md)
* [창고별 재고 설정](./setting-inventory-by-warehouse.md)
