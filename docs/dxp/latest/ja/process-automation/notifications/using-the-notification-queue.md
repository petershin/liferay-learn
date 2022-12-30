# 通知キューを利用する

{bdg-secondary}`Liferay 7.4 U34以降およびGA34以降で利用可能`

Liferay は、Object アクションによってトリガーされた電子メール通知を確認するための Notification Queue アプリケーションを提供します。 通知の状態を確認し、必要に応じて再送信することができます。

![通知キューアプリケーションでメール通知を確認する。](./using-the-notification-queue/images/01.png)

アプリケーションには、各通知について以下の内容が記載されています。

| 列     | Description                                                                                                                                            |
|:----- |:------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 件名    | 通知の件名。これは通知の [テンプレート](./creating-notification-templates.md)で設定されます。                                                                                    |
| トリガー元 | [通知アクションのトリガーに責任を持つオブジェクト](../../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md#notification-actions) . |
| 送信者   | 通知の送信者。これは通知の [テンプレート](./creating-notification-templates.md)で設定されています。                                                                                 |
| 終了    | 通知の受信者。これは通知の [テンプレート](./creating-notification-templates.md)で設定されています。                                                                                 |
| ステータス | 通知が送信されたか (**Sent**) 、送信中であるか (**Unsent**) など、通知の状態を示す。                                                                                                    |

あるエントリーの **アクション** ボタン (![Actions Button](../../images/icon-actions.png)) をクリックすると、 **を削除したり、** 通知を再送信したりすることができます。

![エントリーを削除したり、通知を再送信したりすることができます。](./using-the-notification-queue/images/02.png)
