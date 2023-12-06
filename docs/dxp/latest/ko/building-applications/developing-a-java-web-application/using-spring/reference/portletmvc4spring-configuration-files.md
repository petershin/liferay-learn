# PortletMVC4Spring 구성 파일

PortletMVC4Spring 애플리케이션에는 `WEB-INF` 폴더에 이러한 설명자, Spring 컨텍스트 및 속성 파일이 있습니다.

* `web.xml` &rarr; 웹 응용 프로그램 설명자
* `portlet.xml` &rarr; 포틀릿 애플리케이션 디스크립터
* `liferay-portlet.xml` &rarr; Liferay 특정 포틀릿 설명자
* `liferay-display.xml` &rarr; Liferay 관련 디스플레이 설명자
* `spring-context/portlet-application-context.xml` &rarr; 포틀릿 애플리케이션 컨텍스트
* `spring-context/portlet/[portlet]-context.xml` &rarr; 포틀릿 컨텍스트
* `liferay-plugin-package.properties` &rarr; 패키징 설명자

각 파일의 예가 제공되고 포틀릿 특정 컨텐츠가 강조표시됩니다.

## web.xml

서블릿 컨테이너는 `web.xml`을 처리합니다. 이 파일은 포틀릿과 포틀릿 애플리케이션의 컨텍스트, 서블릿, 필터, 리스너 등을 렌더링하는 서블릿을 지정합니다. 다음은 `web.xml`의 예입니다.

```xml
<?xml version="1.0"?>

<web-app version="3.1" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd">
    <context-param>
        <param-name>contextConfigLocation</param-name>
        <param-value>/WEB-INF/spring-context/portlet-application-context.xml</param-value>
    </context-param>
    <servlet>
        <servlet-name>ViewRendererServlet</servlet-name>
        <servlet-class>com.liferay.portletmvc4spring.ViewRendererServlet</servlet-class>
        <load-on-startup>1</load-on-startup>
    </servlet>
    <servlet-mapping>
        <servlet-name>ViewRendererServlet</servlet-name>
        <url-pattern>/WEB-INF/servlet/view</url-pattern>
    </servlet-mapping>
    <filter>
        <filter-name>delegatingFilterProxy</filter-name>
        <filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>
    </filter>
    <filter-mapping>
        <filter-name>delegatingFilterProxy</filter-name>
        <url-pattern>/WEB-INF/servlet/view</url-pattern>
        <dispatcher>FORWARD</dispatcher>
        <dispatcher>INCLUDE</dispatcher>
    </filter-mapping>
    <listener>
        <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
    </listener>
</web-app>
```

`<context-param/>` 요소는 포틀릿 애플리케이션 컨텍스트에 대한 경로를 제공합니다(나중에 설명됨).

```xml
<context-param>
    <param-name>contextConfigLocation</param-name>
    <param-value>/WEB-INF/spring-context/portlet-application-context.xml</param-value>
</context-param>
```

`<servlet/>` 및 `<servlet-mapping/>` 요소는 서블릿과 뷰의 내부 사이트를 설정합니다.

```xml
<servlet>
    <servlet-name>ViewRendererServlet</servlet-name>
    <servlet-class>com.liferay.portletmvc4spring.ViewRendererServlet</servlet-class>
    <load-on-startup>1</load-on-startup>
</servlet>
<servlet-mapping>
    <servlet-name>ViewRendererServlet</servlet-name>
    <url-pattern>/WEB-INF/servlet/view</url-pattern>
</servlet-mapping>
```

[`ViewRendererServlet`](https://liferay.github.io/portletmvc4spring/apidocs/com/liferay/portletmvc4spring/ViewRendererServlet.html) .  포틀릿 요청을 서블릿 요청으로 변환하고 Spring Web MVC 인프라와 JSP, Thymeleaf, Velocity 등에 대한 인프라의 렌더러를 사용하여 보기를 렌더링할 수 있습니다.

필터 및 필터 매핑은 필요에 따라 서블릿 보기를 전달하고 포함하도록 설정됩니다.

```xml
<filter>
    <filter-name>delegatingFilterProxy</filter-name>
    <filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>
</filter>
<filter-mapping>
    <filter-name>delegatingFilterProxy</filter-name>
    <url-pattern>/WEB-INF/servlet/view</url-pattern>
    <dispatcher>FORWARD</dispatcher>
    <dispatcher>INCLUDE</dispatcher>
</filter-mapping>
```

애플리케이션의 컨텍스트를 처리하기 위해 리스너가 구성됩니다.

```xml 
<listener>
    <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
</listener>
```

Liferay의 프로젝트 원형은 이 모든 상용구 코드를 생성합니다.

## portlet.xml

`portlet.xml` 파일은 포틀릿 컨테이너에 대한 포틀릿 애플리케이션을 설명합니다. 예를 들면 다음과 같습니다.

```xml
<?xml version="1.0"?>

<portlet-app xmlns="http://xmlns.jcp.org/xml/ns/portlet" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/portlet http://xmlns.jcp.org/xml/ns/portlet/portlet-app_3_0.xsd" version="3.0">
    <portlet>
        <portlet-name>portlet1</portlet-name>
        <display-name>com.mycompany.my.form.jsp.portlet</display-name>
        <portlet-class>com.liferay.portletmvc4spring.DispatcherPortlet</portlet-class>
        <init-param>
            <name>contextConfigLocation</name>
            <value>/WEB-INF/spring-context/portlet/portlet1-context.xml</value>
        </init-param>
        <expiration-cache>0</expiration-cache>
        <supports>
            <mime-type>text/html</mime-type>
            <portlet-mode>view</portlet-mode>
        </supports>
        <resource-bundle>content.portlet1</resource-bundle>
        <portlet-info>
            <title>com.mycompany.my.form.jsp.portlet</title>
            <short-title>com.mycompany.my.form.jsp.portlet</short-title>
            <keywords>com.mycompany.my.form.jsp.portlet</keywords>
        </portlet-info>
        <security-role-ref>
            <role-name>administrator</role-name>
        </security-role-ref>
        <security-role-ref>
            <role-name>guest</role-name>
        </security-role-ref>
        <security-role-ref>
            <role-name>power-user</role-name>
        </security-role-ref>
        <security-role-ref>
            <role-name>user</role-name>
        </security-role-ref>
    </portlet>
    <filter>
        <filter-name>SpringSecurityPortletFilter</filter-name>
        <filter-class>com.liferay.portletmvc4spring.security.SpringSecurityPortletFilter</filter-class>
        <lifecycle>ACTION_PHASE</lifecycle>
        <lifecycle>RENDER_PHASE</lifecycle>
        <lifecycle>RESOURCE_PHASE</lifecycle>
    </filter>
    <filter-mapping>
        <filter-name>SpringSecurityPortletFilter</filter-name>
        <portlet-name>portlet1</portlet-name>
    </filter-mapping>
</portlet-app>
```

이 애플리케이션에는 `portlet1`이라는 하나의 포틀릿이 있습니다.

```xml
<portlet-name>portlet1</portlet-name>
<display-name>com.mycompany.my.form.jsp.portlet</display-name>
<portlet-class>com.liferay.portletmvc4spring.DispatcherPortlet</portlet-class>
```

`<portlet-name/>` 는 내부용이고 `<display-name/>` 는 사용자에게 표시됩니다. `<portlet-class/>` 는 포틀릿의 Java 클래스를 지정합니다.

**중요:** 모든 PortletMVC4Spring 포틀릿은 `<portlet-class>com.liferay.portletmvc4spring.DispatcherPortlet</portlet-class>`를 지정해야 합니다.

`<supports/>` 요소는 포틀릿 템플릿이 사용하는 MIME 유형을 선언해야 합니다.

`<resource-bundle/>` 는 포틀릿의 지역화된 Java 메시지 특성에 대한 경로를 설정합니다. 예를 들어 요소는 `content/portlet1.properties`의 속성을 참조합니다.

```xml
<resource-bundle>content.portlet1</resource-bundle>
```

`<portlet-info/>` 요소는 포틀릿의 제목과 예약된 키워드를 나열합니다.

`<security-role-ref/>` 요소는 포틀릿이 설명하는 기본 사용자 역할을 선언합니다.

마지막으로 `<filter/>` 라는 이름의  [`SpringSecurityPortletFilter`](https://liferay.github.io/portletmvc4spring/apidocs/index.html) 은 CSRF(Cross-Site Request Forgery)를 방지합니다.

```xml
<filter>
    <filter-name>SpringSecurityPortletFilter</filter-name>
    <filter-class>com.liferay.portletmvc4spring.security.SpringSecurityPortletFilter</filter-class>
    <lifecycle>ACTION_PHASE</lifecycle>
    <lifecycle>RENDER_PHASE</lifecycle>
    <lifecycle>RESOURCE_PHASE</lifecycle>
</filter>
<filter-mapping>
    <filter-name>SpringSecurityPortletFilter</filter-name>
    <portlet-name>portlet1</portlet-name>
</filter-mapping>
```

[`포틀릿 XSD`](https://docs.liferay.com/portlet-api/3.0/portlet-app_3_0.xsd) 은 `portlet.xml`를 정의합니다. 다음은 Liferay 관련 포틀릿 설명자입니다.

## liferay-portlet.xml

`liferay-portlet.xml` 파일은 더 많은 개발자 기능을 제공하는 Liferay 관련 설정을 적용합니다. 예를 들면 다음과 같습니다.

```xml 
<?xml version="1.0"?>
<!DOCTYPE liferay-portlet-app PUBLIC "-//Liferay//DTD Portlet Application 7.4.0//EN" "http://www.liferay.com/dtd/liferay-portlet-app_7_4_0.dtd">

<liferay-portlet-app>
    <portlet>
        <portlet-name>portlet1</portlet-name>
        <icon>/resources/images/icon.png</icon>
        <requires-namespaced-parameters>false</requires-namespaced-parameters>
    </portlet>
    <role-mapper>
        <role-name>administrator</role-name>
        <role-link>Administrator</role-link>
    </role-mapper>
    <role-mapper>
        <role-name>guest</role-name>
        <role-link>Guest</role-link>
    </role-mapper>
    <role-mapper>
        <role-name>power-user</role-name>
        <role-link>Power User</role-link>
    </role-mapper>
    <role-mapper>
        <role-name>user</role-name>
        <role-link>User</role-link>
    </role-mapper>
</liferay-portlet-app>
```

이 `<portlet/>` 요소는 아이콘을 포틀릿과 연결하고 이름 공간 매개변수가 필요하지 않음을 나타냅니다.

`<role-mapper/>` 요소는 포틀릿을 기본 Liferay DXP 사용자 역할과 연결합니다.

[`liferay-portlet-app [version]2.dtd` 파일](https://learn.liferay.com/reference/latest/en/dxp/definitions/index.html) 는 `liferay-portlet.xml` 파일을 정의합니다.

## liferay-display.xml

`liferay-display.xml` 은 디스플레이 특성을 포틀릿에 적용합니다. 예를 들어 이 설명자는 포틀릿을 Liferay DXP의 위젯 추가 메뉴에 있는 위젯 범주와 연결합니다.

```xml
<?xml version="1.0"?>
<!DOCTYPE display PUBLIC "-//Liferay//DTD Display 7.4.0//EN" "http://www.liferay.com/dtd/liferay-display_7_4_0.dtd">

<display>
<category name="category.sample">
    <portlet id="portlet1" />
</category>
</display>
```

자세한 내용은 [`liferay-display-[version].dtd` 파일](https://learn.liferay.com/reference/latest/en/dxp/definitions/index.html) 를 참조하십시오.

애플리케이션 컨텍스트를 살펴볼 때입니다.

## 포틀릿 애플리케이션 컨텍스트

이 컨텍스트는 애플리케이션의 모든 포틀릿에 적용됩니다. 여기에서 뷰 확인자, 리소스 번들, 보안 빈, 프록시 등을 지정합니다. 예를 들면 다음과 같습니다.

```xml 
<?xml version="1.0"?>

<beans
    xmlns="http://www.springframework.org/schema/beans"
    xmlns:context="http://www.springframework.org/schema/context"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="
        http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd">
    <context:annotation-config />
    <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver" id="viewResolver">
        <property name="contentType" value="text/html;charset=UTF-8" />
        <property name="prefix" value="/WEB-INF/views/" />
        <property name="suffix" value=".jspx" />
        <property name="viewClass" value="com.liferay.portletmvc4spring.PortletJstlView" />
    </bean>
    <bean id="messageSource" class="org.springframework.context.support.ResourceBundleMessageSource">
        <property name="basenames">
            <list>
                <value>content.portlet1</value>
            </list>
        </property>
        <property name="defaultEncoding" value="UTF-8" />
    </bean>
    <bean id="springSecurityPortletConfigurer" class="com.liferay.portletmvc4spring.security.SpringSecurityPortletConfigurer" />
    <bean id="delegatingFilterProxy" class="org.springframework.web.filter.DelegatingFilterProxy">
        <property name="targetBeanName" value="springSecurityFilterChain" />
    </bean>
</beans>
```

위의 보기 확인자 빈은 JSPX 보기 템플릿을 처리합니다. 예를 들어 Thymeleaf 보기 템플릿을 확인하려면 다음 빈을 지정할 수 있습니다.

```xml 
<bean class="org.thymeleaf.templateresolver.ServletContextTemplateResolver" id="templateResolver">
    <property name="prefix" value="/WEB-INF/views/"/>
    <property name="suffix" value=".html"/>
    <property name="templateMode" value="HTML"/>
</bean>
<bean class="org.thymeleaf.spring5.SpringTemplateEngine" id="templateEngine">
    <property name="templateResolver" ref="templateResolver"></property>
    <property name="enableSpringELCompiler" value="true" />
</bean>
<bean class="org.thymeleaf.spring5.view.ThymeleafViewResolver" id="viewResolver">
    <property name="templateEngine" ref="templateEngine"/>
    <property name="order" value="1"/>
</bean>
```

컨텍스트의 `springSecurityPortletConfigurer` 빈은 Spring Security 사용을 용이하게 합니다.

```xml
<bean id="springSecurityPortletConfigurer" 
    class="com.liferay.portletmvc4spring.security.SpringSecurityPortletConfigurer" />
```

애플리케이션의 각 포틀릿에 대한 컨텍스트를 지정할 수도 있습니다.

## 포틀릿 컨텍스트

포틀릿에 특정한 Bean은 포틀릿의 컨텍스트로 이동합니다. 주석은 PortletMVC4Spring 포틀릿을 개발하는 가장 쉬운 방법이므로 포틀릿 컨텍스트에서 MVC 주석 스캔을 지정해야 합니다.

```xml 
<?xml version="1.0"?>

<beans
    xmlns="http://www.springframework.org/schema/beans"
    xmlns:context="http://www.springframework.org/schema/context"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:mvc="http://www.springframework.org/schema/mvc"
    xsi:schemaLocation="
        http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd
        http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc.xsd">
    <context:component-scan base-package="portlet1**"/>
    <mvc:annotation-driven/>
</beans>
```

포틀릿 컨텍스트 명명 규칙은 `[portlet-name]-context.xml`입니다. 포틀릿을 자체 컨텍스트와 연결하려면 애플리케이션의 `portlet.xml` 파일을 편집하고 `<portlet/>` 요소를 포틀릿의 컨텍스트에 매핑하는 `<init-param/>` 요소를 추가합니다.

```xml 
<init-param>
    <name>contextConfigLocation</name>
    <value>/WEB-INF/spring-context/portlet/portlet1-context.xml</value>
</init-param>
```

남은 것은 애플리케이션 패키지를 설명하는 것입니다.

## liferay-plugin-package.properties

이 파일은 애플리케이션의 이름, 버전, Java 패키지 가져오기/내보내기 및 OSGi 메타데이터를 지정합니다. 다음은 패키지 속성 파일의 예입니다.

```properties
author=N/A
change-log=
licenses=N/A
liferay-versions=7.2.0+
long-description=
module-group-id=com.mycompany
module-incremental-version=1
name=com.mycompany.my.form.jsp.portlet
page-url=
short-description=my portlet short description
tags=myTag
Bundle-Version: 1.0.0
Import-Package: com.liferay.portal.webserver,com.liferay.portal.kernel.servlet.filters.invoker
```

이 [메타데이터 헤더를 사용하여 필요한 Java 패키지를 가져](../../../..//liferay-internals/fundamentals/importing-packages.md).

```properties
Import-Package: com.liferay.portal.webserver,\
com.liferay.portal.kernel.servlet.filters.invoker
```

포틀릿 애플리케이션 WAR 파일을 배포할 때 [WAB 생성기](../../../reference/deploying-wars-wab-generator.md)는 지정된 OSGi 메타데이터를 결과 웹 애플리케이션 번들(WAB)에 추가합니다. Liferay의 런타임 프레임워크에 배포됩니다.

[`liferay-plugin-package-[버전].dtd` 파일](https://learn.liferay.com/reference/latest/en/dxp/definitions/index.html) 은 `liferay-plugin-package.properties` 파일.

## 관련 주제

* [PortletMVC4Spring 주석](./portletmvc4spring-annotations.md)
* [PortletMVC4Spring으로 마이그레이션 \(도움말 센터\)](https://help.liferay.com/hc/ko/articles/360030614052-Migrating-to-PortletMVC4Spring)