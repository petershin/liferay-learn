---
toc:
- ./sending-emails/using-notification-templates.md
- ./sending-emails/configuring-the-commerce-notification-queue.md
- ./sending-emails/notification-template-variables-reference-guide.md
---
# メールを送信する

Liferayは、あなたのストアで起こるさまざまなイベントに対して、メール通知を送信するように設定できます。 例えば、注文担当者やその他の関係者に、注文の詳細に関する最新情報を送信することができます。 これには、注文ID、配送先住所、請求先住所、使用された支払方法などが含まれることがあります。 これを行うには、電子メールの内容とイベント・トリガーを決定する通知テンプレートを作成する必要があります。

```{note}
Commerce で通知を使用するには、まず Liferay DXP のメール設定を行う必要があります。 詳しくは、 [メールの設定](https://learn.liferay.com/w/dxp/installation-and-upgrades/setting-up-liferay/configuring-mail) をご覧ください。
```

## 通知テンプレート種別

通知テンプレートは、送信者と受信者、イベントのトリガー、および電子メール通知の内容を定義します。 Liferay のメール設定を行った後、 **Control Panel** &rarr; **Commerce** &rarr; **Channels** に移動してください。 **通知テンプレート** タブをクリックし、 **追加** をクリックして、通知テンプレートを作成します。 これらの通知は、 [チャンネルごとに設定されます](./channels/introduction-to-channels.md)。 メールテンプレートをデザインする際、テキストを直接入力したり、変数を使用してトリガーとなるイベントのデータを動的に取り込むことができます。 詳しくは、 [Notification Templates の使用](./sending-emails/using-notification-templates.md) および [通知テンプレート変数リファレンスガイド](./sending-emails/notification-template-variables-reference-guide.md) を参照してください。

## 通知キュー

**Notification Queue** タブには、チャネルのすべての電子メール通知が表示されます。 各通知項目には、送信者、受信者、イベントの種類、ステータス、優先度が表示されます。 デフォルトでは、Liferayは15分ごとに未送信の通知を通知キューにチェックします。 この動作の設定方法については、「 [Commerce Notification Queue の設定」](./sending-emails/configuring-the-commerce-notification-queue.md) ）を参照してください。

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card}  通知テンプレートの使用
:link: ./sending-emails/using-notification-templates.md
:::

:::{grid-item-card}  通知キューを設定する
:link: ./sending-emails/configuring-the-commerce-notification-queue.md
:::

:::{grid-item-card}  通知テンプレート変数リファレンスガイド
:link: ./sending-emails/notification-template-variables-reference-guide.md
:::  
::::
