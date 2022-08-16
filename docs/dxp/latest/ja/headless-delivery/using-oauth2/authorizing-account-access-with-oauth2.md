# OAuth2によるアカウントアクセスの認証

アプリケーションの登録が完了したら、ユーザーの認証を開始します。 そのためには、認可サーバー（Liferay DXP）へのURLを構築する必要があります。 認可サーバーは、前のチュートリアルでスコープとして見たように定義されたリソースに要求されたパーミッションを認可するようにユーザーに要求します。

## 認証コードフロー

最も一般的なOAuthフローは、Webアプリケーションで使用されるAuthorization Codeフローです。 このためのURLには、以下のリクエストパラメーターが必要です。

* `response_type`
* `client_id`

この認証のためのURLを構成するには、次のパターンに従います。

```
https://[hostname]/o/oauth2/authorize?response_type=code&client_id=[client ID]
```

クライアントIDは、アプリケーションを登録した際に得られるものです。 自動生成されます（アプリケーションを編集すれば変更可能です）。

ユーザーがリソースへの要求されたアクセス許可を承認すると、承認サーバーは、登録されたコールバックURI（別名リダイレクトURI）でアプリケーションに認証コードを クエリ文字列パラメーターとして返します。

```
［your callback URI］?code=［authorization server generated code］
```

アプリケーションは、このパターンに従ってPOSTリクエストを送信することで、この認証コードとアクセストークンを交換する必要があります。

```
http://localhost:8080/o/oauth2/token
```

```{important}
時々、「ウェブアプリケーション」という言葉が緩やかに使われ、上記のURLがウェブブラウザから直接要求されるようなアプリケーションを意味することがあります。 もしそうなれば、クライアントの秘密が漏れてしまい、グラントフローとアプリケーションのセキュリティが損なわれることになります。 そのような場合は、アプリケーションの登録時に、代わりに「User Agent Application」クライアントプロファイルを選択してください。 これにより、お客様のアプリケーションで安全な代替手段を利用することができます。PKCE Extended Authorization Codeフロー(下記参照)。
```

ボディに以下のパラメータを含む（ `application/x-www-form-urlencoded`としてエンコードされています）。

```
client_id=［client ID］ client_secret=［client secret］ grant_type=authorization_code code=［authorization server generated code］ redirect_uri=［registered callback URI］
```

このリクエストに対するHTTPレスポンスのボディには、次のようなJSONが格納されています。

```json
{
  "access_token": "［authorization server generated access token］",
  "token_type": "Bearer",
  "expires_in": 600,
  "scope": "［the scopes that were authorized by the user］",
  "refresh_token": "［authorization server generated refresh token］"
}
```

ここからアクセストークンを抽出し、永続化する必要があります。 トークンを無期限で使用する場合（上記の例では600秒以上）には、リフレッシュ・トークンも必要です。 これは、Refresh Token Flowと組み合わせて使用することで、さらなるユーザー認証を行うことなく、同じ権限を持つ新しいアクセストークンを取得することができます。 認可サーバーは、アプリケーション登録がこのフローに登録されている場合のみ、リフレッシュトークンを発行します。

## PKCE拡張認証コードフロー

このフローは、コード交換のための証明鍵（PKCE）を追加したもので、上記と同じです。 `code_challenge`という別のリクエストパラメーターが必要です。 このフローは、スマートフォンアプリケーションのように、ユーザー認証後に認証サーバーからリダイレクトされたURL（およびリクエストパラメータ）に単独でアクセスできない可能性があるクライアントのためのものです。 同じシステム上にある悪意のあるアプリケーションが、レスポンスコードを読み取ることで自身を認証することを防ぐことができます。 そのために、クライアントアプリケーションは、認証要求とともに、自分だけが知っている生成した文字列である **コードチャレンジ** を送信します。 この文字列を生成するためには、まず **Code Verifier** と呼ばれる別の秘密文字列を作成し、それに変換を施す必要がある。 認証後、コードベリファイアが認証コードとともに送信され、クライアントを検証する。

これを行う方法の詳細は、 [PKCE仕様](https://tools.ietf.org/html/rfc7636) を参照してください。

このフローをサポートするには、アプリケーションの作成時に、Allowed Authorization TypeとしてPKCEを定義しておく必要があります。 これは、Native ApplicationおよびUser Agent Applicationのクライアントプロファイルの一部です。 PKCEを使用して認証コードを要求するには、 `code_challenge` リクエストパラメータを含むURLを使用します。

```
https://［hostname］/o/oauth2/authorize?response_type=code&client_id=［client ID］&code_challenge=［PKCE code challenge］
```

アクセストークンを取得するための最後のリクエストを行う際に、以下のパラメータも提供する必要があることを除いて、残りの処理はAuthorization Codeのフローと同じです。

```
code_verifier=［Code Verifier that was transformed and sent as code_challenge previously］
```

## クライアント認証とリソース所有者のフロー

その他に、あまり使われていないフローが2つあります。 2つのサーバーが合意された、ユーザー中心でないデータを交換するシナリオがある場合は、ユーザーの［Allow/Deny］画面をバイパスして、クライアントを承認できます。 これはClient Credentialsフローと呼ばれ、このURLパターンを使用することになる。

```
https://［hostname］/o/oauth2/token?grant_type=client_credentials&client_id=［client ID］&client_secret=［client secret］
```

最終的に、ユーザーがアプリケーションにパスワードを託すという流れは、まれではありますが、あり得ます。 これはResource Owner Passwordフローと呼ばれ、そのURLパターンは次のようになる。

```
https://［hostname］/o/oauth2/token?grant_type=password&client_id=［client ID］&client_secret=［client secret］&username=［user@emailaddress.com］&password=
```

ユーザーはパスワードの入力を求められ、ログインに成功すると認証コードを受け取ります。

## トークン使用

上記のすべてのフローは、認可サーバー（Liferay）からクライアントアプリケーションに送信されるアクセストークンを生成します。 このトークンはレスポンスとして送信され、クライアントアプリケーションはこれを保存し、今後データを要求する際に送信することができます。

例えば、認証コード `946856e2b5ddf0928f6fc55f657bab73` がクライアントアプリケーションに送信されたとする。 クライアントがデータを要求するとき、このコードを各リクエストヘッダで送信する必要があります。 CurlなどのコマンドラインHTTPクライアントを使用すると、次のようなリクエストを送ることができます。

```
curl -H 'Authorization: Bearer 946856e2b5ddf0928f6fc55f657bab73' 'https://［hostname］/o/api/sample2'
```

OAuth 2.0は、クライアントアプリケーションが、クレデンシャル情報を共有することなく、ユーザーから特定のサービス（スコープ）へのアクセスを許可される便利な方法を提供します。

## アクセス権の剥奪

一度アクセス権が付与されると、ユーザーまたは管理者はいつでも自由にアクセス権を取り消すことができます。 このようなことがクライアントに起こった場合、トークンは無効となり、クライアントはユーザーに再度認証を求める必要があります。 これにより、ユーザーは自分のデータにアクセスできる者をコントロールすることができ、いつでもこのコントロールを行使することができます。

![ユーザーは、自分のアカウントプロファイル内のデータにアクセスできるアプリケーションを完全に制御できます。](./authorizing-account-access-with-oauth2/images/01.png)

ユーザーは自分のアカウント領域で、 ［**接続済みのアプリケーション**］ をクリックして、自分のアカウントへのアクセスを許可したアプリケーションのリストを表示できます。 ここから、アクションメニューの ［**Remove Access**］ アイテムまたはアプリケーションの詳細画面の ［**Remove Access**］ ボタンをクリックして、アクセスを取り消すことができます。

![［接続済みのアプリケーション］では、ユーザーは承認されたアプリを表示してアクセスを取り消すことができます。](./authorizing-account-access-with-oauth2/images/02.png)

管理者は、 ［**コントロールパネル**］ &rarr; ［**設定**］ &rarr; ［**OAuth2 管理**］ の任意のアプリの［権限］タブで権限を表示できます。  アプリが信頼されている場合、または［Remember My Authorization］チェックボックスがオンになっている場合は、その情報が表示されます。

![アプリのすべての権限は、アプリの［権限］タブに表示されます。](./authorizing-account-access-with-oauth2/images/03.png)

リストされている承認の ［**Revoke**］ ボタンをクリックすると、そのユーザーのアカウントへのそのアプリケーションのアクセスが取り消されます。

## 概要

OAuth 2.0は、ユーザーが認証情報を共有することなく、完全かつ安全な認証フローを提供します。 OAuth 2.0は、ユーザーや開発者が必要な情報にアクセスするための便利な方法です。
