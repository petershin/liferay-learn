# アセットの確認

アセットのワークフローが [アクティブ化された場合](./activating-workflow.md)、公開前に1人または複数のユーザーがレビューする必要があります。 ワークフローのレビュープロセスは、特定のユーザーまたは特定の役割（例：ポータルまたはサイトコンテンツのレビュー担当者）に割り当てることができます。 後者の場合、その役割に割り当てられた人は、投稿を承認することも拒否することもできます。 例えば、すぐに使える **Single Approver** プロセスでは、ワークフローのタスクは、ポータルまたはサイトコンテンツレビューア、あるいは管理者権限を持つ人に割り当てられます。

```{tip}
DXP契約者： [Workflow Metricsアプリケーション](./using-workflow-metrics.md#managing-workflow-tasks-in-bulk) を使用してワークフロー項目の一括管理が可能です。
```

アセットが提出されると、 **Workflow** アプリケーションがすべての審査候補者に通知を送ります。 通知にアクセスするには、アバターをクリックして、 ［**Notifications**］ を選択します。

![ワークフローは、アセットがレビューできるようになったことを通知します。](./reviewing-assets/images/01.png)

## 資産の見直し

資産のレビューを開始するには、タスクを自分に割り当てる必要があります。 Single Approver のワークフローを使用する場合、タスクはデフォルトで役割に割り当てられますので、ご注意ください。 （ロールではなく、特定のユーザーにレビュータスクを割り当てる[カスタムワークフローを構築](../designing-and-managing-workflows/building-workflows.md)することもできます。）

### レビュータスクの割り当て

1. アバターをクリックして、 ［**My Workflow Tasks**］ を選択します。
1. ユーザーに直接割り当てられたすべてのワークフロータスクは、［My Workflow Task］ウィジェットの ［**Assigned to Me**］ タブに一覧表示されます。

    ![ユーザーに割り当てられたアセットは、［Assigned to Me］にリストされます。](./reviewing-assets/images/02.png)

1. タスクを要求するには、 ［**Assigned to My Roles**］ タブをクリックします。

    ![ロールに割り当てられたアセットは、関連する各ユーザーの［Assigned to My Roles］タブにリストされます。](./reviewing-assets/images/03.png)

1. アセットの **アクション** ボタン（![Actions](../../../images/icon-actions.png)）をクリックし、 ［**Assign to Me**］ を選択します。

    ![タスクを自己に割り当てる。](./reviewing-assets/images/04.png)

1. ［**Comment**］ テキストフィールドにオプションのコメントを入力します。
1. ［**Done**］ をクリックします。

### タスクの承認・却下

自分にタスクを割り当てたら、提出を承認または拒否することができます。

1. アセット名をクリックすると、アセットを確認することができます。 ここでは、アセットのプレビュー（**Wiki ページ**）とレビューステータスが表示されます。

    ![資産を見直す。](./reviewing-assets/images/05.png)

1. **アクション** ボタン（![Actions](../../../images/icon-actions.png)）をクリックし、 ［**Approve**］ または ［**Reject**］ をクリックします。

     ![アセットを承認または拒否する。](./reviewing-assets/images/06.png)

1. オプションでコメントを入力して、 ［**Done**］ をクリックします。

タスクが完了すると、いくつかの出来事のうちの1つが起こります。

* 投稿が拒否された場合、アセットは公開されません。 アセットがワークフロープロセスを終了する。 元の作成者には、ユーザーの ［**Notifications**］ で、提出物が拒否され再提出する前に修正する必要があることが通知されます。 ［**My Workflow Tasks**］ で ［**Update**］ とマークされます。
* レビュアーが複数いる場合は、次のレビュアーにタスクが進められます。
* 提出物が承認され、レビュー担当者が1人のみの場合、タスクは ［**Assigned to Me**］ タブの ［**Completed**］ セクションに移動します。 アセットが公開される。

![完了したタスクは［Assigned to Me］タブにあります。](./reviewing-assets/images/07.png)

承認された資産(Wikiページ)はウィジェットに公開されました。

## 追加情報

* [通知とリクエストの管理](../../../collaboration-and-social/notifications-and-requests/user-guide/managing-notifications-and-requests.md)
* [ワークフロータスクノードのリファレンス](../developer-guide/workflow-task-node-reference.md)
* [ワークフロー通知](https://help.liferay.com/hc/articles/360028834772-Workflow-Notifications)
