# Liferay UIアイコン

Liferay UI taglibは、アプリに含めることができるいくつかのアイコンを提供します。 アプリにアイコンを追加するには、`liferay-ui:icon`タグを使用し、`icon`、`iconCssClass`、または`image`属性のいずれかでアイコンを指定します。 各ユースケースの例を以下に示します。

`image`属性は、使用する [Liferay UIアイコン](https://github.com/liferay/liferay-portal/tree/7.2.x/modules/apps/frontend-theme/frontend-theme-unstyled/src/main/resources/META-INF/resources/_unstyled/images) を指定します（スタイルなしテーマの`images/common`フォルダで定義されています）。 JSPの構成例を次に示します。

```jsp
<div class="col-md-3">
    <liferay-ui:icon image="subscribe" />

    <span class="ml-2">Subscribe</span>
</div>
```

![image属性を使用して、テーマアイコンを使用します。](./liferay-ui-icons/images/01.png)

Liferay UI taglibは、言語フラグアイコンも公開します。 言語フラグアイコンを使用するには、アイコン名の前に`../language/`相対パスを指定します。  以下は、ローカライズされたメッセージとともに現在の言語のフラグを表示するWebコンテンツ検索ポートレットのスニペットの例です。

```jsp
<liferay-ui:icon
    image='<%= "../language/" + languageId %>'
    message='<%= LanguageUtil.format(
        request,
        "this-result-comes-from-the-x-version-of-this-content",
        snippetLocale.getDisplayLanguage(locale),
        false
    ) %>'
/>
```

使用可能な [`init.ftl` 変数](https://github.com/liferay/liferay-portal/blob/7.2.x/modules/appsfrontend-theme/frontend-theme-unstyled/src/main/resources/META-INF/resources/_unstyled/templates/init.ftl) と [Liferay DXPマクロ](https://help.liferay.com/hc/ja/articles/360029145851-FreeMarker-Taglib-Macros) を使用する次のコードで、FreeMarkerで同じ結果を得ることができます。

```
<#assign flag_message>
    <@liferay.language_format 
        arguments=language 
        key="this-result-comes-from-the-x-version-of-this-content" 
    />
</#assign>

<@liferay_ui["icon"]
    image="../language/${language_id}"
    message=flag_message
/>
```

使用可能なアイコンの完全なリストを次の図に示します。

![Liferay UI taglibは、アプリで使用するための複数のアイコンを提供します。](./liferay-ui-icons/images/02.png)

![Liferay UIアイコンは、言語に基づいて構成できます。](./liferay-ui-icons/images/03.png)

`icon`属性は、使用する [Font Awesomeアイコン](https://fontawesome.com/v3.2.1/icons/) を指定します。

```jsp
<liferay-ui:icon icon="angle-down" />
```

![icon属性を使用して、アプリにFont Awesomeアイコンを含めることができます。](./liferay-ui-icons/images/04.png)

`iconCssClass`属性は、使用する [glyphicon](http://marcoceppi.github.io/bootstrap-glyphicons/) を指定します。

```jsp
<liferay-ui:icon
    iconCssClass="icon-remove-sign"
    label="<%= true %>"
    message="unsubscribe"
    url="<%= unsubscribeURL %>"
/>
```

![アプリでFont Awesomeアイコンを使用できます。](./liferay-ui-icons/images/05.png)

上記の例では、アイコンの使用可能な属性のいくつかを使用しています。 完全なリストについては、 [Icon taglibdocs](https://learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/liferay-ui/icon.html) を参照してください。

## 関連トピック

* [Clayアイコン](../clay-tag-library/clay-icons.md)
* [Liferay UIアイコンリスト](./liferay-ui-icon-lists.md)
* [Liferay UIアイコンメニュー](./liferay-ui-icon-menus.md)