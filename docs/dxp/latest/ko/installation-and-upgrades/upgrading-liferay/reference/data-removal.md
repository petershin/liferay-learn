# 데이터 제거

{bdg-secondary}`가능 7.4+`

현재 Liferay 기능에는 불필요한 데이터가 있을 수 있습니다. 데이터 제거 도구는 이 데이터를 제거합니다.

사용하지 않는 데이터를 제거하는 방법은 다음과 같습니다.

1. *제어판*에서 *시스템 설정* &rarr; *업그레이드* ( *플랫폼* 범주) &rarr; *데이터 제거*로 이동합니다. 데이터 제거 화면이 나타납니다.

    ![다음은 데이터 제거 화면입니다.](./data-removal/images/01.png)

1. 제거할 데이터 유형을 선택하고 *저장*을 클릭합니다.

사용되지 않는 데이터가 제거됩니다.

설정을 [구성 파일](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md)에 저장하려면 *작업* 메뉴를 클릭하고 *내보내기*를 선택하십시오.

사용하지 않는 데이터를 제거하려면 서버 시작 시 이 `com.liferay.data.cleanup.internal.configuration.DataRemovalConfiguration.config` 구성 파일을 사용하십시오. 파일에서 `removeExpiredJournalArticles` 키를 `true` 으로 설정합니다. 데이터 제거 후 `osgi/configs` 폴더에서 구성 파일을 제거하여 후속 서버 시작 시 파일이 실행되지 않도록 합니다.

## 추가 정보

* [데이터 정리](./data-cleanup.md)
* [Docker를 통한 업그레이드](../upgrade-basics/upgrading-via-docker.md)
* [업그레이드 도구 사용](../upgrade-basics/using-the-database-upgrade-tool.md)