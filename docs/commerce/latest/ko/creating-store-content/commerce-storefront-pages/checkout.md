# 점검

체크아웃 페이지에는 **체크아웃** 위젯이 포함되어 있습니다. 구매자가 주문을 제출하기 위해 **체크아웃** 클릭하면 활성화됩니다. 확장 포인트를 사용하여 사용자 정의 체크아웃 단계를 구현할 수도 있습니다. 자세한 내용은 [사용자 정의 체크아웃 구현](../../developer-guide/sales/implementing-a-custom-checkout-step.md) 단계를 참조하십시오.

![활성 주문이 없으면 Checkout 위젯이 비어 있습니다.](./checkout/images/01.png)

체크아웃 과정에서 구매자의 배송 및 청구지 주소를 입력하고 배송 방법을 선택하고 주문을 검토하고 확인하는 단계가 있습니다.

## 배송 주소 입력

![주문에 대한 배송 주소를 입력합니다.](./checkout/images/02.png)

구매자가 **배송 주소를 청구 주소로 사용** 선택하면 청구 주소 페이지를 건너뜁니다.

## 배송 방법 선택

![주문에 적합한 배송 방법을 선택합니다.](./checkout/images/03.png)

구매자가 사용할 수 있는 배송 방법은 **사이트 관리** → **상거래** → **설정** -> **배송 방법** 에서 **배송 방법** 을 변경하여 구성합니다. 자세한 내용은 [정액 배송 방법 사용](../../store-management/configuring-shipping-methods/using-the-flat-rate-shipping-method.md)을 참조하세요.

## 청구 주소 입력

위에서 언급한 것처럼 이 페이지는 구매자의 청구지 주소가 배송지 주소와 다른 경우에만 나타납니다.

![주문에 대한 청구지 주소를 입력합니다.](./checkout/images/04.png)

## 주문 요약 보기

![확인하기 전에 주문 세부 정보를 봅니다.](./checkout/images/05.png)

## 주문 확인

![주문을 확인하고 주문 세부 정보 페이지로 이동하여 주문을 확인합니다.](./checkout/images/06.png)

주문이 확인되면 판매자가 주문을 처리할 준비가 된 것입니다. 자세한 내용은 [주문 수명 주기](../../order-management/orders/order-life-cycle.md) 참조하십시오.

```{note}
*체크아웃* 위젯은 즉시 사용 가능한 Liferay의 적응형 미디어를 지원합니다. [디바이스 및 화면에 최적화된 미디어 제공](https://learn.liferay.com/w/dxp/content-authoring-and-management/documents-and-media/publishing-and-sharing/serving-device-and-screen-optimized-media) 을 참조하세요.
```

## 관련 주제

* [위젯 참조 가이드](../liferay-commerce-widgets/widget-reference.md)
* [페이지 만들기](https://help.liferay.com/hc/ko/articles/360018171291-Creating-Pages)
* [사용자 정의 체크아웃 단계 구현](../../developer-guide/sales/implementing-a-custom-checkout-step.md)
* [고정 요금 배송 방법 사용](../../store-management/configuring-shipping-methods/using-the-flat-rate-shipping-method.md)
