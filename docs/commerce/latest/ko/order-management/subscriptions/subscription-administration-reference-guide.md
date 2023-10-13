# 구독 관리 참조 가이드

구독은 **글로벌 애플리케이션** 의 **구독** 메뉴에서 [관리](./managing-subscriptions.md)됩니다. 이 문서에서는 **구독** 메뉴에서 사용할 수 있는 다양한 기능과 필드에 대해 설명합니다.

5개의 필드가 있습니다.

| 분야       | 묘사                        |
|:-------- |:------------------------- |
| ID       | 구독의 ID입니다.                |
| 상태       | 상태에는 주문 상태가 표시됩니다.        |
| Order Id | 구독의 기반이 되는 주문 ID입니다.      |
| 계정 아이디   | 계정 ID는 구독을 생성한 계정에 해당합니다. |
| 계정 이름    | 계정 이름은 계정 이름에 해당합니다.      |

## 커머스 2.1 이하

구독은 **제어판** 의 **구독** 메뉴에서 [관리](./managing-subscriptions.md)됩니다.

**제어판** &rarr;으로 이동합니다. **상거래** &rarr; **구독** .

![구독 관리](./subscription-administration-reference-guide/images/01.png)

5개의 필드가 있습니다.

| 분야       | 묘사                        |
|:-------- |:------------------------- |
| ID       | 구독의 ID입니다.                |
| 상태       | 상태에는 주문 상태가 표시됩니다.        |
| Order Id | 구독의 기반이 되는 주문 ID입니다.      |
| 계정 아이디   | 계정 ID는 구독을 생성한 계정에 해당합니다. |
| 계정 이름    | 계정 이름은 계정 이름에 해당합니다.      |


구독 주문의 세부 정보를 보려면 구독의 **ID** 을 클릭하세요.

<!--Need to finish this for Commerce 3.0; blocked by https://issues.liferay.com/browse/COMMERCE-4813 -->

세 개의 탭이 있습니다: **일반** , **배송** , **결제** .

## 일반 탭

**일반** 탭에는 구독 [주문](../orders/processing-an-order.md)의 기본 세부정보가 포함되어 있습니다.

### 참조 순서

참고 주문_ 섹션에는 [주문에 대한 정보](../orders/order-information.md)가 표시됩니다:

![결제 섹션](./subscription-administration-reference-guide/images/02.png)

### 결제 신청

결제 구독 섹션에서는 다음 정보를 추적합니다.

![참조](./subscription-administration-reference-guide/images/03.png)

| 분야       | 묘사                                                                       |
|:-------- |:------------------------------------------------------------------------ |
| 상태       | 구독의 워크플로 상태입니다.                                                          |
| 다음 반복 날짜 | 결제 기한은 다음 날입니다.                                                          |
| 구독 유형    | 구독 유형은 다음과 같습니다.                                                         |
| 구독 기간    | 이는 배송 간격의 길이를 나타냅니다.                                                     |
| 모형       | 이는 간격이 표시된 날짜를 나타냅니다. 사용자는 해당 월의 정확한 날짜 또는 **_** 의 마지막 날을 옵션으로 선택할 수도 있습니다. |

```{warning}
이 기능을 비활성화해야 하는 경우 [blacklist](https://learn.liferay.com/web/guest/w/dxp/system-administration/installing-and-managing-apps/managing-apps/blacklisting-osgi-components.md) 구성 요소입니다. 간격에 0이나 음수를 입력하지 마십시오.
```

### 배송 신청

**배달 구독** 섹션은 다음 정보를 추적합니다.

![배송](./subscription-administration-reference-guide/images/04.png)

| 분야       | 묘사                                                                       |
|:-------- |:------------------------------------------------------------------------ |
| 상태       | 구독의 워크플로 상태입니다.                                                          |
| 다음 반복 날짜 | [배송](../shipments/introduction-to-shipments.md) 발송된 다음날입니다.              |
| 구독 유형    | 구독 유형은 다음과 같습니다.                                                         |
| 구독 기간    | 이는 배송 간격의 길이를 나타냅니다.                                                     |
| 모형       | 이는 간격이 표시된 날짜를 나타냅니다. 사용자는 해당 월의 정확한 날짜 또는 **_** 의 마지막 날을 옵션으로 선택할 수도 있습니다. |

```{warning}
이 기능을 비활성화해야 하는 경우 [blacklist](https://learn.liferay.com/web/guest/w/dxp/system-administration/installing-and-managing-apps/managing-apps/blacklisting-osgi-components.md) 구성 요소입니다. 간격에 0이나 음수를 입력하지 마십시오.
```

### 품목

**개의 항목** 섹션에는 구독에 있는 [제품](../../product-management/creating-and-managing-products/products/products-overview.md) 이 모두 나열됩니다.

![품목](./subscription-administration-reference-guide/images/05.png)

## 배송 탭

**배송** 탭에는 다음 정보가 표시됩니다.

![선적](./subscription-administration-reference-guide/images/06.png)

| 분야       | 묘사                                                               |
|:-------- |:---------------------------------------------------------------- |
| 날짜 생성    | 주문이 [생성된 날짜입니다](../orders/processing-an-order.md).               |
| 배송 ID    | 이 번호는 [배송](../shipments/introduction-to-shipments.md) ID로 생성됩니다. |
| 상태       | [Order](../orders/orders-menu-reference-guide.md)의 상태입니다.        |
| Order Id | 이는 구독의 기본 순서를 나타냅니다.                                             |
| 전송       | 이는 계정의 배송 주소입니다.                                                 |
| 추적       | 이는 운송업체의 추적 번호입니다.                                               |

## 결제 탭

**Payments** 탭은 주문의 결제 내역을 추적합니다.

![품목](./subscription-administration-reference-guide/images/07.png)

| 분야     | 묘사                                                 |
|:------ |:-------------------------------------------------- |
| 유형     | 결제가 성공적으로 이루어졌는지 여부를 나타냅니다.                        |
| 날짜     | 주문이 [생성된 날짜입니다](../orders/processing-an-order.md). |
| TXN ID | 거래ID입니다.                                           |
| 총계     | 이는 주문의 총 금액을 나타냅니다.                                |

## 관련 주제

* [구독 활성화](../../product-management/creating-and-managing-products/products/enabling-subscriptions-for-a-product.md)
* [구독 관리](./managing-subscriptions.md)
* [주문 처리](../orders/processing-an-order.md)
* [배송 소개](../shipments/introduction-to-shipments.md)
* [주문 정보](../orders/order-information.md)
