# Docker를 통한 업그레이드

자동 업그레이드가 활성화된 상태에서 Liferay Docker 이미지를 실행하면 데이터베이스 업그레이드 도구를 사용하여 Liferay 시작 시 데이터베이스를 투명하게 업그레이드합니다. 업그레이드가 완료된 후 [해당 Docker 컨테이너를 통해 Liferay 사용](../../../installation-and-upgrades/installing-liferay/using-liferay-docker-images.md)을 계속하거나 새 업그레이드된 데이터베이스에 Liferay 온프레미스 설치.

```{important}
Docker가 없으신가요? 먼저 여기로 이동하세요:

* [Linux](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
* [Windows](https://docs.docker.com/docker-for-windows/install/)
* [OSX](https://docs.docker.com/docker-for-mac/install/)
```


| DXP 에디션         | 심상 화랑 심상                                            | 꼬리표                                                |
|:--------------- |:--------------------------------------------------- |:-------------------------------------------------- |
| Liferay DXP(구독) | [`dxp`](https://hub.docker.com/r/liferay/dxp)       | [여기](https://hub.docker.com/r/liferay/dxp/tags)    |
| Liferay Portal  | [`portal`](https://hub.docker.com/r/liferay/portal) | [여기](https://hub.docker.com/r/liferay/portal/tags) |

```{important}
엔터프라이즈 구독자 설치 및 중요 설치에 대한 업그레이드는 데이터베이스 업그레이드 도구를 사용하여 수행해야 합니다. 자세한 내용은 [데이터베이스 업그레이드 도구 사용](./using-the-database-upgrade-tool.md)을 참조하세요.
```

```{important}
**항상** 업그레이드하기 전에 데이터베이스와 기존 설치를 [백업](../../유지관리-라이프레이-설치/백업.md)하세요. 백업 복사본에서 업그레이드 프로세스를 테스트하는 것이 좋습니다.
```

## 최신 Docker 이미지로 업그레이드하기

다음은 Docker 이미지로 업그레이드하는 단계입니다:

1. 새 Liferay Docker 이미지와 함께 사용할 임의의 폴더를 만들고 `파일` 및 `배포`라는 하위 폴더를 만듭니다. 예를 들어 

    ```
    mkdir -p new-version/files
    ```

    ```
    mkdir -p new-version/deploy
    ```

    * `파일`: Docker 컨테이너는 이 폴더의 파일을 컨테이너의 [Liferay Home](../../reference/liferay-home.md) 폴더로 복사합니다.

    * `deploy`: Docker 컨테이너가 이 폴더의 아티팩트를 컨테이너의 자동 배포 폴더로 복사합니다.

1. [커머스](https://learn.liferay.com/w/commerce/index) 를 사용 중인 경우 업그레이드를 준비하세요. 자세한 내용은 [Liferay Commerce 업그레이드](https://learn.liferay.com/w/commerce/installation-and-upgrades/upgrading-liferay-commerce) 를 참조하세요.

1. Liferay 데이터베이스 업그레이드와 함께 마켓플레이스 앱 데이터를 업그레이드하려면 [새 Liferay 버전이 적용되는 각 앱의 최신 버전(](../../../system-administration/installing-and-managing-apps/installing-apps/downloading-apps.md) )을 다운로드하여 `새 버전/배포` 폴더에 복사하세요. 그렇지 않으면 데이터베이스 업그레이드 후 앱을 설치하고 [업그레이드 후 고려 사항](./post-upgrade-considerations.md)에 설명된 대로 데이터를 업그레이드할 수 있습니다.

1. 임베디드 [Elasticsearch](../../../using-search/installing-and-upgrading-a-search-engine/elasticsearch/getting-started-with-elasticsearch.md) 엔진 또는 로컬 [파일 저장소 \(문서 라이브러리\)](../../../system-administration/file-storage.md)를 사용하는 경우 `[Liferay Home]/data` 폴더를 새 `파일` 폴더에 복사하여 `new-version/files/data`를 생성합니다.

1. 백업에서 [Liferay 홈 파일](../../maintaining-a-liferay-installation/backing-up.md#liferay-home) 및 [애플리케이션 서버 파일](../../maintaining-a-liferay-installation/backing-up.md#application-server) 을 복사하여 `파일` 폴더의 해당 사이트(새 `[Liferay 홈]`)에 병합합니다. 예를 들어, 활성화 키를 `new-version/files/license/`에 복사합니다. 파일에는 다음이 포함될 수 있지만 이에 국한되지는 않습니다:

    * `/license/*`: 활성화 키. (구독)

    * `/log/*`: 로그 파일.

    * `/osgi/configs/*.config`: [OSGi 구성 파일](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md).

    * `portal-*.properties`: [포털 속성](../../reference/portal-properties.md) 파일(예: `portal-ext.properties`) .

    * `setenv.sh`, `startup.sh`, 기타: 애플리케이션 서버 구성 스크립트.

    * `web.xml`: 포털 웹 애플리케이션 설명자.

1. 7.2로 업그레이드하는 경우, `[Liferay Home]/files/osgi/config/` 폴더에 있는 [구성 파일](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md) 을 사용하여 검색 인덱싱을 비활성화하세요. 예를 들어 

    ```bash
    echo "indexReadOnly=\"true\"" >> new-version/files/osgi/config/com.liferay.portal.search.configuration.IndexStatusManagerConfiguration.config
    ```

1. [고급 파일 시스템 저장소](../../../system-administration/file-storage.md) 또는 [단순 파일 시스템 저장소](../../../system-administration/file-storage/other-file-store-types/simple-file-system-store.md) (저장 사이트가 수정된 경우)를 사용하는 경우, 파일 저장소 설정을 [`.config` 파일](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md#creating-configuration-files) 로 내보낸 후 `new-version/osgi/configs` 폴더에 복사합니다. 

    ```{important}
    고급 파일 시스템 저장소](../../../시스템-관리/파일 저장소.md)를 사용하는 경우 데이터베이스를 업그레이드하기 전에 새 설치에서 `.config` 파일로 구성해야 합니다.

    다음은 필수 `rootDir` 매개변수가 포함된 `com.liferay.portal.store.file.system.configuration.AdvancedFileSystemStoreConfiguration.config` 파일 예시입니다:

    `rootDir="data/document_library"`
    ```

1. 데이터베이스 공급업체에서 권장하는 JDBC 데이터베이스 드라이버를 사용하고 있는지 확인하세요. 예를 들어 MySQL을 사용하는 경우 [`new-version/files/portal-ext.properties`](../../reference/portal-properties.md) 에서 `jdbc.default.driverClassName=com.mysql.cj.jdbc.Driver` 를 설정하고 앱 서버에서 사용하는 MySQL JDBC 드라이버 JAR을 교체합니다. 자세한 내용은 [데이터베이스 드라이버](../migrating-configurations-and-properties.md#database-drivers) 를 참조하세요.

1. (선택 사항) [ `portal-ext.properties` 파일에 JDBC 속성을 추가하여 일괄 삽입(](./using-the-database-upgrade-tool.md#batch-insert-property) )을 활성화합니다.

1. 다음 명령을 사용하여 [마운트된] Docker 이미지(../../installing-liferay/using-liferay-docker-images/providing-files-to-the-container.md)를 새 버전 폴더로 실행합니다. 필요에 따라 이미지 이름, 태그 및 환경 값을 대체합니다.

    ```bash
    docker run -it -m 8g -p 8080:8080 \
     -v $(pwd)/new-version:/mnt/liferay \
     -e LIFERAY_UPGRADE_PERIOD_DATABASE_PERIOD_AUTO_PERIOD_RUN=true \
     liferay/[place image name here]:[place tag here]
    ```

`-v new-version:/mnt/liferay` 인수는 호스트의 `new-version` 폴더를 컨테이너의 `/mnt/liferay` 폴더에 마운트하도록 바인딩합니다. 컨테이너의 라이프레이 홈에 파일을 매핑하는 방법에 대한 자세한 내용은 [컨테이너에 파일 제공](../../installing-liferay/using-liferay-docker-images/providing-files-to-the-container.md) 을 참조하세요.

`-e LIFERAY_UPGRADE_PERIOD_DATABASE_PERIOD_AUTO_PERIOD_RUN=true` 파라미터는 시작 시 데이터베이스 업그레이드가 자동으로 실행되도록 트리거합니다. 

선택적으로 [업그레이드 보고서](../reference/upgrade-report.md)는 `-e LIFERAY_UPGRADE_PERIOD_REPORT_PERIOD_ENABLED=true` 매개변수 및 [업그레이드 로그 컨텍스트](../reference/upgrade-log-context .md)는 `LIFERAY_UPGRADE_PERIOD_LOG_PERIOD_CONTEXT_PERIOD_ENABLED=true` 매개변수로 활성화할 수 있습니다.

2 콘솔 또는 로그에서 데이터베이스 업그레이드 및 서버 시작이 성공했는지 확인합니다. 업그레이드 메시지는 각 업그레이드 프로세스의 시작 및 완료를 보고합니다. 이와 같은 메시지는 서버 시작이 완료되었음을 나타냅니다: 

    ```bash
    org.apache.catalina.startup.Catalina.start Server startup in [x] milliseconds
    ```

업그레이드에 실패하거나 오류가 발생하면 콘솔과 로그에 인쇄됩니다. [Gogo Shell 명령](../upgrade-stability-and-performance/upgrading-modules-using-gogo-shell.md) 을 사용하여 문제를 해결하고 업그레이드를 완료할 수 있습니다.

또한 시작 시 수행되는 이러한 업그레이드는 [에서 모니터링할 수 있습니다(MBeans](../reference/monitoring-upgrades-with-mbeans.md)).

3 실패 또는 오류를 해결한 후에는 [업그레이드 후 고려 사항](./post-upgrade-considerations.md)을 검토하세요.

4 [새 설치에서 포털 속성](../migrating-configurations-and-properties.md#migrating-portal-properties) 을 업데이트합니다.

5 업그레이드한 데이터베이스를 검증합니다.
  
  ![Liferay 랜딩 화면입니다.](./upgrading-via-docker/images/01.png)

이제 데이터베이스 업그레이드가 완료되었습니다!

Docker를 통해 새 Liferay 버전을 계속 사용하려면 새 컨테이너를 생성할 때 사용한 `docker run ...` 명령에서 `-e LIFERAY_UPGRADE_PERIOD_DATABASE_PERIOD_AUTO_PERIOD_RUN=true` 환경 설정을 제거하세요.

```{note}
[Liferay 도커 이미지 사용](../../../설치-업그레이드/설치-라이프레이/사용-라이프레이-도커-이미지.md)에서는 도커 컨테이너 생성, 중지 및 재시작에 대해 설명합니다.
```

## 결론

업그레이드된 데이터베이스로 충분하다면 새로운 Liferay 인스턴스를 사용해 보세요! 업그레이드를 완료하는 데 도움이 더 필요한 경우 이 도움말을 참조하세요:

* [업그레이드 기본 사항](../upgrade-basics.md) 에서 모든 업그레이드 주제를 설명합니다. 아직 해결해야 할 주제가 있을 수 있습니다.

* [데이터베이스 업그레이드 옵션](../reference/database-upgrade-options.md) 에서는 다양한 DXP/Portal 설치 유형에 따라 데이터베이스를 업그레이드하는 모든 방법을 설명합니다.

* [데이터베이스 업그레이드 도구(](./using-the-database-upgrade-tool.md) )를 사용하여 Liferay 서버가 오프라인 상태일 때 데이터베이스를 업그레이드하는 방법을 보여줍니다. 업그레이드가 너무 오래 걸리는 경우 [데이터베이스 튜닝](../upgrade-stability-and-performance/database-tuning-for-upgrades.md), [불필요한 데이터 정리](../upgrade-stability-and-performance/database-pruning-for-faster-upgrades.md), [데이터베이스 업그레이드 도구](./using-the-database-upgrade-tool.md)를 사용해 보세요.

* [사용자 지정 개발 업그레이드](../upgrading-custom-development.md) 에서는 사용자 지정 플러그인 코드를 새 Liferay 버전에 적용하는 방법을 보여 줍니다.

* [클러스터된 설치 유지 관리](../../maintaining-a-liferay-installation/maintaining-clustered-installations.md) 에서는 클러스터된 환경에서 업그레이드하는 방법을 설명합니다.

* [업그레이드 문제 해결](../reference/troubleshooting-upgrades.md)
