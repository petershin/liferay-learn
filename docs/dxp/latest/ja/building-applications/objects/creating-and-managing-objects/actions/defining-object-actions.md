# オブジェクトアクションの定義

{bdg-secondary}`Liferay 7.4 U60+/GA60+で利用可能`

オブジェクトアクションは、オブジェクトエントリーイベントに対して手動または自動で実行できる操作を定義します。

アクションを追加するには、

1. ［**グローバルメニュー**］（![Global Menu](../../../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブに移動して、 ［**オブジェクト**］ をクリックします。

1. オブジェクト定義の編集を開始します。

   ```{note}
   Liferay 7.4 U22以降とGA22以降では、システムオブジェクトにアクションを追加することができます。
   ```

1. ［**Actions**］ タブを開き、 **追加**( ![Add Button](../../../../images/icon-add.png) ) をクリックします。

1. ［Basic Info］タブで、アクションの ［**Name**］ と ［**Description**］ を入力します。

   ![［基本情報］タブにアクション名と説明を入力します。](./defining-object-actions/images/01.png)

1. ［**Action Builder**］ タブを開き、カスタムトリガー、条件、アクションを定義します。

   ![［Action Builder］タブを開き、カスタムトリガー、条件、アクションを定義します。](./defining-object-actions/images/02.png)

1. アクションを実行するタイミングを決定するトリガーイベントを指定します。

   | トリガー           | 説明                     |
   |:-------------- |:---------------------- |
   | 追加後            | エントリーが追加されたとき          |
   | 添付ファイルのダウンロード後 | エントリーの添付ファイルをダウンロードした時 |
   | 削除後            | エントリーが削除されたとき          |
   | 更新後            | エントリーが更新されたとき          |
   | スタンドアロン        | 手動でトリガーする              |

   スタンドアロン以外のトリガーはすべて自動です。 スタンドアロントリガーは、任意のタイプのアクションを手動で実行するためのものです。 詳しくは、 [マニュアルアクションの使用](./using-manual-actions.md) をご覧ください。

   ![アクションが実行されるタイミングを決定します。](./defining-object-actions/images/03.png)

1. (オプション) 自動トリガーの条件を有効にします。 **コード**( ![Code](../../../../images/icon-code.png) ) をクリックすると、利用可能な式が表示されます。

   Liferay 7.4 U33以降とGA33以降では、 ［**完了**］ をクリックすると、Liferayは条件が有効な構文であるか検証します。 式が無効な場合、Liferayはエラーメッセージを表示します。 利用可能なフィールド、演算子、関数の詳細については、「 [Expression Builder Validations Reference」](../validations/expression-builder-validations-reference.md) を参照してください。

   <!--TASK: See \[Using Action Conditions\]() for more information. -->

   ![トリガーの追加条件を設定するには、式を使用します。](./defining-object-actions/images/04.png)

1. 実行するアクションのタイプを選択し、すべての追加フィールドに入力します。

   | タイプ            | 説明                                                  |
   |:-------------- |:--------------------------------------------------- |
   | 通知             | あらかじめ設定されたテンプレートを使って、メールやユーザー通知を送信します。              |
   | オブジェクトエントリーを追加 | アクティブなオブジェクトにエントリーを作成します。                           |
   | オブジェクトエントリーを更新 | 現在のオブジェクトエントリーの項目を更新します。                            |
   | Webhook        | URLにペイロードを配信します。                                    |
   | Groovy スクリプト   | カスタム [Groovy](https://groovy-lang.org/) のスクリプトを実行します。 |

   ```{important}
   Groovyスクリプトアクションは、Liferay Experience Cloud Self-ManagedとLiferay DXP Self-Hostedでのみ利用可能です。
   ```

   詳細は、 [アクションの種類について](./understanding-action-types.md#understanding-action-types) を参照してください。

1. ［**保存**］ をクリックします。

作成されると、アクションは有効になり、構成に応じてトリガーされます。

アクションの［Basic Info］タブで、アクションを無効にすることができます。 ［**Active**］ スイッチをトグルし、 ［**Save**］ をクリックします。

![［Active］スイッチを切り替えて、アクションを無効にします。](./defining-object-actions/images/05.png)

## 関連トピック

* [オブジェクトの作成](../creating-objects.md)
* [アクションの種類について](./understanding-action-types.md)
