# Creating a New Job Scheduler Task Executor

Each Job Scheduler Task is created by implementing the `DispatchTaskExecutor` interface and can execute any logic. Liferay DXPは、すぐに使える複数のエグゼキュータを提供しますが、独自のエグゼキュータを作成することもできます。 Once created and deployed, you can add Job Scheduler Tasks to a Liferay instance.

次の手順に従って、`DispatchTaskExecutor`インターフェースの独自の実装を作成します。

1. **OSGIコンポーネント**：`@Component`アノテーションを使用して、OSGiフレームワーク内でモジュールをコンポーネントとして宣言します。

1. **サービス**：モジュールを`@Component`アノテーション内の`DispatchTaskExecutor.class`サービスとして識別します。

1. **OSGiプロパティ**：次のプロパティを`@Component`アノテーションに追加します。

   * `dispatch.task.executor.name`: defines the string used for the executor's name in the Job Scheduler UI.

      ```{note}
      If you want your Job Scheduler Task to use localized names, add a language key value for the `dispatch.task.executor.name` property to the module’s `resources/content/Language.properties` file.
      ```

   * `dispatch.task.executor.type`: defines a unique `type` value to match the right Job Scheduler Task Executor and Job Scheduler Trigger.

      ```{note}
      正しいエグゼキュータが一致するように、値は一意である必要があります。 値が一意でない場合、ログには起動時にエラーが表示され、同じプロパティ値を持つエグゼキュータが示されます。
      ```

1. [**`DispatchTaskExecutor`**](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-api/src/main/java/com/liferay/dispatch/executor/DispatchTaskExecutor.java)：`DispatchTaskExecutor`インターフェースを実装するか、その実装を拡張します（`BaseDispatchTaskExecutor`など）。

      ```{important}
      Implementations of the `DispatchTaskExecutor` interface must handle status logs for Job Scheduler tasks, because the framework depends on those logs to control the concurrent execution of tasks.

      For your convenience, Liferay provides the `BaseDispatchTaskExecutor` abstract [class](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-api/src/main/java/com/liferay/dispatch/executor/BaseDispatchTaskExecutor.java) that logs the Job Scheduler task's status as `IN PROGRESS`, `SUCCESSFUL`, or `FAILED`.
      ```

1. **メソッド**：`DispatchTaskExecutor`インターフェースを直接実装している場合は、`execute()`メソッドをオーバーライドしてカスタムロジックを実装します。 代わりに、`BaseDispatchTaskExecutor`抽象クラスを拡張する場合は、その`doExecute()`メソッドをオーバーライドします。

   ```{note}
   `getName()`メソッドは廃止予定となり、`dispatch.task.executor.name`プロパティに置き換えられました。
   ```

   ```{tip}
   You can use the `dispatchTrigger.getDispatchTaskSettings()` method to fetch properties set in the Job Scheduler Task's Settings editor.
   ```

The following sample module demonstrates how to create and deploy a custom Job Scheduler Task Executor to a Liferay instance.

## Deploying the Sample Job Scheduler Task Executor
```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps to download, build, and deploy the sample Job Scheduler Task Executor to the new Docker container:

1. Download and unzip the example module.

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/building-applications/core-frameworks/job-scheduler-framework/liferay-s7a3.zip -O
   ```

   ```bash
   unzip liferay-s7a3.zip
   ```

1. `gradlew`コマンドを実行してJARファイルをビルドし、それを新しいDockerコンテナにデプロイします。

   ```bash
   cd liferay-s7a3
   ```

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   JARは、`build/libs`フォルダ（つまり、`s7a3-impl/build/libs/com.acme.s7a3.impl-1.0.0`）に生成されます。

1. モジュールが正常にデプロイされ、コンテナコンソールを介して開始されたことを確認します。

   ```log
   Processing com.acme.s7a3.impl-1.0.0.jar
   STARTED com.acme.s7a3.impl-1.0.0 [1656]
   ```

1. Verify the module is working by using it to [add a new Job Scheduler Task](./using-job-scheduler.md#adding-a-new-job-scheduler-task) to your Liferay instance.

   ![Add a new Job Scheduler Task using the new template.](./creating-a-new-job-scheduler-task-executor/images/01.png)

   タスクを作成したら、*［Run Now］*をクリックします。

   ![Click Run Now for your new Job Scheduler Task.](./creating-a-new-job-scheduler-task-executor/images/02.png)

   成功すると、実行時に次のメッセージがコンソールに出力されます。

   ```log
   INFO [liferay/dispatch/executor-2][S7A3DispatchTaskExecutor:30] Invoking #doExecute(DispatchTrigger, DispatchTaskExecutorOutput)
   ```

   You can also click the task and go to the *Logs* tab to see a list of all previous runs.

   ![View and manage logs for your Job Scheduler Task.](./creating-a-new-job-scheduler-task-executor/images/03.png)

## Code for the Sample Job Scheduler Task Executor

```{literalinclude} creating-a-new-job-scheduler-task-executor/resources/liferay-s7a3.zip/s7a3-impl/src/main/java/com/acme/s7a3/internal/dispatch/executor/S7A3DispatchTaskExecutor.java
   :language: java
   :lines: 15-44
```

モジュールはOSGi `@Component`として宣言され、`dispatch.task.executor.name`と`dispatch.task.executor.type`の2つのプロパティを定義します。 その後、モジュールを`DispatchTaskExecutor.class`サービスとして識別します。

`@Component`アノテーションに続いて、モジュールは`BaseDispatchTaskExecutor`抽象クラスを拡張し、`doExecute`メソッドをオーバーライドします。 このメソッドは、`LogFactoryUtil`を使用して、コンソールのログに通知メッセージを表示します。

## 追加情報

* [Understanding the Job Scheduler Framework](./understanding-the-job-scheduler-framework.md)
* [Using Job Scheduler](./using-job-scheduler.md)
* [Job Scheduler UI Reference](./job-scheduler-ui-reference.md)
