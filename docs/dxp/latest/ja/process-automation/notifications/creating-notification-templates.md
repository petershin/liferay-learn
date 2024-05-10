# 通知テンプレートの作成

{bdg-secondary}`Liferay 7.4 2023.Q4+/GA107+`

通知テンプレートにより、Liferayサービスの自動化された電子メールやユーザー通知を設計できます。 各テンプレートは、送信者、受信者、メッセージの内容を特定します。 テンプレートをデザインする際に、サポートされているエンティティを検索し、そのデータをメールに動的に挿入するフィールド参照を追加できます。

現在、通知テンプレートは [オブジェクトアクション](../../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md) のみをサポートしています。 しかし、コマースチャネルには、チャネルイベントに対する通知テンプレート機能が組み込まれています。 詳しくは [メールを送信する](https://learn.liferay.com/w/commerce/store-management/sending-emails) をご覧ください。

!!! important
    メール通知を使用するには、インスタンスに設定された [メールサーバー](../../installation-and-upgrades/setting-up-liferay/configuring-mail.md) が必要です。 一度構成されると、インスタンス・レベルで追加の [電子メール通知設定](../../system-administration/configuring-liferay/virtual-instances/email-settings.md) にアクセスできます。

すぐに使える通知タイプがニーズに合わない場合は、クライアント拡張機能を使ってカスタム通知タイプを作成できます。 詳細は [マイクロサービスのクライアント拡張](../../building-applications/client-extensions/microservice-client-extensions.md) を参照。

## メール通知テンプレートの追加

1. **グローバル メニュー** (![グローバル メニュー](../../images/icon-applications-menu.png)) を開き、**Control Panel** タブに移動して、**Notification Templates** をクリックします。

1. **追加**(![追加ボタン](../../images/icon-add.png))をクリックし、 **Eメール** を選択します。

   ![Click the Add button and select Email.](./creating-notification-templates/images/01.png)

   フィールド参照を使用して、エントリー・データとユーザー・データを動的にメッセージに入力することができます。 用語の定義」セクションでは、オブジェクト定義を選択して、そのサポートされているフィールドを参照することができます。 General Terms（一般用語）セクションでは、通知アクションをトリガーするユーザーのフィールドを参照するための用語を見つけることができます。 希望に応じて、これらの参照用語をテンプレートのフィールドで使用してください。 詳しくは、 [用語の定義 参照](#definition-of-terms-reference) を参照のこと。

   ![Search entities to add references to supported fields.](./creating-notification-templates/images/02.png)

1. ［Basic Info］で、テンプレートの名前と説明を入力します。

   ![Under Basic Info, enter a name and description.](./creating-notification-templates/images/03.png)

1. ［Settings］で、メール送信者と受信者の連絡先を入力します。

   複数の受信者を追加するには、メールアドレスをカンマまたはスペースで区切ってください（例：`test@liferay.com,learn@liferay.com`、`[%TICKET_AUTHOR_EMAIL_ADDRESS%] [%CURRENT_USER_EMAIL_ADDRESS%]`）。

   ![Under Settings, enter details for the sender and desired recipients.](./creating-notification-templates/images/04.png)

1. メールを別々に送るか、一緒に送るかを決める。

   一緒に送信すると、メールには宛先フィールドの受信者リストがすべて含まれます。 電子メールを別々に送信すると、受信者のリストが非表示になります。

   !!! tip
   一緒にメールを送ることで、透明性とコラボレーションを促進することができる。 電子メールを別々に送ることは、プライバシーを守るのに役立つ。

1. ［Content］で、件名を入力し、エディタータイプを選択し、メールの本文を作成します。

   タイプは、［Rich Text」または［FreeMarker Template］を選択します。

   ![Under Content, enter a subject and craft the body of the email.](./creating-notification-templates/images/05.png)

1. (オプション）オブジェクトの添付フィールドを選択して、そのアセットをメール通知に含めます。

   ```{important}
   アセットを添付できるのは、通知アクションに関与するオブジェクトエントリからのみです。
   ```

   ![Select attachment fields to include assets in email notifications.](./creating-notification-templates/images/06.png)

1. ［**保存**］をクリックします。

作成後、オブジェクトアクションで通知テンプレートを使用できます。 詳しくは [オブジェクトアクションの定義](../../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md) を参照してください。

## ユーザー通知テンプレートの追加

1. **グローバル メニュー** (![グローバル メニュー](../../images/icon-applications-menu.png)) を開き、**Control Panel** タブに移動して、**Notification Templates** をクリックします。

1. **追加**(![ボタン追加](../../images/icon-add.png))をクリックし、 **ユーザー通知** を選択します。

   ![Click the Add Button and select User Notification.](./creating-notification-templates/images/07.png)

   フィールド参照を使用して、エントリー・データとユーザー・データを動的にメッセージに入力することができます。 用語の定義」セクションでは、オブジェクト定義を選択して、そのサポートされているフィールドを参照することができます。 General Terms（一般用語）セクションでは、通知アクションをトリガーするユーザーのフィールドを参照するための用語を見つけることができます。 希望に応じて、これらの参照用語をテンプレートのフィールドで使用してください。 詳しくは、 [用語の定義 参照](#definition-of-terms-reference) を参照のこと。

   ![Search entities to add references to supported fields.](./creating-notification-templates/images/08.png)

1. ［Basic Info］で、テンプレートの名前と説明を入力します。

   ![Under Basic Info, enter a name and description.](./creating-notification-templates/images/09.png)

1. ［Settings］で、通知の受信者を決定します。

   定義済みの用語、ユーザー名、またはユーザーロールを使用できます。 複数の受信者を追加するには、値をカンマまたはスペースで区切ってください（例：`[%TICKET_AUTHOR_ID%]`, `[%TICKET_R_ASSIGNEE_USERID%]`）。

   !!! important
   受信者を動的に設定した場合、オブジェクトエントリを追加する [権限を持つユーザー](../../building-applications/objects/understanding-object-integrations/permissions-framework-integration.md#creating-entries) だけが通知を受け取ることができます。

   ![Determine recipients by entering terms, individual user names, or user roles.](./creating-notification-templates/images/10.png)

1. ［Content］セクションで、通知のメッセージを入力します。

   定義された用語を使用して、動的に値を入力することができます。

   ![Enter the notification's message in the Content section.](./creating-notification-templates/images/11.png)

1. ［**保存**］をクリックします。

作成後、オブジェクトアクションで通知テンプレートを使用できます。 詳しくは [オブジェクト・アクションの定義](../../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md) を参照してください。

## 用語の定義 参照

参照語を使用してユーザーとエントリーのデータにアクセスし、テンプレートのフィールドに動的に入力することができます。 [通知アクション](../../building-applications/objects/creating-and-managing-objects/actions/understanding-action-types.md#notification) のトリガーとなるイベントに関与したエントリーやユーザーを参照することができます。 現在のエントリーが1対多のリレーションの子側にある場合、関連オブジェクトのエントリーのフィールドを参照することもできます。 関連するエントリーフィールドへの参照はこのパターン、`[%RELATIONSHIPNAME_PARENTOBJECTNAME_OBJECTFIELD%]`を使用する。

Userシステムオブジェクトとの1対多リレーションの子側にあるカスタムTicketオブジェクトのシナリオを考えてみましょう。 この関係はチケットの譲受人を決定する。 チケットオブジェクトに、エントリの更新時に担当者に通知するための通知アクションを追加した場合、このアクションに使用されるテンプレートは、更新されたチケットと担当者の両方のデータにアクセスできます。

条件は、カスタムとデフォルトのオブジェクトフィールドの両方で使用できます。

   !!! important
       通知アクションのトリガーとなるイベントに直接関与したエントリーとユーザーのフィールドのみを参照できます。

### 現在のエントリーのデフォルト条件

これらの用語を使用して、現在のオブジェクトエントリに関する情報にアクセスします。

| ラベル         | コマースの条件                                |
| :---------- | :------------------------------------- |
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

### 現在のユーザーのデフォルト条件

通知アクションのトリガーとなる現在のユーザーに関する情報にアクセスするには、これらの用語を使用します。

| ラベル            | コマースの条件                          |
| :------------- | :------------------------------- |
| 現在ユーザーのメールアドレス | `[%CURRENT_USER_EMAIL_ADDRESS%]` |
| 現在ユーザーの名       | `[%CURRENT_USER_FIRST_NAME%]`    |
| 現在ユーザーの接頭辞     | `[%CURRENT_USER_PREFIX%]`        |
| 現在ユーザーの姓       | `[%CURRENT_USER_LAST_NAME%]`     |
| 現在ユーザーのミドルネーム  | `[%CURRENT_USER_MIDDLE_NAME%]`   |
| 現在ユーザーの ID     | `[%CURRENT_USER_ID%]`            |
| 現在ユーザーの接尾辞     | `[%CURRENT_USER_SUFFIX%]`        |

## 関連トピック

* [メールの設定](../../installation-and-upgrades/setting-up-liferay/configuring-mail.md)
* [電子メール設定](../../system-administration/configuring-liferay/virtual-instances/email-settings.md)
* [通知](../notifications.md)
