# 제품 상태 관리

제품을 편집할 때 만료되도록 예약하거나 수동으로 게시를 취소하여 상점 카탈로그에서 제거할 수 있습니다.

## 제품 만료 날짜 설정

제품 또는 개별 SKU의 만료 날짜를 설정합니다. 만료된 제품 SKU는 스토어 카탈로그에서 제거되며 더 이상 구매할 수 없거나 검색 결과에 표시되지 않습니다.

```{note}
제품 수준에서 만료 날짜를 설정하면 제품의 모든 SKU에 적용됩니다. 
```

다음과 같이하세요:

1. **글로벌 메뉴**(![Global Menu](../images/icon-applications-menu.png)) 메뉴를 열고 **상거래** &rarr; **제품** 로 이동합니다.

1. 제품을 클릭합니다.

1. 일정에서 **만료 안 함** 선택 취소합니다. 이 구성은 제품의 모든 SKU에 영향을 미칩니다.

1. 만료 날짜와 시간을 입력합니다.

   ![제품의 유통기한을 설정합니다.](./managing-product-status/images/01.png)

   ```{tip}
   만료 날짜 및 시간은 Liferay 인스턴스의 시간대를 기반으로 합니다. 시간대를 보거나 변경하려면 *글로벌 메뉴*(![글로벌 메뉴](../images/icon-applications-menu.png))를 열고 다음으로 이동하십시오. *제어판* &rarr; *인스턴스 설정*으로. 그런 다음 *Localization* &rarr; *Time Zone*으로 이동합니다.
   ```

1. **게시** 클릭합니다.

제품이 만료 날짜 및 시간에 도달하면 Liferay의 다음 확인 간격까지 활성 상태로 유지됩니다. 기본 간격은 15분이지만 시스템 설정을 통해 구성할 수 있습니다. **전역 메뉴**(![Global Menu](../images/icon-applications-menu.png))을 열고 **제어판** &rarr; **시스템 설정** 로 이동합니다. 여기에서 **Catalog** &rarr; **Products** 로 이동합니다. **검사 간격** 값을 변경하고 **저장** 클릭합니다.

만료 후에는 제품의 SKU가 더 이상 상점 카탈로그에 표시되지 않으며 구매할 수 없습니다. 교체와 함께 개별 SKU의 만료 날짜를 설정하는 방법을 알아보려면 [교체 제품](../pricing/promoting-products/replacement-products.md)을 참조하십시오.

![제품은 만료 날짜가 지난 후 Expired 상태입니다.](./managing-product-status/images/02.png)

새 만료 날짜를 입력하고 제품을 다시 게시하여 제품 가시성을 변경할 수 있습니다.

## 제품을 초안으로 설정

원하는 경우 수동으로 제품 게시를 취소하여 상태를 **초안** 로 설정할 수 있습니다. 초안 중에는 제품의 SKU가 더 이상 상점 카탈로그에 표시되지 않으며 구매할 수 없습니다. 이는 최종 사용자가 변경 사항을 즉시 사용할 수 있도록 하지 않고 제품을 편집하려는 경우에 유용합니다. 재고 부족 조치를 사용하여 재고 수준에 따라 제품 게시를 취소할 수도 있습니다. 자세한 내용은 [재고 부족 조치](./low-stock-action.md) 참조하십시오.

제품 게시를 수동으로 취소하려면 다음 단계를 따르세요.

1. **글로벌 메뉴**(![Global Menu](../images/icon-applications-menu.png))을 열고 **상거래** &rarr; **제품** 로 이동합니다.

1. 제품을 클릭합니다.

1. 게시 버튼 옆에 있는 **작업** 버튼(![Actions Button](../images/icon-actions.png))을 클릭하고 **초안으로 변환** 선택합니다.

   ![초안으로 저장을 선택하여 제품을 초안 상태로 변환합니다.](./managing-product-status/images/03.png)

1. **확인** 클릭하여 확인합니다.

이렇게 하면 상점의 카탈로그 페이지에서 제품이 제거되어 고객이 제품을 보거나 구매하거나 검색할 수 없습니다.

![변환 후 제품 상태는 초안입니다.](./managing-product-status/images/04.png)

제품 게시를 위한 승인 워크플로가 있는 경우 제품을 다시 게시하려면 이를 거쳐야 합니다. 상점 첫화면에서 제품을 제거하고 승인 워크플로우를 거치지 않고 다시 게시하려면 **게시됨** 확인란을 선택 취소하고 **게시** 클릭하면 됩니다.

![게시된 확인란을 선택 취소하여 상점 첫화면에서 제품을 제거합니다.](./managing-product-status/images/05.png)

## 상거래 2.1 이하

### 제품을 만료됨으로 설정

제품을 만료하려면,

1. **제어판** &rarr; **상거래** &rarr; **제품** 로 이동합니다.

1. 제품을 클릭합니다.

1. **제품 세부 정보** 탭에서 **만료되지 않음** 확인란의 선택을 취소합니다. 이 구성은 제품의 모든 SKU에 영향을 미칩니다.

1. 향후 만료 날짜 및 시간을 입력합니다. 모든 시간은 GMT 시간대를 사용하여 설정됩니다.

    ![제품의 만료 날짜를 설정합니다.](./managing-product-status/images/01.png)

1. **게시** 클릭합니다.

변경 후 기본 확인 간격이 15분이므로 카탈로그에서 제품을 제거하는 데 다소 시간이 걸릴 수 있습니다. **전역 메뉴**(![Global Menu](../images/icon-applications-menu.png))를 열고 **제어판** &rarr; **시스템 설정** 으로 이동하여 이를 변경합니다. 여기에서 **Catalog** &rarr; **Products** 로 이동합니다. **검사 간격** 값을 변경하고 **저장** 클릭합니다.

![제품은 만료 날짜가 지난 후 Expired 상태입니다.](./managing-product-status/images/06.png)

새 만료 날짜를 입력하고 제품을 다시 게시하여 제품 가시성을 변경할 수 있습니다.

### 제품을 초안으로 설정

1. **제어판** &rarr; **상거래** &rarr; **제품** 로 이동합니다.

1. 제품을 클릭합니다.

1. **초안** 로 저장을 클릭합니다.

상품을 초안 상태로 설정한 후에는 스토어에서 상품을 검색하거나 볼 수 없습니다.

![변환 후 제품 상태는 초안입니다.](./managing-product-status/images/04.png)

제품을 게시하기 위한 승인 워크플로가 있는 경우 제품을 다시 게시하려면 이를 거쳐야 합니다. 상점 첫화면에서 제품을 제거하고 승인 워크플로우를 거치지 않고 다시 게시하려면 **게시됨** 확인란을 선택 취소하고 **게시** 클릭하면 됩니다.

![게시된 확인란을 선택 취소하여 상점 첫화면에서 제품을 제거합니다.](./managing-product-status/images/05.png)

## 관련 주제

* [채널을 사용하여 제품 가시성 구성](../store-management/channels/configuring-product-visibility-using-channels.md)
* [간단한 제품 만들기](../product-management/creating-and-managing-products/product-types/creating-a-simple-product.md)
* [그룹화된 제품 만들기](../product-management/creating-and-managing-products/product-types/creating-a-grouped-product.md)
* [가상 제품 만들기](../product-management/creating-and-managing-products/product-types/creating-a-virtual-product.md)
* [재고 부족 조치](./low-stock-action.md)
