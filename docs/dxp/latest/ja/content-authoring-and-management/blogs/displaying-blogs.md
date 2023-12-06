# ブログの表示

Liferayはブログエントリーを表示する2つの方法を提供します: [表示ページテンプレート](#using-display-page-templates) と [ブログウィジェット](#using-the-blogs-widget) 。

## 表示ページテンプレートの使用

[表示ページ・テンプレート](../../site-building/displaying-content/using-display-page-templates.md) を使って、ブログ・エントリーをフレンドリーなURLで表示するための再利用可能なダイナミック・デザインを作成できる。 デフォルトでは、すべてのブログ・エントリーに一意のフレンドリーURLが自動的に割り当てられる。 このURLを使って、ブログのエントリーを表示ページで見ることができる。

ブログのフレンドリーURLは表示ページのURLに付加され（例： `display-page-url/blog-friendly-url`）、いつでも編集可能です。 変更した場合、LiferayはエントリーのフレンドリーURL履歴に以前のURLを保存します。 この履歴に古いURLが残っている限り、ユーザーは最新版のブログエントリーにアクセスできる。 ブログエントリーを表示するテンプレートの設定方法については、 [表示ページによるコンテンツの公開](../../site-building/displaying-content/using-display-page-templates/publishing-content-with-display-pages.md) を参照してください。

ブログエントリーの表示ページを設定したら、コレクションを使ってコンテンツページにそれらをリストすることができます。 詳しくは [コレクションとコレクション・ページについて](./../collections-and-collection-pages/about-collections-and-collection-pages.md) をご覧ください。

<!-- It would be a good idea do include use cases here to exemplify what was said -->

### フレンドリURLの履歴

古いブログエントリーのURLがフレンドリーURL履歴に表示された場合、同じサイト内の他のエントリーに使用することはできません。 新しいエントリーに使用する前に、まずエントリーのフレンドリーURL履歴から削除しなければならない。

ブログエントリーのフレンドリーURL履歴を管理するには、以下の手順に従ってください：

1. **サイトメニュー**( ![Site Menu](../../images/icon-product-menu.png) ) を開き、 **コンテンツ & データ** を展開し、 **ブログ** にアクセスする。

1. 希望するエントリーの **Actions** ボタン ( ![Actions Button](../../images/icon-actions.png) ) をクリックし、 **Edit** を選択する。

1. 設定]セクションを展開し、[フレンドリーURL]フィールドの[**履歴**] ボタン( ![History Button](../../images/icon-history.png) )をクリックします。

   ![［フレンドリURL］フィールドの［履歴］ボタンをクリックします。](./displaying-blogs/images/01.png)

1. **復元** ボタン ( ![Restore Button](../../images/icon-restore2.png) ) をクリックすると、現在のフレンドリURLが選択したURLに置き換えられます。

1. **URLを忘れる**ボタン ( ![URLを忘れるボタン](../../images/icon-delete.png))をクリックすると、エントリーの履歴から選択したURLが削除されます。一度削除されると、そのURLを使ってブログエントリーにアクセスすることはできなくなります。

   ![復元またはURL忘れボタンをクリック](./displaying-blogs/images/02.png)

フレンドリーURL履歴の変更は自動的に保存されます。

## ブログ・ウィジェットの使用

Blogsウィジェットをページに追加すると、サイト・メンバーにブログ・インターフェイスが公開されます。 同様に、ウィジェットをユーザの個人サイト（プロフィール）に追加すると、そのユーザ専用のブログが作成されます。 ウィジェットはどちらの場合も同じように機能します。

Blogsウィジェットをページに追加するには、

1. [新規ページの作成](../../site-building/creating-pages/adding-pages/adding-a-page-to-a-site.md) または [コンテンツページの編集を開始](../../site-building/creating-pages/using-content-pages/adding-elements-to-content-pages.md).

1. **Add**( ![Add widget icon](../../images/icon-add-widget.png) ) をクリックして、Fragments and Widgets パネルを開きます。

1. ウィジェットタブのコラボレーションカテゴリで、 **ブログ** ウィジェットをページ上の任意の場所にドラッグします。

ブログウィジェットをページに追加すると、リストを希望どおりに表示するように設定するためのいくつかの表示オプションがあります。

ウィジェットを設定するには、 **オプション**（![Options icon](../../images/icon-app-options.png)） &rarr; ［**Configuration**］ をクリックします。

![ブログウィジェットにはさまざまなセットアップオプションがあります](displaying-blogs/images/03.png)

### ［Setup］タブ

**Enable Ratings：** ブログエントリに対して[評価システム](../../collaboration-and-social/social-tools/user-guide/using-the-ratings-system.md)を有効にします。

**Enable Comments：** ブログエントリへのコメントを有効にします。

**Show View Count：** 各エントリの閲覧数の表示を有効にします。

**Social Bookmarks：**［**Current**］ 列に追加したソーシャルメディアプラットフォームでブログエントリの共有を有効にします。 ソーシャルネットワーキングサイトを ［**Current**］ 列と ［**Available**］ 列の間で移動するには、サイトを選択し、それらの列の間の矢印を使用します。 同様に、［Current］列の下にある上/下矢印を使用して、各ブログエントリに表示されるサイトを並べ替えます。

**表示形式：** ソーシャルブックマークの表示方法を定義します。 ［**インライン**］ がデフォルトで、ソーシャルブックマークアイコンが一列に表示されます。 ［**メニュー**］ は、共有メニュー内でアイコンを非表示にします。

**Maximum Items to Display：** 最初のページに表示するブログエントリの総数。 最大60個まで選択して一度に表示できます。

**表示テンプレート：** ブログの表示レイアウトを選択します。

* **概要：** 各ブログエントリの概要を表示します。

* **すべてのコンテンツ：** 各ブログエントリのすべてのコンテンツを表示します。

* **Title：** 各ブログエントリのタイトルのみを表示します。

* **基本：** 概要の簡略版で、テキストが少なく、カバー画像がありません。

* **カード：** 各ブログエントリをカードのような長方形で表示します。この長方形には、カバー画像、タイトル、作成者、投稿日、および数行のテキストが表示されます。

![カード表示テンプレートを使用すると、ブログの投稿を楽しい小さなトレーディングカードのように見せることができます。](displaying-blogs/images/04.png)

別のアプリケーションディスプレイテンプレート（ADT）を選択するか、独自のテンプレートを作成するには、 ［**テンプレートの管理**］ をクリックします。

**不適切な内容の報告を有効にする：** 不適切なコンテンツにフラグを付けることを有効にします。これにより、管理者に電子メールが送信されます。

**Enable Ratings for Comments：** ブログエントリのコメントの[評価システム](../../collaboration-and-social/social-tools/user-guide/using-the-ratings-system.md)を有効にします。

**関連するアセットを表示する：** 他のウィジェットからの関連コンテンツの表示を有効にします。

### ［コミュニケーション］、［Sharing］、および［スコープ］タブ

**コミュニケーション：** ウィジェットがページ上の他のウィジェットに公開するパブリックレンダーパラメータを一覧表示します。 他のウィジェットは、これらを読み取ってアクションを実行できます。 共有パラメーターごとに、パラメーターを使用してコミュニケーションを許可するかどうかを指定し、パラメーターを設定できる受信パラメーターを選択できます。

**共有：** ウィジェットインスタンスを、任意のウェブサイト、Facebook、Netvibes、またはOpenSocialガジェットのウィジェットとして埋め込みます。

**スコープ：** ウィジェットが表示するブログインスタンスを、現在のサイトのブログ（デフォルト）、グローバルブログ、またはページのブログから指定します。

## 関連トピック

[ブログエントリの追加](./adding-blog-entries.md)

[表示ページテンプレートの使用](../../site-building/displaying-content/using-display-page-templates.md)
