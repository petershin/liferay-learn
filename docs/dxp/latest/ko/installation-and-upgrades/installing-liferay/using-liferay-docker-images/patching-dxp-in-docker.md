# Docker에서 DXP 패치

Liferay [패치](../../maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier.md) 은 DXP 문제를 수정하고 Patching Tool은 패치를 적용합니다. [Docker Hub](https://hub.docker.com/r/liferay/dxp) 에서 Liferay는 각각 새로운 [수정팩](../../maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier.md#fix-packs) , [보안 수정팩](../../maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier.md#scurity-fix-packs) 및 [서비스팩](../../maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier.md#service-packs) 로 미리 채워진 이미지를 제공합니다. Liferay는 또한 DXP 컨테이너에 설치할 [개의 보안 수정 팩](../../maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier.md#scurity-fix-packs) , [핫픽스](../../maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier.md#hotfixes) 및 새로운 [패치 도구](../../maintaining-a-liferay-installation/reference/installing-the-patching-tool.md) 버전을 제공합니다.

> 기업 구독

```{important}
**항상** 패치하기 전에 데이터베이스와 설치를 [백업](../../maintaining-a-liferay-installation/backing-up.md)하십시오.
```

## 수정팩, 보안 수정팩 및 서비스 팩 이미지 사용

Fix Pack, Security Fix Pack 및 Service Pack 이미지는 [Slim Bundles](../../maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier/advanced-patching-for-dxp-7-2/using-slim-bundles.md)을 기반으로 합니다. Slim Bundles는 일반 [Liferay Tomcat 번들](../installing-a-liferay-tomcat-bundle.md)보다 더 빠르게 시작하고 설치 공간이 더 작습니다. 그러나 Slim Bundle에는 하나의 패치만 적용할 수 있습니다. 따라서 이러한 이미지에는 다음과 같은 패치 제한이 있습니다.

* 수정 팩 및 서비스 팩 이미지는 핫픽스 또는 보안 수정 팩과 같은 하나의 추가 패치만 받을 수 있습니다.

* 보안 수정팩 이미지는 패치할 수 없습니다. 이미 보안 수정 팩으로 패치된 수정 팩으로 구성됩니다.

새 수정 팩, 보안 수정 팩 또는 서비스 팩 이미지를 사용하려면 해당 이미지를 기반으로 하는 컨테이너로 마이그레이션해야 합니다. 다음은 DXP 컨테이너에서 새 패치 이미지로 마이그레이션하는 방법입니다.

1. [현재 DXP 컨테이너](../using-liferay-docker-images.md#stopping-a-container) 을 중지합니다.

1. [DXP 컨테이너를 사용자 지정하는 데 사용한 파일](../../maintaining-a-liferay-installation/backing-up.md) 를 백업합니다.

    ```bash
    git commit -a
    ```

1. [Docker Hub](https://hub.docker.com/r/liferay/dxp) 에서 새 이미지를 다운로드합니다.

    ```bash
    docker pull liferay/dxp:[tag]
    ```

1. 이미지를 기반으로 하고 백업의 아티팩트 및 구성 파일을 사용하는 새 컨테이너를 만듭니다.

   예를 들어 아티팩트와 파일을 다음과 같은 로컬 폴더 구조에 넣을 수 있습니다.

    ```
    [host folder]
    ├───deploy
    ├───files
    ├───patching
    └───scripts
    ```
   그런 다음 호스트 폴더를 컨테이너의 `/mnt/liferay` 폴더에 마운트](./providing-files-to-the-container.md#bind-mounting-a-host-folder-to-mnt-liferay) 당신의`run` 명령.

    ```bash
    docker run ... -v [host folder path]:/mnt/liferay liferay/dxp:[tag]
    ```

DXP는 아티팩트와 파일을 사용하여 새 컨테이너에서 실행됩니다.

## 패치 설치

수정 팩 이미지 및 서비스 팩 이미지는 하나의 추가 패치를 받는 것으로 제한됩니다. 패치는 핫픽스, 보안 수정 팩 또는 둘을 결합한 패치일 수 있습니다. 이 마지막 유형의 패치를 받으려면 [헬프 센터 티켓](https://help.liferay.com/hc) 을 만들고 현재 수정 팩 수준 외에 최신 보안 수정 사항 및 제품 수정 사항이 포함된 패치를 요청하십시오.

패치 요구 사항:

1. 컨테이너에 기존 패치가 없습니다. 새 패치를 적용하기 전에 모든 기존 패치를 [되돌려야](#reverting-a-patch) .

1. 이미지는 Security Fix Pack 이미지가 아니어야 합니다. 해당 이미지에는 이미 패치(보안 수정 팩)가 포함되어 있습니다.

1. 컨테이너의 `/mnt/liferay/patching` 폴더에 매핑되는 볼륨 또는 바인드 마운트의 폴더입니다. 자세한 내용은 [컨테이너](./providing-files-to-the-container.md) 에 파일 제공을 참조하십시오.

컨테이너에 패치를 설치하는 방법에는 두 가지가 있습니다.

1. [기존 컨테이너에 패치 설치](#installing-to-an-existing-container) .

1. [새 컨테이너에 패치 설치](#installing-to-a-new-container) .



### 기존 컨테이너에 설치

다음은 기존 컨테이너에 패치를 설치하는 단계입니다.

1. [현재 컨테이너](../using-liferay-docker-images.md#stopping-a-container) 을 중지합니다.

1. [패치를 다운로드하고](https://customer.liferay.com/downloads) 볼륨의 폴더에 복사하거나 [컨테이너의 `/mnt/liferay/patching` 폴더에 매핑되는 바인드 마운트](./providing-files-to-the-container.md) 에 복사합니다.

1. [컨테이너를 다시 시작하십시오](../using-liferay-docker-images.md#restartings-a-container) .

### 새 컨테이너에 설치

새 컨테이너에 패치를 설치하는 단계는 다음과 같습니다.

1. 호스트 폴더와 `patching`이라는 하위 폴더를 만듭니다. 

    ```bash
    mkdir -p [host folder]/patching
    ```

1. [패치를 다운로드하고](https://customer.liferay.com/downloads) [호스트 폴더]/patching `폴더에 복사`. 예를 들어, 

   ```bash
   cp ~/[patch file] [host folder]/patching
   ```

1. [실행 중인 경우 현재 DXP 컨테이너](../using-liferay-docker-images.md#stopping-a-container) 을 중지합니다.

1. 패치 파일의 폴더를 컨테이너의 `/mnt/liferay/patching` 폴더에 매핑하는 바인드 마운트가 있는 컨테이너를 만듭니다. 이 예제의 패치 파일은 `patching`폴더에 있으므로 [마운트](./providing-files-to-the-container.md#bind-mounting-a-host-folder-to-mnt-liferay) 의 상위 폴더(`[호스트 폴더]`)를 컨테이너의 `/mnt/liferay` 폴더에 바인딩할 수 있습니다. 이렇게 하면 DXP에 적용하기 위해 패치에 액세스할 수 있습니다. 

    ```bash
    docker run ... -v [host folder path]:/mnt/liferay liferay/dxp:[tag]
    ```

    ```{note}
    바인드 마운트 지정에 대한 자세한 내용은 [컨테이너에 파일 제공](./providing-files-to-the-container.md)을 참조하세요.
    ```

Patching Tool이 패치를 설치하고 DXP가 실행됩니다.

```{important}
패치 도구가 `[패치 파일]이 패치 도구 버전 [x.y.z]과 호환되지 않습니다`라는 메시지를 보고하면 최신 패치 도구를 설치하십시오. 자세한 내용은 [패치 도구 설치](#installing-the-patching-tool) 를 참조하세요.
```

## 패치 되돌리기

컨테이너에서 패치를 되돌리거나 패치가 적용된 컨테이너에 다른 패치를 설치하려면 컨테이너를 제거하고 새 컨테이너를 만들어야 합니다.

1. [컨테이너](../using-liferay-docker-images.md#stopping-a-container) 을 중지합니다. 

    ```bash
    docker stop [container]
    ```

1. [컨테이너의 아티팩트 및 파일을](../../maintaining-a-liferay-installation/backing-up.md) 백업합니다.

1. 용기를 제거하십시오. 

    ```bash
    docker rm [container]
    ```

1. 이전에 사용한 `docker run` 인수를 사용하여 동일한 이미지 또는 호환되는 수정 팩 레벨이 있는 이미지에서 새 컨테이너를 작성하십시오. 볼륨 또는 [bind mount](./providing-files-to-the-container.md#bind-mounting-a-host-folder-to-mnt-liferay) 을 통해 원하는 패치를 적용하십시오.

## 패치 도구 업데이트

현재 패치 도구가 설치 중인 패치와 호환되지 않는 경우 패치 도구는 다음 메시지를 보고합니다. `[패치 파일]은 패치 도구 버전 [x.y.z]`와 호환되지 않습니다. 여기서 `xyz` 는 도구의 주 버전, 부 버전 및 마이크로 버전입니다. 숫자.

새로운 [Patching Tool](../../maintaining-a-liferay-installation/reference/installing-the-patching-tool.md) 버전을 설치하는 방법은 다음과 같습니다.

1. [고객 포털](https://customer.liferay.com/downloads?p_p_id=com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_productAssetCategoryId=118191019&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_fileTypeAssetCategoryId=118191066) 에서 최신 패칭 도구를 다운로드하십시오.

1. Patching Tool ZIP 파일 이름에 이 형식이 없으면 `patching-tool-xyzzip` 해당 형식을 사용하도록 이름을 바꿉니다. 예를 들어, 

    ```bash
    mv patching-tool.zip patching-tool-2.0.15.zip
    ```

1. 패치 도구 ZIP 파일을 컨테이너의 `/mnt/liferay/patching` 폴더를 통해 컨테이너에 설치합니다. 이는 [핫픽스 및 보안 수정 팩이 설치된 것과 같은 방식입니다](#installing-a-hotfix-or-security-fix-pack) .

컨테이너를 다시 시작하거나 새 컨테이너를 실행할 때 컨테이너 진입점은 새 패치 도구를 설치합니다.

## 패치용 데이터베이스 업그레이드

패치에서 데이터베이스를 업그레이드해야 하는 경우 컨테이너화되지 않은 환경에서 데이터베이스 업그레이드 도구를 사용하여 업그레이드해야 합니다.

1. 사용 중인 Liferay 버전의 [Liferay Tomcat 번들 설치](../installing-a-liferay-tomcat-bundle.md) 을 설치합니다.

1. 패치를 설치에 적용하십시오. 자세한 내용은 [Liferay](../../maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier.md) 패치를 참조하십시오.

1. 데이터베이스 업그레이드 도구를 사용하여 데이터베이스를 업그레이드하십시오. 자세한 내용은 [데이터베이스 업그레이드 도구 사용](../../upgrading-liferay/upgrade-basics/using-the-database-upgrade-tool.md) 을 참조하십시오.

데이터베이스가 업그레이드된 후 해당 데이터베이스를 사용하는 컨테이너를 실행하십시오.

## 추가 정보

* [컨테이너에 앱 및 기타 아티팩트 설치](./installing-apps-and-other-artifacts-to-containers.md)
* [Liferay Docker 이미지 사용](../using-liferay-docker-images.md)
* [컨테이너에 파일 제공](./providing-files-to-the-container.md)
* [컨테이너 수명 주기 및 API](./container-lifecycle-and-api.md)
* [데이터베이스 업그레이드 도구 사용](../../upgrading-liferay/upgrade-basics/using-the-database-upgrade-tool.md)