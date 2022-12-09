# TomcatでJNDIを設定する

{bdg-secondary}`Liferay DXP 7.4+ または Liferay Portal 7.4+`に適用されます。

JNDIリソースを設定するには、必要なJDBCドライバをTomcatのlibフォルダに入れる必要があります（例： `tomcat-9.0.56/lib`）。 例えば、Oracleデータベースを使用する場合、 `ojdbc8.jar` をこのフォルダーにコピーします。 [光接続プール](https://github.com/brettwooldridge/HikariCP) を使用する場合、 `hikaricp.jar` と `slf4-api.jar` のファイルもコピーする必要があります。

必要なファイルをコピーした後、JNDIリソースを定義します。

例えば、 `tomcat-9.0.56/conf/Catalina/localhost/ROOT.xml` ファイルを修正します。

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

`portal-ext.properties` ファイルで、JNDI リファレンスを使用します: `jdbc.default.jndi.name=jdbc/liferay`.
