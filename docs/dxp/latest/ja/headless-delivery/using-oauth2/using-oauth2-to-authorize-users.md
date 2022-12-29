# OAuth2によるユーザーの認証

OAuth 2.0の認証プロトコルを使用してLiferayのヘッドレスREST APIにアクセスするアプリケーションを作成することができます。 提供されているサンプルReactアプリは、OAuth2トークンベースの3種類の認証フロー（認証コードフロー、クライアント認証フロー、パスワードフロー）をデモしています。 OAuth2 管理パネルの詳細については、 [OAuth2 アプリケーションの作成](./creating-oauth2-applications.md)を参照してください。

## Liferay DXPのセットアップ

```{include} /_snippets/run-liferay-dxp.md
```

1. Open the **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) and navigate to **Control Panel** &rarr; **Security** &rarr; **OAuth 2 Administration** .

1. Click **Add**(![Add Icon](../../images/icon-add.png)) to create a new OAuth2 application. 

1. Give the application a name (e.g., foo). Set the Website URL as `http://localhost:3000` and the Callback URI as `http://localhost:3000/grant-type-authorization-code`. Click **Save** .

   ![Fill out the form to the create a new OAuth2 application.](./using-oauth2-to-authorize-users/images/01.png)

1. Copy the Client ID and Client Secret to your clipboard. To get the Client Secret click **Edit** . Copy the value from the pop-up window.

   These values are needed later in the sample React app. 

1. Click the **Scopes** tab at the top of the page. Scroll down, click **LIFERAY.HEADLESS.ADMIN.USER** , then check the box for **read data on your behalf** . 

   ![Enable read privileges for LIFERAY.HEADLESS.ADMIN.USER.](./using-oauth2-to-authorize-users/images/02.png)

   Click **Save** . Your OAuth2 Application now has read privileges for the Admin User API category.

1. Next, open the **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)), click the **Control Panel** tab, and go to **System Settings** &rarr; **Security Tools** .

1. Go to the **Portal Cross-Origin Resource Sharing (CORS**) tab and click **Default Portal CORS Configuration** .

1. Add a **URL Pattern** with the value `/o/headless-admin-user/*` and click **Save** . This enables CORS for the `headless-admin-user` category of APIs.

## Deploy the Sample React App

1. [OAuth2 React App](./liferay-c2b6.zip) をダウンロードし、解凍してください。

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/headless-delivery/using-oauth2/liferay-c2b6.zip -O
   ```

   ```bash
   unzip liferay-c2b6.zip
   ```

   ```bash
   cd liferay-c2b6.zip
   ```

1. `ノード` と `ヤーン` がインストールされていることを確認します。 そうでない場合は、セットアップスクリプトを実行し、プロンプトに従います。

   ```bash
   ./setup_tutorial.sh
   ```

1. アプリの設定ファイルに、Liferay OAuth Client IDとClient Secretを追加します。 `grant-type-authorization-code`の `utils` フォルダに移動する。

   ```bash
   cd liferay-c2b6.zip/c2b6-remote-app/src/grant-type-authorization-code/utils
   ```

   `config.js` ファイルを開き、Client ID と Client Secret の値を追加します。 `config.js` file in `grant-type-client-credentials` folder and `grant-type-password` folder にも同じことをします。

1. アプリのルートディレクトリに戻り、Reactサーバーを起動します。

   ```bash
   cd liferay-c2b6.zip/c2b6-remote-app
   ```

   ```bash
   yarn start
   ```

### 認証コードのフロー

認可コードフローでは、アプリに許可を与える前に、ユーザーが認証情報でログインし、認可を承認する必要があります。 他のフローでは、この追加ステップを回避することができます。

1. <http://localhost:3000>で動作しているReactアプリを開き、ページ上部の **Authorization Code Flow** をクリックします。 **Authorize** をクリックします。

   ![認証コードフローで、［認証］ボタンをクリックします。](./using-oauth2-to-authorize-users/images/03.png)

1. まだログインしていない場合、認証ページに飛ぶ前にLiferayのログインページにリダイレクトされます。 ユーザー名とパスワード（例： **test@liferay.com:learn**）を入力し、 **サインイン** をクリックします。 認証ページで、 **認証する** をクリックします。 すでにログインしている場合は、直接認証ページに移動します。

1. Reactアプリにリダイレクトされます。 **Get Authorization Code** をクリックし、 **Get Token** をクリックします。 アプリケーションは Liferay にアクセストークンを要求します。

1. **Get Users** をクリックします。 React アプリは、トークン・ベースの認証を使用して Liferay に REST API 呼び出しを行い、Liferay ユーザーのリストを返します。

### クライアント認証フロー

クライアント認証フローは、通常、サーバー間のやり取りに使用され、ユーザーは関与しない。

1. <http://localhost:3000>で実行中のReactアプリを開き、ページ上部の **Client Credentials Flow** をクリックします。

1. **Get Token** をクリックします。 アプリケーションは Liferay にアクセストークンを要求します。

1. **Get Users** をクリックします。 React アプリは、トークン・ベースの認証を使用して Liferay に REST API 呼び出しを行い、Liferay ユーザーのリストを返します。

### パスワードの流れ

パスワードフローの認証では、Reactアプリはユーザー名とパスワードをリクエストで直接渡します。

```{warning}
パスワードフローでは、ユーザー名とパスワードはアプリケーションに直接公開されます。 そのため、ユーザーはアプリケーションを信頼する必要があります。 APIリクエストでユーザー名とパスワードを渡すこともリスクを伴います。 パスワードフローを使用することは推奨されません。
```

1. <http://localhost:3000>で動作しているReactアプリを開き、ページ上部の **パスワードフロー** をクリックします。

1. **Get Token** をクリックします。 アプリケーションは Liferay にアクセストークンを要求します。

1. **Get Users** をクリックします。 React アプリは、トークン・ベースの認証を使用して Liferay に REST API 呼び出しを行い、Liferay ユーザーのリストを返します。

## コードを調べる

Reactアプリには3つのルートがあり、それぞれ異なる認証フローにつながります。 各経路/フローの設定ファイルは、別々のフォルダーにあります。 各ルートの `components` フォルダには、ボタンをクリックしたときに発生するイベントを処理するための UI 要素が定義されています。 例えば、 `Authorize.js` ファイルは認証ページにリダイレクトし、 `Token.js` はアクセストークンを取得し、 `Users.js` はユーザーのリストを取得します。 各ルートの `utils` フォルダには、 `config.js` と `requests.js` ファイルが格納されています。

```
src
├── grant-type-authorization-code
│   ├── components
│   |   ├── Authorize.js
│   |   ├── Token.js
│   |   └── Users.js
│   ├── utils
│   |   ├── config.js
│   |   └── Requests.js
│   └── AuthorizationCode.js
├── grant-type-client-credentials
│   ├── components
│   |   ├── Token.js
│   |   └── Users.js
│   ├── utils
│   |   ├── config.js
│   |   └── Requests.js
│   └── ClientCredentials.js
├── grant-type-password
│   ├── components
│   |   ├── Token.js
│   |   └── Users.js
│   ├── utils
│   |   ├── config.js
│   |   └── Requests.js
│   └── Password.js
├── App.js
└── index.js
```

### 承認 補助金の種類

`grant-type-authorization-code`では、最初のステップは `Authorize.js` ファイルによって処理される。 **Authorize** ボタンをクリックすると、認証要求が行われます。

```{literalinclude} ./securing-your-app-with-oauth2/resources/liferay-c2b6-overlay/src/grant-type-authorization-code/components/Authorize.js
:language: javascript
:lines: 6-18
```

標準の `clientId` と `clientSecret`に加えて、 `redirectUri` も `config.js` ファイルに必要です。 アプリケーションを認証した後、Liferayサーバーはユーザーをアプリの認証コードフローページにリダイレクトさせます。 リダイレクトと同時に、ワンタイム認証コードがURL内でアプリに引き渡されます（例： `http://localhost:3000/grant-type-authorization-code?code={code}`）。

**Get Authorization Code** をクリックすると、 `getCode` 関数が呼び出され、認証コードが解析されます。 そして、アクセストークンのリクエストで渡すことができる。

```{literalinclude} ./securing-your-app-with-oauth2/resources/liferay-c2b6-overlay/src/grant-type-authorization-code/components/Authorize.js
:language: javascript
:lines: 20-26
```

**Get Token** をクリックすると、 `Requests.js` ファイル内の `getAuthToken` 関数が呼び出されます。

```{literalinclude} ./securing-your-app-with-oauth2/resources/liferay-c2b6-overlay/src/grant-type-authorization-code/utils/Requests.js
:language: javascript
:lines: 3-29
```

このAPIリクエストでは、パラメータ `client_id`, `client_secret`, `code`, `grant_type`, and `redirect_uri` が送信されます。 パラメータが有効な場合、Liferay はアクセストークンを含む JSON 応答を返します。

回答例

```json
{
    "access_token": "2fda85abec524112dae612d35e9f9abd71650d364dee47c645b7574c6bffe91",
    "token_type": "Bearer",
    "expires_in": 600,
    "scope": "Liferay.Headless.Admin.User.everything.read"
}
```

`Users.js` ファイルは、 `access_token`のレスポンスを解析しています。

最後に、 **Get Users** をクリックすると、 `Requests.js` ファイル内の `getUsers` 関数が呼び出されます。

```{literalinclude} ./securing-your-app-with-oauth2/resources/liferay-c2b6-overlay/src/grant-type-authorization-code/utils/Requests.js
:language: javascript
:lines: 31-42
```

アクセストークンは、APIリクエストのヘッダーに `'Authorization': 'Bearer'` type authorizationとして渡されます。

### クライアント認証情報 グラントタイプ

`grant-type-client-credentials`において、 `Request.js` ファイルの `getAuthToken` 関数は、 **Get Token** ボタンがクリックされたときに呼び出されます。

```{literalinclude} ./securing-your-app-with-oauth2/resources/liferay-c2b6-overlay/src/grant-type-client-credentials/utils/Requests.js
:language: javascript
:lines: 3-27
```

このAPIリクエストでは、パラメータ `client_id`, `client_secret`, `grant_type` が送信されます。 パラメータが有効な場合、Liferay はアクセストークンを含む JSON 応答を返します。

`Users.js` ファイルは、 `access_token`のレスポンスを解析しています。

最後に、 **Get Users** をクリックすると、 `Requests.js` ファイル内の `getUsers` 関数が呼び出されます。

```{literalinclude} ./securing-your-app-with-oauth2/resources/liferay-c2b6-overlay/src/grant-type-client-credentials/utils/Requests.js
:language: javascript
:lines: 29-40
```

アクセストークンは、APIリクエストのヘッダーに `'Authorization': 'Bearer'` type authorization として渡されます。

### パスワード付与の種類

`grant-type-password`において、 `Request.js` ファイルの `getAuthToken` 関数は、 **Get Token** ボタンがクリックされたときに呼び出されます。

```{literalinclude} ./securing-your-app-with-oauth2/resources/liferay-c2b6-overlay/src/grant-type-password/utils/Requests.js
:language: javascript
:lines: 3-29
```

`client_id`, `client_secret`, `grant_type`, `password`, `username` が、この API リクエストのパラメーターとして送信されます。 パラメータが有効であれば、Liferayサーバーはアクセストークンを含むJSONレスポンスを返します。

`Users.js` ファイルは、 `access_token`のレスポンスを解析しています。

最後に、 **Get Users** をクリックすると、 `Requests.js` ファイル内の `getUsers` 関数が呼び出されます。

```{literalinclude} ./securing-your-app-with-oauth2/resources/liferay-c2b6-overlay/src/grant-type-password/utils/Requests.js
:language: javascript
:lines: 31-42
```

アクセストークンは、APIリクエストのヘッダーに `'Authorization': 'Bearer'` type authorization として渡されます。

## 追加情報

* [OAuth 2.0を使用する](../using-oauth2.md)
* [OAuth2アプリケーションの作成](./creating-oauth2-applications.md)
* [OAuth2によるアカウントアクセスの承認](./authorizing-account-access-with-oauth2.md)
* [OAuth 2のスコープ](./oauth2-scopes.md)
