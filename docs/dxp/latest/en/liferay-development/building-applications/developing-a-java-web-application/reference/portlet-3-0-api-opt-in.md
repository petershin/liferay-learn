---
uuid: 994902c1-2766-446d-a67b-67f70565e3c1
taxonomy-category-names:
- Development and Tooling
- Java Development
- Liferay Self-Hosted
- Liferay PaaS
---
# Portlet 3.0 API Opt In

A portlet must specify version 3.0 to "opt in" to the Portlet 3.0 API. The 3.0 Portlet API version can be specified in the following ways.

## Standard Portlet `@PortletApplication` Annotation

Standard portlets need only specify the [`@PortletApplication`](https://resources.learn.liferay.com/reference/latest/en/portlet-api/javax/portlet/annotations/PortletApplication.html) annotation.

```java
@PortletApplication(version="3.0") // 3.0 is the default for this annotation attribute
@PortletConfiguration(portletName="myPortlet")
public class MyPortlet {
    ...
}
```

## Liferay MVC Portlet `@Component` Annotation

Declarative Services portlets, such as `MVCPortlet`, can specify version 3.0 in their `@Component` annotation.

```java
@Component(properties="javax.portlet.version=3.0", service=javax.portlet.Portlet.class)
public class MyDeclarativeServicesPortlet {
    ...
}
```

### `portlet.xml` Descriptor

All portlets can specify version 3.0 in their `portlet.xml` descriptor.

```xml
<?xml version="1.0"?>

<portlet-app xmlns="http://xmlns.jcp.org/xml/ns/portlet"
			 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			 xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/portlet http://xmlns.jcp.org/xml/ns/portlet/portlet-app_3_0.xsd"
			 version="3.0">
	...
</portlet-app>
```
