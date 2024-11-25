# 다단계 인증 구성

다단계 인증을 사용하려면 사용자가 무엇인가를 알고 있어야 합니다. 일반적으로 이는 비밀번호와 휴대폰, 이메일 주소 등의 장치 또는 서비스입니다. 로그인하려면 사용자는 비밀번호와 이 장치로 전송된 코드를 제공해야 합니다.

Liferay는 이메일을 통한 일회성 코드와 SMS 또는 인증 앱을 지원하는 타사 서비스를 모두 지원합니다. 자세한 내용은 [다단계 인증 사용](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication/using-multi-factor-authentication) 을 참조하세요. 더.

Clarity Vision Solutions는 차고에서 프레임을 판매하던 시절부터 먼 길을 걸어왔습니다. 이제 많은 직원과 고객이 있는 IT 부서에서는 강화된 보안 노력의 일환으로 MFA를 요구하고 있습니다.

## MFA 설정

1. [Liferay에서 메일 구성](../../configuration/server-administration-and-email.md#configuring-mail-in-lxc-sm-or-self-hosted) 단계에 따라 SMTP 메일을 시뮬레이션합니다. 섬기는 사람.

1. Liferay에 관리자로 로그인합니다(예: [Kyle Klein](../../users-accounts-organizations/managing-users.md#creating-users) ).

1. 그런 다음 **글로벌 메뉴**(![글로벌 메뉴](../../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **인스턴스 설정** 으로 이동합니다. 보안 섹션에서 **Multi-Factor Authentication** 을 클릭하세요.

1. **활성화** 상자를 선택하고 **저장** 을 클릭하세요. [다단계 인증 사용](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication/using-multi-factor-authentication#enabling-multi) 를 참조하세요. -factor-authentication) 구성 옵션에 대해 자세히 알아보세요.

시스템에서 자신이 잠기는 것을 방지하기 위해 진행하기 전에 FakeSMTP를 통해 이메일을 성공적으로 수신할 수 있는지 확인하십시오.

## MFA 테스트

1. 오른쪽 상단의 사용자 프로필 이미지를 클릭한 후 **로그아웃** 을 클릭하세요.

1. Liferay에 관리자로 다시 로그인합니다(예: 카일 클라인).

1. 다음 페이지에서 Liferay의 **보내기** 를 클릭하여 일회용 비밀번호를 kyle@clarityvisionsolutions.com으로 보내세요.

1. 전송된 이메일에서 일회용 비밀번호를 받으세요.

   ![Get the one-time password from the email.](./configuring-mfa/images/01.png)

1. 일회용 비밀번호를 복사하여 로그인 페이지에 붙여넣으세요. **제출** 을 클릭하세요. Liferay에 성공적으로 로그인했습니다.

```{note}
Multi-Factor Authentication이 활성화되면 나머지 과정에 로그인하는 것이 어렵습니다. 이 연습을 마치면 돌아가서 _활성화_ 상자를 선택 취소하고 _저장_을 클릭하여 다단계 인증을 비활성화하세요.
```

엄청난! 이제 인증 모듈을 완료했습니다.

다음: [웹 서비스 보안](../securing-web-services.md)

## 관련 개념

* [다단계 인증 사용](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication/using-multi-factor-authentication)
* [다단계 인증 검사기](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication/multi-factor-authentication-checkers)
