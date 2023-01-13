# 구독 관리

구독은 특별한 유형의 반복 주문이며 [일반 주문](../orders/processing-an-order.md)과 다르게 관리됩니다. 구독을 포함한 모든 주문은 [주문 메뉴](../orders/orders-menu-reference-guide.md)에서 수락 및 처리됩니다. 그러나 *구독* 주문이 수락되면 [구독 메뉴](./subscription-administration-reference-guide.md)에 표시됩니다.

## 구독 주문 이행

Commerce 3.0에서는 _개의 주문_ 과 _구독_ 이 _글로벌 애플리케이션_ 메뉴에서 관리됩니다.

접수된 구독 주문 이행을 시작하려면 다음을 수행하십시오.

1. _글로벌 애플리케이션_ 메뉴 &rarr; _상거래_ &rarr; _주문_로 이동합니다.
1. 시작하려면 _주문 ID_ 을 클릭하십시오.
1. _대기 중_ 버튼을 클릭합니다. 이렇게 하면 주문이 대기 중 상태로 이동합니다.

    ![주문 열기 탭](./managing-subscriptions/images/07.png)

1. _주문_ 수락 버튼을 클릭합니다. 이렇게 하면 주문이 처리 중 상태로 이동합니다.

    ![주문 수락 주문](./managing-subscriptions/images/02.png)

1. 구독 주문이 수락되면 단계에 따라 배송을 생성합니다. 자세한 내용은 [발송물 생성](../shipments/creating-a-shipment.md) 을 참조하십시오.

주문이 수락되면 [구독 메뉴](./subscription-administration-reference-guide.md)에 표시됩니다.

## 구독 주문 관리

1. _제어판_ &rarr; _상거래_ &rarr; _구독_로 이동합니다.

    ![구독 메뉴](./managing-subscriptions/images/03.png)

2. _ID_ (43811)을 클릭합니다. 이 ID는 구독에만 적용됩니다. ( [개의 일반 주문](../orders/processing-an-order.md) 또는 [배송](../shipments/introduction-to-shipments.md) ID와 구별됩니다.)
3. _일반_ 탭에서 결제 또는 배송 옵션을 변경합니다. 예를 들어 배달 구독에서 _다음 반복 날짜_ 을 이전 날짜로 변경합니다.

    ![다음 배송일을 변경할 수 있습니다.](./managing-subscriptions/images/04.png)

4. _저장_ 버튼을 클릭합니다.

### 구독 주문 일시 중단 또는 취소

구독 주문을 일시 중단하거나 취소하려면:

1. _일반_ 탭에서 _지불 구독_ 섹션의 _상태_ 드롭다운 메뉴에서 _일시 중단됨_ 또는 _취소됨_ 를 선택합니다.
1. _Never Ends_ 토글을 _NO_로 전환합니다.
1. _Ends After_ 필드에 **1** 을 입력합니다.
1. 그런 다음 _배송 구독_ 섹션까지 아래로 스크롤합니다.
1. _상태_ 드롭다운 메뉴에서 _일시 중단됨_ 또는 _취소됨_ 을 선택합니다.

    ![주문 일시 중단 또는 취소](./managing-subscriptions/images/08.png)

1. _Never Ends_ 토글을 _NO_로 전환합니다.
1. _Ends After_ 필드에 **1** 을 입력합니다.
1. _저장_ 을 클릭하여 변경 사항을 적용합니다.

### 배송 상태 추적

1. _배송_ 탭을 클릭합니다. 여기에서 매장 관리자는 배송 상태를 추적할 수 있습니다.

    ![배송 상태 추적을 변경할 수 있습니다.](managing-subscriptions/images/05.png)

### 지불 내역 추적

1. _결제_ 탭을 클릭합니다. 여기에서 매장 관리자는 결제 내역을 추적할 수 있습니다.

    ![결제 내역을 추적할 수 있습니다.](managing-subscriptions/images/06.png)

## 구독 구성

구독을 구성하려면:

1. _제어판_ &rarr; _구성_ &rarr; _시스템 설정_으로 이동합니다.

    ![제어판 - 시스템 설정](managing-subscriptions/images/09.png)

1. _Commerce_ 까지 아래로 스크롤하고 _Catalog_을 클릭합니다.
1. 왼쪽 메뉴에서 _구독_ 을 클릭합니다.

    ![제어판 - 시스템 설정](managing-subscriptions/images/10.png)

    사용 가능한 다음 구성을 검토합니다.
      * **갱신 확인 간격** - 시스템이 갱신 확인을 확인하는 빈도를 결정합니다. <!-- what does this really do? -->.
      * **구독 취소 허용됨** - 선택하면 사용자가 구독을 취소할 수 있습니다.
      * **구독 일시 중단 허용됨** - 선택하면 사용자가 구독을 일시 중단할 수 있습니다.

1. _저장_ 버튼을 클릭하여 변경 사항을 적용합니다.

## 상거래 2.1 이하

상거래 주문 및 구독은 _제어판에서 관리됩니다._

1. _제어판_ &rarr; _상거래_ &rarr; _주문_로 이동합니다.
1. _열기_ 탭을 클릭합니다.

    ![주문 열기 탭](./managing-subscriptions/images/01.png)

1. 시작하려면 _주문 ID_ 을 클릭하십시오.
1. _대기 중_ 버튼을 클릭합니다. 이렇게 하면 주문이 대기 중 상태로 이동합니다.

    ![주문 열기 탭](./managing-subscriptions/images/07.png)

1. _주문_ 수락 버튼을 클릭합니다. 이렇게 하면 주문이 처리 중 상태로 이동합니다.

    ![주문 수락 주문](./managing-subscriptions/images/02.png)

1. 구독 주문이 수락되면 단계에 따라 배송을 생성합니다. 자세한 내용은 [발송물 생성](../shipments/creating-a-shipment.md) 을 참조하십시오.

주문이 수락되면 [구독 메뉴](./subscription-administration-reference-guide.md)에 표시됩니다.

## 추가 정보

* [구독 관리 참조 가이드](./subscription-administration-reference-guide.md)
* [제품에 대한 구독 활성화](../../product-management/creating-and-managing-products/products/enabling-subscriptions-for-a-product.md)
* [주문 처리](../orders/processing-an-order.md)
* [주문 메뉴 참조 가이드](../orders/orders-menu-reference-guide.md)
* [선적 소개](../shipments/introduction-to-shipments.md)
