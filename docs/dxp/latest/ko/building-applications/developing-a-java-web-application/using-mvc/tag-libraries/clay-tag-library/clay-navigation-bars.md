# 클레이 내비게이션 바

드롭다운 메뉴와 마찬가지로 내비게이션 바에는 내비게이션 항목 목록이 표시됩니다. 주요 차이점은 탐색 모음이 모든 탐색 항목이 항상 표시되는 가로 막대에 표시된다는 것입니다. 탐색 모음은 또한 밑줄로 활성 탐색 항목을 나타냅니다. 내비게이션 바는 짙은 회색 텍스트가 있는 흰색 배경(기본값)과 흰색 텍스트가 있는 짙은 회색 배경(반전)의 두 가지 스타일로 제공됩니다.

기본 탐색 모음:

```jsp
<clay:navigation-bar 
    navigationItems="<%= navigationBarsDisplayContext.getNavigationItems() %>" 
/>
```

![앱에 탐색 모음을 포함할 수 있습니다.](./clay-navigation-bars/images/01.png)

반전된 내비게이션 바( `반전` 속성을 `참`으로 설정):

```jsp
<clay:navigation-bar 
    inverted="<%= true %>" 
    navigationItems="<%= navigationBarsDisplayContext.getNavigationItems() %>" 
/>
```

![원하는 경우 내비게이션 바를 반전시킬 수 있습니다.](./clay-navigation-bars/images/02.png)

## 관련 항목

* [Clay 드롭다운 메뉴 및 작업 메뉴](./clay-dropdown-and-action-menus.md)
* [점토 양식 요소](./clay-form-elements.md)
* [클레이 진행률 표시줄](./clay-progress-bars.md)