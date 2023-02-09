# 제품에 대한 구독 활성화

Liferay Commerce를 사용하면 [Simple](../product-types/creating-a-simple-product.md), [Grouped](../product-types/creating-a-grouped-product.md)및 [Virtual](../product-types/creating-a-virtual-product.md) 제품에 대한 구독을 만들고 관리할 수 있습니다. 구독의 예로는 잡지, 재생 가능한 서비스 계약 및 정기적으로 소비되는 항목에 대한 자동 주문이 있습니다. Commerce는 기본적으로 *개의 결제* 및 *배송* 구독을 제공합니다.

## 결제 및 배송 구독

_지불 구독_ 은 전기 요금 또는 Netflix 구독과 유사합니다. 여기에서 서비스를 계속하기 위해 반복적으로 은행 계좌에서 특정 금액이 인출됩니다.

```{important}
결제 구독은 PayPal 또는 반복 결제를 지원하는 기타 맞춤 결제 방법을 사용할 때만 활성화할 수 있습니다.
```

_배달 구독_ 은 잡지 구독과 유사합니다. 여기에서 일시금을 선불로 지불하고 반복적으로 배송을 생성합니다.

항목 또는 항목 그룹을 배송해야 하고 고객에게 반복적으로 요금이 청구되는 시나리오에 대해 결제 구독과 배달 구독을 결합할 수 있습니다.

## 전제 조건

제품에 대한 구독을 활성화하려면 스토어 관리자가 반복 결제를 지원하는 결제 방법을 활성화해야 합니다. 기본적으로 Liferay Commerce는 반복 지불 방법으로 [Paypal](../../../store-management/configuring-payment-methods/paypal.md) 을 지원합니다.

## 제품 구독 활성화

제품에 대한 구독을 활성화하려면 다음 단계를 따르십시오.

1. *글로벌 메뉴* (![Global Menu](../../../images/icon-applications-menu.png))을 열고 *커머스* 탭을 클릭한 후 *상품 관리* &rarr; *상품*로 이동합니다.

1. *구독* 탭을 클릭합니다.

    ![제품의 구독 탭을 클릭합니다.](./enabling-subscriptions-for-a-product/images/02.png)

1. 토글 스사이트를 사용하여 *지불 구독* 및/또는 *배달 구독*을 활성화합니다.

1. *구독 유형* 필드를 사용하여 구독의 시간 단위를 선택합니다.

   * 일
   * 주
   * 개월
   * 년

   주, 월 또는 연도를 선택하면 각 단위가 시작되는 날짜도 결정해야 합니다.

1. *구독 기간* 필드를 사용하여 구독 기간의 길이를 결정합니다.

1. 토글 스사이트를 사용하여 구독이 자동으로 종료되는지 여부를 결정합니다.

    ![결제 구독을 구성합니다.](./enabling-subscriptions-for-a-product/images/03.png)

1. 완료되면 *게시* 을 클릭합니다.

이제 선택한 제품에 대한 구독이 활성화되었습니다.

```{tip}
반복 지불을 지원하기 위해 다른 지불 방법을 구현할 수 있습니다. 자세한 내용은 [새 결제 수단 구현](../../../developer-guide/sales/implementing-a-new-payment-method.md)을 참조하세요.
```

## 제품 세부 정보에서 구독 보기

구독 세부 정보는 제품 세부 정보 위젯을 통해 제품 표시 페이지에 표시됩니다.

![결제 및 배송 가입 내역은 상품 상세 위젯에 표시됩니다.](./enabling-subscriptions-for-a-product/images/05.png)

## 추가 정보

* [구독 관리](../../../order-management/subscriptions/managing-subscriptions.md)
* [구독 관리 참조 가이드](../../../order-management/subscriptions/subscription-administration-reference-guide.md)
