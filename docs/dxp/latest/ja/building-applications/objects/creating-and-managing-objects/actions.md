---
toc:
- ./actions/defining-object-actions.md
- ./actions/understanding-action-types.md
---
# 操作

```{toctree}
:maxdepth: 3

actions/defining-object-actions.md
actions/understanding-action-types.md
```

アクションは、オブジェクトの入力イベントによって引き起こされる操作を定義します。 Liferayはイベント-add, delete, or update-をリッスンし、操作を実行します。

![オブジェクト定義にアクションを追加する。](./actions/images/01.png)

Liferay はこれらのアクションタイプを提供します。

| アクションタイプ                                                                              | Description                                     |
|:------------------------------------------------------------------------------------- |:----------------------------------------------- |
| [Webhook](./actions/understanding-action-types.md#webhook-actions)                    | URLにペイロードを配信する。                                 |
| [Groovy スクリプト](./actions/understanding-action-types.md#groovy-script-actions)         | [Groovy](https://groovy-lang.org/) のスクリプトを実行する。 |
| [通知](./actions/understanding-action-types.md#notification-actions)                    | あらかじめ設定されたテンプレートを使って、電子メールによる通知を送信します。          |
| [オブジェクトエントリーを追加](./actions/understanding-action-types.md#add-an-object-entry-actions) | アクティブなオブジェクトにエントリーを作成する。                        |

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} オブジェクトアクションの定義
:link: ./actions/defining-object-actions.md
:::

:::{grid-item-card} アクションタイプの理解
:link: ./actions/understanding-action-types.md
:::
::::
