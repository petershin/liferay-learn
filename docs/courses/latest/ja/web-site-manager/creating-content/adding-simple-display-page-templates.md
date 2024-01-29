# シンプルな表示ページテンプレートの追加

表示ページのテンプレートは、特定のコンテンツを表示します。 特定の記事をその文脈で見せるために使う。

次に、それぞれのウェブコンテンツタイプ（イベントとFAQ）に特化した表示ページテンプレートを作成し、それらを使用してサイトに新しいページを追加します。

コンテンツマネージャーのオリビアは、新しいページテンプレートを作成する権限を持っていません。 サイト管理者のPreston Palmerとしてログインしてから始めてください。

## イベント表示ページ・テンプレートを追加する

1. サイトメニューへ移動 (![サイトメニュー](../../images/icon-product-menu.png)) &rarr; **デザイン** &rarr; **ページテンプレート** .

1. **表示ページテンプレート**タブをクリックします。

1. **追加** (![アイコンの追加](../../images/icon-add.png))をクリックします。

1. 以前に作成したマスターページテンプレート、 **Clarity MP** を選択します。

   ![Choose Clarity MP as the master page template to base your new template on.](./adding-simple-display-page-templates/images/01.png)

1. **Name**フィールドに`Single-Event Display`と入力する。

1. コンテンツタイプ **のドロップダウンメニューから、***ウェブコンテンツ記事** を選択します。

   選択すると、 **サブタイプ** ドロップダウンメニューが表示されます。

1. サブタイプのドロップダウンメニューから **イベント** を選択します。

   ![Create a Single-Event Display template for the Event web content article type.](./adding-simple-display-page-templates/images/02.png)

1. ［**保存**］をクリックします。

   Clarity MPマスター・ページに基づいて、表示ページの編集が自動的に開始されます。

1. 左側のFragmentsメニューで、Content Displayフラグメントグループまでスクロールダウンし、ドロップゾーンに **Content Display** フラグメントをドラッグします。

   ![Drag the Content Display fragment onto the page to display the page's web content.](./adding-simple-display-page-templates/images/03.png)

   デフォルトでは、このフラグメントはページに選択されたコンテンツタイプを自動的に表示する。

1. 追加したコンテンツ表示フラグメントをクリックします。

    画面左側のメニューが「ブラウザ」タブに変わり、選択が反映されます。 右のメニューは、このフラグメントの設定を示している。

    ![The menus on both sides of the page change to reflect your fragment selection.](./adding-simple-display-page-templates/images/04.png)

1. 画面右側のメニューから **スタイル** タブをクリックします。

1. スペーシング」で上下のマージン（外側の四角形内）をクリックし、 **スペーサー3** のマージン（1レム）を使用するように設定します。

    これにより、テンプレートが表示される場所の上下に、バッファーのスペースができます。

1. 左マージンをクリックし、 **スペーサー5** マージン（3レム）を使用するように設定します。

    ![Increase the margins using the Spacing menu.](./adding-simple-display-page-templates/images/05.png)

1. ページ上部の **Publish** をクリックします。

1. ディスプレイページテンプレートページに戻って、新しいシングルイベント表示テンプレートの **アクション** メニュー（ [アクションアイコン](../../images/icon-actions.png) ）をクリックし、 **デフォルトとしてマーク** を選択します。

    これで、イベント記事は表示ページで自動的にこのテンプレートをデフォルトで使用するようになりました。

一つのイベントを表示する基本的なページがあります。 後で、より多くのイベントを動的に表示できる、より良いページを作ることになる。

次に、FAQのリストを表示するテンプレートを作成します。

## FAQ表示ページテンプレートの追加

1. 表示ページテンプレートページで、 **追加**(![アイコンの追加](../../images/icon-add.png))をクリックします。

1. 再度、 **Clarity MP** マスター・ページ・テンプレートを選択します。

1. **Name**フィールドに`FAQs Page`と入力する。

1. コンテンツの種類」ドロップダウンメニューから、「ウェブコンテンツ記事」を選択します。

   選択すると、 **サブタイプ** ドロップダウンメニューが表示されます。

1. サブタイプのドロップダウンメニューから **FAQs** を選択します。

   ![Create a FAQs Page template for the FAQs web content article type.](./adding-simple-display-page-templates/images/06.png)

1. ［**保存**］をクリックします。

1. 左側のFragmentsメニューで、Content Displayフラグメントグループまでスクロールダウンし、ドロップゾーンに **Content Display** フラグメントをドラッグします。

1. 追加したコンテンツ表示フラグメントをクリックします。

   スクリーンの両側にあるメニューは、あなたの選択を反映して変化する。

1. 右側のメニューから **スタイル** タブをクリックします。

1. 左右のマージンを **スペーサー5**（3レム）に設定する。

1. Textセクションで、フォントサイズを **Font Size Large** に変更する。

1. Fragmentsメニューの **Basic Components** までスクロールし、 **Paragraph** フラグメントをContent Displayフラグメントの下にドラッグします。

1. 追加したパラグラフをクリックします。

1. 右側のメニューから **スタイル** タブをクリックします。

1. 左右のマージンを **スペーサー5**（3レム）に設定する。

1. 左側のブラウザメニューで、Paragraphフラグメント内の **element-text** コンポーネントをクリックします。

    右側のメニューが再びテキスト設定に変わる。 これで、段落のテキストをページのコンテンツに関連するデータにマッピングできる。

1. 画面右側の **Field** ドロップダウンメニューから、 **Publish Date** を選択します。

    ![Map the text in the Paragraph fragment to the Publish Date property of the displayed content.](./adding-simple-display-page-templates/images/07.png)

    これで、記事の最終公開日がFAQs記事本文の下に新しいフラグメントで表示されるようになりました。

1. 画面上部の **Publish** をクリックします。

1. 表示ページのテンプレートページに戻り、新しいシングルイベント表示テンプレートの **アクション** メニュー（ [アクションアイコン](../../images/icon-actions.png) ）をクリックし、 **デフォルトとしてマーク** をクリックします。

    これにより、新しいFAQページテンプレートがFAQ記事のデフォルトとなります。 単一イベント表示テンプレートがイベント記事のデフォルトのままであることに注意してください。

これで、イベントやFAQの記事を独自のページに表示するテンプレートが完成しました。 次に、サイトにいくつか追加する。

## サイトのナビゲーションに表示ページを追加する

1. サイトメニューに移動する (![サイトメニュー](../../images/icon-product-menu.png)) &rarr; **サイト・ビルダー** &rarr; **ナビゲーション・メニュー** .

1. **Clarity**ヘッダーメニューをクリックします。

1. 追加]をクリックし、以前に作成したイベント記事「Clarity Site Going Live Soon」を選択します。

1. **追加**をクリックし、以前に作成したFAQ記事、**Clarity Site FAQs** を選択します。

1. 新しい記事を2つとも、「会社概要」ページの前にある「**その他**」サブメニューの下に置くようにドラッグしてください。

   ![Place your two new display pages within the existing More submenu.](./adding-simple-display-page-templates/images/08.png)

   これで、あなたのサイトのナビゲーション・メニューには、Moreサブメニューの下にこれら2つの表示ページができました。

1. クラリティ・サイトのホームページに戻る。

1. ナビゲーションメニューで、各表示ページをクリックして、どのように見えるかを確認する。

   これらのページには、それぞれの記事の内容が表示されている。 記事のコンテンツは、作成したウェブコンテンツテンプレートを使って自動的に表示され、表示ページテンプレートを使ってページ上に配置されます。

   ![The FAQs page displays a list of FAQs as you configured it in the web content template.](./adding-simple-display-page-templates/images/09.png)

　 新しいタイプのウェブコンテンツの追加と表示に関するこのモジュールは終了しました。

次に、 [ワークフローとパブリッシング・ツール](../workflow-and-publishing-tools.md) をご覧ください。

## 関連コンセプト

- [表示ページテンプレートの使用](https://learn.liferay.com/web/guest/w/dxp/site-building/displaying-content/using-display-page-templates)

- [表示ページによるコンテンツの公開](https://learn.liferay.com/web/guest/w/dxp/site-building/displaying-content/using-display-page-templates/publishing-content-with-display-pages)
