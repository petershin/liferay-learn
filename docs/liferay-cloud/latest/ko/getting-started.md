---
toc:
- ./getting-started/initial-setup-overview.md
- ./getting-started/development-requirements.md
- ./getting-started/configuring-your-github-repository.md
- ./getting-started/configuring-your-bitbucket-repository.md
- ./getting-started/configuring-your-gitlab-repository.md
- ./getting-started/logging-into-your-liferay-cloud-services.md
- ./getting-started/understanding-liferay-cloud-environments.md
---
# 시작하기

```{toctree}
:maxdepth: 1

getting-started/initial-setup-overview.md
getting-started/development-requirements.md
getting-started/configuring-your-github-repository.md
getting-started/configuring-your-bitbucket-repository.md
getting-started/configuring-your-gitlab-repository.md
getting-started/logging-into-your-liferay-cloud-services.md
getting-started/understanding-liferay-cloud-environments.md
```

Liferay Cloud는 Liferay DXP에서 놀라운 애플리케이션을 단순화, 보안 및 제공하는 데 필요한 인프라와 도구를 제공하는 안전하고 안정적인 엔터프라이즈 클라우드 플랫폼입니다.

다음을 제공하는 플랫폼으로 걱정은 덜고 더 많이 구축하십시오.

* [표준 준수 보안, 자동화된 백업 및 유연한 거버넌스](#standards-compliant-security-automated-backups-and-flexible-governance)
* [고가용성, 확장성 및 성능](#high-availability-scalability-and-performance)
* [실시간 알림](#real-time-alerts)

이 모든 것은 Liferay DXP에서 비즈니스 크리티컬 솔루션을 실행한 10년 이상의 경험을 가진 전담 Liferay 전문가 팀에 의해 설계, 구축 및 지원됩니다.

Liferay Cloud는 완전한 DevOps CI/CD 전략, 도구 및 워크플로를 제공하여 애플리케이션 개발 및 배포를 가속화합니다.

모든 Liferay Cloud 프로젝트에는 다음이 포함됩니다.

* [내장된 CI/CD로 가속화된 개발](#accelerated-development-with-built-in-cicd)
* [애플리케이션 개발 도구](#application-development-tools)
* [통찰력 있는 모니터링](#insightful-monitoring)

## 표준 준수 보안, 자동화된 백업 및 유연한 거버넌스

Liferay Cloud는 보안을 염두에 두고 설계되었습니다. Liferay Cloud가 **ISO 27001** 및 **AICPA SOC2** 인증을 받았기 때문에 자신 있게 미션 크리티컬 사이트를 구축하고 배포하십시오.

모든 고객 데이터는 기본적으로 유휴 상태에서 암호화됩니다. 미사용 암호화는 디스크에 저장된 중요한 데이터를 유효한 키 없이는 사용자나 애플리케이션이 읽을 수 없도록 합니다. 자세한 내용은 [보안 정책](https://www.liferay.com/documents/10182/3292406/Liferay+DXP+Cloud+Data+Security+and+Protection.pdf/78ce7065-9787-1fb2-9c7b-6d7c13f4a3e6?t=1564674972483) 을 참조하세요.

[자동 백업](./platform-services/backup-service/backup-service-overview.md) 은 데이터 손상이나 오류가 발생할 경우 데이터와 문서를 보호하고 복원할 수 있도록 합니다.

![Liferay Cloud의 백업 서비스는 데이터를 보존하고 보호합니다.](./getting-started/images/01.png)

즉시 사용 가능한 [역할 및 팀 관리](./manage-and-optimize/environment-teams-and-roles.md) 을 통해 관리자는 팀에서 사람을 추가하거나 제거하고 프로젝트 환경별로 권한을 관리하여 생산성과 보안을 극대화할 수 있습니다.

![권한을 포함하여 프로젝트 팀원을 관리합니다.](./getting-started/images/02.png)

## 고가용성, 확장성 및 성능

[클러스터링](./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/setting-up-clustering-in-liferay-cloud.md) 및 [로드 밸런싱](./configuring-the-cloud-network/load-balancer.md) 은 미션 크리티컬 사이트가 온라인 상태를 유지할 수 있도록 가용성이 높고 다운타임이 없는 배포를 제공합니다. Liferay Cloud는 다중 지역 아키텍처를 통해 데이터를 제공하여 고가용성을 보장합니다.

[자동 크기 조정](./manage-and-optimize/auto-scaling.md) 은 대역폭과 컴퓨팅 용량을 동적으로 추가하여 예상치 못한 트래픽 급증에도 안정적인 성능을 유지합니다. 마찬가지로 불필요한 리소스는 활동이 적은 기간 동안 축소될 수 있습니다. 팀은 인스턴스 사용에 대한 자동 알림 및 이메일 알림을 수신하므로 안심하고 리소스를 관리할 수 있습니다.

![수요를 충족하기 위해 서버를 자동 확장합니다.](./getting-started/images/03.png)

## 실시간 알림

관리자는 리소스 사용률 업데이트를 실시간으로 수신하도록 사용자별로 [경고](./manage-and-optimize/real-time-alerts.md)를 구성할 수 있습니다.

![관리자는 실시간 경고를 구성할 수 있습니다.](./getting-started/images/04.png)

## 내장된 CI/CD로 가속화된 개발

즉시 사용할 수 있는 완전히 실현된 CI/CD 전략으로 애플리케이션을 더 빠르게 제공하십시오. [Github 및 Jenkins](./platform-services/continuous-integration.md) 통합을 통해 각각의 새로운 커밋 또는 풀 요청이 프로덕션 또는 비프로덕션 환경 [에 배포할 수 있는 빌드를 트리거할 수](./getting-started/understanding-liferay-cloud-environments.md).

이러한 강력한 시스템을 통해 내결함성 프로세스를 생성하여 조직의 고유한 요구 사항을 충족하고 발생하는 일반적인 서버 문제를 감지하고 복구할 수 있습니다. 이것은 작은 프로그래밍 오류가 누적되어 서버 충돌을 일으키는 것을 방지하는 데 도움이 됩니다.

![중앙 사이트에서 빌드를 보고 관리하고 배포합니다.](./getting-started/images/05.png)

## 애플리케이션 개발 도구

실시간 빌드 및 [배포 로그](./support-and-troubleshooting/reading-liferay-cloud-service-logs.md)로 애플리케이션 배포 및 성능을 추적합니다. 팀은 웹 [콘솔이나 터미널을 통해 에 액세스하거나 로그를](./support-and-troubleshooting/shell-access.md) 다운로드하여 스택 추적을 분석하고 버그를 수 있습니다. 다운로드

![실시간 빌드 및 배포 로그는 애플리케이션의 문제를 해결하는 데 도움이 됩니다.](./getting-started/images/06.png)

## 통찰력 있는 모니터링

Liferay Cloud는 IT 팀이 시간이 지남에 따라 사이트의 상태 및 컴퓨팅 요구 사항을 이해할 수 있도록 [애플리케이션 메트릭](./manage-and-optimize/application-metrics.md) 을 제공합니다. 또한 관리자는 즉시 사용 가능한 [Dynatrace 통합](./manage-and-optimize/application-metrics.md#advanced-application-metrics-production-only) 을 사용하여 CPU 및 메모리 사용량, 데이터 전송 속도 등을 빠르게 이해할 수 있습니다.

![다양한 메트릭을 사용하여 Liferay DXP 인스턴스를 포함하여 Liferay 클라우드 서비스에 대한 탭을 유지하십시오.](./getting-started/images/07.png)

## 관련 주제

* [개발 요구 사항](./getting-started/development-requirements.md)
* [Github 리포지토리 구성](./getting-started/configuring-your-github-repository.md)
* [Liferay 클라우드 배포 워크플로 개요](./updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md)
* [Liferay Cloud Console을 통해 변경 사항 배포](./updating-services-in-liferay-paas/deploying-changes-via-the-liferay-cloud-console.md)
