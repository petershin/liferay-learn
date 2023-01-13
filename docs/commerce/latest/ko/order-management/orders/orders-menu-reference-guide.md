# 주문 메뉴 참조 가이드

주문은 _주문_ 메뉴에서 관리자가 [조회하고](./processing-an-order.md) 관리할 수 있습니다. _주문_ 메뉴에 액세스하려면 _글로벌 애플리케이션_ 버튼 &rarr; _상거래_ &rarr; _주문_를 클릭하십시오.

![글로벌 애플리케이션의 주문 메뉴로 이동합니다.](./orders-menu-reference-guide/images/11.png)

## 상거래 2.1 이하

_주문_ 메뉴에 액세스하려면 _제어판_ &rarr; _상거래_ &rarr; _주문_로 이동합니다.

상단에는 5개의 탭이 있습니다. _모두_, _열기_, _보류_, _처리_, _완료_.

![주문 메뉴](./orders-menu-reference-guide/images/05.png)

## 모두

_모두_ 탭은 주문 상태에 관계없이 모든 주문을 표시합니다.

## 열려있는

_Open_ 탭에는 체크아웃 프로세스를 완료하지 않은 모든 주문이 표시됩니다.

![주문 메뉴 - 탭 열기](./orders-menu-reference-guide/images/07.png)

| 분야       | 묘사                   |
|:-------- |:-------------------- |
| Order Id | 이것은 주문 ID입니다.        |
| 계정       | 이것은 계정의 이름입니다.       |
| 계정 번호    | 생성된 계좌번호입니다.         |
| 채널       | 주문한 채널 또는 상점의 이름입니다. |
| 총계       | 주문금액입니다.             |
| 날짜 생성    | 주문이 생성된 날짜가 표시됩니다.   |
| 주문 상태.   | 주문현황입니다.             |

## 미정

_Pending_ 탭에는 체크아웃 프로세스를 완료한 모든 주문이 표시됩니다.

![주문 메뉴 - 대기 중 탭](./orders-menu-reference-guide/images/06.png)

주목해야 할 세 가지 특정 필드가 있습니다.

| 분야          | 묘사                                                                                            |
|:----------- |:--------------------------------------------------------------------------------------------- |
| 명령 날짜       | 주문이 생성된 날짜입니다.                                                                                |
| 주문 상태.      | 주문현황입니다.                                                                                      |
| 승인 워크플로우 상태 | 이것은 주문의 [구매자 승인 워크플로](../order-workflows/enabling-or-disabling-order-workflows.md) 상태를 표시합니다. |

## 처리중

_Pending_ 에서 _Processing_으로 주문을 진행하려면 _Accept Order_ 버튼을 클릭하십시오.

![주문 메뉴 - 대기 중 탭](./orders-menu-reference-guide/images/10.png)

상점이 주문을 처리하기 시작하면 주문은 이제 _처리_ 탭에 있습니다.

![주문 메뉴 - 대기 중 탭](./orders-menu-reference-guide/images/09.png)

## 완료하는

[배송이 확인되면](../shipments/introduction-to-shipments.md)주문이 _완료_ 탭으로 이동됩니다.

![주문 메뉴 - 대기 중 탭](./orders-menu-reference-guide/images/08.png)

## Liferay Commerce 2.0 이하

주문은 [주문 수명 주기](./order-life-cycle.md)를 통한 주문 진행 상황에 따라 _Open_, _Pending_, _Transmitted_ 탭에서 관리됩니다.

![주문 메뉴 개요](./orders-menu-reference-guide/images/01.png "주문 메뉴 개요")

*주문* 메뉴의 주문 정보는 *Open Carts* 위젯( *Open* 탭 주문의 경우) 및 *Orders* 위젯( *Pending* 주문의 경우)을 사용하여 다른 사용자, 특히 구매자에게 제공될 수도 있습니다. 또는 *전송된* 탭). 자세한 내용은 [보류 중인 주문](../../creating-store-content/commerce-storefront-pages/pending-orders.md) 및 [주문](../../creating-store-content/commerce-storefront-pages/placed-orders.md) 을 참조하십시오.

### 열려있는

이 탭에서 주문 활동은 전적으로 구매자 측에서 이루어집니다. 구매자가 장바구니에 제품을 추가하면 _열기_ 탭에서 새 주문이 생성됩니다. 주문은 구매자가 주문할 때까지 이 탭에 남아 있습니다.

```{note}
*승인 워크플로*가 활성화된 경우 워크플로 프로세스가 완료되고 주문이 접수될 때까지 주문은 *열기* 탭에 남아 있습니다.
```

![열린 탭](./orders-menu-reference-guide/images/02.png "열린 탭")

### 미정

_Pending_ 탭은 주문을 보관하는 장소 역할을 합니다. 이는 모든 발주 주문이 즉시 전송되지 않는 비즈니스 컨텍스트에 유용합니다. 구매자가 주문을 하면 주문이 _Pending_ 탭으로 이동합니다. 여기서 판매자는 주문을 [수정, 취소 또는 전송할 수 있습니다](./processing-an-order.md#commerce-20-and-below).

```{note}
*Transmission Workflow*가 활성화된 경우 판매자가 주문을 거부하고 구매자에게 다시 보내는 경우에도 주문은 워크플로 프로세스 전체에서 *Pending* 탭에 남아 있습니다.
```

![보류 탭](./orders-menu-reference-guide/images/03.png "보류 탭")

### 전송됨

이 탭에서 주문 활동은 판매자 측에서만 이루어집니다. 판매자는 주문 상태</a> (수동 또는 자동화를 통해)을 "_To Transmit_" 상태에서 다른 주문 상태로 변경하여 _Pending_ 주문을
로 전송합니다. 이 시점에서 주문은 _전송됨_ 탭으로 이동하고 구성된 경우 Microsoft의 Dynamics GP, Oracle의 NetSuite 또는 SAP와 같은 외부 시스템으로 전송됩니다. 그런 다음 판매자는 주문한 제품을 구매자에게 배송할 수 있습니다. 업데이트된 [주문 상태](./order-management-statuses-reference-guide.md), [배송 정보](../shipments/introduction-to-shipments.md) 및 예상 도착 시간과 같은 추가 정보가 주문에 추가될 수도 있습니다.</p> 

![전송 탭](./orders-menu-reference-guide/images/04.png "전송 탭")



## 추가 정보

* [주문 워크플로 소개](../order-workflows/introduction-to-order-workflows.md)
* [주문 워크플로 활성화 또는 비활성화](../order-workflows/enabling-or-disabling-order-workflows.md)
* [주문 처리](./processing-an-order.md)
* [주문 관리 상태 참조 가이드](./order-management-statuses-reference-guide.md)
* [선적 소개](../shipments/introduction-to-shipments.md)
