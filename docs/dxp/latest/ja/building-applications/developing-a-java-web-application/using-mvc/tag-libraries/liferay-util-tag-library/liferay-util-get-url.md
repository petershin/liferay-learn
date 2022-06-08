# Liferay Util Get URLの使用

get URLタグは、`url`属性によって提供されるURLを取得します。 `var`属性に値が指定されている場合、画面スクレイプのコンテンツはその変数にスコープされます。 それ以外の場合は、taglibが使用されている場所に取得されたコンテンツが表示されます。

`<liferay-util:get-url>`タグの基本構成を以下に示します。

```jsp
<liferay-util:get-url url="https://www.liferay.com/" />
```

`var`属性を使用する例を次に示します。

```jsp
<liferay-util:get-url url="https://www.liferay.com/" var="Liferay" />

<div>
                <h2>We borrowed <a href="https://www.liferay.com/">Liferay</a>. Here it is.</h2>

                <div class="Liferay">
                                <%= Liferay %>
                </div>
</div>
```

![Liferay Util Get URLタグを使用して、URLを取得できます。](./liferay-util-get-url/images/01.png)

これで、`<liferay-util:get-url>`タグを使用してURLを取得する方法がわかりました。

## 関連トピック

* [Using the Liferay Util Param Tag](./liferay-util-param.md)
* [Using the Liferay Util Include Tag](https://help.liferay.com/hc/ja/articles/360029145351-Using-Liferay-Util-Include)
* [Using the AUI Taglib](https://help.liferay.com/hc/ja/articles/360028832812-Using-AUI-Taglibs)