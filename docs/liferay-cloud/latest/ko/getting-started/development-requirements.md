# 개발 요구 사항

Liferay Cloud에서 배포를 시작하기 전에 모듈을 만들 계획인 개발자는 필요한 도구를 설치해야 합니다. 개발자가 사용자 정의를 생성하는 데 사용할 수 있는 다양한 개발 도구 및 프레임워크가 있지만 Liferay Cloud에 대한 배포는 프로비저닝 프로세스 중에 생성된 GitHub 프로젝트에서 시작됩니다.

Liferay Cloud로 개발을 위한 로컬 환경을 설정하려면 다음이 필요합니다.

* [JDK 1.8 또는 JDK 11](http://www.oracle.com/technetwork/java/javase/downloads/index.html) : Liferay 인스턴스를 로컬에서 실행하는 데 필요합니다.

    ```{important}
    JDK 9 및 JDK 10은 지원되지 않습니다. 자세한 내용은 최신 [호환성 매트릭스](https://help.liferay.com/hc/ko/articles/360049238151) 를 참조하십시오.
    ```

* [Gradle 4+](http://www.gradle.org/downloads) : Liferay DXP 및 Liferay Cloud에 대한 다양한 빌드 명령을 실행하는 데 사용

* [Git](https://git-scm.com/) : Liferay Cloud에 배포할 변경 사항을 추가하는 데 필요합니다.

* 리포지토리 호스팅 서비스 계정: 코드 변경 사항을 원격 리포지토리로 푸시하고 Liferay Cloud 빌드에 대한 변경 사항을 제출하는 데 필요합니다. 사용 가능한 다음 옵션에 대해 계정을 사용할 수 있습니다.

  * [GitHub](https://github.com/)
  * [비트버킷](https://bitbucket.org/)
  * [깃랩](https://gitlab.com/)

```{note}
Liferay Cloud에는 [Liferay Workspace](https://help.liferay.com/hc/ko/articles/360029147471-Liferay-Workspace) 와 유사한 전제 조건이 있습니다. Developers who are familiar with creating a Liferay Workspace using [Liferay Dev Studio](https://customer.liferay.com/downloads?p_p_id=com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_productAssetCategoryId=118191007&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_fileTypeAssetCategoryId=118191038) , [Maven](https://help.liferay.com/hc/ko/articles/360017885592-Maven-Workspace) 또는 [Liferay IntelliJ 플러그인](https://plugins.jetbrains.com/plugin/10739-liferay-intellij-plugin) 에 대부분의 필요한 도구는 이미 설정되어 있습니다.
```

## 관련 주제

* [Github 리포지토리 구성](../getting-started/configuring-your-github-repository.md)
* [Bitbucket 리포지토리 구성](./configuring-your-bitbucket-repository.md)
* [GitLab 리포지토리 구성](./configuring-your-gitlab-repository.md)
* [Liferay 클라우드 배포 워크플로 개요](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md)
* [Liferay DXP 인스턴스에 로그인](../getting-started/logging-into-your-liferay-cloud-services.md)
