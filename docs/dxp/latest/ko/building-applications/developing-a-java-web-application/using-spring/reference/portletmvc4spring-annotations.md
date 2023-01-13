# PortletMVC4Spring 주석

PortletMVC4Spring은 요청을 컨트롤러 클래스 및 컨트롤러 메서드에 매핑하기 위한 몇 가지 주석을 제공합니다.

## `@RenderMapping` 주석 예시

다음 표는 몇 가지 `@RenderMapping` 주석 예제를 설명합니다.

| 예                                                         | 묘사                                                                                     |
|:--------------------------------------------------------- |:-------------------------------------------------------------------------------------- |
| `@RenderMapping`                                          | 다른 처리기 메서드가 렌더링 요청과 일치하지 않는 경우 기본 렌더링 요청을 처리합니다.                                       |
| `@RenderMapping(params = "javax.portlet.action=success")` | 매개변수가 매개변수 설정 `javax.portlet.action=success`인 경우 렌더링 요청을 처리하십시오.                       |
| `@RenderMapping(param = "foo")`                           | 값에 관계없이 이름이 `foo`인 매개변수가 있으면 요청을 처리합니다.                                                |
| `@RenderMapping(param = "!bar")`                          | `bar`이라는 매개변수가 없는 한 요청을 처리합니다.                                                         |
| `@RenderMapping(windowState = "MAXIMIZED")`               | 창 상태가 `MAXIMIZED`인 경우 요청을 처리합니다. 지원되는 포틀릿 창 상태는 `NORMAL`, `MAXIMIZED`및 `MINIMIZED`입니다. |

## `@ActionMapping` 주석 예시

아래 표는 몇 가지 `@ActionMapping` 주석 예제를 설명합니다.

| 예                                                | 묘사                                                         |
|:------------------------------------------------ |:---------------------------------------------------------- |
| `@ActionMapping`                                 | 다른 처리기 메서드가 작업 요청과 일치하지 않는 경우 기본 작업 요청을 처리합니다.             |
| `@ActionMapping(params = some.param=yourValue")` | 매개변수 설정이 `javax.portlet.action=success`인 경우 조치 요청을 처리하십시오. |
| `@ActionMapping(param = "foo")`                  | 값에 관계없이 이름이 `foo`인 매개변수가 있으면 요청을 처리합니다.                    |
| `@ActionMapping(param = "!bar")`                 | `bar`이라는 매개변수가 없는 한 요청을 처리합니다.                             |