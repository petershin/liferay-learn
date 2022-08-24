# Using Job Scheduler

[Job Scheduler](https://github.com/liferay/liferay-portal/tree/master/modules/apps/dispatch) is a flexible framework built on top of Liferay's scheduler engine that you can use to run and schedule any type of logic. このフレームワークは、`DispatchTaskExecutor`インターフェイスを使用してカスタムロジックでテンプレートを定義し、そのテンプレートを使用してコントロールパネルから[タスクを作成](#adding-a-new-job-scheduler-task)できます。 Once a Job Scheduler task is created, you can configure its behavior and execution [schedule](#scheduling-the-job-scheduler-task).

![Add and manage Job Scheduler tasks via the Job Scheduler page.](./using-job-scheduler/images/01.png)

Job Scheduler provides a convenient UI for viewing and managing all instance [jobs scheduled using the `MessageListener` interface](#viewing-and-managing-scheduled-jobs).

```{note}
When deciding whether to use Job Scheduler or `MessageListener` to schedule instance jobs, consider the following Job Scheduler benefits.
Job Scheduler tasks are more flexible than jobs scheduled using `MessageListener`, since changes can be applied to Job Scheduler tasks in runtime through the Job Scheduler UI. `MessageListener`ジョブへの変更は、ハードコーディングして再デプロイする必要があります。 
The Job Scheduler UI also provides a more complete overview of each Job Scheduler task's execution properties (e.g., cron expression, start/end date, cluster mode) and execution history. この情報は、`MessageListener`ジョブのUIでは提供されません。
```

## Adding a New Job Scheduler Task

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), click *Control Panel*, and go to *Configuration* &rarr; *Job Scheduler*.

1. Click the *Add* button (![Add Button](../../../images/icon-add.png)) and select the desired template for your Job Scheduler Task. 選択したテンプレートは、タスクの基本的なロジックを定義します。

   Each template is an implementation of the `DispatchTaskExecutor` interface, and each Job Scheduler task is an instance of the selected template. See [Understanding the Job Scheduler Framework](./understanding-the-job-scheduler-framework.md) for more information about how it works.

   ```{note}
   Liferay DXP provides a variety of Job Scheduler task templates, while Liferay Portal only includes the Talend Job Scheduler Task Executor.

   独自のテンプレートを作成することもできます。 See [Creating a New Job Scheduler Task Executor](./creating-a-new-job-scheduler-task-executor.md) to learn how.
   ```

   ![Click the Add button and select a Job Scheduler Task Executor template for your task.](./using-job-scheduler/images/02.png)

1. Enter a name for the Job Scheduler task.

1. (Optional) Use the settings editor to define properties for the Job Scheduler task that are injected at runtime.

   これらの設定を使用して、実行フローなどを微調整できます。

   All settings added in this way are soft-coded, so you can configure your Job Scheduler tasks without having to edit and redeploy the Executor's code.

   ```{tip}
   You can create multiple instances of the same Job Scheduler Task Executor and modify their properties and behavior using the settings editor.
   ```

1. Click *Save* to create a new Job Scheduler task for the selected template.

   ![Enter a name and optionally use the settings editor to define properties for the Job Scheduler task.](./using-job-scheduler/images/03.png)

All Job Scheduler tasks added to an instance appear on the Job Scheduler page. From here, you can click the task to edit its settings or configure its Job Scheduler Trigger to schedule when it runs. *［今すぐ実行］*をクリックして、タスクを手動で実行することもできます。 The Logs tab shows a record of all executions for the selected Job Scheduler task.

![View, manage, and configure all instance Job Scheduler tasks from the Job Scheduler page.](./using-job-scheduler/images/04.png)

## Scheduling the Job Scheduler Task

By default, all Job Scheduler task triggers are deactivated at creation. Follow these steps to activate a Task's Job Scheduler Trigger and schedule when it runs:

1. Go to the *Job Scheduler Triggers* tab in the Job Scheduler page and click the desired task.

1. Click the *Job Scheduler Trigger* tab and configure the fields below.

1. *［保存］* をクリックします。

   ![Schedule when the Job Scheduler task runs.](./using-job-scheduler/images/05.png)

**Active**: Activate or deactivate the Job Scheduler Trigger. To activate the trigger, you must enter a valid cron expression. When active, the Job Scheduler task executes according to the set schedule. 無効にすると、トリガーが実行されなくなります。

**Task Execution ClusterMode**: Determine whether the Job Scheduler task is run on one or all nodes in a clustered environment.

**Overlap Allowed**: Enable or disable  concurrent execution for the Job Scheduler task. 有効にすると、前の実行がまだ実行されているかどうかに関係なく、設定されたスケジュールに従って新しいタスクの実行が開始されます。

**Cron Expression**: Enter a valid Cron expression to determine when the Job Scheduler task is executed.

**Start Date**: Determine the Job Scheduler task's start date.

**End Date**: Use the checkbox to determine when the Job Scheduler task is no longer executed by the cron schedule. デフォルトでは、現在の日時に設定されています。

The Job Scheduler task now automatically starts and stops at your specified date/time and according to the cron intervals.

## Setting Up a Talend Job Scheduler Task

Talendは、カスタムデータ統合ジョブを定義するためのオープンソースのデータ統合ソフトウェアです。 These jobs can be exported as a `.zip` archive and uploaded to any Job Scheduler task that uses the Talend executor template. Once uploaded, the Talend data integration job is executed whenever the Job Scheduler task is run.

Follow these steps to upload a Talend *Job Archive* to a Job Scheduler task:

1. Add a new Job Scheduler task to your instance using the Talend executor template. See [Adding a New Job Scheduler Task](#adding-a-new-job-scheduler-task) for detailed instructions.

1. Go to the *Job Scheduler Triggers* tab in the Job Scheduler page, and click on the desired task.

1. *［Talend］* タブをクリックします。

   ![［Talend］タブをクリックして、Talendジョブアーカイブをアップロードします](./using-job-scheduler/images/06.png)

1. Talend *ジョブアーカイブ*のZIPファイルをアップロードします。

1. *［保存］*をクリックします。

## スケジュールされたジョブの表示と管理

The Job Scheduler Page's *Scheduled Jobs* tab also lists all jobs scheduled on the Liferay instance using the `MessageListener` interface. ここでは、各ジョブの一般的な詳細（名前、ステータスなど）を表示したり、手動で実行を開始したり、ジョブを個別に一時停止/再開したりできます。

![MessageListenerインターフェイスを使用してスケジュールされたすべてのジョブを表示します。](./using-job-scheduler/images/07.png)

## 追加情報

* [Job Scheduler UI Reference](./job-scheduler-ui-reference.md)
* [Understanding the Job Scheduler Framework](./understanding-the-job-scheduler-framework.md)
* [Creating a New Job Scheduler Task Executor](./creating-a-new-job-scheduler-task-executor.md)
