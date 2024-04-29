# ブログの表示

Liferayはブログエントリーを表示する2つの方法を提供します: [表示ページテンプレート](#using-display-page-templates) と [ブログウィジェット](#using-the-blogs-widget) 。

## 表示ページテンプレートの使用

[表示ページ・テンプレート](../../site-building/displaying-content/using-display-page-templates.md) を使って、ブログ・エントリーをフレンドリーなURLで表示するための再利用可能なダイナミック・デザインを作成できる。 デフォルトでは、すべてのブログ・エントリーに一意のフレンドリーURLが自動的に割り当てられる。 このURLを使って、ブログのエントリーを表示ページで見ることができる。

ブログのフレンドリーURLは表示ページのURLに付加され（つまり`display-page-url/blog-friendly-url`）、いつでも編集することができます。 変更した場合、LiferayはエントリーのフレンドリーURL履歴に以前のURLを保存します。 この履歴に古いURLが残っている限り、ユーザーは最新版のブログエントリーにアクセスできる。 ブログエントリーを表示するテンプレートの設定方法については、 [表示ページによるコンテンツの公開](../../site-building/displaying-content/using-display-page-templates/publishing-content-with-display-pages.md) を参照してください。

ブログエントリーの表示ページを設定したら、コレクションを使ってコンテンツページにそれらをリストすることができます。 詳しくは [コレクションとコレクション・ページについて](../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md) をご覧ください。

<!-- It would be a good idea do include use cases here to exemplify what was said -->

### フレンドリURLの履歴

古いブログエントリーのURLがフレンドリーURL履歴に表示された場合、同じサイト内の他のエントリーに使用することはできません。 新しいエントリーに使用する前に、まずエントリーのフレンドリーURL履歴から削除しなければならない。

ブログエントリーのフレンドリーURL履歴を管理するには、以下の手順に従ってください：

1. [サイトメニュー](../../images/icon-product-menu.png) を開き、[コンテンツとデータ]を展開し、[ブログ]に進みます。

1. 目的のエントリーの **Actions** ボタン( ![Actions Button](../../images/icon-actions.png) )をクリックし、 **Edit** を選択します。

1. Configurationセクションを展開し、Friendly URLフィールドの **History** ボタン( ![History Button](../../images/icon-history.png) )をクリックします。

   ![Click the History button for the Friendly URL field.](./displaying-blogs/images/01.png)

1. **復元** ボタン ( ![復元ボタン](../../images/icon-restore2.png))をクリックして、現在のフレンドリーURLを選択したURLに置き換えます。

1. 選択したURLを履歴から削除するには、 **Forget URL** ボタン ( ![Forget URL Button](../../images/icon-delete.png) ) をクリックします。 一度削除されると、そのURLを使ってブログエントリーにアクセスすることはできなくなります。

   ![Click the Restore or Forget URL buttons.](./displaying-blogs/images/02.png)

フレンドリーURL履歴の変更は自動的に保存されます。

## ブログ・ウィジェットの使用

Blogsウィジェットをページに追加すると、サイト・メンバーにブログ・インターフェイスが公開されます。 同様に、ウィジェットをユーザの個人サイト（プロフィール）に追加すると、そのユーザ専用のブログが作成されます。 ウィジェットはどちらの場合も同じように機能します。

Blogsウィジェットをページに追加するには、

1. [新しいページの作成](../../site-building/creating-pages/adding-pages/adding-a-page-to-a-site.md) または [コンテンツページの編集を開始](../../site-building/creating-pages/using-content-pages/adding-elements-to-content-pages.md) .

1. **Add**( ![Add widget icon](../../images/icon-add-widget.png) ) をクリックして、Fragments and Widgetsパネルを開きます。

1. ウィジェットタブのコラボレーションカテゴリーで、 **ブログ** ウィジェットをページ上の任意の場所にドラッグします。

ブログウィジェットをページに追加すると、リストを希望どおりに表示するように設定するためのいくつかの表示オプションがあります。

ウィジェットを設定するには、 **オプション**( [オプション・アイコン](../../images/icon-app-options.png) )をクリックします。 &rarr; **設定** .

![There are different setup options for the Blogs widget](displaying-blogs/images/03.png)

### ［Setup］タブ

**Enable Ratings:** ブログエントリーの [評価システム](../../collaboration-and-social/social-tools/using-the-ratings-system.md) を有効にする。

**コメントを有効にする** ： ブログのエントリーにコメントを有効にする。

**表示数の表示:** 各エントリの表示数の表示を有効にします。

**ソーシャル ブックマーク** : **現在** 列に追加したソーシャル メディア プラットフォームでブログ エントリを共有できるようにします。 **現在** 列と **利用可能** 列の間でソーシャル ネットワーキング サイトを移動するには、サイトを選択し、それらの列の間の矢印を使用します。 同様に、「現在」列の下にある上/下矢印を使用して、各ブログ エントリに表示されるサイトの順序を変更します。

**表示スタイル:** ソーシャル ブックマークの表示方法を定義します。 **インライン** がデフォルトで、ソーシャル ブックマーク アイコンが 1 列に並んで表示されます。 **Menu** は共有メニュー内にそれらを非表示にします。

**Maximum Items to Display** :初期ページに表示するブログエントリーの総数。 最大60個まで選択して一度に表示できます。

**表示テンプレート** ：ブログの表示レイアウトを選択します：

* **要約** : 各ブログ エントリの要約を表示します。

* **全コンテンツ** : 各ブログ エントリの全コンテンツが表示されます。

* **タイトル** ： 各ブログエントリーのタイトルのみを表示します。

* **Basic** :アブストラクトの縮小版で、テキストは少なく、表紙画像もない。

* **カード** : 各ブログのエントリーをカードのような長方形で表示し、カバー画像、タイトル、著者、投稿日、数行のテキストを表示します。

![The card display template makes your blog posts look like fun little trading cards.](displaying-blogs/images/04.png)

別のアプリケーション・ディスプレイ・テンプレート（ADT）を選択したり、独自のテンプレートを作成したりするには、 **Manage Templates** をクリックします。

**不適切なコンテンツの報告を有効にする** ： 不適切なコンテンツとしてフラグを立て、管理者に電子メールを送信できるようにします。

**Enable Ratings for Comments** : Enable [ratings system](../../collaboration-and-social/social-tools/using-the-ratings-system.md) for blog entry comments.

**Show Related Assets:** 他のウィジェットからの関連コンテンツを表示できるようにします。

### ［コミュニケーション］、［Sharing］、および［スコープ］タブ

**Communication:** ウィジェットがページ上の他のウィジェットに公開するパブリックレンダリングパラメータをリストします。 他のウィジェットは、これらを読み取ってアクションを実行できます。 共有パラメーターごとに、パラメーターを使用してコミュニケーションを許可するかどうかを指定し、パラメーターを設定できる受信パラメーターを選択できます。

**共有** :ウィジェットインスタンスを、任意のウェブサイト、Facebook、Netvibes、またはOpenSocialガジェットのウィジェットとして埋め込みます。

**スコープ:** ウィジェットが表示するブログ インスタンスを指定します: 現在のサイトのブログ (デフォルト)、グローバル ブログ、またはページのブログ。

## 関連トピック

[ブログエントリーの追加](./adding-blog-entries.md)

[表示ページテンプレートの使用](../../site-building/displaying-content/using-display-page-templates.md)
