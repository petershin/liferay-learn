# 관리자 계정 소개

관리 사용자 계정은 Liferay DXP의 새 설치에서 기본적으로 생성되며 Liferay DXP 인스턴스의 모든 측면을 수정할 수 있는 전체 권한이 있습니다. 관리 사용자는 사이트, 사용자, 페이지를 생성, 수정 및 삭제할 수 있으며 모든 사이트 관리 작업을 수행할 수 있습니다.

## 관리자로 Liferay DXP에 액세스

1. `http://localhost:8080`로 브라우저를 엽니다.

1. _로그인_ 링크를 클릭합니다.

    ![로그인 링크](./introduction-to-the-admin-account/images/01.png "로그인 링크")

    ```{note}
    Liferay DXP 번들이 사용 중인 경우 [설정 마법사](../installation-and-upgrades/installing-liferay/running-liferay-for-the-first-time.md)가 표시될 수 있습니다. 화면의 지시에 따라 관리 사용자를 구성하십시오.
    ```

1. 로그인하려면 기본 관리자 자격 증명을 입력하십시오.

    * 이메일 주소: `test@liferay.com`
    * 암호: `테스트`

    ```{warning}
    새 Liferay DXP 설치를 시작할 때 기본 로그인 자격 증명을 업데이트하는 것이 **매우** 권장됩니다.
    ```

## 관리 사용자 구성

### 로그인 비밀번호 변경

1. _사용자 아바타_ 을 클릭하고 _계정 설정_ &rarr; _비밀번호_으로 이동합니다.

1. _현재 비밀번호_ 을 입력하고 새 비밀번호를 제공하십시오.

    ![비밀번호 설정](./introduction-to-the-admin-account/images/02.png "비밀번호 설정")

### 계정 정보 변경

1. 클릭 _사용자 아바타_ &rarr; _계정 설정_.

    ![계정 설정](./introduction-to-the-admin-account/images/03.png "계정 설정")

1. _정보_ 탭에서 필요에 따라 사용자 정보를 변경하거나 추가합니다.

    ![계정 정보](./introduction-to-the-admin-account/images/04.png "계정 정보")

## 로그아웃

계정에서 로그아웃하려면:

1. _사용자 아바타_ &rarr; _로그아웃_을 클릭합니다.

    ![로그아웃](./introduction-to-the-admin-account/images/05.png "로그아웃")

## 새 관리 사용자 만들기

이제 로그인 방법을 알았으므로 일상적인 사용을 위해 새 관리 사용자를 만드는 것이 좋습니다.

새 관리자 계정을 만들려면 다음 단계를 따르세요.

1. 새 사용자를 만듭니다. 방법을 알아보려면 [사용자 추가](../users-and-permissions/users/adding-and-managing-users.md) 을 참조하십시오.

1. 왼쪽 탐색 창(일반 아래의 사용자 편집 페이지)에서 *역할* 링크를 클릭합니다.

    ![역할 링크를 클릭하여 사용자의 역할을 편집합니다.](./introduction-to-the-admin-account/images/06.png)

1. *일반 역할*옆에 있는 *선택* 을 클릭합니다.

1. 목록에서 *관리자* 역할을 선택합니다( *선택*클릭). 대화 상자가 사라지고 역할이 계정과 연결된 역할 목록에 추가됩니다.

사용자는 이제 포털 관리자입니다. 로그아웃한 다음 새 사용자 계정으로 다시 로그인하십시오.

## 무엇 향후 계획

[DXP 글로벌 메뉴](./navigating-dxp.md)에 익숙해지면서 시작하기 연습을 계속하십시오.

[사용자가 DXP에 로그인하는 방법 구성](../installation-and-upgrades/securing-liferay/authentication-basics.md)에 대해 자세히 알아보십시오.