# VPN 통합 개요

Liferay Cloud는 포트 전달 및 중복 터널을 지원하는 VPN 클라이언트-사이트 연결을 제공합니다. 이 기능은 일반적으로 Liferay Cloud에 있는 가입자의 프로덕션 환경을 내부 네트워크에 연결하는 데 사용됩니다. 보안 및 안정성을 위해 이러한 VPN 연결은 각 환경(프로덕션, 스테이징 또는 개발)에 대해 분리됩니다.

![토폴로지 1 - Liferay Cloud VPN 클라이언트-사이트 토폴로지](./vpn-integration-overview/images/01.png)

가입자는 Liferay Cloud 서비스 간의 연결을 해당 VPN 서버의 IP 주소에 매핑하여 중복 VPN 터널을 사용할 수 있습니다. 중복성은 복원력을 제공하기 위해 서로 다른 가용 영역에 배치됩니다. 클라이언트 대 사이트 접근 방식은 회사 네트워크에서 실행되는 서비스에 대한 연결을 다룹니다. 이 모델은 제공되는 컨테이너화된 아키텍처 및 Kubernetes 네트워크 계층에 권장됩니다.

VPN 연결이 구성되면 드롭다운 목록에서 **VPN 로그** 을 선택하여 환경의 로그 페이지에서 VPN 서버의 로그 메시지를 볼 수 있습니다.

![사용자 환경의 최근 VPN 활동을 보려면 VPN 로그를 선택하십시오.](./vpn-integration-overview/images/02.png)

자세한 내용은 [VPN 서버 제한 사항](../../reference/platform-limitations.md#vpn-servers) 섹션을 참조하십시오.

## 설정

클라이언트-사이트 VPN 기능은 다음 프로토콜을 지원합니다.

* IPsec(IKEv2)
* OpenVPN

가입자는 프로토콜(IPSec 또는 OpenVPN) 중 하나를 선택하여 원하는 환경에 대한 Liferay Cloud 콘솔 설정 페이지에서 연결을 수행할 수 있습니다. 콘솔 UI에서 연결에 대해 원하는 수의 포워딩 포트를 구성할 수 있습니다.

```{note}
IPsec 서버와 함께 `IKEv2` 프로토콜을 사용하면 `MSCHAPv2` 또는 `TLS` 인증 프로토콜을 사용할 수 있습니다. 자세한 내용은 [IPsec 서버의 기본 설정](./configuring-a-vpn-server.md#basic-setup-for-an-ipsec-server) _을 참조하십시오.
```

자세한 내용은 [VPN 서버를 Liferay Cloud](./connecting-a-vpn-server-to-liferay-cloud.md) 에 연결을 참조하십시오.

## Liferay Cloud를 IPSec VPN 서버에 연결

이 사용 사례에서는 Liferay Cloud 내에서 실행 중인 Liferay Portal 인스턴스가 있고 내부 네트워크 내에서 실행 중인 HTTP 서비스에 액세스해야 한다고 가정합니다.

![토폴로지 2 - 고객 회사 네트워크 내부의 HTTP 서비스에 액세스하는 포털 인스턴스](./vpn-integration-overview/images/03.png)

다음 사항에 유의하십시오.

* 고객의 내부 네트워크 내에서 실행되는 `192.168.100.30:8080` 의 Hello World 서비스는 서버 주소 `vpn:33000`을 통해 Liferay Portal 서비스에서 액세스할 수 있습니다.
* 클라이언트-서버 연결은 `18.188.145.101:500`에서 실행되는 고객의 VPN 서버를 통해 이루어집니다.
* 포트 전달 규칙은 `192.168.100.30:8080`에서 실행 중인 애플리케이션에 매핑되는 로컬 포트 **33000** 을 노출합니다.

연결 및 포트 전달 규칙이 구성되면 모든 Liferay Cloud 서비스에서 Hello World 서비스에 대한 요청을 할 수 있습니다.

```bash
curl vpn:33000

<body><h1>Hello world!</h1></body></html>
```

### 공유 클러스터용 Liferay Cloud IP 범위

Liferay Cloud는 VPN 서버에 매핑할 수 있는 광범위한 사용 가능한 IP 주소를 사용합니다. 기본적으로 Liferay Cloud 서비스에 대한 모든 발신 외부 IP 주소는 고정되어 있지 않습니다.

안정적인 발신 외부 IP 주소를 얻는 가장 좋은 방법은 Liferay Cloud Private Cluster 기능을 사용하는 것입니다.

### 개인 클러스터용 Liferay Cloud IP 범위

Liferay Cloud는 각 가입자의 서비스를 자체 전용 클러스터로 격리하는 선택적 개인 클러스터를 제공합니다. 각 클러스터는 가입자 클러스터의 모든 아웃바운드 인터넷 트래픽을 위한 전용 게이트웨이로 구성되며 고정 외부 IP가 할당됩니다.

## 다음

* [클라이언트-사이트 VPN 예제 구성](./configuring-a-vpn-server.md)
