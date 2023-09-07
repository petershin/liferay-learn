# GitLab 리포지토리 구성하기

Liferay Cloud 온보딩 이메일을 받으면 `dxpcloud` 조직에서 호스팅되는 GitHub 리포지토리가 프로비저닝됩니다. 이 리포지토리는 팀의 별도의 비공개 Liferay Cloud 개발 리포지토리를 위한 템플릿이며 일반적으로 영업일 기준 10일 후에 제거됩니다. 사용자는 반드시:

1. 프로비저닝된 리포지토리를 자체 비공개 리포지토리로 이전합니다.
1. 웹훅을 사용하여 개인 리포지토리를 Liferay Cloud의 Jenkins(CI) 서비스와 통합하세요.

프로비저닝된 리포지토리는 GitHub에 있지만 Jenkins 서비스 버전 3.2.0부터 GitLab 리포지토리로 이전할 수 있습니다. 이 작업은 GitLab 리포지토리에 대한 관리자 액세스 권한으로 수행해야 합니다.

```{note}
리포지토리의 관리자는 Cloud 콘솔의 프로젝트 관리자와 반드시 같을 필요는 없습니다*.
```

## Jenkins 서비스 준비하기

젠킨스 파일을 사용자 지정한 경우 이 가이드에 따라 [기본 젠킨스 파일](../platform-services/continuous-integration.md#extending-the-default-jenkinsfile) 을 확장하세요.

## GitLab 리포지토리 만들기

먼저 새 GitLab 리포지토리를 생성합니다:

1. [GitLab](https://gitlab.com) 으로 이동합니다.

1. **새 프로젝트** 를 클릭합니다.

    ![새 프로젝트를 클릭하여 새 GitLab 리포지토리 만들기를 시작합니다.](./configuring-your-gitlab-repository/images/01.png)

1. 프로젝트 슬러그(URL의 리포지토리 이름)를 입력합니다.

    ![새 리포지토리에 대한 세부 정보를 입력합니다.](./configuring-your-gitlab-repository/images/02.png)

1. 공개 수준을 비공개로 구성합니다(무료 사용자는 무제한 비공개 리포지토리를 사용할 수 있습니다).

1. **리포지토리 초기화(README**)가 선택 취소되어 있는지 확인합니다.

1. **프로젝트 만들기** 를 클릭합니다.

## GitHub에서 GitLab으로 이전하기

다음 단계에 따라 프로비저닝된 GitHub 리포지토리를 자체 GitLab 리포지토리로 이전하세요:

1. 프로비저닝된 GitHub 리포지토리를 로컬에 복제합니다:

    `git clone git@github.com:dxpcloud/example.git`

    ```{note}
    다른 공급자와의 작업을 위해 리포지토리를 이미 복제했다면 이 단계를 건너뛰고 동일한 복제본 내에서 작업할 수 있습니다.
    ```

1. 새 Git 리모컨을 추가하고 GitLab을 가리킵니다:

    `git remote add gitlab git@gitlab.com:USERNAME/REPOSITORYNAME.git`

1. 복제된 리포지토리를 새 원격 리포지토리에 푸시합니다:

    `git push gitlab master`

리포지토리 생성, 복제 및 푸시하는 데 도움이 필요하면 [GitLab의 문서](https://docs.gitlab.com/ee/gitlab-basics/start-using-git.html) 를 참조하세요.

## GitLab용 액세스 토큰 생성하기

그런 다음 웹훅에서 Jenkins 빌드를 트리거하는 데 사용할 액세스 토큰을 생성합니다:

1. [개인 액세스 토큰 페이지](https://gitlab.com/profile/personal_access_tokens) 로 이동합니다.

    ![나중에 다시 액세스할 수 없는 GitLab용 개인 액세스 토큰을 만듭니다.](./configuring-your-gitlab-repository/images/03.png)

1. 이 액세스 토큰의 이름과 만료일을 입력합니다.

1. 액세스 토큰이 다음 권한을 갖도록 구성합니다:

    * api
    * 읽기_저장소
    * 쓰기_저장소

1. **개인 액세스 토큰 만들기** 를 클릭합니다.

1. 액세스 토큰을 복사하여 어딘가에 저장하세요(그렇지 않으면 다시 볼 수 없습니다).

## 젠킨스 서비스에 GitLab 연결하기

마지막으로, 새 리포지토리를 가리키도록 Jenkins 서비스에서 환경 변수를 설정합니다:

1. Liferay Cloud 콘솔에 로그인하고 `인프라` 환경에서 Jenkins 서비스로 이동합니다.

1. **환경 변수** 탭으로 이동합니다.

1. 다음 환경 변수를 구성합니다:

| 이름                            | 가치             |
|:----------------------------- |:-------------- |
| `LCP_CI_SCM_PROVIDER`         | gitlab         |
| `LCP_CI_SCM_REPOSITORY_OWNER` | [repo_owner]   |
| `LCP_CI_SCM_REPOSITORY_NAME`  | [repo_name]    |
| `LCP_CI_SCM_TOKEN`            | [access_token] |

이러한 환경 변수를 업데이트하면 Jenkins 서비스가 다시 시작됩니다. 새 리포지토리에 푸시된 브랜치 및 풀 리퀘스트가 있으면 빌드가 트리거됩니다.

## 비공개 GitLab 서버에 연결하기

비공개 GitLab 서버를 사용하려면 Jenkins 서비스에서 추가 환경 변수를 설정해야 합니다:

| 이름                       | 가치            |
|:------------------------ |:------------- |
| `LCP_CI_SCM_SERVER_HOST` | [비공개 호스트 URL] |

`LCP_CI_SCM_SERVER_HOST` 변수를 비공개 GitLab 서버의 기본 URL(예: `http://private.gitlab.server.com/`)로 설정합니다. 빌드를 생성하고 리포지토리의 브랜치에 연결할 때 CI가 코드베이스를 검색하는 데 사용하는 서버 URL을 설정합니다. 기본적으로 CI는 `https://gitlab.com/` 을 GitLab의 기본 URL로 사용합니다.

## 추가 GitLab 웹훅 구성

Liferay Cloud의 Jenkins 서비스는 선택한 git SCM 공급자에 대한 웹훅을 생성하지만 기본 웹훅만 생성합니다. GitLab의 기본 웹훅을 사용하려면 GitHub 및 BitBucket의 웹훅 기능과 일치하도록 추가 구성이 필요합니다.

1. GitLab 리포지토리로 이동합니다.

1. **설정** 으로 이동하여 **웹훅** 을 선택합니다.

1. **프로젝트 후크** 에서 생성된 웹후크가 나열되어 있는지 확인합니다.

1. CI 웹훅의 **수정** 버튼을 클릭합니다.

    ![리포지토리에 대해 자동으로 생성된 웹훅을 편집합니다.](./configuring-your-gitlab-repository/images/04.png)

1. **태그 푸시 이벤트** 및 **댓글** 을 선택 취소합니다.

1. 확인 **SSL 확인 활성화** .

1. **변경 사항 저장** 을 클릭합니다.

## 빌드 확인

푸시 브랜치 및 병합 요청(GitLab의 풀 리퀘스트에 해당)은 Liferay Cloud 콘솔의 **빌드** 탭에서 확인하거나 배포할 수 있는 빌드를 트리거합니다. Jenkins 서비스와의 통합을 설정한 후에는 다음 단계로 이러한 빌드를 검증하여 통합이 성공적으로 이루어졌는지 확인하는 것이 좋습니다.

### 푸시된 브랜치에서 빌드 확인

새 Git 푸시가 Jenkins 빌드를 트리거하는지 확인합니다:

1. 리포지토리를 변경(예: 파일 추가)한 다음 브랜치에 커밋합니다:

    ```bash
    git commit -m "Add file to test builds"
    ```

1. 브랜치를 GitLab으로 푸시합니다:

    ```bash
    git push gitlab branch-name
    ```

1. Liferay Cloud 콘솔에서 **빌드** 페이지로 이동합니다.

1. **빌드** 페이지에서 푸시된 브랜치에 대한 빌드가 표시되는지 확인합니다.

### 병합 요청에서 빌드 확인

새 병합 요청이 Jenkins 빌드를 트리거하는지 확인합니다:

1. 모든 브랜치에서 `develop` 브랜치로 병합 요청을 생성합니다.

1. 병합 요청에 대한 새 빌드가 생성되었는지 확인합니다.

1. Liferay Cloud 콘솔에서 **빌드** 페이지로 이동합니다.

1. 브랜치에 대한 링크를 클릭하고 적절한 빌드에서 커밋하세요.

    ![빌드 페이지에서 브랜치 링크를 확인하고 빌드에 대한 커밋을 합니다.](./configuring-your-gitlab-repository/images/05.png)

1. 링크가 올바른 GitLab 페이지로 리디렉션되는지 확인합니다.

## 관련 주제

* [BitBucket 리포지토리 구성하기](./configuring-your-bitbucket-repository.md)
* [GitHub 리포지토리 구성하기](./configuring-your-github-repository.md)
