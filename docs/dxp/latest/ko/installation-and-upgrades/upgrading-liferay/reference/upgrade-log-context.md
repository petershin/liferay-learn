# 업그레이드 로그 컨텍스트

{bdg-secondary}`사용 가능한 Liferay DXP 7.4 U72 / Liferay Portal 7.4 GA72`

업그레이드 로그 컨텍스트를 활성화하여 콘솔 로그에 업그레이드 관련 프로세스에 대한 식별자를 표시합니다. 가능한 식별자는 다음과 같습니다:

   * `{upgrade.component=portal}`: 포털 관련 업그레이드 프로세스용
   * `{upgrade.component=framework}`: 업그레이드 프레임워크 로직과 관련된 프로세스의 경우
   * `{upgrade.component=<bundleSymbolicName>}`: 모듈과 관련된 업그레이드 프로세스용

로그는 [업그레이드 도구(](../upgrade-basics/using-the-database-upgrade-tool.md) )를 통해 활성화하거나 포털 속성을 사용하여 시작할 때 활성화할 수 있습니다.

업그레이드 도구를 사용하는 경우 `/tools/portal-tools-db-upgrade-client/portal-upgrade-ext.properties` 파일에서 `upgrade.log.context.enabled=true` 를 설정합니다.

시작 시 업그레이드를 사용하도록 설정하는 경우 `{Liferay-Home}/portal-ext.properties` 파일에서 `upgrade.log.context.enabled=true` 를 설정하세요.

그런 다음 [`portal-impl/src/META-INF/portal-log4j.xml`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/META-INF/portal-log4j.xml) 파일을 `bundles/tomcat/webapps/ROOT/WEB-INF/classes/META-INF` 에 복사하고 파일 이름을 `portal-log4j-ext.xml`로 바꿉니다. 그런 다음 애펜더 정의를 찾습니다:

```
<Appender name="CONSOLE" type="Console">
    <Layout pattern="%d{yyyy-MM-dd HH:mm:ss.SSS} %-5p [%t][%c{1}:%L] %m%n" type="PatternLayout" />
</Appender>
```

정의를 변경하여 `%X`를 포함하도록 변경하면 Log4j가 스레드 컨텍스트 정보를 인쇄하도록 지시합니다:

```
<Appender name="CONSOLE" type="Console">
    <Layout pattern="%d{yyyy-MM-dd HH:mm:ss.SSS} %-5p [%t][%c{1}:%L] %m %X%n" type="PatternLayout" />
</Appender>
```

다음은 업그레이드 식별자가 포함된 몇 가지 로그 라인 예시입니다:

```
...
2023-05-24 23:29:31.143 INFO  [main][LoggingTimer:83] Starting com.liferay.portal.verify.VerifyProperties#verifySystemProperties {upgrade.component=portal}
2023-05-24 23:29:31.145 INFO  [main][LoggingTimer:44] Completed com.liferay.portal.verify.VerifyProperties#verifySystemProperties in 3 ms {upgrade.component=portal}
...
2023-05-24 23:29:34.012 INFO  [main][LoggingTimer:83] Starting com.liferay.portal.events.StartupHelperUtil#initResourceActions {upgrade.component=framework}
2023-05-24 23:29:34.029 INFO  [main][LoggingTimer:44] Completed com.liferay.portal.events.StartupHelperUtil#initResourceActions in 17 ms {upgrade.component=framework}
...
2023-05-24 23:30:17.046 INFO  [main][LoggingTimer:83] Starting com.liferay.portal.db.index.IndexUpdaterUtil#lambda$updateIndexes$1#Updating database indexes for com.liferay.wiki.service {upgrade.component=com.liferay.wiki.service}
2023-05-24 23:30:17.094 INFO  [main][BaseDB:776] Dropping stale indexes {upgrade.component=com.liferay.wiki.service}
2023-05-24 23:30:17.095 INFO  [main][BaseDB:846] drop index IX_18565130 on WikiPage {upgrade.component=com.liferay.wiki.service}
...
```

## 업그레이드 보고서와 함께 사용 설정하기

업그레이드 로그 컨텍스트와 함께 [업그레이드 보고서](./upgrade-report.md) 가 활성화되어 있으면 업그레이드 보고서의 내용도 콘솔 로그에 출력됩니다. 이 보고서는 `upgrade_report.info` 파일과는 약간 다른 형식으로 표시됩니다.

| 보고서 키 업그레이드                                     | 설명                                                                   |
|:----------------------------------------------- |:-------------------------------------------------------------------- |
| `upgrade.report.database.version`               | 데이터베이스 공급업체 및 버전.                                                    |
| `upgrade.report.document.library.storage.size`  | 문서 라이브러리의 크기입니다.                                                     |
| `upgrade.report.errors`                         | 업그레이드 프로세스 중에 캡처된 오류와 함께 배열합니다. 동일한 오류의 출처, 클래스 및 발생 횟수별로 그룹화됩니다.    |
| `upgrade.report.execution.date`                 | 보고서가 생성된 날짜 및 시간입니다.                                                 |
| `upgrade.report.execution.time`                 | 업그레이드가 완료되는 데 걸린 총 시간(초)입니다.                                         |
| `upgrade.report.longest.upgrade.processes`      | 가장 긴 업그레이드 프로세스 20개를 배열하여 프로세스 이름과 각 프로세스를 완료하는 데 걸린 시간을 표시합니다.      |
| `upgrade.report.portal.expected.build.number`   | 업그레이드가 실행된 후 예상되는 최종 빌드 번호입니다.                                       |
| `upgrade.report.portal.expected.schema.version` | 업그레이드가 실행된 후 예상되는 스키마 버전입니다.                                         |
| `upgrade.report.portal.final.build.number`      | 업그레이드가 실행된 후의 실제 최종 빌드 번호입니다.                                        |
| `upgrade.report.portal.final.schema.version`    | 업그레이드가 실행된 후의 실제 최종 스키마 버전입니다.                                       |
| `upgrade.report.portal.initial.build.number`    | 업그레이드가 실행되기 전의 초기 빌드 번호입니다.                                          |
| `upgrade.report.portal.initial.schema.version`  | 업그레이드가 실행되기 전의 초기 스키마 버전입니다.                                         |
| `upgrade.report.property.dl.store.impl`         | 문서 라이브러리 저장소에 대한 구현이 구성되었습니다.                                        |
| `upgrade.report.property.liferay.home`          | Liferay 홈 폴더의 절대 경로입니다.                                              |
| `upgrade.report.property.locales`               | 사용 가능한 모든 로캘로 배열합니다.                                                 |
| `upgrade.report.property.locales.enabled`       | 모든 로캘을 활성화한 상태로 배열합니다.                                               |
| `upgrade.report.property.rootDir`               | 문서 라이브러리 루트 폴더의 절대 경로입니다.                                            |
| `upgrade.report.result`                         | 모든 업그레이드가 실행된 후 계산된 업그레이드 결과입니다.                                     |
| `upgrade.report.status`                         | OSGi에서 제공하는 업그레이드 정보 상태. 모든 업그레이드가 실행되었는지 또는 보류 중인 업그레이드가 있는지 표시됩니다. |
| `upgrade.report.tables.initial.final.rows`      | 모든 테이블의 이름과 업그레이드 전후 각 테이블의 행 수가 포함된 배열입니다.                          |
| `upgrade.report.type`                           | 발생한 업그레이드 유형(예 메이저, 마이너, 마이크로). 스키마 버전 기준.                           |
| `upgrade.report.warnings`                       | 업그레이드 프로세스 중에 캡처된 경고와 함께 배열합니다. 동일한 경고의 출처, 등급 및 발생 횟수별로 그룹화됩니다.     |

## 관련 주제

[데이터베이스 업그레이드 도구 사용](../upgrade-basics/using-the-database-upgrade-tool.md) [업그레이드 보고서](./upgrade-report.md) [데이터베이스 업그레이드 도구 참조](./database-upgrade-tool-reference.md) [MBeans로 업그레이드 모니터링하기](./monitoring-upgrades-with-mbeans.md)
