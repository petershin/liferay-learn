# OAuth2によるユーザーの認証

OAuth 2.0の認証プロトコルを使用してLiferayのヘッドレスREST APIにアクセスするアプリケーションを作成できます。 提供されているサンプルReactアプリは、OAuth2トークンベースの3種類の認証フロー（認証コードフロー、クライアント認証情報フロー、パスワードフロー）のデモを実行しています。 OAuth2 管理パネルの詳細については、 [OAuth2 アプリケーションの作成](./creating-oauth2-applications.md)を参照してください。

## Liferay DXPのセットアップ

```{include} /_snippets/run-liferay-dxp.md
```
1. グローバルメニュー(![グローバルメニュー](../../images/icon-applications-menu.png))を開き、 **コントロールパネル** &rarr; **セキュリティ** &rarr; **OAuth 2管理** に移動します。

1. 追加* (![アイコン追加](../../images/icon-add.png)) をクリックして、新しい OAuth2 アプリケーションを作成します。

1. アプリケーションに名前をつける（例：foo）。Website URLを`http://localhost:3000`、Callback URIを`http://localhost:3000/grant-type-authorization-code`に設定します。**Save**をクリックします。

   新しいOAuth2アプリケーションを作成するためのフォームを記入してください](./using-oauth2-to-authorize-users/images/01.png)

1. Client IDとClient Secretをクリップボードにコピーします。Client Secretを取得するには、 **Edit** をクリックします。ポップアップウィンドウに表示された値をコピーします。

   これらの値は、サンプルのReactアプリで後ほど必要になります。

1. ページ上部にある **Scopes** タブをクリックします。下にスクロールし、 **LIFERAY.HEADLESS.ADMIN.USER** をクリックし、 **read data on your behalf** のチェックボックスをオンにします。

   LIFERAY.HEADLESS.ADMIN.USERの読み取り権限を有効にする](./using-oauth2-to-authorize-users/images/02.png)

   **Save**をクリックします。OAuth2アプリケーションに、Admin User APIカテゴリの読み取り権限が付与されました。

1. 次に、 **グローバルメニュー**(![グローバルメニュー](../../images/icon-applications-menu.png))を開き、 **コントロールパネル** タブをクリックして、 **システム設定** &rarr; **セキュリティツール** に進みます。

1. **Portal Cross-Origin Resource Sharing (CORS)** タブをクリックし、 **Default Portal CORS Configuration** をクリックします。

1. 値 `/o/headless-admin-user/*` を持つ **URL Pattern** を追加し、 **Save** をクリックします。これで、`headless-admin-user`カテゴリのAPIに対してCORSが有効になります。

## サンプルReactアプリのデプロイ

1. OAuth2 React App](./liferay-c2b6.zip)をダウンロードし、解凍してください。

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/headless-delivery/using-oauth2/liferay-c2b6.zip -O
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

1. アプリのルートディレクトリに移動し、Reactサーバーを起動します。

   ```bash
   cd c2b6-custom-element
   ```

   ```bash
   yarn install && yarn start
   ```

### 認証コードのフロー

認証コードフローでは、アプリケーションに権限を与える前に、ユーザーが認証情報でログインし、認証を承認する必要があります。 他のフローでは、この追加ステップを回避することができます。

1. <http://localhost:3000>で動作しているReactアプリを開き、ページ上部の **Authorization Code Flow** をクリックします。

1. Liferay authorize URL には `http://localhost:8080/o/oauth2/authorize` を入力します。 クリップボードからクライアントIDを貼り付けます。 ［**Authorize**］ をクリックします。

1. まだログインしていない場合、認証ページに移動する前にLiferayのログインページにリダイレクトされます。 ユーザー名とパスワード（例： **test@liferay.com:learn**）を入力し、 ［**サインイン**］ をクリックします。 認証ページで、 ［**認証する**］ をクリックします。 すでにログインしている場合は、認証ページに直接送られます。

   ![Authorizez_」をクリックして、アプリケーションを認証します。](./using-oauth2-to-authorize-users/images/03.png)

   Reactアプリにリダイレクトされます。 次のAPI呼び出しに使用される認証コードが表示されることに注意してください。

1. Liferay トークンの URL には、 `http://localhost:8080/o/oauth2/token` を入力します。 クリップボードからクライアントID、クライアントシークレットを貼り付ける。 ［**Get Token**］ をクリックします。 今後REST APIを呼び出す際に使用できる認証トークンが表示されることに注意してください。

1. Liferay の get user URL には `http://localhost:8080/o/headless-admin-user/v1.0/user-accounts` を入力します。 ［**Get Users**］ をクリックします。 React アプリは、トークン・ベースの認証を使用してLiferayにREST API呼び出しを行い、Liferayユーザーのリストを返します。

   ![Liferay のユーザー一覧が表示されます。](./using-oauth2-to-authorize-users/images/04.png)

### クライアント認証情報フロー

クライアント認証情報フローは、通常、サーバー間のやり取りに使用され、ユーザーは関与しません。

1. <http://localhost:3000>で実行中のReactアプリを開き、ページ上部の ［**Client Credentials Flow**］ をクリックします。

1. Liferay トークンの URL には、 `http://localhost:8080/o/oauth2/token` を入力します。 クリップボードからクライアントID、クライアントシークレットを貼り付ける。 ［**Get Token**］ をクリックします。 今後REST APIを呼び出す際に使用できる認証トークンが表示されることに注意してください。

1. Liferay の get user URL には `http://localhost:8080/o/headless-admin-user/v1.0/user-accounts` を入力します。 ［**Get Users**］ をクリックします。 React アプリは、トークン・ベースの認証を使用してLiferayにREST API呼び出しを行い、Liferayユーザーのリストを返します。

### パスワードフロー

パスワードフローの認証では、Reactアプリはユーザー名とパスワードをリクエストで直接渡します。

```{warning}
パスワードフローでは、ユーザー名とパスワードはアプリケーションに直接公開されます。 そのため、ユーザーはアプリケーションを信頼する必要があります。 APIリクエストでユーザー名とパスワードを渡すこともリスクを伴います。 パスワードフローを使用することは推奨されません。
```

1. <http://localhost:3000>で実行中のReactアプリを開き、ページ上部の ［**Password Flow**］ をクリックします。

1. Liferay トークンの URL には、 `http://localhost:8080/o/oauth2/token` を入力します。

1. クリップボードからクライアントID、クライアントシークレットを貼り付ける。

1. ユーザー名とパスワードを入力します（例： **test@liferay.com:learn**）。

1. ［**Get Token**］ をクリックします。 今後REST APIを呼び出す際に使用できる認証トークンが表示されることに注意してください。

1. Liferay get user URL には `http://localhost:8080/o/headless-admin-user/v1.0/user-accounts` を入力します。 ［**Get Users**］ をクリックします。 React アプリは、トークン・ベースの認証を使用してLiferayにREST API呼び出しを行い、Liferayユーザーのリストを返します。

## コードを調べる

Reactアプリの `components` フォルダには、UI要素と、ボタンをクリックすることで発生するイベントを処理するためのロジックが定義されています。 例えば、 `Authorize.js` ファイルは認証ページにリダイレクトし、 `Token.js` はアクセストークンを取得し、 `Users.js` はユーザーのリストを取得します。 各認証フローは、これらのコンポーネントの一部または全部を使用する。

認証トークンを取得するAPIリクエストとユーザーを取得するリクエストは、 `utils` フォルダ内の `Requests.js` ファイルで定義されています。

```
src
├── components
│   ├── Authorize.js
│   ├── Token.js
│   ├── Users.js
├── routes
│   ├── grant-type-authorization-code
│   |   ├── AuthorizeCode.js
│   ├── grant-type-client-credentials
│   |   ├── ClientCredentials.js
│   ├── grant-type-password
│   |   ├── Password.js
├── utils
│   ├── Requests.js
├── App.js
└── index.js
```

### 認証許可タイプ

`grant-type-authorization-code` フローの `AuthorizeCode.js` ファイルは、3つのコンポーネント（`Authorize.js`, `Token.js`, `Users.js`）すべてを使用しています。

```{literalinclude} ./using-oauth2-to-authorize-users/resources/liferay-c2b6-overlay/src/routes/grant-type-authorization-code/AuthorizationCode.js
:language: javascript
:lines: 16-35
```

コードでは、 `Authorize.js` コンポーネントが最初のステップを処理します。 ［**Authorize**］ ボタンをクリックすると、認証要求が行われます。

```{literalinclude} ./using-oauth2-to-authorize-users/resources/liferay-c2b6-overlay/src/components/Authorize.js
:language: javascript
:lines: 3-67
```

リダイレクトと同時に、ワンタイム認証コードがURL内でアプリに引き渡されます（例： `http://localhost:3000/grant-type-authorization-code?code={code}`）。

`Token.js` コンポーネントが次のステップを処理します。 ［**Get Token**］ をクリックすると、 `Requests.js` ファイル内の `getAuthToken` 関数が呼び出されます。

```{literalinclude} ./using-oauth2-to-authorize-users/resources/liferay-c2b6-overlay/src/components/Token.js
:language: javascript
:lines: 3-98
```

`Token.js` コンポーネントでは、パラメータ `client_id`, `client_secret`, `code`, `grant_type`, `redirect_uri` がこの API 要求で送信されます。 パラメータが有効であれば、Liferayはアクセストークンを含むJSONレスポンスを返します。

応答例：

```json
{
    "access_token": "2fda85abec524112dae612d35e9f9abd71650d364dee47c645b7574c6bffe91",
    "token_type": "Bearer",
    "expires_in": 600,
    "scope": "Liferay.Headless.Admin.User.everything.read"
}
```

`Users.js` コンポーネントは、 `access_token`のレスポンスを解析する。

最後に、 ［**Get Users**］ をクリックすると、`Requests.js`ファイル内の`getUsers`関数が呼び出されます。

### クライアント認証情報許可タイプ

`grant-type-client-credentials` フローの `ClientCredentials.js` ファイルは、2 つのコンポーネント（すなわち `Token.js` と `Users.js`）を使っている。

```{literalinclude} ./using-oauth2-to-authorize-users/resources/liferay-c2b6-overlay/src/routes/grant-type-client-credentials/ClientCredentials.js
:language: javascript
:lines: 6-31
```

`Token.js` コンポーネントでは、パラメータ `client_id`, `client_secret`, `grant_type` が API リクエストで送信されます。 パラメータが有効であれば、Liferayはアクセストークンを含むJSONレスポンスを返します。

`Users.js` コンポーネントは、 `access_token`のレスポンスを解析する。

最後に、 ［**Get Users**］ をクリックすると、`Requests.js`ファイル内の`getUsers`関数が呼び出されます。

### パスワード許可タイプ

`grant-type-password` フローの `Password.js` ファイルは、2つのコンポーネント（すなわち `Token.js` と `Users.js`）を使用する。

```{literalinclude} ./using-oauth2-to-authorize-users/resources/liferay-c2b6-overlay/src/routes/grant-type-password/Password.js
:language: javascript
:lines: 6-31
```

`Token.js` コンポーネントでは、パラメータ `client_id`, `client_secret`, `grant_type`, `password`, `username` を API リクエストのパラメータとして送信します。 パラメータが有効であれば、Liferayサーバーはアクセストークンを含むJSONレスポンスを返します。

`Users.js` コンポーネントは、 `access_token`のレスポンスを解析する。

最後に、 ［**Get Users**］ をクリックすると、`Requests.js`ファイル内の`getUsers`関数が呼び出されます。

## 追加情報

* [OAuth 2.0の使用](../using-oauth2.md)
* [OAuth2アプリケーションの作成](./creating-oauth2-applications.md)
* [OAuth2によるアカウントアクセスの承認](./authorizing-account-access-with-oauth2.md)
* [OAuth 2のスコープ](./oauth2-scopes.md)
