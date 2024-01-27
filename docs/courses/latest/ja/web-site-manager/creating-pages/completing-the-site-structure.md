# サイト構造の完成

これでトップページができ、マスターページでヘッダーとフッターが定義されたので、Clarityの残りのページを作成できます：

- ホーム
- ショップ
- ブログ
- 会社概要
- お問い合わせ
- 採用情報

1. サイト管理者のPreston Palmerとしてログインしてください。 サイトメニュー(![商品メニュー](../../images/icon-product-menu.png))を開き、_サイトビルダー_ &rarr; _ページ_をクリックします。

   ![The Home and Search page are already in the default site.](./completing-the-site-structure/images/01.png)

   デフォルトでは2つのページがある：ホームと検索です。

1. 検索ページの横にある_Actions_メニューを開き、_Delete_をクリックします。 警告メニューが表示されたら削除を確認する。

1. ページ削除後のテスト検索 ホームページに移動し、_検索_（！[検索](../../images/icon-search.png)）をクリックします。

   何も起こらない。 検索ページを削除したため、検索バーが正しく機能しなくなった。

1. ページの管理ページに戻る。 クリック _追加_ (![追加](./../../images/icon-add.png)) &rarr; ページ_. メニューの_Global Templates_をクリックし、_Search_をクリックします。

   ![There's a global page template for search pages.](./completing-the-site-structure/images/02.png)

1. Search_という名前を入力し、_Add_をクリックする。 一般ページの設定が表示されます。

1. メニュー表示から隠す_を有効にする。 これにより、メニュー表示ウィジェットのページ階層から検索ページが除外されます。 他のナビゲーションメニューにはまだ表示されている。

   テンプレートに加えられた変更が検索ページに反映されるように、_Inherit Changes_を有効のままにしておきます。

   フレンドリーURLは変更可能だが、`/search`のままにしておくこと。 検索バーウィジェットは、このフレンドリーなURLを目的地ページとして使用するように設定されており、検索実行後にユーザーを検索ページに誘導します。

   ![Configure the search page.](./completing-the-site-structure/images/03.png)

1. 設定の一番下にある_Save_をクリックします。

1. 再びホームページに移動する。 検索バーにもう一度_test_と入力し、_Enter_をクリックする。 検索ページが表示される。 [の結果](https://learn.liferay.com/en/w/dxp/using-search/search-pages-and-widgets/search-results/search-results) と [のファセット](https://learn.liferay.com/en/w/dxp/using-search/search-pages-and-widgets/search-facets) が表示されるかどうかは、システム内のコンテンツと、コンテンツを表示する権限を持っているかどうかによります。

   ![The search results and facets are part of the search page template.](./completing-the-site-structure/images/06.png)

   なぜこの検索がうまくいったのかを考えてみよう。 マスターページのヘッダーとサイト内の検索ページに検索バーウィジェットを追加しました。 検索バーはどうやって検索ページに送ることを知っていたのか？ すべてはコンフィギュレーションにある。 Searchという名前のページのフレンドリーURLのデフォルトは`/search`で、検索バーの設定もDestination Pageの設定で同じ値を使用します。 検索ページのフレンドリーURLは、検索バーの目的地ページ設定と一致していなければならない。

1. 次に、サイト訪問者がクラリティの製品を購入できる重要なeコマースストアフロントページを作成します。 ページ管理に戻る。 クリック _追加_ (![追加](./../../images/icon-add.png)) &rarr; ページ_. Clarity MP_ページ・テンプレートを選択し、_Shop_という名前を入力します。

1. コンテンツページエディターで、_Publish_をクリックする。 Clarity用に定義したヘッダーとフッターが配置されました。

    このページの内容は、 [コマースアーキテクト](../../commerce-architect.md) コースで定義されています。

1. 同じ手順を繰り返して、マスターページを使用するように設定されたコンテンツページを作成する：

    - 会社概要
    - ブログ
    - お問い合わせ

1. 「会社概要」ページの子ページ [に「採用情報」](https://learn.liferay.com/en/w/dxp/site-building/site-navigation/managing-page-hierarchies) を作成します。 会社概要の横にある_追加_(![追加](../../images/icon-plus.png))をクリックし、同じ手順でページを作成します。 また、既存のトップレベル・ページを他のページにドラッグして入れ子にすることもできる。

    サイト階層は、ページ管理パネルから見ると次のようになります：

    ![There's one nested page in the current hierarchy.](./completing-the-site-structure/images/04.png)

    次にホームページに行き、これらのページがサイトヘッダーのメニュー表示ウィジェットによって提供されるナビゲーションメニューに自動的に追加されることを確認してください：

    ![The navigation menu displays all the pages except Search.](./completing-the-site-structure/images/05.png)

    メニュー表示ウィジェットのページ階層メニューから検索ページを除外したことを思い出してください。 だからナビゲーションに表示されないんだ。

クラリティの基本ページは整っている。

次へクラリティには [新しいサインインページが必要だ](./adding-the-sign-in-page.md).

## 関連コンセプト

* [サイトにページを追加する](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/adding-pages/adding-a-page-to-a-site)
* [検索ページでの作業](https://learn.liferay.com/en/w/dxp/using-search/search-pages-and-widgets/working-with-search-pages/search-pages)
* [コンテンツの検索](https://learn.liferay.com/en/w/dxp/using-search/getting-started/searching-for-content)
