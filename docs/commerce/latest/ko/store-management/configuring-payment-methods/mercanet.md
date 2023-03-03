---
uuid: acb33a41-7083-4874-8e8e-f6aa1d284b2c
---

# Mercanet

이 문서에서는 Mercanet을 결제 수단으로 활성화하는 방법을 자세히 설명합니다. Mercanet은 **만 EUR**만 허용하므로 상점의 기본 통화는 EUR이어야 합니다.

## 머카넷 가이드

1. [전제 조건을 검토하십시오.](#prerequisites)
1. [EUR을 기본 상점 통화로 설정하십시오.](#set-eur-as-the-primary-store-currency)
1. [Mercanet을 결제 수단으로 활성화합니다.](#activate-mercanet-as-a-payment-method)

## 전제 조건

[Mercanet](https://documentation.mercanet.bnpparibas.net/index.php?title=Obtenir_sa_cl%C3%A9_secr%C3%A8te#) 사용하도록 상점을 구성하기 전에 다음을 생성해야 합니다.

1. Mercanet 판매자 ID
1. 비밀 키
1. 키 버전

## EUR을 기본 상점 통화로 설정

Mercanet을 사용하는 경우 상점은 유로를 기본 통화로 사용해야 합니다. 기본 통화를 변경하려면:

1. _제어판 → 상거래 → 설정_으로 이동합니다.
1. _통화_을 클릭합니다.
1. 유로 옆에 있는 _점 3개 아이콘_ 을 클릭합니다.
1. _기본_로 설정 을 클릭합니다.

_유로_ 이제 기본 통화로 설정됩니다.

![기본 통화 설정](./mercanet/images/01.png)

## 결제 수단으로 Mercanet 활성화

1. _사이트 관리 → 상거래 → 설정 → 지불 방법_으로 이동합니다.
1. _결제 수단_을 클릭합니다.
1. _Mercanet_클릭합니다.
1. _구성_을 클릭합니다.
1. 다음을 입력:
    * 귀하의 _판매자 ID_
    * 귀하의 _비밀 키_
    * 귀하의 _키 버전_
1. 라이브 사이트인 경우 _프로덕션_ 선택하고 테스트 환경인 경우 _테스트_ 또는 _시뮬레이션_ 선택합니다. ![판매자 설정](./mercanet/images/02.png)
1. _저장_클릭합니다.
1. _Mercanet_ 옆에 있는 _점 3개 아이콘_ 클릭한 다음 _활성화_클릭합니다.

이제 상점에서 Mercanet을 사용할 수 있습니다.

## 추가 정보

* [새 통화 추가](../currencies/adding-a-new-currency.md)
* [Authorize.net](./authorize-net.md)
* [PayPal](./paypal.md)
