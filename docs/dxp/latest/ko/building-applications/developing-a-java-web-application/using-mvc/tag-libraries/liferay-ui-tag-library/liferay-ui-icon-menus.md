# Liferay UI 아이콘 메뉴

`liferay-ui:icon-menu` 태그를 사용하여 앱에 팝업 탐색 메뉴를 추가할 수 있습니다. 아이콘 메뉴는 필요할 때 메뉴 옵션을 표시하고 그렇지 않을 때는 접힌 메뉴에 보관합니다. 이렇게 하면 UI가 깨끗하고 깔끔하게 유지됩니다. 아이콘 목록과 마찬가지로 각 탐색 항목에 대해 [개 아이콘](./liferay-ui-icons.md) 를 중첩합니다. 내 사이트 포틀릿의 사이트 작업 메뉴에서 아이콘 메뉴의 예를 볼 수 있습니다.

![아이콘 메뉴 설정은 식은 죽 먹기입니다.](./liferay-ui-icon-menus/images/01.png)

JSP 구성 예:

```jsp
<liferay-ui:icon-menu
    direction="left-side"
    icon="<%= StringPool.BLANK %>"
    markupView="lexicon"
    message="<%= StringPool.BLANK %>"
    showWhenSingleIcon="<%= true %>"
>

                <liferay-ui:icon
                    message="go-to-public-pages"
                    target="_blank"
                    url="<%= group.getDisplayURL(themeDisplay, false) %>"
                />

                <liferay-ui:icon
                    message="leave"
                    url="<%= leaveURL %>"
                />

</liferay-ui:icon-menu>
```

아이콘이 제대로 렌더링되려면 `url` 속성이 필요합니다. 속성의 전체 목록은 [아이콘 메뉴 taglibdocs](https://learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/liferay-ui/icon-menu.html) 을 참조하십시오.

## 관련 항목

* [클레이 아이콘](../clay-tag-library/clay-icons.md)
* [Liferay UI 아이콘 목록](./liferay-ui-icon-lists.md)
* [Liferay UI 아이콘](./liferay-ui-icons.md)