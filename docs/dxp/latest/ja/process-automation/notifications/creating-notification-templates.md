# 通知テンプレートの作成

{bdg-secondary}`利用可能 Liferay 7.4 U60+/GA60+`

Notification Templatesを使用すると、Liferayサービスの自動化された電子メールやユーザー通知を設計できます。 各テンプレートは、送信者、受信者、メッセージの内容を特定します。 テンプレートをデザインする際に、サポートされているエンティティを検索し、そのデータをメールに動的に挿入するフィールド参照を追加することができます。

現在、通知テンプレートは、 [オブジェクトアクション](../../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md)にのみ対応しています。 しかし、コマースチャネルには、チャネルイベントに対する通知テンプレート機能が組み込まれています。 詳しくは、 [メールを送信する](https://learn.liferay.com/commerce/latest/ja/store-management/sending-emails.html) をご覧ください。

```{important}
メール通知を使用するには、インスタンスに [メールサーバー](../../installation-and-upgrades/setting-up-liferay/configuring-mail.md) が設定されている必要があります。一度設定すると、インスタンスレベルで追加の[メール通知設定](../../system-administration/configuring-liferay/virtual-instances/email-settings.md)にアクセスできます。
```

<!--TASK: include this content when client extensions documentation is updated, "If the out-of-the-box notification types don't meet your needs, you can use client extensions to create custom types. See \[]() for more information or [\]() for a tutorial." -->

## メール通知テンプレートの追加

1. **グローバルメニュー**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** タブを開き、 **通知テンプレート** をクリックします。

1. **追加**(![Add Button](../../images/icon-add.png)) をクリックし、 **メール** を選択します。

   ![追加］ボタンをクリックし、［メール］を選択します。](./creating-notification-templates/images/01.png)

   オブジェクトフィールド参照を使用して、メッセージに入力データを動的に入力することができます。 テンプレートデザイナーで、 **用語の定義** セクションに移動し、 **エンティティ** ドロップダウンメニューを使用して、オブジェクト定義を選択します。 フィールド参照語をコピーして、目的のテンプレートフィールドに貼り付けます。 オブジェクトのアクションに直接関与するエントリーのフィールドのみを参照することができます。

   ![エンティティを検索して、サポートされているフィールドへの参照を追加します。](./creating-notification-templates/images/02.png)

1. 基本情報］に、テンプレートの名前と説明を入力します。

   ![基本情報］で、名前と説明を入力します。](./creating-notification-templates/images/03.png)

1. 設定」で、メール送信者と受信者の連絡先を入力します。

   複数の受信者を追加する場合は、メールアドレスをカンマで区切ってください（例： `test@liferay.com,learn@liferay.com`）。

   ![設定」で、送信者と希望する受信者の詳細を入力します。](./creating-notification-templates/images/04.png)

1. コンテンツ］で、件名を入力し、エディタータイプを選択し、メールの本文を作成します。

   タイプは、「リッチテキスト」または「FreeMarker Template」を選択します。

   ![コンテンツ」で、件名を入力し、メールの本文を細工します。](./creating-notification-templates/images/05.png)

1. (オプション）オブジェクトの添付フィールドを選択して、そのアセットを電子メール通知に含めることができます。

   ```{important}
   アセットを添付できるのは、通知アクションに関与するオブジェクトエントリーのものだけです。
   ```

   ![メール通知にアセットを含めるための添付フィールドを選択します。](./creating-notification-templates/images/06.png)

1. ［**Save**］ をクリックします。

一度作成した通知テンプレートは、オブジェクトアクションで使用することができます。 詳しくは、 [オブジェクトアクションの定義](../../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md) をご覧ください。

## ユーザー通知テンプレートの追加

1. **グローバルメニュー**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** タブを開き、 **通知テンプレート** をクリックします。

1. **追加**(![Add Button](../../images/icon-add.png)) をクリックし、 **ユーザー通知** を選択します。

   ![追加ボタン」をクリックし、「ユーザー通知」を選択します。](./creating-notification-templates/images/07.png)

   オブジェクトフィールド参照を使用して、メッセージに入力データを動的に入力することができます。 テンプレートデザイナーで、 **用語の定義** セクションに移動し、 **エンティティ** ドロップダウンメニューを使用して、オブジェクト定義を選択します。 フィールド参照語をコピーして、目的のテンプレートフィールドに貼り付けます。 オブジェクトのアクションに直接関与するエントリーのフィールドのみを参照することができます。

   ![エンティティを検索して、サポートされているフィールドへの参照を追加します。](./creating-notification-templates/images/08.png)

1. 基本情報］に、テンプレートの名前と説明を入力します。

   ![基本情報］で、名前と説明を入力します。](./creating-notification-templates/images/09.png)

1. 設定」で、通知の受信者を決定します。

   定義された用語、ユーザー名、またはユーザーロールを使用することができます。 複数の受信者を追加する場合は、値をカンマで区切ってください（例： `[%TICKET_CREATOR%]`, `[%TICKET_R_ASSIGNEE_USERID%]`）。

   ![用語、個々のユーザー名、またはユーザーの役割を入力して、受信者を決定します。](./creating-notification-templates/images/10.png)

1. 内容」セクションで、通知のメッセージを入力します。

   定義された用語を使用して、動的に値を入力することができます。

   ![内容」セクションに、通知のメッセージを入力します。](./creating-notification-templates/images/11.png)

1. ［**Save**］ をクリックします。

一度作成した通知テンプレートは、オブジェクトアクションで使用することができます。 詳しくは、 [オブジェクトアクションの定義](../../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md) をご覧ください。

## 追加情報

* [メールの設定](../../installation-and-upgrades/setting-up-liferay/configuring-mail.md)
* [メール設定](../../system-administration/configuring-liferay/virtual-instances/email-settings.md)
* [お知らせ](../notifications.md)
