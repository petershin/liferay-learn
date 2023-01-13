# 샤딩된 환경 업그레이드

Liferay DXP 7.0 이후 Liferay는 데이터베이스 공급업체가 기본적으로 제공하는 기능을 위해 자체 물리적 파티셔닝 구현(샤딩이라고도 함)을 제거했습니다. 샤드된 설치를 DXP 7.0 이상으로 업그레이드하려면 샤드가 있는 만큼 샤드되지 않은 Liferay DXP 설치(서버)로 마이그레이션해야 합니다. 이 단계는 이전에 분할된 데이터를 사용하도록 새 Liferay DXP 서버를 구성하는 과정을 안내합니다.

```{note}
Liferay는 논리적 파티셔닝 기능(가상 인스턴스라고도 함)을 계속 지원합니다.
```

## 데이터 업그레이드 전에 구성 추가

다른 구성 외에도 데이터 업그레이드를 위해 샤드를 가상 인스턴스로 마이그레이션하려면 더 많은 속성을 설정해야 합니다. 다른 구성에 대한 자세한 내용은 [업그레이드 도구 참조](../reference/database-upgrade-tool-reference.md) 을 참조하십시오.

샤딩에서 마이그레이션하도록 업그레이드를 구성하는 방법은 다음과 같습니다.

1. `portal-ext.properties` 에서`portal-upgrade-database.properties`으로 모든 샤드 JDBC 연결 속성을 복사합니다. 예를 들어 기본 샤드와 기본이 아닌 샤드 2개에 대한 JDBC 연결은 다음과 같을 수 있습니다.

    ```properties
    jdbc.default.driverClassName=[the database driver class name]
    jdbc.default.url=[the URL to the default database shard]
    jdbc.default.username=[the user name]
    jdbc.default.password=[the password]

    jdbc.one.driverClassName=[the database driver class name]
    jdbc.one.url=[the URL to database shard one]
    jdbc.one.username=[the user name]
    jdbc.one.password=[the password]

    jdbc.two.driverClassName=[the database driver class name]
    jdbc.two.url=[the URL to database shard two]
    jdbc.two.username=[the user name]
    jdbc.two.password=[the password]
    ```

1. 각 서버의 `Portal-upgrade-database.properties` 에서 JDBC _기본_ 연결 속성을 설정하여 연결된 샤드를 지정합니다.

    * 기본이 아닌 각 샤드 데이터베이스에 대한 원래 JDBC 속성을 추가합니다. 예를 들어 shard `one`의 원래 속성은 `jdbc.one`으로 시작할 수 있습니다.

    ```properties
    jdbc.one.driverClassName=[the database driver class name]
    jdbc.one.url=[the URL to database shard one]
    jdbc.one.username=[the user name]
    jdbc.one.password=[the password]
    ```

    * `jdbc.default`로 시작하도록 속성 이름을 바꿉니다. 예를 들어:

    ```properties
    jdbc.default.driverClassName=[the database driver class name]
    jdbc.default.url=[the URL to database shard one]
    jdbc.default.username=[the user name]
    jdbc.default.password=[the password]
    ```

## 속성 업그레이드 및 업데이트

데이터베이스 업그레이드를 수행할 때 기본 샤드를 먼저 업그레이드한 다음 기본이 아닌 각 샤드를 업그레이드합니다. 데이터베이스 업그레이드 실행에 대한 자세한 내용은 [데이터베이스 업그레이드 도구 사용](../upgrade-basics/using-the-database-upgrade-tool.md) 을 참조하십시오.

데이터베이스 업그레이드가 완료된 후 애플리케이션 서버에 대해 다음 구성 변경을 수행하십시오.

1. 각 서버의 `portal-ext.properties`에서 `portal-upgrade-database.properties` 에서 지정한 JDBC _기본_ 속성을 사용합니다(위의 _기본_ 속성 참조).

1. 기본 샤드 서버의 `Portal-ext.properties` 파일에서 기본 샤드가 아닌 JDBC 속성을 제거하고 기본 샤드 데이터베이스 `jdbc.default` 속성만 남깁니다. 예를 들어:

    이전 JDBC 속성:

    ```properties
    jdbc.default.driverClassName=[the database driver class name]
    jdbc.default.url=[the URL to the default database shard]
    jdbc.default.username=[the user name]
    jdbc.default.password=[the password]

    jdbc.one.driverClassName=[the database driver class name]
    jdbc.one.url=[the URL to database shard one]
    jdbc.one.username=[the user name]
    jdbc.one.password=[the password]

    jdbc.two.driverClassName=[the database driver class name]
    jdbc.two.url=[the URL to database shard two]
    jdbc.two.username=[the user name]
    jdbc.two.password=v[the password]
    ```

    새로운 JDBC 속성:

    ```properties
    jdbc.default.driverClassName=[the database driver class name]
    jdbc.default.url=[the URL to your database]
    jdbc.default.username=[the user name]
    jdbc.default.password=[the password]
    ```

이 단계를 모두 완료하면 DXP 업그레이드와 함께 샤드 환경에서 별도의 Liferay DXP 서버에 있는 가상 인스턴스로 마이그레이션한 것입니다.

업그레이드 완료에 대한 지침은 [업그레이드 기본 사항](../upgrade-basics.md) 을 참조하십시오.