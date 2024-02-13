---
toc:
- ./alloy-ui-aui-tag-library/building-forms-with-aui-tags.md
---
# Alloy UI（AUI）タグライブラリ

AUIタグライブラリは、一般的に使用されるUIコンポーネントを実装するタグを提供します。  これらのタグにより、マークアップの一貫性、応答性、アクセス性が向上します。

使用可能な`<aui>` taglibのリストは、 [AUI taglibdocs](https://resources.learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/aui/tld-summary.html) にあります。  各taglibには、タグに渡すことができる属性のリストがあります。 これらの一部は必須であり、一部はオプションです。 各タグの要件を確認するには、taglibdocsを参照してください。 タグによって生成された完全なマークアップは、 [Liferay Github Repo](https://github.com/liferay/liferay-portal/tree/7.2.x/portal-web/docroot/html/taglib/aui) フォルダのJSPにあります。

アプリでAUI taglibライブラリを使用するには、JSPに次の宣言を追加する必要があります。

```jsp
<%@ taglib prefix="aui" uri="http://liferay.com/tld/aui" %>
```

AUI taglibは、FreeMarkerテーマテンプレートおよびWebコンテンツテンプレートのマクロを介して使用することもできます。 次の構文に従います。

```
<@liferay_aui["tag-name"] attribute="string value" attribute=10 />
```

このセクションでは、AUI taglibを使用してUIコンポーネントを作成する方法について説明します。 各記事には、結果のUIのスクリーンショットとともにコード例が含まれています。