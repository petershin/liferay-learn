# GitHub 리포지토리 설정

Liferay Cloud 계정이 프로비저닝된 후 첫 번째 작업은 관리자로서 구성을 배포할 수 있도록 프로젝트의 Git 저장소를 설정하는 것입니다. Marcus는 Delectable Bonsai 프로젝트의 관리자로서 이 절차를 따라야 합니다.

저장소를 설정하고 첫 번째 푸시를 완료하여 작동하는지 확인하세요.

```{note}
이 과정을 계속하려면 [CLI 도구가 설치되어 있어야 합니다](../setting-up-your-cloud-project/using-the-cli-tool.md#install-the-cli-tool) .
```

## GitHub 리포지토리 포크 및 복제

먼저 Git을 설치하고 GitHub 저장소의 자체 포크를 만들어야 합니다. Delectable Bonsai 프로젝트의 경우 Marcus는 초기 설정을 위해 이 모든 단계를 따라야 하지만 Kyle은 기여자로서 마지막 두 단계(복제 및 원격 저장소 추가)만 수행하면 됩니다.

새 빌드를 위해 Liferay Cloud 프로젝트를 포크로 전송합니다.

1. [로컬 시스템에 Git](https://docs.github.com/en/get-started/quickstart/set-up-git) 설정합니다.

1. GitHub에서 프로비저닝된 리포지토리 페이지를 엽니다.

   ```{tip}
   프로젝트 저장소에 대한 링크가 없는 경우 Liferay Cloud 콘솔의 *빌드* 페이지로 이동하여 가장 최근 빌드에 대한 *분기* 아래의 링크를 클릭하세요. 이 링크는 프로비저닝된 저장소의 특정 분기를 가리킵니다.
   ```

1. [저장소의 자체 포크](https://docs.github.com/en/get-started/quickstart/fork-a-repo) 만듭니다.

1. [로컬 시스템에서 생성한](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) 를 복제합니다.

1. Git이 설치된 명령 프롬프트에서 포크를 (업스트림) [원격 저장소](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/configuring-a-remote-repository-for-a-fork) 로 추가합니다.

이제 Liferay Cloud 프로젝트 구조를 로컬 및 GitHub에서 소유한 포크된 저장소가 생겼습니다.

## 웹훅 구성

다음으로 Liferay Cloud가 저장소에 액세스할 수 있도록 웹후크를 구성합니다.

1. GitHub 웹사이트에서 저장소의 설정 페이지로 이동하여 **Webhooks** 클릭하세요.

   ![GitHub 저장소의 설정 페이지를 통해 웹후크를 구성하세요.](./setting-up-the-github-repository/images/02.png)

1. **웹훅 추가** 클릭하세요.

1. **페이로드 URL** 필드에 라이프레이 클라우드 `인프라` 환경의 CI 서비스 도메인을 마지막에 `github-webhook/`로 추가합니다(예: `delectablebonsai` 프로젝트의 경우 `https://ci-delectablebonsai-infra.lfr.cloud/github-webhook/`).

1. **콘텐츠 유형** 드롭다운 메뉴에서 **application/json** 선택합니다.

1. **SSL 확인 활성화** 선택되어 있는지 확인하십시오.

   ![새 웹후크에 대한 양식을 작성하고 이를 트리거하는 이벤트를 선택하여 완료합니다.](./setting-up-the-github-repository/images/03.png)

1. **미만 이 웹훅을 트리거할 이벤트는 무엇입니까?** , 선택 **개별 이벤트를 선택하겠습니다** .

1. 나타나는 이벤트 목록에서 **Pushes** 및 **Pull Requests** 선택합니다.

   ![Liferay Cloud 프로젝트에서 빌드를 트리거하도록 푸시 및 풀 요청을 선택하세요.](./setting-up-the-github-repository/images/04.png)

1. **활성** 확인란이 선택되어 있는지 확인하세요.

1. **웹훅 추가** 클릭하세요.

이제 Liferay Cloud가 저장소에 액세스할 수 있습니다.

## Liferay Cloud를 개인 저장소로 지정

마지막으로 개인 저장소와 작동하도록 `인프라` 환경에서 CI 서비스를 구성합니다.

1. Liferay Cloud 콘솔에 로그인합니다.

1. `infra` 환경으로 이동하여 **Services** 을 클릭합니다.

1. CI 서비스를 선택합니다.

1. 환경 변수 탭에서 다음 환경 변수의 값을 추가합니다.

    | **이름** | **가치** |
    |:----------------------------- |:------------ |
    | `LCP_CI_SCM_PROVIDER`         | `github`     |
    | `LCP_CI_SCM_REPOSITORY_NAME`  | [저장소 이름]     |
    | `LCP_CI_SCM_REPOSITORY_OWNER` | [저장소 소유자 계정] |
    | `LCP_CI_SCM_TOKEN`            | [개인 액세스 토큰]  |

    **repo** 및 **admin:repo_hook** 카테고리에서 모든 권한이 확인된 [개인 액세스 토큰](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) 사용하십시오.

CI 서비스가 다시 시작되면 개인 저장소에 대한 푸시 또는 풀 요청이 Liferay Cloud 프로젝트에서 새 빌드를 트리거합니다.

다음: 자신의 [사용자 정의 도메인](./configuring-your-sites-domain.md)을 사용하도록 사이트를 구성하십시오.

## 관련 개념

* [GitHub 리포지토리 구성](https://learn.liferay.com/w/liferay-cloud/getting-started/configuring-your-github-repository)
* [명령줄 도구](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool)
* [Bitbucket 리포지토리 구성하기](https://learn.liferay.com/w/liferay-cloud/getting-started/configuring-your-bitbucket-repository)
* [GitLab 리포지토리 구성하기](https://learn.liferay.com/w/liferay-cloud/getting-started/configuring-your-gitlab-repository)
