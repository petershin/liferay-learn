# Job Scheduler UI Reference

## 送信トリガー

![View, create, and manage Job Scheduler Tasks.](./job-scheduler-ui-reference/images/01.png)

The Job Scheduler Triggers tab lists all tasks added to the Liferay instance.

Click *Add* (![Add Button](../../../images/icon-add.png)) to create a Job Scheduler Task using a Job Scheduler Task Executor template.

Once created, the following fields are displayed for each Job Scheduler Task:

| フィールド       | 説明                                                                                          |
|:----------- |:------------------------------------------------------------------------------------------- |
| 名前          | The name of the Job Scheduler task                                                          |
| タスク エグゼキュータ | The Job Scheduler Task Executor template used to create the task                            |
| システム        | システムタスクかどうかを示します                                                                            |
| 作成日時        | Creation date of the Job Scheduler task                                                     |
| 次の実行日       | The next time the Job Scheduler task is scheduled to run                                    |
| ステータス       | The Status of the Job Scheduler task's most recent execution (e.g., *Successful*, *Failed*) |
| 今すぐ実行       | Button for manually executing the Job Scheduler task                                        |

From here, click a Job Scheduler task to access the following details and configuration options.

### ［詳細］タブ

![View and edit general details for Job Scheduler tasks](./job-scheduler-ui-reference/images/02.png)

| 項目              | 説明                                                                                           |
|:--------------- |:-------------------------------------------------------------------------------------------- |
| 名前              | View/Edit the Job Scheduler task's name                                                      |
| Settings Editor | Code editor for defining properties that are injected into the Job Scheduler task at runtime |

### Talend Tab (For Talend Job Scheduler Tasks Only)

![Talendジョブアーカイブファイルをアップロードします。](./job-scheduler-ui-reference/images/03.png)

Upload a Talend *Job Archive* `.zip` file to your Job Scheduler task.

### ［Logs］タブ

![View and remove Logs for the selected Job Scheduler task.](./job-scheduler-ui-reference/images/04.png)

View and remove *Logs* for the Job Scheduler task. *［Start Date］*, *［ランタイム］*, *［Trigger］*、および*［Status］*が含まれます。

| 項目    | 説明                                                   |
|:----- |:---------------------------------------------------- |
| 開始日   | 実行開始時のタイムスタンプ                                        |
| ランタイム | 実行期間                                                 |
| トリガー  | The name of the Job Scheduler task that was executed |
| ステータス | 実行ステータス（例：*Successful*、*Failed*）                     |

ログエントリをクリックすると、実行時のエラーと出力も確認できます。

### Job Scheduler Trigger Tab

![Configure the Job Scheduler Trigger to schedule task executions.](./job-scheduler-ui-reference/images/05.png)

Configure the Job Scheduler Trigger to schedule task executions.

| 項目            | 説明                                                                                                                                |
|:------------- |:--------------------------------------------------------------------------------------------------------------------------------- |
| 有効            | 設定された実行スケジュールがアクティブか非アクティブかを決定します                                                                                                 |
| タスク実行クラスターモード | Determines whether the Job Scheduler task is executed on a *Single Node* or *All Nodes* in a clustered environment                |
| 重複可能          | Determines whether concurrent execution of Job Scheduler Tasks are allowed                                                        |
| Cron式         | Defines time intervals for automatically executing Job Scheduler tasks                                                            |
| 開始日           | Defines when the Job Scheduler task begins to be executed according to the cron schedule; set to current date and time by default |
| 無期限           | Determines whether the Job Scheduler task's automatic execution ever ends; checked by default                                     |
| 終了日           | Defines when the Job Scheduler task is no longer automatically executed; disabled if *Never End* is checked                       |

## スケジュールジョブ

![MessageListenerインターフェイスを使用してスケジュールされたすべてのジョブを表示します。](./job-scheduler-ui-reference/images/06.png)

このページでは、`MessageListener`インターフェイスを使用してLiferayインスタンス全体でスケジュールされたすべてのジョブのリストをコンパイルします。

| 項目           | 説明                                        |
|:------------ |:----------------------------------------- |
| 名前           | スケジュールされたジョブの完全な名前                        |
| システム         | システムジョブかどうかを示します                          |
| 次の実行日        | ジョブの次回の実行予定日                              |
| ステータス        | ジョブの状態（例：`NORMAL`、`PAUSED`）               |
| 今すぐ実行        | ジョブを手動で実行するためのボタン                         |
| Pause/Resume | ジョブを*一時停止*/*再開*するオプション。アクションボタンからアクセスできます |

## 追加情報

* [Using Job Scheduler](./using-job-scheduler.md)
* [Understanding the Job Scheduler Framework](./understanding-the-job-scheduler-framework.md)
