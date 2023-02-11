# JSP용 Liferay 포틀릿 개체

JSP에서 `<liferay-portlet:defineObjects>` 태그를 발견했을 수 있습니다.  [theme:defineObjects](./liferay-theme-objects-for-jsps.md)  태그와 마찬가지로 JSP에 이 태그를 포함하면 포틀릿에 대한 유용한 정보를 반환하는 여러 변수에 액세스할 수 있습니다. JSR-286 사양은 포틀릿에 대한 네 가지 수명 주기 메서드(processAction, processEvent, render 및 serveResource)를 정의합니다. `<portlet:defineObjects/>` 태그로 정의된 일부 변수는 JSP가 포틀릿 라이프사이클의 적절한 단계 중에 포함된 경우에만 JSP에서 사용할 수 있습니다. 이러한 개체는 아래 표에 설명되어 있습니다.

| 개체 | 설명 |
| :--- | :--- |
| `액션요청 actionRequest` | 조치를 처리하기 위해 포틀릿으로 보낸 요청을 나타냅니다. 액션 처리 단계에서 JSP가 포함된 경우 'actionRequest'는 JSP에서만 사용할 수 있습니다. |
| `액션응답 actionResponse` | 작업 요청에 대한 포틀릿 응답을 나타냅니다. 'actionResponse'는 JSP가 작업 처리 단계에 포함된 경우에만 JSP에서 사용할 수 있습니다. |
| `이벤트요청 이벤트요청` | 이벤트를 처리하기 위해 포틀릿에 보낸 요청을 나타냅니다. 이벤트 처리 단계에서 JSP가 포함된 경우 'eventRequest'는 JSP에서만 사용할 수 있습니다. |
| `이벤트응답 이벤트응답` | 이벤트 요청에 대한 포틀릿 응답을 나타냅니다. 'eventResponse'는 JSP가 이벤트 처리 단계에 포함된 경우에만 JSP에서 사용할 수 있습니다. |
| `HeaderRequest headerRequest` | HTML 헤더 또는 HEAD 섹션을 처리하기 위해 포틀릿에 보낸 요청을 나타냅니다. 헤더 처리 단계에서 JSP가 포함된 경우 'headerRequest'는 JSP에서만 사용할 수 있습니다. |
| `헤더응답 headerResponse` | 헤더 요청에 대한 포틀릿 응답을 나타냅니다. 'headerResponse'는 JSP가 헤더 처리 단계에 포함된 경우에만 JSP에서 사용할 수 있습니다. |
| [`LiferayPortletRequest liferayPortletRequest`](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/portlet/LiferayPortletRequest.html) | `HttpServletRequest`, `Portlet`, 포틀릿 이름 및 라이프사이클 값에 대한 액세스를 제공합니다. 'liferayPortletRequest'는 모든 포틀릿 단계에서 사용할 수 있습니다. |
| [`LiferayPortletResponse liferayPortletResponse`](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/portlet/LiferayPortletResponse.html) | 포털에 반환된 속성을 포함하고 속성을 추가하거나 변경할 수 있는 수단을 제공합니다. 'liferayPortletResponse'는 모든 포틀릿 단계에서 사용할 수 있습니다. |
| `렌더리퀘스트 렌더리퀘스트` | 포틀릿을 렌더링하기 위해 포틀릿에 보낸 요청을 나타냅니다. 렌더링 요청 단계에서 JSP가 포함된 경우 'renderRequest'는 JSP에서만 사용할 수 있습니다. |
| `RenderResponse renderResponse` | 포털에 응답을 보낼 때 포틀릿을 지원하는 개체를 나타냅니다. 렌더링 요청 단계에서 JSP가 포함된 경우 'renderResponse'는 JSP에서만 사용할 수 있습니다. |
| `리소스요청 리소스요청` | 리소스 렌더링을 위해 포틀릿으로 전송된 요청을 나타냅니다. 리소스 제공 단계에서 JSP가 포함된 경우 'resourceRequest'는 JSP에서만 사용할 수 있습니다. |
| `리소스응답 리소스응답` | 리소스 렌더링에서 포틀릿을 지원하는 개체를 나타냅니다. 'resourceResponse'는 JSP가 리소스 제공 단계에 포함된 경우에만 JSP에서 사용할 수 있습니다. |
| `포틀릿 구성 포틀릿 구성` | 포틀릿의 이름, 초기화 매개변수, 리소스 번들 및 애플리케이션 컨텍스트를 포함하여 포틀릿의 구성을 나타냅니다. 'portletConfig'는 포함된 요청 처리 단계에 관계없이 항상 포틀릿 JSP에서 사용할 수 있습니다. |
| `PortletPreferences portletPreferences` | 포틀릿의 기본 설정에 대한 액세스를 제공합니다. 'portletPreferences'는 포함된 요청 처리 단계에 관계없이 항상 포틀릿 JSP에서 사용할 수 있습니다. |
| `Map<String, String[]> portletPreferencesValues` | `portletPreferences.getMap()` 호출에 해당하는 Map 또는 포틀릿 환경 설정이 없는 경우 비어 있는 Map을 제공합니다. |
| `PortletSession portletSession` | 둘 이상의 요청에서 사용자를 식별하고 사용자에 대한 임시 정보를 저장하는 방법을 제공합니다. 각 사용자 클라이언트에 대해 `portletSession`이 생성됩니다. 'portletSession'은 포함된 요청 처리 단계에 관계없이 항상 포틀릿 JSP에서 사용할 수 있습니다. 세션이 없으면 `portletSession`은 `null`입니다. |
| `Map<String, Object> portletSessionScope` | `PortletSession.getAtrributeMap()` 호출에 해당하는 맵 또는 세션 속성이 없는 경우 비어 있는 맵을 제공합니다. |

자세한 내용은 [Portlet 3.0 API Javadoc](https://learn.liferay.com/reference/latest/en/portlet-api/index.html)을 참조하십시오.