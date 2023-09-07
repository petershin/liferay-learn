# CLI 도구를 통한 변경 사항 배포

CLI 도구를 사용하면 Jenkins 빌드를 트리거하거나 Liferay Cloud 콘솔을 사용하지 않고도 로컬 프로젝트 변경 사항을 직접 배포할 수 있습니다. 이 자습서에서는 CLI 도구를 사용하여 Liferay 서비스에 포털 속성을 추가하고 `dev` 에 배포하는 과정을 안내합니다.

시작하려면 먼저 [CLI 도구](../reference/command-line-tool.md) 를 설치하여 사용할 준비가 되어 있어야 하며, 프로젝트의 Git 리포지토리(예: [GitHub](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) , [Bitbucket](https://confluence.atlassian.com/bitbucketserver/clone-a-repository-790632786.html) , [GitLab](https://docs.gitlab.com/ee/university/training/topics/getting_started.html#instantiate-workflow-with-clone) )의 로컬 복사본이 필요합니다.

```{note}
CLI 도구는 프로젝트에 변경 사항을 빠르게 배포할 수 있는 방법을 제공하지만, 대부분의 배포에는 CI 서비스 및 Liferay Cloud 콘솔을 사용하는 것이 가장 좋습니다. 방법을 알아보려면 [Liferay 클라우드 콘솔을 통해 변경 사항 배포](./deploying-changes-via-the-liferay-cloud-console.md)를 참조하세요.
```

그렇지 않으면 이 단계를 건너뛰고 배포 프로세스를 시작할 수 있습니다:

* [Liferay 서비스에 포털 속성 추가하기](#adding-a-portal-property-to-the-liferay-service)
* [CLI 툴을 통해 새 빌드 배포하기](#deploying-your-new-build-via-the-cli-tool)
* [샘플 배포 확인](#verifying-your-sample-deployment)

## Liferay 서비스에 포털 속성 추가하기

`dev` 환경의 Liferay 서비스에 포털 속성을 추가하고 변경 사항을 커밋하여 배포 수명 주기를 시작하세요:

1. 로컬 마스터 브랜치가 프로젝트 리포지토리의 최신 버전으로 최신 상태인지 확인하세요.

1. 최신 마스터 브랜치를 기반으로 새 작업 브랜치를 만듭니다.

   ```bash
   git checkout -b example-cli-deployment-branch
   ```

1. ``<project>\liferay\configs\dev\`로 이동하여``portal-env.properties` 파일에 다음 속성을 추가합니다:

   ```properties
   web.server.display.node=true
   ```

1. 다음 명령으로 변경 사항을 추가하고 커밋합니다:

   ```bash
   git add .
   ```

   ```bash
   git commit -m "Test - Adding Portal Property"
   ```

## CLI 툴을 통해 새 빌드 배포하기

변경 사항을 커밋한 후에는 다음 단계에 따라 Gradle을 사용하여 Liferay 서비스의 빌드를 생성한 다음 CLI 도구를 사용하여 `dev` 환경에 배포합니다:

1. 터미널을 열고 Liferay 서비스 폴더로 이동합니다.

   ```bash
   cd <project-folder>/liferay
   ```

1. `lcp 로그인`을 실행합니다. 아직 로그인하지 않은 경우 브라우저를 통해 자격 증명을 인증하라는 메시지가 표시됩니다.

1. 다음 명령을 순서대로 실행하여 Liferay 서비스에 대한 Gradle 빌드를 생성합니다:

   ```bash
   ./gradlew clean deploy createDockerfile
   ```

   `lcp deploy` 명령을 실행하기 전에 먼저 Liferay 서비스의 Gradle 빌드를 생성해야 합니다. 다른 서비스에는 로컬 빌드 프로세스가 필요하지 않으므로 백업, CI, 데이터베이스, 검색 및 웹서버 서비스를 직접 배포할 수 있습니다.

1. 빌드를 배포하기 전에 `LCP.json` 파일을 Docker 디렉터리에 복사합니다.

   ```bash
   cp LCP.json build/docker
   ```

   ```bash
   cd build/docker
   ```

   해당 서비스를 배포할 때 서비스의 `LCP.json` 파일이 있는 디렉터리에서 `lcp deploy` 명령을 실행해야 하므로 `LCP.json` 파일을 Docker 디렉터리에 복사해야 합니다.

1. 다음 명령을 실행하여 `dev` 환경에 빌드를 배포합니다:

   ```bash
   lcp deploy --project=<project-name> --environment=dev
   ```

   ![터미널에서 배포 진행 상황을 확인할 수 있습니다.](./deploying-changes-via-the-cli-tool/images/01.png)

   이 과정에서 새 빌드가 프로젝트에 추가되고 `dev` 환경에 배포됩니다. 이 때 Liferay 서비스가 새 포털 속성으로 다시 시작되어야 합니다.

## 샘플 배포 확인

빌드가 성공적으로 배포되고 `dev` 환경의 Liferay 서비스가 **준비됨** 이 되면 다음 단계에 따라 변경 사항을 확인합니다:

1. 프로젝트의 `dev` 환경으로 이동합니다.

1. **웹 서버** 서비스 페이지로 이동하여 해당 URL을 클릭하여 `dev` 환경의 Liferay 인스턴스( `https://webserver-<project-name>-dev.lfr.cloud/`)에 액세스합니다.

   ![웹 서버 URL을 클릭하여 개발 환경의 Liferay 인스턴스에 액세스합니다.](./deploying-changes-via-the-cli-tool/images/02.png)

1. 홈페이지 하단에 웹 서버 노드가 표시되는지 확인합니다.

   ![홈페이지 하단에 웹서버 노드가 표시되는지 확인합니다.](./deploying-changes-via-the-cli-tool/images/03.png)

## 관련 주제

* [명령줄 도구](../reference/command-line-tool.md)
* [Liferay 클라우드 개발 워크플로 개요](./overview-of-the-liferay-cloud-deployment-workflow.md)
* [Liferay 클라우드 콘솔을 통한 변경 사항 배포](./deploying-changes-via-the-liferay-cloud-console.md)
