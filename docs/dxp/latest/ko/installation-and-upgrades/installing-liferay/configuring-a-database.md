# 데이터베이스 구성

데모용으로 기본적으로 Liferay DXP/Portal은 임베디드 HSQL 데이터베이스를 사용하도록 구성되어 있습니다. 데모 목적 외에도 다음과 같이 완전한 기능을 갖춘 지원되는 RDBMS를 사용하는 것이 좋습니다.

* MariaDB
* MySQL
* Oracle
* PostgreSQL

```{important}
[Liferay DXP 호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/360049238151)에는 지원되는 데이터베이스 및 버전이 나와 있습니다.
```

## 데이터베이스 구성

1. UTF-8을 사용하는 데이터베이스를 만듭니다. 다음은 MySQL 명령 예입니다.

    ```sql
    create database lportal character set utf8;
    ```

1. 전체 데이터베이스 권한이 있는 데이터베이스 사용자를 설정합니다. 조직에서 DXP 데이터베이스 사용자에게 제한된 데이터베이스 액세스 권한을 요구하는 경우 [High Security Database User Practices](../reference/database-configurations.md#high-security-database-user-practices)을 참조하십시오.

    ```{important}
    Liferay는 데이터베이스 읽기 및 쓰기가 필요합니다. 따라서 Liferay 데이터베이스 사용자는 데이터를 읽고 쓸 수 있는 권한이 있어야 합니다.
    ```

1. JDBC 커넥터를 설치합니다. DXP 번들에는 `/lib/ext` 폴더에 여러 오픈 소스 JDBC 커넥터가 포함되어 있습니다. Oracle 또는 DB2(아래 표 참조)와 같은 독점 데이터베이스용 커넥터는 공급업체에서 다운로드해야 합니다.

**독점 데이터베이스:**

| 데이타베이스 | 커넥터           | 공급업체 사이트                                    | 주                                                                                                                                                     |
|:------ |:------------- |:------------------------------------------- |:----------------------------------------------------------------------------------------------------------------------------------------------------- |
| Oracle | `ojdbc8.jar`  | [Oracle](https://www.oracle.com/index.html) | 최소한 Oracle 12.2.0.1.0 JDBC 4.2 버전이 있는 `ojdbc8.jar` 라이브러리는 CLOB 열에서 데이터를 읽는 것이 감지된 [데이터 잘림 문제](https://issues.liferay.com/browse/LPS-79229) 때문에 필요합니다. |
| DB2    | `db2jcc4.jar` | [IBM](https://www.ibm.com/)                 | `dbc2jcc` 커넥터는 3.72 이후에 더 이상 사용되지 않습니다.                                                                                                               |

축하합니다! Liferay DXP용 데이터베이스를 구성했습니다.

```{note}
데이터베이스 구성에 대한 자세한 내용은 [데이터베이스 구성 참조](../reference/database-configurations.md)를 참조하십시오.
```

## 다음 단계

* [처음으로 Liferay 실행](./running-liferay-for-the-first-time.md)