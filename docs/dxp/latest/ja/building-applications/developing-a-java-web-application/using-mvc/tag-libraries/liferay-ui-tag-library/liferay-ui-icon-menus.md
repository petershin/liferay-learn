# Liferay UIアイコンメニュー

`liferay-ui:icon-menu`タグを使用して、ポップアップナビゲーションメニューをアプリに追加できます。 アイコンメニューには、必要に応じてメニューオプションが表示され、必要ない場合は折りたたんだメニューに格納されます。 これにより、UIがすっきりと整理された状態に保たれます。 アイコンリストと同様に、各ナビゲーションアイテムの[アイコン](./liferay-ui-icons.md)をネストします。 マイサイトポートレットのサイトのアクションメニューにアイコンメニューの例があります。

![アイコンメニューの設定は簡単です。](./liferay-ui-icon-menus/images/01.png)

JSP構成の例：

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

アイコンを正しくレンダリングするには、`url`属性が必要であることに注意してください。 属性の完全なリストについては、 [Icon Menu taglibdocs](https://learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/liferay-ui/icon-menu.html) を参照してください。

## 関連トピック

* [Clayアイコン](../clay-tag-library/clay-icons.md)
* [Liferay UIアイコンリスト](./liferay-ui-icon-lists.md)
* [Liferay UIアイコン](./liferay-ui-icons.md)