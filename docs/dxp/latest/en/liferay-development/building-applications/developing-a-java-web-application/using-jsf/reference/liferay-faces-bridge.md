---
uuid: 863eae7c-f289-40bd-938d-6bfd3047ee69
taxonomy-category-names:
- Development and Tooling
- Java Development
- Liferay Self-Hosted
- Liferay PaaS
---
# Liferay Faces Bridge

Liferay Faces Bridge enables you to deploy JSF web apps as portlets without writing portlet-specific code. It also contains innovative features that make it possible to leverage the power of JSF 2.x inside a portlet application.

Liferay Faces Bridge is distributed in a `.jar` file. You can add Liferay Faces Bridge as a dependency to your portlet projects, in order to deploy your JSF web applications as portlets within JSR 286 (Portlet 2.0) compliant portlet containers, like Liferay Portal 5.2, 6.0, 6.1, 6.2, and 7.0.

Liferay Faces Bridge project home page can be found [here](https://community.liferay.com/-/faces).

To fully understand Liferay Faces Bridge, you must first understand the portlet bridge standard. Because the Portlet 1.0 and JSF 1.0 specs were being created at essentially the same time, the Expert Group (EG) for the JSF specification constructed the JSF framework to be compliant with portlets. For example, the [ExternalContext.getRequest()](https://javaee.github.io/javaee-spec/javadocs/javax/faces/context/ExternalContext.html#getRequest--) method returns an `Object` instead of an [javax.servlet.http.HttpServletRequest](https://javaee.github.io/javaee-spec/javadocs/javax/servlet/http/HttpServletRequest.html). When this method is used in a portal, the `Object` can be cast to a [javax.portlet.PortletRequest](http://portals.apache.org/pluto/portlet-2.0-apidocs/javax/portlet/PortletRequest.html). Despite the EG's consciousness of portlet compatibility within the design of JSF, the gap between the portlet and JSF lifecycles had to be bridged. 

Portlet bridge standards and implementations evolved over time. 

Starting in 2004, several different JSF portlet bridge implementations were developed in order to provide JSF developers with the ability to deploy their JSF web apps as portlets. In 2006, the JCP formed the Portlet Bridge 1.0 ([JSR 301](http://www.jcp.org/en/jsr/detail?id=301)) EG in order to define a standard bridge API, as well as detailed requirements for bridge implementations. JSR 301 was released in 2010, targeting Portlet 1.0 and JSF
1. 2.

When the Portlet 2.0 ([JSR 286](http://www.jcp.org/en/jsr/detail?id=286)) standard was released in 2008, it became necessary for the JCP to form the Portlet Bridge 2.0 ([JSR 329](http://www.jcp.org/en/jsr/detail?id=329)) EG. JSR
1. was also released in 2010, targeting Portlet 2.0 and JSF 1.2. 

After the [JSR 314](http://www.jcp.org/en/jsr/detail?id=314) EG released JSF 2.0 in 2009 and JSF 2.1 in 2010, it became evident that a Portlet Bridge 3.0 standard would be beneficial. In 2015 the JCP formed [JSR 378](http://www.jcp.org/en/jsr/detail?id=378)) which is defining a bridge for Portlet 3.0 and JSF 2.2. There are also variants of *Liferay Faces Bridge* that support Portlet 2.0 and JSF 1.2/2.1/2.2.

Liferay Faces Bridge is the Reference Implementation (RI) of the Portlet Bridge Standard. It also contains innovative features that make it possible to leverage the power of JSF 2.x inside a portlet application. 

A JSF portlet bridge aligns the correct phases of the JSF lifecycle with each phase of the portlet lifecycle. For instance, if a browser sends an HTTP GET request to a portal page with a JSF portlet in it, the `RENDER_PHASE` is performed in the portlet's lifecycle. The JSF portlet bridge then initiates the `RESTORE_VIEW` and `RENDER_RESPONSE` phases in the JSF lifecycle. Likewise, when an HTTP POST is executed on a portlet and the portlet enters the `ACTION_PHASE`, then the full JSF lifecycle is initiated by the bridge. 

![The different phases of the JSF Lifecycle are executed depending on which phase of the Portlet lifecycle is being executed.](./liferay-faces-bridge/images/01.png)

<!-- Neil stated the following about the JSF Lifecycle image above:

"In the following image, we talk about JSR 286 (Portlet 2.0), but once we're
done with Portlet 3.0 in Liferay 7.1 (very soon) and JSR 378 (Portlet 3.0 Bridge for JSF 2.2, not until the end of Q2 2019), we will need to change that to JSR
1. and also add the HEADER_PHASE."

We'll need to update the image once this is available. -Cody -->

Besides ensuring that the two lifecycles connect correctly, the JSF portlet bridge also acts as a mediator between the portal URL generator and JSF navigation rules. JSF portlet bridges ensure that URLs created by the portal comply with JSF navigation rules, so that a JSF portlet is able to switch to different views. 

The JSR 329/378 standards defines several configuration options prefixed with the `javax.portlet.faces` namespace. Liferay Faces Bridge defines additional implementation-specific options prefixed with the `com.liferay.faces.bridge` namespace. 

Liferay Faces Bridge is an essential part of the JSF development process for Liferay DXP/Portal. See [Developing a JSF Portlet Application \(Help Center\)](https://help.liferay.com/hc/en-us/articles/360029069451-Developing-a-JSF-Portlet-Application) for more information.

## Related Topics

* [Liferay Faces Alloy](./liferay-faces-alloy.md)
* [Liferay Faces Portal](./liferay-faces-portal.md)
* [Service Builder](../../../data-frameworks/service-builder.md)
