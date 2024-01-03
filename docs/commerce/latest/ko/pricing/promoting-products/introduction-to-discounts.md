# 할인 소개

할인은 고객에게 인센티브를 제공하기 위해 제품 및 주문에 적용할 수 있는 가격 인하입니다. 할인을 생성할 때 설정 가격을 백분율로 인하할지 정액 요금으로 인하할지 결정하고 할인 범위를 설정합니다.

| 할인 범위 | 묘사                                                                                                                                                    |
| :---- | :---------------------------------------------------------------------------------------------------------------------------------------------------- |
| 분류    | [카테고리](../../product-management/creating-and-managing-products/products/organizing-your-catalog-with-product-categories.md) 의 모든 제품에 적용됩니다. |
| 제품    | 선택한 제품에 적용됩니다.                                                                                                                                        |
| 상품 그룹 | 동일 그룹 내 모든 제품에 적용됩니다.                                                                                                                                 |
| 선적    | 배송비에 적용됩니다.                                                                                                                                           |
| SKUs  | 지정된 SKU에 적용됩니다.                                                                                                                                       |
| 소계    | 일반적으로 세금 및 기타 수수료를 적용하기 전의 주문 소계에 적용됩니다.                                                                                                              |
| 합계    | 주문 합계에 적용됩니다.                                                                                                                                         |

{bdg-secondary}`Liferay DXP 2023.Q4+/Portal 7.4 GA98+` SKU에 대해 측정 단위 [가](../../product-management/creating-and-managing-products/products/units-of-measure.md) 개 구성되어 있는 경우 각 측정 단위에서 구체적으로 할인을 타겟팅할 수 있습니다.

일단 생성되면 할인을 받을 수 있는 적격 채널, 계정 및 주문 유형을 결정하고 적격 요건을 정의할 수 있습니다. 기본적으로 Liferay는 할인을 자동으로 적용하지만 고객에게 쿠폰 코드로 제공할 수 있습니다. 또한 할인을 구성할 때 할인 시작 및 만료 시기를 예약할 수 있습니다.

[할인 생성](./creating-a-discount.md) 시작하거나 [가격 소개](../introduction-to-pricing.md) 참조하여 할인이 Liferay의 가격 엔진에 어떻게 기여하는지 알아보세요.

## 쿠폰 코드

선택한 할인 유형에 관계없이 사용자에게 할인 자격을 얻으려면 쿠폰 코드를 입력하도록 요청할 수 있습니다. 쿠폰 코드를 활성화한 후 이메일, 뉴스레터 또는 광고를 통해 공유할 수 있습니다.

![Activate the coupon code feature and enter a coupon code for this discount type.](./introduction-to-discounts/images/01.png)

쿠폰 코드를 수락하려면 매장의 [결제](../../creating-store-content/commerce-storefront-pages/checkout.md) 페이지에 _쿠폰 코드 입력_ 위젯을 추가해야 합니다. 결제 페이지는 [Minium 사이트](../../starting-a-store/using-the-minium-accelerator-to-jump-start-your-b2b-store.md) 에서 바로 사용할 수 있습니다.

![Place the Coupon Code Entry widget on the Checkout page.](./introduction-to-discounts/images/02.png)

쿠폰 코드를 적용한 후 주문 요약 섹션에서 업데이트된 가격을 확인할 수 있습니다.

![You can view the updated prices in the order summary section.](./introduction-to-discounts/images/03.png)

## 만료 날짜

프로모션 활동과 일치하는 만료 날짜를 갖도록 할인을 구성할 수 있습니다.

![Configure the expiration date for a discount to coincide with a promotion.](./introduction-to-discounts/images/04.png)

## 할인 규정

할인 자격 요건을 지정하는 규칙을 정의할 수 있습니다. 기본적으로 사용할 수 있는 세 가지 규칙이 있습니다.

| 역할                | 묘사                                                |
| :---------------- | :------------------------------------------------ |
| 장바구니 합계           | 할인을 받으려면 장바구니 소계가 최소 기준을 충족해야 합니다.                |
| 이 제품 다 있어요        | 할인을 받으려면 주문에 지정된 모든 제품이 포함되어야 합니다.                |
| 다음 제품 중 하나가 있습니다. | 할인을 받으려면 주문에 지정된 제품 목록 중 하나 이상의 제품이 포함되어 있어야 합니다. |

_규칙_ 섹션에서 할인 규칙을 추가할 수 있습니다. 개발자는 또한 새로운 할인 규칙을 [수도 있습니다](../../developer-guide/promotions/adding-a-new-discount-rule-type.md) .

_이러한 제품이 모두 있음_ 또는 _이러한 제품 중 하나가 있음_ 규칙을 사용하는 경우 카탈로그에서 할인을 받을 수 있는 제품을 선택하세요.

![The available discount rule types.](./introduction-to-discounts/images/05.png)

## 할인 수준

제품 및 주문에 여러 할인을 적용하기 위한 할인 수준을 생성할 수 있습니다. Commerce는 이러한 할인을 연속적으로 적용합니다. 자세한 내용은 [할인 수준](./using-discount-levels.md) 사용을 참조하세요.

## 할인 무시

가격 항목을 편집할 때 할인 애플리케이션에 설정된 할인을 무시하는 대체 할인을 설정할 수 있습니다. 이러한 할인은 백분율 유형을 사용합니다. 그러나 규칙이나 자격 제한은 지원하지 않습니다. 제한사항을 유지하려면 할인 재정의를 사용하지 마십시오.

## 관련 주제

* [가격 소개](../introduction-to-pricing.md)
* [할인 생성](./creating-a-discount.md)
* [할인 수준 사용](./using-discount-levels.md)
