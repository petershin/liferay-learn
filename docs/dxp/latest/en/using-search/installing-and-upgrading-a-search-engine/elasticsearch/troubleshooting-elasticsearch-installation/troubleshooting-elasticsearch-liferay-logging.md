# Troubleshooting Elasticsearch Liferay Logging

## Getting the Elasticsearch Query of Search Bar Widget Searches

The easiest is to use the _Search Insights_ widget. See more in [Search Pages and Widgets](../search-pages-and-widgets/search-insights.md).

## Getting the Elasticsearch Query of Any Index-based Searches

Set the log level for `com.liferay.portal.search.elasticsearch7.internal.ElasticsearchIndexSearcher` to `INFO` level using the [Server Administrations logging UI](../../../system-administration/using-the-server-administration-panel/configuring-logging.md).

If you are on Liferay 7-1-7.2 and using the default, bundled _Connector to Elasticsearch 6_, change the version number in the package name from `7` to `6`.

## Disabling the Log Exceptions Only Behavior

Refer to the "Log Exceptions Only" configuration in the [Elasticsearch Connector Configuration Reference](../elasticsearch-connector-configuration-reference.md#general-connection-settings).

## Enable Verbose SSL Logging

To troubleshoot encryption related issues, enabling verbose SSL logging can be useful.

For Liferay, you can set `-Djavax.net.debug=ssl:handshake:verbose` for your Application Server's JVM. For example in Tomcat, you can add `CATALINA_OPTS="$CATALINA_OPTS -Djavax.net.debug=ssl:handshake:verbose"` to `setenv.sh`.

To enabling verbose SSL logging for Elasticsearch, add `-Djavax.net.debug=ssl:handshake:verbose` to the end of `$ES_HOME/config/jvm.options`.
