# 상거래 대시보드

[Commerce](../getting-started/connecting-liferay-dxp-to-analytics-cloud.md)활성화 후 Analytics Cloud 대시보드를 통해 Commerce 데이터를 검토할 수 있습니다. 이 대시보드는 데이터를 4개의 카드로 구성합니다.

* 총 주문 금액
* 불완전한 주문
* 평균 주문 금액
* 계정당 평균 수익

상거래 데이터를 날짜별로 필터링하고 현재 측정항목을 이전 실적 데이터와 비교할 수 있습니다.

![상거래 토글을 활성화할 때의 기본 상거래 대시보드.](./commerce-dashboard/images/01.png)

```{note}
Liferay DXP를 Analytics Cloud에 연결한 후 상거래 데이터가 대시보드에 표시될 때까지 최대 2시간을 허용하십시오.
```

## 총 주문 금액

![발주된 주문의 총 가치를 봅니다.](./commerce-dashboard/images/02.png)

동기화된 채널의 모든 계정에 대한 총 주문 금액을 표시합니다.

## 불완전한 주문

![완료되지 않은 주문의 총 가치를 봅니다.](./commerce-dashboard/images/03.png)

동기화된 채널의 모든 계정에서 완료되지 않은 주문의 총 가치를 표시합니다. 완료되지 않은 주문은 체크아웃되지 않은 주문입니다.

## 평균 주문 금액

![모든 계정의 평균 주문 금액을 봅니다.](./commerce-dashboard/images/04.png)

동기화된 채널의 모든 계정에 대한 평균 주문 값을 표시합니다. 총 주문 금액을 주문 건수로 나눕니다.

## 계정당 평균 수익

![주문한 계정 수와 관련된 평균 수익을 봅니다.](./commerce-dashboard/images/05.png)

동기화된 채널에서 주문한 계정 수와 관련된 평균 수익을 표시합니다. 총 주문 금액을 주문한 계정 수로 나눕니다.

```{note}
Analytics Cloud는 동기화된 상거래 채널의 통화를 사용합니다.
```
