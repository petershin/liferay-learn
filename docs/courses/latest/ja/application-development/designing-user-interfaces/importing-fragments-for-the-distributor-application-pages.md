# ディストリビューター・アプリケーション・ページ用のフラグメントのインポート

パブリッシュされたオブジェクトはLiferayのコアフレームワークと統合されているので、フォームフラグメントやコレクションディスプレイフラグメントなどのオブジェクトエントリーにページフラグメントをマッピングすることができます。 ここでは、ディストリビューターのアプリケーションページで使用するために、あらかじめ設定されたフラグメントコンポジションをインポートします。 ただし、フラグメントをインポートする前に、提供されたフォームコンテナのオブジェクト ID を解凍し、インスタンスのディストリビュータアプリケーションオブジェクトの ID で更新してください。

## インポートするフラグメントの準備

1. ディストリビューター・アプリケーション・オブジェクトのIDを取得し、後で使用するために保存します。

   ![Begin editing the Distributor Application object and copy its ID.](./importing-fragments-for-the-distributor-application-pages/images/01.png)

1. [Distributor Application fragment set](./liferay-b2m3.zip) をダウンロードし、解凍します：

   ```bash
   curl https://resources.learn.liferay.com/courses/latest/en/application-development/designing-user-interfaces/liferay-b2m3.zip -O
   ```

   ```bash
   unzip liferay-b2m3.zip
   ```

1. このフォルダに移動します：`liferay-b2m3/fragment-compositions/application-form`。

1. `fragment-composition-definition.json`ファイルをコードエディターで開く。

1. className` にはこの値を入力し、`[OBJECT_ID]`をディストリビューターアプリケーションオブジェクトの ID に置き換えます:`com.liferay.object.model.ObjectDefinition#[OBJECT_ID]`.

   例えば、

   ```json
   "formReference": {
       "className": "com.liferay.object.model.ObjectDefinition#34844",
       "classType": 0
   }
   ```

6. ファイルを保存し、フラグメントセットをzipで圧縮する：

   ```bash
   zip distributor-application-fragment-set.zip liferay-b2m3 -r
   ```

これでフラグメントセットをサイトにインポートできる。

## フラグメントセットのインポート

1. [サイトメニュー](../../images/icon-product-menu.png) を開き、[デザイン] を展開し、[フラグメント] をクリックします。

1. Fragment Setsの **Actions**( ![Actions Button](../../images/icon-actions.png) ) をクリックし、 **Import** を選択します。

   ![Click the Actions button for Fragment Sets and click Import.](./importing-fragments-for-the-distributor-application-pages/images/02.png)

1. `distributor-application-fragment-set.zip`ファイルを選択し、 **Import** をクリックする。

   ![Select the distributor-application-fragment-set.zip file and click Import.](./importing-fragments-for-the-distributor-application-pages/images/03.png)

1. Distributor Application のフラグメントが正常にインポートされたことを確認します。 このセットには3つの断片が含まれているはずだ：

   * フォームページ
   * 成功ページ
   * 表示ページ

   ![Confirm the Distributor Application fragments imported successfully.](./importing-fragments-for-the-distributor-application-pages/images/04.png)

フラグメントをインポートしたら、それを使ってDistributor Applicationオブジェクトをページと統合することができます。

次へ [適用ページにフォームを追加する](./adding-the-form-to-the-apply-page.md) 

## 関連コンセプト

* [オブジェクトエントリーの表示](https://learn.liferay.com/web/guest/w/dxp/building-applications/objects/displaying-object-entries) 
* [フラグメントでフォームを構築する](https://learn.liferay.com/web/guest/w/dxp/building-applications/objects/using-fragments-to-build-forms)
