---
uuid: 7a80a00f-a02e-4ab8-b33c-0e90452ddb4a
taxonomy-category-names:
- Development and Tooling
- Java Development
- Liferay Self-Hosted
- Liferay PaaS
---
# PortletMVC4Spring Annotations

PortletMVC4Spring provides several annotations for mapping requests to controller classes and controller methods.  

## `@RenderMapping` Annotation Examples

The following table describes some `@RenderMapping` annotation examples.

| Example         | Description |
| :-------------- | :---------- |
| `@RenderMapping`  | Handle primary render requests if no other handler methods match the render request. |
| `@RenderMapping(params = "javax.portlet.action=success")` | Handle the render request if has parameter a parameter setting `javax.portlet.action=success`. |
| ` @RenderMapping(param = "foo")` | Handle the request if it has a parameter named `foo`, regardless of its value. |
| `@RenderMapping(param = "!bar")` | Handle the request as long as it has not parameter named `bar`. |
|  `@RenderMapping(windowState = "MAXIMIZED")` | Handle the request if the window state is `MAXIMIZED`. Note, supported portlet window states are `NORMAL`, `MAXIMIZED`, and `MINIMIZED`. |

## `@ActionMapping` Annotation Examples

The table below describes some `@ActionMapping` annotation examples.

| Example         | Description |
| :-------------- | :---------- |
| `@ActionMapping`  | Handle primary action requests if no other handler methods match the action request. |
| `@ActionMapping(params = some.param=yourValue")` | Handle the action request if it has a parameter setting `javax.portlet.action=success`. |
| ` @ActionMapping(param = "foo")` | Handle the request if it has a parameter named `foo`, regardless of its value. |
| `@ActionMapping(param = "!bar")` | Handle the request as long as it has no parameter named `bar`. |
