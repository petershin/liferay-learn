# アンチサミーの管理

LiferayではデフォルトでAntiSamyサニタイザーが有効になっています。 このサニタイザーは、ユーザーが様々なLiferayアプリケーションでHTMLやCSSを使用する際に、悪意のあるJavaScriptコードがシステムに注入されるのを防ぎます。 詳しくは [AntiSamy](https://learn.liferay.com/web/guest/w/dxp/installation-and-upgrades/securing-liferay/using-antisamy) 。

悪意のある活動を防止するため、クラリティ ビジョン ソリューションズの IT 部門は、ウェブ コンテンツに JavaScript コードを配置することを禁止することを決定しました。 以下、その様子をご覧いただきたい。

## AntiSamyの構成

デフォルトでは、 [フラグメントの使用](https://learn.liferay.com/web/guest/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments) および [Webコンテンツ](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/web-content) を除き、すべての JavaScript コードはサニタイズされ、実行されないようになっています。 これは、コンフィギュレーションにあるブラックリストとホワイトリストによって制御される。 以下の手順で、実際に見てみよう。

1. 基本的なウェブコンテンツをサイトページに公開する。

   * **Product Menu**(![Product Menu](../../images/icon-product-menu.png)) を開きます。
   * **コンテンツ & データ** の下にある **ウェブコンテンツ** をクリックする。
   * **Add**(![Add icon](../../images/icon-add.png)) をクリックし、 **Basic Web Content** を選択する。
   * **foo** をタイトルとして入力。
   * **Source**(![Code icon](../../images/icon-code.png)) をクリックしてコードビューに切り替える。
   * 以下のJavaScriptスニペットを貼り付ける。

   ```html
   <script>
   function foo() {
   alert("Hello World!");
   }
   </script>
   <p>Click the button to see the effect.</p>

   <p><button onclick="foo()">Click me</button></p>
   ```
   ［* **Publish**］ をクリックします。
   * 左のナビゲーションで、 **Site Builder** の下にある **Pages** をクリックします。
   * **Add**(![Add icon](../../images/icon-add.png)) をクリックして、新しいページを追加します。 選択 **ページ** .
   * 次の画面で、空白のテンプレートを選択する。 `Webcontent` をページ名として入力する。 ［**Add**］ をクリックします。
   * 左のナビゲーションで、フラグメントとウィジェットタブの下にある **ウィジェット** を選択します。
   * コンテンツ管理の下にあるウェブコンテンツ表示ウィジェットを見つけてください。 ページにドラッグする。
   * ウィジェットの **オプション**(![Options icon](../../images/icon-actions.png)) をクリックし、 **設定** をクリックする。
   * ポップアップウィンドウで、先ほど作成したフーウェブコンテンツを選択します。 ［**保存**］ をクリックします。
   * 最後に、 **Publish** をクリックします。

1. スクリプトの動作をご覧ください。

   * 作成したサイトページに移動する（例： `http://localhost:8080/webcontent`）。
   * **Click me** ボタンをクリックする。 JavaScriptのアラートボックスがポップアップ表示されます。

   ![ボタンをクリックするとアラートボックスがポップアップします。](./managing-antisamy/images/01.png)

1. アンチサミーをウェブコンテンツに適用する。

   * **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **System Settings** に移動する。
   * セキュリティセクションの下にある **セキュリティツール** をクリックする。
   * 左のナビゲーションで、 **AntiSamy Sanitizer** をクリックします。
   * マイナスボタンをクリックして、 `com.liferay.journal.model.JournalArticle` ホワイトリストエントリーを削除します。
   * ［**保存**］ をクリックします。

1. 除菌剤が効果を発揮するのを見る。

   * **Product Menu**(![Product Menu](../../images/icon-product-menu.png)) を開きます。
   * **コンテンツ & データ** の下にある **ウェブコンテンツ** をクリックする。
   * 以前に作成したフーウェブコンテンツをクリックします。
   * **Source**(![Code icon](../../images/icon-code.png)) をクリックしてコードビューに切り替える。
   * 内容に少し変更を加える。 例えば、 `Hello World!` を `Hello Foo！`.
   * ［**Publish**］ をクリックします。
   * クリックしてウェブコンテンツに戻る。 Javascriptのコードが削除され、コンテンツがサニタイズされていることを確認してください。

   ![ウェブコンテンツはAntiSamyによってサニタイズされます。](./managing-antisamy/images/02.png)

このセキュリティ・モジュールの完成、おめでとう。

## 関連コンセプト

- [AntiSamy](https://learn.liferay.com/web/guest/w/dxp/installation-and-upgrades/securing-liferay/using-antisamy)
