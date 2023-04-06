# アクションの種類について

{bdg-secondary}`利用可能 Liferay 7.4 U60+/GA60+`

アクションは、オブジェクトのエントリーイベントによって引き起こされるカスタム操作を定義します。 Liferayは以下のアクションの種類を提供します。

| 種類                                        | Description                                    |
|:----------------------------------------- |:---------------------------------------------- |
| [通知](#notification)                       | あらかじめ用意されたテンプレートを使って、メールやユーザー通知を送ることができます。     |
| [オブジェクトエントリーを追加](#add-an-object-entry)    | アクティブなオブジェクトにエントリーを作成する。                       |
| [オブジェクトエントリーを更新](#update-an-object-entry) | 現在のオブジェクト・エントリーのフィールドを更新する。                    |
| [Webhook](#webhook)                       | URLにペイロードを配信する。                                |
| [Groovy スクリプト](#groovy-script)            | [Groovy](https://groovy-lang.org/) のスクリプトを実行する。 |

```{important}
Groovyスクリプトアクションは、Liferay Experience Cloud Self-ManagedとLiferay DXP Self-Hostedでのみ利用可能です。
```

<!--TASK: When Client Extensions documentation is ready, note that you can create custom object actions. -->

## 通知

通知アクションを使用して、オブジェクトのエントリに対してユーザーまたは電子メールによる通知を送信します。 ユースケース例としては

* 新規受注時のお知らせメールの自動送信
* カスタムチケットシステムで、チケットの更新を知らせる通知を自動的に送信する。
* ユーザーにタスクやイベントを思い出させるために、手動で電子メール通知を送る

[通知テンプレート](../../../../process-automation/notifications/creating-notification-templates.md) を選択し、各メッセージの送信者、受信者、および内容を決定する必要があります。 電子メール通知のために、インスタンスには [設定されたメールサーバー](../../../../installation-and-upgrades/setting-up-liferay/configuring-mail.md)も必要です。

![通知テンプレートの選択](./understanding-action-types/images/01.png) <!--TASK: include this content when client extensions documentation is updated, "If the out-of-the-box notification types don't meet your needs, you can use client extensions to create your own. See \[]() for more information or [\]() for a tutorial.." --> ## オブジェクトエントリーを追加

指定されたオブジェクトにエントリーを作成する。 ユースケース例としては

* 注文が支払われたときに、カスタムShipmentsオブジェクトのエントリーを自動的に追加する。
* 新規アカウントにデフォルトユーザーを自動で追加する
* カスタムチケットシステム内で、現在のチケットに子チケットを手動で追加する。

アクティブなオブジェクトを選択する必要があります。 そして、エントリーのフィールドにあらかじめ定義された値を設定することができます。 これらの値を直接入力するか、 **コード**( ![Code](../../../../images/icon-code.png) ) をクリックして、値を動的に設定する式を使用します。 オブジェクトに必須項目がある場合は、あらかじめ定義された値を設定する必要があります。

![アクティブなオブジェクトを選択し、作成された項目に対してあらかじめ定義された値を入力します。](./understanding-action-types/images/02.png)

## オブジェクトエントリーを更新

現在のオブジェクト・エントリーの1つまたは複数のフィールドを更新する。 ユースケース例としては

* ユーザーが添付ファイルをダウンロードした後、エントリーのブーリアンフィールドを `true` に自動更新する。
* ボタンをクリックすると、チケットの担当者を現在のユーザーに手動で更新する機能
* ユーザーがお気に入り登録した後、エントリーのブーリアンフィールドを `true` に自動で更新する

現在のエントリで更新するフィールド（複数可）を選択し、新しい値を入力する必要があります。 これらの値を直接入力するか、 **コード**( ![Code](../../../../images/icon-code.png) ) をクリックして、値を動的に設定する式を使用することができます。

![現在のオブジェクトエントリから編集したいフィールドを選択し、デフォルト値を入力します。](./understanding-action-types/images/03.png)

## Webhook

Webhookアクションは、設定されたURLにデータペイロードを配信します。 ターゲットURLの入力が必要です。 該当する場合は、シークレットを入力します。

![WebhookのURLとシークレットを入力します。](./understanding-action-types/images/04.png)

<!--TASK: When Client Extensions documentation is ready, recommend using client extensions instead, since it can include OAuth. -->

## Groovy スクリプト

Groovy Scriptアクションは、Groovyスクリプトを実行します。 用意されたコードウィンドウにスクリプトを入力します。 Liferay 7.4 U33+/GA33+ では、Liferay は [GroovyShell クラス](https://docs.groovy-lang.org/latest/html/api/groovy/lang/GroovyShell.html) を使用して、保存をクリックしたときに Groovy スクリプトの構文を検証しています。 スクリプトが無効な場合、Liferayは一般的なエラーメッセージを表示します。

![Groovyスクリプトを入力します。](./understanding-action-types/images/05.png)

<!--TASK: When Client Extensions documentation is ready, recommend custom object actions instead of groovy scripts due to limitations. -->

## 追加情報

* [オブジェクトの作成](../creating-objects.md)
* [オブジェクトアクションの定義](./defining-object-actions.md)
