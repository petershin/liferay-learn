# 포틀릿 3.0 API 옵트인

포틀릿은 포틀릿 3.0 API에 "옵트인"하기 위해 버전 3.0을 지정해야 합니다. 3.0 Portlet API 버전은 다음과 같은 방법으로 지정할 수 있습니다.

## 표준 포틀릿 `@PortletApplication` 주석

표준 포틀릿은 [`@PortletApplication`](https://learn.liferay.com/reference/latest/en/portlet-api/javax/portlet/annotations/PortletApplication.html) 주석만 지정하면 됩니다.

```java
@PortletApplication(version="3.0") // 3.0은 이 주석 속성의 기본값입니다.
@PortletConfiguration(portletName="myPortlet")
public class MyPortlet {
...
}
```

## Liferay MVC 포틀릿 `@Component` 주석

선언적 서비스 포틀릿(예: `MVCPortlet`)은 `@Component` 주석에서 버전 3.0을 지정할 수 있습니다.

```java
@Component(properties="javax.portlet.version=3.0", service=javax.portlet.Portlet.class)
공개 클래스 MyDeclarativeServicesPortlet {
...
}
```

### `portlet.xml` 설명자

모든 포틀릿은 `portlet.xml` 설명자에서 버전 3.0을 지정할 수 있습니다.

```xml
<?xml version="1.0"?>

<portlet-app xmlns="http://xmlns.jcp.org/xml/ns/portlet"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/portlet http://xmlns.jcp.org/xml/ns/portlet/portlet-app_3_0.xsd"
             version="3.0">
    ...
</portlet-app>
```