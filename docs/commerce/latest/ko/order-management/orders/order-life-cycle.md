# 주문 수명 주기

주문은 잠재적 또는 과거 거래에 관한 데이터를 저장합니다. 이 문서에서는 열린 장바구니에서 [주문 처리](../shipments/introduction-to-shipments.md)까지의 주문 수명 주기에 대한 개요를 제공합니다.

![최신 주문 수명 주기 인포그래픽입니다.](./order-life-cycle/images/01.png)

## 라이프레이 커머스 2.0

주문은 잠재적 또는 과거 거래에 관한 데이터를 저장합니다. 이 문서에서는 열린 장바구니에서 [주문 처리](../shipments/introduction-to-shipments.md)까지의 주문 수명 주기에 대한 개요를 제공합니다.

![주문 수명 주기](./order-life-cycle/images/02.png)

### 1단계: 장바구니에 제품 추가

구매자가 장바구니에 제품을 넣으면 새 주문이 생성됩니다. 이 시작점에서 주문에 저장된 데이터에는 제품의 ID와 수량은 물론 제품을 생성한 계정이 포함됩니다.

### 2단계: 주문 완료

판매자에게 정보를 제공하고 주문 요약을 본 후 구매자는 주문을 합니다. 주문 워크플로가 활성화된 경우 제출하기 전에 주문을 검토합니다. 주문이 처리되는 동안 구매자는 주문 상태를 추적하는 알림 [개](../../store-management/sending-emails.md) 를 받을 수 있습니다.

### 3단계: 주문 전송

판매자가 주문을 보류에서 전송으로 진행하면 주문이 Microsoft의 Dynamics GP, Oracle의 NetSuite 또는 SAP와 같은 외부 시스템으로 전송됩니다. 판매자 주문 수락 워크플로가 활성화된 경우 판매자는 구매가 허용되기 전에 승인을 받아야 합니다.

### 4단계: 주문 이행

판매자는 주문한 상품을 구매자에게 전달하기 위해 나머지 단계를 완료합니다. 업데이트된 주문 상태, 배송 정보 및 예상 도착 시간과 같은 추가 정보를 주문에 추가할 수 있습니다. 그러면 구매자와 판매자에게 주문이 이행되었음을 알릴 수 있습니다.

## 관련 주제

* [주문 워크플로 소개](../order-workflows/introduction-to-order-workflows.md)
* [주문 처리](./processing-an-order.md)
* [주문 메뉴](./orders-menu-reference-guide.md)
* [선적 소개](../shipments/introduction-to-shipments.md)
* [이메일 보내기](../../store-management/sending-emails.md)
