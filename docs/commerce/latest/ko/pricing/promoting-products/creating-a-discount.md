# 할인 생성

아래 단계에 따라 할인 유형, 대상 고객을 선택하고 할인율을 설정하여 할인을 생성하세요. 할인이 생성되면 할인 자격을 얻기 위한 추가 조건을 지정합니다.

새로운 할인을 생성하려면:

1. **글로벌 애플리케이션** &rarr; **상거래** &rarr; **할인** 으로 이동하세요.

1. (![추가](../../images/icon-add.png)) 버튼을 클릭하여 새 할인을 추가하세요.

1. 이름을 입력하세요: **봄 세일** .

1. **적용 대상** 드롭다운에서 할인 유형(예: **소계에 적용**)을 선택합니다. (다양한 할인 유형에 대해 자세히 알아보려면 [할인 유형](./introduction-to-discounts.md#types-of-discounts) 을 참조하세요.)

1. **유형** 드롭다운 메뉴에서 **백분율** 또는 **고정 금액** 을 선택하세요.

   ![Create a new discount.](./creating-a-discount/images/03.png)

1. **제출** 을 클릭하세요.

## 할인 구성

백분율(% 기반 할인을 사용하는 경우), 최대 할인 금액, [할인 수준](./introduction-to-discounts.md#tiered-discounts) 등 할인 세부 정보를 지정한 다음 활성화할 수 있습니다.

세부정보 섹션에서

1. 다음 데이터를 입력하십시오:

   * **금액** : 20%
   * **최대 할인 금액** : 20.00
   * **레벨** : L1

1. **Active** 토글을 활성화하세요.

   ![Set the percentage and maximum discount account.](./creating-a-discount/images/04.png)

1. **게시** 를 클릭하세요.

이제 할인이 활성화되었습니다. 할인 규칙 및 자격을 구성합니다.

### 쿠폰 코드 구성

쿠폰 코드를 사용하는 경우,

1. **쿠폰 코드 사용** 토글을 활성화하세요.

1. 다음 데이터를 입력하십시오:

   * **쿠폰 코드** : 봄 세일
   * **최대 총 사용 횟수** : 1
   * **계정당 최대 사용** : 1

1. **게시** 를 클릭하세요.

이제 쿠폰 코드가 할인에 활성화되었습니다.

## 할인에 규칙 추가

할인 자격 요건을 지정하는 규칙을 정의할 수 있습니다. 자세한 내용은 [할인 규칙](./introduction-to-discounts.md#discount-rules) 참조하세요.

둘 이상의 규칙을 사용하는 경우 규칙을 집계하거나 어떤 규칙이 적용되는지 결정할 수 있습니다. **And** 또는 **Or** 라디오 버튼을 클릭하세요.

새 할인 규칙을 추가하려면:

1. 규칙이 생성되면 **Rules** 섹션까지 아래로 스크롤합니다.

1. **추가**(![아이콘 추가](../../images/icon-add.png))를 클릭하세요.

1. 이름을 입력하세요: **봄 세일** .

1. **Rule Type** 드롭다운 메뉴에서 **Cart Total** 을 선택하세요.

   ![Create a new discount rule.](./creating-a-discount/images/05.png)

1. **제출** 을 클릭하세요.

1. **봄 세일** 을 클릭하여 규칙을 구성하세요.

1. **장바구니 총 최소 금액** 필드에 **15.00** 을 입력하세요.

   ![Enter a value in the Cart Total Minium Amount field.](./creating-a-discount/images/06.png)

1. **저장** 을 클릭하고 창을 닫습니다.

이제 할인 규칙이 활성화되었습니다.

## 할인 자격 규칙 구성

모든 계정이나 특정 계정, 계정 그룹 또는 주문 유형에 대해 이 할인을 적용할 수 있습니다.

이 할인을 받을 수 있는 계정, 계정 그룹 및 주문 유형을 지정하려면,

1. **자격** 탭을 클릭하세요.

1. [계정 그룹 선택](../../users-and-accounts/account-management/creating-a-new-account-group.md) 라디오 버튼을 클릭합니다.

1. **계정 그룹 추가** 검색창에서 원하는 계정 그룹을 검색하세요. 이 예에서는 **US Accounts East** 입니다.

1. **선택** 을 클릭하여 계정 그룹을 추가하세요.

   ![Select the desired account groups which are eligible for this discount.](./creating-a-discount/images/07.png)

1. 완료되면 **게시** 를 클릭하세요.

모든 채널 또는 특정 채널에서 이 할인을 제공할 수 있습니다. 이 할인을 받을 수 있는 채널을 지정하려면 다음을 수행하세요.

1. **자격 탭** 에서 **특정 채널** 라디오 버튼을 클릭하세요.

1. **채널 추가** 검색창에서 원하는 채널을 검색하세요.

1. 채널을 추가하려면 **선택** 을 클릭하세요.

   ![Select the desired channels that are eligible for the discount.](./creating-a-discount/images/08.png)

1. 완료되면 **게시** 를 클릭하세요.

이제 귀하의 매장에는 지정된 계정 그룹에 속한 상품에 대해 선택한 상품을 20% 할인하는 활성 할인이 적용됩니다. 특정 [주문 유형](../../order-management/order-types.md) 할인을 적용하도록 주문 유형 자격을 추가하여 이를 추가로 사용자 정의할 수 있습니다.

## 할인 특정성 이해

할인 규칙 및 자격에 따라 주문이 하나 또는 여러 할인을 받을 수 있는지 여부가 결정됩니다. 특정 자격에 대한 할인 특정성을 이해하려면 아래 표를 참조하세요.

| **특정 계정** | **특정 계정 그룹** | **특정 채널** | **특정 주문 유형** | **계급** |
| :-------- | :----------- | :-------- | :----------- | :----- |
| ✔         |              | ✔         | ✔            | 1      |
| ✔         |              |           | ✔            | 2      |
| ✔         |              | ✔         |              | 삼      |
| ✔         |              |           |              | 4      |
|           | ✔            | ✔         | ✔            | 5      |
|           | ✔            |           | ✔            | 6      |
|           | ✔            | ✔         |              | 7      |
|           | ✔            |           |              | 8      |
|           |              | ✔         | ✔            | 9      |
|           |              |           | ✔            | 10     |
|           |              | ✔         |              | 11     |

모든 계정, 계정 그룹, 채널 및 주문 유형에 적용되는 할인은 가장 구체적이지 않습니다. 예를 들어 계정 그룹 A에 배송비 50% 할인이 있고 모든 계정, 계정 그룹, 채널 및 주문 유형에 적용되는 배송비 60% 할인이 있다고 가정해 보겠습니다. 여기서 계정 그룹 A는 가장 구체적이므로 50% 할인만 받을 수 있습니다. 동일한 순위의 할인이 여러 개 있고 활성 OR 할인 규칙이 있는 경우 가장 높은 할인이 우선 적용됩니다.

## 커머스 2.1 이하

할인을 생성하려면,

1. **제어판 &rarr;** 상거래 **&rarr;** 할인_으로 이동하세요.

1. 추가(![추가](../../images/icon-add.png))를 클릭하고 이름을 **Spring Sale** 로 입력합니다.

1. **타겟** 드롭다운에서 할인 유형(예: **소계에 적용**)을 선택합니다. (다양한 할인 유형에 대해 자세히 알아보려면 [할인 유형](./introduction-to-discounts.md#types-of-discounts) 을 참조하세요.)

1. 이 할인이 적용되는 채널의 확인란을 선택하세요.

1. 이 할인이 적용되는 [개의 계정 그룹](../../users-and-accounts/account-management/creating-a-new-account-group.md) 선택하세요. 이 예에서는 **미국 동부 해안** 입니다.

1. 쿠폰 코드를 사용하는 경우 **쿠폰 코드 사용** 토글을 **예** 로 전환하세요. 그런 다음 **커플 코드** 필드에 코드를 입력하세요. 그렇지 않으면 **NO** 로 둡니다.

1. 백분율을 사용하는 경우 **백분율 사용** 토글을 **예** 로 전환하세요.

1. **최대 할인 금액** 을 입력하세요: $20.00

1. [**레벨**](./introduction-to-discounts.md#tiered-discounts) : 20.00을 입력합니다. 그러면 소계에서 20%가 할인됩니다.

1. **Active** 토글을 **YES** 로 전환하세요.

    ![Creating a new discount.](./creating-a-discount/images/01.png)

1. **게시** 를 클릭하세요.

이제 귀하의 매장에는 지정된 계정 그룹에 속한 상품에 대해 선택한 상품을 20% 할인하는 활성 할인이 적용됩니다.

### 할인 규칙 추가

1. 할인이 생성되면 **Detail** 및 **Rules** 라는 2개의 탭이 있습니다. **규칙** 탭을 클릭하세요.

   ![Click on the Rules tab to add a new Discount Rule.](./creating-a-discount/images/02.png)

1. 추가(![아이콘 추가](../../images/icon-add.png)) 버튼을 클릭하고 **Type** 드롭다운 메뉴에서 **Cart Total** 을 선택합니다.

1. **장바구니 총 최소 금액** 필드에 15.00을 입력하세요.

1. **저장** 을 클릭하세요.

이 예에서는 이 특정 할인에 할인 규칙이 적용되었습니다. 고객은 설정된 금액 이상 구매 시 이 할인을 받게 됩니다.

## 관련 주제

* [할인 소개](./introduction-to-discounts.md)
* [새 계정 그룹 생성](../../users-and-accounts/account-management/creating-a-new-account-group.md)
* [가격표 생성](../creating-a-price-list.md)
* [가격 등급 사용](../using-price-tiers.md)
