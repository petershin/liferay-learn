# 데이터베이스 템플릿

다음은 다양한 데이터베이스를 Liferay DXP용 내장 데이터 소스로 구성하기 위한 템플릿(예: [포털 속성](./portal-properties.md) 및 [Docker 환경 변수](https://docs.docker.com/engine/reference/commandline/run/#set-environment-variables--e---env---env-file) )입니다.

## MariaDB

### 문맥 재산

```properties
jdbc.default.driverClassName=org.mariadb.jdbc.Driver
jdbc.default.url=jdbc:mariadb://localhost/lportal?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false
jdbc.default.username=
jdbc.default.password=
```

### 도커 변수

```bash
-e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_DRIVER_UPPERCASEC_LASS_UPPERCASEN_AME=org.mariadb.jdbc.Driver \
-e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_URL="jdbc:mariadb://hostname:3306/lportal?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false" \
-e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_USERNAME= \
-e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_PASSWORD= \
```

## MySQL

```{important}
MySQL Connector/J 8.0은 MySQL Server 8.0 및 5.7과 함께 사용하는 것이 좋습니다.
```

### 문맥 재산

```properties
jdbc.default.driverClassName=com.mysql.cj.jdbc.Driver
jdbc.default.url=jdbc:mysql://localhost/lportal?characterEncoding=UTF-8&dontTrackOpenResources=true&holdResultsOpenOverStatementClose=true&serverTimezone=GMT&useFastDateParsing=false&useUnicode=true
jdbc.default.username=
jdbc.default.password=
```

### 도커 변수

```bash
-e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_DRIVER_UPPERCASEC_LASS_UPPERCASEN_AME=com.mysql.cj.jdbc.Driver \
-e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_URL="jdbc:mysql://hostname:3306/lportal?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false" \
-e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_USERNAME= \
-e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_PASSWORD= \
```

## PostgreSQL

### 문맥 재산

```properties
jdbc.default.driverClassName=org.postgresql.Driver
jdbc.default.url=jdbc:postgresql://localhost:5432/lportal
jdbc.default.username=
jdbc.default.password=
```

### 도커 변수

```bash
-e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_DRIVER_UPPERCASEC_LASS_UPPERCASEN_AME=org.postgresql.Driver \
-e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_URL="jdbc:postgresql://hostname:3306/lportal?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false" \
-e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_USERNAME= \
-e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_PASSWORD= \
```

더 많은 데이터베이스 템플릿은 [기본 포털 속성](https://resources.learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) 을 참조하십시오.