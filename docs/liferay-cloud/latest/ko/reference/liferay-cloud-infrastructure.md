# Liferay 클라우드 인프라

Liferay Cloud는 주요 구성 요소 모음을 결합하여 강력하고 안정적이며 관리 가능한 Liferay DXP 구현을 제공하는 유연한 플랫폼입니다. 이 다이어그램은 이 구현을 완료하기 위해 이러한 모든 구성 요소가 어떻게 함께 맞춰지는지 보여줍니다.

![Liferay Cloud와 통합된 모든 주요 서비스 및 구성 요소가 여기에 연결되어 표시됩니다.](./liferay-cloud-infrastructure/images/01.png)

```{note}
비공개 클러스터 구독에는 내장 [웹 애플리케이션 방화벽](..//tuning-security-settings/web-application-firewall.md)도 포함됩니다. 그러나 [공유 클러스터에서는 사용할 수 없습니다](./platform-limitations.md#security) .
```

다양한 구성 요소에 대한 설명은 다음 목록을 참조하십시오.

## 고급 애플리케이션 모니터링

Liferay Cloud는 [Dynatrace](https://www.dynatrace.com/) 모니터링 사용을 지원합니다. 이 앱은 애플리케이션 성능, 인프라 등을 실시간으로 모니터링합니다. 자세한 내용은 [Advanced Application Metrics](../manage-and-optimize/application-metrics.md#advanced-application-metrics-production-only) 을 참조하십시오.

## 리포지토리 통합

Liferay Cloud는 Git를 사용하여 프로젝트 소스 코드와 통합됩니다. Jenkins와의 기본 제공 통합을 통해 새로운 커밋 또는 풀 요청을 통해 모든 Liferay Cloud 환경에 배포할 수 있는 빌드를 자동으로 트리거할 수 있습니다.

[GitHub](../getting-started/configuring-your-github-repository.md), [Bitbucket](../getting-started/configuring-your-bitbucket-repository.md)및 [GitLab](../getting-started/configuring-your-gitlab-repository.md) 통합이 모두 지원됩니다.

## VPN 서버 및 클라이언트

Liferay Cloud 환경은 고객의 자체 VPN 서버를 사용하여 암호화된 터널을 통해 데이터를 송수신할 수 있습니다. Liferay Cloud는 지원되는 VPN에서 해당 환경으로의 연결을 가능하게 하는 클라이언트-사이트 VPN 서비스를 제공합니다. 이 연결에는 OpenVPN 및 IPSec(IKEv2) 프로토콜이 지원됩니다. 자세한 내용은 [VPN 통합 개요](../infrastructure-and-operations/networking/vpn-integration-overview.md) 을 참조하십시오.

## 도커 허브

Liferay Cloud는 서비스 이미지 및 버전(태그로 공유)에 대한 공용 플랫폼으로 [Docker Hub](https://hub.docker.com/) 을 사용합니다. 또한 이 구현을 통해 고객은 모든 공용 리포지토리 또는 로컬 개발 작업 공간에서 사용자 지정 DOcker 이미지를 사용할 수 있습니다. 서비스 이미지 레지스트리는 Docker Hub의 [Liferay Cloud 프로필](https://hub.docker.com/u/liferaycloud) 을 참조하십시오.

## DDoS 보호

Liferay Cloud는 DDoS(분산 서비스 거부) 공격에 대한 기본 보호 기능을 제공합니다. [GCP POP 네트워크](https://peering.google.com/#/infrastructure) 을 사용하여 들어오는 트래픽이 넘쳐나는 환경을 보호하고 전 세계 최종 사용자에게 안전하고 일관되게 콘텐츠를 제공합니다.

## HTTP(S) 부하 분산기

Liferay Cloud는 HTTP(S) 트래픽을 여러 인스턴스에 분산합니다. [GKE 인그레스](https://cloud.google.com/kubernetes-engine) 을 사용하여 트래픽을 분산하여 서비스가 과부하될 위험을 줄입니다.

## 웹 서버

[Nginx](https://www.nginx.com/) 웹 서버는 모든 Liferay Cloud 환경 내에서 다른 서비스에 대한 게이트웨이로 사용됩니다. 여기에는 레이어 7 공격 보호, IP 보호 및 감사 로깅을 제공하는 내장형 방화벽이 포함됩니다.

이 서버는 Liferay Cloud의 주요 서비스 중 하나로 구성할 수 있습니다. 자세한 내용은 [웹 서버 서비스](../platform-services/web-server-service.md) 을 참조하십시오.

## Liferay DXP

[Liferay DXP](https://www.liferay.com/products/dxp) 은 다양한 애플리케이션의 데이터와 서비스를 하나의 중앙 사용자 인터페이스 플랫폼으로 연결, 오케스트레이션 및 통합합니다. Liferay Cloud는 클라우드에서 DXP 인스턴스에 대한 빠르고 안정적인 구현을 제공합니다. [웹 서버 서비스](#web-server) 은 DXP에 대한 모든 HTTP(S) 트래픽에 대한 진입점 및 게이트웨이를 제공합니다.

자신의 프로젝트 저장소 [에 구성 및 사용자 정의 모듈을 추가함으로써](#repository-integration) 서비스는 일반 DXP 설치와 마찬가지로 고도로 사용자 정의할 수 있습니다. 자세한 내용은 [Liferay 서비스 소개](../using-the-liferay-dxp-service.md) 을 참조하십시오.

## 검색

Liferay Cloud는 각 환경 내에서 RESTful 검색, 인덱싱 및 분석 기능을 위해 [Elasticsearch](https://www.elastic.co/elasticsearch/service) 을 사용합니다. 검색 서비스는 TCP 또는 UDP 연결을 통한 개인 네트워크 트래픽을 통해서만 액세스할 수 있습니다.

Elasticsearch 엔진은 Liferay Cloud의 주요 서비스 중 하나로 제공되어 확장성과 사용자 정의가 가능합니다. 자세한 내용은 [검색 서비스](../platform-services/search-service.md) 을 참조하십시오.

## MySQL 데이터베이스

Liferay Cloud는 Liferay 서비스를 사설 네트워크 내의 별도 데이터베이스 스토리지 서비스에 연결합니다. [MySQL](https://www.mysql.com/) 데이터베이스는 클라우드에서 안정적이고 안전하며 확장 가능한 DXP 구현을 만드는 데 사용됩니다. 데이터베이스 서비스는 TCP 또는 UDP 연결을 통한 개인 네트워크 트래픽을 통해서만 액세스할 수 있습니다.

MySQL 데이터베이스는 Liferay Cloud의 주요 서비스 중 하나로 제공되므로 자유롭게 구성하고 사용자 정의할 수 있습니다. 자세한 내용은 [데이터베이스 서비스](../platform-services/database-service/database-service.md) 을 참조하십시오.

## 지속형 스토리지(볼륨)

Liferay Cloud는 사설 네트워크 내에서 볼륨이 필요한 모든 서비스에 대한 영구 데이터 스토리지용 볼륨을 사용합니다. 서비스 유형에 따라 볼륨은 해당 서비스에 특정한 SSD 드라이브에 저장하거나 네트워크 파일 시스템(NFS)의 서비스 간에 공유할 수 있습니다. 볼륨은 개인 네트워크 트래픽을 통해서만 액세스할 수 있습니다.

기본적으로 웹 서버, Liferay DXP 및 백업 서비스는 NFS를 사용하여 볼륨을 저장하고 검색 및 CI 서비스는 전용 SSD 디스크를 사용합니다. 자세한 내용은 [영구 파일 스토리지 볼륨 구성](../build-and-deploy/configuring-persistent-file-storage-volumes.md) 을 참조하십시오.

## 백업

Liferay Cloud는 개인 네트워크 내에 Liferay DXP의 데이터베이스 서비스 및 볼륨 사본을 저장합니다. 고객은 모든 환경에서 수동으로 백업을 생성하고 해당 백업을 다른 환경으로 복원할 수 있습니다. 기본적으로 백업은 HTTP(S) 연결을 통해 공용 웹 트래픽에 액세스할 수 있습니다.

백업은 Liferay Cloud의 주요 서비스 중 하나로 제공되며 운영 규칙(예: 백업 빈도 및 보존)을 자유롭게 구성할 수 있습니다. 자세한 내용은 [백업 서비스 개요](../platform-services/backup-service/backup-service-overview.md) 을 참조하십시오.

## CI 서버

Liferay Cloud는 개발 중인 고객 프로젝트의 빌드 및 배포 프로세스를 자동화합니다. [고객 리포지토리](#repository-integration) 에 연결된 프로젝트에서 Jenkins는 웹후크와 함께 사용되어 새 커밋 또는 풀 요청을 모든 환경에 배포할 수 있는 빌드로 자동 변환합니다. 이 서비스는 특수한 별도의 `infra` 환경 내에 존재하며 일반 사용자는 접근할 수 없습니다. Liferay Cloud는 Jenkins 빌드의 세부 정보를 볼 수 있도록 Cloud 콘솔의 고객에게 대시보드도 제공합니다.

Jenkins 빌드에 사용되는 CI 서비스는 Liferay Cloud의 주요 서비스 중 하나로 제공되며 고객은 이 서비스를 구성하고 원하는 경우 Jenkins 파이프라인을 사용자 정의할 수도 있습니다. 자세한 내용은 [지속적 통합](../platform-services/continuous-integration.md) 을 참조하십시오.

## CLI 도구

Liferay Cloud를 사용하면 CLI 도구를 사용하여 환경 및 서비스에서 다양한 관리 작업을 수행할 수 있습니다. 애플리케이션은 고객의 모든 프로젝트에 사용할 수 있는 중앙 인터페이스 역할을 하며 HTTP(S) 트래픽에 액세스할 수 있습니다. 자세한 내용은 [명령줄 도구](./command-line-tool.md) 을 참조하십시오.

## 바이러스 백신

Liferay Cloud는 [ClamAV](https://www.clamav.net/) 을 사용하여 트로이 목마, 바이러스, 맬웨어 및 기타 악의적인 위협을 자동으로 탐지합니다. 이 엔진은 클라우드 내에서 백그라운드 서비스로 작동하며 사용자 또는 다른 서비스에 액세스할 수 없습니다. Liferay Cloud의 각 클러스터에는 실행 중인 바이러스 백신 인스턴스가 하나씩 있습니다.

## 침입탐지시스템

Liferay Cloud는 [위협 스택](https://www.threatstack.com/cloud-security-platform/intrusion-detection) 을 사용하여 구성 요소 내 침입을 자동으로 감지합니다. 내장된 [바이러스 백신 소프트웨어](#antivirus) 와 마찬가지로 이 시스템도 백그라운드 서비스로 작동하며 사용자나 다른 서비스에 액세스할 수 없습니다. Liferay Cloud의 각 클러스터에는 하나의 인스턴스가 있습니다.