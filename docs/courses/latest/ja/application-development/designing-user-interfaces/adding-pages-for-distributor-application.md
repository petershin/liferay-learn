# ディストリビューター申請用ページの追加

ページはLiferayサイトの主要な構成要素です。 Delectable Bonsaiのデザインチームは、ディストリビューターアプリケーションオブジェクトで使用する3つのプレースホルダーページを作成し、エクスポートしました。 ここでは、これらのページをLARファイルとしてインポートします： <!--TASK: If you've completed the \[Site Design\]() course, then you've already added these pages to your site. Otherwise, you can download and import them as a LAR file. -->1. この練習のためのLARファイルをダウンロードしてください：

   ```bash
   curl https://learn.liferay.com/courses/latest/en/application-development/designing-user-interfaces/adding-pages-for-distributor-application/distributor-application-pages.lar -O
   ```

1. **サイトメニュー**(![Site Menu](../../images/icon-product-menu.png)) を開き、 **公開設定** を展開し、 **インポート** をクリックします。

1. **Add**(![Add Button](../../images/icon-add.png)) をクリックし、 `distributor-application-pages.lar` ファイルを選択し、 **Continue** をクリックします。

   ![distributor-application-pages.larファイルを選択し、「Continue」をクリックします。](./adding-pages-for-distributor-application/images/01.png)

1. デフォルトのインポート設定を維持し、 **インポート** をクリックする。

1. インポートが正常に終了したことを確認する。

   ![インポートが成功したことを確認する。](./adding-pages-for-distributor-application/images/02.png)

1. これらのページがあなたのサイトに表示されていることを確認してください：

   * 適用する
   * 申請書の提出
   * ディストリビューター

   ![サイト内にページが表示されることを確認する。](./adding-pages-for-distributor-application/images/03.png)

これらのページは、ディストリビューター・アプリケーションのUIを構築するためのフレームワークを提供します。

現在は空っぽだ。 ゼロから始めるのではなく、提供されているフラグメントコンポジションをインポートして、アプリケーションの作成、表示、管理に必要なフラグメントやウィジェットを追加します。

次へ [ディストリビューターアプリケーションページのフラグメントのインポート](./importing-fragments-for-the-distributor-application-pages.md)
