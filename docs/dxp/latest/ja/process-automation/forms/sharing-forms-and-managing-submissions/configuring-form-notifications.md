# フォーム通知の設定

フォームエントリーが送信されるたびに通知メールを送信するようにフォームアプリを設定できます。 [フォームにワークフローを有効](./using-forms-with-a-workflow.md)にしている場合は、通知を生成するようにフォームアプリを設定する必要がない場合があります。

フォームのメール通知を設定するには：

1. _プロダクトメニュー_（![Product Menu](../../../images/icon-product-menu.png)）を開き、_［サイト管理］_メニューのコンパスアイコン（![Compass](../../../images/icon-compass.png)）をクリックします。 フォームが関連付けられているサイトを選択します。
1. _［コンテンツ & データ］_ &rarr; _ ［Form］_をクリックします。
1. フォームを選択します（例：_Guest Survey Form_ ）。
1. _オプション_ボタン（![Options](../../../images/icon-options.png)）をクリックして_［Settings］_を選択し、フォームの_［Form Settings］_セクションを開きます。

    ![フォームの設定](./configuring-form-notifications/images/01.png)

1. _［Email Notifications］_タブをクリックします。
1. _［Send an Email Notification for Each Entry］_オプションを有効にします。

    ![フォームエントリーが送信されるたびに電子メール通知を送信するよう設定します。](./configuring-form-notifications/images/02.png)

1. 次のように入力します：

    **送信者名：**送信者の名前。 これは、サイト名、フォーム名、または受信者に有益なその他の情報にできます。

    **送信者メールアドレス：**送信者のメールアドレス。 `noreply@example.com`を使用して、受信者が返信しないようにすることができます。

    **送信先アドレス：**受信者の電子メールアドレス（`test@example.com`など）。 複数の送信先アドレスをカンマ区切りで入力します。

    **件名：**メールの件名。

1. _［Done］_をクリックして、ダイアログウィンドウを閉じます。

## 追加情報

* [ワークフローでのフォームの使用](./using-forms-with-a-workflow.md)
* [メールの設定](../../../installation-and-upgrades/setting-up-liferay/configuring-mail.md)
