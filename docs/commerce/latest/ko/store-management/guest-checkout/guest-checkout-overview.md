# 비회원 결제 개요

게스트 체크아웃 기능은 채널[별로 활성화할 수](../../store-management/channels/introduction-to-channels.md) 사용자가 사이트에 등록된 계정 없이 주문을 제출할 수 있습니다. 자세한 내용은 [게스트 체크아웃 활성화](./enabling-guest-checkout.md) 을 참조하십시오.

게스트 체크아웃이 활성화되면 게스트 사용자는 체크아웃 프로세스 중에 이메일 주소를 입력해야 합니다.

![게스트는 계속 진행하려면 이메일 주소를 입력해야 합니다.](./guest-checkout-overview/images/01.png)

이메일을 제공하면 게스트에게 로그인, 계정 생성 또는 게스트로 계속하라는 메시지가 표시됩니다. 카트에 항목을 추가한 다음 나중에 체크아웃하기 전에 로그인하면 항목이 자동으로 계정 카트로 이동됩니다.

![사용자는 로그인하거나 계정을 만들거나 게스트로 계속할 수 있습니다.](./guest-checkout-overview/images/03.png)

## 게스트 주문 처리

게스트가 주문을 제출하면 다른 주문과 동일하게 처리됩니다. 자세한 내용은 [주문 처리](../../order-management/orders/processing-an-order.md) 을 참조하십시오.

```{note}
게스트는 동일한 이메일 주소를 가지고 있더라도 인증된 다른 사용자와 주문 내역을 공유하지 않습니다.
```

## 게스트 체크아웃 인증 페이지 만들기

게스트 체크아웃에는 **게스트 체크아웃 인증** 위젯이 있는 [페이지 만들기](https://learn.liferay.com/w/dxp/site-building/creating-pages) 이 필요합니다. 이 페이지와 위젯을 생성하려면 [채널 설정](../../store-management/channels/channels-reference-guide.md) 에서 Health Check 기능을 사용하십시오.

**게스트로 계속** 을 클릭하면 고객이 로그인하거나 계정을 만들지 않고도 구매를 완료할 수 있습니다.

![또 다른 옵션은 게스트 체크아웃 인증 위젯입니다.](./guest-checkout-overview/images/02.png)

이 인증 페이지가 없으면 손님은 **Checkout** 위젯이 있는 페이지로 리디렉션됩니다.

## 관련 주제

* [게스트 체크아웃 활성화](./enabling-guest-checkout.md)
* [채널 소개](../../store-management/channels/introduction-to-channels.md)
* [채널 관리](../../store-management/channels/managing-channels.md)
* [채널 참조 가이드](../../store-management/channels/channels-reference-guide.md)
