---
toc:
  - ./channel-defaults/setting-channel-defaults.md
  - ./channel-defaults/channel-defaults-permissions-reference.md
---
# 채널 기본값

{bdg-secondary}`사용 가능한 Liferay 7.4 U49+/GA49+`

비즈니스 계정을 만든 후 [채널 소개](https://learn.liferay.com/web/guest/w/commerce/store-management/channels/introduction-to-channels) 기본값을 설정할 수 있습니다. 이를 통해 주문을 생성하는 데 걸리는 시간을 줄이고 계정 관리자가 특정 계정에 대한 상거래 행동을 맞춤화할 수 있도록 지원하여 고객 경험을 개선할 수 있습니다. 다음 채널 기본값을 설정할 수 있습니다.

* 표로 만드는 주소
* 발송 주소
* 배송 약관
* 지불 조건
* 배송 옵션
* 가격 목록
* 할인
* 환율
* 결제 방법
* 채널 계정 관리자

사용자 역할 및 권한에 따라 결제 중에 주문의 기본값을 변경할 수 있습니다. 사용자가 채널 기본값으로만 주문할 수 있도록 권한을 설정할 수도 있습니다.

## 자격 및 채널 기본값 이해

채널 기본값은 자격과 함께 작동합니다. 즉, 주문이 설정된 기본값에 적합하지 않은 경우 Liferay는 적격한 다음으로 높은 우선 순위 값을 사용합니다. 일부 채널 기본값의 경우 자격 여부에 관계없이 이 동작을 재정의하여 기본값을 적용할 수 있습니다.

예를 들어 할인 A가 비즈니스 계정의 채널 기본값이지만 주문 유형 X만 할인 A에 적격한 경우 Liferay는 다른 유형의 주문에 할인 A를 적용하지 않습니다. 대신 Liferay는 주문에 적합한 다음 우선 순위 할인을 적용합니다(존재하는 경우). 그러나 자격을 무시하면 Liferay는 자격에 관계없이 모든 계정 주문에 할인 A를 적용합니다.


