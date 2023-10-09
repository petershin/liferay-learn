# 로그인 구성

Liferay의 로그인 위젯은 구성 가능하며 옵션 설정 방법에 따라 조정됩니다. 이전 단계에서는 두 개의 [가상 인스턴스](../../configuration/configuring-virtual-instances.md)을 구성했습니다. 그 중 하나는 공개된 외부 웹사이트를 위한 것입니다. 다른 하나는 직원이나 파트너를 위한 내부 인트라넷용입니다.

게스트 사용자는 외부 사이트에 접속하여 계정을 등록하여 제품을 구매하고, 포럼에 참여하고, 조리법을 제출하고, Delectable Bonsai와 상호 작용할 수 있어야 합니다. 다만, 내부 홈페이지에는 관리자가 등록한 사용자 외에는 누구도 접근할 수 없도록 하여야 합니다. 이러한 이유로 두 사이트에 대해 인증을 다르게 조정해야 합니다.

## 공개 웹사이트에서 인증 구성

1. <http://localhost:8080>의 기본(공용) 웹사이트로 이동합니다.

1. 관리자 [Kyle Klein](../../users-accounts-organizations/managing-users.md)로 로그인합니다.

1. _글로벌 메뉴로 이동_ &rarr; _인스턴스 설정_ &rarr; _플랫폼_ &rarr; _사용자 인증_.

1. _낯선 사람이 회사 이메일 주소로 계정을 만들 수 있도록 허용_제외한 모든 상자가 선택되어 있는지 확인하십시오. Delectable Bonsai는 마케팅 부서의 구성원만 공개 웹사이트에 계정을 가지기를 원하며 해당 계정은 관리자가 생성합니다.

   ![모든 상자를 선택하는 것은 외부 사이트에 적합합니다.](./configuring-sign-in/images/01.png)

1. _저장_클릭하세요.

이는 공개 웹사이트이기 때문에 자신을 등록하는 부도덕한 사용자가 _root_ 또는 _admin_과 같은 화면 이름을 스스로 부여하기로 결정할 수 있습니다. 당신은 그것을 방지할 수 있습니다.

1. 왼쪽에서 _Reserved Credentials_ 클릭합니다.

1. 화면 이름 필드에 사용자에게 표시하지 않으려는 화면 이름을 한 줄에 하나씩 입력합니다.
   - 관리
   - 뿌리
   - 대통령

1. _저장_클릭하세요.

이전 단계에서 사용자에게 이메일 확인을 요구했으므로 잠재 사용자가 액세스할 수 없는 이메일 주소를 예약할 필요가 없습니다.

훌륭한! 이제 공개 웹사이트에 대한 인증이 구성되었습니다. 이제 내부 홈페이지로 이동하실 수 있습니다.

## 내부 웹사이트에서 인증 구성

Delectable Bonsai의 내부 인트라넷은 Breakfast라고 하며 도메인 이름은 `아침식사.delectablebonsai.com`. [단계 이전에 인스턴스를 생성하고 Kyle Klein을 해당 인스턴스의 관리자](../../configuration/configuring-virtual-instances.md)지정했습니다. 해당 지침을 따르지 않았다면 지금 지침을 따르고 여기로 돌아오십시오.

이제 내부 인트라넷에서 인증을 구성할 수 있습니다.

1. 브라우저에서 <http://breakfast.delectablebonsai.com:8080> 로 이동하여 Kyle Klein으로 로그인하세요.

1. _글로벌 메뉴로 이동_ &rarr; _인스턴스 설정_ &rarr; _플랫폼_ &rarr; _사용자 인증_.

1. 이번에는 사용자 인증 방법을 변경합니다. _화면 이름 기준_.

1. _낯선 사람이 계정을 만들 수 있도록 허용_선택 취소하십시오.

1. _저장_클릭하세요.

![내부 웹사이트에 대한 옵션을 설정합니다.](./configuring-sign-in/images/02.png)

내부 사용자는 이메일 주소가 아닌 관리자가 부여한 화면 이름을 사용하여 인증합니다.

엄청난! 이제 내부 웹사이트에 대한 인증을 구성했습니다.

다음: [인증 검증자](./authentication-verifiers.md)

## 관련 개념

[인증 기본 사항](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/authentication-basics)

[사용자 인증](https://learn.liferay.com/web/guest/w/dxp/system-administration/configuring-liferay/virtual-instances/user-authentication)
