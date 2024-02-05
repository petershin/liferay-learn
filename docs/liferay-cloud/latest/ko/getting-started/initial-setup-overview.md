# 초기 설정 개요

Liferay Cloud를 시작하려면 모든 계정, 환경 및 서비스가 성공적으로 프로비저닝되고 인스턴스에 배포되었는지 확인해야 합니다. 다음 단계로 시작하십시오.

* [설정 이메일 확인](#check-setup-emails)
* [Liferay 클라우드 콘솔에 액세스](#access-the-liferay-cloud-console)
* [프로비저닝된 프로젝트 소스 코드에 액세스](#access-the-provisioned-project-source-code)
* [CI 및 Liferay 서비스에 로그인](#log-in-to-your-ci-and-liferay-services)
* [설정 확인](#verifying-setup)

## 설정 이메일 확인

이메일 설정을 위해 Liferay Cloud 구독과 연결된 이메일 계정을 확인하십시오. 구매한 각 Liferay Cloud 환경에 대한 이메일 초대장과 함께 Liferay Cloud 온보딩 이메일을 받아야 합니다.

온보딩 이메일은 비프로덕션 환경에서 Jenkins 및 Liferay DXP에 액세스하는 데 필요한 자격 증명과 Liferay Cloud를 시작하기 위한 중요한 단계를 제공합니다.

각 환경 초대는 구매한 단일 Liferay Cloud 환경에 대한 액세스 권한을 부여합니다. 모든 환경 초대를 수락해야 합니다.

## Liferay 클라우드 콘솔에 액세스

복귀 사용자는 [기존 계정을 사용하여 Liferay Cloud Console](https://console.liferay.cloud/login) 에 로그인할 수 있습니다. 새 사용자는 [계정을 만들어야 합니다](https://console.liferay.cloud/signup?undefined) .

로그인하면 Liferay Cloud Console [홈 페이지](https://console.liferay.cloud/projects) 이 나타납니다.

![Liferay 클라우드 콘솔 홈페이지.](./initial-setup-overview/images/01.png)

여기에서 환경 및 배포에 액세스 및 관리하고 다른 팀 구성원을 초대할 수 있습니다.

## 프로비저닝된 프로젝트 소스 코드에 액세스

새로운 Liferay Cloud 프로젝트는 `dxpcloud` 조직에서 호스팅되는 임시 GitHub 리포지토리로 프로비저닝됩니다. 이 리포지토리에는 Liferay Cloud 개발 프로젝트용 템플릿이 포함되어 있습니다.

새 프로젝트 리포지토리에 액세스하려면 Liferay Cloud 온보딩 이메일의 지침을 따르고 후속 GitHub 초대를 수락하십시오.

초대를 수락한 후 프로비저닝된 프로젝트 저장소를 찾습니다.

1. GitHub에 로그인합니다.

1. **Your Teams** 검색 상자에서 `dxpcloud` 검색합니다.

!['내 팀' 검색창에서 dxpcloud를 검색하세요.](./initial-setup-overview/images/02.png)

프로비저닝된 리포지토리를 찾으면 다음을 수행해야 합니다.

1. 프로비저닝된 리포지토리의 콘텐츠를 프라이빗 Git 리포지토리로 전송합니다.

1. Webhook를 사용하여 개인 저장소를 Liferay Cloud의 Jenkins(CI) 서비스와 통합합니다.

자세한 지침은 [GitHub 저장소 구성](./configuring-your-github-repository.md) 을 참조하십시오.

```{note}
대체 호스팅 서비스를 사용하시나요? [Bitbucket](./configuring-your-bitbucket-repository.md) 또는 [GitLab](./configuring-your-gitlab-repository.md) 리포지토리를 구성하는 방법을 참조하십시오.
```

## CI 및 Liferay 서비스에 로그인

Jenkins(CI) 웹 인터페이스에 로그인한 다음 Liferay DXP 인스턴스의 비생산 환경(예: **dev** 및 **uat**)에 로그인하여 액세스할 수 있습니다.

로그인 자격 증명은 초기 온보딩 이메일에 제공되며 **인프라** 환경에서 [비밀](..//tuning-security-settings/managing-secure-environment-variables-with-secrets.md) 로 나열됩니다.

자세한 지침은 [Liferay 클라우드 서비스에 로그인](./logging-into-your-liferay-cloud-services.md) 참조하십시오.

## 설정 확인

Liferay Cloud에서 배포를 시작하기 전에 올바른 환경과 서비스가 성공적으로 프로비저닝되고 배포되었는지 확인하십시오.

### 환경 확인

구매한 모든 환경이 Liferay Cloud Console [홈 페이지](https://console.liferay.cloud/projects) **프로젝트** 아래에 나열되어 있는지 확인하십시오.

![그림 3: Liferay Cloud Console에서 프로비저닝된 환경을 참조하십시오.](./initial-setup-overview/images/03.png)

모든 환경 초대를 수락한 후 누락된 환경이 있으면 Liferay 지원 팀에 문의하십시오.

### 환경 사이트 확인

각 환경의 사이트가 팀에서 요청한 사이트와 일치하는지 확인합니다.

모든 환경 사이트는 Liferay Cloud Console [홈 페이지](https://console.liferay.cloud/projects) 에 나열되어 있습니다.

**개요** 페이지 또는 **설정** 페이지로 이동하여 환경의 사이트를 볼 수도 있습니다.

![그림 4: 개요 페이지에서 환경의 사이트를 봅니다.](./initial-setup-overview/images/04.png)

환경 사이트가 팀에서 요청한 사이트와 일치하지 않는 경우 [Liferay 지원팀](https://help.liferay.com/hc/ko/articles/360030208451-DXP-Cloud-Support-Overview) 에 문의하십시오.

### 클라우드 스택 서비스 확인

Liferay Cloud 스택 서비스가 올바르게 배포되었는지 확인합니다.

1. Liferay Cloud Console에서 **dev** 환경에 액세스합니다.

1. **서비스** 페이지로 이동합니다.

![그림 5: 서비스 페이지에서 Liferay Cloud Stack 서비스의 상태를 봅니다.](./initial-setup-overview/images/05.png)

제대로 배포되면 기본 Cloud Stack 서비스 5개 모두의 상태가 '준비됨'이어야 합니다.

## 관련 주제

* [GitHub 리포지토리 구성](./configuring-your-github-repository.md)
* [Liferay 클라우드 환경 이해](./understanding-liferay-cloud-environments.md)
* [Liferay 클라우드 서비스에 로그인](./logging-into-your-liferay-cloud-services.md)
