# 가격표에 제품 추가

[가격 목록](./creating-a-price-list.md) 생성한 후 가격 항목을 생성하여 제품 SKU를 추가하세요. 이러한 항목은 제품의 단가를 결정하고 적격 고객에 대한 SKU의 기본 가격을 재정의할 때 사용됩니다.

제품 SKU의 가격표에 가격 항목을 추가하려면 다음 단계를 따르십시오.

1. _글로벌 메뉴_(![애플리케이션 메뉴 아이콘](../images/icon-applications-menu.png))를 열고 _가격_ &rarr; _가격 목록_으로 이동합니다.

1. 구성하려는 _가격 목록_을 선택하고 _항목_ 탭으로 이동합니다.

1. 원하는 제품을 검색하고 _선택_을 클릭하여 선택한 가격표에 추가하세요.

   제품을 검색할 때 SKU나 키워드 및 문구를 사용할 수 있습니다. 키워드나 문구를 사용하면 SKU별로 해당하는 모든 제품이 반환됩니다.

   ![Search for your products by SKU, keyword, or phrase.](./adding-products-to-a-price-list/images/04.png)

   {bdg-secondary}`Liferay DXP 2023.Q4+/Portal 7.4 GA98+` SKU에 대해 [측정 단위](../product-management/creating-and-managing-products/products/units-of-measure.md) 가 구성된 경우 구성된 각 UOM을 가격표에 별도 항목으로 추가할 수 있습니다.

   ![Search for all units of measure configured for an SKU.](./adding-products-to-a-price-list/images/05.png)

1. 가격 목록을 채우려면 _게시_를 클릭하세요.

## 커머스 2.1 이하

[개의 가격표](./creating-a-price-list.md) 생성되면 여기에 제품을 추가할 수 있습니다. 이 문서에서는 가격표에 제품을 추가하는 두 가지 방법을 설명합니다. 가격 목록을 통해 설정된 가격은 관련 사용자의 특정 SKU에 대해 직접 설정된 가격보다 우선합니다.

### 가격표 메뉴를 통해 가격표에 제품 추가

새 가격표에 다수의 기존 제품을 추가하는 경우 다음 방법을 사용하여 가격표를 신속하게 채웁니다.

1. _제어판_ &rarr; _상거래_ &rarr; _가격 목록_으로 이동하세요.

1. 가격표(이 예에서는 _VIP Customers_)를 클릭합니다.

1. _항목_ 하위 탭을 클릭하세요.

1. (+) 버튼을 클릭합니다.

1. 가격표에 추가할 제품(이 예에서는 _프리미엄 브레이크액_ 및 _프리미엄 브레이크 패드_)을 하나 이상 선택하십시오.

1. _추가_를 클릭하세요.

1. 제품(이 예에서는 _프리미엄 브레이크액_)을 클릭하세요.

1. 다음 필드를 입력하십시오.
   * **가격**: 100
   * **프로모션 가격**: 95

     ![Adding a product to a price list](./adding-products-to-a-price-list/images/01.png)

1. _저장_을 클릭하세요.

이제 제품이 가격표에 추가되었습니다. 필요에 따라 반복합니다.

### 제품 메뉴를 통해 가격표에 제품 추가

새 제품을 생성할 때 다음 방법을 사용하여 기존 가격표에 쉽게 추가할 수 있습니다.

1. _제어판_ &rarr; _Commerce_ &rarr; _제품_으로 이동합니다.

1. 제품(이 예에서는 _프리미엄 브레이크액_)을 클릭하세요.

1. _SKU_ 탭을 클릭합니다.

1. SKU(_MIN93017_)를 클릭하세요.

1. _가격 목록_을 클릭하세요.

   ![Adding Products to a Price List in 2.1](./adding-products-to-a-price-list/images/02.png)

1. 추가(![아이콘 추가](../images/icon-add.png)) 버튼을 클릭합니다.

1. 이 SKU를 추가할 가격표(이 예에서는 _VIP 고객_)를 하나 이상 선택합니다.

1. _추가_를 클릭하세요.

이제 가격표가 제품과 연결되었습니다.

![Adding Products to a Price List in 2.1](./adding-products-to-a-price-list/images/03.png)

이제 제품(_프리미엄 브레이크액_)이 가격표(_VIP 고객_)에 추가되었습니다. 이 가격표나 다른 목록에 제품을 더 추가하려면 단계를 반복합니다.

## 관련 주제

* [가격표 생성](./creating-a-price-list.md)
* [가격 등급 사용](./using-price-tiers.md)
