# 제품현황 관리

제품을 편집할 때 만료되도록 예약하거나 수동으로 게시를 취소하여 스토어 카탈로그에서 제거할 수 있습니다.

## 제품 만료일 설정

제품 또는 개별 SKU의 만료 날짜를 설정합니다. 만료된 제품 SKU는 상점 카탈로그에서 제거되어 더 이상 구매할 수 없거나 검색 결과에 표시되지 않습니다.

```{note}
제품 수준에서 만료 날짜를 설정하면 해당 제품의 모든 SKU에 적용됩니다. 
```

다음과 같이하세요:

1. **글로벌 메뉴**(![글로벌 메뉴](../images/icon-applications-menu.png)) 메뉴를 열고 **Commerce** &rarr; **제품** 으로 이동합니다.

1. 제품을 클릭하세요.

1. 일정에서 **만료되지 않음** 을 선택 취소하세요. 이 구성은 제품의 모든 SKU에 영향을 미칩니다.

1. 만료 날짜와 시간을 입력하세요.

   ![Set the product's expiration date.](./managing-product-status/images/01.png)

   ```{tip}
   만료 날짜 및 시간은 Liferay 인스턴스의 시간대를 기준으로 합니다. 시간대를 보거나 변경하려면 *전역 메뉴*(![전역 메뉴](../images/icon-applications-menu.png))를 열고 *제어판* &rarr; *인스턴스 설정*으로 이동하세요. 그런 다음 *현지화* &rarr; *시간대*로 이동합니다.
   ```
1. **게시** 를 클릭하세요.

제품이 만료 날짜 및 시간에 도달하면 Liferay의 다음 확인 간격까지 활성 상태로 유지됩니다. 기본 간격은 15분이지만 시스템 설정을 통해 구성할 수 있습니다. **전역 메뉴**(![전역 메뉴](../images/icon-applications-menu.png))를 열고 **제어판** &rarr; **시스템 설정** 으로 이동합니다. 거기에 도달하면 **카탈로그** &rarr; **제품** 으로 이동합니다. **확인 간격** 값을 변경하고 **저장** 을 클릭합니다.

```{warning}
이 기능을 비활성화하려면 해당 구성 요소를 블랙리스트 <a href="https://learn.liferay.com/web/guest/w/dxp/system-administration/installing-and-managing-apps/managing-apps/blacklisting-osgi-components.md">. 간격에 0이나 음수를 입력하지 마십시오.
```
만료된 후에는 해당 제품의 SKU가 더 이상 매장 카탈로그에 표시되지 않으며 구매할 수 없습니다. 교체 제품과 함께 개별 SKU의 만료 날짜를 설정하는 방법을 알아보려면 [교체 제품](../pricing/promoting-products/replacement-products.md) 을 참조하세요.

![The product has a status of Expired after passing the expiration date.](./managing-product-status/images/02.png)

새 만료 날짜를 입력하고 제품을 다시 게시하여 제품 표시 여부를 변경할 수 있습니다.

## 제품을 초안으로 설정

원하는 경우 제품 게시를 수동으로 취소하여 상태를 **초안** 으로 설정할 수 있습니다. 초안인 동안에는 해당 제품의 SKU가 더 이상 매장 카탈로그에 표시되지 않으며 구매할 수 없습니다. 이는 변경 사항을 최종 사용자에게 즉시 제공하지 않고 제품을 편집하려는 경우에 유용합니다. 재고 부족 조치를 사용하여 재고 수준에 따라 제품 게시를 취소할 수도 있습니다. 자세한 내용은 [재고 부족 조치](./low-stock-action.md) 참조하십시오.

제품 게시를 수동으로 취소하려면 다음 단계를 따르세요.

1. **글로벌 메뉴**(![글로벌 메뉴](../images/icon-applications-menu.png))를 열고 **Commerce** &rarr; **제품** 으로 이동합니다.

1. 제품을 클릭하세요.

1. 게시 버튼 옆에 있는 **작업** 버튼(![작업 버튼](../images/icon-actions.png))을 클릭하고 **초안으로 변환** 을 선택합니다.

   ![Select Save as Draft to convert the product into draft status.](./managing-product-status/images/03.png)

1. **확인** 을 클릭하여 확인하세요.

이렇게 하면 매장의 카탈로그 페이지에서 제품이 제거되어 고객이 해당 제품을 보거나 구매하거나 검색할 수 없습니다.

![The product has a status of Draft after converting it.](./managing-product-status/images/04.png)

제품을 게시하기 위한 승인 워크플로가 있는 경우 이를 통해 제품을 다시 게시해야 합니다. 승인 워크플로를 거치지 않고 스토어에서 제품을 제거하고 다시 게시하려면 **게시됨** 확인란을 선택 취소하고 **게시** 를 클릭하세요.

![Unchecking the published checkbox to remove the product from the storefront.](./managing-product-status/images/05.png)

## 커머스 2.1 이하

### 제품을 만료됨으로 설정

제품을 만료시키려면,

1. **제어판** &rarr; **상거래** &rarr; **제품** 으로 이동합니다.

1. 제품을 클릭하세요.

1. **제품 세부정보** 탭에서 **만료되지 않음** 확인란을 선택 취소하세요. 이 구성은 제품의 모든 SKU에 영향을 미칩니다.

1. 향후 만료 날짜와 시간을 입력하세요. 모든 시간은 GMT 시간대를 사용하여 설정됩니다.

   ![Set the Product's Expiration Date.](./managing-product-status/images/01.png)

1. **게시** 를 클릭하세요.

기본 확인 간격은 15분이므로 변경 후 카탈로그에서 제품을 제거하는 데 다소 시간이 걸릴 수 있습니다. **전역 메뉴**(![전역 메뉴](../images/icon-applications-menu.png))를 열고 **제어판** &rarr; **시스템 설정** 으로 이동하여 이를 변경합니다. 일단 **카탈로그** &rarr; **제품** 으로 이동하세요. **확인 간격** 값을 변경하고 **저장** 을 클릭합니다.

![The product has a status of Expired after passing the expiration date.](./managing-product-status/images/06.png)

새 만료 날짜를 입력하고 제품을 다시 게시하여 제품 표시 여부를 변경할 수 있습니다.

### 제품을 초안으로 설정

1. **제어판** &rarr; **상거래** &rarr; **제품** 으로 이동합니다.

1. 제품을 클릭하세요.

1. **초안으로 저장** 을 클릭하세요.

드래프트 상태로 설정하신 후에는 해당 상품을 검색하거나 매장에서 보실 수 없습니다.

![The product has a status of Draft after converting it.](./managing-product-status/images/04.png)

제품을 게시하기 위한 승인 워크플로가 있는 경우 이를 통해 제품을 다시 게시해야 합니다. 승인 워크플로를 거치지 않고 스토어에서 제품을 제거하고 다시 게시하려면 **게시됨** 확인란을 선택 취소하고 **게시** 를 클릭하세요.

![Unchecking the published checkbox to remove the product from the storefront.](./managing-product-status/images/05.png)

## 관련 주제

* [채널을 사용하여 제품 가시성 구성](../store-management/channels/configuring-product-visibility-using-channels.md)
* [간단한 제품 만들기](../product-management/creating-and-managing-products/product-types/creating-a-simple-product.md)
* [그룹상품 만들기](../product-management/creating-and-managing-products/product-types/creating-a-grouped-product.md)
* [가상상품 생성](../product-management/creating-and-managing-products/product-types/creating-a-virtual-product.md)
* [재고 부족 조치](./low-stock-action.md)
