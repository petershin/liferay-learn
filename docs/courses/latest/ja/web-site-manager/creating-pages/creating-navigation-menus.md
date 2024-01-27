# ナビゲーションメニューの作成

クラリティのナビゲーションメニューは、デフォルトですべてのページが表示されるため、乱雑になっています。 メニュー表示フラグメントのデフォルト設定では、サイトのページ階層が表示されます。 「キャリア」、「サインイン」、「検索」をデフォルトのメニュー表示から除外したため、これらのページが表示されないことを覚えておいてください。

![The default navigation menu displays the site's pages.](./creating-navigation-menus/images/01.png)

ヘッダーナビゲーションメニューをシンプルにするため、クラリティはナビゲーションメニューに表示する項目を3つだけにしたい：Shop（ページ）、Blog（ページ）、More（追加ページリンクのサブメニュー）です。

さらに、ナビゲーションメニューはフッターに動的な項目を追加できる。 クラリティのフッターには以下のメニューがあります：ショップ、クラリティ、リソースです。

![The footer menus are defined by the Navigation Menus application.](./creating-navigation-menus/images/06.png)

ショップメニューは [Commerce Architect](../../commerce-architect.md) で設定されているため、今のところ空白です。

最初にナビゲーション・メニューを作る：

1. *サイトメニュー* (![サイトメニュー](../../images/icon-product-menu.png))を開き、_Site Builder_ &rarr; _ナビゲーションメニュー_に進みます。

1. *追加* (![追加ボタン](../../images/icon-add.png))をクリックします。

1. 名前に_Clarity Navigation_と入力し、_Save_をクリックします。

1. &rarr; _New_ _Page_ をクリックする。

1. Select PagesセレクタでClarity階層を展開し、_Shop_をクリックし、_Blog_をクリックします。

   ![Add the Shop and Blog pages to the navigation menu.](./creating-navigation-menus/images/02.png)

1. 「選択」をクリックする。

主要なページは整った。 次に、残りのページへのリンクがある「More」というサブメニューが必要です。

1. _追加_ &rarr; _サブメニュー_をクリックする。

1. _More_という名前を入力し、_Add_をクリックする。

1. Moreアイテムの_Actions_メニュー(![Actions](../../images/icon-actions.png))を開きます。

1. _子供の追加_ &rarr; _ページ_ をクリックする。

1. サブメニューに「会社概要」と「お問い合わせ」を追加する。

   ![About Us and Contact Us are in the sub-menu.](./creating-navigation-menus/images/03.png)

   メニューはすぐに使える。

1. 表示したいページは所定の位置にある。 ナビゲーション・メニューが意図的に更新されない限り、新しいページがメニューに追加されないようにするには、_設定_ (![Cog](../../images/icon-cog3.png))をクリックします。

   ページ作成時に新しいページをメニューに追加する設定を無効にし、_Save_をクリックします。

   ![Don't let users add pages to the menu during page creation.](./creating-navigation-menus/images/05.png)

現在のナビゲーションを示すメニュー表示フラグメントがマスターページに追加される。 新しいナビゲーションメニューを使用するように設定します：

1. サイトメニュー(![商品メニュー](../../images/icon-product-menu.png))を開き、_デザイン_ &rarr; _ページテンプレート_をクリックします。

1. テキスト_Clarity MP_をクリックすると、ページエディターに移動します。

1. 現在のナビゲーションが表示されているページ上のエリアをクリックします。 メニュー表示オプションの設定が右サイドバーに表示されます。

   ![Configure the menu display fragment's options.](./creating-navigation-menus/images/04.png)

1. _Source_フィールドをクリックし、_Clarity Navigation_メニューを選択します。

1. このレベルを選択してください。

   階層構造の場合、ニーズに合えば、ウィジェットに表示する別のレベルを選択できる。 More_をクリックし、サブメニューが表示されていることを確認する。

   Navigation Menusアプリケーションで定義されたこれらのサイトメニューに加えて、Contextual Menusをクリックすると、追加のダイナミックメニューオプションを見ることができます。 [メニュー表示の設定](https://learn.liferay.com/en/w/dxp/site-building/site-navigation/configuring-menu-displays) を参照してください。

   この練習の前に、Clarityはメニュー表示フラグメントのページ階層メニューから3つのページを隠していました：採用情報」、「サインイン」、「検索」です。 そのメニューはもう使われていないが、それらのページは新しいヘッダーナビゲーションメニューに明確に追加されたわけではないので、ナビゲーションの外に残り続けている。

ヘッダーナビゲーションに加えて、Clarityにはフッター用のメニューが必要です：_Shop_、_Clarity_、_Resources_です。

1. ヘッダーメニューの作成に使用したのと同じ基本的な手順に従って、_Clarity_メニューを作成し、_About Us_と_Careers_ページを追加します。

1. クラリティのメニューに外部URLを追加します：

   **Name:** *Retail Customer Portal*
   **URL:** *http://clarityb2b.com:8080*

   ![Navigation menus can link to external URLs.](./creating-navigation-menus/images/10.png)

   完了すると、クラリティのメニューにページとURLが表示されます：

   ![The Clarity menu links to pages and an external URL.](./creating-navigation-menus/images/08.png)

1. Resources "メニューを作成し、"Blog "と "Search "ページを追加する。

   ![The Resources menu links to the Blog and Search pages.](./creating-navigation-menus/images/09.png)

ショップメニューには、商品カテゴリーへのリンクが表示されます。 [コマースアーキテクト](../../commerce-architect.md) で作成されるので、今は空白のままにしておいてください。

メニューができたので、フッターに追加する。

1. サイトメニュー（![製品メニュー](../../images/icon-product-menu.png)）を開き、 &rarr; _ページテンプレート_をクリックして、クラリティMPマスターページを開きます。

1. ページエディターで、フッターの最初の3つのグリッド列、SHOP、CLARITY、RESOURCES見出しの下にメニュー表示ウィジェットを見つけてください。

   ![The first three grid columns have Menu display widgets.](./creating-navigation-menus/images/13.png)

1. 各メニュー表示ウィジェットの設定を開き、表示する適切なメニューを選択します。

   ![Display each menu in a Menu Display widget in the footer.](./creating-navigation-menus/images/11.png)

現在、クラリティのヘッダーとフッターは、リストを表示するためにナビゲーションメニューを使用しています。 [コマースアーキテクト](../../commerce-architect.md) コースでは、SHOP メニューが入力されます。

![Clarity's master page uses navigation menus heavily.](./creating-navigation-menus/images/12.png)

次へクラリティのデザインチームは、新しいフラグメントとコンポジションで、ホームページ [の](./designing-the-home-page.md) リデザインを依頼しました。

## 関連コンセプト

* [サイトナビゲーションの管理](https://learn.liferay.com/en/w/dxp/site-building/site-navigation/managing-site-navigation)
* [メニュー表示の設定](https://learn.liferay.com/en/w/dxp/site-building/site-navigation/configuring-menu-displays)
* [ナビゲーション・メニューを使う アプリケーション](https://learn.liferay.com/en/w/dxp/site-building/site-navigation/using-the-navigation-menus-application)
