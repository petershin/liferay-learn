# 배송 만들기

배송 생성은 [**주문** 메뉴](../orders/orders-menu-reference-guide.md)과 통합되어 있습니다. 또한 주문이 [**처리** 단계](../orders/processing-an-order.md)에 있으면 [**배송** 메뉴에서](./introduction-to-shipments.md) 배송을 관리할 수 있습니다.

## 새 배송 만들기

새 발송물을 생성하려면:

1. **제어판** &rarr; **상거래** &rarr; **주문** 로 이동합니다.
1. **Pending** 탭을 클릭하고 주문을 선택합니다.

    ![주문 메뉴](./creating-a-shipment/images/11.png)

1. **주문** 수락 버튼을 클릭합니다.

    ![주문 메뉴 - 주문 수락](./creating-a-shipment/images/12.png)

1. 주문이 수락되면 **배송 만들기** 버튼을 클릭합니다.

    ![주문 메뉴](./creating-a-shipment/images/10.png)

1. 배송 메뉴로 리디렉션됩니다.

1. 추가(![Add Icon](../../images/icon-add.png))를 클릭합니다.
1. 이 주문과 관련된 모든 항목을 선택하십시오.

    ![주문 메뉴](./creating-a-shipment/images/07.png)

1. **제출** 클릭합니다.
1. 항목 옆의 **편집** 클릭하여 수량을 선택하고 소싱 [창고](../../inventory-management/warehouse-reference-guide.md)선택합니다.
1. **발송 수량** 필드에 수량을 입력합니다.

    ![주문 메뉴](./creating-a-shipment/images/08.png)

1. **저장** 클릭합니다.
1. **처리 완료** 를 클릭합니다.

주문 상품을 배송할 준비가 되면 다음 단계를 따르세요.

1. **수정** 클릭하여 예상 배송일과 예상 배송일을 입력합니다.

    ![주문 메뉴](./creating-a-shipment/images/09.png)

1. 준비가 되면 **배송** 클릭합니다.

## Liferay Commerce 2.0 이하에서 새 발송물 만들기

이전 버전의 Liferay Commerce에서 배송을 생성하려면:

1. **제어판** → **상거래** → **배송** 로 이동합니다.
1. 추가(![add-icon](../../images/icon-add.png)) 버튼을 클릭하여 새 발송물을 추가하십시오.
1. 드롭다운 메뉴에서 주문을 선택합니다(예: **41241**).

    ![주문 선택](./creating-a-shipment/images/02.png)

1. **저장** 클릭합니다.
1. 해당 [창고](../../inventory-management/warehouse-reference-guide.md)의 수량을 입력하십시오.

    ![US NE 창고에서 수량 입력](./creating-a-shipment/images/03.png)

1. **저장** 클릭합니다.
1. 배송 주소를 확인합니다.

    ![배송 주소 확인](./creating-a-shipment/images/04.png)

1. **저장** 클릭합니다.

새 배송이 생성되었습니다.

배송이 생성되면 주문 관리자가 배송에 대해 수행할 수 있는 몇 가지 추가 작업이 있습니다.

### 항목 확인

1. **항목** 탭을 클릭하여 항목이 올바른지 확인합니다.

    ![항목 확인](./creating-a-shipment/images/05.png)

### 배송 상태 업데이트

1. **세부 정보** 탭을 클릭합니다.
1. **운송업체** 필드에 운송업체 이름을 입력합니다(예: USPS, FedEx, UPS).
1. **추적 번호** 을 입력합니다.
1. **상태** 드롭다운 메뉴에서 상태를 선택합니다(예: **배송 준비 완료**).
1. **저장** 클릭합니다.

주문 관리자는 주문이 완료될 때까지 필요에 따라 배송 상태를 업데이트할 수 있습니다.

![배송된 품목](./creating-a-shipment/images/06.png)

## 추가 정보

* [창고 설정](../../inventory-management/setting-up-warehouses.md)
* [창고별 재고 설정](../../inventory-management/setting-inventory-by-warehouse.md)
* [주문 정보](../orders/order-information.md)
* [주문 처리](../orders/processing-an-order.md)
* [창고 참조 가이드](../../inventory-management/warehouse-reference-guide.md)
