---
toc:
- ./liferay-util-tag-library/liferay-util-body-bottom.md
- ./liferay-util-tag-library/liferay-util-body-top.md
- ./liferay-util-tag-library/liferay-util-buffer.md
- ./liferay-util-tag-library/liferay-util-dynamic-include.md
- ./liferay-util-tag-library/liferay-util-get-url.md
- ./liferay-util-tag-library/liferay-util-html-bottom.md
- ./liferay-util-tag-library/liferay-util-html-top.md
- ./liferay-util-tag-library/liferay-util-include.md
- ./liferay-util-tag-library/liferay-util-param.md
- ./liferay-util-tag-library/liferay-util-whitespace-remover.md
---
# Liferay Utilタグライブラリ

Liferay Util taglibは、他のリソースをポートレットまたはテーマにプルするために使用されます。 これを使用して、ページのHTMLの下部または上部に挿入するリソースを指定できます。

Liferay-Util taglibを使用するには、JSPに次の宣言を追加します。

```jsp
<%@ taglib prefix="liferay-util" uri="http://liferay.com/tld/util" %>
```

Liferay-Util taglibは、FreeMarkerテーマテンプレートおよびWebコンテンツテンプレートのマクロを介して使用することもできます。 次の構文に従います。

```
<@liferay_util["tag-name"] attribute="string value" attribute=10 />
```

このセクションでは、アプリでコンテンツをポートレットやテーマに挿入するために使用できるLiferay Utilタグについて説明します。