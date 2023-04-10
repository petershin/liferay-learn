# Docker를 통한 업그레이드

자동 업그레이드가 활성화된 상태에서 Liferay Docker 이미지를 실행하면 데이터베이스 업그레이드 도구를 사용하여 Liferay 시작 시 데이터베이스를 투명하게 업그레이드합니다. 업그레이드가 완료된 후 [해당 Docker 컨테이너를 통해 Liferay 사용](../../../installation-and-upgrades/installing-liferay/using-liferay-docker-images.md)을 계속하거나 새 업그레이드된 데이터베이스에 Liferay 온프레미스 설치.

```{important}
도커가 없습니까? 먼저 여기로 이동:

* [Linux](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
* [Windows](https://docs.docker.com/docker-for-windows/install /)
* [OSX](https://docs.docker.com/docker-for-mac/install/)
```


| DXP 에디션        | 심상 화랑 심상                                            | 꼬리표                                                |
|:-------------- |:--------------------------------------------------- |:-------------------------------------------------- |
| 라이프레이 DXP(구독)  | [`dxp`](https://hub.docker.com/r/liferay/dxp)       | [여기](https://hub.docker.com/r/liferay/dxp/tags)    |
| Liferay Portal | [`portal`](https://hub.docker.com/r/liferay/portal) | [여기](https://hub.docker.com/r/liferay/portal/tags) |

```{important}
엔터프라이즈 구독자 설치 및 중요 설치에 대한 업그레이드는 데이터베이스 업그레이드 도구를 사용하여 수행해야 합니다. 자세한 내용은 [데이터베이스 업그레이드 도구 사용](./using-the-database-upgrade-tool.md)을 참조하세요.
```

```{important}
**항상** 업그레이드하기 전에 데이터베이스와 기존 설치를 [백업](../../maintaining-a-liferay-installation/backing-up.md)하십시오. 백업 복사본에서 업그레이드 프로세스를 테스트하는 것이 좋습니다.
```

## 최신 Docker 이미지로 업그레이드

Docker 이미지로 업그레이드하는 단계는 다음과 같습니다.

1. 새 Liferay Docker 이미지와 함께 사용할 임의 폴더를 생성하고 `files` 및 `deploy`이라는 하위 폴더를 생성합니다. 예를 들어, 

    ```
    mkdir -p new-version/files
    ```

    ```
    mkdir -p new-version/deploy
    ```

    * `파일`: Docker 컨테이너는 이 폴더에서 컨테이너의 [Liferay Home](../../reference/liferay-home.md) 폴더로 파일을 복사합니다.

    * `배포`: Docker 컨테이너는 이 폴더에서 컨테이너의 자동 배포 폴더로 아티팩트를 복사합니다.

1. [커머스](https://learn.liferay.com/commerce/latest/ko/index.html) 사용하고 있다면 업그레이드할 준비를 하십시오. 자세한 내용은 [Liferay Commerce 업그레이드](https://learn.liferay.com/commerce/latest/ko/installation-and-upgrades/upgrading-liferay-commerce.html) 업그레이드를 참조하십시오.

1. 임베디드 [Elasticsearch](../../../using-search/installing-and-upgrading-a-search-engine/elasticsearch/getting-started-with-elasticsearch.md)를 사용하는 경우 엔진 또는 로컬 [File Store\(Document Library\)](../../../system-administration/file-storage.md)에서 `[Liferay Home]/data` 폴더를 새 ` files` 폴더에 `new-version/files/data`를 만듭니다.
   
   1. 임베디드 [Elasticsearch](../../../using-search/installing-and-upgrading-a-search-engine/elasticsearch/getting-started-with-elasticsearch.md) 엔진 또는 로컬 [File Store \(Document Library\)](../../../system-administration/file-storage.md)사용하는 경우 `[Liferay Home]/data` 폴더를 새 `files` 폴더에 복사하여 `new-version/ 파일/데이터`.

1. [Liferay 홈 파일](../../maintaining-a-liferay-installation/backing-up.md#liferay-home) 및 [응용 프로그램 서버 파일](../../maintaining -a-liferay-installation/backing-up.md#application-server) 을 백업에서 `file` 폴더(새 `[Liferay Home]`)의 해당 사이트로 복사합니다. 예를 들어 활성화 키를 `new-version/files/license/`에 복사합니다. 파일에는 다음이 포함될 수 있지만 이에 국한되지는 않습니다.

    * `/license/*`: 활성화 키. (구독)

    * `/log/*`: 로그 파일.

    * `/osgi/configs/*.config`: [OSGi 구성 파일](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md).

    * `portal-*.properties`: [Portal 속성](../../reference/portal-properties.md) 파일(예: `portal-ext.properties`.

    * `setenv.sh`, `startup.sh`등: 애플리케이션 서버 구성 스크립트.

    * `web.xml`: 포털 웹 애플리케이션 디스크립터.

1. 7.2로 업그레이드하는 경우 `[Liferay Home]/files/osgi/config/` 폴더에 있는 [구성 파일](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md) 사용하여 검색 인덱싱을 비활성화하십시오. 예를 들어, 

    ```bash
    echo "indexReadOnly=\"true\"" >> new-version/files/osgi/config/com.liferay.portal.search.configuration.IndexStatusManagerConfiguration.config
    ```

1. [고급 파일 시스템 저장소](../../../system-administration/file-storage.md) 또는 수정된 저장소 사이트가 있는 [단순 파일 시스템 저장소](../../../system-administration/file-storage/other-file-store-types/simple-file-system-store.md) 사용하는 경우 파일 저장소 설정을 [`.config` 파일](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md#creating-configuration-files) 로 내보내고 `새 버전/osgi/에 복사합니다. 구성` 폴더. 

    ```{important}
    [고급 파일 시스템 저장소](../../../system-administration/file-storage.md)를 사용하는 경우 새 설치에서 `.config` 파일로 구성해야 합니다. 데이터 베이스.

    다음은 필수 `rootDir` 매개변수가 있는 `com.liferay.portal.store.file.system.configuration.AdvancedFileSystemStoreConfiguration.config` 파일의 예입니다.

    `rootDir="data/document_library"`
    ```

1. 데이터베이스 벤더가 권장하는 JDBC 데이터베이스 드라이버를 사용하고 있는지 확인하십시오. 예를 들어 MySQL을 사용하는 경우 `jdbc.default.driverClassName=com.mysql.cj.jdbc.Driver` in [`new-version/files/portal-ext.properties`](../../reference/portal-properties.md) 를 설정하고 MySQL JDBC 드라이버를 교체합니다. 앱 서버에서 사용하는 JAR. 자세한 내용은 [데이터베이스 드라이버](../migrating-configurations-and-properties.md#database-drivers) 참조하십시오.

1. (선택 사항) [JDBC 속성을 `Portal-ext.properties` 파일에 추가하여 일괄 삽입](./using-the-database-upgrade-tool.md#batch-insert-property) 을 활성화합니다.

1. 다음 명령을 사용하여 Docker 이미지 [마운트](../../installing-liferay/using-liferay-docker-images/providing-files-to-the-container.md) 새 버전 폴더에 실행합니다. 필요에 따라 이미지 이름, 태그 및 환경 값을 대체합니다. 

    ```bash
    docker run -it -m 8g -p 8080:8080 \
     -v $(pwd)/new-version:/mnt/liferay \
     -e LIFERAY_UPGRADE_PERIOD_DATABASE_PERIOD_AUTO_PERIOD_RUN=true \
     liferay/[place image name here]:[place tag here]
    ```

`-v new-version:/mnt/liferay` 인수는 호스트의 `new-version` 폴더를 컨테이너의 `/mnt/liferay` 폴더에 바인딩합니다. 컨테이너의 Liferay Home에 대한 매핑 파일에 대한 자세한 내용은 [컨테이너](../../installing-liferay/using-liferay-docker-images/providing-files-to-the-container.md) 에 파일 제공을 참조하십시오.

매개변수 `-e LIFERAY_UPGRADE_PERIOD_DATABASE_PERIOD_AUTO_PERIOD_RUN=true` 데이터베이스 업그레이드를 트리거합니다.

1. 콘솔 또는 로그에서 성공적인 데이터베이스 업그레이드 및 서버 시작을 확인합니다. 업그레이드 메시지는 각 업그레이드 프로세스의 시작 및 완료를 보고합니다. 다음과 같은 메시지는 서버 시작 완료를 나타냅니다. 

    ```bash
    org.apache.catalina.startup.Catalina.start Server startup in [x] milliseconds
    ```

업그레이드 실패 또는 오류가 있는 경우 콘솔 및 로그에 인쇄됩니다. [Gogo Shell 명령](../upgrade-stability-and-performance/upgrading-modules-using-gogo-shell.md) 을 사용하여 문제를 해결하고 업그레이드를 완료할 수 있습니다.

1. 실패 또는 오류를 해결한 후 [업그레이드 후 고려 사항](./post-upgrade-considerations.md)검토하십시오.

1. [새 설치에서 포털 속성](../migrating-configurations-and-properties.md#migrating-portal-properties) 을 업데이트합니다.

1. 업그레이드된 데이터베이스를 검증하십시오.
   
   ![다음은 Liferay 랜딩 화면입니다.](./upgrading-via-docker/images/01.png)

이제 데이터베이스 업그레이드가 완료되었습니다!

Docker를 통해 새 Liferay 버전을 계속 사용하려면 새 컨테이너를 만드는 데 사용한 `docker run ...` 명령에서 `-e LIFERAY_UPGRADE_PERIOD_DATABASE_PERIOD_AUTO_PERIOD_RUN=true` 환경 설정을 제거합니다.

```{note}
[Liferay Docker 이미지 사용](../../../installation-and-upgrades/installing-liferay/using-liferay-docker-images.md)은 Docker 컨테이너 생성, 중지 및 다시 시작을 보여줍니다.
```

## 결론

업그레이드된 데이터베이스만 필요한 경우 새 Liferay 인스턴스를 사용하여 즐기십시오! 업그레이드를 완료하는 데 더 많은 작업이 있는 경우 다음 문서가 완료하는 데 도움이 될 수 있습니다.

* [업그레이드 기본 사항](../upgrade-basics.md) 모든 업그레이드 주제를 설명합니다. 아직 해결해야 할 주제가 있을 수 있습니다.

* [데이터베이스 업그레이드 옵션](../reference/database-upgrade-options.md) 은 다양한 DXP/Portal 설치 유형의 맥락에서 데이터베이스를 업그레이드하는 모든 방법을 설명합니다.

* [데이터베이스 업그레이드 도구 사용](./using-the-database-upgrade-tool.md) Liferay 서버가 오프라인 상태일 때 데이터베이스를 업그레이드하는 방법을 보여줍니다. 업그레이드가 너무 오래 걸리면 [데이터베이스 튜닝](../upgrade-stability-and-performance/database-tuning-for-upgrades.md), [불필요한 데이터 정리](../upgrade-stability-and-performance/database-pruning-for-faster-upgrades.md), [Database Upgrade Tool](./using-the-database-upgrade-tool.md)사용을 고려하십시오.

* [사용자 정의 개발 업그레이드](../upgrading-custom-development.md) 사용자 정의 플러그인 코드를 새로운 Liferay 버전에 적용하는 방법을 보여줍니다.

* [클러스터 설치 유지 관리](../../maintaining-a-liferay-installation/maintaining-clustered-installations.md) 클러스터 환경에서 업그레이드하는 방법을 설명합니다.

* [업그레이드 문제 해결](../reference/troubleshooting-upgrades.md)
