# 관리 표시줄에 작업 포함

작업 메뉴는 일반적으로 각 검색 컨테이너 결과에 포함되지만 관리 표시줄에 이러한 작업을 포함할 수도 있습니다. 이렇게 하면 모든 것이 동일한 UI 내에서 정리됩니다. 이 업데이트는 각 검색 컨테이너 결과 옆에 확인란을 추가하고 관리 표시줄 자체에 하나를 추가하여 모든 결과를 선택합니다. 확인란을 선택하면(개별 또는 모두 선택) 작업이 표시되고 그렇지 않으면 보기에서 숨겨집니다.

![개별 결과 또는 모든 결과를 한 번에 선택할 수 있습니다.](./including-actions-in-the-management-bar/images/01.png)

관리 표시줄에 작업을 포함하려면 다음 단계를 따르십시오.

1. 확인란을 포함하고 검색 컨테이너의 ID를 제공하도록 `<liferay-frontend:management-bar>` 태그를 업데이트합니다.

    ```jsp
    <liferay-frontend:management-bar
        includeCheckBox="<%= true %>"
        searchContainerId="mySearchContainerId"
    >
    ```

1. 닫는 `</liferay-frontend:management-bar-filters>` 태그 뒤에 `<liferay-frontend:management-bar-action-buttons>` 태그를 추가합니다.

    ```jsp
    <liferay-frontend:management-bar-action-buttons>

    </liferay-frontend:management-bar-action-buttons>
    ```

1. 사용 가능한 관리 표시줄 버튼 taglibs(예: `management-bar-button`)를 사용하여 앱의 관리 표시줄에 대한 작업 버튼을 빌드합니다. 사이트 관리 포틀릿의 코드 스니펫은 다음과 같습니다.

    ```jsp
    <liferay-frontend:management-bar-action-buttons>
        <liferay-frontend:management-bar-sidenav-toggler-button
            icon="info-circle"
            label="info"
        />

        <liferay-frontend:management-bar-button
            href="javascript:deleteEntries();"
            icon="trash"
            id="deleteSites"
            label="delete"
        />
    </liferay-frontend:management-bar-action-buttons>
    ```

![앱에 필요한 만큼 많은 작업을 수행할 수 있습니다.](./including-actions-in-the-management-bar/images/02.png)

## 관련 항목

* [관리 표시줄의 전체 또는 일부 비활성화](./disabling-the-management-bar.md)
* [점토 관리 도구 모음](../clay-tag-library/clay-management-toolbar.md)