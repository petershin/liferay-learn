# Liferay 클라우드 콘솔을 통한 변경 사항 배포

이 튜토리얼에서는 Liferay 서비스에 포털 속성을 추가하고, 풀 리퀘스트로 CI 빌드를 트리거하고, Liferay 클라우드 콘솔을 통해 `dev` 환경에 새 빌드를 배포하는 과정을 안내합니다.

시작하려면 프로젝트의 CI 서비스와 통합된 코드 호스팅 서비스와 프로젝트 리포지토리의 로컬 작업 복사본이 필요합니다.

```{note}
다른 배포 워크플로우에 대해서는 [CLI 도구를 통한 변경 사항 배포](./deploying-changes-via-the-cli-tool.md)_를 참조하여 Liferay 클라우드 플랫폼 CLI 도구를 사용하여 프로젝트 환경에 로컬 변경 사항을 배포하는 방법을 알아보시기 바랍니다.
```

* [Liferay 서비스에 포털 속성 추가하기](#adding-a-portal-property-to-the-liferay-service)
* [풀 리퀘스트로 Jenkins 빌드 트리거하기](#triggering-a-jenkins-build-with-a-pull-request)
* [Liferay 클라우드 콘솔을 통해 새 빌드 배포하기](#deploying-your-new-build-via-the-liferay-cloud-console)
* [샘플 배포 확인](#verifying-your-sample-deployment)

## Liferay 서비스에 포털 속성 추가하기

`dev` 환경의 Liferay 서비스에 포털 속성을 추가하고 변경 사항을 커밋하여 배포 수명 주기를 시작하세요:

1. 로컬 마스터 브랜치가 프로젝트 리포지토리의 최신 버전으로 최신 상태인지 확인하세요.

1. 최신 마스터 브랜치를 기반으로 새 작업 브랜치를 만듭니다.

   ```bash
   git checkout -b example-console-deployment-branch
   ```

1. `<project>\liferay\configs\dev\portal-env.properties`로 이동하여 다음 속성을 추가합니다:

   ```properties
   web.server.display.node=true
   ```

1. 다음 명령을 사용하여 `portal-env.properties` 파일에 변경 사항을 추가하고 커밋합니다:

   ```bash
   git add .
   ```

   ```bash
   git commit -m "Test - Adding Portal Property"
   ```

## 풀 리퀘스트로 Jenkins 빌드 트리거하기

그런 다음 프로젝트의 중앙 Git 리포지토리에 풀 리퀘스트를 사용하여 Jenkins 빌드를 트리거합니다:

1. 새 브랜치를 로컬 리포지토리의 오리진으로 푸시합니다.

   ```bash
   git push -u origin example-console-deployment-branch
   ```

1. Git 리포지토리로 이동하여 프로젝트의 중앙 리포지토리에 새 풀 리퀘스트를 사용하여 Jenkins 빌드를 트리거합니다.

   ![프로젝트의 중앙 리포지토리에 새 풀 리퀘스트로 Jenkins 빌드를 트리거하세요.](./deploying-changes-via-the-liferay-cloud-console/images/01.png)

   프로젝트의 Jenkins 페이지를 통해 빌드 상태를 추적하고 자세한 로그를 볼 수 있습니다: `https://ci-<project-name>-infra.lfr.cloud`

   ![프로젝트의 Jenkins 페이지를 통해 빌드 상태를 추적하세요.](./deploying-changes-via-the-liferay-cloud-console/images/02.png)

   ![프로젝트의 Jenkins 페이지에서 자세한 로그를 확인하세요.](./deploying-changes-via-the-liferay-cloud-console/images/03.png)

## Liferay 클라우드 콘솔을 통해 새 빌드 배포하기

새 빌드가 준비되면 Liferay 클라우드 콘솔을 통해 프로젝트의 `dev` 환경에 배포합니다:

1. Liferay 클라우드 콘솔에서 프로젝트의 **빌드** 페이지로 이동합니다. 모든 프로젝트 환경에서 이 페이지에 액세스할 수 있습니다.

1. 배포하려는 빌드에 대해 **작업** 버튼(⋮)을 클릭하고 **빌드를 배포할 대상...을 선택합니다.**

   ![빌드 페이지에서 빌드를 보고 배포합니다.](./deploying-changes-via-the-liferay-cloud-console/images/04.png)

1. 드롭다운 메뉴를 사용하여 `dev` 환경을 선택합니다.

   ![개발 환경을 선택하고 빌드 배포를 클릭합니다.](./deploying-changes-via-the-liferay-cloud-console/images/05.png)

1. 확인란을 사용하여 배포를 확인하고 **배포 빌드** 를 클릭합니다.

   ![확인란을 사용하여 배포를 확인하고 빌드 배포를 클릭합니다.](./deploying-changes-via-the-liferay-cloud-console/images/06.png)

   ```{tip}
   배포하려는 빌드의 *빌드 ID*를 클릭하여 *빌드를 다음에 배포...* 페이지에 액세스할 수도 있습니다.
   ```

   배포 상태는 **배포** 페이지와 `개발` 환경의 **로그** 및 **활동** 페이지에서 확인할 수 있습니다.

   ![배포 페이지에서 배포 상태 보기](./deploying-changes-via-the-liferay-cloud-console/images/07.png)

## 샘플 배포 확인

빌드가 성공적으로 배포되고 `dev` 환경의 Liferay 서비스가 **준비됨** 이 되면 다음 단계에 따라 변경 사항을 확인합니다:

1. 프로젝트의 `dev` 환경으로 이동합니다.

1. **웹 서버** 서비스 페이지로 이동하여 해당 URL을 클릭하여 `dev` 환경의 Liferay 인스턴스( `https://webserver-<project-name>-dev.lfr.cloud/`)에 액세스합니다.

   ![웹 서버 URL을 클릭하여 개발 환경의 Liferay 인스턴스에 액세스합니다.](./deploying-changes-via-the-liferay-cloud-console/images/08.png)

1. 홈페이지 하단에 웹 서버 노드가 표시되는지 확인합니다.

   ![홈페이지 하단에 웹 서버 노드가 표시되는지 확인합니다.](./deploying-changes-via-the-liferay-cloud-console/images/09.png)

## 관련 주제

* [Liferay 클라우드 개발 워크플로 개요](./overview-of-the-liferay-cloud-deployment-workflow.md)
* [CLI 도구를 통한 변경 사항 배포](./deploying-changes-via-the-cli-tool.md)
* [자동 배포 설정](./automatically-deploying-ci-service-builds.md)
* [Liferay 서비스 구성](../customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/configuring-the-liferay-dxp-service.md)
