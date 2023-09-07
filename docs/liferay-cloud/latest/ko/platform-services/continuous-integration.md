# 지속적 통합

Liferay Cloud는 [Jenkins](https://jenkins.io/) 를 사용하여 지속적 통합 인프라 서비스를 지원합니다. 풀 리퀘스트를 보내거나 미리 구성된 GitHub 브랜치 중 하나에 커밋을 푸시하면 자동으로 구성 가능한 빌드가 트리거됩니다.

```{note}
Liferay 클라우드 고객('고객' 로그인 사용)은 빌드를 관리하고 검토할 수 있는 권한이 있지만 전체 관리 권한은 없습니다.
```

기본적으로 이 자동화된 빌드는 코드를 컴파일하고 테스트를 실행하도록 구성할 수 있습니다. Liferay Cloud는 서비스를 빌드하고 환경의 빌드 페이지에 해당 상태를 표시합니다. 테스트에 실패하면 `https://ci-companyname-infra.lfr.cloud`에서 Jenkins 대시보드와 로그를 확인할 수 있습니다.

```{note}
지속적 통합은 CLI가 아닌 GitHub, GitLab 또는 Bitbucket에서 배포하는 경우에만 작동합니다.
```

자세한 내용은 [CI 서비스 제한 사항](../reference/platform-limitations.md#continuous-integration-service) 을 참조하세요.

## 기본 젠킨스 파일 사용

CI 서비스 버전 `liferaycloud/jenkins:2.222.1-3.2.0`부터는 재정의하지 않은 경우 기본 Jenkins파일을 사용할 수 있습니다. 기본 젠킨스 파일은 버전 4.x.x 서비스를 사용하는 프로젝트 [](../reference/understanding-service-stack-versions.md)에서 항상 사용할 수 있습니다.

기본 젠킨스파일은 이전에 젠킨스파일에 저장되어 있던 모든 로직을 캡슐화하여 젠킨스 플러그인으로 이동합니다. 즉, CI 구성 없이도 모든 버그 수정, 보안 수정 및 개선 사항을 적용할 수 있습니다.

또한 확장 지점을 사용하여 CI 파이프라인의 모든 단계를 사용자 지정할 수 있습니다.

### 기본 젠킨스 파일 활성화

프로젝트가 [버전 4.x.x](../reference/understanding-service-stack-versions.md)로 업데이트된 경우 기본 젠킨스파일이 이미 활성화되어 있습니다. 그렇지 않은 경우 프로젝트 리포지토리에서 다음 단계를 따르세요:

1. CI 서비스를 버전 `liferaycloud/jenkins:2.222.1-3.2.0`으로 업데이트합니다.

1. 루트 폴더에 있는 `젠킨스파일` 을 삭제합니다.

1. CI 서비스의 `LCP.json` 파일에 다음 환경 변수를 추가합니다: `LCP_CI_USE_DEFAULT_JENKINSFILE: true`.

1. [CI 서비스 배포](../build-and-deploy/deploying-changes-via-the-cli-tool.md).

### 기본 젠킨스 파일 확장하기

기본 젠킨스 파일을 확장하려면 프로젝트 리포지토리의 `ci` 폴더에 다음 파일을 추가하면 됩니다:

- `Jenkinsfile-before-all`
- `Jenkinsfile-before-cloud-build`
- `Jenkinsfile-before-cloud-deploy`
- `Jenkinsfile-after-all`
- `Jenkinsfile-post-always`

다음은 CI 빌드 프로세스의 단계에 대한 기본 개요입니다:

1. `ci/Jenkinsfile-before-all`을 로드합니다(있는 경우).

1. 라이프레이 워크스페이스 구축.

1. `ci/Jenkinsfile-before-cloud-build`를 로드합니다(있는 경우).

1. 콘솔에 표시되는 Liferay Cloud 빌드를 생성합니다.

1. `ci/Jenkinsfile-before-cloud-deploy`를 로드합니다(있는 경우).

1. 현재 브랜치가 배포 브랜치인 경우 클라우드의 환경에 빌드를 배포할 수 있습니다. `LCP_CI_DEPY_BRANCH` 환경 변수는 배포 브랜치를 설정하고, `LCP_CI_DEPY_TARGET` 은 배포 환경을 지정합니다.

1. `ci/Jenkinsfile-after-all`을 로드합니다(있는 경우). 모든 빌드 단계가 완료되면 실행됩니다.

1. `ci/Jenkinsfile-post-always`를 로드합니다(있는 경우). 빌드 성공 또는 실패 여부에 관계없이 실행됩니다.

기본 파이프라인에서 어떻게 사용되는지 확인하려면 Jenkins 서비스 시작 로그를 모니터링하세요. 전체 기본 젠킨스 파일은 시작 로그에 인쇄됩니다.

## 추가 파이프라인 사용자 지정 및 외부 호출

파이프라인의 추가 단계를 사용하여 외부 서비스를 호출할 수 있습니다. 예를 들어 REST API를 통해 타사 모니터링 서비스를 호출하거나 빌드 프로세스 중에 실행할 스크립트를 호출할 수 있습니다.

리포지토리의 `ci/` 폴더에 `젠킨스파일` 을 정의하여 고유한 파이프라인을 만들 수도 있습니다. 자세한 내용은 [젠킨스 웹사이트](https://www.jenkins.io/doc/book/pipeline/jenkinsfile/) 를 참조하세요.

```{warning}
외부 서비스 또는 사용자 지정 파이프라인은 신중하게 사용해야 하며 Liferay 클라우드 지원의 범위를 벗어납니다. 사용자 지정 Jenkins 플러그인은 지원되지 않습니다.
```

## 서로 다른 확장 지점 간 코드 재사용

이러한 확장 지점 간에 코드를 공유할 수 있는 방법이 필요할 것입니다. 기본적인 방법 중 하나는 멋진 스크립트를 로드하는 것입니다. 예를 들어 `ci/` 폴더에 `util.groovy` 라는 그루비 파일을 생성하여 이러한 내용을 담을 수 있습니다:

```
def sendSlackMessage(message) {
    println(message)
}

return this
```

그런 다음 `ci/Jenkinsfile-before-cloud-build`에 다음을 삽입할 수 있습니다:

```
def util = load("ci/util.groovy")

util.sendSlackMessage("About to create Liferay Cloud build...")
```

## 환경 변수 참조

다음 환경 변수는 기본 Jenkinsfile에서만 사용됩니다. 어떤 작업을 수행하는지 확인하려면 [파이프라인 옵션에 관한 Jenkins 문서](https://jenkins.io/doc/book/pipeline/syntax/#options) 를 참조하세요.

이름 | 기본값 | 설명 |
:--- | :--- | :--- |
`LCP_CI_ARTIFACT_DAYS_TO_KEEP` | `-1` | 아티팩트가 저장되는 일수 |
`LCP_CI_ARTIFACT_NUM_TO_KEEP` | '1' | **아티팩트** 및 **스태시** 가 보존되는 최근 빌드 수를 설정합니다. |
`LCP_CI_BUILD_DAYS_TO_KEEP` | '14' | 빌드가 저장되는 일수 |
`LCP_CI_BUILD_NUM_TO_KEEP` | '10' | 저장된 빌드 수 |
`LCP_CI_BUILD_TIMEOUT_MINUTES` | `30` | 파이프라인 실행에 대한 시간 초과 기간을 설정합니다. 그 후에는 Jenkins가 Pipeline |
`LCP_CI_DEPLOY_BRANCH` | '개발' | [자동 배포](../build-and-deploy/automatically-deploying-ci-service-builds.md)에 사용할 브랜치를 지정합니다. 유효한 분기 이름으로 설정되지 않으면 자동 배포가 비활성화됩니다. |
`LCP_CI_DEPLOY_TARGET` | | [자동 배포](../build-and-deploy/automatically-deploying-ci-service-builds.md)가 배포될 환경을 설정합니다. 'LCP_CI_DEPLOY_BRANCH'가 설정된 경우에만 사용됩니다. |
`LCP_CI_LIFERAY_DXP_HOTFIXES_{ENV}` | | Liferay 서비스를 배포할 때 CI가 자동으로 적용되는 핫픽스(`.zip` 확장자 없음)의 이름입니다. `{ENV}`를 환경 이름(모두 대문자) 또는 `COMMON`으로 바꾸세요. |
`LCP_CI_PRESERVE_STASHES_BUILD_COUNT` | '20' | **스태시** 가 보존되는 최근 빌드 수를 설정합니다. 'LCP_CI_ARTIFACT_NUM_TO_KEEP' 변수에서 허용하는 것보다 더 많은 빌드에 대해서는 스태시를 보존할 수 없습니다. |
`LCP_CI_SCM_MANAGE_HOOKS` | '사실' | 코드 호스팅 플랫폼(GitHub 등)에 대해 [자동 웹훅 관리](../getting-started/configuring-your-github-repository.md#personal-access-token-usage) 를 활성화 또는 비활성화하는 옵션입니다. |
`LCP_CI_SCM_PROVIDER` | `github` | 빌드 검색에 사용되는 소스 제어 관리 서비스를 설정합니다. 허용되는 값은 [`bitbucket`](../getting-started/configuring-your-bitbucket-repository.md), [`github`](../getting-started/configuring-your-github-repository.md)입니다. , 및 [`gitlab`](../getting-started/configuring-your-gitlab-repository.md). |
`LCP_CI_SCM_REPOSITORY_NAME` | | GitHub, Bitbucket 또는 GitLab에서 빌드를 검색하는 데 사용되는 저장소 이름을 설정합니다. |
`LCP_CI_SCM_REPOSITORY_OWNER` | | 빌드를 검색하는 데 사용되는 저장소 소유자입니다. |
`LCP_CI_SCM_TOKEN` | | Bitbucket, GitHub 또는 GitLab에서 빌드에 액세스하고 검색하는 데 필요한 개인 액세스 토큰입니다. |
`LCP_CI_USE_DEFAULT_JENKINSFILE` | '거짓' | 기본 Jenkinsfile을 활성화 또는 비활성화하는 옵션 |
`LCP_DATABASE_SERVICE` | | 데이터베이스 서비스의 호스트 이름입니다. |

## 관련 주제

* [Liferay 클라우드 서비스에 로그인](../getting-started/logging-into-your-liferay-cloud-services.md)
* [GitLab 리포지토리 구성하기](../getting-started/configuring-your-gitlab-repository.md)
* [Bitbucket 리포지토리 구성하기](../getting-started/configuring-your-bitbucket-repository.md)
* [라이프레이 클라우드 프로젝트 버전 4의 변경 사항](../reference/liferay-cloud-project-changes-in-version-4.md)
<!-- While Version 3 is still supported, because of the fact a large part of this article hinges on the project version, this link may be helpful. This link should likely be removed once version 3 is no longer supported. -->
