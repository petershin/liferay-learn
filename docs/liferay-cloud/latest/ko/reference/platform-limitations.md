# 플랫폼 제한 사항

Liferay Cloud 및 해당 서비스에는 구독 수준에 따라 몇 가지 중요한 제한 사항이 있습니다. Liferay Cloud의 인프라가 변경됨에 따라 시간이 지남에 따라 제한 사항이 변경될 수 있습니다.

## 개요

Liferay Cloud 사용을 계획할 때 다음과 같은 일반적인 제한 사항을 고려하십시오.

* 사용 가능한 vCPU, 메모리, 크기 조정, 네트워크 구성(도메인, SSL 인증서 및 IP 주소) 및 각 서비스에 대한 VPN 대역폭에 제한이 적용됩니다. 예를 들어 각 서비스는 최대 200GB RAM으로 제한됩니다. 사용자 지정 도메인도 웹 서버의 구성에 따라 [50 또는 1500으로 제한됩니다](#network-configuration) .

* 동시 작업(예: 동시 업로드), 빌드 크기, 동시 빌드 및 백업에도 제한이 있습니다.

* Liferay 또는 검색 서비스의 단일 인스턴스를 사용하는 환경에서 계획된 유지 관리로 인해 서비스 중단 시간이 발생할 수 있습니다.

* 보다 엄격한 보안, 규정 준수 또는 VPN 요구 사항을 위해 개인 클러스터 구독이 필요할 수 있습니다.

* 원격 스테이징은 Liferay Cloud에서 지원되지 않습니다.

자세한 내용은 아래 추가 섹션을 참조하십시오.

* [모든 서비스](#all-services)
* [라이프레이 서비스](#liferay-service)
* [데이터베이스 서비스](#database-service)
* [검색 서비스](#search-service)
* [백업 서비스](#backup-service)
* [웹 서버 서비스](#web-server-service)
* [지속적인 통합 서비스](#continuous-integration-service)
* [맞춤형 서비스](#custom-services)
* [보안](#security)
* [파일 스토리지](#file-storage)
* [네트워크 구성](#network-configuration)
* [VPN 서버](#vpn-servers)

## 모든 서비스

이러한 제한 사항은 Liferay Cloud 환경의 모든 서비스에 적용됩니다.

**이전 로그에 대한 액세스** : 기본적으로 각 서비스의 최근 30일 로그를 콘솔을 통해 사용할 수 있습니다. [이전 애플리케이션 로그(최대 1년)에 액세스하려면 지원 요청](https://help.liferay.com/) 을 제출하십시오. 상태 및 빌드 로그는 30일 후에 검색할 수 없습니다.

**서비스당 추가 인스턴스** : [`스케일` 설정](../manage-and-optimize/auto-scaling.md) 초기에 구독 계획에 대해 구매한 인스턴스 수를 사용합니다. 기본적으로 서비스는 검색을 제외하고 하나의 추가 인스턴스를 추가할 수 있습니다. 검색 서비스는 홀수의 인스턴스를 사용해야 합니다.

**중단 시간** : Liferay Cloud 인프라가 예정된 유지 관리를 위해 업데이트되면 단일 인스턴스로 실행되는 서비스가 다시 시작될 수 있습니다. 중단을 방지하려면 생산 유형 환경에 대해 고가용성 설정(웹 서버 및 Liferay 서비스 각각 2개 인스턴스 및 검색 서비스 3개 인스턴스)을 사용하십시오. 계획된 유지 보수 일정 [여기](https://help.liferay.com/hc/ko/articles/360032562611-DXP-Cloud-Platform-Maintenance-and-Release-Schedule) 볼 수 있습니다.

**서비스 인스턴스당 메모리** : 서비스는 최대 200GB의 RAM을 가질 수 있으며 이는 가입 계획에 따라 결정됩니다. 기본 계획에는 서비스당 16GB가 있습니다.

**서비스 인스턴스당 가상 CPU** : 서비스는 최대 32개의 vCPU를 가질 수 있으며 이는 구독 계획에 따라 결정됩니다.

## 라이프레이 서비스

이러한 제한 사항은 각 Liferay 클라우드 환경에서 [Liferay 서비스](../using-the-liferay-dxp-service.md) 에 적용됩니다.

**원격 스테이징** : [원격 라이브 스테이징 구성](https://learn.liferay.com/dxp/latest/ko/site-building/publishing-tools/staging/configuring-remote-live-staging.html) 은 Liferay Cloud에서 사용할 수 없습니다. 로컬 스테이징은 계속 사용할 수 있으며 지원됩니다.

**자동 크기 조정** : 활성화되면 자동 크기 조정은 기본 최대 10개까지만 새 인스턴스를 추가할 수 있습니다. 최대 100개의 인스턴스까지 서로 다른 최대 인스턴스 수를 구성할 수 있습니다.

**문서 라이브러리 저장소** : 가입 계획에 따라 Liferay 서비스에 대한 `데이터` 볼륨의 크기가 결정됩니다. 여기에는 Liferay의 문서 라이브러리에 사용되는 스토리지가 포함됩니다. 기본 볼륨 크기는 100GB이지만 크기가 4TB 미만이면 늘릴 수 있습니다. 프로젝트에 4TB 이상의 스토리지가 필요한 경우 비공개 클러스터가 필요합니다.

**세션 복제** : Liferay Cloud의 여러 Liferay 인스턴스 간에 세션을 복제하면 인스턴스의 성능에 영향을 줄 수 있으며 지원되지 않습니다. <!-- Instead, use sticky sessions, or avoid using session storage entirely in your custom applications. -->

### 다이나트레이스

[Dynatrace](../manage-and-optimize/application-metrics.md#advanced-application-metrics-production-only) 은 Liferay Cloud 환경의 표준 설정에 포함되어 있지 않지만 별도로 구매하여 함께 사용할 수 있습니다. Dynatrace는 고가용성 설정에 포함되어 있지만 프로덕션 또는 UAT 환경에만 해당됩니다.

다음 제한 사항이 Dynatrace에 적용됩니다.

**Dynatrace 메트릭 불일치** : Dynatrace 메트릭이 Liferay Cloud Console에 표시된 메트릭과 일치하지 않습니다. 이는 Dynatrace가 JVM 프로세스에 대한 메트릭을 표시하는 반면 콘솔 메트릭은 JVM을 호스팅하는 전체 컨테이너를 측정하기 때문입니다.

**스트리밍 Liferay 로그** : Liferay 로그를 Dynatrace 로그로 스트리밍할 수 없습니다.

**세션 재생** : Dynatrace 세션 재생 기능은 Liferay Cloud에서 사용할 수 없습니다.

## 데이터베이스 서비스

이러한 제한 사항은 각 Liferay 클라우드 환경에서 [데이터베이스 서비스](../platform-services/database-service/database-service.md) 에 적용됩니다.

**데이터베이스 메트릭** : Liferay Cloud 콘솔에 표시되는 메트릭은 개별 서비스 메트릭이 아니라 서비스 컨테이너에 대한 데이터를 반영합니다.

**데이터베이스 크기** : 데이터베이스의 최대 크기는 일반적으로 100GB입니다. [이 제한을 늘리려면 지원 요청](https://help.liferay.com/) 을 제출하십시오.

**가동 중지 시간** : 데이터베이스 유지 관리로 인해 몇 개월마다 가동 중지가 발생할 수 있습니다. 이 가동 중지 시간은 일반적으로 약 2분 동안 지속됩니다. 사전 알림과 함께 제공되지 않을 수 있습니다. 가동 중지 시간의 영향을 완화하기 위해 [기본 유지 관리 창을](../platform-services/database-service/database-service.md#database-maintenance-window-variables) 설정할 수 있습니다.

**읽기/쓰기 분할** : 데이터베이스 서비스에서 읽기/쓰기 분할 구성은 Liferay Cloud에서 지원되지 않습니다.

## 검색 서비스

이러한 제한 사항은 각 Liferay 클라우드 환경에서 [검색 서비스](../platform-services/search-service.md) 에 적용됩니다.

**구성** : Elasticsearch는 Liferay UI가 **아닌** Liferay Cloud 작업 공간을 통해 구성해야 합니다. 프로젝트 작업 공간의 구성 파일은 각 배포에서 사용되며 이전 구성을 덮어씁니다.

**메모리 설정** : Elasticsearch 서버의 기본(및 최대) JVM 힙 크기는 4GB입니다. 최대 할당량은 구독 계획에 따라 결정됩니다.

**OS 패키지** : 검색 서비스에 대한 추가 OS 패키지 설치는 지원되지 않습니다.

**포드 관리 정책** : 성공적으로 시작하려면 클러스터의 Elasticsearch 노드가 서로 연결되어야 합니다. 여러 인스턴스가 있는 검색 서비스의 경우 서비스 시작 문제를 방지하려면 서비스의 `LCP.json` 파일에 있는 `podManagementPolicy` 값을 `병렬` 로 설정해야 합니다.

## 백업 서비스

이러한 제한 사항은 각 Liferay 클라우드 환경에서 [백업 서비스](../platform-services/backup-service/backup-service-overview.md) 에 적용됩니다.

**백업 일관성** : 변경되는 데이터가 있는 데이터베이스에서 복사하는 모든 프로세스와 마찬가지로 업데이트가 진행되는 동안 백업이 생성되면 데이터베이스와 문서 라이브러리의 데이터 간의 일관성을 보장할 수 없습니다. 완전히 일관된 백업을 보장하려면 데이터베이스 관리자와 협력하여 수동 백업을 수행하는 동안 [업데이트를 중지하십시오](../platform-services/backup-service/backup-service-overview.md#creating-a-manual-backup) .

**백업 크기** : Liferay Cloud 버전 4.2.0 이전에는 백업에 사용된 [임시 스토리지](#file-storage) . 이러한 버전의 백업 크기는 공유 임시 디스크의 남은 공간으로 제한되며 상황에 따라 달라질 수 있습니다.

**백업 업로드** : 분당 하나의 백업만 업로드할 수 있습니다.

**동시 작업** : 동시 백업 생성, 복원 또는 업로드 또는 지원되지 않음. 그러나 동시 다운로드는 지원됩니다.

**리소스 할당** : 백업 서비스에 할당된 RAM 및 vCPU 수는 구독 요금제에 따라 결정됩니다. 서비스에 대한 기본 할당은 vCPU 2개와 RAM 1GB입니다.

**업로드/다운로드 속도** : 백업 업로드 또는 다운로드 속도는 인터넷 연결 속도와 백업 크기에 따라 제한됩니다. 연결 속도가 매우 느린 경우 백업을 다운로드하는 데 최대 몇 시간이 걸릴 수 있습니다.

## 웹 서버 서비스

이러한 제한 사항은 각 Liferay 클라우드 환경에서 [웹 서버 서비스](../platform-services/web-server-service.md) 에 적용됩니다.

**Plugins** : 웹 서버에 대한 추가 Plugin 설치를 지원하지 않는다.

**리소스 할당** : 웹 서버에는 기본적으로 2개의 vCPU와 512MB의 메모리가 있습니다. 이로 인해 대용량 업로드 또는 다운로드에 대한 응답 시간이 느려질 수 있습니다. 구독 계획에 따라 서비스에 대한 특정 리소스 할당이 결정됩니다.

## 지속적인 통합 서비스

이러한 제한 사항은 각 Liferay Cloud 환경의 [CI 서비스](../platform-services/continuous-integration.md) 에 적용됩니다.

**관리자 액세스** : Jenkins 서버에서 관리자 수준 액세스가 허용되지 않습니다. 대신 [Jenkins 파이프라인 후크](../platform-services/continuous-integration.md#extending-the-default-jenkinsfile) 사용하여 CI 파이프라인을 확장합니다. 기존 DevOps 프로세스는 이 파이프라인에 맞게 조정해야 할 수 있습니다.

**동시 API 호출** : 프로젝트는 Liferay Cloud API에 대한 동시 호출을 수행할 수 없습니다. 여기에는 [CLI 도구](./command-line-tool.md)를 통해 빌드를 환경에 배포하는 것과 같은 작업이 포함됩니다.

**리소스 할당** : CI 서비스에 할당된 RAM 및 vCPU 수는 구독 요금제에 따라 결정됩니다. 기본 할당은 서비스에 대한 4개의 vCPU 및 8GB RAM입니다.

**서버 용량** : 가입 플랜에 따라 CI 서버의 데이터 볼륨 크기가 결정됩니다.  기본 크기는 100GB입니다.

### 빌드

이러한 제한 사항은 프로젝트 내에서 생성된 모든 빌드에 적용됩니다.

**빌드 크기** : 개별 빌드는 각각 2GB로 제한됩니다. 리포지토리에 있는 프로젝트의 총 크기가 이 제한보다 작아야 합니다.

**동시 빌드** : 두 개의 실행기 스레드가 사용되기 때문에 최대 두 개의 동시 빌드가 Jenkins에서 실행될 수 있습니다.

**일일 최대 빌드** : 빌드는 하루에 300회로 제한됩니다. [이 제한을 늘리려면 지원 요청](https://help.liferay.com/) 을 제출하십시오.

**개인 GitHub 서버** : 개인 GitHub 서버와의 통합이 지원되지 않습니다.

## 맞춤형 서비스

이러한 제한 사항은 Liferay Cloud 환경의 모든 [맞춤형 서비스](../platform-services/using-a-custom-service.md) 에 적용됩니다.

**호스트 OS 액세스** : 호스트 운영 체제 커널에 대한 권한 있는 액세스는 개인 클러스터를 포함하는 구독으로 제한됩니다.

## 보안

이러한 제한 사항은 Liferay Cloud 내에서 사용할 수 있는 보안 기능에 적용됩니다.

**바이러스 백신** : 파일 업로드 시 바이러스 검사를 위한 기본 Liferay DXP 기능을 사용할 수 없습니다. Liferay Cloud의 [Antivirus 솔루션](./liferay-cloud-infrastructure.md#antivirus) 대신 사용됩니다. 업로드된 콘텐츠는 일정에 따라 검사되므로 파일이 업로드되는 즉시 위험 요소가 감지되지 않을 수 있습니다.

**분당 인증** : 분당 최대 8400개의 인증이 허용됩니다.

**방화벽 규칙** : 사용자 지정 방화벽 규칙을 설정하려면 개인 클러스터와 함께 구독을 구입하고 Liferay 클라우드 지원과 조정해야 합니다. 사용자 지정 방화벽 규칙은 공유 클러스터 구독과 함께 사용할 수 없습니다. 비공개 클러스터에 대해 생성된 모든 사용자 지정 방화벽 규칙은 프로젝트의 모든 환경에 적용됩니다.

**IP 주소 필터링** : IP 주소 필터링은 웹 서버 서비스에서만 적용할 수 있습니다.

## 파일 스토리지

이러한 제한 사항은 여러 서비스의 파일 스토리지에 적용됩니다.

**Ephemeral Storage** : Ephemeral Storage는 볼륨에 저장되지 않은 모든 파일에 사용됩니다. Ephemeral Storage는 호스트 노드의 내부 스토리지에 있으며 해당 노드에서 실행되는 모든 컨테이너 간에 공유됩니다. 컨테이너가 호스트 노드가 사용할 수 있는 것보다 더 많은 공간을 요청하면 컨테이너는 다른 노드로 이동됩니다. 호스트 디스크의 용량은 250GB입니다.

**서비스 간 데이터 공유** : StatefulSet가 있는 서비스 [배포 유형](../updating-services-in-liferay-paas/understanding-deployment-types.md) 은 다른 서비스와 데이터를 공유할 수 없습니다.

**StatefulSet 저장소 크기** : StatefulSet [배포 유형](../updating-services-in-liferay-paas/understanding-deployment-types.md)으로 서비스용 저장소를 추가하려면 지원 티켓을 만들어야 합니다. StatefulSet 서비스의 스토리지 크기는 일단 늘리면 줄일 수 없습니다.

## 네트워크 구성

이러한 제한 사항은 Liferay Cloud 환경에서 서비스의 네트워크 구성에 적용됩니다.

**사용자 지정 도메인에 대한 변경 사항** : 사용자 지정 도메인에 대한 변경 사항 또는 추가 사항이 전파되기까지 지연(최대 60분)이 발생할 수 있습니다.

**최대 사용자 지정 도메인** : 환경 외부에 여러 서비스가 노출된 경우(기본 웹 서버 외에) 50 [사용자 지정 도메인](..//configuring-the-cloud-network/custom-domains.md) 으로 제한됩니다. 그러나 웹 서버는 유일한 진입점인 경우 1500개의 사용자 지정 도메인을 사용할 수 있습니다. 이 한도를 초과하여 사용량을 늘리기 위해 웹 서버 서비스를 변경하는 경우 [지원 티켓](https://help.liferay.com/) 열어야 합니다.

**최대 SSL 인증서** : 최대 14개의 사용자 지정 SSL 인증서가 허용됩니다. 인증서를 발급하는 공급자는 이를 줄이기 위해 자체 제한을 부과할 수도 있습니다.

**아웃바운드 연결** : 프로젝트 환경에서 외부 엔드포인트로의 연결은 연결당 120초 제한 시간이 있는 NAT 솔루션을 사용합니다. 짧은 기간에 연속적으로 생성된 새 연결은 포트 고갈 및 아웃바운드 트래픽 손실로 이어질 수 있습니다. 연결 풀링은 이 문제를 방지할 수 있습니다.

**공용 IP 주소** : 기본적으로 모든 환경에는 하나의 공용 IP 주소가 있으며 환경 내의 서비스에는 내부 IP 주소가 있습니다. 그러나 공용 IP 주소를 서비스에 할당하여 서비스의 포트를 외부로 구성할 수 있습니다. 서비스의 엔드포인트를 인터넷에 노출하는 것은 [HTTPS 로드 밸런서](..//configuring-the-cloud-network/load-balancer.md)의 DDoS 보호를 우회하기 때문에 **권장되지 않습니다** .

**와일드카드 SSL 인증서** : Liferay의 자동 생성 SSL 인증서에는 와일드카드 인증서가 지원되지 않습니다. 그러나 사용자 정의 와일드카드 SSL 인증서로 인스턴스를 구성할 수 있습니다.

**TCP 포트 상태** : 외부 트래픽이 사용 중인 고객 환경에 도달할 수 없는 경우에도 일부 TCP 포트가 열린 것으로 표시될 수 있습니다. 이러한 포트는 서버에서 동일한 디스크를 공유하는 다른 프로젝트에 대해 열려 있으며 환경에 보안 위험을 초래하지 않습니다.

## VPN 서버

이러한 제한 사항은 [VPN 서버](..//configuring-the-cloud-network/vpn-integration-overview.md) 을 환경의 서비스에 연결한 경우에 적용됩니다.

**Site-to-Site VPN** : Site-to-Site VPN 서버는 Google Cloud VPN으로만 구성할 수 있습니다. 또한 개인 클러스터 구독이 필요합니다.

**대역폭** : 각 VPN 터널은 총 대역폭이 3Gbps로 제한됩니다. 이 제한은 수신 및 발신 트래픽의 총계에 적용됩니다.

**온프레미스 네트워크 확장:** 온프레미스 네트워크의 Cloud Interconnect 또는 Express Route 전용 연결은 지원되지 않습니다. 이는 직접 또는 파트너 공급자를 통해 그리고 공유 또는 개인 클러스터와 연결하는 경우에 적용됩니다.
