# PayPal

이 문서에서는 PayPal을 결제 수단으로 활성화하는 방법에 대해 자세히 설명합니다.

PayPal을 사용하도록 상점을 구성하기 전에 PayPal 클라이언트 ID 및 클라이언트 비밀 번호를 생성해야 합니다. 자세한 내용은 [PayPal 개발자 대시보드](https://developer.paypal.com/developer/applications/create) 참조하십시오.

1. **사이트 관리 → 상거래 → 설정 → 지불 방법** 으로 이동합니다.
1. **페이팔** 클릭합니다.
1. **구성** 을 클릭합니다.
1. 다음을 입력:
    * **클라이언트 아이디**
    * **클라이언트 시크릿**
1. 라이브 사이트인 경우 **라이브** 선택하고 테스트 환경인 경우 **샌드박스** 선택합니다.
1. **결제 시도 최대 횟수** 필드에 구독을 취소하기 전에 구독에 대한 결제 시도 횟수를 입력합니다.
    * 자세한 내용은 PayPal의 [구독 버튼을 사용한 반복 결제 재시도 실패](https://developer.paypal.com/docs/paypal-payments-standard/integration-guide/reattempt-failed-payment/) 기사를 읽어보세요. ![페이팔 설정](./paypal/images/01.png)
1. **저장** 클릭합니다.
1. **PayPal** 옆에 있는 **점 3개 아이콘** 클릭한 다음 **활성화** 클릭합니다.

이제 스토어에서 PayPal을 사용할 수 있습니다.

## 관련 주제

다른 결제 방법 추가에 대한 자세한 내용은 다음과 같습니다.

* [새 통화 추가](../currencies/adding-a-new-currency.md)
* [Authorize.net](./authorize-net.md)
* [Mercanet](./mercanet.md)
* [구독 버튼으로 반복 결제 실패 재시도](https://developer.paypal.com/docs/paypal-payments-standard/integration-guide/reattempt-failed-payment/)
