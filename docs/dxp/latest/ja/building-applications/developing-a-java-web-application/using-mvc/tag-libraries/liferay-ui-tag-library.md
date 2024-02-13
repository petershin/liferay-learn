---
toc:
- ./liferay-ui-tag-library/liferay-ui-icons.md
- ./liferay-ui-tag-library/liferay-ui-icon-lists.md
- ./liferay-ui-tag-library/liferay-ui-icon-menus.md
- ./liferay-ui-tag-library/liferay-ui-tabs.md
- ./liferay-ui-tag-library/liferay-ui-icon-help.md
---
# Liferay UIタグライブラリ

Liferay UIタグライブラリは、一般的に使用されるUIコンポーネントを実装するタグを提供します。 これらのタグにより、マークアップの一貫性、応答性、アクセス性が向上します。

使用可能なLiferay UI taglibのリストは、 [Liferay UI taglibdocs](https://resources.learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/liferay-ui/tld-summary.html) にあります。 各taglibには、タグに渡すことができる属性のリストがあります。 これらの一部は必須であり、一部はオプションです。 各タグの要件を確認するには、taglibdocsを参照してください。 タグによって生成された完全なマークアップは、 [Liferay Github Repo](https://github.com/liferay/liferay-portal/tree/7.2.x/portal-web/docroot/html/taglib/ui) フォルダのJSPにあります。

アプリでLiferay-UI taglibライブラリを使用するには、JSPに次の宣言を追加する必要があります。

```jsp
<%@ taglib prefix="liferay-ui" uri="http://liferay.com/tld/ui" %>
```

Liferay-UI taglibは、FreeMarkerテーマテンプレートおよびWebコンテンツテンプレートのマクロを介して使用することもできます。 次の構文に従います。

```
<@liferay_ui["tag-name"] attribute="string value" attribute=10 />
```

このセクションでは、Liferay UI taglibを使用してUIコンポーネントを作成する方法について説明します。 各記事には、結果のUIのスクリーンショットとともにコード例が含まれています。