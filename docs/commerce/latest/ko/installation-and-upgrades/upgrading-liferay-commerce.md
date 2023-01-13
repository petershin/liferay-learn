# Liferay Commerce 업그레이드

Liferay Commerce 경험의 품질을 향상시키기 위해 Liferay는 버그 수정 및 새로운 기능으로 정기적인 제품 업그레이드를 제공합니다. 사용자는 최신 릴리스로 정기적으로 업데이트하는 것을 고려해야 합니다.

## 커머스 4.0으로 업그레이드

Liferay Commerce 3.0부터 Commerce는 이제 Liferay DXP와 함께 번들로 제공됩니다. Commerce 4.0으로 업그레이드하려면 먼저 기본 Liferay DXP 설치를 DXP 7.4로 업그레이드하고 검색 재인덱싱을 수행해야 합니다.

```{warning}
7.4로 업그레이드한 후 Commerce 'LPKG'를 다시 배포하지 *마세요*. Commerce 4.0 모듈은 7.4와 함께 번들로 제공됩니다. 'LPKG'를 배포하면 충돌이 발생합니다.
```

DXP 업그레이드 프로세스에 대한 자세한 내용은 [업그레이드 기본 사항](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/upgrading-liferay/upgrade-basics.html)을 참조하십시오. DXP가 7.4로 업그레이드되면 재인덱싱을 실행합니다.

### Liferay Commerce 4.0으로 업그레이드하기 위한 전제 조건

`CommerceCountry` 테이블은 Liferay Commerce 4.0에서 더 이상 사용되지 않으며 `Country` 테이블로 대체됩니다. `CommerceCountry` 테이블에는 국가 이름만 필요한 반면, Country 테이블에는 각 국가의 이름과 Alpha-2(a2) 및 Alpha-3(a3) 코드가 필요합니다.

Miniium Accelerator를 사용하거나 자체 값을 사용하는 경우 `CommerceCountry` 테이블이 채워질 수 있습니다. Miniium Accelerator를 사용하지 않는 경우 테이블이 비어 있을 수 있습니다. Liferay DXP 7.4로 업그레이드하기 전에 전제 조건으로 `CommerceCountry` 테이블의 각 국가에 ISO 코드가 미리 채워져 있는지 확인해야 합니다. 자세한 내용은 [국가 코드(ISO)](https://www.iso.org/obp/ui/#search/code) 을 참조하십시오.

![CommerceCountry 테이블에는 Country 테이블보다 더 많은 필드가 있습니다.](./upgrading-liferay-commerce/images/01.png)

### 업그레이드 후 재색인 실행

DXP 7.4로 업그레이드한 후 전체 검색 재인덱싱을 실행합니다.

1. _글로벌 메뉴_을 열고 _제어판_ &rarr; _검색_으로 이동합니다.

   ![제어판 탭에서 검색으로 이동합니다.](./upgrading-liferay-commerce/images/02.png)

1. _Index Actions_ 탭에서 _Execute_ for _Reindex all search indexes_를 클릭합니다.

재색인이 완료되면 글로벌 메뉴의 _Commerce_ &rarr; _Products_ 로 이동하여 모든 제품이 표시되는지 확인하여 성공했는지 확인합니다.

## 2.1 이하에서 Commerce 3.0으로 업그레이드

Commerce 3.0으로 업그레이드하려면 먼저 기본 Liferay DXP 설치를 DXP 7.3으로 업그레이드한 다음 검색 재색인을 실행해야 합니다.

```{warning}
7.3으로 업그레이드한 후 Commerce `LPKG`를 다시 배포하지 *마세요*. Commerce 3.0 모듈은 7.3과 함께 번들로 제공됩니다. 'LPKG'를 배포하면 충돌이 발생합니다.
```

### 업그레이드 후 재색인 실행

DXP 7.3으로 업그레이드한 후 전체 검색 재인덱싱을 실행합니다.

1. _글로벌 메뉴_ 을 열고 _제어판_ &rarr; _검색_으로 이동합니다.

   ![제어판 탭에서 검색으로 이동합니다.](./upgrading-liferay-commerce/images/02.png)

1. _Index Actions_ 탭에서 _Execute_ for _Reindex all search indexes_를 클릭합니다.

재색인이 완료되면 전역 메뉴에서 _Commerce_ &rarr; _Products_ 로 이동하고 모든 제품이 표시되는지 확인하여 성공했는지 확인합니다.

## Commerce 2.1.x/2.2.x로 업그레이드

Liferay Commerce를 2.1.x/2.2.x로 업그레이드하려면 적절한 DXP 수정 팩을 적용해야 합니다.

```{note}
1.1.x에서 2.1.x로 업그레이드할 때 2.0.x로의 증분 업그레이드가 **필요하지 않습니다**.
```

예를 들어 Liferay Commerce 2.0.7로 업그레이드하는 경우 - Liferay DXP 7.1을 수정팩 16 이상으로 업그레이드합니다. Liferay DXP 7.2를 사용하는 경우 수정팩 2 또는 3을 적용해야 합니다. DXP 업그레이드에 대한 자세한 내용은 [업그레이드 기본 사항](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/upgrading-liferay/upgrade-basics.html)을 참조하십시오. 업그레이드 경로를 이해하려면 아래 표를 참조하십시오.

| 업그레이드 중         | 필수 수정팩 버전                           |
|:--------------- |:----------------------------------- |
| 라이프레이 커머스 2.0.7 | 라이프레이 DXP 7.1 FP 16+/DXP 7.2 FP 2-3 |
| 라이프레이 커머스 2.1.0 | 라이프레이 DXP 7.1 FP 17+/DXP 7.2 FP 5   |
| 라이프레이 커머스 2.1.3 | 라이프레이 DXP 7.1 FP 24+                |
| 라이프레이 커머스 2.2.0 | 라이프레이 DXP 7.2 FP 13                 |
| 라이프레이 커머스 2.2.1 | 라이프레이 DXP 7.2 FP 15                 |

Commerce 2.0.7에서 2.1.3, 2.2.0 또는 2.2.1로 업그레이드할 때 먼저 Commerce 2.1.0으로 업그레이드해야 합니다. Commerce 버전 2.1.3+는 Liferay DXP 7.1.x만 지원하고 Commerce 버전 2.2.0+는 Liferay DXP 7.2.x만 지원합니다.

```{note}
Liferay DXP 7.1 FP 17+/Commerce 2.1.0 또는 Liferay DXP 7.2 FP5/Commerce 2.1.0으로 업그레이드하면 Commerce 4.0과 함께 제공되는 Liferay DXP 7.4를 비롯한 다른 대상 버전으로 업그레이드할 수 있습니다.
```

### 적절한 수정팩 적용

{bdg-primary}`구독`

Liferay에 대한 적절한 수정 팩은 [도움말 센터](https://customer.liferay.com/downloads)에서 다운로드할 수 있습니다. 다운로드가 완료되면 [Liferay Patching Tool](https://help.liferay.com/hc/articles/360018176551-Using-the-Patching-Tool)을 사용하여 수정 팩을 적용할 수 있습니다. 자세한 내용은 [패치](https://help.liferay.com/hc/en-us/articles/360028810512-Installing-Patches) 설치를 참조하십시오.

Liferay DXP가 [수동으로 설치된 경우](https://help.liferay.com/hc/articles/360017896672-Installing-Liferay-DXP-Manually) (예: WebLogic에서) [Liferay DXP 7.1 WAR에 패치 설치](https://help.liferay.com/hc/articles/360018176651-Installing-patches-on-the-Liferay-DXP-7-1-WAR)을 참조하십시오.

그런 다음 다음 단계에 따라 수정팩이 성공적으로 설치되었는지 확인하십시오.

1. `[Liferay Home]/patching-tool` 폴더로 이동합니다.

1. 다음을 실행하여 수정팩이 적용되었는지 확인하십시오.
    * 리눅스/유닉스: `./patching-tool.sh 정보`
    * Windows: `패치 도구 정보`

    ```
    Detailed patch list:
       [ -] dxp-12-7110 :: Currently not installed; Won't be installed: dxp-14 contains the fixes included in this one :: Built for LIFERAY
       [*I] dxp-14-7110 :: Installed; Will be installed. :: Built for LIFERAY
    ```

Fix Pack은 본질적으로 누적되며 이전에 릴리스된 모든 Fix Pack을 포함합니다. 패치 후 `[Liferay Home]/work` 폴더의 콘텐츠를 삭제하여 배포된 코드의 Liferay DXP 캐시를 제거합니다. 다른 오래된 데이터를 제거하는 방법은 아래를 참조하십시오.

### 다운로드 및 배포

DXP 7.1/7.2의 해당 수정 팩을 실행한 후 다음 단계에 따라 Commerce 2.1.x/2.2.x로 업그레이드하십시오.

1. 라이프레이 커머스를 다운로드하세요.

    * Commerce Enterprise는 [도움말 센터](https://customer.liferay.com/downloads?p_p_id=com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_productAssetCategoryId=118190997&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_fileTypeAssetCategoryId=118191001)에서 사용할 수 있습니다.
    * Commerce Community는 [Liferay Commerce Community 다운로드 페이지에서 사용할 수 있습니다.](https://www.liferay.com/downloads-community)

1. `LPKG` 을 `[Liferay Home]/deploy` 폴더에 배포합니다. Liferay DXP에 애플리케이션을 배포하는 방법에 대한 자세한 내용은 [앱 설치](https://learn.liferay.com/dxp/latest/en/system-administration/installing-and-managing-apps/installing-apps/installing-apps.html)을 참조하십시오.

1. 아래와 유사한 메시지가 응용 프로그램 서버 콘솔에 나타나는지 확인합니다.

    ```
    Processing Liferay Commerce Enterprise x.x.x.lpkg
    ```

    ```
    The portal instance needs to be restarted to complete the installation of file:/../../liferay-commerce-enterprise-1.1.6/osgi/marketplace/Liferay%20Commerce%20-%20API.lpkg
    ```

    ```
    The portal instance needs to be restarted to complete the installation of file:/../../liferay-commerce-enterprise-1.1.6/osgi/marketplace/Liferay%20Commerce%20-%20Impl.lpkg
    ```

1. 애플리케이션 서버를 종료하십시오.

### 부실 데이터 지우기 및 업그레이드 프로세스 확인

1. `[Liferay Home]/osgi/state` 폴더를 삭제합니다. OSGi 폴더에 대한 자세한 내용은 [앱 설치](https://learn.liferay.com/dxp/latest/en/system-administration/installing-and-managing-apps/installing-apps/installing-apps.html)을 참조하십시오.

1. 애플리케이션 서버를 시작하십시오.

1. 애플리케이션 서버의 로그에서 다음과 유사한 메시지를 찾아 업그레이드 프로세스가 시작되었는지 확인합니다.

    ```
    Upgrading com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupCommerceAccountRelUpgradeProcess
    Completed upgrade process com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupCommerceAccountRelUpgradeProcess in 24 ms
    Upgrading com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupRelUpgradeProcess
    Completed upgrade process com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupRelUpgradeProcess in 8 ms
    Upgrading com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupUpgradeProcess
    Completed upgrade process com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupUpgradeProcess in 12 ms
    Upgrading com.liferay.commerce.account.internal.upgrade.v1_3_0.CommerceAccountNameUpgradeProcess
    Starting com.liferay.portal.kernel.upgrade.UpgradeProcess#alter
    Completed com.liferay.portal.kernel.upgrade.UpgradeProcess#alter in 40 ms
    Completed upgrade process com.liferay.commerce.account.internal.upgrade.v1_3_0.CommerceAccountNameUpgradeProcess in 60 ms
    Starting com.liferay.portal.upgrade.internal.index.updater.IndexUpdaterUtil#updateIndexes#Updating database indexes for com.liferay.commerce.account.service
    Dropping stale indexes
    Adding indexes
    ```

    ```
    Verifying com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess
    Starting com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess#verifyMasterCommerceCatalog
    Completed com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess#verifyMasterCommerceCatalog in 2 ms
    Completed verification process com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess in 7 ms
    1 theme for admin-theme is available for use
    1 theme for classic-theme is available for use
    1 theme for minium-theme is available for use
    ```

Liferay Commerce 인스턴스가 업그레이드되었습니다.

### 업그레이드 후 재색인 실행

> Liferay Commerce 2.1 이하

에서 최신 버전으로 업그레이드한 후 전체 검색 재색인을 실행합니다.

1. _제어판_ &rarr; _구성_ &rarr; _검색_으로 이동합니다.
1. _모든 검색 인덱스 재인덱싱_옆에 있는 _실행_ 을 클릭합니다. 완료될 때까지 기다립니다.
1. _제어판_ &rarr; _상거래_ &rarr; _제품_로 이동합니다.
1. 모든 제품이 다시 표시되는지 확인합니다.

재인덱싱이 완료되면 업그레이드된 Liferay Commerce 인스턴스를 사용할 수 있습니다.

## 추가 정보

* [앱 설치](https://learn.liferay.com/dxp/latest/en/system-administration/installing-and-managing-apps/installing-apps/installing-apps.html)
* [Liferay Commerce 수정 전달 방법](../get-help/commerce-enterprise-support/liferay-commerce-fix-delivery-method.md)
