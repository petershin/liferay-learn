---
taxonomy-category-names:
- Cloud
- Cloud Platform Services
- Liferay PaaS
uuid: dab38c61-eaff-4cb3-8c40-0adf66c1c129
---

# Liferay Service Environment Variables

The Liferay service has a [range of environment variables](#environment-variables-reference) that are used to configure the service, its connection to other services, and the DXP installation itself. You can use Liferay Cloud-specific environment variables, or you can define variables that override DXP [portal properties](https://docs.liferay.com/dxp/portal/7.3-latest/propertiesdoc/portal.properties.html).

## Overriding Portal Properties

You can use environment variables in the Liferay service to override configurations normally defined in portal properties files.

Check the [portal properties documentation](https://docs.liferay.com/dxp/portal/7.3-latest/propertiesdoc/portal.properties.html) to find the environment variable name ("Env") for each corresponding portal property. For example, you can override the portal property `company.default.time.zone` with the environment variable, `LIFERAY_COMPANY_PERIOD_DEFAULT_PERIOD_TIME_PERIOD_ZONE`.

See [Defining Environment Variables](../../reference/defining-environment-variables.md) for more information on adding them to the Liferay service.

### Converting Portal Property Names to Environment Variables

If the [portal properties documentation](https://docs.liferay.com/dxp/portal/7.3-latest/propertiesdoc/portal.properties.html) does not have a direct translation of a portal property, then you can also convert the property to an overriding environment variable yourself.

Environment variables overriding portal properties:

* Must not start with a digit.

* Must have the prefix `LIFERAY_` added in front of them.

* Must only consist of uppercase letters, digits, and the underscore (`_`) character. Any character that does not fit this constraint must be converted to its corresponding [`CharPool`](https://docs.liferay.com/dxp/portal/7.3-latest/javadocs/modules/core/petra/com.liferay.petra.string/) or [Unicode](https://unicode-table.com/en/) endpoint (converted to decimal).

To meet these requirements, you must convert any portal properties to this format. This allows Liferay Cloud to properly recognize the full name and match it to its corresponding portal property.

Use these steps to convert a portal property name to an environment variable name:

1. Convert any characters contained in the name that are not a letter, digit or underscore (including periods) to a corresponding [`CharPool`](https://docs.liferay.com/dxp/portal/7.3-latest/javadocs/modules/core/petra/com.liferay.petra.string/) or Unicode endpoint, and surround them in underscores.

    For example, convert the period character (`.`) to `_PERIOD_`, or `_46_` (if using Unicode).

1. Add the prefix `LIFERAY_` to the start of the variable name.

1. Convert any letters to upper case.

For example, taking the portal property name `setup.wizard.enabled`, then using `CharPool` endpoints, you can convert it to the environment variable named: `LIFERAY_SETUP_PERIOD_WIZARD_PERIOD_ENABLED`.

## Environment Variables Reference

The following environment variables may be set through the environment variables UI or the Liferay service's `LCP.json` file:

| **Name**                                                                   | **Default Value**             | **Description**                                                                                                                                                                                                                                                            |
|:---------------------------------------------------------------------------|:------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `LCP_LIFERAY_JDBC_CONNECTION_URL`                                          |                               | The URL used to make the database connection. This may be used to directly set the database name and host. The value should start with `jdbc:mysql://`. _Not used for versions 4.3.2+._                                                                                    |
| `LCP_LIFERAY_JDBC_CONNECTION_URL_QUERY_STRING`                             | _(See value below for MySQL)_ | Configures the JDBC connection query string.                                                                                                                                                                                                                               |
| `LCP_LIFERAY_JDBC_DRIVER`                                                  |                               | Allows for specifying the MySQL driver the Liferay service uses. In DXP versions 7.0 and 7.1, this is also used for the cluster configuration. _Not used for versions 4.3.2+._                                                                                             |
| `LCP_PROJECT_LIFERAY_CLUSTER_ENABLED`                                      | `true`                        | Whether to enable clustering and communication between nodes.                                                                                                                                                                                                              |
| `LCP_PROJECT_MONITOR_DYNATRACE_TENANT`                                     |                               | A string of characters that is part of the URL (prefix) of your Dynatrace SaaS account. Use this together with the `LCP_PROJECT_MONITOR_DYNATRACE_TOKEN` secret.                                                                                                           |
| `LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_DRIVER_UPPERCASE_CLASS_UPPERCASE_NAME` |                               | Changes the `jdbc.default.driverClassName` Liferay [portal property](https://learn.liferay.com/web/guest/w/dxp/installation-and-upgrades/reference/portal-properties) to change the database driver. _Changing this can cause Liferay to fail to connect to the database._ |
| `LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_URL`                                   | (See values below)            | Changes the `jdbc.default.url` Liferay [portal property](https://learn.liferay.com/web/guest/w/dxp/installation-and-upgrades/reference/portal-properties) to override the JDBC URL. _Changing this can cause Liferay to fail to connect to the database._            |
| `LIFERAY_JVM_OPTS`                                                         | `-Xms4096m -Xmx12288m`        | JVM options to be appended to `CATALINA_OPTS` to override the default recommended options. The recommendation is to set `-Xms` to 25% of the Liferay service's available memory, and `-Xmx` to 75%.                                                                        |

**Default `LCP_LIFERAY_JDBC_CONNECTION_URL_QUERY_STRING` value** (only for MySQL): `characterEncoding=UTF-8&dontTrackOpenResources=true&holdResultsOpenOverStatementClose=true&permitMysqlScheme=true&serverTimezone=GMT&useFastDateParsing=false&useUnicode=true`

**Default `LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_URL` values**:
    * **For PostgreSQL**: `jdbc:postgresql://database--route/lportal`
    * **For MySQL**: `jdbc:mysql://database--route/lportal?characterEncoding=UTF-8&dontTrackOpenResources=true&holdResultsOpenOverStatementClose=true&permitMysqlScheme=true&serverTimezone=GMT&useFastDateParsing=false&useUnicode=true`

### Secrets

These variables must instead be [defined as Secrets](../../tuning-security-settings/managing-secure-environment-variables-with-secrets.md) for the Liferay service:

Name                                  | Default Value | Description  |
:--- | :--- | :--- |
`LCP_PROJECT_MONITOR_DYNATRACE_TOKEN` |  | A string of characters that you can find in your Dynatrace account at *Deploy Dynatrace* &rarr; *Start installation* &rarr; *Set up PaaS monitoring* &rarr; *Installer Download*. |
`LCP_SECRET_DATABASE_NAME` |   | The database name used for database connections (jdbc, jdbc ping, and read-only user connections). |
`LCP_SECRET_DATABASE_PASSWORD` |  |  The database password used only for the jdbc (and jdbc ping) configurations. |
`LCP_SECRET_DATABASE_READONLY_USER` |  | The read-only user's username. |
`LCP_SECRET_DATABASE_READONLY_USER_PASSWORD` |  | The read-only user's password. |
`LCP_SECRET_DATABASE_USER` |  | The primary database user's user name. Used for the jdbc and jdbc ping connections. |
