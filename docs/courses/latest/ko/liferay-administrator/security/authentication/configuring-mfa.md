# 다단계 인증 구성

다단계 인증을 사용하려면 사용자가 무엇인가를 알고 있어야 합니다. 일반적으로 이는 비밀번호와 휴대폰, 이메일 주소 등의 장치 또는 서비스입니다. 로그인하려면 사용자는 비밀번호와 이 장치로 전송된 코드를 제공해야 합니다.

Liferay는 이메일을 통한 일회성 코드와 SMS 또는 인증 앱을 지원하는 타사 서비스를 모두 지원합니다. 자세한 내용은 다단계 인증 사용 [다단계 인증 사용](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication/using-multi-factor-authentication) 참조하세요.

맛있는 분재는 농산물 시장 시절부터 먼 길을 걸어왔습니다. 이제 많은 직원과 고객이 있는 IT 부서에서는 강화된 보안 노력의 일환으로 MFA를 요구하고 있습니다.

## MFA 설정

1. [Liferay에서 메일 구성](../../configuration/server-administration-and-email.md#configuring-mail-in-lxc-sm-or-self-hosted)의 단계에 따라 시뮬레이션합니다. SMTP 메일 서버.
   
1. 관리자로 Liferay에 로그인합니다(예: [Kyle Klein](../../users-accounts-organizations/managing-users.md#creating-users)).

1. 다음으로 _전역 메뉴_ (![Global Menu](../../../images/icon-applications-menu.png)) &rarr; _제어판_ &rarr; _인스턴스 설정_로 이동합니다. 보안 섹션에서 _Multi-Factor Authentication_ 클릭하세요.

1. _활성화_ 상자를 선택하고 _저장_을 클릭하세요. [다단계 인증 활성화](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication/using-multi-factor-authentication#enabling-multi)를 참조하세요. -factor-authentication) 구성 옵션에 대해 자세히 알아보세요.

시스템에서 자신이 잠기는 것을 방지하기 위해 진행하기 전에 FakeSMTP를 통해 이메일을 성공적으로 수신할 수 있는지 확인하십시오.

## MFA 테스트

1. 오른쪽 상단의 사용자 프로필 이미지를 클릭한 후 _로그아웃_클릭하세요.

1. 관리자로 Liferay에 다시 로그인합니다(예: 카일 클라인). 

1. 다음 페이지에서 _Send_ for Liferay를 클릭하여 일회용 비밀번호를 kyle@delectablebonsai.com으로 보내세요. 

1. 전송된 이메일에서 일회용 비밀번호를 받으세요.
   
   ![이메일에서 일회용 비밀번호를 받으세요.](./configuring-mfa/images/01.png)

1. 일회용 비밀번호를 복사하여 로그인 페이지에 붙여넣으세요. _제출_클릭하세요. Liferay에 성공적으로 로그인했습니다.

```{note}
Multi-Factor Authentication이 활성화되면 나머지 과정에 대한 로그인이 어려울 수 있습니다. 이 연습을 마치면 돌아가서 _활성화_ 상자를 선택 취소하고 _저장_을 클릭하여 다단계 인증을 비활성화하세요. 
```

엄청난! 이제 인증 모듈을 완료했습니다. 

다음: [웹 서비스 보안](../securing-web-services.md)

## 관련 개념

- [다단계 인증 사용](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication/using-multi-factor-authentication)
- [다단계 인증 검사기](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication/multi-factor-authentication-checkers)
