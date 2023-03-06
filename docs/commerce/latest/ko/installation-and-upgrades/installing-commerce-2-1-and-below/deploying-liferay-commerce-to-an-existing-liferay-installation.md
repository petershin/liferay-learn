---
uuid: 468e4ed9-1296-40e1-a69b-8f04b1148a11
---

# 기존 Liferay 설치에 Liferay Commerce 배포

이 문서에서는 Liferay Commerce를 기존 Liferay DXP 인스턴스에 배포하는 방법을 설명합니다. Liferay Commerce는 Liferay DXP를 기반으로 구축되었기 때문에 기존 DXP 7.1 또는 7.2 인스턴스를 실행해야 합니다. 이 가이드를 따르기 전에 시스템 요구 사항을 검토하십시오.

Liferay Commerce 사용을 시작하려면:

1. 최신 Liferay Commerce `LPKG`다운로드하십시오.
    * 기업 가입자는 [도움말 센터](https://customer.liferay.com/downloads?p **p** id=com **liferay** osb **customer** downloads **display** web **DownloadsDisplayPortlet&** com **liferay** osb **customer** downloads **display** web **DownloadsDisplayPortlet** productAssetCategoryId=118190997& **com** liferay **osb** customer **downloads** display **web** DownloadsDisplayPortlet_fileTypeAssetCategoryId=118191001) 에서 최신 `LPKG` 다운로드할 수 있습니다.
      * 가입자는 또한 Liferay Commerce에 대한 주문 번호 또는 활성화 키가 필요합니다. [프록시 서버를 통해 Marketplace 앱 활성화](https://help.liferay.com/hc/ko/articles/360018427391) 을 참조하십시오.
    * 최신 오픈 소스 `LPKG` [Liferay Commerce Community 다운로드 페이지](https://www.liferay.com/downloads-community) 에서 얻을 수 있습니다.

1. `LPKG` 을 `${liferay.home}/deploy` 폴더에 배포합니다.

    ```{note}
    Liferay DXP에 애플리케이션을 배포하는 방법에 대해 자세히 알아보려면 [Liferay Home](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/reference/liferay-home.html) 을 참조하십시오.
    ```

1. (**구독자**) 활성화 키를 `${liferay.home}/deploy` 폴더에 배포합니다.
1. 애플리케이션 서버 콘솔에 다음 메시지가 나타나는지 확인합니다.

    ```
    2019-08-09 00:25:10.662 INFO  [fileinstall-/../../liferay-dxp-7.1.10.1-sp1/osgi/marketplace][LPKGArtifactInstaller:202] The portal instance needs to be restarted to complete the installation of file:/../../liferay-dxp-7.1.10.1-sp1/osgi/marketplace/Liferay%20Commerce%20-%20API.lpkg
    2019-08-09 00:25:10.664 INFO  [fileinstall-/../..//liferay-dxp-7.1.10.1-sp1/osgi/marketplace][LPKGArtifactInstaller:202] The portal instance needs to be restarted to complete the installation of file:/../../liferay-dxp-7.1.10.1-sp1/osgi/marketplace/Liferay%20Commerce%20-%20Impl.lpkg
    ```

1. 애플리케이션 서버를 완전히 종료하십시오.
1. 애플리케이션 서버를 시작하십시오.
1. 다음 메시지를 찾아 `LPKG` 이 설치를 시작했는지 확인하십시오.

    ```
    2019-08-09 00:32:48.850 INFO  [main][BaseDeployer:877] Deploying minium-theme.war
    ```

1. **처음** 배포에는 일련의 명령 뒤에 다음 메시지가 표시됩니다.

    ```
    2019-08-09 00:34:51.753 INFO  [main][ThemeHotDeployListener:108] 1 theme for minium-theme is available for use
    ```

1. 처음 시작할 때 재색인을 실행하여 Liferay Commerce 기본 콘텐츠를 채웁니다. **제어판** &rarr; **구성** &rarr; **검색** 으로 이동합니다.
1. **모든 검색 인덱스 재인덱싱** 옆에 있는 **실행** 클릭합니다.

Liferay Commerce가 배포되었으며 사용할 준비가 되었습니다. 스토어 관리자는 스토어프론트 구축 및 카탈로그 채우기를 시작할 수 있습니다.

## 추가 정보

응용 프로그램 서버가 다시 시작되면 Liferay Commerce는 `VerifyProcess` 명령을 두 번 실행하지 않습니다.

* [Liferay Commerce 3.0 호환성 매트릭스](https://help.liferay.com/hc/ko/articles/360049238151)
* [설치 개요](../installation-overview.md)
* [Liferay Commerce Tomcat 번들 사용](./using-the-liferay-commerce-tomcat-bundle.md)
