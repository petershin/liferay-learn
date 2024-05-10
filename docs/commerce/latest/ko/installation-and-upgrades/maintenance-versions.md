# 유지 관리 버전

수정팩은 정기적으로 릴리스되며 버그 및 보안 수정사항을 포함합니다. 사용자 정의 코드가 배치된 설치에 수정팩을 설치하는 경우 프로덕션에 설치하기 전에 테스트 환경에서 사용자 정의 코드로 수정팩을 배치하고 테스트하는 것이 좋습니다.

다양한 패치 유형에 대해 알아보려면 [이전 DXP 버전 패치 적용](https://learn.liferay.com/w/dxp/installation-and-upgrades/maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier) 및 [패치 유형 이해](https://learn.liferay.com/w/dxp/installation-and-upgrades/maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier/understanding-patch-types-for-dxp-7-3-and-earlier) 참조하세요.

패치 적용 방법을 알아보려면 [패치 설치](https://learn.liferay.com/w/dxp/installation-and-upgrades/maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier/installing-patches-for-dxp-7-3-and-earlier) 을 참조하십시오.

Liferay Commerce 3.0(오픈 소스) 사용자는 Liferay Portal 7.3의 새 릴리스를 통해 동일한 버그 및 보안 업데이트에 액세스할 수 있습니다.

## Liferay Commerce 2.1 이하 업데이트

Liferay는 오픈 소스 및 기업 가입자 모두를 위해 Liferay Commerce에 대한 업데이트(유지 관리 버전)를 정기적으로 출시합니다. 특히, 유지 관리 버전은 버전 번호의 세 번째 숫자의 변경 사항을 나타냅니다. 각 유지 관리 버전에는 최신 버그 수정이 포함되어 있으며 향상된 보안 및 안정성 수준을 제공합니다. 사용자 지정은 일반적으로 안전하지만 구현하기 전에 사용자 지정을 검토하는 것이 좋습니다.

새로운 유지 관리 버전으로 업데이트하는 것은 Liferay Commerce의 새로운 주요 또는 부 버전으로 업그레이드하는 것과 매우 유사합니다.

### 로드맵

1. [다운로드 및 배포](#download-and-deploy)
1. [오래된 데이터를 지우고 서버를 다시 시작하세요](#clear-stale-data-and-restart-the-server)
1. [추가 정보](#additional-information)

### 다운로드 및 배포

1. 최신 Liferay Commerce 'LPKG'를 다운로드하세요.
   * 기업 가입자는 [도움말 센터](https://customer.liferay.com/downloads?p_p_id=com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_productAssetCategoryId=118190997&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_fileTypeAssetCategoryId=118191001) 에서 최신 'LPKG'를 다운로드할 수 있습니다.
     * 가입자에게는 Liferay Commerce의 주문 번호나 활성화 키도 필요합니다. [프록시 서버를 통해 Marketplace 앱 활성화](https://help.liferay.com/hc/ko/articles/360018427391) 을 참조하십시오.
   * 최신 오픈 소스 'LPKG'는 Liferay Commerce 커뮤니티 사이트 [에서 다운로드](https://commerce.liferay.dev/download) 수 있습니다.

1. `${liferay.home}/deploy` 폴더에 `LPKG`를 배포합니다.

1. 애플리케이션 서버 콘솔에 다음 메시지가 나타나는지 확인하십시오.

   ```
   2019-08-12 21:53:43.847 INFO  [com.liferay.portal.kernel.deploy.auto.AutoDeployScanner][AutoDeployDir:261] Processing Liferay Commerce Enterprise 2.0.5.lpkg
   2019-08-13 18:12:56.713 INFO  [fileinstall-/../../liferay-commerce-enterprise-1.1.6/osgi/marketplace][LPKGArtifactInstaller:202] The portal instance needs to be restarted to complete the installation of file:/../../liferay-commerce-enterprise-1.1.6/osgi/marketplace/Liferay%20Commerce%20-%20API.lpkg
   2019-08-13 18:12:56.715 INFO  [fileinstall-/../../liferay-commerce-enterprise-1.1.6/osgi/marketplace][LPKGArtifactInstaller:202] The portal instance needs to be restarted to complete the installation of file:/../../liferay-commerce-enterprise-1.1.6/osgi/marketplace/Liferay%20Commerce%20-%20Impl.lpkg
   ```

1. 애플리케이션 서버를 종료합니다.

### 오래된 데이터를 지우고 서버를 다시 시작하세요

1. `${liferay.home}/osgi/state` 폴더를 삭제하세요. OSGi 폴더에 대한 자세한 내용은 [수동으로 앱 설치](https://help.liferay.com/hc/ko/articles/360017895412-Installing-Apps-Manually#using-your-file-system-to-install-apps) 참조하세요.
1. 애플리케이션 서버를 시작하십시오.
1. 애플리케이션 서버 콘솔 로그에서 다음과 유사한 메시지를 찾아 업그레이드 프로세스가 시작되었는지 확인합니다.

   ```
   2019-08-13 18:26:26.082 INFO  [main][UpgradeProcess:93] Upgrading com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupCommerceAccountRelUpgradeProcess
   2019-08-13 18:26:26.106 INFO  [main][UpgradeProcess:107] Completed upgrade process com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupCommerceAccountRelUpgradeProcess in 24 ms
   2019-08-13 18:26:26.116 INFO  [main][UpgradeProcess:93] Upgrading com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupRelUpgradeProcess
   2019-08-13 18:26:26.124 INFO  [main][UpgradeProcess:107] Completed upgrade process com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupRelUpgradeProcess in 8 ms
   2019-08-13 18:26:26.130 INFO  [main][UpgradeProcess:93] Upgrading com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupUpgradeProcess
   2019-08-13 18:26:26.142 INFO  [main][UpgradeProcess:107] Completed upgrade process com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupUpgradeProcess in 12 ms
   2019-08-13 18:26:26.148 INFO  [main][UpgradeProcess:93] Upgrading com.liferay.commerce.account.internal.upgrade.v1_3_0.CommerceAccountNameUpgradeProcess
   2019-08-13 18:26:26.160 INFO  [main][LoggingTimer:83] Starting com.liferay.portal.kernel.upgrade.UpgradeProcess#alter
   2019-08-13 18:26:26.200 INFO  [main][LoggingTimer:43] Completed com.liferay.portal.kernel.upgrade.UpgradeProcess#alter in 40 ms
   2019-08-13 18:26:26.208 INFO  [main][UpgradeProcess:107] Completed upgrade process com.liferay.commerce.account.internal.upgrade.v1_3_0.CommerceAccountNameUpgradeProcess in 60 ms
   2019-08-13 18:26:26.246 INFO  [main][LoggingTimer:83] Starting com.liferay.portal.upgrade.internal.index.updater.IndexUpdaterUtil#updateIndexes#Updating database indexes for com.liferay.commerce.account.service
   2019-08-13 18:26:26.346 INFO  [main][BaseDB:812] Dropping stale indexes
   2019-08-13 18:26:26.400 INFO  [main][BaseDB:84] Adding indexes
   ```

   ```
   2019-08-13 18:28:19.439 INFO  [main][VerifyProcess:65] Verifying com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess
   2019-08-13 18:28:19.443 INFO  [main][LoggingTimer:83] Starting com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess#verifyMasterCommerceCatalog
   2019-08-13 18:28:19.445 INFO  [main][LoggingTimer:43] Completed com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess#verifyMasterCommerceCatalog in 2 ms
   2019-08-13 18:28:19.446 INFO  [main][VerifyProcess:80] Completed verification process com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess in 7 ms
   2019-08-13 18:28:32.471 INFO  [main][ThemeHotDeployListener:108] 1 theme for admin-theme is available for use
   2019-08-13 18:28:34.296 INFO  [main][ThemeHotDeployListener:108] 1 theme for classic-theme is available for use
   2019-08-13 18:28:38.667 INFO  [main][ThemeHotDeployListener:108] 1 theme for minium-theme is available for use
   ```

Liferay Commerce 인스턴스가 업데이트되었습니다. 다시 색인을 생성할 필요가 없으며 모든 데이터는 변경되지 않은 상태로 유지됩니다.

## 관련 주제

Liferay Commerce는 Liferay 디지털 경험 플랫폼을 기반으로 구축되었습니다. 경우에 따라 핵심 Liferay DXP 플랫폼을 업데이트해야 하며 최신 주, 부 또는 유지 관리 버전으로 업데이트해야 합니다. Liferay Commerce에 대한 수정 사항은 Liferay와 별개입니다.

* [Liferay Commerce Fix 전달 방법](../get-help/commerce-enterprise-support/liferay-commerce-fix-delivery-method.md)
* [liferay 커머스 업그레이드](./upgrading-liferay-commerce.md)
* [수명 종료](https://www.liferay.com/subscription-services/end-of-life/commerce)
