# Liferay UI 탭

탭은 콘텐츠를 개별 섹션으로 구성하는 구분선을 만듭니다. 콘텐츠는 다른 JSP에서 포함되거나 포함될 수 있습니다.

앱에 탭을 추가하려면 `<liferay-ui:tabs>` 태그를 사용하고 각 탭의 이름을 `이름` 속성에 대해 쉼표로 구분된 목록으로 지정합니다. 예를 들어 `tab1`, `tab2`, `tab3`라는 세 개의 탭은 JSP에서 다음과 같이 표시됩니다.

```jsp
<liferay-ui:tabs names="tab1,tab2,tab3">

</liferay-ui:tabs>
```

각 탭에는 콘텐츠를 표시하는 해당 섹션이 필요합니다. 각 탭에 대해 `liferay-ui:section` 태그를 중첩합니다. 각 섹션 내에서 HTML 콘텐츠를 추가하거나 다른 JSP의 콘텐츠를 포함하여 간접적으로 콘텐츠를 추가할 수 있습니다( `<%@ includefile="filepath"%>` 지시문을 통해). 아래 예제 스니펫은 캘린더 포틀릿의 `configuration.jsp`에서 가져온 것입니다.

```jsp
<liferay-ui:tabs
    names='<%= "user-settings,display-settings,rss" %>'
    param="tabs2"
    refresh="<%= false %>"
    type="tabs nav-tabs-default"
>
    <liferay-ui:section>
        <%@ include file="/configuration/user_settings.jspf" %>
    </liferay-ui:section>

    <liferay-ui:section>
        <%@ include file="/configuration/display_settings.jspf" %>
    </liferay-ui:section>

    <liferay-ui:section>
        <%@ include file="/configuration/rss.jspf" %>
    </liferay-ui:section>
</liferay-ui:tabs>
```

![탭은 구성 옵션을 동일한 UI 내의 개별 섹션으로 구성하는 유용한 방법입니다.](./liferay-ui-tabs/images/01.png)

위의 예에서는 탭의 사용 가능한 속성 중 일부를 사용합니다. 속성의 전체 목록은 [Tabs taglibdocs](https://learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/liferay-ui/tabs.html) 을 참조하십시오.

## 관련 항목

* [클레이 내비게이션 바](../clay-tag-library/clay-navigation-bars.md)
* [Clay 드롭다운 메뉴 및 작업 메뉴](../clay-tag-library/clay-dropdown-and-action-menus.md)
* [Liferay UI 아이콘 도움말](./liferay-ui-icon-help.md)