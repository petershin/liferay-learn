# GitLab 리포지토리 구성

Liferay Cloud 온보딩 이메일을 받으면 `dxpcloud` 조직에서 호스팅되는 GitHub 리포지토리가 프로비저닝됩니다. 이 리포지토리는 팀의 별도 개인 Liferay Cloud 개발 리포지토리용 템플릿이며 일반적으로 영업일 기준 10일 후에 제거됩니다. 사용자는 다음을 수행해야 합니다.

1. 프로비저닝된 리포지토리를 자체 프라이빗 리포지토리로 전송합니다.
1. Webhook을 사용하여 개인 저장소를 Liferay Cloud의 Jenkins(CI) 서비스와 통합합니다.

프로비저닝된 리포지토리는 GitHub에 있지만 Jenkins 서비스 버전 3.2.0부터 GitLab 리포지토리로 전송할 수 있습니다. 이 작업은 GitLab 리포지토리에 대한 관리 액세스 권한으로 수행해야 합니다.

```{note}
저장소의 관리자는 Cloud Console의 프로젝트 관리자와 *반드시 동일할 필요는 없습니다*.
```

## Jenkins 서비스 준비

Liferay Cloud 인스턴스에서 [버전 4.xx 서비스](../reference/understanding-service-stack-versions.md) 을 이미 사용 중인 경우 Jenkins 서비스가 이미 GitLab과 호환됩니다. 업그레이드에 대한 자세한 내용은 [Liferay Cloud Stack 업그레이드](../reference/upgrading-your-liferay-cloud-stack.md) 을 참조하십시오.

버전 3.xx 서비스를 사용하는 경우 `ci` 서비스에 대해 `LCP.json` 을 확인하고 다음 Jenkins 서비스 이상을 실행 중인지 확인하십시오.

```
liferaycloud/jenkins:2.222.1-3.2.0
```

그렇지 않은 경우 다음 단계에 따라 업그레이드하십시오.

1. Jenkins 서비스를 버전 `liferaycloud/jenkins:2.222.1-3.2.0`로 업데이트합니다.

1. 루트 폴더에 있는 `Jenkinsfile` 을 삭제합니다.

1. 다음 환경 변수를 추가합니다. `LCP_CI_USE_DEFAULT_JENKINSFILE: true`.

1. Jenkins 서비스를 배포합니다.

```{note}
Jenkinsfile을 사용자 지정한 경우 이 가이드에 따라 [기본 Jenkinsfile 확장](../platform-services/continuous-integration.md#extending-the-default-jenkinsfile) _.
```

## GitLab 리포지토리 생성

먼저 새 GitLab 저장소를 만듭니다.

1. [GitLab](https://gitlab.com) 로 이동합니다.

1. **새 프로젝트** 을 클릭합니다.

    ![새 프로젝트를 클릭하여 새 GitLab 리포지토리 생성을 시작합니다.](./configuring-your-gitlab-repository/images/01.png)

1. 프로젝트 슬러그(URL의 리포지토리 이름)를 제공합니다.

    ![새 리포지토리에 대한 세부 정보를 입력합니다.](./configuring-your-gitlab-repository/images/02.png)

1. 가시성 수준을 비공개로 구성합니다(무료 사용자는 비공개 저장소가 무제한임).

1. **README** 로 리포지토리 초기화가 선택 취소되어 있는지 확인합니다.

1. **프로젝트 생성** 을 클릭합니다.

## GitHub에서 GitLab으로 전송

프로비저닝된 GitHub 리포지토리를 자신의 GitLab 리포지토리로 전송하려면 다음 단계를 따르세요.

1. 프로비저닝된 GitHub 리포지토리를 로컬로 복제합니다.

    `git clone git@github.com:dxpcloud/example.git`

    ```{note}
    다른 공급자와 작업하기 위해 리포지토리를 이미 복제한 경우 이 단계를 건너뛰고 동일한 복제 내에서 작업할 수 있습니다.
    ```

1. 새 Git 원격을 추가하고 GitLab을 가리킵니다.

    `git remote add gitlab git@gitlab.com:USERNAME/REPOSITORYNAME.git`

1. 복제된 리포지토리를 새 원격 리포지토리로 푸시합니다.

    `git push gitlab master`

리포지토리 생성, 복제 및 푸시에 도움이 필요한 경우 [GitLab 문서](https://docs.gitlab.com/ee/gitlab-basics/start-using-git.html) 를 참조하십시오.

## GitLab용 액세스 토큰 생성

다음으로 Webhook에서 Jenkins 빌드를 트리거하는 데 사용할 액세스 토큰을 만듭니다.

1. [개인 액세스 토큰 페이지](https://gitlab.com/profile/personal_access_tokens) 로 이동합니다.

    ![나중에 다시 액세스할 수 없는 GitLab용 개인 액세스 토큰을 생성합니다.](./configuring-your-gitlab-repository/images/03.png)

1. 이 액세스 토큰의 이름과 만료 날짜를 제공하십시오.

1. 다음 권한을 갖도록 액세스 토큰을 구성합니다.

    * API
    * 읽기 저장소
    * write_repository

1. **개인 액세스 토큰 만들기** 을 클릭합니다.

1. 액세스 토큰을 복사하고 어딘가에 저장합니다(그렇지 않으면 다시 표시되지 않음).

## Jenkins 서비스에 GitLab 연결

마지막으로 Jenkins 서비스의 환경 변수가 새 리포지토리를 가리키도록 설정합니다.

1. Liferay Cloud Console에 로그인하고 `infra` 환경에서 Jenkins 서비스로 이동합니다.

1. **환경 변수** 탭으로 이동합니다.

1. 다음 환경 변수를 구성합니다.

| 이름                            | 가치             |
|:----------------------------- |:-------------- |
| `LCP_CI_SCM_PROVIDER`         | 깃랩             |
| `LCP_CI_SCM_REPOSITORY_OWNER` | [repo_owner]   |
| `LCP_CI_SCM_REPOSITORY_NAME`  | [repo_name]    |
| `LCP_CI_SCM_TOKEN`            | [access_token] |

이러한 환경 변수를 업데이트한 후 Jenkins 서비스가 다시 시작됩니다. 새 리포지토리 트리거 빌드에서 푸시된 브랜치 및 풀 요청이 있으면 빌드됩니다.

## 개인 GitLab 서버에 연결

비공개 GitLab 서버를 사용하려면 Jenkins 서비스에서 추가 환경 변수를 설정해야 합니다.

| 이름                       | 가치            |
|:------------------------ |:------------- |
| `LCP_CI_SCM_SERVER_HOST` | [비공개 호스트 URL] |

`LCP_CI_SCM_SERVER_HOST` 변수를 개인 GitLab 서버의 기본 URL로 설정합니다(예: `http://private.gitlab.server.com/`). 빌드를 생성하고 리포지토리의 브랜치에 연결할 때 CI가 코드 베이스를 검색하는 데 사용하는 서버 URL을 설정합니다. 기본적으로 CI는 `https://gitlab.com/` 을 GitLab의 기본 URL로 사용합니다.

## 추가 GitLab Webhook 구성

Liferay Cloud의 Jenkins 서비스는 선택한 git SCM 공급자에 대한 웹후크를 생성합니다. 그러나 기본 항목만 생성합니다. GitLab의 기본 웹후크는 GitHub 및 BitBucket의 웹후크 기능과 일치하도록 추가 구성이 필요합니다.

1. GitLab 저장소로 이동합니다.

1. **Settings** 로 이동하여 **Webhooks** 을 선택합니다.

1. **Project Hooks** 아래에 생성된 웹후크가 나열되는지 확인합니다.

1. CI webhook에 대한 **편집** 버튼을 클릭합니다.

    ![리포지토리에 대해 자동으로 생성된 웹후크를 편집합니다.](./configuring-your-gitlab-repository/images/04.png)

1. **태그 푸시 이벤트** 및 **댓글** 을 선택 취소합니다.

1. 체크 **SSL 확인 활성화** .

1. **변경 사항 저장** 을 클릭합니다.

## 빌드 확인

푸시된 분기 및 병합 요청(GitLab의 풀 요청에 해당)은 Liferay Cloud Console의 **빌드** 탭에서 보거나 배포할 수 있는 빌드를 트리거합니다. Jenkins 서비스와의 통합을 설정한 후 좋은 다음 단계는 이러한 빌드를 확인하여 통합이 성공했는지 확인하는 것입니다.

### 푸시된 분기에서 빌드 확인

새 Git 푸시가 Jenkins 빌드를 트리거하는지 확인합니다.

1. 저장소를 변경(예: 파일 추가)한 다음 분기에 커밋합니다.

    ```bash
    git commit -m "Add file to test builds"
    ```

1. 분기를 GitLab으로 푸시합니다.

    ```bash
    git push gitlab branch-name
    ```

1. Liferay Cloud Console에서 **빌드** 페이지로 이동합니다.

1. 빌드가 **빌드** 페이지에서 푸시된 브랜치에 대해 표시되는지 확인합니다.

### 병합 요청에서 빌드 확인

새 병합 요청이 Jenkins 빌드를 트리거하는지 확인합니다.

1. 모든 브랜치에서 `개발` 브랜치로 병합 요청을 생성합니다.

1. 병합 요청에 대해 새 빌드가 생성되었는지 확인합니다.

1. Liferay Cloud Console에서 **빌드** 페이지로 이동합니다.

1. 브랜치에 대한 링크를 클릭하고 적절한 빌드에서 커밋합니다.

    ![빌드 페이지에서 브랜치 링크와 빌드 커밋을 확인하세요.](./configuring-your-gitlab-repository/images/05.png)

1. 링크가 올바른 GitLab 페이지로 리디렉션되는지 확인합니다.

## 관련 주제

* [BitBucket 리포지토리 구성](./configuring-your-bitbucket-repository.md)
* [GitHub 리포지토리 구성](./configuring-your-github-repository.md)
