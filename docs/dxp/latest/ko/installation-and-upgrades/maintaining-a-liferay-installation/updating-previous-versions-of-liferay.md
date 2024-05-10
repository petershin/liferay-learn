# Liferay의 이전 버전 업데이트

업데이트를 최신 상태로 유지하면 최상의 보안과 품질을 얻을 수 있습니다.

* **보안 업데이트** 은 최신 보안 문제를 즉시 해결하는 릴리스입니다.

* **업데이트** 은 최신 보안 업데이트, 확인된 버그 수정 및 새로운 기능이 포함된 릴리스입니다. 이 기능은 기본적으로 비활성화되어 있지만 원할 때 UI에서 옵트인할 수 있습니다.

여기서는 새로운 Liferay Docker 이미지로 업데이트하고, 새로운 Liferay Tomcat 번들로 업데이트하고, 애플리케이션 서버 Liferay 설치를 업데이트하는 방법을 알아봅니다.

```{warning}
**항상** Liferay DXP/Portal을 업데이트하기 전에 데이터베이스와 설치를 [백업](./backing-up.md)하십시오.
```

```{important}
Liferay DXP 7.3 SP3 이전 버전은 패치 모델을 대신 사용합니다. Liferay DXP 7.3 SP3 이전 버전을 사용 중인 경우 [Patching DXP](./patching-dxp-7-3-and-earlier.md)를 참조하십시오.
```

```{note}
Liferay DXP/Portal 일반 가용성(GA) 릴리스는 소스 코드에서 빌드됩니다. 업데이트 및 보안 업데이트는 GA를 따르고 소스 코드에서도 빌드됩니다.
```

## 새 Docker 이미지로 업데이트

1. 현재 Docker 컨테이너를 종료합니다.

1. Liferay 캐시를 정리하십시오.

    `[Liferay Home]/osgi/state` 폴더를 삭제합니다.

    ```bash
    cd [Liferay Home]
    rm -rf osgi/state
    ```

    `[Liferay Home]/work` 폴더를 비웁니다.

    ```bash
    rm -rf work/*
    ```

    애플리케이션 서버 캐시를 삭제하십시오. 캐시를 찾을 수 있는 사이트에 대해서는 응용 프로그램 서버 공급업체의 설명서를 참조하십시오.

    ```{note}
    모듈의 변경 사항이 내부에만 있는 경우 변경 사항은 OSGi 프레임워크에 보이지 않고 모듈이 설치된 상태로 유지되며 모듈의 상태가 지속됩니다. 다음 서버 시작 전에 OSGi 번들 상태 정보를 지우면 해당 모듈이 적절한 상태로 다시 설치됩니다.
    ```

1. Docker 허브에서 Liferay Docker 이미지 및 태그 정보 찾기:

   * [라이프레이 DXP 이미지](https://hub.docker.com/r/liferay/dxp)
   * [Liferay 포털 이미지](https://hub.docker.com/r/liferay/portal)

1. 데이터베이스 변경 사항 또는 색인 변경 사항에 대한 릴리스 정보를 확인하십시오.

    데이터베이스 변경 사항이 있는 경우 `docker run` 명령에서 이 환경 설정을 사용하여 데이터베이스 업그레이드가 자동으로 실행되도록 합니다.

    ```bash
    -e LIFERAY_UPGRADE_PERIOD_DATABASE_PERIOD_AUTO_PERIOD_RUN=true
    ```

    인덱스 변경 사항이 있는 경우 `docker run` 명령에서 이 환경 설정을 사용하여 인덱스 업데이트를 활성화합니다.

    ```bash
    -e LIFERAY_DATABASE_PERIOD_INDEXES_PERIOD_UPDATE_PERIOD_ON_PERIOD_STARTUP=true
    ```

1. 현재 환경 및 매개변수와 이전 단계의 필수 데이터베이스/인덱스 환경 설정을 사용하여 새 Docker 이미지를 실행합니다. 예를 들어 다음은 [바인드](../installing-liferay/using-liferay-docker-images/providing-files-to-the-container.md) 라는 로컬 폴더 `liferay` 을 새 이미지에 마운트하는 이미지를 실행하기 위한 명령입니다.

    ```bash
    docker run -it -m 8g -p 8080:8080 \
     -v $(pwd)/liferay:/mnt/liferay \
     liferay/[place image name here]:[place tag here]
    ```

1. `docker run` 명령에서 데이터베이스 업그레이드 또는 인덱스 업데이트를 활성화한 경우 콘솔 및 로그는 모든 업그레이드 실패, 오류 및 업그레이드할 추가 선택적 모듈을 보고합니다. [Gogo Shell 명령](../upgrading-liferay/upgrade-stability-and-performance/upgrading-modules-using-gogo-shell.md) 을 사용하여 문제를 해결할 수 있습니다. 업그레이드가 성공적으로 완료되면 Docker 컨테이너를 중지하고 새 컨테이너를 생성하여 데이터베이스 업그레이드 및 인덱스 업데이트 환경 설정 없이 `docker run` 명령 **을 실행** .

새로운 Liferay 업데이트 Docker 이미지에서 실행 중입니다.

## 새 Liferay Tomcat 번들로 업데이트

1. 수정된 시스템 설정( [파일 저장소](../../system-administration/file-storage.md) 및 [Elasticsearch](../../using-search/installing-and-upgrading-a-search-engine/elasticsearch/connecting-to-elasticsearch.md) 설정 포함)을 [`.config` 파일](../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md#creating-configuration-files) 로 내보내고 `[Liferay Home]/osgi/configs/` 폴더에 복사합니다.

    예를 들어 [Advanced File System Store](../../system-administration/file-storage.md) 또는 [단순 파일 시스템 저장소](../../system-administration/file-storage/other-file-store-types/simple-file-system-store.md) 을 사용하는 경우 파일 저장소 설정을 [`.config` 파일](../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md#creating-configuration-files) 로 내보내고 `[Liferay Home]/osgi/configs에 복사합니다. /` 폴더. 다음은 필수 `rootDir` 매개변수가 있는 `com.liferay.portal.store.file.system.configuration.AdvancedFileSystemStoreConfiguration.config` 파일의 예입니다.

    ```properties
    rootDir="data/document_library"
    ```

1. [커머스](https://learn.liferay.com/w/commerce/index) 을 사용 중이고 릴리스 정보에 Commerce용 데이터베이스 업그레이드가 언급되어 있는 경우 업그레이드를 준비하십시오. 자세한 내용은 [Liferay Commerce 업그레이드](https://learn.liferay.com/w/commerce/installation-and-upgrades/upgrading-liferay-commerce) 업그레이드를 참조하십시오.

1. 애플리케이션 서버를 종료하십시오.

    원인:

    * Unix 스타일 시스템에서는 일반적으로 실행 중인 파일을 교체할 수 있지만 이전 파일은 메모리에 상주합니다.
    * Windows 시스템에서 사용 중인 파일은 잠겨 있으며 패치할 수 없습니다.

1. [설치를](./backing-up.md) 백업합니다.

1. [도움말 센터](https://help.liferay.com/hc) (구독자) 또는 [커뮤니티 다운로드](https://www.liferay.com/downloads-community) 에서 원하는 Liferay DXP/Portal Tomcat 번들 업데이트를 다운로드합니다.

1. 임의의 사이트에 번들의 압축을 풉니다.

1. 새 번들의 `[Liferay Home]/data` 폴더를 [백업](./backing-up.md)의 `[Liferay Home]/data` 폴더로 교체합니다.

1. 다음 파일을 [백업](./backing-up.md) 에서 새 설치로 복사합니다.

    * 구성 파일(`.config` 파일)
    * DXP 활성화 키(구독자)
    * [포털 속성](../reference/portal-properties.md) (예: `portal-ext.properties`)

    자세한 내용은 [구성 및 속성 마이그레이션](../upgrading-liferay/migrating-configurations-and-properties.md) 을 참조하십시오.

1. [backup](./backing-up.md)에서 새 설치로 Tomcat 사용자 지정(예: `[tomcat 버전]/conf` 폴더 내용 및 추가된 라이브러리)을 복제합니다.
   
1. 사용자 정의 위젯 및 모듈을 새 설치에 복사하십시오.

1. 릴리스 정보에서 데이터베이스 변경 사항을 언급하는 경우 호환되는 [데이터베이스 업그레이드 옵션](../upgrading-liferay/reference/database-upgrade-options.md) 을 사용하여 모든 필수 변경 사항과 원하는 선택적 변경 사항을 적용하십시오.

1. 애플리케이션 서버를 시작합니다.

Liferay 업데이트 Tomcat 번들에서 실행 중입니다.

## 애플리케이션 서버 설치 업데이트

1. 업데이트의 `.war` 파일과 OSGi 종속성 ZIP 파일을 다운로드합니다.

    * DXP: 도움말 센터 [다운로드](https://customer.liferay.com/downloads)
    * 포털: Liferay 커뮤니티 [다운로드](https://www.liferay.com/downloads-community)

1. 애플리케이션 서버를 종료하십시오.
   
   원인:

    * Unix 스타일 시스템에서는 일반적으로 실행 중인 파일을 교체할 수 있지만 이전 파일은 메모리에 상주합니다.
    * Windows 시스템에서 사용 중인 파일은 잠겨 있으며 패치할 수 없습니다.

1. 애플리케이션 서버 설치에서 기존 Liferay 웹 애플리케이션 위에 `.war` 파일 콘텐츠를 추출합니다.
   
   다음은 지원되는 애플리케이션 서버에서의 Liferay 설치에 대한 자세한 정보에 대한 링크입니다.

    * [수코양이](../installing-liferay/installing-liferay-on-an-application-server/installing-on-tomcat.md)
    * [와일드플라이](../installing-liferay/installing-liferay-on-an-application-server/installing-on-wildfly.md)
    * [제이보스 EAP](../installing-liferay/installing-liferay-on-an-application-server/installing-on-jboss-eap.md)
    * [웹로직](../installing-liferay/installing-liferay-on-an-application-server/installing-on-weblogic.md)
    * [WebSphere](../installing-liferay/installing-liferay-on-an-application-server/installing-on-websphere.md)

1. OSGi 종속성 ZIP 파일의 내용을 `[Liferay Home]/osgi` 폴더에 병합합니다.

1. Liferay 캐시를 정리하십시오.
   
   `[Liferay Home]/osgi/state` 폴더를 삭제합니다. 

    ```bash
    cd [Liferay Home]
    rm -rf osgi/state
    ```

`[Liferay Home]/work` 폴더를 비웁니다. 

    ```bash
    rm -rf work/*
    ```

애플리케이션 서버 캐시를 삭제하십시오. 캐시를 찾을 수 있는 사이트에 대해서는 응용 프로그램 서버 공급업체의 설명서를 참조하십시오. 

    ```{note}
    모듈의 변경 사항이 내부에만 있는 경우 변경 사항은 OSGi 프레임워크에 보이지 않고 모듈이 설치된 상태로 유지되며 모듈의 상태가 지속됩니다. 다음 서버 시작 전에 OSGi 번들 상태 정보를 지우면 해당 모듈이 적절한 상태로 다시 설치됩니다.
    ```

1. 릴리스 정보에서 데이터베이스 변경 사항을 언급하는 경우 호환되는 [데이터베이스 업그레이드 옵션](../upgrading-liferay/reference/database-upgrade-options.md) 을 사용하여 모든 필수 변경 사항과 원하는 선택적 변경 사항을 적용하십시오.

1. 애플리케이션 서버를 다시 시작하십시오.

축하합니다! Liferay 인스턴스가 업데이트되어 실행 중입니다.
## 관련 주제

* [백업](./backing-up.md)
* [핫픽스 적용](./applying-a-hotfix.md)
* [데이터베이스 업그레이드 옵션](../upgrading-liferay/reference/database-upgrade-options.md)
