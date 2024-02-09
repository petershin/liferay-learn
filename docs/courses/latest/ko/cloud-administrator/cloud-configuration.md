---
toc:
  - ./cloud-configuration/setting-up-the-github-repository.md
  - ./cloud-configuration/configuring-your-sites-domain.md
  - ./cloud-configuration/setting-up-clustering-for-the-liferay-service.md
  - ./cloud-configuration/configuring-auto-scaling.md
  - ./cloud-configuration/rotating-your-database-password.md
  - ./cloud-configuration/installing-a-hotfix.md
---
# 클라우드 구성

Cloud Console을 설정하고 사용하여 LXC에 변경사항을 배포하는 과정을 살펴보았습니다. LXC-SM은 변경 사항 및 맞춤 코드 배포에 동일한 Cloud 콘솔을 사용하므로 LXC [과 동일한 프로세스를 사용하여 LXC-SM으로 콘솔 및 도구](./setting-up-your-cloud-project.md)시작할 수 있습니다. 그러나 LXC-SM을 사용하면 관리해야 할 것이 더 많아집니다. 자체 핵심 Liferay 서비스를 완전히 관리할 수도 있습니다!

```{note}
다음 두 모듈(클라우드 구성 및 [클라우드 개발 수명 주기](./cloud-development-lifecycle.md))에는 LXC-SM에 대한 프로젝트가 필요합니다.
```

각 개발 또는 프로덕션 환경에는 다음이 모두 클라우드 네트워크에 별도의 서비스로 포함됩니다.

* 귀하의 [Liferay DXP 서비스 사용](https://learn.liferay.com/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service)
* [웹 서버 서비스(Nginx)](https://learn.liferay.com/w/liferay-cloud/platform-services/web-server-service)
* [검색 서비스(Elasticsearch)](https://learn.liferay.com/w/liferay-cloud/platform-services/search-service)
* A [데이터베이스 서비스(MySQL)](https://learn.liferay.com/w/liferay-cloud/platform-services/database-service/database-service)
* [백업 서비스 개요](https://learn.liferay.com/w/liferay-cloud/platform-services/backup-service/backup-service-overview)

![각 환경에는 이러한 서비스가 별도의 클라우드 네트워크에서 관리됩니다.](./cloud-configuration/images/01.png)

또한 다른 환경을 위해 생성하거나 배포한 모든 빌드를 제어하는 별도의 `인프라` 환경에 [지속적인 통합](https://learn.liferay.com/w/liferay-cloud/platform-services/continuous-integration) 이 있습니다.

LXC-SM 프로젝트에 대한 귀하의 책임에 대한 자세한 내용은 [여기](https://help.liferay.com/hc/ko/articles/360059798531-DXP-Cloud-Shared-Activities) 참조하세요.

LXC-SM에서는 특정 요구 사항에 따라 환경을 구성하고 관리하는 것이 귀하의 책임입니다. 여기에서 다음 방법을 알아보세요.

* 전체 프로젝트에 대한 빌드를 배포하도록 Git 저장소를 설정하세요.
* Liferay 인스턴스에 대한 사용자 정의 도메인 구성
* 클러스터링 및 자동 크기 조정 활성화
* 데이터베이스 비밀번호 변경(회전)
* 핫픽스 설치

[갑시다!](./cloud-configuration/setting-up-the-github-repository.md)
