# 자동 업그레이드를 통한 업그레이드

인스턴스를 시작하기 전에 포털 속성을 통해 자동 업그레이드 ** 활성화하여 데이터베이스를 자동으로 업그레이드할 수 있습니다.

```{important}
**항상** 업그레이드하기 전에 데이터베이스와 기존 설치를 [백업](../../maintaining-a-liferay-installation/backing-up.md)하세요. 백업 복사본에서 업그레이드 프로세스를 테스트하는 것이 좋습니다.
```

## Tomcat 번들로 업그레이드

1. [준비 및 계획](../upgrade-basics.md#preparation-and-planning) 단계를 검토하고 출판, 맞춤형 개발, 데이터베이스 정리 등과 같은 기능을 고려했는지 확인하세요.

1. [업그레이드에 사용할](../../installing-liferay/installing-a-liferay-tomcat-bundle.md#download) Liferay-Tomcat 번들을 다운로드하세요.

1. 호스트 사이트에 번들을 추출합니다.

1. [처음으로 새 번들을 시작합니다.](../../installing-liferay/running-liferay-for-the-first-time.md). 설치 마법사가 나타납니다.

1. 데이터베이스 섹션에서 **변경** 클릭하고 Liferay 설치의 데이터베이스 설정을 입력합니다.

   ![설정 마법사의 데이터베이스 섹션에 데이터베이스 설정을 입력합니다.](./upgrading-via-auto-upgrade/images/01.png)

1. **구성 완료** 클릭합니다. 데이터베이스 설정은 [Liferay 홈 폴더](../../reference/liferay-home.md)의 `Portal-setup-wizard.properties` 파일에 저장됩니다.

1. 동일한 Liferay 홈 폴더에서 `Portal-ext.properties` 파일을 만듭니다. 구성 옵션은 이 [포털 속성](../../reference/portal-properties.md) 파일에서 설정됩니다.

1. 파일을 열고 `Upgrade.database.auto.run=true`설정하십시오.

1. (선택 사항) `업그레이드.report.enabled=true` 설정하여 [업그레이드 보고](../reference/upgrade-report.md)활성화합니다.

1. (선택 사항) `업그레이드.log.context.enabled=true` 설정하여 [업그레이드 로그 컨텍스트](../reference/upgrade-log-context.md)활성화합니다.

1. 속성 파일을 저장하고 [Liferay를 다시 시작](../../installing-liferay/running-liferay-for-the-first-time.md#restart-the-server) 합니다.

1. Liferay가 다시 시작되면 데이터베이스가 자동으로 업데이트되고 콘솔 로그에 진행 상황이 표시됩니다. 업그레이드 보고를 활성화한 경우 보고서는 완료 후 `Liferay_Home/reports` 폴더에 있습니다.

```{note}
업그레이드 후에도 Liferay를 계속 사용하려면 'upgrade.database.auto.run' 속성을 제거하거나 값을 'false'로 설정하세요.
```

## 관련 주제

* [업그레이드 기본 사항](../upgrade-basics.md)
* [데이터베이스 업그레이드 옵션](../reference/database-upgrade-options.md)
* [데이터베이스 업그레이드 도구 사용](./using-the-database-upgrade-tool.md)
* [맞춤형 개발 업그레이드](../upgrading-custom-development.md)
* [업그레이드 문제 해결](../reference/troubleshooting-upgrades.md)
* [MBean으로 업그레이드 모니터링](../reference/monitoring-upgrades-with-mbeans.md)
