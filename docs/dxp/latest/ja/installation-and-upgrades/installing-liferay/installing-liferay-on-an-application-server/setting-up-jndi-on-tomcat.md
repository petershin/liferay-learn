# TomcatでJNDIを設定する

{bdg-secondary}`Liferay DXP 7.4+ または Liferay Portal 7.4+`に適用されます。

JNDIリソースを設定するには、必要なJDBCドライバをTomcatのlibフォルダに置く必要があります（すなわち、 `tomcat-9.0.56/lib`）。 たとえば、Oracleデータベースを使用する場合は、 `ojdbc8.jar` をこのフォルダにコピーします。 [光接続プール](https://github.com/brettwooldridge/HikariCP) を使用する場合は、 `hikaricp.jar` と `slf4-api.jar` ファイルもコピーする必要があります。

必要なファイルをコピーしたら、JNDIリソースを定義する。

例えば、 `tomcat-9.0.56/conf/Catalina/localhost/ROOT.xml` ファイルを修正する：

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

## `server.xml` と `context.xml`を設定する。

`/conf/server.xml` ファイルの `GlobalNamingResources` 要素内にデータ・ソースを定義する。 例:

```xml
<GlobalNamingResources>

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

</GlobalNamingResources>
```

`/conf/context.xml` ファイルに `ResourceLink` を定義します。 例:

```xml
<ResourceLink name="jdbc/liferay" global="jdbc/liferay" type="javax.sql.DataSource" />
```

## ポータルのプロパティを設定する

`portal-ext.properties`ファイルで、JNDIリファレンスを使用します： jdbc.default.jndi.name=jdbc/liferay`。