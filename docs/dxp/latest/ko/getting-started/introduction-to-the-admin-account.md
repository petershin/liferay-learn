# 관리자 계정 소개

관리 사용자 계정은 Liferay DXP를 새로 설치할 때 기본적으로 생성되며 Liferay DXP 인스턴스의 모든 측면을 수정할 수 있는 전체 권한을 갖습니다. 관리 사용자는 사이트, 사용자, 페이지를 생성, 수정, 삭제하고 모든 사이트 관리 작업을 수행할 수 있습니다.

## 관리자로 Liferay DXP에 액세스

1. 브라우저를 열고 `http://localhost:8080`으로 이동하세요.

1. _로그인_ 링크를 클릭하세요.

   ![Sign In Link](./introduction-to-the-admin-account/images/01.png "Sign In Link")

    ```{note}
    Liferay DXP 번들이 사용되는 경우 [설치 마법사](../installation-and-upgrades/installing-liferay/running-liferay-for-the-first-time.md) 이 표시될 수 있습니다. 화면의 지시에 따라 관리 사용자를 구성하십시오.
    ```

1. 로그인하려면 기본 관리자 자격 증명을 입력하세요.

   * 이메일 주소: `test@liferay.com`
   * 비밀번호: `테스트`

   설정 마법사를 사용하여 다른 관리자 이메일을 설정한 경우 해당 이메일 주소를 대신 입력하세요. 기본 비밀번호는 여전히 'test'입니다.

1. 처음 로그인하면 비밀번호를 변경해야 합니다. 새 비밀번호(예: _learn_)를 입력하고 _Save_를 클릭하세요.

```{warning}
프로덕션 환경에서는 기본 관리자 계정을 사용하면 안 됩니다. 대신 귀하의 비즈니스와 관련된 관리자 계정을 만드십시오. 아래 단계를 참조하세요.
```

## 관리 사용자 구성

### 로그인 비밀번호 변경

1. _사용자 아바타_를 클릭하고 _계정 설정_ &rarr; _비밀번호_로 이동하세요.

1. _현재 비밀번호_를 입력하고 새 비밀번호를 입력하세요.

   ![Setting a Password](./introduction-to-the-admin-account/images/02.png "Setting a Password")

### 계정 정보 변경

1. _사용자 아바타_ &rarr; _계정 설정_을 클릭하세요.

   ![Account Settings](./introduction-to-the-admin-account/images/03.png "Account Settings")

1. _정보_ 탭에서 필요에 따라 사용자 정보를 변경하거나 추가하세요.

   ![Account Information](./introduction-to-the-admin-account/images/04.png "Account Information")

## 로그아웃

계정에서 로그아웃하려면:

1. _사용자 아바타_ &rarr; _로그아웃_을 클릭하세요.

   ![Signing Out](./introduction-to-the-admin-account/images/05.png "Signing Out")

## 새 관리 사용자 생성

이제 로그인 방법을 알았으니 일상적인 사용을 위해 새 관리자 계정을 생성하는 것이 좋습니다.

새 관리자 계정을 만들려면 다음 단계를 따르세요.

1. 이메일 서비스로 Liferay를 설정하려면 [메일 구성](../installation-and-upgrades/setting-up-liferay/configuring-mail.md) 참조하세요. Liferay는 계정 생성 시 새 사용자의 이메일 주소로 이메일을 보냅니다.

   이 단계를 건너뛰려면(예를 들어 Liferay를 테스트하는 경우) 낯선 사람이 이메일 주소를 확인하도록 요구하는 기능을 비활성화하세요. _제어판_ &rarr; _인스턴스 설정_ &rarr; _사용자 인증_으로 이동합니다. _낯선 사람이 이메일 주소를 확인하도록 요구하시겠습니까?_ 확인란을 선택 취소합니다. 참고로 프로덕션 환경에서는 비활성화하지 않는 것이 좋습니다.

   ![Uncheck require strangers to verify their email address.](./introduction-to-the-admin-account/images/07.png)

1. 새 사용자를 만듭니다. 방법을 알아보려면 [사용자 추가](../users-and-permissions/users/adding-and-managing-users.md) 참조하세요.

1. 왼쪽 탐색 창(일반 아래 사용자 편집 페이지)에서 _역할_ 링크를 클릭합니다.

   ![Click the Roles link to edit the User's Roles.](./introduction-to-the-admin-account/images/06.png)

1. _일반 역할_ 옆에 있는 _선택_을 클릭하세요.

1. 목록에서 _관리자_ 역할을 선택합니다(_선택_ 클릭). 대화 상자가 사라지고 해당 역할이 계정과 연결된 역할 목록에 추가됩니다. 아래로 스크롤하여 _저장_을 클릭하세요.

1. (선택 사항) 위 단계에서 메일 [메일 구성](../installation-and-upgrades/setting-up-liferay/configuring-mail.md) 구성하지 않은 경우 이 새 사용자에 대한 초기 비밀번호를 설정하십시오. 왼쪽 탐색 창에서 _Password_ 링크를 클릭하세요. 사용자의 비밀번호를 입력하고 비밀번호를 다시 입력한 후 _저장_을 클릭하세요.

이제 사용자는 포털 관리자입니다. 로그아웃한 다음 새 사용자 계정으로 다시 로그인하세요.

## 다음

[DXP 글로벌 메뉴](./navigating-dxp.md) 에 익숙해지면서 시작하기 연습을 계속하세요.

사용자가 DXP [로그인하는 방법을 구성하는 방법에 대해 자세히 알아보세요](../installation-and-upgrades/securing-liferay/authentication-basics.md).
