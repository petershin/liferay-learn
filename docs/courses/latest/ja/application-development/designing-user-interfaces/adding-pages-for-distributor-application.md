# ディストリビューター申請用ページの追加

ページはLiferayサイトの主要な構成要素です。 Delectable Bonsaiのデザインチームは、ディストリビューターアプリケーションオブジェクトで使用する3つのプレースホルダーページを作成し、エクスポートしました。 ここでは、これらのページをLARファイルとしてインポートします：
<!--TASK: [Site Design]() コースを修了した場合、これらのページはすでにあなたのサイトに追加されています。 そうでなければ、LARファイルとしてダウンロードしてインポートすることができます。 -->

1. この練習のためのLARファイルをダウンロードしてください：

   ```bash
   curl https://resources.learn.liferay.com/courses/latest/en/application-development/designing-user-interfaces/distributor-application-pages.lar -O
   ```

1. [サイトメニュー](../../images/icon-product-menu.png))を開き、_パブリッシング_を展開し、_インポート_をクリックします。

1. *Add*（！[Add Button](../../images/icon-add.png)）をクリックし、`distributor-application-pages.lar`ファイルを選択し、_Continue_をクリックする。

   ![Select the distributor-application-pages.lar file and click Continue.](./adding-pages-for-distributor-application/images/01.png)

1. デフォルトのインポート設定のまま、_Import_をクリックします。

1. インポートが正常に終了したことを確認する。

   ![Confirm the import was successful.](./adding-pages-for-distributor-application/images/02.png)

1. これらのページがあなたのサイトに表示されていることを確認してください：

   * 適用する
   * 申請書の提出
   * ディストリビューター

   ![Verify the pages appear in your site.](./adding-pages-for-distributor-application/images/03.png)

これらのページは、ディストリビューター・アプリケーションのUIを構築するためのフレームワークを提供します。

現在は空っぽだ。 ゼロから始めるのではなく、提供されているフラグメントコンポジションをインポートして、アプリケーションの作成、表示、管理に必要なフラグメントやウィジェットを追加します。

次へ [ディストリビューターアプリケーションページのフラグメントのインポート](./importing-fragments-for-the-distributor-application-pages.md) 
