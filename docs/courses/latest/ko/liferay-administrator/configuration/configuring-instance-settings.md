# 인스턴스 설정 구성

Liferay 인스턴스는 동일한 설치를 공유하지만 다른 도메인 이름의 고유한 디지털 경험을 제공하도록 구성됩니다. 각 인스턴스에는 고유한 설정이 있습니다.

여기에서는 이전 단계에서 생성한 가상 인스턴스에 대한 사용자 인증 설정을 구성합니다. `glance.clarityvisionsolutions.com`의 경우 Clarity Vision Solutions는 게스트가 사용자 계정을 생성하는 것을 방지하려고 합니다. 대신 IT 관리자가 각 직원에 대해 계정을 만듭니다.

## 사용자 인증 구성

1. 이전 단계에서 생성한 `glance.clarityvisionsolutions.com` 인스턴스로 이동합니다.

1. **글로벌 메뉴**(![글로벌 메뉴](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **인스턴스 설정** 으로 이동합니다. **플랫폼** 에서 **사용자 인증** 을 선택하세요.

1. **낯선 사람이 계정을 만들 수 있도록 허용** 상자를 선택 취소하세요.

   ![Allow strangers to create account is unchecked.](./configuring-instance-settings/images/01.png)

   이제 게스트는 새로운 사용자 계정을 생성할 수 없습니다.

다음 단계는 [서버 관리 및 이메일](./server-administration-and-email.md)입니다.

## 관련 개념

* [인스턴스 구성](https://learn.liferay.com/en/w/dxp/system-administration/configuring-liferay/virtual-instances/instance-configuration)
