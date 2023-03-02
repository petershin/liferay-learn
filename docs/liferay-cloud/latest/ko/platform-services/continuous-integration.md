---
uuid: 7c189c0f-2937-4adf-b0a6-d7e1741c3cd8
---

# 지속적인 통합

Liferay Cloud는 [Jenkins](https://jenkins.io/) 사용하여 지속적인 통합 인프라 서비스를 지원합니다. 미리 구성된 GitHub 분기 중 하나에 풀 요청을 보내거나 커밋을 푸시하면 구성 가능한 자동 빌드가 트리거됩니다.

```{note}
Liferay Cloud 고객('customer' 로그인 사용)은 자신의 빌드를 관리하고 검토할 수 있는 권한이 있지만 전체 관리 권한은 없습니다.
```

기본적으로 이 자동화된 빌드는 코드를 컴파일하고 테스트를 실행하도록 구성할 수 있습니다. Liferay Cloud는 서비스를 구축하고 환경의 빌드 페이지에 해당 상태를 표시합니다. 테스트가 실패하면 `https://ci-companyname-infra.lfr.cloud`에서 Jenkins 대시보드 및 로그를 확인할 수 있습니다.

```{note}
지속적인 통합은 CLI가 *아닌* GitHub, GitLab 또는 Bitbucket에서 배포하는 경우에만 작동합니다.
```

자세한 내용은 [CI 서비스 제한 사항](../reference/platform-limitations.md#continuous-integration-service) 참조하십시오.

## 기본 Jenkins 파일 사용

CI 서비스 버전 `liferaycloud/jenkins:2.222.1-3.2.0`부터 기본 Jenkins 파일은 재정의되지 않은 경우 사용할 수 있습니다. 기본 Jenkinsfile은 [버전 4.x.x 서비스를 사용하는] 프로젝트(../reference/understanding-service-stack-versions.md)에서 항상 사용할 수 있습니다.

기본 Jenkinsfile은 이전에 Jenkinsfile에 저장된 모든 논리를 캡슐화하고 Jenkins 플러그인으로 이동합니다. 이는 모든 버그 수정, 보안 수정 및 개선 사항을 CI 구성 없이 적용할 수 있음을 의미합니다.

또한 확장 지점을 사용하여 CI 파이프라인의 모든 단계를 사용자 정의할 수 있습니다.

### 기본 Jenkinsfile 활성화

프로젝트가 [버전 4.xx](../reference/understanding-service-stack-versions.md)로 업데이트되면 기본 Jenkinsfile이 이미 활성화되어 있습니다. 그렇지 않으면 프로젝트 저장소에서 다음 단계를 따르세요.

1. CI 서비스를 버전 `liferaycloud/jenkins:2.222.1-3.2.0`로 업데이트합니다.

1. 루트 폴더에 있는 `Jenkinsfile` 을 삭제합니다.

1. CI 서비스의 `LCP.json` 파일에 다음 환경 변수를 추가합니다. `LCP_CI_USE_DEFAULT_JENKINSFILE: true`.

1. [CI 서비스 배포](../build-and-deploy/deploying-changes-via-the-cli-tool.md).

### 기본 Jenkinsfile 확장

기본 Jenkinsfile을 확장하려면 프로젝트 리포지토리의 `ci` 폴더에 다음 파일을 추가할 수 있습니다.

- `Jenkinsfile-before-all`
- `Jenkinsfile-before-cloud-build`
- `Jenkinsfile-before-cloud-deploy`
- `Jenkinsfile-after-all`
- `Jenkinsfile-post-always`

다음은 CI 빌드 프로세스의 단계에 대한 기본 개요입니다.

1. 존재하는 경우 `ci/Jenkinsfile-before-all`로드합니다.

1. Liferay 작업 공간을 구축합니다.

1. `ci/Jenkinsfile-before-cloud-build`이 있으면 로드합니다.

1. 콘솔에 표시되는 Liferay Cloud 빌드를 생성합니다.

1. `ci/Jenkinsfile-before-cloud-deploy`이 있으면 로드합니다.

1. 현재 분기가 배포 분기인 경우 클라우드의 환경에 빌드를 배포할 수 있습니다. `LCP_CI_DEPLOY_BRANCH` 환경 변수는 배포 분기를 설정하고 `LCP_CI_DEPLOY_TARGET` 배포 환경을 지정합니다.

1. 존재하는 경우 `ci/Jenkinsfile-after-all`로드합니다. 모든 빌드 단계가 완료되면 실행됩니다.

1. 존재하는 경우 `ci/Jenkinsfile-post-always`로드합니다. 빌드 성공 여부에 관계없이 실행됩니다.

```{note}
버전 3.xx 서비스를 사용하는 경우 Jenkinsfile에 대한 이러한 확장은 대신 `lcp/ci/` 폴더에 있습니다. 버전 확인에 대한 자세한 내용은 [서비스 스택 버전 이해하기](../reference/understanding-service-stack-versions.md)를 참조하십시오.
```

기본 파이프라인에서 어떻게 사용되는지 확인하려면 Jenkins 서비스 시작 로그를 모니터링하세요. 전체 기본 Jenkinsfile이 시작 로그에 인쇄됩니다.

## 추가 파이프라인 사용자 정의 및 외부 호출

파이프라인의 추가 단계를 사용하여 외부 서비스를 호출할 수 있습니다. 예를 들어 REST API를 통해 타사 모니터링 서비스를 호출하거나 빌드 프로세스 중에 실행할 스크립트를 호출할 수 있습니다.

리포지토리의 `ci/` 폴더에 고유한 `Jenkinsfile` 정의하여 고유한 파이프라인을 생성할 수도 있습니다. 자세한 내용은 [Jenkins 웹사이트](https://www.jenkins.io/doc/book/pipeline/jenkinsfile/) 참조하십시오.

```{warning}
외부 서비스 또는 맞춤형 파이프라인은 신중하게 사용해야 하며 Liferay 클라우드 지원 범위를 벗어납니다. 사용자 지정 Jenkins 플러그인은 지원되지 않습니다.
```

```{note}
버전 3.xx 서비스를 사용하고 자체 `Jenkinsfile`을 정의하는 경우 대신 리포지토리의 루트에서 정의해야 합니다. 버전 확인에 대한 자세한 내용은 [서비스 스택 버전 이해하기](../reference/understanding-service-stack-versions.md)를 참조하십시오.
```

## 서로 다른 확장 지점 간에 코드 재사용

이러한 확장 지점 간에 코드를 공유하는 방법이 필요할 것입니다. 한 가지 기본적인 방법은 Groovy 스크립트를 로드하는 것입니다. 예를 들어, `ci/` 폴더에 다음 내용으로 `util.groovy` 이라는 groovy 파일을 만들 수 있습니다.

```
def sendSlackMessage(message) {
    println(message)
}

return this
```

그런 다음 `ci/Jenkinsfile-before-cloud-build`에 다음을 삽입할 수 있습니다.

```
def util = load("ci/util.groovy")

util.sendSlackMessage("About to create Liferay Cloud build...")
```

```{note}
버전 3.xx 서비스를 사용하는 경우 이 파일은 대신 저장소의 `lcp/ci/` 디렉토리에 속합니다. 버전 확인에 대한 자세한 내용은 [서비스 스택 버전 이해하기](../reference/understanding-service-stack-versions.md)를 참조하십시오.
```

## 환경 변수 참조

다음 환경 변수는 기본 Jenkinsfile에서만 사용됩니다. 그들이 무엇을 하는지 보려면 [파이프라인 옵션에 관한 Jenkins 문서를 참조하십시오](https://jenkins.io/doc/book/pipeline/syntax/#options).

이름 | 기본값 | 설명 |
:--- | :--- | :--- |
`LCP_CI_ARTIFACT_DAYS_TO_KEEP` | `-1` | 아티팩트가 저장되는 일수 |
`LCP_CI_ARTIFACT_NUM_TO_KEEP` | `1` | *artifacts* 및 *stashes*가 보존되는 최근 빌드 수를 설정합니다. |
`LCP_CI_BUILD_DAYS_TO_KEEP` | `14` | 빌드가 저장되는 일수 |
`LCP_CI_BUILD_NUM_TO_KEEP` | `10` | 저장된 빌드 수 |
`LCP_CI_BUILD_TIMEOUT_MINUTES` | `30` | Jenkins가 Pipeline |
`LCP_CI_DEPLOY_BRANCH` | `개발` | [자동 배포](../build-and-deploy/automatically-deploying-ci-service-builds.md)에 사용할 분기를 지정합니다. 유효한 브랜치 이름으로 설정하지 않으면 자동 배포가 비활성화됩니다. |
`LCP_CI_DEPLOY_TARGET` | | [자동 배포](../build-and-deploy/automatically-deploying-ci-service-builds.md)가 배포될 환경을 설정합니다. `LCP_CI_DEPLOY_BRANCH`가 설정된 경우에만 사용됩니다. |
`LCP_CI_LIFERAY_DXP_HOTFIXES_{ENV}` | | Liferay 서비스를 배포할 때 CI가 자동으로 적용되는 핫픽스(`.zip` 확장자 없음)의 이름입니다. `{ENV}`를 환경 이름(모두 대문자) 또는 `COMMON`으로 바꿉니다. |
`LCP_CI_PRESERVE_STASHES_BUILD_COUNT` | `20` | *stashes*가 보존되는 최근 빌드 수를 설정합니다. 보관함은 `LCP_CI_ARTIFACT_NUM_TO_KEEP` 변수에서 허용하는 것보다 더 많은 빌드에 대해 보존할 수 없습니다. |
`LCP_CI_SCM_MANAGE_HOOKS` | `참` | 코드 호스팅 플랫폼(예: GitHub)에 대해 [자동 웹 후크 관리](../getting-started/configuring-your-github-repository.md#personal-access-token-usage)를 활성화 또는 비활성화하는 옵션입니다. |
`LCP_CI_SCM_PROVIDER` | `github` | 빌드 검색에 사용되는 소스 제어 관리 서비스를 설정합니다. 허용되는 값은 [`bitbucket`](../getting-started/configuring-your-bitbucket-repository.md), [`github`](../getting-started/configuring-your-github-repository.md)입니다. , 및 [`gitlab`](../getting-started/configuring-your-gitlab-repository.md). |
`LCP_CI_SCM_REPOSITORY_NAME` | | 빌드(GitHub, Bitbucket 또는 GitLab에서)를 검색하는 데 사용되는 리포지토리 이름을 설정합니다. |
`LCP_CI_SCM_REPOSITORY_OWNER` | | 빌드를 검색하는 데 사용되는 저장소 소유자입니다. |
`LCP_CI_SCM_TOKEN` | | Bitbucket, GitHub 또는 GitLab에서 빌드에 액세스하고 검색하는 데 필요한 개인 액세스 토큰입니다. |
`LCP_CI_USE_DEFAULT_JENKINSFILE` | `거짓` | Default Jenkinsfile |
`LCP_DATABASE_SERVICE` | | 데이터베이스 서비스의 호스트 이름입니다. |

## 추가 정보

* [Liferay 클라우드 서비스에 로그인](../getting-started/logging-into-your-liferay-cloud-services.md)
* [GitLab 리포지토리 구성](../getting-started/configuring-your-gitlab-repository.md)
* [Bitbucket 리포지토리 구성](../getting-started/configuring-your-bitbucket-repository.md)
* [버전 4의 Liferay Cloud 프로젝트 변경 사항](../reference/liferay-cloud-project-changes-in-version-4.md)
<!-- While Version 3 is still supported, because of the fact a large part of this article hinges on the project version, this link may be helpful. This link should likely be removed once version 3 is no longer supported. -->
