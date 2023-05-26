# 구독 관리

구독은 특별한 유형의 반복 주문이며 [일반 주문](../orders/processing-an-order.md)과 다르게 관리됩니다. 구독을 포함한 모든 주문은 [주문 메뉴](../orders/orders-menu-reference-guide.md)에서 수락 및 처리됩니다. 그러나 **구독** 주문이 수락되면 [구독 메뉴](./subscription-administration-reference-guide.md)에 표시됩니다.

## 구독 주문 이행

Commerce 3.0에서는 **개의 주문** 과 **구독** 이 **글로벌 애플리케이션** 메뉴에서 관리됩니다.

접수된 구독 주문 이행을 시작하려면 다음을 수행하십시오.

1. **글로벌 애플리케이션** 메뉴 &rarr; **상거래** &rarr; **주문** 로 이동합니다.
1. 시작하려면 **주문 ID** 을 클릭하십시오.
1. **대기 중** 버튼을 클릭합니다. 이렇게 하면 주문이 대기 중 상태로 이동합니다.

    ![주문 열기 탭](./managing-subscriptions/images/07.png)

1. **주문** 수락 버튼을 클릭합니다. 이렇게 하면 주문이 처리 중 상태로 이동합니다.

    ![주문 수락 주문](./managing-subscriptions/images/02.png)

1. 구독 주문이 수락되면 단계에 따라 배송을 생성합니다. 자세한 내용은 [발송물 생성](../shipments/creating-a-shipment.md) 을 참조하십시오.

주문이 수락되면 [구독 메뉴](./subscription-administration-reference-guide.md)에 표시됩니다.

## 구독 주문 관리

1. **제어판** &rarr; **상거래** &rarr; **구독** 로 이동합니다.

    ![구독 메뉴](./managing-subscriptions/images/03.png)

2. **ID**(43811)을 클릭합니다. 이 ID는 구독에만 적용됩니다. ( [개의 일반 주문](../orders/processing-an-order.md) 또는 [배송](../shipments/introduction-to-shipments.md) ID와 구별됩니다.)
3. **일반** 탭에서 결제 또는 배송 옵션을 변경합니다. 예를 들어 배달 구독에서 **다음 반복 날짜** 을 이전 날짜로 변경합니다.

    ![다음 배송일을 변경할 수 있습니다.](./managing-subscriptions/images/04.png)

4. **저장** 버튼을 클릭합니다.

### 구독 주문 일시 중단 또는 취소

구독 주문을 일시 중단하거나 취소하려면:

1. **일반** 탭에서 **지불 구독** 섹션의 **상태** 드롭다운 메뉴에서 **일시 중단됨** 또는 **취소됨** 를 선택합니다.
1. **Never Ends** 토글을 **NO** 로 전환합니다.
1. **Ends After** 필드에 **1** 을 입력합니다.
1. 그런 다음 **배송 구독** 섹션까지 아래로 스크롤합니다.
1. **상태** 드롭다운 메뉴에서 **일시 중단됨** 또는 **취소됨** 을 선택합니다.

    ![주문 일시 중단 또는 취소](./managing-subscriptions/images/08.png)

1. **Never Ends** 토글을 **NO** 로 전환합니다.
1. **Ends After** 필드에 **1** 을 입력합니다.
1. **저장** 을 클릭하여 변경 사항을 적용합니다.

### 배송 상태 추적

1. **배송** 탭을 클릭합니다. 여기에서 매장 관리자는 배송 상태를 추적할 수 있습니다.

    ![배송 상태 추적을 변경할 수 있습니다.](managing-subscriptions/images/05.png)

### 지불 내역 추적

1. **결제** 탭을 클릭합니다. 여기에서 매장 관리자는 결제 내역을 추적할 수 있습니다.

    ![결제 내역을 추적할 수 있습니다.](managing-subscriptions/images/06.png)

## 구독 구성

구독을 구성하려면:

1. **제어판** &rarr; **구성** &rarr; **시스템 설정** 으로 이동합니다.

    ![제어판 - 시스템 설정](managing-subscriptions/images/09.png)

1. **Commerce** 까지 아래로 스크롤하고 **Catalog** 을 클릭합니다.
1. 왼쪽 메뉴에서 **구독** 을 클릭합니다.

    ![제어판 - 시스템 설정](managing-subscriptions/images/10.png)

    사용 가능한 다음 구성을 검토합니다.
      * **갱신 확인 간격** - 시스템이 갱신 확인을 확인하는 빈도를 결정합니다. <!-- what does this really do? --> .
      * **구독 취소 허용됨** - 선택하면 사용자가 구독을 취소할 수 있습니다.
      * **구독 일시 중단 허용됨** - 선택하면 사용자가 구독을 일시 중단할 수 있습니다.

1. **저장** 버튼을 클릭하여 변경 사항을 적용합니다.

## 상거래 2.1 이하

상거래 주문 및 구독은 **제어판에서 관리됩니다.**

1. **제어판** &rarr; **상거래** &rarr; **주문** 로 이동합니다.
1. **열기** 탭을 클릭합니다.

    ![주문 열기 탭](./managing-subscriptions/images/01.png)

1. 시작하려면 **주문 ID** 을 클릭하십시오.
1. **대기 중** 버튼을 클릭합니다. 이렇게 하면 주문이 대기 중 상태로 이동합니다.

    ![주문 열기 탭](./managing-subscriptions/images/07.png)

1. **주문** 수락 버튼을 클릭합니다. 이렇게 하면 주문이 처리 중 상태로 이동합니다.

    ![주문 수락 주문](./managing-subscriptions/images/02.png)

1. 구독 주문이 수락되면 단계에 따라 배송을 생성합니다. 자세한 내용은 [발송물 생성](../shipments/creating-a-shipment.md) 을 참조하십시오.

주문이 수락되면 [구독 메뉴](./subscription-administration-reference-guide.md)에 표시됩니다.

## 관련 주제

* [구독 관리 참조 가이드](./subscription-administration-reference-guide.md)
* [제품에 대한 구독 활성화](../../product-management/creating-and-managing-products/products/enabling-subscriptions-for-a-product.md)
* [주문 처리](../orders/processing-an-order.md)
* [주문 메뉴 참조 가이드](../orders/orders-menu-reference-guide.md)
* [선적 소개](../shipments/introduction-to-shipments.md)
