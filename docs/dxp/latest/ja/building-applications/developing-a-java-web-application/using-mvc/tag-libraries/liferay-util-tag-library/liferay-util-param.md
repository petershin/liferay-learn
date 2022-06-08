# Liferay Util Paramの使用

paramタグを使用すると、[含まれているJSPページ](./liferay-util-include.md)にパラメータを設定できます 。  この構成には2つのJSPが必要です。 アプリのメインビューであるJSP Aには、JSP Bが含まれており、そのパラメーター値が設定されます。 これにより、JSPを含めるときにコンテンツを動的に設定できます。

たとえば、`my-app.jsp`にメインの機能があり、`more-content.jsp`によって追加の機能が提供されるとします。  以下に示す構成例が考えられます。

`more-content.jsp`:

```jsp
<%@ page import="com.liferay.portal.kernel.util.ParamUtil" %>

<%
String answer = ParamUtil.getString(request, "answer");
%>

<div>
  <p>The answer to life, the universe and everything is <%= answer %>.</p>
</div>
```

次に、`my-app.jsp`で、`more-content.jsp`を含め、`answer`パラメーターの値を設定します。

```jsp
<liferay-util:include page="/path/to/more-content.jsp" servletContext="<%= application %>">
  <liferay-util:param name="answer" value="42" />
</liferay-util:include>
```

これにより、`my-app.jsp`で次の出力が得られます。

```html
The answer to life, the universe and everything is 42.
```

これで、`<liferay-util:param>`タグを使用して、含まれているJSPにパラメーターを設定する方法がわかりました。 このアプローチを使用して、一般的な再利用可能なコードのピースをアプリに含めることができます。

## 関連トピック

* [Using the Liferay Util Include Tag](./liferay-util-include.md)
* [Using the Liferay Util Body Top Tag](./liferay-util-body-top.md)
* [Using the Chart Taglib](../clay-tag-library.md)