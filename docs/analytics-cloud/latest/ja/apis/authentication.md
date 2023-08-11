# 認証

アクセストークンはLiferay Analytics CloudへのAPIコールに必要です。 **Settings** &rarr; **APIs** に移動し、アクセストークンを生成します。

アクセストークンの有効期限（30日、6ヶ月、1年、無期限など）を選択します。 **Generate Token** をクリックする。

![有効期限を選択し、トークンの生成をクリックします。](authentication/images/01.png)

生成されたトークンは、選択した期間だけ有効です。 トークンの有効期限が切れると、追加のAPIコールを実行するために新しいトークンを生成する必要があります。

![新しいトークンが生成される。](authentication/images/02.png)

新しいトークンを使用するには、 **Copy**(![Copy](../images/icon-copy.png)) をクリックして、アクセストークンをクリップボードにコピーします。 APIコールのたびに、リクエストのauthorizationヘッダーにこれを追加する。 例えば、以下のようにcURLでリクエストヘッダを設定することができる：

```
curl -i -L -H "Authorization: Bearer {token}"
```

アクセストークンを削除するには、 **Revoke** をクリックします。
