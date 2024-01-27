# サイト最初のウェブコンテンツを追加する

これで、2つの新しいタイプのコンテンツの構造とテンプレートができたので、記事を追加する準備ができました。 ここでは、これらのタイプ（イベントとFAQ）の両方のコンテンツをサイトに追加します。

サイト管理者が個々のコンテンツ記事を追加することはない。 作業を始める前に一度ログアウトし、サイトのコンテンツ・マネージャー、オリビア・オニールとしてログインし直してください。

## イベント記事を追加する

まず、イベント記事を追加して、クラリティ・サイトが間もなく稼動することを告知する。

1. サイトメニューに移動する (![サイトメニュー](../../images/icon-product-menu.png)) &rarr; _Content & Data_ &rarr; _Webコンテンツ_.

1. *追加* (![アイコンの追加](../../images/icon-add.png))をクリックします。 &rarr; *イベント*

   ![Click Event to add an article with the structure you added previously.](./adding-the-sites-first-web-content/images/01.png)

1. ページの一番上に、記事のタイトルを「Clarity Site Going Live Soon」とする。

1. *Summary*フィールドに、このテキストを入力する：

   ```
   クラリティ・ビジョン・ソリューションズのサイトは現在建設中ですが、まもなく公開される予定です！
   ```

1. *Body*フィールドに次のテキストを入力する：

   ```
   クラリティ・サイトは、もうすぐ本番を迎えます！現在、工事とメンテナンス中です。サイトの一部の機能はまだ完全に整っていない可能性があります。

   不足している機能についてご質問がありましたら、hello@clarityvisionsolutions.com。ありがとうございました！
   ```

1. *バナー画像*フィールドの横にある*選択*をクリックし、サイトの[前のモジュールでヘッダーとフッター](../creating-pages/defining-the-pages-header-and-footer.md)に使用したClarityロゴ(`clarity-logo.png`)を選択します。


   ![Fill in the same fields you configured when you created the Event structure.](./adding-the-sites-first-web-content/images/02.png)

1. ページ上部の_Publish_をクリックします。

ウェブコンテンツページに戻り、イベント記事ができました。 次に、よくある質問に答える記事を作成する。

## FAQ記事の作成

1. ウェブ・コンテンツ・ページで、_追加_ (![アイコンの追加](../../images/icon-add.png))をクリックする。 &rarr; _よくある質問_.

   ![Click FAQs to add an article with the structure you added previously.](./adding-the-sites-first-web-content/images/03.png)

1. ページの一番上に、記事のタイトルを「クラリティサイトのFAQ」とします。

1. 質問グループの右上にある_追加_ ([追加アイコン](../../images/icon-add.png))をクリックして、質問と回答のセットをさらに2セット作成します（合計3セット）。

1. 最初の_Question_フィールドに、この質問を入力する：

   ```
   以前クラリティでメガネを購入したのですが、サイトで見つけることができません。クラリティではもう販売していないのでしょうか？
   ```

1. 最初の_Answer_フィールドに、この答えを入力してください：

   ```
   現在は他の小売店でしか販売されていないかもしれません。パートナーサイトをチェックしてみてください！
   ```

1. 2つ目の_質問_フィールドに入力してください：

   ```
   クラリティの新製品や変更に関する情報はどこで入手できますか？
   ```

1. 2番目の_Answer_フィールドに入力してください：

   ```
   クラリティの製品に大きな変更やリコールがあった場合は、ニュースにてお知らせいたします。アナウンスメントページにご注目ください！
   ```

1. 3つ目の_質問_フィールドに入力してください：

   ```
   機能していないリンクを見つけた。
   ```

1. これを3番目の_Answer_フィールドに入力する：

   ```
   サイトは現在もメンテナンス中です。リンク切れを見つけた場所のスクリーンショットを hello@clarityvisionsolutions.com までお送りください。ありがとうございました！
   ```

1. 画面右側のプロパティメニューで、追加した2つ目のテンプレート、_Collapsible FAQs_が選択されていることを確認してください。

1. ページ上部の_Publish_をクリックします。

これで、追加したウェブコンテンツ構造ごとに新しい記事ができました。

## より多くの記事をインポートする

インポートすることで、より多くのコンテンツをサイトに埋め込むことができる。

1. 他のウェブコンテンツ記事と一緒にLARファイルをダウンロードし、解凍する：

   ```bash
   curl https://resources.learn.liferay.com/courses/latest/en/liferay-s7z9.zip -O
   ```

   ```bash
   unzip liferay-s7z9.zip
   ```

1. ウェブコンテンツのページで、ページの右上にある_オプション_（[オプションアイコン](../../images/icon-options.png)）をクリックし、_インポート/エクスポート_を選択します。

1. 開いたモーダルで、_インポート_タブを選択します。

1. *Select File*をクリックし、ダウンロードして解凍した`web-content-articles.lar`ファイルを選択し、_Continue_をクリックします。

1. デフォルト設定を使用し、_Import_をクリックします。

   インポートプロセスとそのオプションの詳細については、同様のインポートプロセスを持つ [ウィジェットデータのエクスポート/インポート](https://learn.liferay.com/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-widgets/configuring-widgets/exporting-importing-widget-data#importing-widget-data) を参照のこと。

1. インポート処理が完了したら、モーダルを閉じます。 このモジュールで作成されたすべてのウェブコンテンツ記事、構造、テンプレートがインポートされます。

次に、 [テンプレートを追加して、特定の表示ページにイベントやFAQを表示する](./adding-simple-display-page-templates.md)。

## 関連コンセプト

- [基本的なウェブコンテンツ記事の作成](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article)

- [ウィジェットデータのエクスポート/インポート](https://learn.liferay.com/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-widgets/configuring-widgets/exporting-importing-widget-data)
