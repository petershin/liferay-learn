---
toc:
  - ./creating-pages/importing-fragments-and-resources.md
  - ./creating-pages/adding-the-home-page.md
  - ./creating-pages/defining-the-pages-header-and-footer.md
  - ./creating-pages/completing-the-site-structure.md
  - ./creating-pages/adding-the-sign-in-page.md
  - ./creating-pages/creating-navigation-menus.md
  - ./creating-pages/designing-the-home-page.md
---
# ページの作成

Clarityの公開サイト設定が完了したら、最初のページを作成できます！

完成したら、クラリティの公開サイト用にこの構造を作成します：

- ホーム
- 会社概要
  - 採用情報
- 検索
- ショップ
- ブログ
- お問い合わせ

最初は、ホームページと検索ページにコンテンツを入力します。 その他のほとんどは、Content Managementモジュールで後で入力される。 ショップページはコマースアーキテクトコースのプレースホルダです。 サイトのデフォルト・ホームページを再利用することから始め、サイトのページの作成と設定に移ります。

## Editing Content Pages

Liferayにはいくつかのページタイプがありますが、 [コンテンツページ](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/using-content-pages) がデフォルトで、最もよく使われるタイプです。 コンテンツページは、ページのコンテンツやデザインを管理・編集するための便利なユーザーインターフェイスを提供します。 コンテンツページに追加されたフラグメントやウィジェットを通して、クラリティのページをデザインします。

![Use the content page editor to add fragments and widgets to the page.](./creating-pages/images/01.png)

## フラグメントの使用

[フラグメント](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments) HTML、JavaScript（必要な場合）、CSSの再利用可能なスニペットで、ルック＆フィールを構築し、コンテンツを追加するためにコンテンツページに追加します。 Clarityサイトを構築するには、既製のフラグメントとカスタムフラグメントの両方を使用します。 カスタムであれビルトインであれ、_フラグメントコンポジション_はエクスポート可能なフラグメントのコレクションで、ページ、サイト、システム間で再利用することができます。

- カスタムフラグメントは、 [アウトオブボックスフラグメント](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference) の中にあなたのニーズに合うものがない場合に、あなたが開発するものです。 [多くの場合、独自のフラグメントを作成するために必要なHTML、CSS、JavaScriptの一部を含む既存のフラグメント](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/duplicating-fragments) をコピーすることから始めることができます。
- [フラグメントコンポジション](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/saving-fragment-compositions) は、コンテンツページエディターに追加し、繰り返し使用するために保存した、再利用可能なフラグメントグループです。

![You can create custom fragments and save fragment compositions as needed.](./creating-pages/images/02.png)

## マスターページによる共通ページ要素の定義

メインページのコンテンツに加えて、多くのサイトではページ間で共通のヘッダーとフッターが必要です。 [マスターページ](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/defining-headers-and-footers/master-page-templates) では、これらの共通要素を定義することができる。 マスターページを定義しない場合、Liferayは_Blank_マスターを使用します。このマスターには、Liferayのロゴとラベルを含むヘッダー、ページベースのナビゲーションメニュー、検索バーウィジェット、サインイン/パーソナルメニューが含まれます。 カスタムマスターページを使用して、コンテンツページエディタを使用してClarityのヘッダーとフッターを定義します：

![Master pages define the header and footer for Clarity's pages.](./creating-pages/images/03.png)

## サイト/サイト・ナビゲーション・メニューのナビゲーション

[Navigation Menusアプリケーション](https://learn.liferay.com/en/w/dxp/site-building/site-navigation/using-the-navigation-menus-application) を使用してClarityのナビゲーション・メニューを作成し、 [Menu Displayフラグメントまたはウィジェット](https://learn.liferay.com/en/w/dxp/site-building/site-navigation/configuring-menu-displays) を使用して表示します。 ページヘッダーでは、ユーザーがサイトをナビゲートするのに役立つページ階層が表示されます。

![Clarity needs a custom site navigation menu.](./creating-pages/images/04.png)

## 検索ページの設定

[クラリティは、サイト上に検索ページ](https://learn.liferay.com/en/w/dxp/using-search/search-pages-and-widgets/working-with-search-pages/search-pages) 、マスターページのヘッダーに検索バーを設置したい。 [検索ページテンプレート](https://learn.liferay.com/en/w/dxp/using-search/search-pages-and-widgets/working-with-search-pages/using-a-search-page-template) を利用することで、わずかな労力でこれを達成することができる。

![The search page template is used to create the search page.](./creating-pages/images/05.png)

これを作る準備はできているか？

[行こう！](./creating-pages/importing-fragments-and-resources.md) 
