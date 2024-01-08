# 멀티스레딩 프로세스

{bdg-secondary}`Liferay DXP 7.4 U10+ 또는 Liferay Portal 7.4 GA14+`

[업그레이드 프로세스](../upgrade-processes.md) 대규모 데이터 세트에 대한 복잡한 변경 작업이 포함될 수 있습니다. 성능이 중요한 경우 애플리케이션의 `UpgradeProcess` 클래스에서 `processConcurrently()` 메서드를 사용하세요. 이 방법은 여러 스레드에서 실행되며 업그레이드 시간을 단축할 수 있습니다.

## 버전 1.0.0 배포

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르세요.

1. [멀티스레딩 프로세스](./liferay-j7z3.zip) 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/data-frameworks/upgrade-processes/liferay-j7z3.zip -O
   ```

   ```bash
   unzip liferay-j7z3.zip
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
   STARTED com.acme.j7z3.api_1.0.0 [1030]
   STARTED com.acme.j7z3.service_1.0.0 [1031]
   ```

## 앱에 항목 추가

1. **제어판** &rarr; **서버 관리** &rarr; **스크립트** 에서 스크립트 콘솔로 이동합니다.

1. 다음 스크립트를 실행하여 일부 항목을 추가합니다.

   ```groovy
   import com.acme.j7z3.service.J7Z3EntryLocalServiceUtil;

   import com.liferay.portal.kernel.dao.orm.QueryUtil;

   entry1 = J7Z3EntryLocalServiceUtil.createJ7Z3Entry(1);
   entry2 = J7Z3EntryLocalServiceUtil.createJ7Z3Entry(2);
   entry3 = J7Z3EntryLocalServiceUtil.createJ7Z3Entry(3);

   entry1.setName("able");
   entry2.setName("able");
   entry3.setName("able");

   J7Z3EntryLocalServiceUtil.addJ7Z3Entry(entry1);
   J7Z3EntryLocalServiceUtil.addJ7Z3Entry(entry2);
   J7Z3EntryLocalServiceUtil.addJ7Z3Entry(entry3);

   ```

   이제 J7Z3_J7Z3Entry 테이블에는 세 개의 항목이 있습니다.

   ![The three entries can been verified in the database table.](./multithreading-process/images/01.png)

## 업그레이드 실행

1. '1.0.1' 디렉터리로 이동하여 빌드하고 배포합니다.

   ```bash
   cd ../1.0.1    
   ```

   ```bash
   ../gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

1. **Control Panel** &rarr; **Gogo Shell** 에서 Gogo 쉘 콘솔로 이동합니다.

1. 'upgrade:list com.acme.j7z3.service' 명령을 입력하여 1.0.1 업그레이드가 가능한지 확인하세요. 1.0.1 버전은 출력 창에 등록된 업그레이드 프로세스로 나타납니다.

1. `upgrade:execute com.acme.j7z3.service` 명령을 입력하여 업그레이드를 실행합니다. 출력 창에 업그레이드가 완료되었음을 표시합니다.

   ![Execute the upgrade and the output should display that the upgrade was completed.](./multithreading-process/images/02.png)

1. 이제 J7Z3_J7Z3Entry 테이블 항목이 업데이트되었습니다.

   ![The updated entries can been verified in the database table.](./multithreading-process/images/03.png)

## 멀티스레딩 방법 구현

애플리케이션의 'UpgradeProcess' 클래스에서 'processConcurrently()' 메서드를 재정의하세요.

```{literalinclude} ./multithreading-process/resources/liferay-j7z3.zip/1.0.1/j7z3-service/src/main/java/com/acme/j7z3/internal/upgrade/v1_0_1/J7Z3EntryUpgradeProcess.java
:dedent: 1
:language: java
:lines: 26-48
```

이 방법은 네 부분으로 구성됩니다.

1. SQL 쿼리 - 데이터베이스 데이터를 쿼리하는 SQL 문입니다.

1. 개체 수집 - 결과 집합을 받고 결과 집합을 기반으로 개체 배열을 반환합니다.

1. 개체 처리 - 개체 배열에서 비즈니스 논리를 실행합니다.

1. 예외 - 예외가 발생하면 메시지를 보냅니다.

샘플 프로젝트는 `name` 필드가 `processConcurrently()` 메소드에 의해 처리되고 수정되는 간단한 예를 보여줍니다.

1. `select j7z3EntryId, name from J7Z3_J7Z3Entry` - SQL 문은 모든 항목을 쿼리합니다.

1. ```java
   resultSet -> new Object[] {
    			resultSet.getLong("j7z3EntryId"), resultSet.getString("name")
   ```
   객체는 수집되어 `resultSet` 배열에 저장됩니다.

1. ```java
   columns -> {
    long j7z3EntryId = (Long)columns[0];

    try (PreparedStatement preparedStatement =
    		connection.prepareStatement(
    			"update J7Z3_J7Z3Entry set name = ? where " +
    				"j7z3EntryId = ?")) {

    		preparedStatement.setString(1, "baker");
    		preparedStatement.setLong(2, j7z3EntryId);

    		preparedStatement.executeUpdate();
    		}
    	}
   ```
   모든 `j7z3EntryId`에 대해 `name` 필드는 `baker`로 설정됩니다.

1. 예외는 `null`로 설정됩니다.

`processConcurrently()` 메서드에는 두 가지 다른 서명이 있습니다. 이 튜토리얼 예제에서 볼 수 있듯이 하나의 서명은 SQL 쿼리를 소스로 전달합니다. 다른 서명은 배열을 소스로 전달합니다. 자세한 내용은 [BaseDBProcess javadocs](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/dao/db/BaseDBProcess.html#processConcurrently-java.lang.String-com.liferay.petra.function.UnsafeFunction-com.liferay.petra.function.UnsafeConsumer-java.lang.String-) 을 참조하세요.
