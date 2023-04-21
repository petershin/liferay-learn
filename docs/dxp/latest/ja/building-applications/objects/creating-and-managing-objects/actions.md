---
toc:
- ./actions/defining-object-actions.md
- ./actions/understanding-action-types.md
- ./action/using-manual-actions.md
---
# アクション

```{toctree}
:maxdepth: 3

actions/defining-object-actions.md
actions/understanding-action-types.md
actions/using-manual-actions.md
```

オブジェクトアクションは、オブジェクトの入力イベントに対して手動または自動で実行できるカスタムビジネスロジックを定義します。 例えば、エントリーイベントのデータをWebhook URLに配信する、エントリー更新後にメール通知を行う、エントリー作成後にGroovyのカスタムスクリプトを実行する、などが挙げられます。

自動トリガーを使用する場合、Liferayはイベントを聞き取り、あらかじめ定義された条件に従って自動的に操作を実行します。 スタンドアローントリガーを使用する場合、LiferayはオブジェクトエントリーのActionsメニュー(![Actions Button](../../../images/icon-actions.png))にアクションを追加し、それをトリガーするためのヘッドレスAPIを生成します。 アクションは手動で実行する必要があります。

![オブジェクト定義にアクションを追加します。](./actions/images/01.png)

Liferay Objects はこれらのアクションタイプを提供します。

| 種類             | Description                                    |
|:-------------- |:---------------------------------------------- |
| 通知             | あらかじめ用意されたテンプレートを使って、メールやユーザー通知を送ることができます。     |
| オブジェクトエントリーを追加 | アクティブなオブジェクトにエントリーを作成する。                       |
| オブジェクトエントリーを更新 | 現在のオブジェクト・エントリーのフィールドを更新する。                    |
| Webhook        | URLにペイロードを配信する。                                |
| Groovy スクリプト   | [Groovy](https://groovy-lang.org/) のスクリプトを実行する。 |

```{important}
Groovyスクリプトアクションは、Liferay Experience Cloud Self-ManagedとLiferay DXP Self-Hostedでのみ利用可能です。
```

<!--TASK: When client extensions docs are ready, mention being able to add Action Types and Notification Types.-->


::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} オブジェクトアクションの定義
:link: ./actions/defining-object-actions.md
:::

:::{grid-item-card} アクションタイプの理解
:link: ./actions/understanding-action-types.md
:::

:::{grid-item-card} マニュアルアクションの使用
:link: ./actions/using-manual-actions.md
:::
::::
