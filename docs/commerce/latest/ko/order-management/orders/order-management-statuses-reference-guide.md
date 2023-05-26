# 주문 관리 상태 참조 가이드

> 라이프레이 커머스 2.0

Liferay Commerce의 모든 주문에는 [주문 정보](./order-information.md) 과 관련된 주문 관리 상태가 있습니다.

이 문서에서는 [**주문** 메뉴](./orders-menu-reference-guide.md)에 있는 세 가지 주문 관리 상태 유형(**주문 상태** , **결제 상태** , **작업 흐름 상태**)을 검토합니다.

![주문 관리 상태](./order-management-statuses-reference-guide/images/01.png)

## 주문 상태

**주문 상태** 는 [주문 수명 주기](./order-life-cycle.md)에서 주문이 어디에 있는지에 대한 정보를 제공합니다. 각 주문 상태는 다음 [**주문** 메뉴](./orders-menu-reference-guide.md) 탭 중 하나에 표시됩니다. [**열기**](./orders-menu-reference-guide.md#open) , [**보류 중**](./orders-menu-reference-guide.md#pending) 또는 [**전송됨**](./orders-menu-reference-guide.md#transmitted) .

### 열려 있는

**Open** 탭에는 **Open** 및 **In Progress** 의 두 가지 주문 상태가 있습니다.

![주문 상태 열기 탭](./order-management-statuses-reference-guide/images/02.png)

| 주문 상태 | 설명                                                                  |
|:----- |:------------------------------------------------------------------- |
| 열려 있는 | 하나 이상의 제품이 장바구니에 추가되었습니다. 주문이 체크아웃 프로세스에 있을 수 있습니다(**주문 요약** 페이지까지). |
| 진행 중  | 주문이 **주문요약** 페이지를 넘어 결제단계까지 체크아웃 과정을 거쳐 진행되었습니다.                      |

### 보류 중

**Pending** 탭에는 **To Transmit** 이라는 한 가지 주문 상태가 있습니다.

![주문 상태 보류 중 탭](./order-management-statuses-reference-guide/images/03.png)

| 주문 상태 | 설명                               |
|:----- |:-------------------------------- |
| 전송하기  | 구매자가 주문을 했지만 판매자가 아직 전송하지 않았습니다. |

### 전송됨

아래와 같이 **전송됨** 탭에서 사용할 수 있는 12개의 주문 상태가 있습니다.

![주문 상태 전송됨 탭](./order-management-statuses-reference-guide/images/04.png)

| 주문 상태      | 설명                                                                                                                                            |
|:---------- |:--------------------------------------------------------------------------------------------------------------------------------------------- |
| 전송됨        | 추가 상태 업데이트 없이 주문이 [전송](./processing-an-order.md#commerce-20-and-below) 되었습니다. (전송된 주문의 기본 주문 상태입니다.)                                           |
| 이행 대기 중    | 주문이 [전송되고](./processing-an-order.md#commerce-20-and-below) 결제가 확인되었지만 운송업체에서 아직 [배송](../shipments/introduction-to-shipments.md) 준비가 되지 않았습니다. |
| 픽업 대기 중    | 주문이 준비되었으며( [배송됨](../shipments/introduction-to-shipments.md)가능) 판매자가 지정한 사이트에서 구매자가 픽업하기를 기다리고 있습니다.                                           |
| 출하를 기다리는 중 | 주문이 [배송](../shipments/introduction-to-shipments.md)준비되었으며 배송업체에서 픽업 및 배송을 기다리고 있습니다.                                                          |
| 부분 환불됨     | 판매자가 주문 총액보다 적은 금액으로 구매자에게 환불했습니다.                                                                                                            |
| 일부 배송됨     | 주문한 제품 중 일부만 [배송](../shipments/introduction-to-shipments.md)되었습니다.                                                                            |
| 환불됨        | 판매자가 주문의 총 가격을 구매자에게 환불했습니다.                                                                                                                  |
| 배송됨        | 주문이 [배송](../shipments/introduction-to-shipments.md)되었지만 아직 받은 것으로 확인되지 않았습니다.                                                                 |
| 완전한        | 주문은 [배송](../shipments/introduction-to-shipments.md) (또는 픽업)되었으며 수령한 것으로 확인되었습니다. 또는 가상 제품이 유료이고 다운로드할 수 있습니다.                                 |
| 취소 된       | 판매자가 주문을 취소했습니다.                                                                                                                              |
| 거부됨        | 주문이 [배송](../shipments/introduction-to-shipments.md)되었지만 구매자가 수령을 거부했습니다.                                                                      |
| 논쟁         | 구매자가 지불 거래에 대한 분쟁 해결을 시작했습니다(예: PayPal을 통해).                                                                                                  |

## 지불 상태

**결제 상태**[](./processing-an-order.md)에 대한 결제 및 수령 여부에 대한 정보를 제공합니다. [**주문** 메뉴](./orders-menu-reference-guide.md)의 **보류 중** 및 **전송됨** 탭에는 **승인됨** , **지불됨** 및 **보류 중** 의 세 가지 결제 상태가 있습니다. (**Open** 탭에서 주문의 결제 상태는 항상 **Pending** 입니다.)

![지불 상태](./order-management-statuses-reference-guide/images/05.png)

| 지불 상태 | 설명                                                                                                                                                                                                         |
|:----- |:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 인정 받은 | 관련된 금융 기관에서 지불을 승인했으며 자금을 판매자의 계좌에 입금하기 위한 조치가 취해질 것입니다. (PayPal과 같은 온라인 결제 방법이나 신용 카드 또는 직불 카드의 경우일 수 있습니다.)                                                                                              |
| 유급의   | [주문](./processing-an-order.md) 에 대한 결제가 판매자에게 접수되었습니다.                                                                                                                                                     |
| 보류 중  | [주문](./processing-an-order.md) 에 대한 결제가 접수되지 않았거나 승인되지 않았습니다. (우편환, 구매주문서 등 오프라인 결제수단의 경우, 아직 입금 또는 확인이 되지 않았거나, 결제 상태가 업데이트되지 않은 경우일 수 있습니다. 구매자가 결제 프로세스를 중지하는 경우 PayPal과 같은 온라인 결제 수단의 경우도 해당될 수 있습니다.) |

## 워크플로 상태

**워크플로 상태** 주문이 두 개의 [주문 워크플로](../order-workflows/introduction-to-order-workflows.md)중 하나에 있는 사이트에 대한 정보를 제공합니다.

### 열려 있는

**시작** 탭의 워크플로 상태 [**승인 워크플로**](../order-workflows/introduction-to-order-workflows.md#approval-workflow-buyer-side-cart-approval-only) 을 통한 주문의 진행 상황을 나타냅니다. 이 주문 워크플로에는 **초안** , **보류** 및 **승인** 의 세 가지 워크플로 상태가 있습니다.

![워크플로 상태 열기 탭](./order-management-statuses-reference-guide/images/06.png)

| 워크플로우 상태 | 설명                                                                                                                             |
|:-------- |:------------------------------------------------------------------------------------------------------------------------------ |
| 초안       | 제품이 카트에 추가되었지만 카트가 아직 검토를 위해 제출되지 않았으며 구매자가 [승인](../order-workflows/approving-or-rejecting-orders-in-order-workflows.md) 했습니다. |
| 보류 중     | 카트(주문)가 검토 및 [승인](../order-workflows/approving-or-rejecting-orders-in-order-workflows.md)위해 제출되었지만 아직 구매자가 승인하지 않았습니다.         |
| 승인됨      | 구매자가 주문을 검토하고 [승인](../order-workflows/approving-or-rejecting-orders-in-order-workflows.md) 했으며 이제 주문을 결제할 수 있습니다.              |

### 보류 중

**보류** 탭의 작업 흐름 상태 [**전송 작업 흐름**](../order-workflows/introduction-to-order-workflows.md#transmission-workflow-seller-side-order-approval-only) 을 통한 주문의 진행 상황을 나타냅니다. 이 주문 워크플로에는 **대기 중** 및 **승인됨** 의 두 가지 워크플로 상태가 있습니다.

![워크플로 상태 보류 중 및 전송됨 탭](./order-management-statuses-reference-guide/images/07.png)

| 워크플로우 상태 | 설명                                                                                                                                                                                                    |
|:-------- |:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 보류 중     | 주문이 접수되었지만 아직 판매자가 [승인](../order-workflows/approving-or-rejecting-orders-in-order-workflows.md) 하지 않았습니다.                                                                                             |
| 승인됨      | 판매자가 주문을 검토하고 [승인](../order-workflows/approving-or-rejecting-orders-in-order-workflows.md) 했으며 이제 주문이 [전송될 수 있습니다](./processing-an-order.md#commerce-20-and-below) . (참고: 이 워크플로 상태는 **전송됨** 탭에도 나타납니다.) |

## 관련 주제

* [주문 워크플로 소개](../order-workflows/introduction-to-order-workflows.md)
* [주문 워크플로우에서 주문 승인 또는 거부](../order-workflows/approving-or-rejecting-orders-in-order-workflows.md)
* [주문 처리](./processing-an-order.md)
* [주문 메뉴 참조 가이드](./orders-menu-reference-guide.md)
* [선적 소개](../shipments/introduction-to-shipments.md)
