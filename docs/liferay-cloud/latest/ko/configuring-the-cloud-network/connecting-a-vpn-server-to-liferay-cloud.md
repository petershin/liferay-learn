# VPN 서버를 Liferay Cloud에 연결

Liferay Cloud의 VPN 기능을 사용하여 Liferay Cloud 서비스를 사설 네트워크의 외부 서비스에 연결할 수 있습니다. 이를 통해 동일한 네트워크 내에 존재하는 것처럼 클라우드 환경에서 외부 시스템을 운영할 수 있습니다.

예를 들어 Liferay Cloud 서비스를 회사 VPN에서만 액세스할 수 있는 디렉토리 또는 애플리케이션에 연결해야 할 수 있습니다. 여기에서 이를 수행하는 방법을 배우게 됩니다.

## VPN 구성 생성

1. 환경의 **설정** 탭으로 이동합니다.

1. 페이지의 VPN 섹션까지 아래로 스크롤하고 **Create New VPN** 을 클릭합니다.

    ![환경의 설정 페이지에서 새 VPN 만들기를 클릭합니다.](./connecting-a-vpn-server-to-liferay-cloud/images/01.png)

1. 사용할 연결 프로토콜을 선택합니다. 지원되는 프로토콜은 다음과 같습니다.

    * [OpenVPN](https://openvpn.net)

    * [IPSec](https://www.cloudflare.com/learning/network-layer/what-is-ipsec/)

    ![VPN에 연결하는 데 사용할 프로토콜을 선택합니다.](./connecting-a-vpn-server-to-liferay-cloud/images/02.png)

    프로토콜을 선택하면 아래에 연결하는 데 필요한 필드가 표시됩니다.

1. VPN의 필수 필드를 입력합니다.

    * **서버** : 서버의 IP 주소.

    * **포트** : VPN의 로컬 포트 번호.

    * **계정 이름** : 관리자의 이메일 주소.

    * **비밀번호** : 관리자의 비밀번호입니다.

    * **IKE 버전** : VPN의 인터넷 키 교환 버전입니다. 이 필드는 **IPSec** 이 프로토콜로 선택된 경우에만 나타납니다. **IKEv2** 만 지원됩니다.

    * **인증서** : 인증서 코드.

1. VPN 연결을 위한 하나 이상의 포트 포워딩 경로를 입력하십시오. 각 경로에 대한 필수 입력란을 작성합니다.

    * **Forwarded Port** : Liferay Cloud 환경 내에서 포워딩할 포트 번호입니다.

    * **Destination IP** : VPN과 접하는 고객 네트워크의 IP 주소.

    * **대상 포트** : VPN과 인터페이스하는 고객 네트워크의 포트.

    ![VPN 연결을 생성하기 전에 하나 이상의 포트 전달 경로를 추가하십시오.](./connecting-a-vpn-server-to-liferay-cloud/images/03.png)

    ```{tip}
    오른쪽에 있는 + 아이콘을 클릭하여 더 많은 포트 포워딩 경로를 추가합니다. 기존 경로 옆에 있는 휴지통 아이콘을 클릭하여 추가된 경로를 제거합니다.
    ```

1. **VPN 만들기** 을 클릭합니다.

VPN 구성이 생성되었습니다. 그러나 VPN은 VPN 세부 정보 페이지에서 수동으로 연결할 때까지 연결되지 않습니다.

## VPN 구성 관리

VPN 구성을 만든 후에는 연결 상태 및 구성 세부 정보를 보고, 구성을 편집하고, 세부 정보 페이지에서 연결하거나 연결을 끊을 수 있습니다.

![VPN 세부 정보 페이지에는 VPN 상태, 구성 세부 정보 및 VPN 네트워크 활동이 표시됩니다.](./connecting-a-vpn-server-to-liferay-cloud/images/04.png)

환경의 **설정** 페이지로 이동한 다음 구성된 VPN 연결을 클릭하여 세부 정보 페이지로 이동합니다.

![VPN 세부 정보 페이지를 보려면 구성된 VPN 연결을 클릭하십시오.](./connecting-a-vpn-server-to-liferay-cloud/images/05.png)

```{note}
VPN의 상태(연결됨 또는 연결되지 않음)는 VPN 세부 정보 페이지와 환경의 '설정' 페이지에 있는 VPN 섹션에서 모두 볼 수 있습니다.
```

### VPN 연결 및 연결 해제

VPN 세부 정보 페이지의 오른쪽 상단에는 VPN이 이미 연결되어 있는지 여부가 표시됩니다. VPN이 연결되지 않은 경우 **연결** 버튼을 클릭하여 연결을 설정합니다.

![세부 정보 페이지의 오른쪽 상단 모서리에는 연결 상태가 표시되고 연결 또는 연결 해제 옵션이 제공됩니다.](./connecting-a-vpn-server-to-liferay-cloud/images/06.png)

VPN은 버튼을 클릭한 후 연결을 시도합니다. 연결이 실패하면 실패한 시도가 세부 정보 페이지의 **관련 활동** 섹션에 표시됩니다.

```{tip}
다음과 같은 명령을 실행하기 위해 서비스의 [shell](../../support-and-troubleshooting/troubleshooting/shell-access.md)을 사용하여 VPN을 통해 IP 주소에 대한 서비스 연결을 수동으로 테스트할 수 있습니다: `curl -v [address]` .
```

연결이 설정되는 동안 "VPN 연결 시도가 시작되었습니다."라는 메시지가 나타나고 완료될 때까지 VPN에 대한 다른 관리 작업을 수행할 수 없습니다. 연결을 취소해야 하는 경우(예: 오류로 인해 연결이 중단됨) 팝업에서 "취소"를 클릭하십시오.

![연결이 설정되기 전에 연결을 중지해야 하는 경우 메시지 팝업에서 취소 버튼을 클릭합니다.](./connecting-a-vpn-server-to-liferay-cloud/images/07.png)

연결이 설정된 후 언제든지 VPN 연결을 끊으려면 오른쪽 상단 작업 메뉴에서 **연결 끊기** 을 클릭합니다. 그러면 **VPN 연결 끊기** 페이지로 이동합니다.

```{warning}
VPN 연결을 끊으면 Liferay Cloud와의 모든 외부 서비스와의 통신이 중단됩니다.
```

![VPN 연결 해제 페이지에서는 계속 진행하기 전에 연결 해제의 영향을 확인하도록 요청합니다.](./connecting-a-vpn-server-to-liferay-cloud/images/08.png)

VPN 연결 해제의 영향을 확인하는 상자를 선택한 다음 **VPN** 연결 해제를 클릭하여 즉시 연결을 해제합니다. VPN 연결이 끊어지면 구성을 다시 변경할 수 있습니다.

### 구성 편집

**현재 VPN이 연결되어 있지 않은 경우** 생성된 VPN 구성의 모든 세부 정보(포워딩 포트 포함)를 변경할 수 있습니다. VPN이 연결되어 있으면 구성을 편집하기 전에 [연결 해제](#connecting-and-disconnecting-the-vpn) 하십시오.

구성을 편집하려면 환경의 세부 정보 페이지로 이동한 다음 오른쪽 상단 작업 메뉴에서 **편집...** 로 이동합니다. VPN 구성을 처음 생성할 때와 동일한 화면이 표시됩니다.

![VPN이 연결되지 않은 경우 동작 메뉴에서 편집 버튼을 클릭하여 구성을 변경합니다.](./connecting-a-vpn-server-to-liferay-cloud/images/09.png)

### 구성 삭제

**VPN 삭제** 옵션을 사용하여 VPN 구성을 완전히 제거할 수 있습니다.

1. 환경의 설정 페이지에서 VPN에 대한 작업 메뉴를 클릭하고 VPN 삭제를 클릭합니다.

1. VPN 삭제 페이지에서 확인란을 선택하여 삭제를 확인합니다. 해당 시점에 VPN이 연결된 경우 효과를 확인하기 위해 더 많은 확인란이 나타납니다.
   
   ![VPN 삭제 페이지.](./connecting-a-vpn-server-to-liferay-cloud/images/10.png)

1. 페이지 하단에서 VPN 삭제를 클릭합니다.

VPN이 삭제되어 더 이상 사용자 환경에서 사용할 수 없습니다. 대신 환경에 연결하려면 새 VPN 구성을 추가하세요.

## 관련 주제

* [VPN 통합 개요](./vpn-integration-overview.md)
* [VPN 서버 구성](./configuring-a-vpn-server.md)
* [셸 액세스](../../support-and-troubleshooting/troubleshooting/shell-access.md)