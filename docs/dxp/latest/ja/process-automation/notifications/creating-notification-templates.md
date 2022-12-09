# 通知テンプレートの作成

{bdg-secondary}`利用可能な Liferay 7.4 U46+/GA46+`

Notification Templatesを使用すると、Liferayサービスの自動メール通知を設計することができます。 各テンプレートは、送信者、受信者、メッセージの内容を特定します。 テンプレートのデザイン中に、サポートされているエンティティを検索し、そのデータをメールに動的に挿入するフィールド参照を追加することができます。

現在、通知テンプレートは、 [オブジェクトアクション](../../building-applications/objects/creating-and-managing-objects/defining-object-actions.md)にのみ対応しています。 しかし、Commerce Channels には、チャネルイベント用の通知テンプレート機能が組み込まれています。 詳しくは、 [Store Emails](https://learn.liferay.com/commerce/latest/ja/store-management/sending-emails.html) をご覧ください。

```{important}
メール通知を使用するには、インスタンスに[メールサーバー](../../installation-and-upgrades/setting-up-liferay/configuring-mail.md) が設定されている必要があります。 一度設定すると、インスタンスレベルで追加の[メール通知設定](../../system-administration/configuring-liferay/virtual-instances/email-settings.md)にアクセスすることが可能です。
```

以下の手順に従って、Object アクションの通知テンプレートを作成します。

1. **グローバルメニュー**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** タブを開き、 **通知テンプレート** をクリックします。

1. **追加** ボタン（![Add Button](../../images/icon-add.png)）をクリックします。

   テンプレートを設計する際に、Objectフィールド参照を使用して、通知メールに入力データを動的に入力することができます。 これを行うには、 **用語の定義** セクションに移動し、 **エンティティ** ドロップダウンメニューを使用して、必要なオブジェクト定義を選択します。 次に、フィールドリファレンスをコピーして、目的のテンプレートフィールドに貼り付けます。

   ![サポートされているエンティティフィールドを検索し、参照を追加します。](./creating-notification-templates/images/01.png)

   オブジェクトの通知アクションに直接関与するエントリのフィールドのみを参照できることを忘れないでください。

1. 基本情報」セクションに、 **名前** と **説明** を入力します。

   ![基本情報」の下に、名前と説明を入力します。](./creating-notification-templates/images/02.png)

1. 設定」セクションで、メール **送信者** と **受信者** の連絡先情報を入力します。

   複数の受信者を追加する場合は、メールアドレスをカンマで区切ってください（例： `test@liferay.com,test2@liferay.com`）。

   ![設定」で、送信者と受信者の詳細を入力します。](./creating-notification-templates/images/03.png)

1. コンテンツ」セクションで、 **件名** を入力し、メールの **本文** を作成します。

   ![コンテンツで、件名を入力し、メールの本文を作成します。](./creating-notification-templates/images/04.png)

1. (オプション) オブジェクトの添付フィールドを選択して、電子メール通知にそのアセットを含めます。

   ```{important}
   通知アクションに関与するオブジェクト エントリからのアセットのみを添付することができます。
   ```

   ![メール通知にアセットを含めるために、添付フィールドを選択します。](./creating-notification-templates/images/05.png)

1. ［**保存**］ をクリックします。

一度作成した通知テンプレートは、Object アクションで使用することができます。 詳しくは、 [オブジェクトアクションの定義](../../building-applications/objects/creating-and-managing-objects/defining-object-actions.md) をご覧ください。

## 追加情報

* [メールの設定](../../installation-and-upgrades/setting-up-liferay/configuring-mail.md)
* [メール設定](../../system-administration/configuring-liferay/virtual-instances/email-settings.md)
* [お知らせ](../notifications.md)
