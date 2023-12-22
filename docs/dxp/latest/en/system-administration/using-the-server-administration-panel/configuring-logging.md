---
uuid: fd3a9ef8-8e66-4f1d-84fa-2d8b7bfb31bf
---
# Configuring Logging

In the Server Administration panel's Log Levels tab, you can set logging levels for classes and packages in Liferay DXP's class hierarchy and add custom objects to be similarly managed using the Server Administration logging UI. Changes to the log level near the top of the class hierarchy (such as at `com.liferay`) also change log levels for all the classes under that hierarchy. Modifications unnecessarily high in the hierarchy generate too many messages to be useful.

```{tip}
If your changes produce more log messages, make them as specific as possible.
```

Each logging configuration is referred to as a Category.

## Adding a Class or Package to the Log Levels User Interface

To add a category,

1. Navigate to Control Panel &rarr; Configuration &rarr; Server Administration, and click the _Log Levels_ tab.

1. Open the Add Category form by clicking the Add button ![Add](../../images/icon-add.png).

1. Fill out the form and click *Save*.

1. Click _Save_.

*Logger Name*: A class deployed on the server, such as `com.liferay.portal.workflow.kaleo.runtime.internal.notification.TemplateNotificationMessageGenerator`

*Log Level*: Choose the logging level you'd like to see: OFF, FATAL, ERROR, WARN, INFO, DEBUG, TRACE, or ALL.

![You can add your own deployed classes to the logging level categories.](./configuring-logging/images/01.png)

For a description of the logging levels, refer to [Apache's Log4j `Level` class Javadoc](https://logging.apache.org/log4j/1.2/apidocs/org/apache/log4j/Level.html).

## Changing the Log Level of an Existing Category

To change the log level of an existing logging configuration,

1. Navigate to Control Panel &rarr; Configuration &rarr; Server Administration, and click the _Log Levels_ tab.

1. Browse to or search for the category to configure.

1. Use the selector to change the level.

1. Click _Save_.

![To debug possible issues, you can change the logging level of any class that can be logged.](./configuring-logging/images/02.png)

## Adjusting Levels with XML Files

To adjust the log levels with an XML file,

1. Take note of the symbolic bundle name of the module (e.g. `com.liferay.saml.opensaml.integration`).

1. In your `[LIFERAY_HOME]/osgi/log4j` folder, create an XML file with the following format `[symbolicBundleName]-log4j-ext.xml`. For example `com.liferay.saml.opensaml.integration-log4j-ext.xml`.

1. Define the logger level in the XML file. For example,

```xml  
   <?xml version="1.0"?>
   <Configuration strict="true">
   	<Loggers>
   		<Logger level="DEBUG" name="com.liferay.saml.opensaml.integration" />
   	</Loggers>
   </Configuration>
```

Note, the configuration is in the XML Schema Definition (XSD) format and not in Document Type Definition (DTD) format.
