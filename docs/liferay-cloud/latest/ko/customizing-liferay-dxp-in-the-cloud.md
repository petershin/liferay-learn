---
toc:
  - ./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/deploying-to-the-liferay-service.md
  - >-
    - ./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/configuring-the-liferay-dxp-service.md
    - ./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/liferay-service-environment-variables.md
    - ./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/setting-up-clustering-in-liferay-cloud.md
    - ./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/using-the-mysql-client.md
    - ./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/upgrading-your-liferay-dxp-instance.md
---
# Liferay DXP 서비스 사용

Liferay 서비스는 모든 프로젝트의 핵심입니다. 애플리케이션의 Liferay DXP 인스턴스를 실행하고 웹 서버, Elasticsearch, MySQL 데이터베이스와 같은 다른 서비스와 상호 작용합니다.

![Liferay 서비스는 Liferay 클라우드에서 제공되는 여러 서비스 중 하나입니다.](./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/images/01.png)

Liferay 클라우드의 Liferay 서비스는 온프레미스 인스턴스의 Liferay DXP와 동일한 방식으로 사용할 수 있습니다. 그러나 Liferay Cloud에서 인스턴스로 작업할 때 구성 및 개발 워크플로에도 몇 가지 차이점이 있습니다.

자세한 내용은 [Liferay 서비스 제한 사항](./reference/platform-limitations.md#liferay-service) 을 참조하세요.

* [버전 선택](#choosing-a-version)
* [배포(사용자 지정, 패치 및 라이선싱)](#deployment-customization-patching-and-licensing)
* [설정](#configuration)
* [뜨거운 배치하십시요](#hot-deploy)
* [클러스터링 사용](#enabling-clustering)
* [스크립트 실행](#running-scripts)

## 버전 선택

사용 중인 Liferay DXP의 주요 버전은 Git 저장소의 `liferay/` 폴더에 있는 `LCP.json` 파일 내에 구성됩니다. `LCP.json` 파일 내의 Docker 이미지 이름을 사용하여 `이미지` 변수로 주 버전을 설정합니다:

```
"image": "liferaycloud/liferay-dxp:7.2-4.0.1"
```

동일한 `liferay/` 폴더 내의 `gradle.properties` 파일을 통해 특정 서비스 팩과 수정 팩을 정의합니다. `liferay.workspace.docker.image.liferay` 속성은 실제 배포에 사용되는 이 특정 수정 팩 레벨을 가진 또 다른 Docker 이미지 이름을 정의합니다:

```properties
liferay.workspace.docker.image.liferay=liferay/dxp:7.2.10-sp2-202005120922
```

```{note}
Liferay Cloud 스택이 아직 4.x.x로 업데이트되지 않은 경우, 기본적으로 이 버전은 리포지토리 루트에 있는 `gradle.properties` 파일에 사이트합니다. 이 경우 `liferay.workspace.lcp.liferay.image` 속성을 사용하여 버전을 정의합니다(주 버전과 별도로 정의할 필요 없음). 버전 확인에 대한 자세한 내용은 [서비스 스택 버전 이해](./reference/understanding-service-stack-versions.md)를 참조하세요.
```

Liferay Cloud의 [서비스 변경 로그](https://help.liferay.com/hc/ko/sections/360006251311-Services-Changelog) 에서 각 새 릴리스에 대한 참조를 확인할 수 있습니다. 각각의 새로운 서비스 업데이트에는 인스턴스에 사용할 수 있는 Docker 이미지가 포함되어 있습니다. [Docker Hub의 DXP 태그](https://hub.docker.com/r/liferay/dxp/tags?page=1) 를 직접 확인하여 사용할 Docker 이미지 이름을 찾을 수도 있습니다.

릴리스 노트의 새 버전을 사용하여 Docker 이미지 값을 업데이트합니다. 인스턴스가 시작될 때 또는 다음에 리포지토리에서 Liferay 서비스를 배포할 때 새 Docker 이미지가 사용됩니다. 새 릴리스에 대한 Docker 이미지를 사용하여 다른 서비스에 대한 속성을 업그레이드할 수도 있습니다.

## 배포(사용자 지정, 패치 및 라이선싱)

Liferay DXP에 사용자 지정 추가 사항을 배포하려면 새 모듈, 라이선스 또는 핫픽스를 Git 리포지토리의 적절한 사이트에 추가해야 합니다.

`common/` 디렉터리를 제외한 환경별 폴더(예: `dev`, `uat`, `prod`)에 추가된 변경 사항은 해당 환경에 배포할 때 **만** 전파됩니다. `common/` 디렉터리에 추가된 변경 사항은 대상 배포 환경에 관계없이 **항상** 배포됩니다. 이는 모든 서비스에 대해 `configs/` 디렉터리 내의 모든 하위 폴더에 적용됩니다.

Liferay 서비스는 다른 서비스에 비해 더 많은 사용자 지정 수단(예: 핫픽스 추가, 모듈의 소스 코드 빌드)을 제공하기 때문에 서비스를 배포할 때 고려해야 할 사항이 몇 가지 더 있습니다. 자세한 내용은 [Liferay 서비스에 배포하기](./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/deploying-to-the-liferay-service.md) 를 참조하세요. 또한 배포 워크플로 전반에 대한 자세한 내용은 [배포 워크플로 개요](./updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md) 를 참조하세요. Liferay Cloud에 배포하는 방법에 대한 튜토리얼은 [DCP 클라우드 콘솔을 통해 변경 사항 배포](./updating-services-in-liferay-paas/deploying-changes-via-the-liferay-cloud-console.md)을 참조하십시오.

## 설정

`portal.properties` 변경 사항과 같이 Liferay 서비스에 구성을 적용하려면 해당 구성을 Git 리포지토리에 추가하고 변경 사항을 Git에 푸시해야 합니다. 이러한 구성 파일을 추가하는 방법에 대한 자세한 내용은 [Liferay DXP 서비스 구성](./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/configuring-the-liferay-dxp-service.md)을 참조하십시오.

환경 변수는 Liferay 서비스를 구성하고 경우에 따라 포털 속성을 재정의하는 데에도 사용됩니다. 자세한 내용은 [Liferay 서비스 환경 변수](./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/liferay-service-environment-variables.md) 를 참조하세요.

## 뜨거운 배치하십시요

핫 배포는 Liferay DXP UI를 통해 수행할 수 있습니다. 이렇게 하려면 제어판 → 앱 → 앱 관리자로 이동합니다. 그런 다음 오른쪽 상단 모서리에 있는 점을 클릭하고 "업로드"를 클릭합니다. 이 화면에서 로컬 파일 시스템에서 배포 및 설치할 파일을 선택할 수 있습니다.

```{note}
이 방법으로 배포된 모든 사용자 지정은 후속 Liferay 서비스 배포 시 손실되므로 Liferay Cloud에서 핫 배포를 사용하는 것은 *권장하지* 않습니다.
```

## 클러스터링 사용

Liferay Cloud에서 Liferay DXP를 클러스터링하는 것은 Liferay DXP에서 클러스터링하는 것에 비해 매우 간소화된 프로세스입니다. 클러스터링 지원은 Liferay Cloud에서 바로 사용할 수 있으며 활성화되어 있습니다. 클러스터링 동작 및 규모에 대한 추가 구성에는 몇 가지 추가 단계가 필요합니다. 자세한 내용은 [Liferay Cloud에서 클러스터링 설정](./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/setting-up-clustering-in-liferay-cloud.md) 을 참조하세요.

## 스크립트 실행

`configs/{ENV}/scripts` 폴더에 있는 `.sh` 파일은 서비스를 시작하기 전에 자동으로 실행됩니다. 스크립트는 보다 광범위한 사용자 지정에 사용될 수 있습니다. 하지만 그렇게 할 때는 주의하세요. 이는 Liferay DXP를 사용자 지정하는 가장 강력한 방법이지만 원치 않는 부작용이 발생할 수 있습니다.

예를 들어 모든 로그 파일을 제거하는 스크립트를 포함하려면 프로젝트의 Git 리포지토리 내 다음 디렉토리 구조에 스크립트를 배치합니다:

```
liferay
├── LCP.json
└── configs
    └── dev
        ├── deploy
        ├── osgi
        ├── patching
        └── scripts
            └── remove-log-files.sh
```

## 제한 사항

Liferay DXP에는 웹에 콘텐츠를 빌드, 관리 및 배포할 수 있는 강력한 기능이 많이 있습니다. 그러나 이러한 기능 중 일부는 Liferay Cloud에서 사용할 수 없습니다:

* [원격 라이브 스테이징 구성](https://learn.liferay.com/w/dxp/site-building/publishing-tools/staging/configuring-remote-live-staging) 은 현재 Liferay Cloud에서 지원되지 않습니다. 온프레미스 설치에서 Liferay Cloud로 마이그레이션하는 사용자는 스테이징 기능을 계속 사용하려면 로컬 스테이징으로 전환해야 합니다.

## 관련 주제

* [Liferay 서비스에 배포](./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/deploying-to-the-liferay-service.md)
* [라이프레이 클라우드 서비스에 로그인하기](getting-started/logging-into-your-liferay-cloud-services.md)
* [Liferay DXP 서비스 구성](./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/configuring-the-liferay-dxp-service.md)
* [DCP 클라우드 콘솔을 통한 변경 사항 배포](updating-services-in-liferay-paas/deploying-changes-via-the-liferay-cloud-console.md)
