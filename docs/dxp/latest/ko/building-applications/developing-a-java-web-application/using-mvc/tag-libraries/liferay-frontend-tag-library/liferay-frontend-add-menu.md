# Liferay 프런트 엔드 추가 메뉴

메뉴 추가 태그는 하나 이상의 항목에 대한 메뉴 추가 버튼을 만듭니다. 엔티티(예: 새 블로그 항목)를 추가하는 작업에 사용되며 관리 표시줄의 일부입니다. `<liferay-frontend:add-menu>` 태그를 사용하여 추가 메뉴를 만들고 각 항목에 대해 `<liferay-frontend:add-menu-item>` 태그를 중첩합니다.

```{note}
이 패턴은 @product-ver@부터 사용되지 않습니다. 대신 Clay Management Toolbar의 [생성 메뉴 패턴](/docs/7-2/reference/-/knowledge_base/r/clay-management-toolbar#creation-menu)을 사용하는 것을 권장합니다.
```

메뉴에 하나의 항목이 있는 경우 버튼은 블로그 관리 앱에 대한 아래 예와 같이 항목의 작업을 트리거합니다.

```jsp
<liferay-frontend:management-bar>
  <liferay-frontend:management-bar-buttons>
      ...
      <liferay-frontend:add-menu
        inline="<%= true %>"
      >
        <liferay-frontend:add-menu-item
          title='<%= LanguageUtil.get(request, "add-blog-entry") %>'
          url="<%= addEntryURL %>"
        />
      </liferay-frontend:add-menu>

  </liferay-frontend:management-bar-buttons>
</liferay-frontend:management-bar>
```

![추가 버튼 패턴은 <code>추가 메뉴</code> 태그와 하나 이상의 <code>추가 메뉴 항목</code> 태그로 구성됩니다.](./liferay-frontend-add-menu/images/01.png)

메뉴에 여러 항목이 있는 경우 팝업 메뉴에 표시됩니다. 예를 들어 Message Boards Admin 애플리케이션의 구성은 다음과 같습니다.

```jsp
<liferay-frontend:add-menu>
    ...
    <liferay-frontend:add-menu-item title='<%= LanguageUtil.get(request,
    "thread") %>' url="<%= addMessageURL.toString() %>" />
    ...
    <liferay-frontend:add-menu-item title='<%= LanguageUtil.get(request,
    (categoryId == MBCategoryConstants.DEFAULT_PARENT_CATEGORY_ID) ?
    "category[message-board]" : "subcategory[message-board]") %>'
    url="<%= addCategoryURL.toString() %>" />
    ...
</liferay-frontend:add-menu>
```

![추가 버튼 패턴은 <code>추가 메뉴</code> 태그와 하나 이상의 <code>추가 메뉴 항목</code> 태그로 구성됩니다.](./liferay-frontend-add-menu/images/02.png)

위의 예에서는 사용 가능한 속성 중 일부를 사용합니다. 태그에 사용할 수 있는 속성의 전체 목록은 [추가 메뉴](https://docs.liferay.com/ce/apps/frontend-taglib/latest/taglibdocs/liferay-frontend/add-menu.html) 및 [추가 메뉴 항목](https://docs.liferay.com/ce/apps/frontend-taglib/latest/taglibdocs/liferay-frontend/add-menu-item.html) taglibdocs를 참조하십시오.

## 관련 항목

* [Liferay 프런트엔드 카드](./liferay-frontend-cards.md)
* [Liferay 프런트엔드 정보 표시줄](./liferay-frontend-info-bar.md)
* [Liferay 프런트엔드 관리 바](./liferay-frontend-management-bar.md)