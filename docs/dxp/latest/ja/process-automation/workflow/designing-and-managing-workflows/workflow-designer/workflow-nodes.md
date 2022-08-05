# ワークフローノード

{bdg-primary}`サブスクリプション`

ワークフローノードは、レビュープロセスの開始、アセットの承認または拒否、タスクの再割り当てなど、承認プロセスにおける特定のポイントを表します。

以下に、異なるタイプのノードと、各ノードに関連する可能なアクションを示します。

## ノードの種類

| ノード                    | Description                                                               |
|:---------------------- |:------------------------------------------------------------------------- |
| タスク                    | _タスク_ノードは、ワークフローのタスクとその担当者を示します。                                          |
| フォークと結合                | _フォーク_と_結合_は、複数のレビュアが並行して実行できるようにレビュープロセスを分割し、レビューが完了したら再び結合するためのペアノードです。 |
| XOR 結合                 | _XOR 結合_ノードでは、並列レビュアのいずれかからのトランジションが呼び出されている限り、ワークフローを続行できます。             |
| 条件                     | _条件_ノードは、レビュープロセスを進める前の条件を設定します。                                          |
| Start (Automatic Copy) | _開始_ノードはワークフローを開始します。                                                     |
| End (Automatic Copy)   | デフォルトの_終了_ノードでは、ワークフローのステータスが_「承認済み」_に設定されます。                             |
| ステータス                  | _ステータス_ノードは、レビュープロセスを特定のモード、または状態にします。 開始ノードと終了ノードは、特別なタイプのステータスノードです。    |

### 開始ノードと終了ノード

開始ノードと終了ノードは、ワークフロー処理を開始し、アセットを最終的に承認された状態にします。 多くの場合、デフォルトの開始ノードと終了ノードを変更せずに使用することができます。

終了ノードには、Groovyスクリプト言語を使用してワークフローのステータスを「承認済み」に設定するデフォルトのアクションがあります。

```java
import com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil;
import com.liferay.portal.kernel.workflow.WorkflowConstants;

WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.getLabelStatus("approved"), workflowContext);
```

### ステータスノード

ステータスノードには、[アクションと通知](./configuring-workflow-actions-and-notifications.md)を設定できます。 例えば、次のGroovyスクリプトを使って、ステータスを_「期限切れ」_に設定するノードを作成することができます。

```java
import com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil;
import com.liferay.portal.kernel.workflow.WorkflowConstants;

WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.getLabelStatus("expired"), workflowContext);
```

### 条件ノード

_条件_ノードは、アセットやその実行コンテキストをチェックし、その結果に応じて、適切なトランジションに送ります。 このノードでは、トランジションの1つに値を設定するスクリプトが必要です。

[Category Specific Definition](https://github.com/liferay/liferay-learn/blob/master/docs/dxp/latest/en/process-automation/workflow/designing-and-managing-workflows/workflow-designer/workflow-designer-overview/resources/category-specific-definition.xml)は、対象となるアセットを調べ、その[アセットカテゴリー](../../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md)を取得し、初期の`returnValue`を設定するスクリプトです。 その後、そのアセットが*legal*カテゴリでマークされているかどうかを確認します。 マークされていない場合は、*コンテンツレビュー*（ワークフローのcontent-reviewタスク）を通過し、マークされている場合は、*法務レビュー*（ワークフローのlegal-reviewタスク）を通過します。

### タスクノード

_タスク_ノードは、すべての作業が行われる場所を表しています。 [ワークフロータスクの作成](./creating-workflow-tasks.md)および[タスクノードの使用](./assigning-task-nodes.md)を参照してください。

## 追加情報

* [ワークフロータスクの作成](./creating-workflow-tasks.md)
* [タスクノードの割り当て](./assigning-task-nodes.md)
* [Kaleoフォーム](../../../forms/kaleo-forms.md)
* [ワークフローフレームワークの概要](https://help.liferay.com/hc/en-us/articles/360028727112-Introduction-to-The-Workflow-Framework)
* [動的データリストの概要](../../../forms/dynamic-data-lists/getting-started-with-dynamic-data-lists.md)
