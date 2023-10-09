# 데이터베이스 구성

기본적으로 데모 목적으로 Liferay DXP/Portal은 내장형 HSQL 데이터베이스를 사용하도록 구성됩니다. 데모 목적 외에도 다음과 같은 모든 기능을 지원하는 RDBMS를 사용하는 것이 좋습니다.

* MariaDB
* MySQL
* Oracle
* PostgreSQL

```{important}
[Liferay DXP 호환성 매트릭스](https://help.liferay.com/hc/en-us/sections/360002103292-Compatibility-Matrix)에는 지원되는 데이터베이스 및 버전이 나열되어 있습니다.
```

## 데이터베이스 구성

1. UTF-8을 사용하는 데이터베이스를 만듭니다. 다음은 MySQL 명령 예입니다.

    ```sql
    create database lportal character set utf8;
    ```

1. 전체 데이터베이스 권한을 가진 데이터베이스 사용자를 설정합니다. 조직에서 DXP 데이터베이스 사용자에게 제한된 데이터베이스 액세스 권한을 요구하는 경우 [높은 보안 데이터베이스 사용자 사례](../reference/database-configurations.md#high-security-database-user-practices)참조하십시오.

    ```{important}
    Liferay에서는 데이터베이스 읽기 및 쓰기가 필요합니다. 따라서 Liferay 데이터베이스 사용자에게는 데이터를 읽고 쓸 수 있는 권한이 있어야 합니다.
    ```

1. JDBC 커넥터를 설치합니다. DXP 번들에는 `$CATALINA_BASE/webapps/ROOT/WEB-INF/shielded-container-lib` 폴더(이전 버전 Liferay의 경우 `$CATALINA_BASE/lib/ext` 폴더)에 여러 오픈 소스 JDBC 커넥터가 포함되어 있습니다. Oracle 또는 DB2(아래 표 참조)와 같은 독점 데이터베이스용 커넥터는 공급업체에서 다운로드해야 합니다.

**독점 데이터베이스:**

| 데이타베이스 | 커넥터           | 공급업체 사이트                                    | 주                                                                                                                                                        |
|:------ |:------------- |:------------------------------------------- |:-------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Oracle | `ojdbc8.jar`  | [Oracle](https://www.oracle.com/index.html) | CLOB 열에서 데이터를 읽을 때 감지된 [데이터 잘림 문제](https://issues.liferay.com/browse/LPS-79229) 때문에 Oracle 12.2.0.1.0 이상의 JDBC 4.2 버전 관리가 포함된 `ojdbc8.jar` 라이브러리가 필요합니다. |
| DB2    | `db2jcc4.jar` | [IBM](https://www.ibm.com/)                 | `dbc2jcc` 커넥터는 3.72 이후 더 이상 사용되지 않습니다.                                                                                                                   |

축하해요! Liferay DXP용 데이터베이스를 구성했습니다.

```{note}
데이터베이스 구성에 대한 자세한 내용은 [데이터베이스 구성 참조](../reference/database-configurations.md)를 확인하세요.
```

## 다음 단계

* [처음으로 Liferay 실행하기](./running-liferay-for-the-first-time.md)
