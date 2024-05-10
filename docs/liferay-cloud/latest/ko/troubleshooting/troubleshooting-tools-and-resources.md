# 문제 해결 도구 및 리소스

기술 문제를 신속하게 진단하고 해결하는 능력은 매우 중요합니다. Liferay Cloud 프로젝트의 문제를 해결하기 위해 사용 가능한 도구와 리소스를 숙지하십시오.

* [애플리케이션 지표](#application-metrics)
* [실시간 알림](#real-time-alerts)
* [환경활동](#environment-activities)
* [환경 로그](#environment-logs)
* [셸 액세스](#shell-access)
* [자가 치유](#self-healing)
* [재해 복구](#disaster-recovery)
* [Liferay 클라우드 플랫폼 상태](#liferay-cloud-platform-status)
* [지원 액세스](#support-access)
* [지원 센터](#help-center)

이러한 도구와 리소스를 사용하여 프로젝트 활동을 추적하고, 서비스를 구성하고, 기술 문제를 해결하는 등의 작업을 수행할 수 있습니다.

```{note}
세부 사항은 Liferay와의 법적 계약에 따릅니다. 법적 계약 및 서비스에 대한 자세한 내용은 [Liferay Legal](https://www.liferay.com/legal) 페이지를 참조하십시오.
```

## 애플리케이션 지표

Liferay Cloud의 내장 모니터링을 통해 사용자는 각 환경 서비스에서 사용하는 리소스를 추적할 수 있습니다. 이러한 애플리케이션 메트릭에는 메모리 및 CPU 사용량과 네트워크 데이터 전송이 포함됩니다.

웹 서버, Liferay, 검색, 데이터베이스 및 백업과 같은 기본 Liferay 클라우드 스택 서비스에 대한 지표를 사용할 수 있습니다. CI 메트릭은 인프라 환경에서도 사용할 수 있습니다.

![Liferay Cloud 콘솔의 모니터링 페이지를 통해 애플리케이션 메트릭 보기](./troubleshooting-tools-and-resources/images/01.png)

사용자는 또한 [Dynatrace의](../manage-and-optimize/application-metrics.md#advanced-application-metrics-production-only) 고급 성능 모니터링을 생산 환경과 통합할 수 있습니다.

자세한 내용은 [애플리케이션 지표](../manage-and-optimize/application-metrics.md) 을 참조하십시오.

## 실시간 알림

Liferay Cloud는 시스템 관리자에게 프로젝트의 예기치 않은 동작을 알릴 수 있습니다. 예기치 않은 동작의 예로는 자동 확장 이벤트, 예상보다 높은 메모리 소비, 할당된 CPU 할당량 도달, 데이터베이스 연결 문제 등이 있습니다.

Liferay Cloud 콘솔을 통해 모든 환경 경고를 보고 경고 기본 설정을 지정합니다.

![Liferay Cloud 콘솔의 알림 페이지를 통해 알림 보기 및 관리](./troubleshooting-tools-and-resources/images/02.png)

자세한 내용은 [실시간 알림](../manage-and-optimize/real-time-alerts.md) 을 참조하십시오.

## 환경활동

사용자는 Liferay Cloud 콘솔을 통해 환경 활동을 모니터링할 수 있습니다. 여기에서 환경 활동은 **빌드 및 배포** 및 **일반 활동** 의 두 섹션으로 분류됩니다.

빌드, 배포, 서비스 활동 등의 상태를 확인하여 환경 문제를 해결하는 데 도움이 됩니다.

![Liferay Cloud 콘솔에서 환경 활동 보기](./troubleshooting-tools-and-resources/images/03.png)

자세한 내용은 [팀 활동](../manage-and-optimize/team-activities.md) 을 참조하십시오.

## 환경 로그

환경 로그는 프로젝트의 기술 문제를 진단하고 해결하는 데 중요합니다. 사용자는 Liferay Cloud 콘솔 또는 OS 터미널을 통해 환경 로그에 액세스하고 다운로드할 수 있습니다.

각 Liferay 클라우드 서비스에 대해 애플리케이션, 상태 및 빌드 로그가 제공됩니다.

* **애플리케이션 로그** : 이 로그는 애플리케이션이 실행되고 사용자가 액세스한 후에 생성된 런타임 정보를 나열합니다.
* **상태 로그** : 이 로그는 Kubernetes 클러스터의 오케스트레이션 계층 정보를 나열합니다.
* **빌드 로그** : 이 로그는 애플리케이션이 부팅될 때 생성된 빌드 정보를 나열합니다.

![Liferay Cloud 콘솔의 로그 페이지를 통해 로그 보기](./troubleshooting-tools-and-resources/images/04.png)

자세한 내용은 [로그 관리](./reading-liferay-cloud-service-logs.md) 을 참조하십시오.

## 셸 액세스

Liferay Cloud 콘솔의 명령줄 도구는 속도, 제어, 추적 가능성, 스크립팅 및 자동화 기능을 제공하여 개발자의 작업 흐름에 기여합니다.

문제를 해결할 때 셸 액세스 도구를 사용하여 애플리케이션 내부를 살펴보고 로그에서 쉽게 발견되지 않는 세부 정보를 확인하세요.

![Liferay Cloud 콘솔에서 셸 액세스 도구를 사용하여 응용 프로그램 내부에서 진행되는 작업을 확인하십시오.](./troubleshooting-tools-and-resources/images/05.png)

셸은 `liferay`, `search`및 `webserver` 서비스를 포함하여 대부분의 서비스에서 액세스할 수 있습니다. 서버의 파일 시스템에 직접 액세스하고 문제 해결을 위해 명령을 실행하는 데 사용할 수 있습니다.

예를 들어 `liferay` 서비스의 셸에서 다음 명령을 실행하여 주소 또는 외부 서버에 대한 연결을 테스트할 수 있습니다.

```bash
curl -v [address]
```

자세한 내용은 [Shell 액세스](./shell-access.md) 을 참조하십시오.

## 자가 치유

Liferay Cloud의 자가 치유 기능은 서비스 또는 애플리케이션이 응답하지 않는지 여부를 감지하고 응답하지 않는 서비스를 복구하는 절차를 자동으로 시작합니다. 플랫폼은 프로브를 사용하여 서비스를 모니터링합니다.

Liferay Cloud는 애플리케이션을 관리하기 위해 함께 사용되는 두 가지 프로브를 제공합니다.

* **Liveness Probe** : 이 프로브는 서비스가 실행 중인지 여부를 나타냅니다.
* **준비 프로브** : 이 프로브는 서비스가 요청을 수신할 준비가 되었는지 여부를 나타냅니다.

각 프로브 구성에 대한 자세한 내용은 [자가 치유](./self-healing.md) 을 참조하십시오.

## 재해 복구

재난 발생 시 Liferay Cloud는 프로젝트 복구를 위한 두 가지 전략인 자동 및 지역 간 복구를 제공합니다.

Liferay Cloud의 자동 재해 복구 전략은 동일한 지역 내의 세 가용 영역 간에 서비스를 복제합니다. 가용 영역을 사용할 수 없게 되면 로드 밸런서는 사용자 조치 없이 나머지 가용 영역으로 자동 라우팅합니다.

그러나 교차 지역 재해에서는 사용자 개입이 필요합니다. 교차 지역 재해 복구 도구 및 프로세스에 대한 자세한 내용은 [교차 지역 재해 복구 구성](./configuring-cross-region-disaster-recovery.md)을 참조하십시오.

두 재해 복구 전략에 대한 자세한 내용은 [재해 복구 개요](./disaster-recovery-overview.md) 을 참조하십시오.

## Liferay 클라우드 플랫폼 상태

기술 문제를 해결할 때 모든 Cloud Platform 시스템이 작동하는지 확인하십시오.

사용자는 [Liferay Cloud Platform](https://status.liferay.cloud/) 상태 페이지에서 Liferay Cloud Platform 시스템의 상태, 계획된 유지 관리 기간 및 사건 기록을 볼 수 있습니다.

클라우드 플랫폼 상태 변경 알림을 받으려면 **업데이트 구독** 을 클릭하고 원하는 알림 방법을 선택하십시오.

![Liferay Cloud Platform 시스템의 상태를 봅니다.](./troubleshooting-tools-and-resources/images/06.png)

자세한 내용은 [Liferay 클라우드 플랫폼 상태](./liferay-cloud-platform-status) 을 참조하십시오.

## 지원 액세스

지원 액세스는 Liferay 엔지니어가 Liferay Cloud 프로젝트 환경에 직접 액세스할 수 있도록 하여 문제 해결을 촉진하는 선택적 환경 설정입니다.

기본적으로 지원 액세스는 각 프로젝트 환경에서 활성화되지만 관리자는 **설정** 페이지에서 비활성화할 수 있습니다.

![환경 관리자는 설정 페이지에서 지원 액세스를 활성화 또는 비활성화할 수 있습니다.](./troubleshooting-tools-and-resources/images/07.png)

자세한 내용은 [지원 액세스](./support-access.md) 을 참조하십시오.

## 지원 센터

Liferay Cloud [라이프레이 클라우드](https://learn.liferay.com/w/liferay-cloud/index) 에서 답변하지 않은 질문이 있거나 문제를 보고하려면 Liferay [도움말 센터](https://help.liferay.com/) 에 로그인하여 구독 전용 리소스를 보거나 티켓을 제출하십시오.

![구독 전용 리소스를 보거나 Liferay 도움말 센터 페이지를 통해 티켓을 제출하십시오.](./troubleshooting-tools-and-resources/images/08.png)

여기에서 사용자는 Liferay Cloud [기술 자료](https://help.liferay.com/hc/ko/categories/360001132872) , [제품 지원](https://help.liferay.com/hc/ko/articles/360030208451-DXP-Cloud-Support-Overview) 및 [발표](https://help.liferay.com/hc/ko/categories/360001192512) 에 액세스할 수 있습니다.

사용자는 최신 Liferay Cloud [도움말 센터 업데이트](https://www.liferay.com/web/l/subscribe-to-liferay-dxp-cloud-updates) 에 대한 이메일 알림을 받도록 구독할 수도 있습니다. 이러한 업데이트에는 새로운 플랫폼 릴리스, 서비스 업데이트, 보안 경고 및 패치가 포함됩니다.

```{note}
Liferay Cloud 알림은 활성 Liferay 기업 구독이 있는 고객에게만 배포됩니다.
```

추가 지원을 위해 사용자는 전화로 Liferay의 글로벌 [지원 센터](https://help.liferay.com/hc/ko/articles/360017784212?_ga=2.254167624.1908736764.1562000563-1350017715.1560788053) 중 하나에 연락하거나 [도움말 센터](https://help.liferay.com/) 페이지를 통해 티켓을 제출할 수 있습니다.

티켓을 제출할 때 현재 사용 중인 빌드 이미지, 직면한 동작 또는 질문, 문제를 재현하는 단계, 실제 동작과 예상 동작에 대한 설명에 대한 정보를 제공하십시오.

## 관련 주제

* [Liferay 클라우드 지원 개요](https://help.liferay.com/hc/ko/articles/360030208451-DXP-Cloud-Support-Overview)
* [Liferay 클라우드 기술 자료](https://help.liferay.com/hc/ko/categories/360001132872)
* [Liferay 클라우드 발표](https://help.liferay.com/hc/ko/categories/360001192512)
* [지원 액세스](./support-access.md)
