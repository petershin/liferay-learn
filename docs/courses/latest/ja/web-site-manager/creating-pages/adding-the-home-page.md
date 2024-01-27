# ホームページの追加

今現在、 http://localhost:8080 、デフォルトのサイトが表示される。 前回のモジュールでは、インスタンス名を変更し、ロゴを設定した。 これによって、サイトはカスタマイズされたルック＆フィールを持つようになった。

![The default home page has a header, footer, and some Welcome to Liferay content.](./adding-the-home-page/images/01.png)

クラリティには独自のホームページが必要だ。 ページの作成と管理はサイト管理者の仕事であり、適切な権限があれば誰でも行うことができます。 すぐに使えるように、Liferayには必要なパーミッションを提供するSite Administratorというロールが用意されています。 このロールに割り当てられ、サイトのメンバーであるユーザーは、サイトの管理者として行動することができます。 最初のモジュールで実行されるセットアップスクリプトは、あなたのLiferayインスタンスに、まさにそのようなユーザーであるPreston Palmerを事前に入力しています。

<!-- When did we do this? I missed it. -Rich -->

1. サイト管理者としてログインし、Preston Palmer: `preston@clarityvisionsolutions.com`、パスワード `test`。

1. トップページに行き、管理用ヘッダーの_編集_(![編集](../../images/icon-edit.png))をクリックする。

   コンテンツページエディターが表示されます。 ここでページにコンテンツ、機能、構造を追加する。

1. ブラウザを開き（！[ブラウザ](../../images/icon-hierarchy.png)）、すべての要素を展開して、ページの構造のスナップショットを取得する：

   ![The default home page has some content defined already.](./adding-the-home-page/images/02.png)

1. 一番外側のコンテナの_Actions_メニュー(![Actions](../../images/icon-actions.png))をクリックし、_Delete_をクリックする。

   これであなたのページは白紙に戻った。 次の練習で）変更しなければならないヘッダーとフッターは残っているが、デフォルトのページコンテンツはなくなっている！

1. プラスアイコン(![フラグメントとウィジェット](../../images/icon-plus.png))をクリックして、フラグメントとウィジェットのサイドバーメニューを開きます。

1. _Container_フラグメントをページにドラッグする。

   コンテナは、フラグメントやウィジェットのための設定可能なドラッグ＆ドロップゾーンを定義します。 すべてのコンテンツページ要素をコンテナに追加することで、ページのスタイリングがより便利になります。

1. コンテナにバナーを追加する。 サイドバーの「Fragments and Widgets」メニューから_Banner_を探し、すでに追加したコンテナの中にドラッグします。

   バナーは2つのコンテナ、見出し、段落、ボタンで構成される。

   ブラウザのサイドバー(![Browser](../../images/icon-hierarchy.png))で、要素を展開すると、現在のページ要素の階層が表示されます：

   ![These elements were added with the container fragment and the banner fragment.](./adding-the-home-page/images/03.png)

1. バナーのトップレベルコンテナの名前を変更する。 ブラウザのサイドバーで、_Actions_メニュー(![Actions](../../images/icon-actions.png))を開き、_Rename_をクリックします。

   ![Rename the banner's container for readability.](./adding-the-home-page/images/04.png)

1. _バナーコンテナ_ に入る。

1. ブラウザのサイドバーにある_Banner Container_をクリックし、その設定（右サイドバーのメニュー）を開きます。 Generalセクションで、バナーの最小高さを80VHに設定する。 これにより、バナーは現在のデバイスのビューポートの高さの80％を占めるようになります。

1. バナーの内側のコンテナが中央に来るように設定する。 バナー・コンテナのコンテンツ表示を_Flex Column_に設定し、コンテンツのジャスティファイを_Center_に設定します。

1. 内側のコンテナとその要素（見出し、段落、ボタン）の周りにパディングがあるように設定します。 サイドバーの一番内側の_Container_をクリックして設定を開き、_Styles_をクリックします。

1. パディングを全周1レムに変更する。 スペーシングの設定で、要素の右、左、上、下のパディングに_スペーサー3_を選択します。

    各スペーサーの設定値は、ページの [スタイルブック](https://learn.liferay.com/en/w/dxp/site-building/site-appearance/style-books) で定義されています。

1. バナーの背景に画像を設定します。 _Background_は、各コンテナ要素のコンフィギュレーションのプロパティである。 ブラウザのサイドバーにある_Banner Container_をクリックします。

1. 右サイドバーの_Styles_メニューを開き、_Background Image_を`clarity-banner-image`に設定します。

1. 編集する要素をダブルクリックして、ページ上のテキストを変更します：

    - **見出し：** _See Well, Look Good_
    - **段落：**こんなに元気な自分、こんなに格好いい自分を見たことがないだろう。
    - **ボタン:** 詳細はこちら

1. _Publish_ボタンをクリックします。

クラリティのホームページができた。 まだ完全には実装されていませんが、ユーザーはサイトにナビゲートできますし、明らかにLiferayではなくClarity用です。

![There's a home page for Clarity's public site.](./adding-the-home-page/images/05.png)

次: [全ページにカスタムヘッダーとカスタムフッターを作成](./defining-the-pages-header-and-footer.md) .

## 関連コンセプト

* [サイトにページを追加する](https://learn.liferay.com/web/guest/w/dxp/site-building/creating-pages/adding-pages/adding-a-page-to-a-site)
* [ページの断片とウィジェット](https://learn.liferay.com/web/guest/w/dxp/site-building/creating-pages/page-fragments-and-widgets)
* [フラグメントの設定](https://learn.liferay.com/web/guest/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments)
