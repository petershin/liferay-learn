# Liferay Util Dynamic Includeの使用

dynamic includeタグを使用すると、開発者が`DynamicIncludeRegistry`を使用して追加のHTML、リソース、または機能を挿入できるJSPまたはテーマ内のポイント（複数可）を指定できます。 OSGiサービスレジストリの詳細については、 [こちら](http://docs.spring.io/osgi/docs/current/reference/html/service-registry.html) をご覧ください。 `key`属性は、拡張ポイントを識別します。 Dynamic Include拡張ポイントを使用して追加機能を挿入する構成例については、 [Dynamic Include](https://help.liferay.com/hc/ja/articles/360018165711-Dynamic-Includes) を参照してください。

以下の構成例では、`<liferay-util:dynamic-include>`タグを使用して、プライマリコードの前と後にそれぞれ拡張ポイントを含めています。

```jsp
<%@ taglib uri="http://liferay.com/tld/util" prefix="liferay-util" %>

<liferay-util:dynamic-include key="/path/to/jsp#pre" />

<div>
        <p>And here we have our content</p>
</div>

<liferay-util:dynamic-include key="/path/to/jsp#post" />
```

これで、`<liferay-util:dynamic-include>`タグを使用してアプリに拡張ポイントを追加する方法がわかりました。

## 関連トピック

* [Dynamic Includes](https://help.liferay.com/hc/ja/articles/360018165711-Dynamic-Includes)
* [Using the Liferay Util Body Top Tag](./liferay-util-body-top.md)
* [Using the Chart Taglib](https://help.liferay.com/hc/ja/articles/360028832592-Using-the-Chart-Taglib-in-Your-Portlets)