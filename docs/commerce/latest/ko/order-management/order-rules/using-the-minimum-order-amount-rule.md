# 최소 주문 금액 규칙 사용

{bdg-secondary}`liferay DXP 7.4 U1+/GA5+`

주문을 이행하는 데 드는 비용 때문에 특정 금액 이상의 주문만 수락할 수 있습니다. 고객 결제가 방지되는 최소 주문 금액을 설정하여 주문 규칙을 통해 이를 수행할 수 있습니다.

## 주문 규칙 개요

주문 규칙이 적용된 경우 구매자는 결제를 계속하려면 규칙을 이행해야 합니다. 최소 주문 금액 규칙의 경우 구매자가 결제하려면 규칙에 설정된 장바구니 총액 또는 소계 금액이 있어야 합니다. 그렇지 않은 경우 진행하는 데 필요한 최소 주문 금액이 경고 메시지에 표시됩니다.

![Warning message displayed for not meeting the minimum order amount.](./using-the-minimum-order-amount-rule/images/01.png)

## 주문 규칙 생성

최소 주문 금액 규칙은 기본적으로 사용 가능합니다.

1. _글로벌 메뉴_(![애플리케이션 메뉴 아이콘](../../images/icon-applications-menu.png))를 열고 _Commerce_ &rarr; _Order Rules_를 클릭합니다.

1. _추가_ 버튼(![아이콘 추가](../../images/icon-add.png))을 클릭하고 다음 정보를 입력합니다.

   **이름:** 최소 주문 $30

   **설명:** 최소 주문량 주문 규칙 테스트

   **유형:** 최소 주문 금액

1. _제출_을 클릭하세요.

   ![The Order Rule screen contains all you need to configure and activate Order Rules.](./using-the-minimum-order-amount-rule/images/02.png)

그러면 주문 규칙에 대한 구성 보기가 열립니다. _우선순위_는 규칙이 두 개 이상 있을 때 어떤 순서 규칙이 우선할지 결정합니다. 낮은 숫자가 높은 숫자보다 우선순위가 높습니다. _활성_ 토글을 사용하여 활성화하고 전체 또는 소계에 최소 주문 금액을 적용하도록 구성할 수 있습니다. 여기에서 통화를 설정할 수도 있습니다.

## 주문 규칙 자격

![You can set the Order Rule eligibility for Accounts, Account Groups, Channels or Order Types.](./using-the-minimum-order-amount-rule/images/03.png)

자격 탭에서 계정, 계정 그룹, 채널 또는 주문 유형에 대한 주문 규칙 자격을 설정할 수 있습니다. 기본적으로 이 모든 항목에 적용 가능합니다. 특정 엔터티와 연결하려면 라디오 버튼을 클릭하고 검색 창을 사용하여 선택하세요.
