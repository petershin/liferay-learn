# 8단계: 마이그레이션 후 다음 단계

축하합니다! 이 섹션의 이전 단계를 모두 완료했다면 온프레미스 Liferay DXP 설치를 Liferay Cloud로 성공적으로 마이그레이션한 것입니다!

Liferay Cloud에서 실행 중인 Liferay DXP가 있으므로 [자동 백업](../platform-services/backup-service/backup-service-overview.md), [빌드된 -지속적인 통합](../platform-services/continuous-integration.md), 자동 [서비스 로깅](../support-and-troubleshooting/reading-liferay-cloud-service-logs.md) 및 내장된 [보안 기능](..//tuning-security-settings/information-security-and-liferay-cloud.md).

그러나 Liferay Cloud의 기능을 최대한 활용하기 위해 시작하는 동안 수행할 수 있는 몇 가지 추가 단계가 있습니다.

* [팀](#set-up-teams) 을 설정하여 멤버십 및 권한 관리
* [인증 간소화를 위한 Single Sign-On 설정](#set-up-sso)
* [사용자 정의 도메인을 추가하여 필요에 맞게](#add-custom-domains)
* [재해 복구 환경 설정](#set-up-a-disaster-recovery-environment)
* [귀하에게 가장 적합한 방식으로 작동하도록 서비스](#configure-your-services) 구성
* [애플리케이션 성능 최적화 및 튜닝](#optimize-and-tune-application-performance)
* [Liferay Cloud에서 개발 시작하기](#get-started-developing-on-liferay-cloud)

## 팀 설정

Liferay Cloud의 관리자는 필요에 따라 다른 구성원을 초대하고 프로젝트의 다양한 영역에 대한 액세스를 관리할 수 있습니다. [팀원을 초대한 다음 적절한](../manage-and-optimize/environment-teams-and-roles.md#inviting-team-members) 팀 역할을 부여하여 [모든 사람이 Liferay Cloud 프로젝트에서 필요한 수준의 액세스 권한을 갖도록](../manage-and-optimize/environment-teams-and-roles.md#understanding-team-roles) .

자세한 내용은 [환경 팀 및 역할](../manage-and-optimize/environment-teams-and-roles.md) 을 참조하십시오.

## SSO 설정

Single Sign-On을 사용하면 선호하는 ID 공급자를 사용하여 Liferay Cloud 인스턴스에서 Liferay에 대한 사용자를 인증할 수 있습니다. 이렇게 하면 사인온 경험이 더 매끄럽고 프로젝트의 나머지 부분과 더 통합되는 느낌을 받을 수 있습니다.

Liferay Cloud는 SAML 2.0을 준수하는 Signle Sign-On ID 공급자를 지원합니다. 자세한 내용은 [Liferay Cloud](..//tuning-security-settings/using-sso-with-liferay-cloud.md)에서 SSO 사용을 참조하십시오.

## 사용자 지정 도메인 추가

Liferay Cloud의 환경이 필요에 따라 사용자 정의 도메인을 호스트하는지 확인하십시오. Liferay Cloud는 맞춤형 도메인과 통합되어 각 환경에 대해 인증된 도메인을 정의할 수 있습니다.

자세한 내용은 [맞춤 도메인](..//configuring-the-cloud-network/custom-domains.md) 을 참조하세요.

## 재해 복구 환경 설정

기본적으로 Liferay Cloud는 동일한 지역 내에서 [자동 재해 복구](../support-and-troubleshooting/disaster-recovery-overview.md#automatic-disaster-recovery-strategy) 을 제공하여 서비스 중단으로 인한 가동 중지 시간을 완화합니다. 그러나 재해로 인해 Liferay 클라우드 환경을 서비스하는 영역에서 중단이 발생하는 경우 프로덕션 인스턴스에서 사용자의 가동 중지 시간을 최소화하기 위해 대체 환경(또는 재해 복구 환경)을 사용하는 것도 고려해야 합니다.

[재해 복구 환경을 구성](../support-and-troubleshooting/configuring-cross-region-disaster-recovery.md)하여 계획되지 않은 다운타임으로부터 가능한 가장 강력한 보호를 유지합니다. 자동 및 지역 간 재해 복구에 대해 자세히 알아보세요[여기](../support-and-troubleshooting/disaster-recovery-overview.md).

```{important}
재해 복구 환경을 설정하려면 구독의 일부로 별도의 환경을 구입해야 합니다.
```

## 서비스 구성

`liferay` 서비스 외에도 기본 Liferay 클라우드 환경에는 모두 개별적으로 구성할 수 있는 기본 서비스 세트가 있습니다. 이러한 각 서비스에는 초기에 구성해야 하는 몇 가지 구성이 있습니다.

* [`백업` 서비스](../platform-services/backup-service/backup-service-overview.md) 은 언제든지 환경에 복원할 수 있는 정기적인 간격으로(또는 수동으로 트리거할 때) 자동으로 백업을 생성합니다. 백업에 대해 선호하는 빈도를 [으로 설정하고 보존 기간을](../platform-services/backup-service/backup-service-overview.md#scheduling-automated-backups-and-cleanups) 로 설정하여 시작할 수 있습니다.

* [`webserver` 서비스](../platform-services/web-server-service.md)는 Liferay Cloud 서비스와 나머지 인터넷 간의 게이트웨이를 제공합니다. Liferay 인스턴스 서비스의 성능 및 요청 유형에 따라 요청에 대한 [시간 제한 또는 재시도 횟수](../platform-services/web-server-service.md#environment-variables) 를 조정할 수 있습니다. 예상대로 처리됩니다.
  
  * [`웹서버` 서비스](../platform-services/web-server-service.md) 은 Liferay 클라우드 서비스와 나머지 인터넷 사이의 게이트웨이를 제공합니다. Liferay 인스턴스 서비스의 성능 및 요청 유형에 따라 요청이 예상대로 처리되도록 제한 시간 [또는 재시도 횟수](../platform-services/web-server-service.md#environment-variables) 을 조정할 수 있습니다.

* [`database` 서비스](../platform-services/database-service/database-service.md)는 [마이그레이션 초기에 업로드한](./uploading-and-restoring-the-data) 데이터베이스를 안전하게 제공합니다. -backup.md). 유지 관리를 위한 다운타임의 영향을 완화하기 위해 원하는 [데이터베이스 유지 관리 기간](../platform-services/database-service/database-service.md#database-maintenance-window-variables) 을 구성할 수 있습니다.

## 애플리케이션 성능 최적화 및 조정

Liferay Cloud에서 Liferay를 사용하기 시작할 때 애플리케이션 성능을 모니터링하고 조정하는 데 사용할 수 있는 도구를 숙지하십시오.

* **Alerts** 은 서비스에 리소스 제한 문제가 발생했을 때, 인스턴스 수를 늘리거나 줄였을 때, 다른 문제가 발생했을 때 실시간으로 알려줄 수 있습니다. [이러한 이벤트를 알 수 있도록 필요에 맞게 상태 알림](../manage-and-optimize/real-time-alerts.md) 을 구성합니다.

* **Auto-scaling** 은 사용자 트래픽을 수용하기 위해 필요에 따라 Liferay 서비스의 인스턴스 수를 자동으로 조정합니다. [이 최적화를 활용하려면 자동 크기 조정](../manage-and-optimize/auto-scaling.md) 을 구성합니다.

* [**서비스 팝오버**](../manage-and-optimize/application-metrics.md#service-popover) 및 [**모니터링 화면**](../manage-and-optimize/application-metrics.md#extended-application-metrics) 을 보고 서비스 및 리소스 사용량에 대한 세부 정보를 확인합니다. 서비스 성능 모니터링에 대한 자세한 내용은 [애플리케이션 지표](../manage-and-optimize/application-metrics.md) 을 참조하십시오.

* 프로덕션 환경의 경우 [Dynatrace 통합](../manage-and-optimize/application-metrics.md#advanced-application-metrics-production-only) 을 사용하여 고급 성능 지표를 사용할 수도 있습니다. **이를 사용하려면 Liferay Cloud 구독에 특정 Dynatrace 애드온이 필요합니다.**

온프레미스 인스턴스를 조정하는 것과 같은 방식으로 Liferay Cloud의 인스턴스로 자체 성능 테스트 및 최적화를 수행해야 합니다. 서비스 데이터, 메트릭 및 사용 가능한 [로깅](../support-and-troubleshooting/reading-liferay-cloud-service-logs.md) 이 모두 테스트에 도움이 됩니다.

## Liferay Cloud에서 개발 시작하기

이제 Liferay Cloud로 마이그레이션했고 이미 [사용자 지정](./migrating-dxp-configurations-and-customizations.md)을 배포했으므로 클라우드 환경에 변경 사항을 배포하여 개발을 계속할 수 있습니다. 아직 익숙하지 않은 경우 [명령줄 도구](../reference/command-line-tool.md) 에 익숙해지면 개발 작업을 수행하는 데 도움이 될 수 있습니다.

[Liferay Cloud 콘솔을 통해](../updating-services-in-liferay-paas/deploying-changes-via-the-liferay-cloud-console.md) 서비스를 배포하는 것 외에도 [자동 배포](를 구성할 수도 있습니다. ./updating-services-in-liferay-paas/automatically-deploying-ci-service-builds.md)를 사용하여 개발 환경의 프로세스 속도를 높일 수 있습니다. 필요에 따라 CI 서비스에서 사용하는 [Jenkins 파이프라인을 사용자 지정](../platform-services/continuous-integration.md#extending-the-default-jenkinsfile) 할 수도 있습니다.

Liferay 클라우드 배포 워크플로우 [여기](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md)에 대해 자세히 알아보십시오.
