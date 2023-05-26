# CDI 포틀릿 미리 정의된 Bean

Liferay DXP는 [JSR 362](https://jcp.org/en/jsr/detail?id=362) 에 지정된 대로 Portlet Predefined Beans라는 CDI용 삽입 가능한 포틀릿 아티팩트를 제공합니다.  사전 정의된 Bean에는 두 가지 유형이 있습니다.

* 포틀릿 요청 범위 Bean( [`@PortletRequestScoped`](https://learn.liferay.com/reference/latest/en/portlet-api/javax/portlet/annotations/PortletRequestScoped.html)

* 종속 범위 콩( [`@Dependent` 범위](https://docs.oracle.com/javaee/7/api/javax/enterprise/context/Dependent.html) )

아래 표는 각 빈에 대한 이러한 속성을 설명합니다.

**Artifact:** 콩의 유형.

**Bean EL Name: JSP 또는 JSF 페이지에서 Bean에 액세스하기 위한** EL(Expression Language) 이름입니다.

**Qualifier:** Bean 구현을 정의하고 선택하기 위해 Bean에 적용되는 주석.

(**단계) 동안 유효:** Bean이 유효한  [포틀릿 단계](../../reference/portlets.md).

## 포틀릿 요청 범위 Bean

이 빈에는 `@PortletRequestScoped` 주석이 있습니다. 다음은 유효한 포틀릿 단계와 함께 아티팩트 유형, bean EL 이름 및 주석 규정자입니다.

표 1: 포틀릿 요청 범위 Bean[^1]

| 인공물                           | 콩 EL 이름               | 예선 | 유효 기간        |
|:----------------------------- |:--------------------- |:-- |:------------ |
| `PortletConfig`               | `portletConfig`       | -  | 모두           |
| `PortletRequest`              | `portletRequest`      | -  | 모두           |
| `PortletResponse`             | `portletResponse`     | -  | 모두           |
| `ActionRequest`               | `actionRequest`       | -  | 액션           |
| `ActionResponse`              | `actionResponse`      | -  | 액션           |
| `HeaderRequest`               | `headerRequest`       | -  | 우두머리         |
| `HeaderResponse`              | `headerResponse`      | -  | 우두머리         |
| `RenderRequest`               | `renderRequest`       | -  | 렌더링          |
| `RenderResponse`              | `renderResponse`      | -  | 렌더링          |
| `EventRequest`                | `eventRequest`        | -  | 사건           |
| `EventResponse`               | `eventResponse`       | -  | 사건           |
| `ResourceRequest`             | `resourceRequest`     | -  | 자원           |
| `ResourceResponse`            | `resourceResponse`    | -  | 자원           |
| `StateAwareResponse`          | `stateAwareResponse`  | -  | 행동, 사건       |
| `MimeResponse`                | `mimeResponse`        | -  | 헤더, 렌더링, 리소스 |
| `ClientDataRequest`           | `clientDataRequest`   | -  | 작업, 자원       |
| `RenderParameters`            | `renderParams`        | -  | 모두           |
| `MutableRenderParameters`     | `mutableRenderParams` | -  | 행동, 사건       |
| `ActionParameters`            | `actionParams`        | -  | 액션           |
| `ResourceParameters`          | `resourceParams`      | -  | 자원           |
| `PortletContext`              | `portletContext`      | -  | 모두           |
| `PortletMode`                 | `portletMode`         | -  | 모두           |
| `WindowState`                 | `windowState`         | -  | 모두           |
| `PortletPreferences`          | `portletPreferences`  | -  | 모두           |
| `Cookies(List<Cookie>)` | `cookies`             | -  | 모두           |
| `PortletSession`              | `portletSession`      | -  | 모두           |
| `Locales(List<Locale>)` | `locales`             | -  | 모두           |

## 종속 범위 지정 Bean

이러한 빈은 `@Dependent` 범위를 사용합니다. 유형은 `java.lang.String`이며 `final`입니다. 이로 인해 대리 자격이 박탈됩니다. 원래 범위보다 더 넓은 범위에서 종속 범위 Bean을 사용하지 않으려면 `@PortletRequestScoped` Bean에만 주입해야 합니다.

표 2: 종속 범위 지정 Bean[^2]

| 인공물             | 콩 EL 이름       | 예선             | 유효 기간 |
|:--------------- |:------------- |:-------------- |:----- |
| `네임스페이스` (문자열)  | `namespace`   | `@Namespace`   | 모두    |
| `컨텍스트 경로` (문자열) | `contextPath` | `@ContextPath` | 모두    |
| `창 ID` (문자열)    | `windowId`    | `@WindowId`    | 모두    |
| `포틀릿 이름` (문자열)  | `portletName` | `@PortletName` | 모두    |

## 관련 주제

[CDI 종속성 주입](../../../core-frameworks/dependency-injection.md)

[^1]: Martin Scott Nicklous, Java&trade; 포틀릿 사양 3.0, 122페이지.

[^2]: Martin Scott Nicklous, Java&trade; 포틀릿 사양 3.0, 123페이지.