# ワークフローの移行

{bdg-primary}`サブスクリプション`

トランジションは、ワークフローが通過できる経路を表します。 Workflow Designerのパレットでは、トランジションはワークフローのノード間を結ぶ矢印です。

![トランジションは、ワークフローの道筋を指示するものです。](./workflow-transitions/images/01.png)

デザイナーでトランジションを作成するには

1. 起点となるノードの一辺の中点にマウスオーバーします。
1. カーソルがプラス記号(![Plus](../../../../images/icon-plus.png))に変わったら、クリックしたままにしておきます。
1. 遷移先のノードにドラッグします。 カーソルが再びプラス記号（![Plus](../../../../images/icon-plus.png)）になったら、マウスボタンを離します。

![遷移元ノードから遷移先ノードへドラッグします。](./workflow-transitions/images/02.png)

Transitionのプロパティを編集するには、デザイナーパレットでそのラベルをクリックすると、サイドバーにプロパティが表示されます。

![トランジションを設定する。](./workflow-transitions/images/03.png)

**ラベル** は、遷移を表す表示テキストです。 ユーザーが [タスクノード](../../developer-guide/workflow-task-node-reference.md)で作業しているとき、レビューの実行時に実行できるアクションとして遷移ラベルが表示されます（例：拒否または承認）。

**Transition ID** は、カスタムコード、スクリプト、またはワークフロー定義の XML を編集する際に、トランジションを識別するために使用される識別子です。 ラベルが **Review** であれば、Transition ID を **review** とするのもよいでしょう。 長いラベルの場合は、キャメルケースやスネークケースの使用をご検討ください。 ワークフロー公開後にトランジションIDを変更することはお勧めしません。

**Default** Transitionをノードのデフォルトとするかどうかを設定します。 各ノードでデフォルトとなる発信トランジションは1つだけです。 トランジションが1つしかない場合は、自動的にデフォルトになります。 デフォルトは、ワークフロータスクの担当者のUIで最初のオプションとして表示されるため、デフォルトの遷移は、最適な、または最も期待されるワークフロー経路につながるものとすることが理にかなっています。

XMLでは、各ノードの遷移は、 `transitions` 要素で定義される。

```xml
<transitions>
    <transition>
        <labels>
            <label language-id="en_US">
                approve
            </label>
        </labels>
        <id>approve</id>
        <target>approved</target>
        <default>true</default>
    </transition>
    <transition>
        <labels>
            <label language-id="en_US">
                reject
            </label>
        </labels>
        <id>reject</id>
        <target>update</target>
        <default>false</default>
    </transition>
</transitions>
```
