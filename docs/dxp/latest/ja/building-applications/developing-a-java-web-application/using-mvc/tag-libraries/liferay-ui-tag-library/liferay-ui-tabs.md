# Liferay UIタブ

タブは、コンテンツを個々のセクションに整理する仕切りを作成します。 コンテンツは、別のJSPから埋め込んだり含めたりすることができます。

アプリにタブを追加するには、`<liferay-ui:tabs>`タグを使用し、各タブの名前を`names`属性のコンマ区切りリストとして指定します。 たとえば、`tab1`、`tab2`、および`tab3`という名前の3つのタブは、JSPでは次のようになります。

```jsp
<liferay-ui:tabs names="tab1,tab2,tab3">

</liferay-ui:tabs>
```

各タブには、コンテンツを表示するための対応するセクションが必要です。 各タブに`liferay-ui:section`タグをネストします。 各セクション内で、HTMLコンテンツを追加したり、（ `<%@ includefile="filepath"%>`ディレクティブを介して）別のJSPからコンテンツを取り込んで間接的にコンテンツを追加したりできます。 以下のスニペットの例は、カレンダーポートレットの`configuration.jsp`からのものです。

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

![タブは、構成オプションを同じUI内の個々のセクションに整理するための便利な方法です。](./liferay-ui-tabs/images/01.png)

上記の例では、タブの使用可能な属性のいくつかを使用しています。 属性の完全なリストについては、 [Tabs taglibdocs](https://resources.learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/liferay-ui/tabs.html) を参照してください。

## 関連トピック

* [Clayナビゲーションバー](../clay-tag-library/clay-navigation-bars.md)
* [Clayドロップダウンメニューとアクションメニュー](../clay-tag-library/clay-dropdown-and-action-menus.md)
* [Liferay UIアイコンヘルプ](./liferay-ui-icon-help.md)