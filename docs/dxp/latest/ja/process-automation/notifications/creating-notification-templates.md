# 通知テンプレートの作成

{bdg-secondary}`利用可能 Liferay 7.4 U75+/GA75+`

通知テンプレートにより、Liferayサービスの自動化された電子メールやユーザー通知を設計できます。 各テンプレートは、送信者、受信者、メッセージの内容を特定します。 テンプレートをデザインする際に、サポートされているエンティティを検索し、そのデータをメールに動的に挿入するフィールド参照を追加できます。

現在、通知テンプレートは、 [オブジェクトアクション](../../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md)のみサポートしています。 しかし、コマースチャネルには、チャネルイベントに対する通知テンプレート機能が組み込まれています。 詳しくは、 [メールを送信する](https://learn.liferay.com/commerce/latest/ja/store-management/sending-emails.html) をご覧ください。

```{important}
メール通知設定を利用するには、インスタンスに[メールサーバー](../../installation-and-upgrades/setting-up-liferay/configuring-mail.md)が設定されている必要があります。 一度設定すると、インスタンスレベルで追加の[メール通知設定](../../system-administration/configuring-liferay/virtual-instances/email-settings.md)にアクセスできます。
```

<!--TASK: include this content when client extensions documentation is updated, "If the out-of-the-box notification types don't meet your needs, you can use client extensions to create custom types. See \[]() for more information or [\]() for a tutorial." -->

## メール通知テンプレートの追加

1. **グローバルメニュー**（![Global Menu](../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブに移動し、 ［**通知テンプレート**］ をクリックします。

1. **追加**(![Add Button](../../images/icon-add.png)) をクリックし、 ［**Email**］ を選択します。

   ![追加ボタンをクリックし、［メール］を選択します。](./creating-notification-templates/images/01.png)

   フィールド参照を使用することで、エントリーデータやユーザーデータを動的にメッセージに入力することができます。 用語の定義」セクションでは、オブジェクトの定義を選択して、そのサポートされているフィールドを参照することができます。 一般的な用語」セクションでは、通知アクションをトリガーしたユーザーのフィールドを参照するための用語を見つけることができます。 これらの参考用語は、必要に応じてテンプレートのフィールドで使用してください。 [用語の定義 参考](#definition-of-terms-reference) をご参照ください。

   ![エンティティを検索して、サポートされているフィールドへの参照を追加します。](./creating-notification-templates/images/02.png)

1. ［Basic Info］で、テンプレートの名前と説明を入力します。

   ![［Basic  Info］で、名前と説明を入力します。](./creating-notification-templates/images/03.png)

1. ［Settings］で、メール送信者と受信者の連絡先を入力します。

   複数の受信者を追加する場合は、メールアドレスをカンマまたはスペースで区切ってください（例： `test@liferay.com,learn@liferay.com`, `[%TICKET_AUTHOR_EMAIL_ADDRESS%] [%CURRENT_USER_EMAIL_ADDRESS%]`）。

   ![［Settings］で、送信者と希望する受信者の詳細を入力します。](./creating-notification-templates/images/04.png)

1. ［Content］で、件名を入力し、エディタータイプを選択し、メールの本文を作成します。

   タイプは、［Rich Text」または［FreeMarker Template］を選択します。

   ![［Content］で、件名を入力し、メールの本文を作成します。](./creating-notification-templates/images/05.png)

1. (オプション）オブジェクトの添付フィールドを選択して、そのアセットをメール通知に含めます。

   ```{important}
   通知アクションに関連するオブジェクトエントリーからのアセットのみを添付できます。
   ```

   ![添付フィールドを選択して、そのアセットをメール通知に含めます。](./creating-notification-templates/images/06.png)

1. ［**保存**］ をクリックします。

作成後、オブジェクトアクションで通知テンプレートを使用できます。 詳しくは、[オブジェクトアクションの定義](../../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md)をご覧ください。

## ユーザー通知テンプレートの追加

1. **グローバルメニュー**（![Global Menu](../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブに移動し、 ［**通知テンプレート**］ をクリックします。

1. **追加**(![Add Button](../../images/icon-add.png)) をクリックし、 ［**User Notification**］ を選択します。

   ![追加ボタンをクリックし、［ユーザー通知］を選択します。](./creating-notification-templates/images/07.png)

   フィールド参照を使用することで、エントリーデータやユーザーデータを動的にメッセージに入力することができます。 用語の定義」セクションでは、オブジェクトの定義を選択して、そのサポートされているフィールドを参照することができます。 一般的な用語」セクションでは、通知アクションをトリガーしたユーザーのフィールドを参照するための用語を見つけることができます。 これらの参考用語は、必要に応じてテンプレートのフィールドで使用してください。 [用語の定義 参考](#definition-of-terms-reference) をご参照ください。

   ![エンティティを検索して、サポートされているフィールドへの参照を追加します。](./creating-notification-templates/images/08.png)

1. ［Basic Info］で、テンプレートの名前と説明を入力します。

   ![［Basic  Info］で、名前と説明を入力します。](./creating-notification-templates/images/09.png)

1. ［Settings］で、通知の受信者を決定します。

   定義済みの用語、ユーザー名、またはユーザーロールを使用できます。 複数の受信者を追加する場合は、値をカンマまたはスペースで区切ってください（例： `[%TICKET_AUTHOR_ID%]`, `[%TICKET_R_ASSIGNEE_USERID%]`）。

   ![用語、個々のユーザー名、またはユーザーロールを入力して、受信者を決定します。](./creating-notification-templates/images/10.png)

1. ［Content］セクションで、通知のメッセージを入力します。

   定義された用語を使用して、動的に値を入力することができます。

   ![［Content］セクションに、通知のメッセージを入力します。](./creating-notification-templates/images/11.png)

1. ［**保存**］ をクリックします。

作成後、オブジェクトアクションで通知テンプレートを使用できます。 詳しくは、 [オブジェクトアクションの定義](../../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md) をご覧ください。

## 用語の定義 参照

参照語を使用してユーザーやエントリーのデータにアクセスし、テンプレートのフィールドに動的に入力することができます。 [通知アクション](../../building-applications/objects/creating-and-managing-objects/actions/understanding-action-types.md#notification) のトリガーとなるイベントに関与する任意のエントリーとユーザーを参照できます。

カスタムTicketオブジェクトが、Userシステムオブジェクトとの一対多の関係の子側にあるシナリオを考えてみましょう。 この関係によって、チケットの譲渡先が決定されます。 チケットオブジェクトに、エントリーの更新時にアサイニーに通知するための通知アクションを追加した場合、このアクションに使用するテンプレートは、更新されたチケットとアサイニーの両方のデータにアクセスできます。

用語は、カスタムおよびデフォルトのオブジェクトフィールドの両方で使用できます。

```{important}
通知アクションのトリガーとなるイベントに直接関与したエントリーとユーザーのフィールドのみを参照することができます。 
```

### 現在のエントリーのデフォルトの条件

これらの用語を使用して、現在のオブジェクトエントリに関する情報にアクセスします。

| ラベル         | 条件                                     |
|:----------- |:-------------------------------------- |
| 作成者のメールアドレス | `[%OBJECTNAME_AUTHOR_EMAIL_ADDRESS%]`  |
| 作成者の名       | `[%OBJECTNAME_AUTHOR_FIRST_NAME%]`     |
| 作成者 ID      | `[%OBJECTNAME_AUTHOR_ID%]`             |
| 作成者の姓       | `[%OBJECTNAME_AUTHOR_LAST_NAME%]`      |
| 作成者のミドルネーム  | `[%OBJECTNAME_AUTHOR_MIDDLE_NAME%]`    |
| 作成者の接頭辞     | `[%OBJECTNAME_AUTHOR_PREFIX%]`         |
| 作成者の接尾辞     | `[%OBJECTNAME_AUTHOR_SUFFIX%]`         |
| 作成日時        | `[%OBJECTNAME_CREATEDATE%]`            |
| 外部参照コード     | `[%OBJECTNAME_EXTERNALREFERENCECODE%]` |
| ID          | `[%OBJECTNAME_ID%]`                    |
| 編集日時        | `[%OBJECTNAME_MODIFIEDDATE%]`          |
| ステータス       | `[%OBJECTNAME_STATUS%]`                |

### 現在のユーザーに対するデフォルトの条件

通知アクションのトリガーとなる現在のユーザーに関する情報にアクセスするには、これらの用語を使用します。

| ラベル            | 条件                               |
|:-------------- |:-------------------------------- |
| 現在ユーザーのメールアドレス | `[%CURRENT_USER_EMAIL_ADDRESS%]` |
| 現在ユーザーの名       | `[%CURRENT_USER_FIRST_NAME%]`    |
| 現在ユーザーの接頭辞     | `[%CURRENT_USER_PREFIX%]`        |
| 現在ユーザーの姓       | `[%CURRENT_USER_LAST_NAME%]`     |
| 現在ユーザーのミドルネーム  | `[%CURRENT_USER_MIDDLE_NAME%]`   |
| 現在ユーザーの ID     | `[%CURRENT_USER_ID%]`            |
| 現在ユーザーの接尾辞     | `[%CURRENT_USER_SUFFIX%]`        |

## 追加情報

* [メールの設定](../../installation-and-upgrades/setting-up-liferay/configuring-mail.md)
* [メール設定](../../system-administration/configuring-liferay/virtual-instances/email-settings.md)
* [通知](../notifications.md)
