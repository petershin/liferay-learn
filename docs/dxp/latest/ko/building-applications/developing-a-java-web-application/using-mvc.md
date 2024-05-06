---
toc:
- ./using-mvc/using-a-jsp-and-mvc-portlet.md
- ./using-mvc/rendering-views-with-mvc-portlet.md
- ./using-mvc/invoking-actions-with-mvc-portlet.md
- ./using-mvc/mvc-action-command.md
- ./using-mvc/mvc-render-command.md
- ./using-mvc/mvc-resource-command.md
- ./using-mvc/portlet-preferences.md
- ./using-mvc/using-localized-messages-in-an-mvc-portlet.md
- ./using-mvc/tag-libraries.md
---
# MVC 사용

숙련된 개발자라면 Model View Controller에 대해 들어본 것이 이번이 처음이 아닙니다. Java에서 MVC 프레임워크의 구현이 너무 많은 경우 Liferay가 또 다른 구현을 만든 이유는 무엇입니까? 우리와 함께 있으면 Liferay MVC 포틀릿이 다음과 같은 이점을 제공한다는 것을 알게 될 것입니다.

* 다른 많은 Java MVC 프레임워크와 달리 가볍습니다.
* 코드와 동기화를 유지해야 하는 특별한 구성 파일이 없습니다.
* [`GenericPortlet`](https://resources.learn.liferay.com/reference/latest/en/portlet-api/javax/portlet/GenericPortlet.html) 의 확장입니다.
* Liferay의 MVC 포틀릿 프레임워크는 `init()` 메서드가 호출될 때 일부 미리 정의된 매개변수만 찾기 때문에 많은 상용구 코드 작성을 피할 수 있습니다.
* 컨트롤러는 MVC 명령 클래스로 나눌 수 있으며 각 클래스는 특정 [포틀릿 단계](./reference/portlets.md) (렌더링, 작업 및 리소스 제공 단계)에 대한 컨트롤러 코드를 처리합니다.
* MVC 명령 클래스는 여러 포틀릿을 제공할 수 있습니다.
* Liferay의 포틀릿에서 사용합니다. 즉, Liferay 애플리케이션을 설계하거나 문제를 해결해야 할 때 참조할 수 있는 강력한 구현이 많이 있습니다.

Liferay MVC 포틀릿 프레임워크는 가볍고 사용하기 쉽습니다.

여기에서는 다음 주제를 다루면서 MVC 포틀릿이 작동하는 방식을 배웁니다.

* [MVC 계층 및 모듈성](#mvc-layers-and-modularity)
* [Liferay MVC 명령 클래스](#liferay-mvc-command-classes)
* [Liferay MVC 포틀릿 구성 요소](#liferay-mvc-portlet-component)
* [간단한 MVC 포틀릿](#a-simpler-mvc-portlet)

Liferay MVC 포틀릿 프레임워크의 각 계층이 애플리케이션의 문제를 분리하는 데 어떻게 도움이 되는지 고려하십시오.

## MVC 계층 및 모듈성

MVC에는 3개의 레이어가 있습니다.

**모델:** 모델 계층은 응용 프로그램 데이터와 이를 조작하기 위한 논리를 보유합니다.

**보기:** 보기 레이어는 데이터를 표시합니다.

**컨트롤러:** MVC 패턴의 중개인인 컨트롤러는 뷰와 모델 레이어 간에 데이터를 앞뒤로 전달합니다.

Liferay DXP의 애플리케이션은 여러 개별 모듈 [로](../../liferay-internals/architecture/osgi-and-modularity.md)니다. [서비스 빌더](../data-frameworks/service-builder.md) 을 사용하면 모델 계층이 `서비스` 및 `api` [모듈](../../liferay-internals/fundamentals/module-projects.md)로 생성됩니다. 뷰와 컨트롤러 레이어는 `웹` 모듈이라는 모듈을 공유합니다.

[Workspace](../tooling/liferay-workspace/creating-code-with-liferay-workspace.md) 을 사용하여 다중 모듈 Service Builder 기반 MVC 애플리케이션 [프로젝트](../../liferay-internals/fundamentals/module-projects.md) 의 스켈레톤을 생성하면 많은 시간을 절약하고 더 중요한(솔직히 말하면 흥미로운) 개발 작업을 시작할 수 있습니다.

## Liferay MVC 명령 클래스

더 큰 애플리케이션에서 `-Portlet` 클래스는 모든 컨트롤러 논리를 보유하는 경우 괴물이 되고 다루기 어려워질 수 있습니다. Liferay는 컨트롤러 기능을 분리하기 위해 MVC 명령 클래스를 제공합니다.

* ** [`MVCActionCommand`](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/portlet/bridges/mvc/MVCActionCommand.html) :** `-ActionCommand` 클래스를 사용하여 조치 URL에 의해 호출되는 각 포틀릿 조치를 보유하십시오.
* ** [`MVCRenderCommand`](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/portlet/bridges/mvc/MVCRenderCommand.html) :** `-RenderCommand` 클래스를 사용하여 렌더링 URL에 응답하여 적절한 JSP로 디스패치하는 `렌더링` 메서드를 보유합니다.
* ** [`MVCResourceCommand`](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/portlet/bridges/mvc/MVCResourceCommand.html) :** `-ResourceCommand` 클래스를 사용하여 리소스 URL을 기반으로 리소스를 제공합니다.

모든 것을 함께 연결하고 제대로 작동하려면 혼란스러운 구성 파일이 있어야 합니다. 맞습니까? 잘못됨: `-Portlet` 클래스의 `@Component` 주석에서 모두 쉽게 관리됩니다.

## Liferay MVC 포틀릿 구성 요소

컨트롤러를 MVC 명령 클래스로 분할할 계획인지 여부에 관계없이 포틀릿 [`@Component`](https://docs.osgi.org/javadoc/osgi.cmpn/7.0.0/org/osgi/service/component/annotations/Component.html) 주석이 포틀릿을 구성합니다. 다음은 간단한 포틀릿 구성 요소를 예로 든 것입니다.

```java
@Component(
    property = {
        "com.liferay.portlet.display-category=category.sample",
        "javax.portlet.display-name=Hello World Portlet",
        "javax.portlet.init-param.view-template=/view.jsp",
        "javax.portlet.name=com_acme_hello_world_web_internal_portlet_HelloWorldPortlet"
    },
    service = Portlet.class
)
public class HelloWorldPortlet extends MVCPortlet {
```

`javax.portlet.name` 특성이 필요합니다. MVC 명령을 사용할 때 `javax.portlet.name` 속성 값은 특정 포틀릿 URL/명령 조합을 올바른 포틀릿에 연결합니다.

```{important}
[Liferay DXP가 이름을 사용하여 [포틀릿의 ID](./reference/portlet-descriptor-to-osgi-service-property-map.md#ten) 를 생성하는 방법을 고려하여 포틀릿 이름을 고유하게 만드십시오.
```

구성 요소와 함께 게시하는 `Portlet.class` 구현의 종류에 대해 약간의 혼란이 있을 수 있습니다. 서비스 레지스트리는 이것이 [`javax.portlet.Portlet`](https://resources.learn.liferay.com/reference/latest/en/portlet-api/javax/portlet/Portlet.html) 인터페이스일 것으로 예상합니다. 예를 들어 `com.liferay.portal.kernel.model.Portlet`이 아니라 가져옵니다.

```{note}
[`liferay-portlet-app_ [version].dtd` 파일](https://resources.learn.liferay.com/reference/latest/en/dxp/definitions/index.html) 은 다음과 같이 지정할 수 있는 모든 Liferay 관련 속성을 정의합니다. 포틀릿 구성 요소의 속성. `javax.portlet.`으로 명명된 속성은 [`portlet.xml` 설명자](https://docs.liferay.com/portlet-api/3.0/portlet-app_3_0.xsd) 의 요소입니다.
```

## 더 간단한 MVC 포틀릿

간단한 응용 프로그램에서는 MVC 명령을 사용하지 않습니다. 포틀릿 렌더링 URL은 `mvcPath` 매개변수에서 JSP 경로를 지정하고 [`MVCPortlet`](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/portlet/bridges/mvc/MVCPortlet.html) 메서드는 제어 논리를 구현합니다. 다음 JSP 코드에는 JSP 경로 `/view_2.jsp`을 지정하는 포틀릿 렌더링 URL이 포함되어 있습니다.

```jsp
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:renderURL var="view2URL">
    <portlet:param name="mvcPath" value="/view_2.jsp" />
</portlet:renderURL>

<a href="<%= view2URL %>">Go to View 2</a>
```

사용자가 링크를 클릭하면 포틀릿은 `mvcPath` 요청 매개변수를 수신하고 `render` 메소드에서 제어 로직을 처리합니다. 자세한 내용은 [MVC 포틀릿으로 보기 렌더링](./using-mvc/rendering-views-with-mvc-portlet.md)을 참조하십시오.

## 다음

보시다시피 Liferay의 MVC 포틀릿 프레임워크는 잘 구성된 컨트롤러 계층을 제공합니다. MVC 포틀릿 기본 사항을 배우려면 다음 자습서로 시작하십시오.

* [JSP 및 MVC 포틀릿 사용](./using-mvc/using-a-jsp-and-mvc-portlet.md)
* [MVC 포틀릿으로 뷰 렌더링](./using-mvc/rendering-views-with-mvc-portlet.md)
* [MVC 포틀릿으로 작업 호출](./using-mvc/invoking-actions-with-mvc-portlet.md)

별도의 MVC 명령 클래스에서 제어 논리를 개발하려면 다음 문서를 읽어보세요.

* [MVC 작업 명령](./using-mvc/mvc-action-command.md)
* [MVC 렌더링 명령](./using-mvc/mvc-render-command.md)
* [MVC 리소스 명령](./using-mvc/mvc-resource-command.md)

모델 계층을 개발할 준비가 되었으면 [서비스 빌더](../data-frameworks/service-builder.md) 을 참조하십시오.

## 관련 주제

* [Portlet특혜](./using-mvc/portlet-preferences.md)
* [MVC 포틀릿에서 지역화된 메시지 사용](./using-mvc/using-localized-messages-in-an-mvc-portlet.md)
* [모듈 프로젝트](../../liferay-internals/fundamentals/module-projects.md)
* [작업 공간](../tooling/liferay-workspace/creating-code-with-liferay-workspace.md)
* [기초](../../liferay-internals/fundamentals.md)
* [건축학](../../liferay-internals/architecture.md)
