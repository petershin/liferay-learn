# 7단계: VPN 연결

개발 환경에 필요한 경우 마이그레이션의 마지막 단계는 클라우드 환경을 사설 네트워크에 연결하는 것입니다. 여기에는 VPN 서버를 구성(또는 업데이트)한 다음 Liferay Cloud 콘솔에서 연결을 설정하는 작업이 포함됩니다.

다음과 같은 경우 Liferay Cloud 환경을 VPN에 연결해야 할 수 있습니다.

* 자신의 프로젝트 요구 사항에는 VPN 사용이 포함됩니다.
* 환경을 [LDAP 디렉토리에 연결](https://learn.liferay.com/w/dxp/users-and-permissions/connecting-to-a-user-directory/connecting-to-an-ldap-directory?highlight=ldap) 에 연결하려고 합니다.
* 다른 디렉터리 서버의 환경에 연결하려고 합니다.
* 다른 웹 서비스와 상호 작용하는 원격 애플리케이션을 사용해야 합니다.

VPN 서버를 구성할 필요가 없는 경우 [다음 단계](#next-steps) 로 건너뛸 수 있습니다.

## VPN 서버 구성

Liferay Cloud와 내부 네트워크 간에 보안 연결을 설정할 수 있도록 VPN 서버를 구성해야 합니다.

`EAP-TLS` 또는 `EAP-MSCHAPV2` 인증 프로토콜을 사용하도록 VPN 연결을 구성할 수 있습니다. VPN 서버 구성에 대한 도움말은 [VPN 서버 구성](../configuring-the-cloud-network/configuring-a-vpn-server.md) 을 참조하십시오.

## VPN 연결 생성 및 구성

그런 다음 Liferay Cloud 콘솔을 사용하여 구성한 서버에 대한 VPN 연결을 만듭니다.

1. Liferay Cloud 콘솔에서 프로젝트 요구 사항에 따라 VPN을 연결하려는 환경(예: `prd`)으로 이동합니다.

1. 화면 왼쪽의 **설정** 을 클릭하세요.

    ![설정 메뉴로 이동하여 VPN 구성 설정에 액세스합니다.](./connecting-the-vpn/images/01.png)

1. VPN 섹션까지 아래로 스크롤하고 **Create New VPN** 을 클릭합니다.

    ![새 VPN 만들기를 클릭하여 VPN 연결 설정 구성을 시작합니다.](./connecting-the-vpn/images/02.png)

1. VPN 서버의 구성과 일치하도록 모든 VPN 설정을 구성합니다.

    * **이름**(VPN을 식별하는 데 사용됨)
    * **묘사**
    * **프로토콜**(IPSec 또는 OpenVPN)

1. Liferay Cloud 환경의 포트를 사설 네트워크의 포트에 매핑합니다.

    ![이러한 필드를 사용하여 클라우드 환경의 포트를 VPN의 포트에 매핑합니다.](./connecting-the-vpn/images/03.png)

    포트 매핑은 Liferay Cloud 환경의 요청을 사설 네트워크의 특정 서비스로 리디렉션하는 데 유용합니다.

1. **VPN 생성 및 연결** 을 클릭합니다.

버튼을 클릭하면 VPN 연결이 설정됩니다. VPN 서버가 성공적으로 연결되려면 다소 시간이 걸릴 수 있습니다.

## VPN 서버 응답 확인

VPN이 Liferay Cloud 환경에 성공적으로 연결되었는지 확인하려면 `curl` 명령을 실행하여 연결을 테스트하십시오.

1. Liferay Cloud 환경(VPN에 연결한 동일한 환경)에서 `liferay` 서비스로 이동합니다.

1. 셸 탭을 클릭하여 `liferay` 서비스의 셸에 액세스합니다.

    ![liferay 서비스의 셸을 사용하여 VPN 연결을 확인하십시오.](./connecting-the-vpn/images/04.png)

1. 이 명령을 실행합니다(그리고 `####` 을 사설 네트워크에 매핑한 포트 번호로 바꿉니다).

    ```bash
    curl vpn:####
    ```

명령을 실행할 때 VPN 서버에서 응답을 받으면 VPN 서버가 올바르게 구성되고 연결된 것입니다.

## 다음 단계

이제 VPN 연결을 설정했으며 Liferay Cloud로의 마이그레이션이 완료되었습니다! [마이그레이션 후 다음 단계](./next-steps-after-migration.md)를 완료하여 환경이 준비되었는지 확인합니다.