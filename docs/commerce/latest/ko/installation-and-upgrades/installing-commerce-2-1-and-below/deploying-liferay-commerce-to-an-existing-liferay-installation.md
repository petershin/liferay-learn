# 기존 Liferay 설치에 Liferay Commerce 배포

이 문서에서는 Liferay Commerce를 기존 Liferay DXP 인스턴스에 배포하는 방법을 설명합니다. Liferay Commerce는 Liferay DXP를 기반으로 구축되었으므로 기존 DXP 7.1 또는 7.2 인스턴스를 실행해야 합니다. 이 가이드를 따르기 전에 시스템 요구 사항을 검토하세요.

Liferay Commerce 사용을 시작하려면:

1. 최신 Liferay Commerce 'LPKG'를 다운로드하세요.
   * 기업 가입자는 [도움말 센터](https://customer.liferay.com/downloads?p_p_id=com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_productAssetCategoryId=118190997&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_fileTypeAssetCategoryId=118191001) 에서 최신 'LPKG'를 다운로드할 수 있습니다.
     * 가입자에게는 Liferay Commerce의 주문 번호나 활성화 키도 필요합니다. [프록시 서버를 통해 Marketplace 앱 활성화](https://help.liferay.com/hc/ko/articles/360018427391) 을 참조하십시오.
   * 최신 오픈 소스 'LPKG'는 [Liferay Commerce 커뮤니티](https://www.liferay.com/downloads-community) 다운로드할 수 있습니다.

1. `${liferay.home}/deploy` 폴더에 `LPKG`를 배포합니다.

    ```{note}
    Liferay DXP에 애플리케이션을 배포하는 방법에 대한 자세한 내용은 [Liferay Home](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/reference/liferay-home.html) 참조하십시오.
    ```

1. (_Subscribers_) 활성화 키를 `${liferay.home}/deploy` 폴더에 배포합니다.

1. 응용 프로그램 서버 콘솔에 다음 메시지가 나타나는지 확인합니다.

   ```
   2019-08-09 00:25:10.662 INFO  [fileinstall-/../../liferay-dxp-7.1.10.1-sp1/osgi/marketplace][LPKGArtifactInstaller:202] The portal instance needs to be restarted to complete the installation of file:/../../liferay-dxp-7.1.10.1-sp1/osgi/marketplace/Liferay%20Commerce%20-%20API.lpkg
   2019-08-09 00:25:10.664 INFO  [fileinstall-/../..//liferay-dxp-7.1.10.1-sp1/osgi/marketplace][LPKGArtifactInstaller:202] The portal instance needs to be restarted to complete the installation of file:/../../liferay-dxp-7.1.10.1-sp1/osgi/marketplace/Liferay%20Commerce%20-%20Impl.lpkg
   ```

1. 애플리케이션 서버를 완전히 종료합니다.

1. 애플리케이션 서버를 시작하십시오.

1. 다음 메시지를 찾아 `LPKG` 설치가 시작되었는지 확인하세요.

   ```
   2019-08-09 00:32:48.850 INFO  [main][BaseDeployer:877] Deploying minium-theme.war
   ```

1. **첫 번째** 배포에는 일련의 명령 뒤에 다음 메시지가 표시됩니다.

   ```
   2019-08-09 00:34:51.753 INFO  [main][ThemeHotDeployListener:108] 1 theme for minium-theme is available for use
   ```

1. 처음 시작할 때 reindex를 실행하여 Liferay Commerce 기본 콘텐츠를 채웁니다. **제어판 &rarr;** 구성 **&rarr;** 검색_으로 이동하세요.

1. **모든 검색 색인** 옆에 있는 **Reindex** 를 클릭하세요.

Liferay Commerce가 배포되었으며 사용할 준비가 되었습니다. 상점 관리자는 상점 첫화면을 구축하고 카탈로그를 채우기 시작할 수 있습니다.

## 관련 주제

응용 프로그램 서버가 다시 시작되면 Liferay Commerce는 `VerifyProcess` 명령을 두 번 실행하지 않습니다.

* [Liferay Commerce 3.0 호환성 매트릭스](https://help.liferay.com/hc/ko/articles/360049238151)
* [설치 개요](../installation-overview.md)
* [Liferay Commerce Tomcat 번들 사용하기](./using-the-liferay-commerce-tomcat-bundle.md)
