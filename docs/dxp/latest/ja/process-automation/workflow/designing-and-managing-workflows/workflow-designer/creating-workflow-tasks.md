# ワークフロータスクの作成

{bdg-primary}`サブスクリプション`

デフォルトの [唯一の承認者の定義](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-runtime-impl/src/main/resources/META-INF/definitions/single-approver-workflow-definition.xml) では、ワークフローのタスクを簡単に紹介しています。 タスクノードはレビューとアップデートの2つしかありません。 コンテンツ制作者がアセットをレビューのために提出すると、ワークフローはレビューノードに入ります。 レビューでは、アセットを承認または拒否できます。 拒否された場合、プロセスはタスクの更新に移行します。 その後、送信者はアセットを修正し、レビューのために再送信することができます。

![唯一の承認者の定義には、2つのタスクノードがあります。](./creating-workflow-tasks/images/01.png)

多くの場合、タスクノードはワークフローの定義の最も複雑な部分です。 ユーザーまたはリソースアクションにタスクを割り当てられる割り当て機能を設定できます（[タスクノードの割り当て](./assigning-task-nodes.md)を参照）。

タスクノードには、通知やアクションも含まれており、どちらも[ワークフロースクリプト](../../developer-guide/using-the-script-engine-in-workflow.md)に対応しています。 [ワークフローのアクションと通知の設定](./configuring-workflow-actions-and-notifications.md)を参照してください。

レビューが終了し、承認された移行がトリガーされると、ワークフローは次のノードに進みます。 唯一の承認者プロセスでは、承認済み終了ノードに移動します。

## 唯一の承認者ワークフローの作成

次の4つのステップでワークフローを作成します。

* ワークフローを作成し、名前をつける
* レビューノードを作成する
* アップデートノードを作成する
* 終了ノードを設定する

### ワークフローの作成

1. グローバルメニュー &rarr; ［アプリケーション］&rarr; ［ワークフロー］と進みます。
1. ［**ワークフロー**］ タブをクリックします。
1. **追加**（![Add icon](../../../../images/icon-add.png)） をクリックします。
1. ワークフローに説明的な名前をつけます（「私の唯一の承認者」など）。

### レビューノードの作成

1. ワークフローデザイナーのキャンバスで、開始ノードと終了ノードを接続するトランジションがある場合、マウスで選択し、キーボードのDeleteキーで削除します。
1. タスクノードをキャンバスにドラッグアンドドロップします。
1. ノードが選択されていないことを確認してから、ポインタを開始ノードの端に移動して、開始ノードとタスクノードを接続します。 カーソルの形が変わったら、開始ノードからのトランジションをクリックしてタスクノードにドラッグします。
1. トランジションを選択し、名前を 「**Review**」 に変更します。
1. タスクノードをクリックすると、そのプロパティの更新が始まります。
1. ノードに **Review** と名前を付けます。
1. 通知を追加します。

    * ［**Name**］ ：Review Notification
    * ［**Template Language**］ : Freemarker
    * ［**Templates**］ : 次のFreemarkerの通知を入力します： `${userName} sent you a ${entryType} for review in the workflow`
    * ［**Notification Type**］ : 複数選択フィールドで、 **Email** および **ユーザー通知** を選択します。
    * ［**Execution Type**］ : ［On Assignment］
    * ［**Recipient Type**］ : ［Task Assignees］

    ![アセットがレビューの準備ができたことを知らせるメールとユーザー通知を送信するためのタスクノードの通知設定を行います。](./creating-workflow-tasks/images/02.png)

1. 別の通知を追加します。

   * ［**名前**］:［レビュー完了通知］
   * ［**テンプレート言語**］:［Freemarker］
   * ［**テンプレート**］:** 次のFreemarkerの通知を入力します： `Your submission was reviewed<#if taskComments?has_content> and the reviewer applied the following ${taskComments}</#if>.`
   * ［**通知タイプ**］:［メール］
   * ［**実行の種類**］:［処理終了時］
   * ［**受信者の種類**］:［アセット作成者］

1. 通知を終了したら、戻る矢印（![Back](../../../../images/icon-angle-left.png)）または ［**保存**］（以前のバージョンのワークフローデザイナーを使用する場合）をクリックします。
1. ［**割り当て**］ を追加します。 レビュータスクは、ロール、ロール種類、特定のユーザー、またはリソースアクションに割り当てることができます。 この例では、レビュータスクをロール種類に割り当てます。 これらのロールを選択し、新しいロールを追加する必要があるたびに、 ［**新規セクション**］ をクリックします。

   * アセットライブラリのロール種類：
      * アセットライブラリ管理者
      * アセットライブラリコンテンツレビュア
      * アセットライブラリ所有者
   * 組織ロール種類
      * 組織管理者
      * 組織コンテンツレビュア
      * 組織所有者
   * 標準ロール種類：
      * システム管理者
      * ポータルコンテンツレビュア
   * サイトロール種類
      * サイト管理者
      * サイトコンテンツレビュア
      * サイト所有者

   ［自動作成］を選択すると、ワークフローの保存時に、現在存在しないロールが自動作成されます。 ロールと権限の詳細は、[ロールと権限について](../../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md)と[ロールへのユーザーの割り当て](../../../../users-and-permissions/roles-and-permissions/assigning-users-to-roles.md)を参照してください。

   ![アセットがレビューの準備ができたことを知らせるメールとユーザー通知を送信するためのタスクノードの通知設定を行います。](./creating-workflow-tasks/images/03.png)

1. 終了ノードをクリックし、名前を 「**承認済み**」 に変更します。

1. レビューノードを承認済み終了ノードに接続します。 コネクターの名前を 「**承認**」 とします。

タスクノードが設定され、提出物のレビューの準備が整ったことを知らせる通知が特定のロールに割り当てられたユーザーに送信されます。

また、他のユーザーやロールタイプではなく、リソースアクションにタスクノードを割り当てることもできます。 詳しくは、[タスクノードの使用](./assigning-task-nodes.md)を参照してください。

### アップデートノードの作成

1. 別のタスクノードをキャンバスにドラッグアンドドロップします。
1. ノードが選択されていないことを確認してから、ポインタを開始ノードの端に移動して、レビューノードと新しいタスクノードを接続します。 カーソルの形が変わったら、レビューノードからのコネクタをクリックして新しいタスクノードにドラッグします。
1. コネクタを選択して、名前を 「**拒否**」 に変更します。
1. タスクノードをクリックすると、そのプロパティの更新が始まります。
1. ノードに **Update** と名前を付けます。
1. ここで、 **通知** を追加します。

   * **［名前］:** 作成者への修正通知
   * **［テンプレート言語］:** Freemarker
   * **［テンプレート］:** 次のFreemarkerの通知を入力します：`Your submission was rejected by ${userName}; please modify and resubmit.`
   * **［通知タイプ**］ : 複数選択フィールドで、 **メール** および **ユーザー通知** を選択します。
   * **実行の種類：** 割り当て時
   * **受信者の種類：** タスク担当者

1. 通知を終了したら、戻る矢印（![Back](../../../../images/icon-angle-left.png)）または ［**保存**］（以前のバージョンのワークフローデザイナーを使用する場合）をクリックします。
1. ［**割り当て**］ をクリックします。 ［**アセット作成者**］ を選択します。
1. 通知を終了したら、戻る矢印（![Back](../../../../images/icon-angle-left.png)）または ［**保存**］（以前のバージョンのワークフローデザイナーを使用する場合）をクリックします。
1. ここで、 **アクション** を追加します。:

   * **名前:** 拒否
   * **テンプレート（Groovy）：**
     ```groovy
      import com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil;
      import com.liferay.portal.kernel.workflow.WorkflowConstants;

      WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.getLabelStatus("denied"), workflowContext);
      WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.getLabelStatus("pending"), workflowContext);
     ```
   * 残りのデフォルトはそのままにします（例：実行の種類: **処理開始時**)。

1. アクションを終了したら、戻る矢印（![Back](../../../../images/icon-angle-left.png)）または ［**保存**］（以前のバージョンのワークフローデザイナーを使用する場合）をクリックします。
1. パレットで何も選択されていないことを確認し、マウスポインタを **アップデート** ノードの端に移動させます。 コネクタを **アップデート** ノードから **レビュー** ノードにドラッグして戻します。
1. 新しいコネクタに 「**再送信**」 と名前をつけます。
1. ワークフローの定義を保存します。

![ワークフローが具体化してきました。 あとは、終了ノードを接続するだけです。](./creating-workflow-tasks/images/04.png)

1. 下部にある ［**公開**］ ボタンをクリックして、ワークフローを公開します。

ワークフローの作成とワークフローデザイナの使用方法を学習したところで、ワークフロープロセスを次のレベルに進めることができるノードのタイプ（[フォークと結合](./using-forks-and-joins.md)や[条件](./using-condition-nodes.md)など）を追加する方法について見ていきます。

## 追加情報

* [ワークフローの有効化](../../using-workflows/activating-workflow.md)
* [ワークフローノード](./workflow-nodes.md)
* [ワークフローのアクションと通知の設定](./configuring-workflow-actions-and-notifications.md)
* [タスクノードの割り当て](./assigning-task-nodes.md)
