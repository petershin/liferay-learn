# 掲示板カテゴリのメーリングリストの設定

この記事では、 **サイトスコープ** または **ページスコープの掲示板** で掲示板のカテゴリのメーリングリストを設定する方法について説明します。 スコープの使用方法については、 [メッセージボードのスコープ](./scoping-your-message-boards.md) の記事を参照してください。 グローバルスコープの掲示板は、サブスクリプションとメーリングリストをサポートしていません。 掲示板の全てのカテゴリに独自のメーリングリストを作成できます。

## 前提条件

掲示板アプリのメールリストを構成する前に、DXPインスタンス全体のメール サーバーを構成する一般的な手順については、 [メールの設定](../../../installation-and-upgrades/setting-up-liferay/configuring-mail.md) の記事を参照してください。

## 掲示板カテゴリにメーリングリストを追加する

掲示板カテゴリにメーリングリストを追加するには：

1. ［**Message Boards**］ ウィジェットで、カテゴリ（この例では **Category 1**）の隣にある **アクション**（![Actions](../../../images/icon-actions.png)）アイコンをクリックします。

    ![カテゴリの編集](./configuring-a-message-boards-category-mailing-list/images/02.png)

1. 既存のカテゴリを変更するには、 ［**Edit**］ をクリックします。
1. ［**Mailing List**］ セクションを展開します。
1. ［**Active**］ トグルを ［**YES**］ に切り替えます。
1. ［**Allow Anonymous Emails**］ トグルは ［**NO**］ のままにします。

    ![カテゴリメーリングリストの設定](./configuring-a-message-boards-category-mailing-list/images/01.png)

1. 次のように入力します：

   * **メールアドレス** : このカテゴリ専用のメールアドレスまたはエイリアス（例: replies@lunar-resort.com）
   * **プロトコル** : POP
   * **サーバー名** : メールサーバーのホスト名
   * **サーバポート** : メールサービスが動作しているポート(110)です。
   * **安全なネットワーク接続を使用する** : 該当する場合はチェックします。
   * **ユーザー名** : info@lunar-resort.com
   * **パスワード** ： *****
   * **読み込み間隔(分**) : 5
   * **メメールアドレス（送信**） : メールでカテゴリーに返信させたい場合は、同じメールを使用します。
   * **カスタム出力サーバを利用する** : グローバルデフォルトと異なるメールサーバーを使用する場合は空白にしてください。

1. ［**保存**］ をクリックします。

メーリングリストがこのカテゴリでアクティブになりました。 このカテゴリに登録したユーザーは、カテゴリ内の新しいスレッドに関するメール通知を受け取るようになりました。

```{important}
カテゴリのメーリングリストに [IMAP](https://support.google.com/mail/answer/7126229?hl=en) プロトコルを使用している場合は、メッセージをメーリングリストのユーザーに送信する電子メールクライアントによってメッセージがプルされたときに [メッセージが削除されるようにIMAP受信トレイを設定](https://support.google.com/mail/answer/78892?hl=en) してください。 そうしないと、サーバーに保持されている各電子メールメッセージは、カテゴリに新しい投稿や更新があるたびにメーリングリストに送信されます。
```

## 関連情報

* [メールの設定](../../../installation-and-upgrades/setting-up-liferay/configuring-mail.md)
* [掲示板カテゴリの作成](./creating-message-boards-categories.md)
