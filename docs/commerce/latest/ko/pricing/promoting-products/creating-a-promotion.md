# 프로모션 생성

아래 예에서는 7월 4일에 카탈로그에 있는 모든 제품의 가격을 20% 인하하는 프로모션을 만듭니다. 모든 계정, 계정 그룹, 채널 및 주문 유형이 이 프로모션에 참여할 수 있습니다.

1. _글로벌 메뉴_(![애플리케이션 메뉴 아이콘](../../images/icon-applications-menu.png))를 열고 _Commerce_ &rarr; _Promotions_로 이동합니다.

   ![Click on promotions from the Global Menu and create a new promotion.](./creating-a-promotion/images/01.png)

1. _추가_(![아이콘 추가](../../images/icon-add.png))를 클릭하고 다음 정보를 입력합니다.

   **이름:** 7월 4일 프로모션

   **카탈로그:** 미니엄

   **통화:** USD

   ![Enter a name, catalog, and currency for the new promotion.](./creating-a-promotion/images/02.png)

1. _제출_을 클릭하세요.

그러면 선택한 카탈로그에 새 프로모션이 생성됩니다. 이미 사용 가능한 카탈로그에 대한 _기본 프로모션 목록_이 어떻게 있는지 확인하세요. 자세한 내용은 [프로모션 베이스 목록 사용](./using-the-promotion-base-list.md) 읽어보세요.

![You can change the name of the promotion, assign a priority, and select the Parent Price List and the Price Type.](./creating-a-promotion/images/03.png)

세부정보 섹션에서 프로모션 이름을 변경하고, 우선순위를 지정하고, 상위 가격표 및 가격 유형을 선택할 수 있습니다. 프로모션은 7월 4일에 진행되므로 일정 섹션에서 _게시 날짜_ 및 _만료 날짜_를 선택하여 일정을 설정할 수 있습니다. 프로모션을 활성화하려면 _게시_를 클릭하세요. 한 계정에 적용할 수 있는 프로모션이 여러 개인 경우 우선 순위가 높은 프로모션이 다른 프로모션보다 우선합니다. 특정 필드에 대한 자세한 내용은 [프로모션 참조](./promotions-reference.md) 참조하세요.

## 가격 수정자 추가

이 예에서는 프로모션으로 인해 카탈로그에 있는 모든 제품의 가격이 20% 인하됩니다. 이렇게 하려면 가격 수정자를 추가해야 합니다.

1. _가격 수정자_ 탭을 클릭합니다.

1. _추가_(![아이콘 추가](../../images/icon-add.png))를 클릭하고 다음 정보를 입력합니다.

   **이름:** 20% 할인

   **대상:** 카탈로그

   **수정자:** 백분율

   ![Enter a name, target, and modifier for the new price modifier.](./creating-a-promotion/images/04.png)

1. _제출_을 클릭하세요.

```{note}
프로모션 자체에 대해 이미 만료일을 설정한 경우 가격 수정자에 대한 만료일을 설정할 필요가 없습니다.
```

이제 새 가격 수정자를 구성해야 합니다. 목록에서 항목을 클릭하고 백분율 금액을 -20으로 입력합니다. 그런 다음 *활성* 토글을 사용하여 활성화하세요. 그런 다음 *저장*을 클릭하고 *게시*를 클릭하세요. 자세한 내용은 [가격 수정자 참조](./promotions-reference.md#price-modifiers-reference)를 참조하세요.

![Configure the price modifier and activate it.](./creating-a-promotion/images/05.png)

이렇게 하면 프로모션이 활성화되고 카탈로그에 있는 모든 제품의 가격이 예정된 날짜에 20% 할인됩니다. 사용 가능한 활성 할인이 있는 경우 할인된 가격을 기준으로 계산됩니다. 특정 제품에 대한 프로모션을 대상으로 하는 경우 항목 탭을 사용하여 항목을 추가하고 해당 가격을 구성하십시오. 여기에서 [계층 가격 책정 또는 대량 가격 책정](./../using-price-tiers.md#bulk-pricing-vs-tier-pricing) 구성할 수도 있습니다. 자세한 내용은 [항목 추가](./using-the-promotion-base-list.md#adding-entries) 참조하세요.

![The prices of all products in the catalog are reduced by 20% on the scheduled date](./creating-a-promotion/images/06.png)

## 관련 주제

* [프로모션 소개](./introduction-to-promotions.md)
* [프로모션 베이스 목록 사용하기](./using-the-promotion-base-list.md)
* [프로모션 참조](./promotions-reference.md)
