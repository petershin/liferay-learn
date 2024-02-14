---
toc:
  - ./cloud-administrator/setting-up-your-cloud-project.md
  - ./cloud-administrator/deploying-code-to-liferay-saas.md
  - ./cloud-administrator/cloud-configuration.md
  - ./cloud-administrator/cloud-development-lifecycle.md
---
# 클라우드 관리자

Liferay Cloud를 사용하면 안전하고 안정적인 엔터프라이즈 클라우드 플랫폼에 웹사이트를 구축할 수 있습니다. 두 가지 제품을 사용할 수 있습니다:

* **Liferay Experience Cloud(LXC)** : Liferay가 프로비저닝하고 유지 관리하는 인프라에서 실행되는 Liferay DXP 인스턴스를 포함합니다. 즉시 사용 가능한 Liferay DXP 기능을 활용하여 사이트를 구축하고 필요한 경우 자체 코드 또는 클라이언트 확장을 배포하여 사용자 정의를 달성합니다.

* **Liferay Experience Cloud 자체 관리형(LXC-SM)** : Liferay DXP, 웹 서버, 데이터베이스 및 Elasticsearch 서버를 포함하여 클라우드의 각 서비스를 직접 제어하고 구성하는 Liferay Cloud 프로젝트가 포함됩니다. 귀하는 이러한 서비스를 유지하고 업데이트할 책임이 있습니다.

당신은 방법을 배울 것입니다

* 클라우드의 모든 작업을 관리하는 Cloud 콘솔에 액세스하세요.
* 다른 팀 구성원에게 액세스 권한 부여
* Cloud CLI 도구를 사용하여 변경사항 또는 맞춤설정 배포
* 사용자 정의 코드 프로젝트 배포
* Cloud Console의 도구를 사용하여 변경사항 문제를 해결하세요.
* 클러스터링, 자동 스케일링(auto-scaling), 핫픽스를 포함한 클라우드 서비스 구성 (**LXC-SM만 해당**)
* 클라우드 서비스용 빌드 자동 배포 (**LXC-SM만 해당**)
* 테스트 중 백업 생성 및 복원 (**LXC-SM만 해당**)

Liferay Cloud의 플랫폼을 사용하여 메이플 시럽 비즈니스를 위한 신뢰할 수 있는 맞춤형 환경을 구축하는 (가짜) 회사인 Delectable Bonsai의 클라우드 프로젝트 작업을 시작하세요.

LXC로 작업하든 LXC-SM으로 작업하든 [클라우드 프로젝트 설정](./cloud-administrator/setting-up-your-cloud-project.md)으로 시작하세요.

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card}  클라우드 프로젝트 설정
:link: ./cloud-administrator/setting-up-your-cloud-project.md

LXC 또는 LXC-SM과 함께 Cloud 콘솔을 사용하여 시작하는 방법을 알아보세요.
:::

:::{grid-item-card}  LXC에 코드 배포
:link: ./cloud-administrator/deploying-code-to-liferay-saas.md

LXC에서 클라이언트 확장 프로젝트를 배포하고 작업하는 방법을 알아보세요.
:::

:::{grid-item-card}  클라우드 구성
:link: ./cloud-administrator/cloud-configuration.md

LXC-SM에서 서비스 및 Liferay 인스턴스를 구성하는 방법을 알아보세요.
:::

:::{grid-item-card}  클라우드 개발 수명주기
:link: ./cloud-administrator/cloud-development-lifecycle.md

개발자로서 LXC-SM에서 Cloud 콘솔을 사용하여 작업하는 방법을 알아보세요.
:::
::::
