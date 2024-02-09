---
toc:
  - ./migrating-to-liferay-cloud/matching-dxp-versions.md
  - ./migrating-to-liferay-cloud/creating-data-backup-files.md
  - ./migrating-to-liferay-cloud/uploading-and-restoring-the-data-backup.md
  - >-
    - ./migrating-to-liferay-cloud/migrating-web-server-configurations.md
    - ./migrating-to-liferay-cloud/migrating-search-configurations.md
    - ./migrating-to-liferay-cloud/connecting-the-vpn.md
    - ./migrating-to-liferay-cloud/next-steps-after-migration.md
---
# Liferay Cloud로 마이그레이션

```{toctree}
:maxdepth: 1

migrating-to-liferay-cloud/matching-dxp-versions.md
migrating-to-liferay-cloud/creating-data-backup-files.md
migrating-to-liferay-cloud/uploading-and-restoring-the-data-backup.md
migrating-to-liferay-cloud/migrating-dxp-configurations-and-customizations.md
migrating-to-liferay-cloud/migrating-web-server-configurations.md
migrating-to-liferay-cloud/migrating-search-configurations.md
migrating-to-liferay-cloud/connecting-the-vpn.md
migrating-to-liferay-cloud/next-steps-after-migration.md
```

Liferay Cloud는 고가용성, 확장성 및 성능을 위해 구축된 안전하고 신뢰할 수 있는 엔터프라이즈 플랫폼입니다. Liferay Cloud에서 Liferay DXP 인스턴스를 실행하면 [기능](./getting-started.md) 이 제공되어 사용자에게 안전하고 안정적이며 원활한 경험을 보장합니다.

온프레미스 Liferay DXP 환경에서 Liferay Cloud로 마이그레이션하려면 모든 데이터(문서 또는 데이터베이스), 구성 및 사용자 지정(예: OSGi 모듈 또는 플러그인)을 포함하여 전체 인스턴스를 Liferay Cloud에서 실행되는 환경으로 이동해야 합니다. 여기에는 Liferay 클라우드 환경과 통합되는 Git 리포지토리로 변경 사항을 작업하고 배포하는 작업도 포함됩니다.

Liferay Cloud로의 마이그레이션의 주요 단계는 다음과 같습니다:

* [1단계: DXP 버전 일치하기](./migrating-to-liferay-cloud/matching-dxp-versions.md)
* [2단계: 데이터 백업 파일 만들기](./migrating-to-liferay-cloud/creating-data-backup-files.md)
* [3단계: 데이터 백업 업로드 및 복원](./migrating-to-liferay-cloud/uploading-and-restoring-the-data-backup.md)
* [4단계: DXP 구성 및 사용자 지정 마이그레이션](./migrating-to-liferay-cloud/migrating-dxp-configurations-and-customizations.md)
* [5단계: 웹 서버 구성 마이그레이션](./migrating-to-liferay-cloud/migrating-web-server-configurations.md)
* [6단계: 검색 구성 마이그레이션](./migrating-to-liferay-cloud/migrating-search-configurations.md)
* [7단계: VPN 연결](./migrating-to-liferay-cloud/connecting-the-vpn.md)
* [8단계: 마이그레이션 후 다음 단계](./migrating-to-liferay-cloud/next-steps-after-migration.md)

## Liferay Cloud로 마이그레이션해야 하는 이유는 무엇인가요?

Liferay Cloud로 마이그레이션하면 [클러스터링](./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/setting-up-clustering-in-liferay-cloud.md), [로드 밸런싱](/configuring-the-cloud-network/load-balancer.md), [자동 확장](./manage-and-optimize/auto-scaling.md) 과 같은 빠른 배포 기능과 함께 [고가용성 및 확장성](./getting-started.md#high-availability-scalability-and-performance) 을 즉시 활용할 수 있습니다. 기본 제공 [및 Git 및 Jenkins](./getting-started.md#accelerated-development-with-built-in-ci-cd) 와의 통합으로 개발 프로세스를 간소화할 수 있습니다. 이를 통해 프로덕션 인스턴스를 더 쉽게 배포하고 개발할 수 있으며, 필요에 따라 유연하게 사용할 수 있고, 사용자가 더 안정적으로 사용할 수 있습니다.

## 미리 준비해야 할 것은 무엇인가요?

프로젝트 리포지토리와 필요한 도구를 미리 계획하고 설정하는 등 마이그레이션을 미리 준비하기 위한 몇 가지 조치를 취할 수 있습니다.

### 미리 계획하기

마이그레이션을 준비하기 위해 수행해야 할 첫 번째 중요한 작업은 미리 계획을 세우고 시간을 예약하는 것입니다. 데이터베이스 관리자와 협력하여 마이그레이션 단계가 완료되면 전환할 시간을 정하고 [마이그레이션 2단계](./migrating-to-liferay-cloud/creating-data-backup-files.md#freeze-the-data) (데이터베이스 및 문서 라이브러리의 백업 파일 만들기)를 위해 데이터를 동결할 수 있는 창을 마련하세요.

마이그레이션 단계를 미리 검토하여 예상되는 사항과 마이그레이션을 완료하는 데 걸리는 시간을 파악할 수 있습니다.

### 도구 설치 및 학습

또한 마이그레이션 단계에 필요한 도구가 로컬 시스템에 있는지 확인해야 합니다:

* [Git](https://git-scm.com/) : 마이그레이션하는 동안 변경 사항을 Liferay Cloud에 커밋하고 푸시하는 데 사용할 수 있도록 Git이 설치되어 있어야 합니다.
* 리포지토리 호스팅 서비스 계정: 이러한 웹사이트 중 하나에 계정이 있어야 변경 사항을 푸시하고 Liferay Cloud 빌드에 제출할 수 있습니다. [GitHub](https://github.com/) , [Bitbucket](https://bitbucket.org/) , 또는 [GitLab](https://about.gitlab.com/) 에서 계정을 사용할 수 있습니다.
* [패치 도구 설치](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/maintaining-a-liferay-installation/reference/installing-the-patching-tool.html) : 마이그레이션의 첫 번째 단계에 대한 패치 및 핫픽스 정보를 확인하려면 패치 도구가 필요합니다.
* 파일 압축 소프트웨어: Windows를 로컬 시스템의 운영체제로 사용하는 경우, 압축 파일을 압축/해제하려면 파일 압축 소프트웨어(예: [7-Zip](https://www.7-zip.org/) )도 필요합니다.

이러한 도구를 설치한 후에는 시간을 내어 도구에 익숙해지는 것이 좋습니다.

예를 들어 Git을 처음 사용하는 경우 마이그레이션에 적용하기 전에 [공식 Git 자료](https://git-scm.com/doc) (참조 문서, 명령 치트 시트 등 포함)를 참조하거나 직접 사용 연습을 해보는 것이 좋습니다. Git은 이 마이그레이션 가이드에서 사용하는 것 이상의 기능을 갖춘 강력한 버전 관리 도구입니다.

Liferay Cloud로 마이그레이션하려면 사용자 지정 코드, 모듈 및 테마를 프로젝트에 맞게 특별히 Liferay Workspace로 이동해야 합니다. Liferay Workspace를 처음 사용하는 경우 효과적인 사용 방법 [Liferay 작업 공간이란 무엇입니까?](https://learn.liferay.com/dxp/latest/ko/building-applications/tooling/liferay-workspace/what-is-liferay-workspace.html) 에서도 배울 수 있습니다.

### 환경 준비

마이그레이션 프로세스가 원활하게 시작될 수 있도록 마이그레이션 환경을 미리 준비하세요.

아직 완료하지 않았다면 [초기 설정 개요](./getting-started/initial-setup-overview.md) 에 있는 작업을 완료하여 Liferay 클라우드 환경이 예상대로 작동하는지 확인하세요. 마이그레이션 중에 문제가 발생하는 경우 [지원 액세스](./support-and-troubleshooting/support-access.md)지원 액세스를 활성화하면 프로젝트의 콘솔, 로그 등에 대한 액세스 권한을 부여하여 필요한 경우 Liferay Cloud 지원 담당자가 더 많은 도움을 줄 수 있습니다.

리포지토리를 설정하여( [GitHub](./getting-started/configuring-your-github-repository.md), [Bitbucket](./getting-started/configuring-your-bitbucket-repository.md), 또는 [GitLab](./getting-started/configuring-your-gitlab-repository.md)) 배포할 수 있는지 확인합니다. 마이그레이션을 진행하려면 프로세스 전반에 걸쳐 여러 변경 사항을 배포해야 하므로 마이그레이션을 진행하려면 이러한 변경 사항을 배포할 수 있어야 합니다.

## 마이그레이션은 어떻게 시작하나요?

마이그레이션을 위해 로컬 Liferay DXP 인스턴스 및 [리포지토리(](#prepare-the-environment) )에 액세스할 수 있는지 확인하세요. 그런 다음 시작할 준비가 되면 [1단계: DXP 버전 일치하기](./migrating-to-liferay-cloud/matching-dxp-versions.md)에서 시작하세요.
