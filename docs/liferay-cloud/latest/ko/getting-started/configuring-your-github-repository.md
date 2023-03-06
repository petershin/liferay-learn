# GitHub 리포지토리 구성

Liferay Cloud 온보딩 이메일을 받으면 `dxpcloud` 조직에서 호스팅되는 GitHub 리포지토리가 프로비저닝됩니다. 이 리포지토리는 팀의 별도 개인 Liferay Cloud 개발 리포지토리용 템플릿이며 일반적으로 영업일 기준 10일 후에 제거됩니다. 사용자는 다음을 수행해야 합니다.

1. 프로비저닝된 리포지토리를 자체 프라이빗 GitHub 리포지토리로 전송합니다.

1. Webhook을 사용하여 개인 저장소를 Liferay Cloud의 Jenkins(CI) 서비스와 통합합니다.

```{note}
조직 계정을 사용하는 경우 리포지토리를 조직으로 이전하려면 관리 권한이 있어야 합니다. 저장소의 관리자는 Cloud Console의 프로젝트 관리자와 *반드시 동일할 필요는 없습니다*.
```

## 리포지토리 전송

프로비저닝된 리포지토리를 자신의 GitHub 리포지토리로 전송하려면 다음 단계를 따르세요.

1. 새 비공개 GitHub 리포지토리를 만듭니다.

1. 프로비저닝된 `dxpcloud` 리포지토리를 로컬로 복제합니다.

1. 2단계에서 복제한 리포지토리를 1단계에서 생성한 원격 리포지토리로 푸시합니다.

GitHub 리포지토리를 생성, 복제 및 푸시하는 데 도움이 필요한 경우 [GitHub 문서](https://help.github.com) 를 참조하십시오.

## Jenkins 서비스와 통합

이제 새 리포지토리를 Liferay Cloud의 Jenkins 서비스와 통합해야 합니다. Jenkins 서비스로 푸시하는 GitHub에서 웹후크를 설정합니다.

1. GitHub에서 리포지토리의 **Settings** 페이지로 이동하여 **Webhooks** 을 선택합니다.

1. **웹후크 추가** 을 클릭합니다. 그러면 **Add webhook** 양식이 열립니다.

1. **페이로드 URL** 필드에서 Liferay Cloud `infra` 환경의 Jenkins 서비스 도메인을 추가합니다. 예를 들어 `acme` 라는 프로젝트에 대한 `infra` 환경의 `ci` 서비스 URL은 `https://ci-acme-infra.lfr.cloud/github-webhook/`입니다. Jenkins GitHub 플러그인과 통합하려면 상대 경로 `github-webhook` 이 필요합니다.

1. **콘텐츠 유형** 선택기 메뉴에서 **application/json** 을 선택합니다.

1. **비밀** 필드를 공백으로 두고 **SSL 확인 활성화** 이 선택되었는지 확인합니다.

    ![그림 1: 페이로드 URL 및 콘텐츠 유형을 지정하고 SSL 확인을 활성화합니다.](./configuring-your-github-repository/images/01.png)

1. **미만 이 웹후크를 트리거하려는 이벤트는 무엇입니까?** , 선택 **개별 이벤트 선택** . 그러면 이벤트 목록이 나타납니다.

1. 이벤트 목록에서 **푸시** 및 **풀 요청** 을 선택합니다.

    ![그림 2: 이 Webhook에 대한 개별 이벤트를 선택해야 합니다.](./configuring-your-github-repository/images/02.png)

    ![그림 3: 푸시 및 풀 요청을 선택합니다.](./configuring-your-github-repository/images/03.png)

1. **활성** 이 선택되었는지 확인한 다음 **웹훅 추가** 을 클릭합니다.

    ![그림 4: 웹후크를 활성으로 설정하고 생성을 완료합니다.](./configuring-your-github-repository/images/04.png)

### 환경 변수 설정

새 리포지토리를 가리키도록 Jenkins 서비스에서 다음 환경 변수를 설정합니다.

1. Liferay Cloud Console에 로그인하고 `infra` 환경에서 Jenkins 서비스로 이동합니다.

1. **환경 변수** 탭으로 이동합니다.

1. 다음 환경 변수를 구성합니다.

| 이름                            | 가치             |
|:----------------------------- |:-------------- |
| `LCP_CI_SCM_PROVIDER`         | github         |
| `LCP_CI_SCM_REPOSITORY_OWNER` | [repo_owner]   |
| `LCP_CI_SCM_REPOSITORY_NAME`  | [repo_name]    |
| `LCP_CI_SCM_TOKEN`            | [access_token] |

`LCP_CI_SCM_TOKEN` 값의 경우 GitHub 조직에 대해 생성된 개인 액세스 토큰을 사용합니다. 이 토큰을 만들고 액세스하는 방법에 대한 지침은 [GitHub 문서](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line) 를 참조하십시오.

생성된 개인 액세스 토큰에는 **repo** 및 **admin:repo***hook** 아래의 모든 범위 권한이 선택되어 있어야 합니다. **admin:repo***hook** 범위 권한은 리포지토리가 Liferay Cloud와 성공적으로 통합된 후 [](#personal-access-token-usage) 특히 제거될 수 있습니다.

![PAT를 성공적으로 사용할 수 있도록 올바른 권한을 확인하십시오.](./configuring-your-github-repository/images/05.png)

```{note}
SAML Single Sign-On 인증으로 조직 계정을 사용하는 경우 액세스 토큰을 승인하려면 추가 단계를 수행해야 합니다. [GitHub 공식 문서](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/authorizing-a-personal-access-token-for-use-with-saml-single-sign-on) 을 참조하십시오.
```

이러한 환경 변수를 업데이트하면 Jenkins 서비스가 다시 시작됩니다. 이제 새 리포지토리의 모든 푸시된 분기 및 풀 요청이 빌드를 트리거합니다.

```{note}
`2.222.1-3.2.0` 이전의 Jenkins 버전은 `GITHUB_REPOSITORY` 및 `GITHUB_TOKEN` 환경 변수를 대신 사용합니다. `LCP_CI_SCM_*` 환경 변수를 사용하려면 Jenkins `2.222.1-3.2.0` 이상을 실행 중인지 확인하세요.
```

### 개인 액세스 토큰 사용

Liferay Cloud가 저장소와 통합하려면 `LCP_CI_SCM_TOKEN` 값에서 참조하는 개인 액세스 토큰이 필요합니다.

```{warning}
개인 액세스 토큰이 개인 사용자 계정에 속하고 해당 사용자가 조직에서 제거되면 모든 빌드가 완료되지 않습니다. 대신 조직에 특별히 속한 계정을 사용하십시오. 자세한 내용은 [GitHub 공식 문서](https://docs.github.com/en/actions/learn-github-actions/security-hardening-for-github-actions#considering-cross-repository-access) 를 참조하세요.
```

기본적으로 CI 서비스가 기본 웹 후크를 사용하여 성공적으로 통합하려면 GitHub 조직의 [개인 액세스 토큰](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token) 에도 `admin:repo_hook` 권한이 있어야 합니다.

그러나 [CI 서비스](../platform-services/continuous-integration에서 `LCP_CLI_SCM_MANAGE_HOOKS` [환경 변수](../reference/defining-environment-variables.md)를 `false`로 설정하는 것이 좋습니다. .md). 이렇게 하면 웹 후크의 자동 관리가 비활성화되고(리포지토리와의 통합 설정을 완료한 후에는 더 이상 필요하지 않음) 개인 액세스 토큰 Liferay Cloud에서 (관리자 수준) `admin:repo_hook` 권한을 제거할 수 있습니다. 용도:

![자동 웹후크 관리를 비활성화하면 개인 액세스 토큰에서 admin:repo_hook 권한을 제거할 수 있습니다.](./configuring-your-github-repository/images/06.png)

웹후크에서 이러한 권한을 제거하면 리포지토리에 대한 액세스가 최소화되어 보안이 향상됩니다.

## 빌드 확인

푸시된 분기 및 풀 요청은 Liferay Cloud Console의 **빌드** 탭에서 보거나 배포할 수 있는 빌드를 트리거합니다. Jenkins 서비스와의 통합을 설정한 후 좋은 다음 단계는 이러한 빌드를 확인하여 통합이 성공했는지 확인하는 것입니다.

### 푸시된 분기에서 빌드 확인

새 Git 푸시가 Jenkins 빌드를 트리거하는지 확인합니다.

1. 저장소를 변경(예: 파일 추가)한 다음 분기에 커밋합니다. 
   
   

    ```bash
    git commit -m "Add file to test builds"
    ```

1. 분기를 GitHub로 푸시합니다. 

    ```bash
    git push origin branch-name
    ```


1. Liferay Cloud Console에서 **빌드** 페이지로 이동합니다.

1. 빌드가 **빌드** 페이지에서 푸시된 브랜치에 대해 표시되는지 확인합니다.

### 풀 요청에서 빌드 확인

새 끌어오기 요청이 Jenkins 빌드를 트리거하는지 확인합니다.

1. 모든 브랜치에서 `개발` 브랜치로 풀 요청을 생성합니다.

1. 풀 요청에 대해 새 빌드가 생성되었는지 확인합니다.

1. Liferay Cloud Console에서 **빌드** 페이지로 이동합니다.

1. 분기에 대한 링크를 클릭하고 적절한 빌드에서 커밋합니다.

1. 링크가 올바른 GitHub 페이지로 리디렉션되는지 확인합니다.

## 추가 정보

* [BitBucket 리포지토리 구성](./configuring-your-bitbucket-repository.md)
* [GitLab 리포지토리 구성](./configuring-your-gitlab-repository.md)
