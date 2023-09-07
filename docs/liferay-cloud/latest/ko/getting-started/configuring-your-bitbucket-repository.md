# Bitbucket 리포지토리 구성하기

Liferay Cloud 온보딩 이메일을 받으면 `dxpcloud` 조직에서 호스팅되는 GitHub 리포지토리가 프로비저닝됩니다. 이 리포지토리는 팀의 별도의 비공개 Liferay Cloud 개발 리포지토리를 위한 템플릿이며 일반적으로 영업일 기준 10일 후에 제거됩니다. 사용자는 반드시:

1. 프로비저닝된 리포지토리를 자체 비공개 리포지토리로 이전합니다.
1. 웹훅을 사용하여 개인 리포지토리를 Liferay Cloud의 Jenkins(CI) 서비스와 통합하세요.

프로비저닝된 리포지토리는 GitHub에 있지만, Jenkins 서비스 버전 3.2.0부터 BitBucket 리포지토리로 이전할 수 있습니다. 이 작업은 BitBucket 리포지토리에 대한 관리자 액세스 권한으로 수행해야 합니다.

```{note}
리포지토리의 관리자는 Cloud 콘솔의 프로젝트 관리자와 반드시 같을 필요는 없습니다*.
```

## Jenkins 서비스 준비하기

젠킨스 파일을 사용자 지정한 경우 이 가이드에 따라 [기본 젠킨스 파일](../platform-services/continuous-integration.md#extending-the-default-jenkinsfile) 을 확장하세요.

## Bitbucket 리포지토리 만들기

먼저 새 Bitbucket 리포지토리를 만듭니다.

1. [으로 이동 Bitbucket](https://bitbucket.org) .

1. 사이드바의 검색 아이콘 아래에서 '+' 아이콘을 클릭합니다.

    ![아이콘을 클릭하여 새 BitBucket 리포지토리 만들기를 시작합니다.](./configuring-your-bitbucket-repository/images/01.png)

1. **리포지토리** 를 클릭하여 새 리포지토리 만들기를 시작합니다.

    ![새 리포지토리에 대한 세부 정보를 입력합니다.](./configuring-your-bitbucket-repository/images/02.png)

1. 리포지토리의 이름을 입력합니다.

1. 액세스 수준이 비공개로 설정되어 있는지 확인합니다.

1. 설정 **README 포함?** 을 **아니요** .

1. **리포지토리 만들기** 를 클릭합니다.

## GitHub에서 Bitbucket으로 이전하기

프로비저닝된 GitHub 리포지토리를 자체 Bitbucket 리포지토리로 이전하려면 다음 단계를 따르세요:

1. 프로비저닝된 GitHub 리포지토리를 로컬에 복제합니다:

    `git clone git@github.com:dxpcloud/example.git`

    ```{note}
    다른 공급자와의 작업을 위해 리포지토리를 이미 복제했다면 이 단계를 건너뛰고 동일한 복제본 내에서 작업할 수 있습니다.
    ```

1. 새 Git 리모컨을 추가하고 Bitbucket을 가리킵니다:

    `git remote add bitbucket git@bitbucket.org:example/example.git`

1. 복제된 리포지토리를 새 원격 리포지토리에 푸시합니다:

    `git push bitbucket master`

리포지토리를 만들고, 복제하고, 푸시하는 데 도움이 필요하면 [Bitbucket 설명서](https://confluence.atlassian.com/bitbucket/create-a-git-repository-759857290.html) 를 참조하세요.

## BitBucket용 앱 비밀번호 생성

다음으로, 웹훅에서 Bitbucket으로 인증하고 Jenkins 빌드를 트리거하는 데 사용할 앱 비밀번호를 생성합니다. 앱 비밀번호 **를 생성하는 Bitbucket 사용자는** 리포지토리에 대한 관리자 수준의 액세스 권한이 있어야 합니다.

앱 비밀번호를 생성하려면 다음 단계를 수행합니다:

1. 사용자 설정 페이지의 **액세스 관리** 아래에서 **앱 비밀번호** 를 클릭합니다.

    ![사용자 설정 페이지에서 앱 비밀번호를 클릭합니다.](./configuring-your-bitbucket-repository/images/03.png)

1. **앱 비밀번호 생성** 을 클릭합니다.

    ![나중에 다시 액세스할 수 없는 새 앱 비밀번호를 생성합니다.](./configuring-your-bitbucket-repository/images/04.png)

1. 앱 비밀번호의 레이블을 입력합니다.

1. 앱에 다음 권한을 부여합니다:

    * `풀 리퀘스트 - 읽기, 쓰기` (리포지토리 - 읽기, 쓰기 플래그도 지정해야 함)
    * `Webhooks -  read, write`

1. **만들기** 를 클릭합니다.

1. 앱 비밀번호를 복사합니다(복사하지 않으면 다시 볼 수 없습니다). 이것은 개인 액세스 토큰에 해당하는 BitBucket의 토큰입니다.

```{important}
앱 비밀번호를 생성한 사용자는 `LCP_CI_SCM_USERNAME` 환경 변수에 자신의 사용자 이름을 사용해야 합니다.
```

## 브랜치 유형 및 접두사 확인

Liferay Cloud가 브랜치에 제대로 연결하려면 리포지토리에서 사용 중인 브랜치 접두사의 전체 목록을 제공해야 합니다. 리포지토리에 사용되는 각 브랜치 유형에는 리포지토리 설정에 정의된 고유한 접두사가 있습니다.

[에서 비트버킷 웹사이트](https://bitbucket.org) , 왼쪽 메뉴에서 **리포지토리 설정** &rarr; **브랜치 모델** 을 클릭합니다. 그러면 **브랜칭 모델** 페이지로 이동하여 각 브랜치의 접두사가 나열됩니다. 이러한 접두사 각각을 기록하여 `LCP_CI_SCM_BITBUCKET_BRANCH_PREFIXES` CI 환경 변수에 추가하세요.

![Bitbucket 리포지토리의 기본 브랜치 유형(및 접두사)은 버그픽스/, 기능/, 핫픽스/ 및 릴리스/입니다.](./configuring-your-bitbucket-repository/images/05.png)

## BitBucket을 Jenkins 서비스에 연결하기

마지막으로, 새 리포지토리를 가리키도록 Jenkins 서비스에서 환경 변수를 설정합니다:

1. Liferay Cloud 콘솔에 로그인하고 `인프라` 환경에서 Jenkins 서비스로 이동합니다.

1. **환경 변수** 탭으로 이동합니다.

1. 다음 환경 변수를 구성합니다:

| 이름                                     | 가치          |
|:-------------------------------------- |:----------- |
| `LCP_CI_SCM_PROVIDER`                  | 비트버킷        |
| `LCP_CI_SCM_REPOSITORY_OWNER`          | [리포지토리 소유자] |
| `LCP_CI_SCM_REPOSITORY_NAME`           | [리포지토리 이름]  |
| `LCP_CI_SCM_TOKEN`                     | [앱 비밀번호]    |
| `LCP_CI_SCM_USERNAME`                  | [인증 사용자 이름] |
| `LCP_CI_SCM_BITBUCKET_BRANCH_PREFIXES` | [접두사 목록]    |

'LCP **CI** SCM **USERNAME'을 [앱 비밀번호를 생성한](#geneating-app-password-for-bitbucket) 사용자로 정의하세요. `LCP** CI_SCM_BITBUCKET_BRANCH_PREFIXES`를 공백으로 구분된 모든 [저장소 브랜치에 사용되는 접두사](#checking-branch-types-and-prefixes) 목록으로 정의하세요.

이러한 환경 변수를 업데이트하면 Jenkins 서비스가 다시 시작됩니다. 이제 새 리포지토리에 있는 모든 푸시 브랜치와 풀 리퀘스트가 트리거되어야 합니다.

## 비공개 Bitbucket 서버에 연결하기

비공개 Bitbucket 서버를 사용하려면 Jenkins 서비스에서 추가 환경 변수를 설정해야 합니다:

| 이름                       | 가치            |
|:------------------------ |:------------- |
| `LCP_CI_SCM_SERVER_HOST` | [비공개 호스트 URL] |

`LCP_CI_SCM_SERVER_HOST` 변수를 비공개 Bitbucket 서버의 기본 URL(예: `http://private.bitbucket.org/`)로 설정합니다. 빌드를 생성하고 리포지토리의 브랜치에 연결할 때 CI가 코드베이스를 검색하는 데 사용하는 서버 URL을 설정합니다. 기본적으로 CI는 `https://bitbucket.org/` 을 Bitbucket의 기본 URL로 사용합니다.

## 빌드 확인

푸시 브랜치 및 풀 리퀘스트가 빌드를 트리거하여 Liferay Cloud 콘솔의 **빌드** 탭에서 확인하거나 배포할 수 있습니다. Jenkins 서비스와의 통합을 설정한 후에는 다음 단계로 이러한 빌드를 검증하여 통합이 성공적으로 이루어졌는지 확인하는 것이 좋습니다.

### 푸시된 브랜치에서 빌드 확인

새 Git 푸시가 Jenkins 빌드를 트리거하는지 확인합니다:

1. 리포지토리를 변경(예: 파일 추가)한 다음 브랜치에 커밋합니다:

    ```bash
    git commit -m "Add file to test builds"
    ```

1. 브랜치를 BitBucket으로 밀어 올립니다:

    ```bash
    git push bitbucket branch-name
    ```

1. Liferay Cloud 콘솔에서 **빌드** 페이지로 이동합니다.

1. **빌드** 페이지에서 푸시된 브랜치에 대한 빌드가 표시되는지 확인합니다.

### 풀 리퀘스트에서 빌드 확인

새 풀 리퀘스트가 Jenkins 빌드를 트리거하는지 확인합니다:

1. 모든 브랜치에서 `develop` 브랜치로 풀 리퀘스트를 생성합니다.

1. 풀 리퀘스트에 대한 새 빌드가 생성되었는지 확인합니다.

1. Liferay Cloud 콘솔에서 **빌드** 페이지로 이동합니다.

1. 브랜치에 대한 링크를 클릭하고 적절한 빌드에서 커밋하세요.

    ![빌드 페이지에서 브랜치 링크를 확인하고 빌드에 대한 커밋을 합니다.](./configuring-your-bitbucket-repository/images/06.png)

1. 링크가 올바른 BitBucket 페이지로 리디렉션되는지 확인합니다.

## 관련 주제

* [GitHub 리포지토리 구성하기](./configuring-your-github-repository.md)
* [GitLab 리포지토리 구성하기](./configuring-your-gitlab-repository.md)
