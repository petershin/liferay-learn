# CLI 도구를 통해 변경 사항 배포

CLI 도구를 사용하면 Jenkins 빌드를 트리거하거나 Liferay Cloud Console을 사용하지 않고 로컬 프로젝트 변경 사항을 직접 배포할 수 있습니다. 이 자습서는 포털 속성을 Liferay 서비스에 추가하고 CLI 도구를 사용하여 `dev` 에 배포하는 과정을 안내합니다.

시작하려면 먼저 [CLI 도구](../reference/command-line-tool.md) 가 설치되어 있고 사용할 준비가 되어 있어야 하며 프로젝트 Git 리포지토리의 로컬 복사본(예: [GitHub](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository), [Bitbucket](https://confluence.atlassian.com/bitbucketserver/clone-a-repository-790632786.html), [GitLab](https://docs.gitlab.com/ee/university/training/topics/getting_started.html#instantiate-workflow-with-clone))이 필요합니다.

```{note}
CLI 도구는 프로젝트에 변경 사항을 배포하는 빠른 방법을 제공하지만 대부분의 배포에는 CI 서비스 및 Liferay Cloud 콘솔을 사용하는 것이 가장 좋습니다. 자세한 방법은 [Liferay Cloud Console을 통해 변경 사항 배포](./deploying-changes-via-the-liferay-cloud-console.md)를 참조하십시오.
```

프로젝트에서 버전 `3.xx` 서비스를 사용하는 경우 CLI 도구로 변경 사항을 배포하기 전에</code>
 `</a> 파일을 준비해야 합니다.</p>

<p spaces-before="0">그렇지 않으면 이 단계를 건너뛰고 배포 프로세스를 시작할 수 있습니다.</p>

* [Adding a Portal Property to the Liferay Service](#adding-a-portal-property-to-the-liferay-service)
* [Deploying Your New Build via the CLI Tool](#deploying-your-new-build-via-the-cli-tool)
* [Verifying Your Sample Deployment](#verifying-your-sample-deployment)

<h2 spaces-before="0">프로젝트 버전 3에서 LCP.json 파일 준비</h2>

<p spaces-before="0">프로젝트에서 버전 <code>3.xx` 서비스를 사용하지 않는 경우 이 단계를 건너뛰고 [변경을 시작하십시오](#adding-a-portal-property-to-the-liferay-service).</p> 

그렇지 않으면 리포지토리의 루트에서 `gradle.properties` 을 열고 다음 속성과 같이 각 서비스에 대한 Docker 이미지 버전의 속성을 찾습니다.

```properties
liferay.workspace.lcp.backup.image=liferaycloud/backup:3.2.1
liferay.workspace.lcp.database.image=liferaycloud/database:3.2.1
liferay.workspace.lcp.search.image=liferaycloud/elasticsearch:6.1.4-3.0.3
liferay.workspace.lcp.liferay.image=liferaycloud/liferay-dxp:7.2.10-ga1-3.0.10
liferay.workspace.lcp.webserver.image=liferaycloud/nginx:1.14.2-3.1.1
liferay.workspace.lcp.jenkins.image=liferaycloud/jenkins:2.176.1-3.1.1
```

이러한 각 속성에 대해 값을 복사하고 해당 서비스의 `LCP.json` 파일에서 `이미지` 속성에 대한 자리 표시자 값을 대체하는 데 사용합니다. 이렇게 하면 CLI가 `lcp` 디렉터리 내에서 검색할 때 올바른 Docker 이미지를 사용할 수 있습니다.

예를 들어 `liferay.workspace.lcp.search.image` 속성의 값을 다음 줄에 대한 `lcp/search/LCP.json` 의 새 값으로 사용합니다.

```properties
"image": "@liferay.workspace.lcp.search.image@",
```

```{note}
`liferay.workspace.lcp.jenkins.image` 속성은 `ci` 서비스에 해당합니다.
```

## Liferay 서비스에 포털 속성 추가

`dev` 환경의 Liferay 서비스에 포털 속성을 추가하고 변경 사항을 커밋하여 배포 수명 주기를 시작합니다.

1. 프로젝트 리포지토리의 최신 버전으로 로컬 마스터 분기가 최신 상태인지 확인하십시오.

1. 최신 마스터 브랜치를 기반으로 새 작업 브랜치를 생성합니다. 

   ```bash
   git checkout -b example-cli-deployment-branch
   ```

1. ``<project>\liferay\configs\dev\`로 이동하고 다음 속성을``Portal-env.properties` 파일에 추가합니다. 

   ```properties
   web.server.display.node=true
   ```

   ```{note}
   버전 3.xx 서비스를 사용하는 경우 적절한 폴더 경로는 `lcp/liferay/deploy/dev`입니다. 디렉토리 구조의 차이점에 대한 자세한 내용은 [버전 4의 Liferay Cloud 프로젝트 변경 사항](../reference/liferay-cloud-project-changes-in-version-4.md) 및 [서비스 스택 버전 이해]를 참조하십시오. (../reference/understanding-service-stack-versions.md)에서 서비스 버전을 확인하는 방법을 알아보세요.
   ```

1. 다음 명령을 사용하여 변경 사항을 추가하고 커밋합니다. 
   

   ```bash
   git add .
   ```

   ```bash
   git commit -m "Test - Adding Portal Property"
   ```

## CLI 도구를 통해 새 빌드 배포

변경 사항을 커밋했으면 다음 단계에 따라 Gradle로 Liferay 서비스 빌드를 만든 다음 CLI 도구를 사용하여 `dev` 환경에 배포합니다.

1. 터미널을 열고 Liferay 서비스 폴더로 이동합니다. 

   ```bash
   cd <project-folder>/liferay
   ```

   ```{important}
   버전 3.xx 서비스를 사용하는 경우 CLI 도구를 실행하기 전에 리포지토리의 `lcp` 디렉토리로 이동해야 디렉토리를 통과하여 서비스의 `LCP.json` 파일을 찾을 수 있습니다.
   ```

1. `lcp 로그인`을 실행합니다. 아직 로그인하지 않은 경우 브라우저를 통해 자격 증명을 인증하라는 메시지가 표시됩니다.

1. 다음 명령을 순서대로 실행하여 Liferay 서비스용 Gradle 빌드를 생성합니다. 

   ```bash
   ./gradlew clean deploy createDockerfile
   ```

   ```{note}
   프로젝트에서 버전 `3.xx` 서비스를 사용하는 경우 대신 `lcp/liferay` 디렉토리에서 `./gradlew distLiferayCloud`를 실행해야 합니다.
   ```

`lcp deploy` 명령을 실행하기 전에 먼저 Liferay 서비스의 Gradle 빌드를 생성해야 합니다. 다른 서비스에 대한 로컬 빌드 프로세스가 필요하지 않으므로 백업, CI, 데이터베이스, 검색 및 웹 서버 서비스를 직접 배포할 수 있습니다.

1. 빌드를 배포하기 전에 `LCP.json` 파일을 Docker 디렉터리에 복사합니다. 

   ```bash
   cp LCP.json build/docker
   ```

   ```bash
   cd build/docker
   ```

해당 서비스를 배포할 때 서비스의 `LCP.json` 파일이 있는 디렉터리에서 `lcp deploy` 명령을 실행해야 하므로 `LCP.json` 파일을 Docker 디렉터리에 복사해야 합니다.

1. 다음 명령을 실행하여 빌드를 `dev` 환경에 배포합니다. 

   ```bash
   lcp deploy --project=<project-name> --environment=dev
   ```


![터미널에서 배포 진행 상황을 볼 수 있습니다.](./deploying-changes-via-the-cli-tool/images/01.png)

이 프로세스 중에 새 빌드가 프로젝트에 추가되고 `dev` 환경에 배포됩니다. 이때 Liferay 서비스는 새 포털 속성으로 다시 시작해야 합니다.

## 샘플 배포 확인

빌드가 성공적으로 배포되고 `dev` 환경의 Liferay 서비스가 *준비*되면 다음 단계에 따라 변경 사항을 확인하십시오.

1. 프로젝트의 `dev` 환경으로 이동합니다.

1. *Web Server* 서비스 페이지로 이동하고 해당 URL을 클릭하여 `dev` 환경의 Liferay 인스턴스에 액세스합니다: `https://webserver-<project-name>-dev.lfr.cloud/`.
   
   ![개발 환경의 Liferay 인스턴스에 액세스하려면 웹 서버 URL을 클릭하십시오.](./deploying-changes-via-the-cli-tool/images/02.png)

1. 홈 페이지 하단에 웹 서버 노드가 표시되는지 확인합니다.
   
   ![홈 페이지 하단에 웹 서버 노드가 표시되는지 확인합니다.](./deploying-changes-via-the-cli-tool/images/03.png)

## 추가 정보

* [명령줄 도구](../reference/command-line-tool.md)
* [Liferay 클라우드 개발 워크플로 개요](./overview-of-the-liferay-cloud-deployment-workflow.md)
* [Liferay Cloud Console을 통해 변경 사항 배포](./deploying-changes-via-the-liferay-cloud-console.md)
