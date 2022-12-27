# アクションの種類について

アクションは、オブジェクトの入力イベントをトリガーとするカスタムオペレーションを定義します。 Liferay Objects は4つのアクションタイプを提供します。

| アクションタイプ                                       | Description                                          |
|:---------------------------------------------- |:---------------------------------------------------- |
| [Webhook](#webhook-actions)                    | URLにペイロードを配信する。                                      |
| [Groovy スクリプト](#groovy-script-actions)         | カスタム [Groovy](https://groovy-lang.org/) スクリプトを実行します。 |
| [通知](#notification-actions)                    | あらかじめ設定されたテンプレートを使って、電子メールによる通知を送信します。               |
| [オブジェクトエントリーを追加](#add-an-object-entry-actions) | アクティブなオブジェクトにエントリーを作成する。                             |

```{important}
Groovy スクリプトアクションは、Liferay Experience Cloud Self-Managed と Liferay DXP Self-Hosted でのみ利用可能です。
```

## Webhookアクション

{bdg-secondary}`Liferay 7.4以降で利用可能`

**Webhookアクション** では、データペイロードを設定されたURLに配信します。 ターゲットURLを入力する必要があります。 該当する場合は、秘密を入力してください。

![WebhookのURLとシークレットを入力します。](./understanding-action-types/images/01.png)

## Groovyスクリプトアクション

{bdg-secondary}`Liferay 7.4 U27以降とGA27以降で利用可能`

**Groovy Script** アクションは、Groovy スクリプトを実行します。 用意されたコードウィンドウにスクリプトを入力します。 Liferay 7.4 U33+ と GA33+ では、Liferay は [GroovyShell クラス](https://docs.groovy-lang.org/latest/html/api/groovy/lang/GroovyShell.html) を使って、Save をクリックしたときに Groovy スクリプトのシンタックスを検証します。 スクリプトが無効な場合、Liferayはエラーメッセージを表示します。

![Groovyスクリプトを入力します。](./understanding-action-types/images/02.png)

## 通知アクション

{bdg-secondary}`Liferay 7.4 U32以降およびGA32以降で利用可能`

［**Notification**］ アクションを使用して、オブジェクトイベントのメール通知設定を自動化します。 インスタンスには、 [設定されたメールサーバー](../../../../installation-and-upgrades/setting-up-liferay/configuring-mail.md) と、少なくとも 1 つの [通知テンプレート](../../../../process-automation/notifications/creating-notification-templates.md)が必要です。

各メールの送信者、受信者、内容を決定するために、通知テンプレートが必要です。

![通知テンプレートの選択](./understanding-action-types/images/03.png)

## オブジェクトエントリアクションの追加

{bdg-secondary}`Liferay 7.4 U33以降およびGA33以降で利用可能`

**Add an Object Entry** アクションは、指定された Object にエントリーを作成します。 アクティブなオブジェクトを選択する必要があります。 オブジェクトに必須フィールドが含まれている場合、新しいエントリに定義済みの値を設定する必要があります。 これらの値を直接入力するか、式ビルダーを使って動的に値を設定することができます。 必要であれば、必須項目以外の値を設定することもできます。

![有効なオブジェクトを選択し、作成されたエントリに初期値を入力します。](./understanding-action-types/images/04.png)

## 追加情報

* [オブジェクトの作成](../creating-objects.md)
* [オブジェクトアクションの定義](./defining-object-actions.md)
