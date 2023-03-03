---
toc:
- ./migrating-to-liferay-cloud/matching-dxp-versions.md
- ./migrating-to-liferay-cloud/creating-data-backup-files.md
- ./migrating-to-liferay-cloud/uploading-and-restoring-the-data-backup.md
- ./migrating-to-liferay-cloud/migrating-dxp-configurations-and-customizations.md
- ./migrating-to-liferay-cloud/migrating-web-server-configurations.md
- ./migrating-to-liferay-cloud/migrating-search-configurations.md
- ./migrating-to-liferay-cloud/connecting-the-vpn.md
- ./migrating-to-liferay-cloud/next-steps-after-migration.md
---
# Liferay 클라우드로 마이그레이션

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

Liferay Cloud는 고가용성, 확장성 및 성능을 위해 구축된 안전하고 안정적인 엔터프라이즈 플랫폼입니다. Liferay Cloud에서 Liferay DXP 인스턴스를 실행하면 사용자에게 안전하고 안정적이며 원활한 경험을 보장하는 [기능](./getting-started.md) 이 제공됩니다.

온프레미스 Liferay DXP 환경에서 Liferay Cloud로 마이그레이션하려면 모든 데이터(문서 또는 데이터베이스의), 구성 및 사용자 지정(예: OSGi 모듈 또는 플러그인)을 포함하여 전체 인스턴스를 Liferay Cloud에서 실행되는 환경으로 이동해야 합니다. . 여기에는 Liferay Cloud 환경과 통합되는 Git 리포지토리로 작업하고 변경 사항을 배포하는 작업도 포함됩니다.

Liferay Cloud로의 마이그레이션의 주요 단계는 다음과 같습니다.

- [1단계: DXP 버전 일치](./migrating-to-liferay-cloud/matching-dxp-versions.md)
- [2단계: 데이터 백업 파일 생성](./migrating-to-liferay-cloud/creating-data-backup-files.md)
- [3단계: 데이터 백업 업로드 및 복원](./migrating-to-liferay-cloud/uploading-and-restoring-the-data-backup.md)
- [4단계: DXP 구성 및 사용자 지정 마이그레이션](./migrating-to-liferay-cloud/migrating-dxp-configurations-and-customizations.md)
- [5단계: 웹 서버 구성 마이그레이션](./migrating-to-liferay-cloud/migrating-web-server-configurations.md)
- [6단계: 검색 구성 마이그레이션](./migrating-to-liferay-cloud/migrating-search-configurations.md)
- [7단계: VPN 연결](./migrating-to-liferay-cloud/connecting-the-vpn.md)
- [8단계: 마이그레이션 후 다음 단계](./migrating-to-liferay-cloud/next-steps-after-migration.md)

## Liferay Cloud로 마이그레이션해야 하는 이유는 무엇입니까?

Liferay Cloud로 마이그레이션하면 [클러스터링](./ using-the-liferay-dxp-service/setting-up-clustering-in-liferay-cloud.md), [로드 밸런싱](infrastructure-and-operations/networking/load-balancer.md) 및 [자동 크기 조정](./manage-and-optimize/auto-scaling.md) 즉시 사용할 수 있습니다. 내장된 [Git 및 Jenkins와의 통합](./getting-started.md#accelerated-development-with-built-in-ci-cd) 도 개발 프로세스를 간소화합니다. 이를 통해 프로덕션 인스턴스를 더 쉽게 배포하고 개발할 수 있으며 요구 사항에 더 유연하고 사용자에게 더 안정적입니다.

## 사전에 무엇을 준비해야 합니까?

프로젝트 리포지토리 및 필수 도구를 미리 계획하고 설정하는 것을 포함하여 미리 마이그레이션을 준비하기 위해 여러 조치를 취할 수 있습니다.

### 미리 계획

마이그레이션을 준비하기 위해 수행해야 할 첫 번째 중요한 작업은 미리 계획하고 시간을 예약하는 것입니다. 데이터베이스 관리자와 협력하여 마이그레이션 단계가 완료되면 전환할 시간과 [마이그레이션의 두 번째 단계](./migrating-to-liferay-cloud/creating- data-backup-files.md#freeze-the-data) (데이터베이스 및 문서 라이브러리용 백업 파일 생성).

미리 마이그레이션 단계를 검토하여 무엇을 기대하고 마이그레이션을 완료하는 데 얼마나 걸릴지 알 수 있습니다.

### 도구 설치 및 학습

또한 마이그레이션 단계를 위해 로컬 시스템에 필요한 도구가 있는지 확인해야 합니다.

* [Git](https://git-scm.com/) : 마이그레이션 전체에서 변경 사항을 커밋하고 Liferay Cloud에 푸시하는 데 사용할 수 있도록 Git을 설치해야 합니다.
* 리포지토리 호스팅 서비스 계정: Liferay Cloud 빌드를 위해 변경 사항을 푸시하고 제출하려면 이러한 웹 사이트 중 하나의 계정이 있어야 합니다. [GitHub](https://github.com/) , [Bitbucket](https://bitbucket.org/) 또는 [GitLab](https://about.gitlab.com/) 계정을 사용할 수 있습니다.
* [패치 도구 설치](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/maintaining-a-liferay-installation/reference/installing-the-patching-tool.html) : 마이그레이션의 첫 번째 단계에 대한 패치 및 핫픽스 정보를 확인하려면 패치 도구가 필요합니다.
* 파일 압축 소프트웨어: Windows를 로컬 시스템의 OS로 사용하는 경우 압축 파일을 압축/압축 해제하려면 파일 압축 소프트웨어(예: [7-Zip](https://www.7-zip.org/) )도 필요합니다.

이러한 도구를 설치한 후에는 익숙해지는 데 시간이 걸릴 수 있습니다.

예를 들어 Git을 처음 사용하는 경우 마이그레이션에 적용하기 전에 공식 Git 자료 [](https://git-scm.com/doc) 참조 문서, 명령 치트 시트 등 포함)를 보거나 독립적으로 사용하는 연습을 할 수 있습니다. Git은 이 마이그레이션 가이드에서 사용된 것 이상의 기능을 갖춘 강력한 버전 제어 도구입니다.

Liferay Cloud로의 마이그레이션에는 사용자 정의 코드, 모듈 및 테마를 특히 프로젝트를 위한 Liferay Workspace로 이동하는 것도 포함됩니다. [Liferay 작업 공간이란 무엇입니까?](https://learn.liferay.com/dxp/latest/ko/building-applications/tooling/liferay-workspace/what-is-liferay-workspace.html) 수도 있습니다.

### 환경 준비

마이그레이션 프로세스가 원활하게 시작되도록 미리 마이그레이션 환경을 준비하십시오.

아직 수행하지 않은 경우 [초기 설정 개요](./getting-started/initial-setup-overview.md) 의 작업을 완료하여 Liferay Cloud 환경이 예상대로 실행되고 있는지 확인하십시오. 마이그레이션 중에 문제가 발생하는 경우 [지원 액세스](./troubleshooting/support-access.md)을 활성화하십시오. 지원 액세스를 활성화하면 Liferay Cloud 지원 직원에게 프로젝트의 콘솔, 로그 등에 대한 액세스 권한을 부여하여 필요한 경우 도움을 줄 수 있는 더 많은 역량을 제공합니다.

리포지토리를 설정( [GitHub](./getting-started/configuring-your-github-repository.md), [Bitbucket](./getting-started/configuring-your-bitbucket-repository.md)또는 [GitLab](./getting-started/configuring-your-gitlab-repository.md)사용)하여 배포할 수 있는지 확인합니다. 마이그레이션에는 프로세스 전반에 걸쳐 여러 변경 사항을 배포해야 하므로 마이그레이션을 진행하려면 배포할 수 있어야 합니다.

## 마이그레이션을 시작하려면 어떻게 해야 합니까?

마이그레이션을 위해 로컬 Liferay DXP 인스턴스 및 [리포지토리](#prepare-the-environment) 에 대한 액세스 권한이 있는지 확인하십시오. 그런 다음 시작할 준비가 되면 [1단계: DXP 버전 일치](./migrating-to-liferay-cloud/matching-dxp-versions.md)부터 시작합니다.
