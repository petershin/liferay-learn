# 通知テンプレートの作成

{bdg-secondary}`利用可能なLiferay 7.4 U33+およびGA33+`

Notification Templatesを使用すると、Liferayサービスの自動メール通知を設計することができます。 各テンプレートは、送信者、受信者、メッセージの内容を特定します。 テンプレートのデザイン中に、サポートされているエンティティを検索し、そのデータをメールに動的に挿入するフィールド参照を追加することができます。

現在、Notification TemplatesはObjectアクションのみをサポートしています。 ただし、Commerce Channels には、Channel イベント用の通知テンプレート機能が組み込まれています。 詳しくは、 [メールを保存](https://learn.liferay.com/commerce/latest/ja/store-management/sending-emails/store-emails.html) をご覧ください。

```{note}
メール通知を利用するには、インスタンスに[メールサーバー](../../installation-and-upgrades/setting-up-liferay/configuring-mail.md) が設定されている必要があります。 一度設定すると、インスタンスレベルで追加の[メール通知設定](../../system-administration/configuring-liferay/virtual-instances/email-settings.md)にアクセスすることが可能です。
```

以下の手順に従って、カスタムオブジェクトアクション用の通知テンプレートを作成します。

1. **グローバルメニュー**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** タブを開き、 **通知テンプレート** をクリックします。

1. **追加** ボタン（![Add Button](../../images/icon-add.png)）をクリックします。

1. 基本情報」セクションに、 **名前** と **説明** を入力します。

   ![基本情報」の下に、名前と説明を入力します。](./creating-notification-templates/images/01.png)

1. 設定」セクションで、メール **送信者** と **受信者** の連絡先情報を入力します。

   複数の受信者を追加する場合は、メールアドレスをカンマで区切ってください（例： `test@liferay.com,test2@liferay.com`）。

   ![設定」で、送信者と受信者の詳細を入力します。](./creating-notification-templates/images/02.png)

1. コンテンツ」セクションで、 **件名** を入力し、メールの **本文** を作成します。

   ![コンテンツで、件名を入力し、メールの本文を作成します。](./creating-notification-templates/images/03.png)

   このプロセスでは、カスタムオブジェクトを検索し、オブジェクトフィールドへの参照を追加することができます。 これにより、電子メールにオブジェクトの入力データが動的に入力されます。

   ```{important}
   通知アクションに関与するオブジェクト エントリからのフィールド値のみを動的に含めることができます。
   ```

   ![サポートされているエンティティフィールドを検索し、参照を追加します。](./creating-notification-templates/images/04.png)

1. (オプション) オブジェクトの添付フィールドを選択して、電子メール通知にそのアセットを含めます。

   ```{important}
   通知アクションに関与するオブジェクト エントリのアセットのみを添付することができます。
   ```

   ![メール通知にアセットを含めるために、添付フィールドを選択します。](./creating-notification-templates/images/05.png)

1. ［**保存**］ をクリックします。

一度作成した通知テンプレートは、Object アクションで使用することができます。 詳しくは、 [オブジェクトアクションの定義](../../building-applications/objects/creating-and-managing-objects/defining-object-actions.md) をご覧ください。

## 追加情報

* [メールの設定](../../installation-and-upgrades/setting-up-liferay/configuring-mail.md)
* [メール設定](../../system-administration/configuring-liferay/virtual-instances/email-settings.md)
* [通知](../notifications.md)
