# 데이터베이스 테이블 업그레이드

{bdg-secondary}`Liferay DXP 7.4 U10+ 또는 Liferay Portal 7.4 GA14+`

애플리케이션을 업그레이드하려면 데이터베이스 테이블을 변경해야 할 수도 있습니다. Liferay의 업그레이드 프레임워크를 사용하면 이러한 변경을 쉽게 수행할 수 있습니다. 이 업그레이드 프로세스를 보려면 샘플 프로젝트를 배포하세요. 이전 버전의 Liferay에 대해서는 [모듈에 대한 업그레이드 프로세스 생성](https://help.liferay.com/hc/en-us/articles/360031165751-Creating-Upgrade-Processes-for-Modules) 참조하십시오.

## 버전 1.0.0 배포

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르세요.

1. 다운로드 및 압축 풀기 [데이터베이스 테이블 업그레이드](./liferay-p5d2.zip) .

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/data-frameworks/upgrade-processes/liferay-p5d2.zip -O
   ```

   ```bash
   unzip liferay-p5d2.zip
   ```

1. '1.0.0' 디렉터리로 이동하여 빌드하고 배포합니다.

   ```bash
   cd 1.0.0
   ```

   ```bash
   ../gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   ```{note}
   이 명령은 배포된 jar를 Docker 컨테이너의 /opt/liferay/osgi/modules에 복사하는 것과 동일합니다.
   ```

1. Liferay Docker 컨테이너 콘솔에서 배포를 확인합니다.

   ```bash
   STARTED com.acme.p5d2.api_1.0.0 [1030]
   STARTED com.acme.p5d2.service_1.0.0 [1031]
   ```

1. 외부 데이터베이스를 사용하는 경우 앱의 테이블 열을 확인하세요. 예를 들어 MySQL의 경우:

   ```sql
   SHOW COLUMNS FROM P5D2_P5D2Entry;
   ```

   ![Verify the table columns in your database.](./upgrading-your-database-tables/images/01.png)

## 2.0.0으로 업그레이드

1. 이제 2.0.0 버전을 배포합니다. `2.0.0` 디렉터리로 이동하여 빌드하고 배포합니다.

   ```bash
   cd 2.0.0
   ```

   ```bash
   ../gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

1. Liferay에 로그인하고 _Control Panel_ &rarr; _Gogo Shell_에서 Gogo Shell 콘솔로 이동합니다.

1. 'upgrade:list com.acme.p5d2.service' 명령을 입력하여 2.0.0 업그레이드가 가능한지 확인하세요.

1. `upgrade:execute com.acme.p5d2.service` 명령을 입력하여 업그레이드를 실행합니다. Gogo 셸 콘솔에는 완료된 업그레이드 프로세스가 표시됩니다.

   ![Execute the upgrade in Gogo shell.](./upgrading-your-database-tables/images/02.png)

1. 데이터베이스에서 테이블 열이 업데이트되었는지 확인할 수 있습니다. 예를 들어 MySQL의 경우:

   ```sql
   SHOW COLUMNS FROM P5D2_P5D2Entry;
   ```

   ![Verify the table columns have been updated.](./upgrading-your-database-tables/images/03.png)

## 코드를 살펴보세요

예제 프로젝트는 다음 테이블 열의 간단한 변경을 보여줍니다.

| 전에                                 | 이후                                | 논평                 |
| :--------------------------------- | :-------------------------------- | :----------------- |
| `able`(유형: 긴)   | `able`(유형: 날짜) | 열 데이터 유형이 변경되었습니다. |
| `baker`(유형: 부울) | -                                 | 열이 삭제되었습니다.        |
| `foo`(유형: 문자열)  | `bar`(유형: 문자열) | 열 이름이 변경됩니다.       |
| *                                  | `찰리`(유형: 문자열)  | 새 열이 추가됩니다.        |

[1.0.0](./upgrading-your-database-tables/resources/liferay-p5d2.zip/1.0.0/p5d2-service/service.xml) 과 [2.0.0](./upgrading-your-database-tables/resources/liferay-p5d2.zip/2.0.0/p5d2-service/service.xml) 의 `service.xml` 열 정의를 비교합니다.

### UpgradeStepRegistrator 클래스 생성

'UpgradeStepRegister' 인터페이스를 구현하는 'UpgradeStepRegistrator' 클래스를 만듭니다.

```{literalinclude} ./upgrading-your-database-tables/resources/liferay-p5d2.zip/2.0.0/p5d2-service/src/main/java/com/acme/p5d2/internal/upgrade/P5D2EntryUpgrade.java
:language: java
:lines: 26-34
```

앱의 업그레이드 등록을 구현하려면 `register` 메서드를 재정의하세요. `@Component` 주석을 사용하고 이를 `UpgradeStepRegistrator.class` 서비스로 식별해야 합니다.

### UpgradeProcess 클래스 생성

기본 클래스를 확장하는 `UpgradeProcess` 클래스를 만듭니다.

```{literalinclude} ./upgrading-your-database-tables/resources/liferay-p5d2.zip/2.0.0/p5d2-service/src/main/java/com/acme/p5d2/internal/upgrade/v2_0_0/P5D2EntryUpgradeProcess.java
:language: java
:lines: 22-32
```

테이블 수정 지침으로 `doUpgrade()` 메서드를 재정의하세요. 다음 작업을 사용할 수 있습니다.

| 기능                   | 묘사          |
| :------------------- | :---------- |
| alterColumnName      | 열 이름 변경     |
| alterColumnType      | 열 데이터 유형 변경 |
| alterTableAddColumn  | 새 열 추가      |
| alterTableDropColumn | 열 제거        |

```{warning}
`alterTableDropColumn`은 MariaDB에서 작동하지 않습니다. 이는 [알려진 버그](https://github.com/liferay-upgrades/liferay-portal/pull/263/commits/9a59708c40e19b209d99eeee2f7e68a815d5cd1b)입니다. 대신 [이전 가이드라인](https://help.liferay.com/hc/en-us/articles/360031165751-Creating-Upgrade-Processes-for-Modules)을 따르세요.
```

변경한 후 Service Builder를 다시 실행하십시오. 이제 업그레이드를 구축하고 배포할 준비가 되었습니다.

## 복잡한 업그레이드 관리

업그레이드가 여러 단계로 복잡하다면 `UpgradeProcess` 클래스에서 `getPreUpgradeSteps()` 및 `getPostUpgradeSteps()` 메서드를 사용하는 것이 좋습니다. 이 접근 방식을 사용하면 업그레이드 프로세스를 더 효과적으로 제어할 수 있습니다. 더 쉬운 디버깅을 위해 각 업그레이드 단계에는 'Release_' 테이블에 서로 다른 스키마 버전이 제공됩니다. 단계가 실패하여 업그레이드를 다시 실행해야 하는 경우 업그레이드 프로세스는 자동으로 최신 실패 지점부터 업그레이드를 확인하고 다시 시작합니다.

예를 들어 Liferay의 [OpenIdConnectSessionUpgradeProcess](https://github.com/liferay/liferay-portal/blob/master/modules/apps/portal-security-sso/portal-security-sso-openid-connect-persistence-service/src/main/java/com/liferay/portal/security/sso/openid/connect/persistence/internal/upgrade/v2_0_0/OpenIdConnectSessionUpgradeProcess.java) 이 기능을 활용합니다.

이 예에서는 `getPreUpgradeSteps()`가 먼저 실행되며 여기에는 새 열을 추가하는 간단한 단계가 포함됩니다. `doUpgrade()` 메서드에는 새 열을 채우는 작업이 포함됩니다. `doUpgrade()` 메서드가 실패하면 개발자는 디버깅하고 필요한 변경을 수행한 후 업그레이드를 다시 실행할 수 있습니다. 프로세스는 첫 번째 단계가 성공했음을 인식하고 자동으로 다음 단계로 이동합니다.

업그레이드 단계를 활용하려면 `import com.liferay.portal.kernel.upgrade.UpgradeStep` 클래스를 업그레이드 프로세스로 가져오세요.
