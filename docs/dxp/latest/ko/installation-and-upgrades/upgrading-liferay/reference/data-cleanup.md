# 데이터 정리

{bdg-secondary}`가능 7.3+`

더 이상 사용되지 않는 Liferay 앱 또는 기능 사용을 마치면 해당 데이터를 제거할 수 있습니다. 제어판 또는 [구성 파일](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md) 을 사용하여 데이터 정리를 수행할 수 있습니다.

사용하지 않는 기능에서 데이터를 정리하는 방법은 다음과 같습니다.

1. *제어판*에서 *시스템 설정* &rarr; *업그레이드* ( *플랫폼* 범주) &rarr; *데이터 정리*로 이동합니다. 데이터 정리 화면이 나타납니다.

    ![데이터 정리는 더 이상 사용되지 않는 Liferay 애플리케이션에서 데이터를 제거하기 위한 인터페이스를 제공합니다.](./data-cleanup/images/01.png)

1. 정리할 모듈을 선택하고 *저장*을 클릭합니다.

    ```{note}
    정리 설정을 [구성 파일](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md)에 저장하려면 *Actions * 메뉴를 클릭하고 *내보내기*를 선택합니다.
    ```

   데이터 정리가 실행됩니다.

서버에 더 이상 사용되지 않는 데이터의 부담이 없으며 모든 모듈에 대해 데이터 정리가 자동으로 비활성화됩니다.

```{note}
데이터 정리를 실행한 후(구성 파일을 통해서라도) DXP는 기본적으로 모든 모듈에 대해 자동으로 비활성화합니다. 이는 불필요하고 중복된 데이터 정리를 방지합니다.

7.4 이전 버전에서는 데이터 정리 설정이 유지됩니다. 이러한 이전 버전에서 정리를 비활성화하려면 데이터 정리 화면에서 모든 모듈을 선택 취소하고 *저장*을 클릭하거나 `com.liferay.data.cleanup.internal.configuration.DataCleanupConfiguration.config`에서 모듈 정리 키 `false`를 설정하십시오. 구성 파일](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md).
```

```{note}
`com.liferay.data.cleanup을 사용하여 서버 시작 시([Liferay Docker 컨테이너](../upgrade-basics/upgrading-via-docker.md) 또는 로컬 시스템에서) 모듈 데이터를 정리할 수도 있습니다. .internal.configuration.DataCleanupConfiguration.config` [구성 파일](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md). 정리 후 `osgi/configs` 폴더에서 구성 파일을 제거하여 후속 서버 시작 시 정리가 다시 실행되지 않도록 합니다.
```

## 추가 정보

* [데이터 제거](./data-removal.md)
* [구성 파일 사용](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md)
* [Docker를 통한 업그레이드](../upgrade-basics/upgrading-via-docker.md)
* [컨테이너에 파일 제공](../../installing-liferay/using-liferay-docker-images/providing-files-to-the-container.md)
* [업그레이드 도구 사용](../upgrade-basics/using-the-database-upgrade-tool.md)