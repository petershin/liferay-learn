---
uuid: 75ebda3c-3714-4a2a-a07e-84ae00599ff9
taxonomy-category-names:
- DXP Self-Hosted Installation, Maintenance, and Administration
- DXP Configuration
- Liferay Self-Hosted
---
# Setting Up JNDI on Tomcat

{bdg-secondary}`Liferay 7.4+`

To set up JNDI resources, you must put the necessary JDBC drivers in the Tomcat lib folder (i.e. `tomcat-9.0.56/lib`). For example, if you use an Oracle database, copy `ojdbc8.jar` into this folder. If you use the [Hikari Connection Pool](https://github.com/brettwooldridge/HikariCP), you must copy the `hikaricp.jar` and `slf4-api.jar` files as well.

After copying the necessary files, define your JNDI resources. Add the definition to a `ROOT.xml` file to configure it locally or to a `server.xml` file to configure it globally. Then add a resource link to a `context.xml` file.

## Setting the `ROOT.xml` or `server.xml`

For example, modify the `tomcat-9.0.56/conf/Catalina/localhost/ROOT.xml` file:

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

Or define the data source in your `/conf/server.xml` file within the `GlobalNamingResources` element. For example,

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

## Setting the `context.xml`

If you've defined the data source globally, define a `ResourceLink` in your `/conf/context.xml` file. For example,

```xml
<ResourceLink name="jdbc/liferay" global="jdbc/liferay" type="javax.sql.DataSource" />
```

## Setting the Portal Properties

In your `portal-ext.properties` file, use the JNDI reference: `jdbc.default.jndi.name=jdbc/liferay`.
