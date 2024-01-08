# 가격 소개

Liferay는 제품 가격을 미세 조정할 수 있는 강력한 가격 책정 시스템을 제공합니다. 단일 제품 SKU에 대해 여러 가격 항목을 정의하고 각 가격을 받을 수 있는 계정, 계정 그룹 및 채널을 결정할 수 있습니다. 동일한 SKU에 대해 여러 가격 엔터티가 있는 경우 상거래 가격 책정 엔진은 각 채널 고객에 대해 사용해야 하는 엔터티를 계산합니다.

{bdg-secondary}`Liferay DXP 2023.Q4+/Portal GA98+` SKU에 대해 [측정 단위](../product-management/creating-and-managing-products/products/units-of-measure.md) 가 구성된 경우 각 측정 단위에 대해 여러 가격 항목을 정의하고 일반 SKU와 동일한 자격 기준을 결정할 수 있습니다.

```{note}
다음 개요에서는 Commerce Pricing Engine v2.0+에 대해 설명합니다. 이는 Commerce 3.0+ 및 Portal/DXP 7.3+에 사용되는 기본 가격 책정 알고리즘입니다. Commerce 2.1.x 및 이전 버전은 기본적으로 [가격 엔진 v1.0](#pricing-engine-v1-0-reference) 사용합니다. 원하는 경우 인스턴스에 사용되는 가격 책정 엔진 버전 [가격 책정 엔진 버전 변경](#enabling-pricing-engine-v2-0-in-commerce-2-1-x) 변경할 수 있습니다.
```

## 상거래 가격 시스템의 구성 요소

카탈로그에는 제품이 포함되어 있으며 각 카탈로그에는 자체 기본 [기본 가격표](#base-price-list) 및 [기본 판촉 목록](#base-promotion-list) 이 있습니다. 이 목록은 카탈로그의 모든 제품 SKU에 대한 기본 가격 항목을 저장하며 모든 고객이 사용할 수 있습니다. 또한 사용자 정의 [가격 목록](#price-lists) 및 [판촉 목록](#promotion-lists) 을 생성하여 더 많은 대상 및 구성 가능한 가격 항목을 정의할 수 있습니다. 각 항목의 일부로 수량에 따라 제품에 대한 특별 가격을 설정하는 [가격 계층](#price-tiers) 정의할 수도 있습니다. 마지막으로, 가격 항목을 재정의하지 않고 위에 [할인](#discounts) 적용됩니다.

{bdg-secondary}`Liferay DXP 2023.Q4+/Portal GA98+` SKU에 대해 [측정 단위](../product-management/creating-and-managing-products/products/units-of-measure.md) 가 구성된 경우 기본 가격 목록, 기본 프로모션 목록, 사용자 정의 가격 목록 및 사용자 정의 프로모션 목록에 각 단위에 대한 항목이 있습니다.

![The base price list also stores the starting price for every unit configured for an SKU.](./introduction-to-pricing/images/09.png)

### 기준 가격표

기본 가격표는 카탈로그의 모든 제품 SKU에 대한 시작 가격을 저장합니다. 이러한 항목은 재정의가 적용되지 않을 때 각 SKU에 사용되는 표준 통화 및 가격을 설정합니다. 이 목록은 모든 카탈로그에 대해 자동으로 생성되며 모든 계정과 채널에서 사용할 수 있습니다. 자세한 내용은 [제품 기본 가격 설정](./setting-a-products-base-price.md) 참조하십시오.

![The base price list stores the starting price entry for every product SKU in a catalog.](./introduction-to-pricing/images/02.png)

### 기본 승격 목록

기본 판촉 목록은 카탈로그의 모든 제품 SKU에 대한 기본 판촉 가격 항목을 저장합니다. SKU에 적용하면 기본 판촉 가격 항목이 모든 고객의 기본 가격보다 우선 적용됩니다. 이 목록은 모든 카탈로그에 대해 자동으로 생성되며 모든 계정과 채널에서 사용할 수 있습니다. 자세한 내용은 [프로모션 베이스 목록 참조](./promoting-products/promotions-reference.md) 참조하세요.

![The base promotion list stores base promotional price entries for all product SKUs in a catalog.](./introduction-to-pricing/images/03.png)

### 가격 목록

사용자 정의 가격표는 특정 제품에 대한 가격 항목을 저장하며 자격을 갖춘 고객에게만 제공됩니다. 이러한 목록은 기본 가격표와 다른 통화를 사용할 수 있으며 카탈로그 제품 전체 또는 일부만 포함할 수 있습니다. 사용자 정의 가격표 항목은 적격 고객에 대한 SKU의 기본 가격을 재정의합니다. 특정 가격 항목을 수정하기 위해 [가격 수정자](./using-price-modifiers.md) 정의할 수도 있습니다. 자세한 내용은 [가격표 생성](./creating-a-price-list.md) 참조하십시오.

![Use custom price lists to store more targeted price entries.](./introduction-to-pricing/images/04.png)

### 프로모션 목록

맞춤형 프로모션은 특정 제품에 대한 매장 프로모션 가격 항목을 나열하며 자격을 갖춘 고객에게만 제공됩니다. 이러한 목록은 기본 가격표와 다른 통화를 사용할 수 있으며 카탈로그 제품 전체 또는 일부만 포함할 수 있습니다. 적용하면 적격 사용자에 대한 SKU의 다른 가격 항목(예: 기본 가격, 계층별 가격)이 재정의됩니다. 이 목록에서 [가격 수정자](./using-price-modifiers.md) 정의하여 특정 가격 항목을 수정할 수도 있습니다. 활성화된 동안 구매자가 인하된 가격을 볼 수 있도록 원래 가격과 프로모션 가격이 모두 제품 페이지에 함께 표시됩니다. 자세한 내용은 [판촉 생성](./promoting-products/creating-a-promotion.md) 참조하십시오.

![Use custom promotion lists to store targeted promotion price entries.](./introduction-to-pricing/images/05.png)

```{note}
Liferay DXP 7.4 U42/GA42 이전에는 프로모션 가격을 세일 가격이라고 했습니다.
```

### 가격 등급

가격 계층은 가격 항목 내에서 직접 설정되며 최소 수량 요구 사항을 충족하는 주문에 대한 특정 가격을 정의합니다. 이 가격은 할인된 주문 옵션으로 고객에게 표시됩니다. 자세한 내용은 가격 계층 사용 [가격 계층 사용](./using-price-tiers.md) 참조하세요.

### 할인

할인은 가격 위에 적용되며 대체하지 않고 수정합니다. 기존 가격 항목 내에서 정의하거나 별도의 엔터티로 생성하여 제품, 제품 그룹, 카테고리, 배송비, 소계 또는 합계를 대상으로 하는 데 사용할 수 있습니다. 자세한 내용은 [할인 소개](./promoting-products/introduction-to-discounts.md) 참조하세요.

![Discounts are applied on top of the price and modify it without superseding it.](./introduction-to-pricing/images/06.png)

## 가격 책정 엔진이 제품 가격을 계산하는 방법

가격 엔진은 각 가격 구성 요소가 채널의 SKU 가격에 어떻게 영향을 미치는지 결정합니다. 엔진이 가격 요청을 받으면 먼저 제품의 **단가** 와 **프로모션 가격** 을 계산합니다. 그런 다음 이 가격을 사용하여 고객에게 제공되는 **최종 가격** 을 결정합니다.

{bdg-secondary}`Liferay DXP 2023.Q4+/Portal GA98+` 가격 엔진은 측정 단위가 없는 SKU와 [측정 단위](../product-management/creating-and-managing-products/products/units-of-measure.md) 포함된 SKU에 대해 동일한 방식으로 단가, 프로모션 가격, 최종 가격 및 주문 가격을 계산합니다.

<!--TASK: Consider adding details about net/gross price types and how taxes are calculated-->

### SKU 단가 계산

SKU의 단가를 계산할 때 가격 책정 엔진은 적합한 사용자 정의 가격표를 검색합니다. 목록이 여러 개 존재하는 경우 엔진은 우선순위가 가장 높은 목록을 선택합니다. 그런 다음 선택한 목록의 제품 SKU 가격 항목을 검색합니다.

* SKU에 대한 항목이 있는 경우 알고리즘은 기존 가격 수정자를 해당 항목에 적용하고 SKU의 단가에 대한 합계를 사용합니다.

* SKU에 대한 항목이 없으면 엔진은 SKU의 기본 가격을 사용하고 우선순위가 가장 높은 가격표의 수정자를 적용합니다. 총액은 SKU의 단가입니다.

   ```{note}
   엔진은 우선순위가 가장 높은 목록만 검색하고 우선순위가 낮은 목록의 SKU는 검색하지 않습니다. 이는 서로 다른 가격표의 가격이 동일한 카탈로그의 SKU에 적용되는 것을 방지하기 위한 것입니다.
   ```

적합한 사용자 정의 가격표가 없는 경우 엔진은 단가에 대해 SKU의 기본 가격표 항목을 사용합니다.

![The engine searches eligible custom price lists for the SKU.](./introduction-to-pricing/images/07.png)

```{note}
이 프로세스 중에 엔진은 적용 가능한 등급 가격도 확인합니다. 존재하는 경우 특정 수량에 대한 기본 정가 대신 해당 가격이 사용됩니다.
```

### SKU의 판촉 가격 계산

SKU의 단가를 계산한 후 가격 책정 엔진은 SKU의 판촉 가격을 계산합니다. 이 계산은 다음 두 가지를 제외하고 단가 계산 프로세스와 기본적으로 동일합니다.

* 적용 가능한 프로모션 목록에 SKU에 대한 가격 항목이 없는 경우 기존 가격 수정자가 단가에 적용되고 총액이 프로모션 가격에 사용됩니다.

* 적용 가능한 프로모션 목록이 없고 기본 프로모션 목록이 0으로 설정된 경우 프로모션 가격은 0으로 설정됩니다.

### SKU의 최종 가격 계산

단가와 판촉 가격을 계산한 후 가격 책정 엔진은 이를 비교하여 더 낮은 가격을 선택합니다. 그런 다음 가격 책정 알고리즘은 적용 가능한 모든 할인을 검색하여 해당 가격에 적용합니다. 총액은 SKU의 최종 가격, 즉 고객이 제품을 구매하기 위해 지불하는 가격입니다.

## 가격책정 엔진이 주문 가격을 계산하는 방법

주문 가격을 계산할 때 가격 책정 엔진은 먼저 배송비를 검색하고 배송을 대상으로 하는 할인을 적용합니다.

그런 다음 엔진은 주문에 있는 모든 SKU의 최종 가격을 추가하여 소계를 결정합니다. 그런 다음 소계를 대상으로 하는 모든 할인이 적용됩니다.

마지막으로 가격 책정 엔진은 할인된 배송 비용과 할인된 소계를 더하여 주문 총액을 구합니다. 그런 다음 총액을 대상으로 하는 할인이 적용됩니다.

![The engine determines the order's shipping, subtotal, and total.](./introduction-to-pricing/images/08.png)

## 가격 엔진 v1.0 참조

| 가격 책정 방법                                     | 개요                                                                | 기본 가격을 무시합니까? | 어디에 설정되어 있나요? | 누구에게 적용되나요?                                              |               무엇에 적용되나요?               |
| :------------------------------------------- | :---------------------------------------------------------------- | :-----------: | :------------ | :------------------------------------------------------- | :------------------------------------: |
| 기준 가격                                        | 기본 가격                                                             |    해당사항 없음    | 커머스 제품 SKU    | 모든 구매자                                                   |               커머스 제품 SKU               |
| 기본 프로모션                                      | 인하된 가격                                                            |      그렇다      | 커머스 제품 SKU    | 모든 구매자                                                   |               커머스 제품 SKU               |
| 가격표(정가, 정가 프로모션)          | 제품 및 구매자별 특별 가격(또는 통화)                         |      그렇다      | 가격 목록         | 선택된 구매자(계정 및 계정 그룹)                   |                개별 제품 SKU               |
| 계층형 가격표(계층형 가격, 계층형 프로모션) | 제품 및 구매자별 특별 가격(또는 통화)**대량 수량** |      그렇다      | 가격 목록         | 선택된 구매자(계정 및 계정 그룹)                   |                개별 제품 SKU               |
| 할인                                           | 상품 또는 구매자 그룹의 가격을 수정합니다. (수량 제한 및 쿠폰 코드 사용 가능) |       부정      | 할인            | 선정된 구매자(계정 및 계정 그룹 또는 특정 자격을 충족하는 사람) | 제품 그룹(또는 개별 제품 SKU) |

```{note}
Commerce Pricing Engine v1.0에서 가격 항목에는 SKU, 표준 가격, 프로모션 가격이라는 세 가지 구성 요소가 포함됩니다. v2.0에서는 각각이 별도의 엔터티입니다.
```

![Pricing Hierarchy Diagram](./introduction-to-pricing/images/01.png)

## Commerce 2.1.x에서 가격 책정 엔진 v2.0 활성화

기본적으로 Commerce 2.1.x 및 이전 버전은 Commerce Pricing Engine v1.0을 사용합니다. Commerce Pricing Engine v2.0을 활성화하려면 다음 단계를 따르십시오.

1. 제어판을 열고 **시스템 설정** &rarr; **상거래** &rarr; **가격** 으로 이동합니다.

1. 왼쪽 패널에서 **상거래 가격 구성** 을 클릭합니다.

1. **가격 계산 키** 필드에서 `v1.0`을 `v2.0`으로 바꾸세요.

1. **저장** 을 클릭하세요.

저장되면 인스턴스는 모든 가격 계산에 가격 엔진 v2.0을 사용합니다.

## 관련 주제

* [상품 기본 가격 설정](./setting-a-products-base-price.md)
* [가격표 생성](./creating-a-price-list.md)
* [가격 목록에 제품 추가](./adding-products-to-a-price-list.md)
* [가격 등급 사용](./adding-products-to-a-price-list.md)
* [할인 생성](./promoting-products/creating-a-discount.md)
