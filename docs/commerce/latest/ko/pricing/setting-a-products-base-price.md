# 제품 기본 가격 설정

SKU를 생성하면 기본 가격이 없습니다. SKU에 대한 가격 항목은 카탈로그의 기본 가격표에 자동으로 생성되지만 이를 SKU의 실제 가격으로 변경해야 합니다. 추가한 후에는 재정의(예: 다른 가격표 또는 프로모션)가 적용되지 않을 때 이 가격이 SKU의 기본 가격으로 사용됩니다.

## 기본 가격 설정

{bdg-secondary}`Liferay DXP 2023.Q4+/Portal GA98+` SKU 또는 측정 단위에 대한 기본 가격 또는 프로모션 가격을 지정하려면,

1. **글로벌 메뉴**(![애플리케이션 메뉴 아이콘](../images/icon-applications-menu.png))를 열고 **Commerce** &rarr; **제품** 으로 이동합니다.

1. 원하는 상품을 클릭하세요.

1. **SKU** 탭으로 이동하여 원하는 **SKU** 를 클릭합니다.

1. **가격** 탭으로 이동하세요.

1. 기본 가격표 또는 기본 판촉 목록을 선택합니다.

1. **가격표 가격** 필드에 원하는 값을 입력합니다.

1. **저장** 을 클릭하세요.

SKU에 대해 측정 단위 [이](../product-management/creating-and-managing-products/products/units-of-measure.md) 구성된 경우 기본 가격표와 기본 판촉 목록이 각 단위에 대한 별도의 항목으로 나타납니다. 사용 가능한 각 측정 단위에 대해 서로 다른 가격을 구성할 수 있습니다.

{bdg-secondary}`Liferay DXP 2023.Q3/Portal GA97 이하` SKU의 기본 가격을 할당하려면:

1. **글로벌 메뉴**(![애플리케이션 메뉴 아이콘](../images/icon-applications-menu.png))를 열고 **Commerce** &rarr; **제품** 으로 이동합니다.

1. 원하는 상품을 클릭하세요.

1. **SKU** 탭으로 이동하여 원하는 **SKU** 를 클릭합니다.

1. **세부정보** 탭에서 **가격** 아래의 **기본 가격** 필드에 원하는 값을 입력하세요.

   선택적으로 SKU에 대한 **프로모션 가격** 및 **비용** 을 설정할 수도 있습니다.

   ![Set the product's base price.](./setting-a-products-base-price/images/01.png)

   ```{note}
   Liferay DXP 7.4 U42/GA42 이전에는 프로모션 가격을 세일 가격이라고 했습니다.
   ```
1. **게시** 를 클릭하세요.

이제 SKU의 기본 가격과 기타 입력된 값이 설정되었습니다. 이 금액은 언제든지 직접 편집하거나 가격표, 프로모션 가격, 할인을 사용하여 수정할 수 있습니다.

## 커머스 2.1 이하

제품은 레거시 버전의 **제어판** 에 있습니다.

1. **Control Panel** &rarr; **Commerce** &rarr; **Products** 로 이동합니다.

1. 제품(이 예에서는 **토크 컨버터**)을 클릭하세요.

1. **SKU** 탭을 클릭합니다.

1. SKU(이 예에서는 **MIN55859**)를 클릭합니다.

1. **Details** 탭의 가격 섹션에 다음을 입력합니다.

   * **가격** : 34
   * **프로모션 가격** : (비워두세요) (이 필드를 입력하면 위 가격과 프로모션 가격이 모두 제품 페이지에 표시되어 구매자가 인하된 가격을 볼 수 있습니다.)
   * **비용** : 20

   ![Setting a product's base price in 2.1](./setting-a-products-base-price/images/01.png)

1. **게시** 를 클릭하세요.

본 제품 SKU의 기본 가격, 프로모션 가격(선택 사항), 비용(선택 사항)이 설정되었습니다. **Cost** 필드는 마진을 추적하는 데 도움이 될 수 있는 이 SKU의 비용에 해당합니다.

## 관련 주제

* [가격표 생성](./creating-a-price-list.md)
* [할인 생성](./promoting-products/creating-a-discount.md)
