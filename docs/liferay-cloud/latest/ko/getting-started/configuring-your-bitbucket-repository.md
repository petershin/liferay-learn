# Bitbucket 리포지토리 구성

Liferay Cloud 온보딩 이메일을 받으면 `dxpcloud` 조직에서 호스팅되는 GitHub 리포지토리가 프로비저닝됩니다. 이 리포지토리는 팀의 별도 개인 Liferay Cloud 개발 리포지토리용 템플릿이며 일반적으로 영업일 기준 10일 후에 제거됩니다. 사용자는 다음을 수행해야 합니다.

1. 프로비저닝된 리포지토리를 자체 프라이빗 리포지토리로 전송합니다.
1. Webhook을 사용하여 개인 저장소를 Liferay Cloud의 Jenkins(CI) 서비스와 통합합니다.

프로비저닝된 리포지토리는 GitHub에 있지만 Jenkins 서비스 버전 3.2.0부터 BitBucket 리포지토리로 전송할 수 있습니다. 이 작업은 BitBucket 리포지토리에 대한 관리 액세스 권한으로 수행해야 합니다.

```{note}
저장소의 관리자는 Cloud Console의 프로젝트 관리자와 *반드시 동일할 필요는 없습니다*.
```

## Jenkins 서비스 준비

Liferay Cloud 인스턴스에서 [버전 4.xx 서비스](../reference/understanding-service-stack-versions.md) 을 이미 사용 중인 경우 Jenkins 서비스가 이미 Bitbucket과 호환됩니다. 업그레이드에 대한 자세한 내용은 [Liferay Cloud Stack 업그레이드](../reference/upgrading-your-liferay-cloud-stack.md) 을 참조하십시오.

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
Jenkinsfile을 사용자 지정한 경우 이 가이드에 따라 [기본 Jenkinsfile 확장](../platform-services/continuous-integration.md#extending-the-default-jenkinsfile) .
```

## Bitbucket 리포지토리 생성

먼저 새 Bitbucket 리포지토리를 만듭니다.

1. [Bitbucket](https://bitbucket.org) 로 이동합니다.

1. 검색 아이콘 아래 사이드바에서 "+" 아이콘을 클릭합니다.

    ![+ 아이콘을 클릭하여 새 BitBucket 리포지토리 생성을 시작합니다.](./configuring-your-bitbucket-repository/images/01.png)

1. **리포지토리** 을 클릭하여 새 리포지토리 생성을 시작합니다.

    ![새 리포지토리에 대한 세부 정보를 입력합니다.](./configuring-your-bitbucket-repository/images/02.png)

1. 리포지토리의 이름을 제공합니다.

1. 액세스 수준이 비공개로 설정되어 있는지 확인합니다.

1. **을 설정하십시오. README를 포함하시겠습니까?** ~ **아니요** .

1. **리포지토리 생성** 을 클릭합니다.

## GitHub에서 Bitbucket으로 전송

프로비저닝된 GitHub 리포지토리를 자신의 Bitbucket 리포지토리로 전송하려면 다음 단계를 따르세요.

1. 프로비저닝된 GitHub 리포지토리를 로컬로 복제합니다.

    `git clone git@github.com:dxpcloud/example.git`

    ```{note}
    다른 공급자와 작업하기 위해 리포지토리를 이미 복제한 경우 이 단계를 건너뛰고 동일한 복제 내에서 작업할 수 있습니다.
    ```

1. 새 Git 원격을 추가하고 Bitbucket을 가리킵니다.

    `git remote add bitbucket git@bitbucket.org:example/example.git`

1. 복제된 리포지토리를 새 원격 리포지토리로 푸시합니다.

    `git push bitbucket master`

리포지토리를 생성, 복제 및 푸시하는 데 도움이 필요한 경우 [Bitbucket 설명서](https://confluence.atlassian.com/bitbucket/create-a-git-repository-759857290.html) 를 참조하세요.

## BitBucket용 앱 비밀번호 생성

다음으로 Webhook에서 Bitbucket으로 인증하고 Jenkins 빌드를 트리거하는 데 사용할 앱 암호를 만듭니다. 앱 암호 **을 생성하는 Bitbucket 사용자는 리포지토리에 대한 관리자 수준 액세스 권한이** 이어야 합니다.

앱 암호를 생성하려면 다음 단계를 수행하십시오.

1. 사용자 설정 페이지의 **액세스 관리에서****앱 비밀번호** 을 클릭합니다.
   
   ![사용자 설정 페이지에서 앱 비밀번호를 클릭합니다.](./configuring-your-bitbucket-repository/images/03.png)

1. **앱 비밀번호 생성** 을 클릭합니다.
   
   ![나중에 다시 액세스할 수 없는 새 앱 암호를 생성합니다.](./configuring-your-bitbucket-repository/images/04.png)

1. 앱 비밀번호의 레이블을 제공하십시오.

1. 앱에 다음 권한을 부여합니다.

    * `풀 요청 - 읽기, 쓰기` (리포지토리 - 읽기, 쓰기 플래그도 지정해야 함)
    * `Webhooks -  read, write`

1. **만들기** 을 클릭합니다.

1. 앱 비밀번호를 복사합니다(그렇지 않으면 다시 표시되지 않음). 이것은 BitBucket의 개인 액세스 토큰에 해당합니다.

```{important}
앱 암호를 생성한 사용자는 `LCP_CI_SCM_USERNAME` 환경 변수에 사용자 이름을 사용해야 합니다.
```

## 분기 유형 및 접두사 확인

Liferay Cloud가 분기에 제대로 연결될 수 있으려면 리포지토리에서 사용 중인 분기 접두사의 전체 목록을 제공해야 합니다. 리포지토리에서 사용되는 각 분기 유형에는 리포지토리 설정에서 정의되는 자체 접두사가 있습니다.

[Bitbucket 웹사이트](https://bitbucket.org) 의 왼쪽 메뉴에서 **Repository settings** &rarr; **Branching model** 을 클릭합니다. 이렇게 하면 각 분기의 접두사가 나열되는 **분기 모델** 페이지로 이동합니다. 이러한 각 접두사를 기록하여 `LCP_CI_SCM_BITBUCKET_BRANCH_PREFIXES` CI 환경 변수에 추가합니다.

![Bitbucket 리포지토리의 기본 분기 유형(및 접두사)은 bugfix/, feature/, hotfix/ 및 release/입니다.](./configuring-your-bitbucket-repository/images/05.png)

## Jenkins 서비스에 BitBucket 연결

마지막으로 Jenkins 서비스의 환경 변수가 새 리포지토리를 가리키도록 설정합니다.

1. Liferay Cloud Console에 로그인하고 `infra` 환경에서 Jenkins 서비스로 이동합니다.

1. **환경 변수** 탭으로 이동합니다.

1. 다음 환경 변수를 구성합니다.

| 이름                                     | 가치          |
|:-------------------------------------- |:----------- |
| `LCP_CI_SCM_PROVIDER`                  | 비트버킷        |
| `LCP_CI_SCM_REPOSITORY_OWNER`          | [레포 소유자]    |
| `LCP_CI_SCM_REPOSITORY_NAME`           | [저장소 이름]    |
| `LCP_CI_SCM_TOKEN`                     | [앱 비밀번호]    |
| `LCP_CI_SCM_USERNAME`                  | [인증 사용자 이름] |
| `LCP_CI_SCM_BITBUCKET_BRANCH_PREFIXES` | [접두사 목록]    |


`LCP_CI_SCM_USERNAME`을 [앱 비밀번호를 생성한] 사용자로 정의합니다(#generating-app-password-for-bitbucket). `LCP_CI_SCM_BITBUCKET_BRANCH_PREFIXES`를 공백으로 구분된 모든 [리포지토리 분기에 사용된 접두사](#checking-branch-types-and-prefixes) 목록으로 정의합니다.

이러한 환경 변수를 업데이트하면 Jenkins 서비스가 다시 시작됩니다. 이제 새 리포지토리의 모든 푸시된 분기 및 풀 요청이 트리거됩니다.

## 개인 Bitbucket 서버에 연결

비공개 Bitbucket 서버를 사용하려면 Jenkins 서비스에서 추가 환경 변수를 설정해야 합니다.

| 이름                       | 가치            |
|:------------------------ |:------------- |
| `LCP_CI_SCM_SERVER_HOST` | [비공개 호스트 URL] |


`LCP_CI_SCM_SERVER_HOST` 변수를 개인 Bitbucket 서버의 기본 URL(예: `http://private.bitbucket.org/`)로 설정합니다. 빌드를 생성하고 리포지토리의 브랜치에 연결할 때 CI가 코드 베이스를 검색하는 데 사용하는 서버 URL을 설정합니다. 기본적으로 CI는 `https://bitbucket.org/` 을 Bitbucket의 기본 URL로 사용합니다.

## 빌드 확인

푸시된 분기 및 풀 요청은 Liferay Cloud Console의 **빌드** 탭에서 보거나 배포할 수 있는 빌드를 트리거합니다. Jenkins 서비스와의 통합을 설정한 후 좋은 다음 단계는 이러한 빌드를 확인하여 통합이 성공했는지 확인하는 것입니다.

### 푸시된 분기에서 빌드 확인

새 Git 푸시가 Jenkins 빌드를 트리거하는지 확인합니다.

1. 저장소를 변경(예: 파일 추가)한 다음 분기에 커밋합니다. 

    ```bash
    git commit -m "Add file to test builds"
    ```

1. 분기를 BitBucket으로 푸시합니다. 

    ```bash
    git push bitbucket branch-name
    ```

1. Liferay Cloud Console에서 **빌드** 페이지로 이동합니다.

1. 빌드가 **빌드** 페이지에서 푸시된 브랜치에 대해 표시되는지 확인합니다.

### 풀 요청에서 빌드 확인

새 끌어오기 요청이 Jenkins 빌드를 트리거하는지 확인합니다.

1. 모든 브랜치에서 `개발` 브랜치로 풀 요청을 생성합니다.

1. 풀 요청에 대해 새 빌드가 생성되었는지 확인합니다.

1. Liferay Cloud Console에서 **빌드** 페이지로 이동합니다.

1. 분기에 대한 링크를 클릭하고 적절한 빌드에서 커밋합니다.
   
   ![빌드 페이지에서 브랜치 링크와 빌드 커밋을 확인하세요.](./configuring-your-bitbucket-repository/images/06.png)

1. 링크가 올바른 BitBucket 페이지로 리디렉션되는지 확인하십시오.

## 추가 정보

* [GitHub 리포지토리 구성](./configuring-your-github-repository.md)
* [GitLab 리포지토리 구성](./configuring-your-gitlab-repository.md)
