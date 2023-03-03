# Tomcat에서 JNDI 설정

{bdg-secondary}`Liferay DXP 7.4+ 또는 Liferay Portal 7.4+에 적용 가능`

JNDI 리소스를 설정하려면 필요한 JDBC 드라이버를 Tomcat lib 폴더(예: `tomcat-9.0.56/lib`)에 넣어야 합니다. 예를 들어 Oracle 데이터베이스를 사용하는 경우 `ojdbc8.jar` 을 이 폴더에 복사합니다. [Hikari 연결 풀](https://github.com/brettwooldridge/HikariCP) 을 사용하는 경우 `hikaricp.jar` 및 `slf4-api.jar` 파일도 복사해야 합니다.

필요한 파일을 복사한 후 JNDI 자원을 정의하십시오.

예를 들어 `tomcat-9.0.56/conf/Catalina/localhost/ROOT.xml` 파일을 수정합니다.

```xml
<?xml version="1.0" encoding="UTF-8"?>

<Context crossContext="true">
    <JarScanner className="com.liferay.support.tomcat.util.scan.NOPJarScanner" />

    <Manager pathname="" />

    <Resource name="jdbc/liferay" auth="Container"
        factory="com.zaxxer.hikari.HikariJNDIFactory"
        type="javax.sql.DataSource"
        minimumIdle="5" 
        maximumPoolSize="10"
        connectionTimeout="300000"
        driverClassName="oracle.jdbc.OracleDriver"
        jdbcUrl="jdbc:oracle:thin:@192.168.1.213:1521/liferay"
        dataSource.user="liferay"
    dataSource.password="password" />
</Context>
```

`portal-ext.properties` 파일에서 JNDI 참조( `jdbc.default.jndi.name=jdbc/liferay`)를 사용하십시오.
