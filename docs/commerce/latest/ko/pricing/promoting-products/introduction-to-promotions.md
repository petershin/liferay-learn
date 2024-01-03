# 프로모션 소개

Liferay에서 _프로모션_을 생성하여 모든 고객 또는 일련의 고객에게 프로모션 가격을 제공할 수 있습니다. 프로모션은 제품의 정가와 프로모션 가격의 차이를 시각적으로 보여줍니다. 이는 고객이 받는 할인을 강조하고 개인 또는 고객 그룹에 대해 다양한 가격을 지원하는 데 유용합니다.

![A Promotion showing difference between a product's list price and its promotion price](./introduction-to-promotions/images/01.png)

```{note}
Liferay DXP 7.4 U42/GA42 이전에는 프로모션 가격을 세일 가격이라고 했습니다.
```

## 자격

_자격_ 탭을 클릭하고 적절한 옵션을 선택하여 전체 또는 특정 고객 집합에 대한 판촉 가격을 정의하십시오. 계정, 계정 그룹, 채널 또는 주문 유형을 기준으로 프로모션 범위를 좁힐 수 있습니다.

![Use the eligibility tab to narrow down your promotion to specific accounts, account groups, channels, or order types.](./introduction-to-promotions/images/02.png)

## 입장

항목 탭을 사용하여 특정 SKU에 대한 프로모션을 정의할 수 있습니다. _항목_ 탭을 클릭하고 SKU를 검색한 후 _선택_을 클릭합니다. 선택한 후 항목 섹션에서 SKU를 클릭하고 프로모션 가격을 추가하세요. 자세한 내용은 [항목 추가](./using-the-promotion-base-list.md#adding-entries) 참조하세요.

{bdg-secondary}`Liferay DXP 2023.Q4+/Portal 7.4 GA98+` SKU에 대해 측정 단위 [가](../../product-management/creating-and-managing-products/products/units-of-measure.md) 개 구성되어 있는 경우 해당하는 경우 각 측정 단위에 대해 별도로 프로모션 가격을 입력할 수 있습니다.

## 가격 수정자

_가격 수정자_는 고정된 금액이나 비율로 다양한 제품의 가격을 조정할 수 있습니다. 가격 수정자를 사용하면 제품의 기본 가격을 사용하여 프로모션 가격을 계산하여 프로모션을 쉽게 유지할 수 있습니다. 항목과 동일한 SKU를 대상으로 하는 가격 수정자가 있는 경우 항목의 가격이 가격 수정자보다 우선합니다.

가격 수정자를 사용하여 카탈로그, 카테고리, 제품 그룹 또는 제품을 타겟팅할 수 있습니다. 가격 수정자는 대상 그룹의 모든 제품에 적용됩니다. 이는 각 SKU를 구체적으로 타겟팅해야 하는 항목 섹션과 다릅니다. 자세한 내용은 [가격 수정자 추가](./creating-a-promotion.md#adding-a-price-modifier) 참조하십시오.

## 프로모션 및 가격표

판촉은 기능면에서 가격표와 유사하지만 할인 가격을 결정하기 위해 함께 사용됩니다. 계산을 이해하려면 아래 다이어그램을 참조하세요.

![Calculation of a product's active price.](./introduction-to-promotions/images/03.png)

제품의 활성 가격이 결정되면 활성 가격에 할인이 적용됩니다. 자세한 내용은 [할인 소개](./introduction-to-discounts.md) 참조하세요.

다른 고객의 평소 가격보다 낮은 특별 가격을 고객에게 제공하려는 경우 가격 목록과 프로모션을 모두 사용할 수 있지만 가격 목록에는 가격 인하가 표시되지 않습니다. 아래 이미지를 참조하세요.

![Comparison of a product's price with a promotion and a price list.](./introduction-to-promotions/images/04.png)

## 관련 주제

* [프로모션 생성](./creating-a-promotion.md) 
* [프로모션 베이스 목록 사용하기](./using-the-promotion-base-list.md) 
* [프로모션 참조](./promotions-reference.md) 
