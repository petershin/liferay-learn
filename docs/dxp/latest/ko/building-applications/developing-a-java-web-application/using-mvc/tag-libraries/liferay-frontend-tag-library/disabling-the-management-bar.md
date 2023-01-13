# 관리 표시줄의 전체 또는 일부 비활성화

표시할 검색 결과가 없으면 sidenav 토글 버튼을 제외한 모든 관리 표시줄의 버튼을 비활성화해야 합니다.

`disabled` 속성을 `liferay-frontend:management-bar` 태그에 추가하여 Management Bar를 비활성화할 수 있습니다.

```jsp
<liferay-frontend:management-bar
        disabled="<%= total == 0 %>"
        includeCheckBox="<%= true %>"
        searchContainerId="<%= searchContainerId %>"
>
```

해당 태그에 `disabled` 속성을 추가하여 개별 구성 요소를 비활성화할 수도 있습니다. 아래 예는 검색 컨테이너에 0개의 결과가 표시될 때 표시 버튼을 비활성화합니다. 표시 스타일을 변경해도 표시할 결과가 없을 때 아무런 효과가 없기 때문입니다.

```jsp
<liferay-frontend:management-bar-display-buttons
        disabled="<%= total == 0 %>"
        displayViews='<%= new String[] {"descriptive", "icon", "list"} %>'
        portletURL="<%= changeDisplayStyleURL %>"
        selectedDisplayStyle="<%= displayStyle %>"
/>
```

![관리 표시줄의 전체 또는 일부를 비활성화할 수 있습니다.](./disabling-the-management-bar/images/01.png)

## 관련 항목

* [관리 표시줄에 작업 포함](./including-actions-in-the-management-bar.md)
* [점토 관리 도구 모음](../clay-tag-library/clay-management-toolbar.md)