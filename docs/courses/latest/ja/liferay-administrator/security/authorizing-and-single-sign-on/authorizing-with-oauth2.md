# OAuth2による認証

LiferayのOAuth2ツールを使って、サードパーティのアプリケーションにデータへのアクセスを許可します。 例えば、Delectable Bonsaiのパートナーは、メープルシロップ製品を最新の価格で販売したいと考えている。 彼らはDelectable Bonsaiに価格リストAPIへのアクセスを要求する。 以下の手順で、実際に見てみよう。

## OAuth2の設定

1. **Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)) を開き、** Control Panel **&rarr;** Security **&rarr;** OAuth 2 Administration_に移動します。

1. **Add**(![Add Icon](../../../images/icon-add.png)) をクリックして、新しい OAuth2 アプリケーションを作成します。

1. アプリケーションに名前をつけます（例：foo）。 ウェブサイトのURLを `http://localhost:3000` に、コールバックURIを `http://localhost:3000/grant-type-authorization-code`に設定する。 ［**Save**］ をクリックします。

1. クライアントIDとクライアントシークレットをクリップボードにコピーします。 クライアント・シークレットを取得するには、 **Edit** をクリックします。 ポップアップウィンドウから値をコピーします。 これらの値は、サンプルのReactアプリで後ほど必要になります。

1. ページ上部の **Scopes** タブをクリックします。 下にスクロールし、 **LIFERAY.HEADLESS.COMMERCE.ADMIN.PRICING** をクリックし、 **read data on your behalf** にチェックを入れる。

   ![LIFERAY.HEADLESS.COMMERCE.ADMIN.PRICINGの読み取り権限を有効にする。](./authorizing-with-oauth2/images/01.png)

   ［**Save**］ をクリックします。 これで、OAuth2 アプリケーションに commerce pricing API カテゴリの読み取り権限が付与されました。

1. 次に、 **Global Menu**(![Global Menu](../../../images/icon-applications-menu.png)) を開き、 **Control Panel** タブをクリックし、 **System Settings** &rarr; **Security Tools** に進みます。

1. ［**Portal Cross-Origin Resource Sharing (CORS**)］ タブで、 ［**Default Portal CORS Configuration**］ をクリックしてください。

1. `/o/headless-commerce-admin-pricing/*` の値で **URL パターン** を追加し、 **保存** をクリックします。 これにより、 `headless-commerce-admin-pricing` カテゴリのAPIのCORSが有効になります。

## サンプルReactアプリをデプロイする

1. [OAuth2 React App](https://resources.learn.liferay.com/dxp/latest/en/headless-delivery/using-oauth2/liferay-c2b6.zip) をダウンロードして解凍する。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/headless-delivery/using-oauth2/liferay-c2b6.zip -O
   ```

   ```bash
   unzip liferay-c2b6.zip
   ```

   ```bash
   cd liferay-c2b6
   ```

1. `node`と`yarn`がインストールされていることを確認します。 そうでない場合は、セットアップスクリプトを実行し、プロンプトに従います。

   ```bash
   ./setup_tutorial.sh
   ```

1. アプリのルート・ディレクトリに移動し、Reactサーバーを起動する。

   ```bash
   cd c2b6-custom-element
   ```

   ```bash
   yarn install && yarn start
   ```

1. `http://localhost:3000`で実行中のReactアプリを開く。 **認証コードフロー** をクリックする。

1. Liferay authorize URL には `http://localhost:8080/o/oauth2/authorize` と入力します。 クリップボードからクライアントIDを貼り付けます。 ［**Authorize**］ をクリックします。

1. まだログインしていない場合、認証ページに移動する前にLiferayのログインページにリダイレクトされます。 ユーザー名とパスワード（例： **test@liferay.com:learn**）を入力し、 ［**サインイン**］ をクリックします。 認証ページで、 ［**認証する**］ をクリックします。 すでにログインしている場合は、認証ページに直接送られます。

1. Liferay トークンの URL には `http://localhost:8080/o/oauth2/token` と入力してください。 クライアントIDとクライアントシークレットをクリップボードから貼り付けます。 ［**Get Token**］ をクリックします。

1. リクエストURLには `http://localhost:8080/o/headless-commerce-admin-pricing/v1.0/priceLists` と入力する。 **Get Data** をクリックする。

   ![価格表はReactアプリに表示されます。](./authorizing-with-oauth2/images/02.png)

次へ [アンチサミーの管理](../managing-antisamy.md)

## 関連コンセプト

- [OAuth2の利用](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2)
- [OAuth2アプリケーションの作成](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2/creating-oauth2-applications)
