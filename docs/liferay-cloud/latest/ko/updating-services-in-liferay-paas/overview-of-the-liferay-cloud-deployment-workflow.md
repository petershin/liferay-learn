# Liferay 클라우드 배포 워크플로 개요

Liferay Cloud는 매우 효율적인 CI/CD 전략을 달성하기 위한 강력한 프레임워크를 제공합니다. Git 및 Jenkins 통합을 통해 프로젝트 환경에 배포할 수 있는 CI 빌드를 자동으로 트리거할 수 있습니다. 또는 CI 서비스의 빌드 프로세스를 모두 건너뛰고 [명령줄 인터페이스](../reference/command-line-tool.md) (CLI) 도구를 사용하여 로컬 변경 사항을 프로젝트 환경에 직접 배포할 수 있습니다.

배포를 위한 여러 경로가 있지만 워크플로는 일반적으로 다음 세 단계를 따릅니다.

* [개발 및 구성](#develop-and-configure)
* [빌드 및 테스트](#build-and-test)
* [배포](#deploy)

## 개발 및 구성

모든 작업 흐름은 프로젝트의 Git 리포지토리(즉, [GitHub](../getting-started/configuring-your-github-repository.md), [Bitbucket](../getting-started/configuring-your-bitbucket-repository.md)또는 [GitLab](../getting-started/configuring-your-gitlab-repository.md))를 변경하는 것으로 시작됩니다. 이 리포지토리는 Liferay 서비스 인스턴스 자체를 포함하여 프로젝트에 대한 모든 사용자 정의 추가의 기초 역할을 합니다. 이 Git 리포지토리는 프로젝트 서비스의 구성 및 사용자 지정을 위한 공유 버전 제어, 프로젝트 배포를 위한 단일 소스, Liferay 모듈, 테마 및 확장을 빌드하기 위한 공유 작업 공간을 제공합니다.

서비스의 [LCP.json 파일](../reference/configuration-via-lcp-json.md)을 구성하거나 `configs/` 폴더를 통해 서비스에 대한 환경별 및 프로젝트 전체 변경을 수행합니다. 각 서비스의 구성 옵션에 대한 자세한 내용은 해당 문서를 참조하십시오.

* [라이프레이 서비스](../customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/configuring-the-liferay-dxp-service.md)
* [백업 서비스](../platform-services/backup-service/backup-service-overview.md)
* [지속적 통합 서비스(Jenkins)](../platform-services/continuous-integration.md)
* [데이터베이스 서비스(MySQL)](../platform-services/database-service/database-service.md)
* [검색 서비스(Elasticsearch)](../platform-services/search-service.md)
* [웹 서버 서비스(Nginx)](../platform-services/web-server-service.md)

## 빌드 및 테스트

프로젝트의 Git 리포지토리 구성에 따라 커밋을 프로젝트의 중앙 리포지토리에 병합하거나 변경 사항이 포함된 새 풀 요청을 열어 자동 CI 빌드를 트리거할 수 있습니다. 이 프로세스는 자동이지만 테스트를 포함한 추가 파이프라인 단계를 포함하도록 `infra` 환경에서 CI 서비스를 수정할 수 있습니다. 자세한 내용은 [지속적 통합](../platform-services/continuous-integration.md) 참조하십시오.

모든 프로젝트 환경에서 전체 빌드 기록에 액세스하려면 Liferay Cloud 콘솔에서 **빌드** 페이지로 이동하십시오. 여기에서 일반 정보 및 상태(예: 보류 중, 통과 또는 실패)와 함께 CI 서비스 또는 CLI 도구에 의해 시작된 모든 빌드를 볼 수 있습니다.

![빌드 페이지를 통해 프로젝트의 빌드에 액세스하십시오.](./overview-of-the-liferay-cloud-deployment-workflow/images/01.png)

## 배포

Liferay Cloud에는 CLI 도구를 통한 배포(수동), Liferay Cloud Management Console을 통한 배포(수동) 또는 자동 배포를 위한 특정 CI 빌드 구성의 세 가지 서비스 배포 방법이 있습니다.

### 옵션 1: 명령줄 인터페이스를 통해 배포

CLI 도구를 사용하는 것이 로컬 변경 사항을 서비스에 배포하는 가장 빠른 방법입니다. 이를 통해 터미널에서 배포하고 변경 사항을 원격 리포지토리로 푸시하거나 Jenkins 빌드를 모두 트리거하는 것을 건너뛸 수 있습니다. 다른 배포 방법과 달리 CLI 도구는 한 번에 하나의 서비스에 대한 로컬 변경 사항을 배포할 수도 있습니다.

이렇게 하려면 터미널에서 CLI 도구에 로그인하고 배포하려는 서비스의 폴더로 이동합니다(폴더에는 서비스의 `LCP.json` 파일이 포함되어야 함). 그런 다음 `lcp deploy`실행하여 배포 프로세스를 시작하고 배포할 프로젝트 및 환경을 선택합니다(예: `dev`, `uat`, `prd`). **프로덕션 환경에 배포하기 전에 변경 사항을 확인하려면 항상 `dev` 또는 `uat` 환경에 배포하십시오.**

성공적으로 배포하려면 선택한 환경에 배포할 수 있는 권한이 있어야 합니다. 이 배포 워크플로에 대한 자세한 내용은 [CLI 도구를 통해 변경 사항 배포](./deploying-changes-via-the-cli-tool.md) 을 참조하십시오.

```{important}
백업, CI, 데이터베이스, 검색 및 웹 서버 서비스를 직접 배포할 수 있지만 `lcp deploy` 명령을 실행하기 전에 먼저 Liferay 서비스의 Gradle 빌드를 생성해야 합니다. 자세한 내용은 [Liferay 서비스에 배포](../customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/deploying-to-the-liferay-service.md#cli-tool-deployment) 를 참조하십시오.
```

CLI 도구를 사용하여 배포할 때 모든 서비스를 한 번에 배포하거나(프로젝트의 루트 디렉터리에서 명령을 실행하여) 단일 서비스만 배포할 수 있습니다(서비스의 `LCP가 포함된 디렉터리에서 명령을 실행하여). .json` 파일). `liferay` 서비스, 특히 [배포하는 데 추가](../customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/deploying-to-the-liferay-service.md#cli-tool-deployment) 단계가 필요하므로 프로젝트 작업 공간에서 파일을 빌드하고 준비할 수 있습니다.

### 옵션 2: Liferay Cloud 콘솔에서 배포

Liferay Cloud 콘솔은 프로젝트에 변경 사항을 배포하는 기본 방법입니다. 이를 통해 성공적인 빌드를 보고 선택하여 선택한 환경에 배포할 수 있습니다. 여기에는 CI 서비스와 CLI 도구 모두에서 생성된 빌드가 포함되며 Liferay Cloud 콘솔의 **빌드** 페이지를 통해 액세스할 수 있습니다. **프로덕션 환경에 배포하기 전에 변경 사항을 확인하려면 항상 `dev` 또는 `uat` 환경을 선택하십시오.**

배포 워크플로우에 대한 자세한 내용은 [Liferay Cloud Console](./deploying-changes-via-the-liferay-cloud-console.md) 을 통해 변경 사항 배포를 참조하십시오.

![Liferay Cloud 콘솔을 통해 빌드를 배포합니다.](./overview-of-the-liferay-cloud-deployment-workflow/images/02.png)

### 옵션 3: 빌드를 `dev` 환경에 자동 배포

원하는 경우 프로젝트의 `dev` 환경에 빌드를 자동으로 배포하도록 CI 서비스를 설정할 수 있습니다. 지정된 분기에서 만든 빌드에 대한 자동 배포를 시작하는 CI 서비스에 환경 변수를 추가합니다. 자세한 내용은 [자동 배포 설정](./automatically-deploying-ci-service-builds.md) 참조하십시오.

## 관련 주제

* [배포 유형 이해](./understanding-deployment-types.md)
* [배포 전략 이해](./understanding-deployment-strategies.md)
* [Liferay Cloud Console을 통해 변경 사항 배포](./deploying-changes-via-the-liferay-cloud-console.md)
* [CLI 도구를 통해 변경 사항 배포](./deploying-changes-via-the-cli-tool.md)
