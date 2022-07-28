---
toc:
- ./configuring-mail/configuring-default-email-senders.md
- ./configuring-mail/alternative-email-configuration-methods.md
---

# メールの設定

```{toctree}
:maxdepth: 3

configuring-mail/configuring-default-email-senders.md
configuring-mail/alternative-email-configuration-methods.md
```

Liferay DXP/Portalは、メールサーバーを使用して、ユーザー登録とパスワード管理、サイトメンバーシップ通知、コンテンツの更新などのさまざまな目的で電子メール通知を送信するように設定できます。 この記事では、デモ目的として、Gmailをメールサーバーとして使用するように組み込みのDXPメールセッションを設定する手順を説明します。

```{warning}
カテゴリのメーリングリストに [IMAP](https://support.google.com/mail/answer/7126229?hl=en) プロトコルを使用している場合は、メッセージをメーリングリストのユーザーに送信する電子メールクライアントによってメッセージがプルされたときに [メッセージが削除されるようにIMAP受信トレイを設定](https://support.google.com/mail/answer/78892?hl=en) してください。 そうしないと、サーバーに保持されている各電子メールメッセージは、カテゴリに新しい投稿や更新があるたびにメーリングリストに送信されます。
```

## 組み込みメールセッションの設定

コントロールパネルからメールセッションを設定するには、次の手順に従います。

1. 管理ユーザー（[［Basic Configuration］ページ](../../getting-started/using-the-setup-wizard.md)で指定されたユーザー）としてサインインします。
1. *［Control Panel］ &rarr; ［Configuration］ &rarr; ［Server Administration］ &rarr; ［Mail］*に移動します。
1. [次のフィールド](#mail-configuration-reference) に値を入力します。

    * **［Incoming POP Server］:** pop.gmail.com
    * **Incoming Port：** 110
    * **Use a Secure Network Connection：**Flagged
    * **User Name：**joe.bloggs
    * **［Password］：** *****
    * **［Outgoing SMTP Server］：** smtp.gmail.com
    * **Outgoing Port：**465
    * **Use a Secure Network Connection：**Flagged
    * **User Name：**joe.bloggs
    * **［Password］：** *****
    * **［Manually specify additional JavaMail properties to override the above configuration］：** 指定する必要のある追加のプロパティがある場合は、ここで指定します。

    ![メールサーバーの設定](./configuring-mail/images/01.png)

1. *［保存］* をクリックします。

DXPがすぐにメールセッションに接続します。

## メール設定リファレンス

| 項目                                   | Description                                                                                   |
|:------------------------------------ |:--------------------------------------------------------------------------------------------- |
| 受信POPサーバ                             | Post Office Protocolを実行しているサーバーのホスト名。 DXPはこのメールボックスをチェックして、掲示板の返信などの受信メッセージを確認します。            |
| 受信ポート                                | POPサーバーがリスンしているポート。                                                                           |
| セキュアなネットワーク接続を使用する。                  | POPサーバーに接続するときに暗号化された接続の使用を有効にするチェックボックス。                                                     |
| ユーザー名                                | DXPがPOPサーバーへのログインに使用するユーザーID。                                                                 |
| パスワード                                | DXPがPOPサーバーへのログインに使用するパスワード。                                                                  |
| 送信SMTPサーバ                            | Simple Mail Transfer Protocolを実行しているサーバーのホスト名。 DXPはこのサーバーを使用して、パスワード変更メールやその他の通知などのメールを送信します。 |
| 送信ポート                                | SMTPサーバーがリスンしているポート。                                                                          |
| セキュアなネットワーク接続を使用する。                  | SMTPサーバーに接続するときに暗号化された接続を使用します。                                                               |
| ユーザー名                                | DXPがSMTPサーバーへのログインに使用するユーザーID。                                                                |
| パスワード                                | DXPがSMTPサーバーへのログインに使用するパスワード。                                                                 |
| 上記の設定を上書きする場合は、JavaMailの設定を指定してください。 | このフィールドは、追加のJavaMail設定用です。                                                                    |

## 追加情報

* [デフォルトのメール送信者の設定](./configuring-mail/configuring-default-email-senders.md)
* [代替の電子メールの設定方法](./configuring-mail/alternative-email-configuration-methods.md)