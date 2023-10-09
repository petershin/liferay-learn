# 인스턴스 설정 구성

Liferay 인스턴스는 동일한 설치를 공유하지만 다른 도메인 이름의 고유한 디지털 경험을 제공하도록 구성됩니다. 각 인스턴스에는 고유한 설정이 있습니다.

여기에서는 이전 단계에서 생성한 가상 인스턴스에 대한 사용자 인증 설정을 구성합니다. `lunch.delectablebonsai.com`의 경우 Delectable Bonsai는 손님이 사용자 계정을 생성하는 것을 방지하려고 합니다. 대신 각 구매자에 대해 계정 관리자가 계정을 생성합니다.

## 사용자 인증 구성

1. 이전 단계에서 생성한 `lunch.delectablebonsai.com` 인스턴스로 이동합니다.

1. _글로벌 메뉴로 이동_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _제어판_ &rarr; _인스턴스 설정_. _플랫폼_에서 _사용자 인증_선택하세요.

1. _낯선 사람이 계정을 만들 수 있도록 허용_이라고 표시된 상자를 선택 취소합니다.

   ![낯선 사람이 계정을 만들 수 있도록 허용이 선택 취소되어 있습니다.](./configuring-instance-settings/images/01.png)

   이제 게스트는 새로운 사용자 계정을 생성할 수 없습니다.

다음 단계는 [서버 관리 및 이메일](./server-administration-and-email.md)입니다.

## 관련 개념

- [인스턴스 설정](https://learn.liferay.com/en/w/dxp/system-administration/configuring-liferay/virtual-instances/instance-configuration)
