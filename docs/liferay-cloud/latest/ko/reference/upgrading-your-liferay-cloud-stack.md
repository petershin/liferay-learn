# Liferay 클라우드 스택 업그레이드

Liferay Cloud 버전 4의 새로운 구조를 사용하도록 리포지토리를 업그레이드하면 리포지토리 내에서 Liferay Workspace를 활용하고, 서비스를 최신 상태로 유지하고, 새롭고 업데이트된 다양한 기능을 사용할 수 있습니다.

새 리포지토리 구조로 업그레이드하려면 [업그레이드 스크립트](https://github.com/LiferayCloud/stack-upgrade/archive/release.zip) 사용이 필요합니다.

## 업그레이드 준비 중

Liferay Cloud 스택의 버전 4.xx로 업그레이드하려면 현재 서비스가 3.xx여야 합니다. 현재 버전을 확인하려면 저장소에서 gradle.properties 파일을 찾으십시오. 버전 4.xx로 업그레이드하기 전에 리포지토리는 다음 구조를 따릅니다.

```
repository
├── gradle
├── lcp
├── liferay
├── modules
├── themes
├── build.gradle
├── gradle.properties
├── gradlew
├── gradlew.bat
├── Jenkinsfile
├── README.md
├── README-dxpcloud.md
└── settings.gradle
```

```{important}
리포지토리가 이 구조를 따르지 않는 경우(그리고 루트에 `gradle.properties` 파일 또는 `lcp` 폴더가 없는 경우) 버전 4.xx로의 업그레이드가 이미 완료되었음을 나타냅니다.
```

`gradle.properties` 파일을 열고 Docker 이미지에 대해 지정된 버전을 검토합니다. 예를 들어 다음은 Liferay 서비스의 이미지 버전입니다.

```properties
liferay.workspace.lcp.liferay.image=liferaycloud/liferay-dxp:7.2.10-sp1-fp4-3.0.19
```

Docker 이미지 이름 끝에 있는 숫자는 사용 중인 Liferay Cloud 스택의 버전을 나타냅니다. 이미지 이름이 '3.x.x'로 끝나는지 확인합니다(이 예에서는 liferay-dxp:7.2.10-sp1-fp4- **3.0.19**).

다음으로 Git 리포지토리가 깨끗한 분기에 있는지 확인합니다. 업그레이드 스크립트는 이전에 커밋되지 않은 파일을 커밋하고 `upgrade-workspace`이라는 새 분기를 체크아웃합니다.

```{important}
이미 `upgrade-workspace` 브랜치가 있는 경우 스크립트는 생성을 건너뛰고 현재 브랜치에서 작동합니다.
```

## 업그레이드 스크립트 실행

업그레이드하려면 다음 단계를 수행하십시오.

1. [업그레이드 스크립트](https://github.com/LiferayCloud/stack-upgrade/archive/release.zip) 을 다운로드하고 로컬 Liferay Cloud 리포지토리의 루트에 압축을 풉니다.

    ```bash
    curl -L https://github.com/LiferayCloud/stack-upgrade/archive/release.zip -O
    ```

    ```bash
    unzip -j release.zip stack-upgrade-release/upgrade-workspace.sh -d path/to/project/folder
    ```

1. 업그레이드 스크립트를 실행합니다.

    ```bash
    cd /path/to/project/folder
    ```

    ```bash
    ./upgrade-workspace.sh
    ```

1. 스크립트의 시작 출력을 읽고 프롬프트에 프로젝트 ID를 입력합니다.

    ```
    Press enter to continue:
    Please enter your project id: lfrlearn
    ```

1. 프롬프트에서 Liferay Cloud Console에 인증합니다.

1. 서비스에 사용할 Liferay 버전에 해당하는 번호를 입력하십시오.

    ```
    1) 7.0
    2) 7.1
    3) 7.2
    Please select the Liferay DXP version, which will determine the Liferay CLOUD image set in liferay/LCP.json and the Liferay image set in liferay/gradle.properties: 3
    ```

1. 프롬프트에서 프로젝트 파일에 사용하는 환경의 쉼표로 구분된 목록을 입력합니다( `common`제외).

    ```
    Please enter a comma-delimited list of environments: dev,uat,prd
    ```

    ```{important}
    프로젝트 리포지토리에 파일을 추가하는 Liferay 환경의 이름만 입력하십시오. 인프라(`infra`) 환경을 추가하지 마십시오.
    ```

1. 모든 Liferay 환경에 Elasticsearch 플러그인을 설치하려면 프롬프트에 쉼표로 구분된 이름 목록을 입력하십시오. 그렇지 않으면 Enter 키를 누릅니다.

    ```
    Please enter a comma-delimited list of elasticsearch plugins:
    ```

    이 스크립트는 `.gitignore` 파일에 추가된 업그레이드 스크립트와 함께 리포지토리에 새 분기를 생성하고 체크아웃합니다.

1. 이제 루트 수준에 있는 서비스 폴더를 사용하여 리포지토리의 새 구성을 확인하여 스크립트 실행이 성공했는지 확인합니다.

    ```
    repository
    ├── backup
    ├── build
    ├── ci
    ├── database
    ├── liferay
    ├── search
    ├── webserver
    └── upgrade-workspace.sh
    ```

이제 리포지토리가 `liferay` 폴더가 Liferay Workspace인 구조로 재구성되고 서비스가 4.xx로 업그레이드됩니다.

## CI 서비스의 환경 변수 확인

서비스 스택 업그레이드를 완료한 후 프로젝트의 `ci/LCP.json` 파일 내 환경 변수가 이제 다르게 작동할 수 있습니다. 업그레이드된 프로젝트를 계속하기 전에 `ci` 서비스의 환경 변수가 올바른 구성을 반영하는지 확인하십시오.

### 리포지토리 통합 변수 확인

버전 제어와 프로젝트의 통합을 위해 다음 속성이 올바르게 설정되었는지 확인합니다(이 예에서는 GitHub 사용).

```json
{
    "LCP_CI_SCM_PROVIDER": "github",
    "LCP_CI_SCM_REPOSITORY_OWNER": "OWNER_NAME",
    "LCP_CI_SCM_REPOSITORY_NAME": "PROJECT_NAME",
    "LCP_CI_SCM_TOKEN": "AUTH_TOKEN"
}
```

자세한 내용은 [GitHub](../getting-started/configuring-your-github-repository.md#setting-environment-variables) , [Bitbucket](../getting-started/configuring-your-bitbucket-repository.md#connecting-bitbucket-to-your-jenkins-service) 또는 [GitLab](../getting-started/configuring-your-gitlab-repository.md#connecting-gitlab-to-your-jenkins-service) 통합 참조를 참조하십시오.

### Jenkinsfile 구성 변수 확인

기본 Jenkinsfile이 [이고 프로젝트에서 더 이상 필요하지 않으므로 프로젝트 루트에 있는](./liferay-cloud-project-changes-in-version-4.md#ci-service-changes) 도 업그레이드 후 제거될 수 있습니다. 프로젝트에 기본 Jenkinsfile을 사용하려는 경우 `ci` 서비스 환경 변수가 다음을 반영하는지 확인하십시오.

```json
{
    "LCP_CI_USE_DEFAULT_JENKINSFILE": "true",
    "LCP_CI_SCM_JENKINSFILE_HOOKS_DIR": "ci/",
}
```

```{note}
후크를 사용하여 기본 Jenkinsfile을 확장하려면 `LCP_CI_SCM_JENKINSFILE_HOOKS_DIR` 변수를 정의해야 합니다.
```

기본값을 재정의하기 위해 `ci` 서비스 디렉터리 내에서 고유한 Jenkinsfile을 정의하는 경우 환경 변수가 다음과 같이 표시되는지 확인하십시오.

```json
{
    "LCP_CI_USE_DEFAULT_JENKINSFILE": "false",
    "LCP_CI_SCM_JENKINSFILE_PATH": "ci/Jenkinsfile"
}
```

## 다음 단계

로컬 리포지토리가 변경된 후 `ci` 서비스를 `infra` 환경에 배포합니다. 다른 환경보다 먼저 `infra` 환경에 배포하면 `ci` 서비스에 대한 변경 사항이 먼저 배포되어 추가 변경 사항이 올바르게 배포될 수 있습니다.

`ci` 서비스만 배포하는 가장 빠른 방법은 [CLI 도구를 사용하는 것입니다](../updating-services-in-liferay-paas/deploying-changes-via-the-cli-tool.md). 프로젝트 리포지토리의 `ci/` 폴더로 이동하여 `lcp deploy` 명령을 실행합니다.

```bash
    lcp deploy --project=<project-name> --environment=infra
```

또는 [개발 워크플로](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md) 을 따르고 Liferay Cloud 콘솔에서 빌드로 변경 사항을 배포할 수도 있습니다.

그런 다음 새 서비스 버전 [을 개발 환경에](../updating-services-in-liferay-paas/deploying-changes-via-the-liferay-cloud-console.md) 하거나 새 버전의 Liferay 클라우드 서비스에서 일부 새 기능을 탐색할 수 있습니다. 자세한 내용은 변경 사항에 대한 [설명](./liferay-cloud-project-changes-in-version-4.md) 을 참조하십시오.

## 관련 주제

* [서비스 스택 버전 이해](./understanding-service-stack-versions.md)
