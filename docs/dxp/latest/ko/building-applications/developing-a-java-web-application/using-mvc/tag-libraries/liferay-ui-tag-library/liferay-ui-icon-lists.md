# Liferay UI 아이콘 목록

아이콘 목록은 [아이콘 메뉴](https://help.liferay.com/hc/en-us/articles/360029145151-Liferay-UI-Icon-Menus)과 같은 팝업 탐색 메뉴 대신 가로 목록에 아이콘을 표시합니다. 메시지 게시판 스레드에서 아이콘 목록 메뉴의 예를 볼 수 있습니다. 스레드의 작업은 관리자에게 항상 표시됩니다.

![아이콘 목록은 항상 앱의 동작을 표시합니다.](./liferay-ui-icon-lists/images/01.png)

아래와 같이 각 목록 항목에 대해 `liferay-ui:icon-list` 태그와 중첩 [아이콘](https://help.liferay.com/hc/en-us/articles/360028832232-Liferay-UI-Icons) 을 사용하여 목록 메뉴를 만듭니다.

```jsp
<div class="thread-actions">
    <liferay-ui:icon-list>

        <liferay-ui:icon
        iconCssClass="icon-lock"
        message="permissions"
        method="get"
        url="<%= permissionsURL %>"
        useDialog="<%= true %>"
        />

        <liferay-rss:rss
        delta="<%= rssDelta %>"
        displayStyle="<%= rssDisplayStyle %>"
        feedType="<%= rssFeedType %>"
        url="<%= MBRSSUtil.getRSSURL(plid, 0, message.getThreadId(), 0, themeDisplay) %>"
        />

        <liferay-ui:icon
        iconCssClass="icon-remove-sign"
        message="unsubscribe"
        url="<%= unsubscribeURL %>"
        />

        <liferay-ui:icon
        iconCssClass="icon-lock"
        message="lock"
        url="<%= lockThreadURL %>"
        />

        <liferay-ui:icon
        iconCssClass="icon-move"
        message="move"
        url="<%= editThreadURL %>"
        />

        <liferay-ui:icon-delete
        showIcon="<%= true %>"
        trash="<%= trashHelper.isTrashEnabled(themeDisplay.getScopeGroupId()) %>"
        url="<%= deleteURL %>"
        />
    </liferay-ui:icon-list>
</div>
```

사용 가능한 속성의 전체 목록은 [Icon List taglibdocs](https://help.liferay.com/hc/en-us/articles/360029145131-Liferay-UI-Icon-Lists) 을 참조하십시오.

## 관련 항목

* [클레이 아이콘](../clay-tag-library/clay-icons.md)
* [Liferay UI 아이콘 메뉴](./liferay-ui-icon-menus.md)
* [Liferay UI 아이콘](./liferay-ui-icons.md)
