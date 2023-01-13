# Liferay 프런트 엔드 정보 표시줄

정보 표시줄은 추가 사이드바 정보의 가시성을 전환하는 버튼을 제공합니다. 이것은 파일 크기, 유형, URL 등과 같은 검색 결과에 대한 보다 자세한 메타데이터를 제공하는 데 적합합니다.

![정보 표시줄 태그는 추가 정보를 표시하는 사이드바 패널 토글러를 생성합니다.](./liferay-frontend-info-bar-intro/images/01.png)

구성에는 정보 표시줄과 버튼, 사이드바 패널의 두 가지 주요 부분이 있습니다.

정보 표시줄:

```jsp
<liferay-frontend:info-bar>
  <liferay-frontend:info-bar-buttons>
    <liferay-frontend:info-bar-sidenav-toggler-button
      icon="info-circle"
      label="my info"
    />
  </liferay-frontend:info-bar-buttons>
</liferay-frontend:info-bar>
```

`<liferay-frontend:info-bar-sidenav-toggler-button>` 태그는 `아이콘` 속성에 대해 [Clay Icons](../clay-tag-library/clay-icons.md) 를 사용합니다.

사이드바 패널:

```jsp
<div class="closed container-fluid-1280 sidenav-container sidenav-right" id="<portlet:namespace />infoPanelId">
    <liferay-frontend:sidebar-panel>
      <div>
      <h2>sidebar content</h2>
      <p>Here is some content</p>
      </div>
    </liferay-frontend:sidebar-panel>
</div>
```

사이드바 패널의 래퍼 `<div>` 에는 클래스 `closed` 및 `sidenav-right`이 있습니다. 정보 버튼은 클래스 `열림` 및 `닫힘`을 토글하여 사이드바 패널을 표시하거나 숨깁니다. `sidenav-right` 클래스는 패널이 오른쪽에서 열리도록 지정합니다.

![정보 표시줄 태그는 추가 정보를 표시하는 사이드바 패널 토글러를 생성합니다.](./liferay-frontend-info-bar-intro/images/02.png)

위의 예에서는 사용 가능한 속성 중 일부를 사용합니다. 태그에 사용할 수 있는 속성의 전체 목록은 [정보 표시줄](https://docs.liferay.com/ce/apps/frontend-taglib/latest/taglibdocs/liferay-frontend/info-bar.html), [정보 표시줄 버튼](https://docs.liferay.com/ce/apps/frontend-taglib/latest/taglibdocs/liferay-frontend/info-bar-buttons.html), [정보 표시줄 sidenav 토글 버튼](https://docs.liferay.com/ce/apps/frontend-taglib/latest/taglibdocs/liferay-frontend/info-bar-sidenav-toggler-button.html), [사이드바 패널](https://docs.liferay.com/ce/apps/frontend-taglib/latest/taglibdocs/liferay-frontend/sidebar-panel.html)  taglibdocs를 참조하세요.

## 관련 항목

* [Liferay 프런트 엔드 추가 메뉴](./liferay-frontend-add-menu.md)
* [Liferay 프런트 엔드 카드](./liferay-frontend-cards.md)
* [Liferay 프런트 엔드 관리 바](./liferay-frontend-management-bar.md)