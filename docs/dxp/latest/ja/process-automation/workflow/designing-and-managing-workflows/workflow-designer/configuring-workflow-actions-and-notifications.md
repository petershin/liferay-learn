# ワークフローのアクションと通知の設定

{bdg-primary}`サブスクリプション`

ワークフローデザイナーを使用して、ユーザーは各ノードのワークフローのアクションと通知を設定できます。

アクションは非常に適応性が高く、アクションが発生するタイミングを、ノードに入る前、ノードから出た後、タスクノードが割り当てられた後などに指定することができます。 例えば、レビューアがウェブコンテンツの記事を拒否した場合、ワークフローアクションはアセットのステータスを **Pending** に設定し、記事を元の作成者に自動的に再割り当てします。

![タスクノードにアクションを追加することができます。](./configuring-workflow-actions-and-notifications/images/01.png)

ワークフロー通知は、タスク担当者にワークフローに注意が必要であることを通知したり、プロセスのステータスについてアセット作成者を更新したりするために送信されます。 通知は、ワークフロー内のタスクやその他のタイプのノードに対して送信することができます。

![タスクノードに通知を追加することができます。](./configuring-workflow-actions-and-notifications/images/02.png)

ただし、すべてのノードでワークフローのアクションや通知が必要なわけではありません。 通常、レビュープロセスが開始または終了したことを元の作成者に通知する場合を除き、開始ノードと終了ノードにはアクションや通知はありません。

唯一の承認者の定義では、2つの[タスクノード（レビューとアップデート）](./creating-workflow-tasks.md)にアクションと通知があります。

## アクションの追加

Single Approver のワークフロー定義を作成する場合、 **Update** Task ノードに Reject **Action** を追加する必要があります。 この拒否アクションには Groovy スクリプトが含まれており、これを実行すると、アセットのステータスが **denied** の次に **pending** に設定されます。

以下の手順に従ってください。

1. **Global menu** &rarr; **Applications** &rarr; **Process Builder** .
1. ［**ワークフロー**］ タブをクリックします。
1. ワークフローの定義をクリックします（例： **唯一の承認者**）。
1. [**アップデート**] ノードをクリックします。

    ![アップデートノードを修正します。](./configuring-workflow-actions-and-notifications/images/04.png)

1. 既存のアクションをクリックするか、現在定義されているものがない場合は、 **New** をクリックします。
1. 名前フィールドに 「**拒否**」 と入力します。
1. [**実行の種類**] ドロップダウンメニューから [**割り当て時**] を選択します。
1. **Template (Groovy**) フィールドにスクリプトを入力します（バージョンによっては、 **Script** フィールドと呼ばれます）。 唯一の承認者ワークフローには、アセットのステータスを 「**拒否**」 に設定し、その次に 「**保留中**」 に設定するGroovyで書かれたアクションを含むアップデートタスクが含まれています。

    ```java
    import com.liferay.portal.kernel.workflow.WorkflowConstants;
    import com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil;

    WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.getLabelStatus("denied"), workflowContext);
    WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.getLabelStatus("pending"), workflowContext);
    ```

    ![拒否アクションを追加します。](./configuring-workflow-actions-and-notifications/images/05.png)

1. 終了したら、戻る矢印（![Back](../../../../images/icon-angle-left.png)）をクリックします（一部のバージョンでは、アクション定義で **保存** をクリックする必要があります）。

次に、アセット作成者に、投稿が今回は却下され、さらに作業が必要であることを通知する通知を追加します。

## 通知の追加

アセット作成者に提出物にさらなる作業が必要なことや、再割り当てされたことを知らせる通知を **アップデート** タスクノードに追加します。

以下の手順に従ってください。

1. Updateノードのプロパティサイドバーで、既存の通知をクリックするか、まだ何も定義されていない場合は、 **New** をクリックします。

 ![通知は [プロパティ]タブにあります。](./configuring-workflow-actions-and-notifications/images/03.png)

1. 次のように入力します：
    ***［名前］:** 作成者への修正通知
    ***説明** : この通知の説明を入力します

1. [**テンプレート言語**] ドロップダウンメニューから [**FreeMarker**] を選択します。
1. [**テンプレート**] フィールドにメッセージを入力します。
    * `Your submission was rejected by ${userName}, please modify and resubmit.`

   注入されたテンプレート変数については、 [ワークフロー通知テンプレート変数](../../developer-guide/workflow-notification-template-variables.md) を参照してください。

1. 通知タイプ（複数可）を選択します。

    * メール
    * ユーザー通知

1. [**実行の種類**] ドロップダウンメニューから [**割り当て時**] を選択します。 ユーザーがこのタスクに割り当てられたときに通知が送られます。
1. 受信者の種類（**アセット作成者**）を選択します。

     ![提出物が拒否されたことを作成者に知らせる通知をアップデートノードに追加します。](./configuring-workflow-actions-and-notifications/images/06.png)

1. 終了したら、戻る矢印（![Back](../../../../images/icon-angle-left.png)）をクリックします（バージョンによっては、通知セクションで **保存** をクリックする必要があります）。

アップデートノードの通知が追加されました。

## 関連トピック

* [ワークフロー通知テンプレート変数](../../developer-guide/workflow-notification-template-variables.md)
* [ワークフロータスクの作成](./creating-workflow-tasks.md)
* [フォークと結合の使用](./using-forks-and-joins.md)
* [条件ノードの使用](./using-condition-nodes.md)
* [ワークフローノード](./assigning-task-nodes.md)
