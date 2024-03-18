# Liferay 프런트 엔드 관리 바

관리 표시줄을 통해 관리자는 검색 컨테이너 결과를 제어할 수 있습니다. 검색 결과에 대한 표시 스타일을 필터링, 정렬 및 선택할 수 있으므로 문서, 웹 콘텐츠, 자산 항목 또는 앱에서 찾고 있는 모든 항목을 빠르게 식별할 수 있습니다. 관리 표시줄은 완전히 사용자 정의할 수 있으므로 모든 컨트롤을 구현하거나 앱에 필요한 컨트롤만 구현할 수 있습니다.

![관리 표시줄을 통해 사용자는 앱이 콘텐츠를 표시하는 방식을 사용자 지정할 수 있습니다.](./liferay-frontend-management-bar/images/01.png)

```{note}
Liferay Frontend Management Bar는 @product-ver@부터 더 이상 사용되지 않습니다. 대신 [Clay 관리 도구 모음](../clay-tag-library/clay-management-toolbar.md)을 사용하는 것이 좋습니다.
```

관리 표시줄에는 몇 가지 주요 섹션이 있습니다. 각 섹션은 서로 다른 taglibs를 사용하여 그룹화되고 구성됩니다.

[`<liferay-frontend:management-bar-buttons>` 태그](https://docs.liferay.com/ce/apps/frontend-taglib/latest/taglibdocs/liferay-frontend/management-bar-buttons.html) 는 관리 표시줄의 버튼 요소를 래핑합니다.

![`management-bar-buttons` 태그에는 관리 표시줄의 기본 버튼이 포함되어 있습니다.](./liferay-frontend-management-bar/images/02.png)

[`<liferay-frontend:management-bar-sidenav-toggler-button>` 태그](https://docs.liferay.com/ce/apps/frontend-taglib/latest/taglibdocs/liferay-frontend/management-bar-sidenav-toggler-button.html)  는 정보 버튼에 대한 슬라이드 아웃 탐색을 구현합니다.

[`<liferay-frontend:management-bar-display-buttons>` 태그](https://docs.liferay.com/ce/apps/frontend-taglib/latest/taglibdocs/liferay-frontend/management-bar-display-buttons.html) 는 앱의 디스플레이 스타일 옵션을 렌더링합니다.

![`management-bar-display-buttons` 태그에는 콘텐츠의 표시 옵션이 포함되어 있습니다.](./liferay-frontend-management-bar/images/03.png)

[`<liferay-frontend:management-bar-filters>` 태그](https://docs.liferay.com/ce/apps/frontend-taglib/latest/taglibdocs/liferay-frontend/management-bar-filters.html) 는 앱의 필터링 옵션을 래핑합니다. 이 필터는 모든 제어판 응용 프로그램에 포함되어야 합니다. 필터링 옵션에는 정렬 기준, 정렬 순서 등이 포함될 수 있습니다.

![`management-bar-filters` 태그에는 콘텐츠 필터링 옵션이 포함되어 있습니다.](./liferay-frontend-management-bar/images/04.png)

마지막으로 [`<liferay-frontend:management-bar-action-buttons>` 태그](https://docs.liferay.com/ce/apps/frontend-taglib/latest/taglibdocs/liferay-frontend/management-bar-action-buttons.html) 는 선택한 항목에 대해 실행할 수 있는 작업을 래핑합니다. 페이지 사이에서 여러 항목을 선택할 수 있습니다. 관리 표시줄은 선택한 항목의 수를 추적합니다.

![관리 표시줄은 선택한 항목을 추적하고 해당 항목에 대해 실행할 작업을 표시합니다.](./liferay-frontend-management-bar/images/05.png)

예를 들어 휴지통 앱의 관리 표시줄 구성은 다음과 같습니다.

```jsp
<liferay-frontend:management-bar
   includeCheckBox="<%= true %>"
   searchContainerId="trash"
>
   <liferay-frontend:management-bar-buttons>
       <liferay-frontend:management-bar-sidenav-toggler-button />

       <liferay-portlet:actionURL name="changeDisplayStyle"
       varImpl="changeDisplayStyleURL">
           <portlet:param name="redirect" value="<%= currentURL %>" />
       </liferay-portlet:actionURL>

       <liferay-frontend:management-bar-display-buttons
           displayViews='<%= new String[] {"descriptive", "icon",
           "list"} %>'
           portletURL="<%= changeDisplayStyleURL %>"
           selectedDisplayStyle="<%= trashDisplayContext.getDisplayStyle()
           %>"
       />
   </liferay-frontend:management-bar-buttons>

   <liferay-frontend:management-bar-filters>
       <liferay-frontend:management-bar-navigation
           navigationKeys='<%= new String[] {"all"} %>'
           portletURL="<%= trashDisplayContext.getPortletURL() %>"
       />

       <liferay-frontend:management-bar-sort
           orderByCol="<%= trashDisplayContext.getOrderByCol() %>"
           orderByType="<%= trashDisplayContext.getOrderByType() %>"
           orderColumns='<%= new String[] {"removed-date"} %>'
           portletURL="<%= trashDisplayContext.getPortletURL() %>"
       />
   </liferay-frontend:management-bar-filters>

   <liferay-frontend:management-bar-action-buttons>
       <liferay-frontend:management-bar-sidenav-toggler-button />

       <liferay-frontend:management-bar-button href="javascript:;"
       icon="trash" id="deleteSelectedEntries" label="delete" />
   </liferay-frontend:management-bar-action-buttons>
</liferay-frontend:management-bar>
```