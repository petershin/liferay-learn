---
toc:
- ./configuring-payment-methods/managing-payment-methods.md
- ./configuring-payment-methods/authorize-net.md
- ./configuring-payment-methods/mercanet.md
- ./configuring-payment-methods/money-orders.md
- ./configuring-payment-methods/paypal.md
---
# 결제 수단 구성

결제는 결제 수단을 통해 처리됩니다. 세 가지 유형의 지불 방법이 있습니다.

**오프라인** : Liferay Commerce가 결제를 처리하지 않습니다.

**온라인 표준** : 결제는 전적으로 Liferay Commerce에서 처리합니다. 이 옵션은 기본적으로 사용할 수 없지만 결제 방법 확장 지점을 사용하여 사용자 지정할 수 있습니다.

**온라인 리디렉션** : Liferay Commerce는 제3자 결제 프로세서에 정보를 전달하여 결제를 완료하기 위해 구매자를 프로세서 웹사이트로 리디렉션합니다.

Liferay Commerce는 네 가지 결제 방법을 제공합니다. 우편환은 오프라인 방식입니다. Authorize.net, Mercanet 및 PayPal은 구매자를 타사 웹사이트로 리디렉션합니다. 지불 방법 확장 지점을 사용하여 추가 방법을 추가할 수 있습니다.

기본적으로 Liferay Commerce는 고객 결제 정보를 저장하지 **않습니다** . 반복 결제 또는 더 빠른 체크아웃 경험을 허용해야 하는 요구 사항이 있는 스토어는 제3자 결제 프로세서를 사용하여 민감한 고객 결제 정보를 관리하는 것이 좋습니다. 매장 관리자가 고객 결제 정보를 저장해야 하는 경우 [PCI DSS](https://www.pcisecuritystandards.org/) 준수 관행 및 정책을 구현하는 것이 **적극 권장** 됩니다.

```{raw} html
:file: ../landingpage_template.html
```

```{raw} html
:file: configuring-payment-methods/landing.html
```
