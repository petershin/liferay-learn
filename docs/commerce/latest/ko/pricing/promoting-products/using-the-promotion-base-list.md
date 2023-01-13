# 프로모션 베이스 목록 사용

새 카탈로그를 만들면 새 *프로모션 베이스 목록* 이 자동으로 생성됩니다. 판촉 기본 목록에 대한 자격을 제어하거나 가격 수정자를 추가할 수 없습니다. 프로모션 가격으로 타겟팅하려는 특정 항목을 추가하는 데만 사용할 수 있습니다.

프로모션 베이스 목록을 사용하려면,

1. *글로벌 메뉴* (![Applications Menu icon](../../images/icon-applications-menu.png))를 열고 *상거래* &rarr; *카탈로그*로 이동합니다.

   ![카탈로그를 클릭하고 제품에 대한 새 카탈로그를 만듭니다.](./using-the-promotion-base-list/images/01.png)

1. *추가* (![Add icon](../../images/icon-add.png))을 클릭하고 다음 정보를 입력합니다.

   **이름:** 테스트 카탈로그

   **기본 카탈로그 언어:** 영어(미국)

   **통화:** 미국 달러

   ![새 카탈로그의 이름, 기본 카탈로그 언어 및 통화를 입력합니다.](./using-the-promotion-base-list/images/02.png)

1. *제출*을 클릭합니다.

이렇게 하면 새 카탈로그와 새 판촉 기본 목록이 생성됩니다. 이를 보려면 *글로벌 메뉴* (![Applications Menu icon](../../images/icon-applications-menu.png))을 열고 *상거래* &rarr; *프로모션*을 클릭하십시오. *Test Catalog Base Promotion*로 새 항목이 표시되어야 합니다.

## 항목 추가

프로모션 기본 목록은 해당 카탈로그의 모든 제품을 항목으로 자동 추가합니다. 카탈로그에서 특정 SKU를 타겟팅하려면

1. 항목 섹션에서 SKU를 검색하고 클릭합니다.

1. 프로모션 가격, 만료 날짜를 입력하고 SKU에 대해 대량 [개 또는 계층화된 가격](../using-price-tiers.md#bulk-pricing-vs-tier-pricing) 를 구성할 수 있습니다.

   ![프로모션 가격, 만료 날짜를 입력하고 SKU에 대한 대량 또는 계층화된 가격을 구성할 수 있습니다.](./using-the-promotion-base-list/images/03.png)

1. *저장*을 클릭합니다.

또한 할인 무시 토글을 사용하여 프로모션 가격이 활성 할인보다 우선하도록 할 수 있습니다. 20% 할인을 무시하는 프로모션과 그렇지 않은 프로모션 간의 비교를 참조하십시오.

![프로모션 구성에서 할인 무시 토글을 사용하여 활성 할인을 무시할 수 있습니다.](./using-the-promotion-base-list/images/04.png)

```{note}
프로모션 가격으로 SKU를 타겟팅하는 또 다른 방법은 *Global Menu*(![Applications Menu icon](../../images/icon-applications-menu.png))를 열고 *Commerce* &rarr; 으로 이동하는 것입니다. *제품*. 제품을 찾아 선택하고 *SKUs* 탭을 클릭합니다. 타겟팅할 SKU를 선택하고 프로모션 가격을 설정합니다. *게시*를 클릭합니다. 이렇게 하면 기본 판촉 목록에서 SKU 가격이 설정됩니다. Liferay DXP 7.4 U42/GA42 이전에는 프로모션 가격을 판매 가격이라고 했습니다.
```

## 추가 정보

* [프로모션 소개](./introduction-to-promotions.md)
* [판촉 만들기](./creating-a-promotion.md)
* [프로모션 참조](./promotions-reference.md)
