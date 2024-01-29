# 通知キューの使用

{bdg-secondary}`Liferay 7.4 U75+/GA75+`

Liferayは、ObjectアクションによってトリガーされたEメール通知を確認するためのNotification Queueアプリケーションを提供します。 通知のステータスを確認し、必要に応じて再送信することができます。

![Review email notifications in the Notification Queue application.](./using-the-notification-queue/images/01.png)

申請書には、各通知について以下の詳細が記載されている：

| 列     | 説明                                                                                                                                                               |
| :---- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 件名    | 通知の件名は、 [通知テンプレート](./creating-notification-templates.md) で設定される。                                                                                       |
| トリガー元 | [通知アクションのトリガーを担当するオブジェクト](../../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md#notification-actions) 。 |
| 送信者   | 通知の送信者は、 [通知テンプレート](./creating-notification-templates.md) で設定される。                                                                                      |
| 終了    | 通知の受信者は、 [通知テンプレート](./creating-notification-templates.md) で設定される。                                                                                      |
| ステータス | 通知ステータスを示し、送信済み（**Sent**）か送信中（**Unsent**）かを示します。                                                                                                                     |

エントリーの **アクション** ボタン(![アクションボタン](../../images/icon-actions.png))をクリックすると、そのエントリーの **削除** または **通知の再送** ができます。

![Delete entries or resend notifications.](./using-the-notification-queue/images/02.png)

## 通知キューのクリア

デフォルトでは、Liferayは`43200`分(つまり30日)ごとに通知キューをクリアします。 これは、ステータスに関係なく、キュー内のすべての通知を削除する。

削除間隔を設定するには

1. ![グローバルメニュー](../../images/icon-applications-menu.png) を開き、[コントロールパネル] タブを開き、[システム設定] をクリックします。

1. プラットフォーム]で[通知]をクリックします。

1. Notification Queue（通知キュー）で、削除操作の間隔を分単位で入力します。

   間隔は15分以上でなければならない。

   ![Under Notification Queue, enter the number of minutes between deletion operations.](./using-the-notification-queue/images/03.png)

1. ［**保存**］をクリックします。

## 関連トピック

* [通知テンプレートの作成](./creating-notification-templates.md)
* [パーソナル通知の設定](./configuring-personal-notifications.md)
