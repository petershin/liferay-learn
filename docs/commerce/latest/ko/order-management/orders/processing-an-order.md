# 주문 처리

Liferay Commerce에서 주문 처리는 주문 수락과 주문 처리의 두 단계로 구성됩니다. 주문이 처리되는 동안 배송이 생성됩니다. [구독](../subscriptions/managing-subscriptions.md) (반복 주문)을 포함한 모든 주문 처리를 시작하려면 **글로벌 애플리케이션** &rarr; **상거래** 메뉴에서 [**주문** 메뉴](./orders-menu-reference-guide.md) 로 이동합니다.

## 주문 수락

사용자는 결제 프로세스가 완료되면 주문을 수락할 수 있습니다. [주문 작업 흐름](../order-workflows/enabling-or-disabling-order-workflows.md) 활성화된 경우 주문을 먼저 검토한 다음 [승인(또는 거부)](../order-workflows/approving-or-rejecting-orders-in-order-workflows.md)해야 합니다. 주문이 검토될 때까지 주문은 체크아웃 프로세스를 완료하지 않았으므로 현재 주문을 수락할 수 없습니다.

주문을 수락하려면:

1. **글로벌 메뉴**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **상거래** &rarr; **주문** 으로 이동 합니다 .

    ![주문 메뉴는 글로벌 메뉴에 있습니다.](./processing-an-order/images/07.png)

1. 주문 ID(예: **42838**)를 클릭합니다.
1. **주문** 수락 버튼을 클릭합니다.

    ![주문 수락 버튼을 클릭하여 처리를 시작하십시오.](./processing-an-order/images/02.png)

주문이 수락되었으며 처리할 수 있습니다.

## 승인된 주문 처리

주문이 수락된 후 세 가지 옵션이 있습니다.

* **취소** : 주문이 취소되고 Orders 메뉴의 **Pending** 에서 **Completed** 탭으로 자동 이동됩니다. 주문은 다시 편집할 수 없으며 고객은 새 주문을 제출해야 합니다.
* **보류** : 추가 조치가 취해질 때까지 주문 처리가 일시적으로 중단됩니다(예: 매장에서 부족한 재고를 보충하거나 결제 문제를 해결해야 함).
* **배송 만들기** : 주문이 배송될 준비가 되었습니다 [](../shipments/introduction-to-shipments.md).

![배송 취소, 보류 또는 생성](./processing-an-order/images/04.png)

### 구독 주문 처리

**글로벌 애플리케이션** 의 **구독** 메뉴에서 모든 구독 주문을 관리할 수 있습니다.

자세한 내용은 [구독 관리](../subscriptions/managing-subscriptions.md) 문서를 참조하세요.

## 배송 만들기

배송 생성은 수락된 주문 처리의 연속으로 **주문** 메뉴에서 시작됩니다. 자세한 내용은 [배송 만들기](../shipments/creating-a-shipment.md) 기사를 참조하십시오.

주문에 배송 가능한 항목(예: 서비스 계약 또는 온라인 제품)이 없는 경우 사용자는 배송을 생성할 수 없습니다.

## 완료된 주문

고객이 구매한 모든 품목을 수령하면 주문이 완료됨으로 표시됩니다. (물리적 재고의 경우 일반적으로 상품이 고객에게 배송된 시점입니다.) 또한 주문이 취소되면 완료됨으로 표시됩니다. 이 시점에서 완료된 주문은 이전 상태로 돌아갈 수 없습니다.

## 상거래 2.1 이하

### 주문 수락

사용자는 결제 프로세스가 완료되면 주문을 수락할 수 있습니다. 배송 생성은 주문 처리의 일부입니다.

주문을 수락하려면:

1. **제어판** &rarr; **상거래** &rarr; **주문** 로 이동합니다.

    ![주문 메뉴는 제어판에 있습니다.](./processing-an-order/images/01.png)

1. **열기** 탭을 클릭합니다.
1. 주문 ID(예: **42838**)를 클릭합니다.
1. **주문** 수락 버튼을 클릭합니다.

    ![주문 수락 버튼을 클릭하여 처리를 시작하십시오.](./processing-an-order/images/02.png)

주문이 수락되었으며 처리할 수 있습니다.

### 승인된 주문 처리

주문이 수락된 후 세 가지 옵션이 있습니다.

* **취소** : 주문이 취소되고 Orders 메뉴의 **Pending** 에서 **Completed** 탭으로 자동 이동됩니다. 주문은 다시 편집할 수 없으며 고객은 새 주문을 제출해야 합니다.
* **보류** : 추가 조치가 취해질 때까지 주문 처리가 일시적으로 중단됩니다(예: 매장에서 부족한 재고를 보충하거나 결제 문제를 해결해야 함).
* **배송 만들기** : 주문이 배송될 준비가 되었습니다 [](../shipments/introduction-to-shipments.md).

![배송 취소, 보류 또는 생성](./processing-an-order/images/04.png)

#### 구독 주문 처리

**제어판** 의 **구독** 메뉴에서 모든 구독 주문을 관리할 수 있습니다.

![구독 메뉴](./processing-an-order/images/03.png)

자세한 내용은 [구독 관리](../subscriptions/managing-subscriptions.md) 문서를 참조하세요.

### 배송 만들기

배송 생성은 수락된 주문 처리의 연속으로 **주문** 메뉴에서 시작됩니다. 자세한 내용은 [배송 만들기](../shipments/creating-a-shipment.md) 기사를 참조하십시오.

주문에 배송 가능한 항목(예: 서비스 계약 또는 온라인 제품)이 없는 경우 사용자는 배송을 생성할 수 없습니다.

### 완료된 주문

고객이 구매한 모든 품목을 수령하면 주문이 완료됨으로 표시됩니다. (물리적 재고의 경우 일반적으로 품목이 고객에게 배송된 시점입니다.) 또한 주문이 취소되면 완료됨으로 표시됩니다. 이 시점에서 완료된 주문은 이전 상태로 돌아갈 수 없습니다.

## 상거래 2.0 이하

주문 처리는 주문 전송과 배송 생성의 두 단계로 이루어집니다.

주문을 처리하려면:

1. **제어판** &rarr; **상거래** &rarr; **주문** 로 이동합니다.
1. **대기 중** 탭을 클릭합니다.
1. 주문(_40926_)을 클릭합니다.

    ![Pending 탭을 클릭하여 주문을 처리하십시오.](./processing-an-order/images/05.png)

1. **개요** 탭을 클릭합니다.
1. **주문 상태 편집** 클릭하십시오.

     ![Pending 탭을 클릭하여 주문을 처리하십시오.](./processing-an-order/images/06.png)

1. 주문 상태 드롭다운 메뉴에서 **전송됨** 선택합니다.
1. 완료되면 **저장** 클릭합니다.

그러면 주문이 **전송됨** 탭으로 이동됩니다. 주문이 전송되면 배송 준비가 완료됩니다.

자세한 내용은 [Liferay Commerce 2.0 이하](../shipments/creating-a-shipment.md#creating-a-new-shipment-on-liferay-commerce-2-0-and-below) 섹션에서 새 발송물 생성을 참조하십시오.

## 관련 주제

* [주문 워크플로 소개](../order-workflows/introduction-to-order-workflows.md)
* [주문 메뉴 참조 가이드](./orders-menu-reference-guide.md)
* [구독 관리](../subscriptions/managing-subscriptions.md)
* [선적 소개](../shipments/introduction-to-shipments.md)
* [재고 관리 참조 가이드](../../inventory-management/inventory-management-reference-guide.md)
