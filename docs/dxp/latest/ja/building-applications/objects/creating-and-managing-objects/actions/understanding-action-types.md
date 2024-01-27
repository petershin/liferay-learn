# アクションの種類について

{bdg-secondary}`liferay 7.4 U60+/GA60+`.

アクションは、オブジェクトの入力イベントをトリガーとするカスタムオペレーションを定義します。 Liferayは以下のアクションの種類を提供します。

| 種類                                                   | 説明                                                        |
| :--------------------------------------------------- | :-------------------------------------------------------- |
| [通知](#notification)                       | あらかじめ設定されたテンプレートを使って、メールやユーザー通知を送信します。                    |
| [オブジェクト・エントリーの追加](#add-an-object-entry)   | アクティブなオブジェクトにエントリーを作成します。                                 |
| [オブジェクトエントリーの更新](#update-an-object-entry) | 現在のオブジェクトエントリーの項目を更新します。                                  |
| [ウェブフック](#webhook)                        | URLにペイロードを配信します。                                          |
| [グルービー・スクリプト](#groovy-script)             | [Groovy](https://groovy-lang.org/) スクリプトを実行する。 |

```{important}
Groovy スクリプトアクションは、Liferay Experience Cloud Self-Managed および Liferay DXP Self-Hosted でのみ使用できます。
```

<!--TASK: When Client Extensions documentation is ready, note that you can create custom object actions. -->

## 通知

通知アクションにより、オブジェクトエントリーに関するユーザー通知またはメール通知を送信します。 ユースケースは以下の通りです。

* 新規受注時のメール通知を自動的に送信する
* カスタムチケットシステムで、チケットの更新についてのユーザー通知を自動的に送信する
* ユーザーにタスクやイベントをリマインドするため、手動でメール通知を送信する

各メッセージの送信者、受信者、内容を決定するには、 [通知テンプレート](../../../../process-automation/notifications/creating-notification-templates.md) を選択する必要があります。 電子メール通知のために、インスタンスには [設定されたメールサーバー](../../../../installation-and-upgrades/setting-up-liferay/configuring-mail.md) も必要です。

![Select a notification template.](./understanding-action-types/images/01.png)

すぐに使える通知タイプがニーズに合わない場合は、クライアント拡張機能を使ってカスタム通知タイプを作成できます。 詳細は [Microservice Client Extensions](../../../client-extensions/microservice-client-extensions.md) を参照。

## オブジェクトエントリーを追加

指定されたオブジェクトにエントリーを作成します。 ユースケースは以下の通りです。

* 注文の支払い時に、カスタム出荷オブジェクトのエントリーを自動的に追加する
* 新規アカウントにデフォルトユーザーを自動的に追加する
* カスタムチケットシステム内で、現在のチケットに子チケットを手動で追加する。

有効なオブジェクトを選択する必要があります。 その後、エントリーのフィールドに規定値を設定できます。 これらの値を直接入力するか、_Code_ ( ![Code](../../../../images/icon-code.png) ) をクリックして、動的に値を設定する式を使用します。 オブジェクトに必須項目が含まれている場合、規定値を設定する必要があります。

![Select an active object and enter predefined values for the created entries.](./understanding-action-types/images/02.png)

## オブジェクトエントリーを更新

現在のオブジェクトエントリーの1つのまたは複数の項目を更新します。 ユースケースは以下の通りです。

* ユーザーが添付ファイルをダウンロードした後、エントリーのbooleanフィールドを自動的に`true`に更新する。
* ボタンをクリックすると、チケットの担当者を現在のユーザーに手動で更新する
* ユーザーがお気に入り登録した後、エントリーのブール値フィールドを自動的に`true`に更新する。

現在のエントリーで更新するフィールド（複数可）を選択し、新しい値を入力する必要があります。 これらの値を直接入力するか、_Code_ ( ![Code](../../../../images/icon-code.png) ) をクリックして、動的に値を設定する式を使用することができます。

![Select the fields from the current object entry that you want to edit and enter default values.](./understanding-action-types/images/03.png)

## Webhook

Webhookアクションでは、データペイロードを設定されたURLに配信します。 ターゲットURLの入力が必要です。 該当する場合は、シークレットを入力します。

![Enter a webhook URL and secret.](./understanding-action-types/images/04.png)

<!--TASK: When Client Extensions documentation is ready, recommend using client extensions instead, since it can include OAuth. -->

## Groovy スクリプト

Groovyスクリプトアクションは、Groovyスクリプトを実行します。 用意されたコードウィンドウにスクリプトを入力します。 Liferay 7.4 U33+/GA33+ では、Liferay は [GroovyShell クラス](https://docs.groovy-lang.org/latest/html/api/groovy/lang/GroovyShell.html) を使用して、Save をクリックしたときに Groovy スクリプトの構文を検証します。 スクリプトが無効な場合、Liferayは一般的なエラーメッセージを表示します。

![Enter your Groovy script.](./understanding-action-types/images/05.png)

<!--TASK: When Client Extensions documentation is ready, recommend custom object actions instead of groovy scripts due to limitations. -->

## 関連トピック

* [オブジェクトの作成](../creating-objects.md)
* [オブジェクト・アクションの定義](./defining-object-actions.md)
