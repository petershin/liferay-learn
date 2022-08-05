# ナビゲーションメニューの要素の種類

ナビゲーションメニューには、さまざまな種類の要素があり、お好みの階層に追加して配置することができます。 これらのタイプには、 [特定のページ](#pages) 、 [ボキャブラリー](#vocabularies) 、特定のコンテンツタイプの表示ページ、またはカスタム [プレースホルダー](#submenus) または [URL](#urls) が含まれます。 これらの要素を使ったナビゲーションメニューの追加については、こちら [here](./using-the-navigation-menus-application.md) を参照してください。

## ページ

ナビゲーションメニューによく使われる要素に、特定のページがあります。 サイトのページセットから任意の公開ページをメニューに追加することができます。

## サブメニュー

サブメニューは、ナビゲーションメニューに追加できるプレースホルダー要素で、特定のページやコンテンツを必要とせずに、メニューの下に追加のメニュー要素をグループ化することができます。 ページで使用する場合、サブメニュー要素にはクリック可能なリンクはなく、ユーザーがマウスを乗せると展開して子要素が表示されます。

![ナビゲーションメニューのサブメニューはクリックできませんが、その中に含まれる子要素はクリックできます。](./navigation-menu-element-types/images/01.png)

ナビゲーションメニューのデフォルトのアプリケーション表示テンプレートを使用すると、サブメニューの下に他の要素が編成されていない場合、ユーザーのナビゲーションメニューに表示されません。

## ブログエントリー

ブログエントリー [blog entry](../../content-authoring-and-management/blogs/adding-blog-entries.md) を独立したメニュー要素として追加し、そのエントリーの [表示ページ](../displaying-content/using-display-page-templates/publishing-content-with-display-pages.md)にリンクさせることができます。 ナビゲーションメニューのデフォルトのアプリケーション表示テンプレートを使用すると、表示ページのないブログエントリーが追加された場合、リンクがないため、メニュー上でユーザーから隠されます。 この動作は、別のアプリケーション表示テンプレートを使用した場合に変更されることがあります。

## Webコンテンツの記事

ウェブコンテンツの記事 [web content article](../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md) を独立したメニュー要素として追加し、記事の [表示ページ](../displaying-content/using-display-page-templates/publishing-content-with-display-pages.md)にリンクさせることができます。 ナビゲーションメニューのデフォルトのアプリケーション表示テンプレートを使用すると、表示ページのないウェブコンテンツ記事が追加された場合、その記事はリンクを持たないため、メニュー上でユーザーから隠されます。 この動作は、別のアプリケーション表示テンプレートを使用した場合に変更されることがあります。

## ドキュメント

[文書](../../content-authoring-and-management/documents-and-media/documents-and-media-overview.md) を、文書の [表示ページ](../displaying-content/using-display-page-templates/publishing-content-with-display-pages.md)にリンクする独立したメニュー要素として追加することができます。 ナビゲーションメニューのデフォルトのアプリケーション表示テンプレートを使用すると、表示ページのないドキュメントが追加された場合、リンクがないため、メニュー上でユーザーから隠れることになります。 この動作は、別のアプリケーション表示テンプレートを使用した場合に変更されることがあります。

## カテゴリ

[カテゴリ](../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md#defining-categories) をメニュー要素として追加し、カテゴリの [表示ページ](../displaying-content/using-display-page-templates/publishing-content-with-display-pages.md)にリンクさせることができます。 ナビゲーションメニューのデフォルトのアプリケーション表示テンプレートを使用すると、表示ページのないカテゴリが追加された場合、リンクがないため、メニュー上でユーザーから隠されることになります。 この動作は、別のアプリケーション表示テンプレートを使用した場合に変更されることがあります。

Liferay 7.4 バージョン U9+ および GA13+ からは、複数のカテゴリーを一度に選択できるようになりました。 カテゴリとその下のサブカテゴリを一緒に追加すると、ナビゲーションメニューに正しい階層で配置されます。

```{note}
ナビゲーションメニューの要素として追加されたカテゴリーがサブカテゴリーを含む場合、サブカテゴリーの変更はナビゲーションメニューの階層に自動的に反映されません。 サブカテゴリの変更をナビゲーションメニューに自動的に反映させたい場合は、代わりに動的な [Vocabulary](#vocabularies) 要素を使用します。
```

## ボキャブラリ

{bdg-secondary}`Liferay Portal 7.4 GA26+、DXP 7.4 U26+`で利用可能です。

[Vocabularies](../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md#defining-vocabularies) 全体をメニュー要素として追加することができます。 ボキャブラリーは動的に更新され、その中のカテゴリーとその階層の変更はすべてナビゲーションメニュー自体に反映されます。 ただし、この方法では、含まれるカテゴリの階層を並べ替えたり変更したりすることはできません。カテゴリの異なる階層を作成したい場合は、代わりに [ボキャブラリ](#categories) の外側にカテゴリを個別に追加してください。

デフォルトでは、ボキャブラリーをメニュー要素として追加すると、その要素がページに表示されたときに、メニューはそのトップレベルのカテゴリーすべてに置き換わります。 ただし、ナビゲーションメニューの編集中に語彙要素を選択する際に、 *Display Name as First Level* チェックボックスをチェックすると、語彙そのものを（クリックできない要素として）メニューに表示し、その下にトップレベルのカテゴリーを表示することも可能です。

![Display Name as First Levelにチェックを入れると、語彙がナビゲーションメニューの要素として表示されるようになります。](./navigation-menu-element-types/images/02.png)

ナビゲーションメニューのデフォルトのアプリケーション表示テンプレート（別のアプリケーション表示テンプレートを使用する場合は変更可能）を使用して、語彙の各トップレベルのカテゴリは、ナビゲーションメニューに表示するために表示ページを設定する必要があります。 メニューに表示されるカテゴリは、独自の表示ページの有無にかかわらず、すべてのサブカテゴリを表示します。 ただし、表示ページを持たないサブカテゴリはクリック可能なリンクを持たず、その下にある自分のサブカテゴリも表示されません。

## URL

また、特定のコンテンツに関連付ける必要のない、カスタムURLのナビゲーションメニュー要素を追加することもできます。 ナビゲーションメニューにURL要素を追加する場合、メニュー要素の表示名と、クリック時にその要素が指すURLを入力する必要があります。 URLをユーザーのブラウザで別のタブで開きたい場合は、 *新しいタブで開く* のチェックボックスをオンにします。

![URLメニュー要素を追加するには、名前と指し示すURLを入力します。](./navigation-menu-element-types/images/03.png)

## Liferay Portal 7.4 GA4 以上

Liferay Portal 7.4 の GA4 より前のバージョンでは、 *Display Page* Navigation Menu という要素タイプもあり、これはメニューに追加された表示ページ（コンテンツの種類を問わない）に使用されます。

Liferay 7.4 GA5+ と U1+ では、Display Page タイプは Display Pages を使用するコンテンツタイプに置き換えられます： [blog entries](#blogs-entries) , [web content articles](#web-content-articles) , [documents](#documents) , and [Categories](#categories) .

## 追加情報

* [ナビゲーションメニューのアプリケーションを使う](./using-the-navigation-menus-application.md)
* [表示ページによるコンテンツの公開](../displaying-content/using-display-page-templates/publishing-content-with-display-pages.md)
