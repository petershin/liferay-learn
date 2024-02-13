---
toc:
- ./liferay-frontend-tag-library/liferay-frontend-add-menu.md
- ./liferay-frontend-tag-library/liferay-frontend-cards.md
- ./liferay-frontend-tag-library/liferay-frontend-info-bar.md
- ./liferay-frontend-tag-library/liferay-frontend-management-bar.md
- ./liferay-frontend-tag-library/including-actions-in-the-management-bar.md
- ./liferay-frontend-tag-library/disabling-the-management-bar.md
---
# Liferayフロントエンドタグライブラリ

Liferayフロントエンドタグライブラリは、アプリで一般的なフロントエンドUIコンポーネントを作成するためのタグのセットを提供します。

アプリでフロントエンドtaglibを使用するには、JSPに次の宣言を追加します。

```jsp
<%@ taglib prefix="liferay-frontend" uri="http://liferay.com/tld/frontend" %>
```

Liferayフロントエンドtaglibは、FreeMarkerテーマテンプレートおよびWebコンテンツテンプレートのマクロを介して使用することもできます。 次の構文に従います。

```
<@liferay_frontend["tag-name"] attribute="string value" attribute=10 />
```

このセクションでは、次のフロントエンドUIコンポーネントについて説明します。

* [メニューを追加](./liferay-frontend-tag-library/liferay-frontend-add-menu.md)
* [カード](./liferay-frontend-tag-library/liferay-frontend-cards.md)
* [情報バー](./liferay-frontend-tag-library/liferay-frontend-info-bar.md)
* [管理バー](./liferay-frontend-tag-library/liferay-frontend-management-bar.md)

各記事には、結果のUIのスクリーンショットとともに一連の例が含まれています。 