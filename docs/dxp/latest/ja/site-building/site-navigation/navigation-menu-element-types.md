# ナビゲーション・メニュー要素の種類

ナビゲーション・メニューには様々なエレメント・タイプがあり、お好みの階層に追加して配置することができます。 これらのタイプには、 [特定のページ](#pages) 、 [語彙](#vocabularies) 、特定のコンテンツ・タイプの表示ページ、またはカスタム [プレースホルダ](#submenus) または [URL](#urls) が含まれます。 これらのエレメントを使ったナビゲーション・メニューの追加については、 [ここ](./using-the-navigation-menus-application.md) を参照してください。

## ページ

特定のページは、ナビゲーション・メニューに使用される最も一般的な要素です。 サイトのページセットから任意の公開ページをメニューに追加することができます。

## サブメニュー

サブメニューは、ナビゲーションメニューに追加できるプレースホルダー要素で、特定のページやコンテンツを必要とせずに、追加のメニュー要素をその下にグループ化することができます。 ページで使用される場合、サブメニュー要素はクリック可能なリンクを持ちませんが、ユーザーがその上にマウスを置くと、子要素が表示されるように展開されます。

![Submenu elements in the Navigation Menu are not clickable, but their contained child elements are.](./navigation-menu-element-types/images/01.png)

ナビゲーションメニューのデフォルトのアプリケーション表示テンプレートを使用すると、サブメニューの下に他のエレメントが編成されていない場合、そのサブメニューはユーザーのナビゲーションメニューに表示されません。

## ブログエントリー

[ブログ・エントリー](../../content-authoring-and-management/blogs/adding-blog-entries.md) を、そのエントリーの [表示ページ](../displaying-content/using-display-page-templates/publishing-content-with-display-pages.md) にリンクする独立したメニュー要素として追加することができます。 ナビゲーションメニュー用のデフォルトのアプリケーション表示テンプレートを使用すると、表示ページのないブログエントリーが追加された場合、リンクがないため、メニュー上のユーザーから隠されます。 異なるアプリケーション表示テンプレートを使用すると、この動作が変わる可能性があります。

## Webコンテンツの記事

[ウェブコンテンツの記事](../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md) を、記事の [表示ページ](../displaying-content/using-display-page-templates/publishing-content-with-display-pages.md) にリンクする独立したメニュー要素として追加することができます。 ナビゲーションメニュー用のデフォルトのアプリケーション表示テンプレートを使用すると、表示ページのないウェブコンテンツ記事が追加された場合、リンクがないため、メニュー上のユーザーから隠されます。 異なるアプリケーション表示テンプレートを使用すると、この動作が変わる可能性があります。

## ドキュメントとメディア

[文書](../../content-authoring-and-management/documents-and-media.md) を独立したメニュー要素として追加し、その文書の [表示ページ](../displaying-content/using-display-page-templates/publishing-content-with-display-pages.md) にリンクさせることができます。 ナビゲーションメニュー用のデフォルトのアプリケーション表示テンプレートを使用すると、表示ページのないドキュメントが追加された場合、そのドキュメントにはリンクがないため、メニュー上のユーザーからは非表示になります。 異なるアプリケーション表示テンプレートを使用すると、この動作が変わる可能性があります。

## カテゴリー

[カテゴリ](../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md#defining-categories) を、カテゴリの [表示ページ](../displaying-content/using-display-page-templates/publishing-content-with-display-pages.md) にリンクするメニュー要素として追加できます。 ナビゲーションメニュー用のデフォルトのアプリケーション表示テンプレートを使用すると、表示ページのないカテゴリーが追加された場合、そのカテゴリーにはリンクがないため、メニュー上のユーザーからは非表示になります。 異なるアプリケーション表示テンプレートを使用すると、この動作が変わる可能性があります。

Liferay 7.4のバージョンU9+とGA13+から、複数のカテゴリーを一度に選択できるようになりました。 カテゴリーとその下のサブカテゴリーを一緒に追加すると、ナビゲーションメニューに正しい階層で配置されます。

```{note}
ナビゲーションメニューの要素として追加されたカテゴリーにサブカテゴリーが含まれている場合、サブカテゴリーの変更はナビゲーションメニューの階層には自動的に反映されません。 サブカテゴリの変更をナビゲーションメニューに自動的に反映させたい場合は、代わりに動的な [Vocabulary](#vocabularies) 要素を使用できます。
```

## ボキャブラリ

{bdg-secondary}`liferay Portal 7.4 GA26+、DXP 7.4 U26+`。

[Vocabularies](../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md#defining-vocabularies) 全体をメニュー要素として追加することができます。 ボキャブラリーは動的に更新されるため、その中のカテゴリーとその階層に対するすべての変更がナビゲーション・メニュー自体に反映されます。 しかし、この方法では、含まれるカテゴリの階層を並べ替えたり変更したりすることはできません。カテゴリの異なる階層を作成したい場合は、 [、代わりに語彙](#categories) の外側にカテゴリを個別に追加してください。

デフォルトでは、ボキャブラリーをメニュー要素として追加すると、そのメニューがページ上に表示されたときに、その要素がすべてのトップレベル・カテゴリーに置き換えられます。 ただし、ナビゲーション・メニューの編集中に語彙エレメントを選択する際、_Display Name as First Level_チェックボックスをチェックすることで、語彙自体を（クリックできないエレメントとして）メニューに表示させ、その下にトップレベルのカテゴリーを表示させることもできます。

![Check Display Name as First Level to make the Vocabulary appear as an element in the Navigation Menu.](./navigation-menu-element-types/images/02.png)

ナビゲーションメニューのデフォルトのアプリケーション表示テンプレート（別のアプリケーション表示テンプレートを使用する場合は変更可能）を使用して、語彙の各トップレベルカテゴリがナビゲーションメニューに表示されるように、表示ページを設定する必要があります。 メニューに表示されているカテゴリーは、表示ページの有無にかかわらず、すべてのサブカテゴリーを表示します。 しかし、表示ページを持たないサブカテゴリーにはクリック可能なリンクがなく、その下にあるサブカテゴリーも表示されません。

## URL

また、特定のコンテンツに関連付ける必要のない、カスタムURLのナビゲーションメニュー要素を追加することもできます。 ナビゲーションメニューに URL 要素を追加する場合、メニュー要素の表示名と、クリック時にその 要素が指す URL を入力する必要があります。 URLをユーザーのブラウザの別のタブで開きたい場合は、_新しいタブで開く_チェックボックスをオンにします。

![To add a URL menu element, enter the name and the URL to point to.](./navigation-menu-element-types/images/03.png)

## Liferay Portal 7.4 GA4 およびそれ以前

GA4より前のバージョンのLiferay Portal 7.4では、_Display Page_ Navigation Menu要素タイプもあります。

Liferay 7.4 GA5+ と U1+ では、Display Page タイプは Display Pages を使用するコンテンツタイプに置き換えられます: [blog entries](#blogs-entries) , [web content articles](#web-content-articles) , [documents](#documents) , and [Categories](#categories) .

## 関連トピック

* [ナビゲーション・メニューを使う アプリケーション](./using-the-navigation-menus-application.md)
* [表示ページによるコンテンツの公開](../displaying-content/using-display-page-templates/publishing-content-with-display-pages.md)
