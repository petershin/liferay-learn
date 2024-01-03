# MBean으로 업그레이드 모니터링

{bdg-secondary}`liferay DXP 7.4 U76 / liferay 포털 7.4 GA76`

시작 시 업그레이드가 활성화되면 JVM 관리 도구(예: JConsole)를 통해 MBean으로 업그레이드 프로세스를 모니터링할 수 있습니다. [포털 속성](../../reference/portal-properties.md) 에서 `upgrade.database.auto.run=true`를 설정하여 시작 시 업그레이드를 활성화합니다.

JVM 관리 도구에서 새 연결을 생성하고 Liferay의 Java 프로세스(예: `org.apache.catalina.startup.Bootstrap`)를 선택합니다.

MBeans 탭에서 `com.liferay.portal.upgrade` 카테고리를 선택합니다. '속성'을 선택하세요. 'Result'와 'Type'이라는 두 가지 속성 키를 사용할 수 있습니다.

![Under the MBeans tab, select the com.liferay.portal.upgrade category.](./monitoring-upgrades-with-mbean/images/01.png)

`Result`에는 다음 값이 가능합니다.

* `pending`: 업그레이드 프로세스가 아직 시작되지 않았습니다.
* `running`: 업그레이드 프로세스가 실행 중입니다.
* `failure`: 업그레이드 프로세스가 완료되었으며 업그레이드 프로세스 중에 일부 오류가 기록되었습니다.
- 'unresolved': 업그레이드 프로세스가 완료되었으며 오류가 기록되지 않았지만 OSGi를 사용하여 업그레이드의 완료 여부를 확인할 수 없었습니다. 보류 중인 업그레이드 및/또는 해결되지 않은 종속성이 있을 수 있습니다.
* `경고`: 업그레이드 프로세스가 완료되었으며 오류가 기록되지 않았으며 OSGi 검사도 실패하지 않았습니다. 그러나 업그레이드 중에 일부 경고가 기록되었습니다.
* `성공`: 업그레이드 프로세스가 완료되었으며 업그레이드 프로세스 중에 오류나 경고가 기록되지 않았습니다.

'유형'에는 다음 값이 가능합니다.

* `pending`: 업그레이드가 아직 완료되지 않았습니다.
* `업그레이드 없음`: 업그레이드 프로세스가 끝날 때 업그레이드 프로세스가 실행되지 않았습니다.
* `major`: 스키마 버전의 주요 변경과 관련된 업그레이드가 하나 이상 있습니다.
* `minor`: SchemaVersion의 사소한 변경과 관련된 업그레이드가 하나 이상 실행되었습니다.
* `micro`: SchemaVersion의 마이크로 변경과 관련된 업그레이드가 하나 이상 실행되었습니다.

```{note}
MBeans에서 제공하는 정보는 실시간으로 업데이트되며 시작 시 수행되는 업그레이드에만 사용할 수 있습니다. 시작 시 업그레이드가 완료되면 MBeans에 표시되는 값은 정적이며 시작 시 업그레이드 후 수동 업그레이드를 수행하더라도 업데이트되지 않습니다.
```

## 관련 주제

[데이터베이스 업그레이드 도구 사용](../upgrade-basics/using-the-database-upgrade-tool.md)
[업그레이드 보고서](./upgrade-report.md)
[데이터베이스 업그레이드 도구 참조](./database-upgrade-tool-reference.md)
[업그레이드 로그 컨텍스트](./upgrade-log-context.md)
