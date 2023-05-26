# CI 서비스 빌드 자동 배포

Liferay Cloud를 사용하면 웹후크를 사용하여 프로젝트의 Git 리포지토리(예: [GitHub](../getting-started/configuring-your-github-repository.md#integrating-with-the-jenkins-service) , [Bitbucket](../getting-started/configuring-your-bitbucket-repository.md#connecting-bitbucket-to-your-jenkins-service) , [GitLab](../getting-started/configuring-your-gitlab-repository.md#connecting-gitlab-to-your-jenkins-service) )에 푸시되거나 병합된 변경 사항에 대해 Jenkins 빌드를 자동으로 트리거할 수 있습니다. 이러한 빌드는 Liferay Cloud Console을 통해 프로젝트 환경에 수동으로 배포할 수 있습니다. 또는 특정 분기에서 지정된 환경으로 성공적인 빌드를 자동으로 배포하도록 CI 서비스를 구성하여 배포 프로세스의 속도를 높일 수 있습니다.

기본적으로 자동 배포는 `LCP_CI_DEPLOY_BRANCH` 및 `LCP_CI_DEPLOY_TARGET` 변수에 의해 제어됩니다. 함께 자동 배포를 트리거하는 데 사용되는 분기와 빌드가 자동으로 배포되는 환경을 결정합니다. 기본값은 각각 `개발` 및 `개발` 으로 설정됩니다.

원하는 경우 Liferay Cloud Console을 통해 `LCP_CI_DEPLOY_BRANCH` 및 `LCP_CI_DEPLOY_TARGET` 변수를 편집하여 자동 배포를 구성할 수 있습니다.

1. Liferay 클라우드 프로젝트의 `infra` 환경으로 이동합니다.

1. **CI** 서비스 페이지로 이동하여 **환경 변수** 탭을 클릭합니다.

   ![CI 서비스 페이지로 이동하여 환경 변수 탭을 클릭합니다.](./automatically-deploying-ci-service-builds/images/01.png)

1. CI 서비스에 다음 변수를 추가합니다.

   * **키** : `LCP_CI_DEPLOY_BRANCH`

      **값** : 원하는 지점 이름을 입력합니다(예: `useracceptance`).

   * **키** : `LCP_CI_DEPLOY_TARGET`

      **값** : 원하는 환경 이름을 입력합니다(예: `uat`).

1. **변경 사항 저장** 을 클릭하십시오. 이렇게 하면 CI 서비스가 새 변수로 다시 시작됩니다.

다시 시작하면 지정된 브랜치에 푸시되거나 병합된 모든 변경 사항이 자동으로 빌드되어 대상 환경에 배포됩니다.

## 관련 주제

* [Liferay 클라우드 개발 워크플로 개요](./overview-of-the-liferay-cloud-deployment-workflow.md)
* [Liferay Cloud Console을 통해 변경 사항 배포](./deploying-changes-via-the-liferay-cloud-console.md)
* [CLI 도구를 통해 변경 사항 배포](./deploying-changes-via-the-cli-tool.md)
