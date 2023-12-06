# アクションの種類について

{bdg-secondary}`Liferay 7.4 U60+/GA60+`

アクションは、オブジェクトのエントリーイベントによって引き起こされるカスタム操作を定義します。 Liferayは以下のアクションの種類を提供します。

| 種類                                        | Description                                     |
|:----------------------------------------- |:----------------------------------------------- |
| [通知](#notification)                       | あらかじめ設定されたテンプレートを使って、メールやユーザー通知を送信します。          |
| [オブジェクトエントリーを追加](#add-an-object-entry)    | アクティブなオブジェクトにエントリーを作成します。                       |
| [オブジェクトエントリーを更新](#update-an-object-entry) | 現在のオブジェクトエントリーの項目を更新します。                        |
| [Webhook](#webhook)                       | URLにペイロードを配信します。                                |
| [Groovy スクリプト](#groovy-script)            | [Groovy](https://groovy-lang.org/) のスクリプトを実行します。 |

```{important}
Groovyスクリプトアクションは、Liferay Experience Cloud Self-ManagedとLiferay DXP Self-Hostedでのみ利用可能です。
```

<!--TASK: When Client Extensions documentation is ready, note that you can create custom object actions. -->

## 通知

通知アクションにより、オブジェクトエントリーに関するユーザー通知またはメール通知を送信します。 ユースケースは以下の通りです。

* 新規受注時のメール通知を自動的に送信する
* カスタムチケットシステムで、チケットの更新についてのユーザー通知を自動的に送信する
* ユーザーにタスクやイベントをリマインドするため、手動でメール通知を送信する

[通知テンプレート](../../../../process-automation/notifications/creating-notification-templates.md)を選択し、各メッセージの送信者、受信者、およびコンテンツを決定する必要があります。 メール通知の場合、インスタンスには [設定されたメールサーバー](../../../../installation-and-upgrades/setting-up-liferay/configuring-mail.md)も必要です。

![通知テンプレートの選択](./understanding-action-types/images/01.png)

<!--TASK: include this content when client extensions documentation is updated, "If the out-of-the-box notification types don't meet your needs, you can use client extensions to create your own. See \[]() for more information or [\]() for a tutorial.." -->

## オブジェクトエントリーを追加

指定されたオブジェクトにエントリーを作成します。 ユースケースは以下の通りです。

* 注文の支払い時に、カスタム出荷オブジェクトのエントリーを自動的に追加する
* 新規アカウントにデフォルトユーザーを自動的に追加する
* カスタムチケットシステム内で、現在のチケットに子チケットを手動で追加する。

有効なオブジェクトを選択する必要があります。 その後、エントリーのフィールドに規定値を設定できます。 これらの値を直接入力するか、 **コード**( ![Code](../../../../images/icon-code.png) ) をクリックして、値を動的に設定する式を使用します。 オブジェクトに必須項目が含まれている場合、規定値を設定する必要があります。

![有効なオブジェクトを選択し、作成されたエントリに初期値を入力します。](./understanding-action-types/images/02.png)

## オブジェクトエントリーを更新

現在のオブジェクトエントリーの1つのまたは複数の項目を更新します。 ユースケースは以下の通りです。

* ユーザーが添付ファイルをダウンロードした後、エントリーのブール値フィールドを`true`に自動更新する
* ボタンをクリックすると、チケットの担当者を現在のユーザーに手動で更新する
* ユーザーがお気に入り登録した後、エントリーのブール値フィールドを `true` に自動更新する

現在のエントリーで更新するフィールド（複数可）を選択し、新しい値を入力する必要があります。 これらの値を直接入力するか、 **コード**( ![Code](../../../../images/icon-code.png) ) をクリックして、値を動的に設定する式を使用できます。

![現在のオブジェクトエントリーから編集したいフィールドを選択し、デフォルト値を入力します。](./understanding-action-types/images/03.png)

## Webhook

Webhookアクションでは、データペイロードを設定されたURLに配信します。 ターゲットURLの入力が必要です。 該当する場合は、シークレットを入力します。

![WebhookのURLとシークレットを入力します。](./understanding-action-types/images/04.png)

<!--TASK: When Client Extensions documentation is ready, recommend using client extensions instead, since it can include OAuth. -->

## Groovy スクリプト

Groovyスクリプトアクションは、Groovyスクリプトを実行します。 用意されたコードウィンドウにスクリプトを入力します。 Liferay 7.4 U33以降とGA33以降では、Liferayは [GroovyShellクラス](https://docs.groovy-lang.org/latest/html/api/groovy/lang/GroovyShell.html) を使って、［保存］をクリックしたときにGroovyスクリプトの構文が有効であるかどうかをチェックします。 スクリプトが無効な場合、Liferayは一般的なエラーメッセージを表示します。

![Groovyスクリプトを入力します。](./understanding-action-types/images/05.png)

<!--TASK: When Client Extensions documentation is ready, recommend custom object actions instead of groovy scripts due to limitations. -->

## 関連トピック

* [オブジェクトの作成](../creating-objects.md)
* [オブジェクトアクションの定義](./defining-object-actions.md)
