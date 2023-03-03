# Liferay DXP를 Analytics Cloud에 연결

설정 프로세스를 시작하려면 몇 가지 요구 사항이 있습니다.

1. [liferay.com](https://www.liferay.com) 계정이 필요합니다. Liferay 계정이 없는 경우 [계정 생성](https://login.liferay.com/signin/register) 을 할 수 있습니다.

1. [analytics.liferay.com](https://analytics.liferay.com/) 을 처음 방문하는 경우 계정에 대한 다단계 인증을 설정해야 합니다. 도움이 필요하면 [다단계 인증](../workspace-settings/multi-factor-authentication.md) 을 참조하십시오.

1. Liferay DXP 설치는 다음 최소 버전 중 하나를 충족해야 합니다.

    * 7.4(모든 버전)
    * 7.3 수정팩 1
    * 7.2 수정팩 11
    * 7.1 수정팩 22
    * 7.0 수정팩 98

1. 하나 이상의 Analytics Cloud 작업 영역에 대한 액세스 권한이 있어야 합니다. 유료 Analytics Cloud 사용자는 로그인 시 작업 공간을 볼 수 있습니다. 그렇지 않은 경우 [help.liferay.com](https://help.liferay.com/) 을 통해 지원팀에 문의하거나 <analytics-cloud@liferay.com>으로 이메일을 보내주십시오.

## 연결 토큰

다음으로 Analytics Cloud 토큰을 가져와 Liferay 인스턴스에 연결하는 데 사용합니다. Liferay Analytics Cloud와 Liferay DXP는 안전하고 암호화된 토큰을 통해 연결됩니다. Analytics Cloud에서 생성되며 Liferay DXP 구성에 복사하여 붙여넣어야 합니다.

1. Analytics Cloud에 로그인합니다. 작업 공간을 선택하십시오. 처음 로그인하는 경우 온보딩 가이드가 표시됩니다. **다음** 을 클릭하면 다음 화면에 Analytics Cloud 토큰이 표시됩니다. 복사 아이콘(![copy icon](../images/icon-copy.png))을 클릭하여 토큰을 클립보드에 복사합니다.

   ![처음 로그인하면 온보딩 가이드가 표시됩니다.](./connecting-liferay-dxp-to-analytics-cloud/images/01.png)

   온보딩 가이드를 취소한 경우 **설정** &rarr; **데이터 소스** 로 이동합니다. **데이터 소스 추가** 을 클릭합니다. **Liferay DXP** 을 선택하면 Analytics Cloud 토큰이 나타납니다. 복사 아이콘(![copy icon](../images/icon-copy.png))을 클릭하여 토큰을 클립보드에 복사합니다.

1. Liferay DXP 인스턴스에 로그인합니다. 전역 메뉴(![Global Menu](../images/icon-applications-menu.png))를 엽니다. **구성** &rarr; **인스턴스 설정** 로 이동합니다. **Platform** 아래에서 **Analytics Cloud** 을 클릭합니다. 필드에 Analytics Cloud 토큰을 붙여넣고 **연결** 을 클릭합니다.

    ![토큰을 복사하고 연결 버튼을 클릭합니다.](./connecting-liferay-dxp-to-analytics-cloud/images/02.png)

    ```{note}
    Liferay DXP 7.0에서 Analytics Cloud Admin은 *구성* &rarr; *Analytics Cloud* 아래에 있습니다.
    ```

1. 성공적으로 연결되면 화면 왼쪽 하단에 다음 메시지가 나타납니다.

   `Success: Your request completed successfully`

축하합니다. 이제 Liferay 인스턴스가 Analytics Cloud에 연결되었습니다!

다음 단계는 Liferay 사이트와 연락처를 동기화하는 것입니다. [사이트 및 연락처 동기화](./syncing-sites-and-contacts.md) 을 참조하고 단계를 따르십시오.
