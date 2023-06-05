# 通知キューを使う

{bdg-secondary}`利用可能 Liferay 7.4 U75+/GA75+`

Liferayは、Objectアクションによってトリガーされたメール通知を確認するためのNotification Queueアプリケーションを提供します。 通知の状態を確認し、必要に応じて再送信することができます。

![通知キューアプリケーションでメール通知を確認する。](./using-the-notification-queue/images/01.png)

アプリケーションでは、各通知について、以下の内容を記載しています：

| 列     | Description                                                                                                                                           |
|:----- |:----------------------------------------------------------------------------------------------------------------------------------------------------- |
| 件名    | 通知の件名は、 [通知テンプレート](./creating-notification-templates.md)に設定されています。                                                                                    |
| トリガー元 | [通知アクションのトリガーを担当するオブジェクト](../../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md#notification-actions) 。 |
| 送信者   | 通知の送信者。これは [通知テンプレート](./creating-notification-templates.md)で設定されています。                                                                                 |
| 宛先    | 通知の宛先は、通知テンプレート [で設定されている](./creating-notification-templates.md)。                                                                                     |
| ステータス | 送信済み（**Sent**）か、送信中（**Unsent**）かの通知状態を示すものです。                                                                                                             |

**アクション** ボタン（![Actions Button](../../images/icon-actions.png)）をクリックすると、そのエントリーの **削除** または **通知を再送** することができます。

![エントリーを削除したり、通知を再送信したりする。](./using-the-notification-queue/images/02.png)

## 通知キューをクリアする

デフォルトでは、Liferay は `43200` 分（つまり、30 日）ごとに通知キューをクリアします。 これは、ステータスに関係なく、キューにあるすべての通知を削除します。

削除間隔を設定する、

1. **グローバルメニュー**( ![Global Menu](../../images/icon-applications-menu.png) ) を開き、 **コントロールパネル** タブを開き、 **システム設定** をクリックします。

1. プラットフォーム」の下にある「**通知**」 をクリックします。

1. 通知キュー］で、削除操作の間隔を何分とするかを入力します。

   間隔は、 `15` 分以上である必要があります。

   ![通知キュー］で、削除操作の間隔を何分とするかを入力します。](./using-the-notification-queue/images/03.png)

1. ［**Save**］ をクリックします。

## 関連トピック

* [通知テンプレートの作成](./creating-notification-templates.md)
* [個人通知の設定](./configuring-personal-notifications.md)
