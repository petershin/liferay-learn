# サーバー管理と電子メール

サーバー管理コンソールからLiferayインスタンスを管理・監視できます。 例えば、現在のシステムやポータルのプロパティを表示したり、ロギングやログレベルを設定したりできます。 ここで、システム全体のメールサーバーを設定することもできる。 詳しくは、 [サーバー管理パネルの使用](https://learn.liferay.com/ja/w/dxp/system-administration/using-the-server-administration-panel) を参照してください。

電子メール通知（ユーザー登録、パスワード管理など）に使用するメールサーバーを設定します。 以下の手順に従って、クラリティ ビジョン ソリューションのメール サーバーを設定してください。

### LXCでメールを設定する

まだ設定されていない場合は、Liferayクラウドのサポート担当者に連絡してください。

### LXC-SMまたはセルフホストでのメールの設定

実際の生活では、Liferayが使用するメールサーバーがすでにあるはずです。 ここではそのシミュレーションを行う。

1. ダウンロード [FakeSMTP](http://nilhcem.com/FakeSMTP/) .

1. ファイルを解凍する。 以下のコマンドでFakeSMTPメール・サーバーを起動する：

   `java -jar fakeSMTP-2.0.jar`

1. リスニング・ポートを `2525` に設定し、 **Start server** をクリックする。

   dockerコンテナを使用する場合は、以下のenv変数を実行コマンドに含める必要があります。

   ```properties
   --env LIFERAY_MAIL_PERIOD_SESSION_PERIOD_MAIL_PERIOD_SMTP_PERIOD_PORT=2525 \
   --env LIFERAY_MAIL_PERIOD_SESSION_PERIOD_MAIL_PERIOD_SMTP_PERIOD_HOST=172.17.0.1 \
   ```

1. Liferay で **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Server Administration** に移動します。 **Mail** タブをクリックします。

1. 以下のコンフィギュレーションを設定する。

   * 受信POPサーバー： `localhost`
   * 受信ポート： `110`
   * 安全なネットワーク接続を使用する：チェック
   * ユーザー名： `support@clarityvisionsolutions.com`
   * パスワード： ``。
   * 送信SMTPサーバー： `localhost`
   * 発信ポート： `2525`
   * 安全なネットワーク接続を使用する：チェック
   * ユーザー名： `support@clarityvisionsolutions.com`
   * パスワード： ``。

   ![メールサーバーの設定を入力します。](./server-administration-and-email/images/01.png)

［**保存**］ をクリックします。

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Instance Settings** に移動する。 **Eメール** をクリックする。

1. 左側のナビゲーションで、 **メール送信者** をクリックします。 以下のオプションを設定する。

   * 名前 `サポート`
   * アドレス： `support@clarityvisionsolutions.com`

［**保存**］ をクリックします。

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Users and Organizations** に移動する。 **Add User**(![Add icon](../../images/icon-add.png)) をクリックします。

1. 以下のアカウント情報を入力してください：

   * スクリーン名： `alan`
   * メールアドレス： `alan@clarityvisionsolutions.com`
   * ファーストネーム `アラン`
   * ラストネーム `アダムス`
   * 役職名 `Sales & Marketing Manager`

［**保存**］ をクリックします。

1. Liferayはアラン・アダムスに歓迎のメールを送った。

   ![Liferayからウェルカムメールが届きました。](./server-administration-and-email/images/02.png)

これでLiferay環境にメールサーバーが設定されました。 さらにメールをカスタマイズして、インスタンスごとに異なるメール送信者とメッセージを設定することもできる。 詳しくは、 [メール設定](https://learn.liferay.com/ja/w/dxp/system-administration/configuring-liferay/virtual-instances/email-settings) を参照してください。

## 関連コンセプト

- [サーバー管理パネルの使用](https://learn.liferay.com/ja/w/dxp/system-administration/using-the-server-administration-panel)
- [メールの設定](https://learn.liferay.com/ja/w/dxp/installation-and-upgrades/setting-up-liferay/configuring-mail)
- [メール設定](https://learn.liferay.com/ja/w/dxp/system-administration/configuring-liferay/virtual-instances/email-settings)
