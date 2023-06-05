# ジョブスケジューラ タスクエクゼキュータの新規作成

各ジョブスケジューラタスクは、 `DispatchTaskExecutor` インターフェースを実装することで作成され、任意のロジックを実行することができます。 Liferay DXPは、すぐに使える複数のエグゼキュータを提供しますが、独自のエグゼキュータを作成することもできます。 一度作成し、デプロイすると、ジョブスケジューラタスクをLiferayインスタンスに追加することができます。

次の手順に従って、`DispatchTaskExecutor`インターフェースの独自の実装を作成します。

1. **OSGIコンポーネント** ：`@Component`アノテーションを使用して、OSGiフレームワーク内でモジュールをコンポーネントとして宣言します。

1. **サービス** ：モジュールを`@Component`アノテーション内の`DispatchTaskExecutor.class`サービスとして識別します。

1. **OSGiプロパティ** ：次のプロパティを`@Component`アノテーションに追加します。

   * `dispatch.task.executor.name`: ジョブスケジューラUIで実行者名に使用される文字列を定義します。

      ```{note}
      もし、ジョブスケジューラータスクにローカライズされた名前を使いたい場合は、モジュールの `resources/content/Language.properties` ファイルに `dispatch.task.executor.name` 属性の言語キー値を追加してください。
      ```

   * `dispatch.task.executor.type`: 正しいジョブスケジューラタスク実行者とジョブスケジューラトリガーに一致するように、一意の `type` 値を定義します。

      ```{note}
      正しいエグゼキュータが一致するように、値は一意である必要があります。 値が一意でない場合、ログには起動時にエラーが表示され、同じプロパティ値を持つエグゼキュータが示されます。
      ```

1. [**`DispatchTaskExecutor`**](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-api/src/main/java/com/liferay/dispatch/executor/DispatchTaskExecutor.java) ：`DispatchTaskExecutor`インターフェースを実装するか、その実装を拡張します（`BaseDispatchTaskExecutor`など）。

      ```{important}
      DispatchTaskExecutor` インターフェースの実装は、Job Scheduler タスクのステータスログを処理しなければなりません。なぜなら、フレームワークはタスクの同時実行を制御するために、これらのログに依存するからです。

      便宜上、Liferay は `BaseDispatchTaskExecutor` 抽象 [class](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-api/src/main/java/com/liferay/dispatch/executor/BaseDispatchTaskExecutor.java) を提供しており、ジョブスケジューラタスクの状態を `IN PROGRESS`, `SUCCESSFUL`, または `FAILED` としてログに記録します。
      ```

1. **メソッド** ：`DispatchTaskExecutor`インターフェースを直接実装している場合は、`execute()`メソッドをオーバーライドしてカスタムロジックを実装します。 代わりに、`BaseDispatchTaskExecutor`抽象クラスを拡張する場合は、その`doExecute()`メソッドをオーバーライドします。

   ```{note}
   `getName()`メソッドは廃止予定となり、`dispatch.task.executor.name`プロパティに置き換えられました。
   ```

   ```{tip}
   ジョブスケジューラタスクのSettingsエディタに設定されているプロパティを取得するには、`dispatchTrigger.getDispatchTaskSettings()` メソッドを使用します。
   ```

次のサンプルモジュールは、カスタムジョブスケジューラータスクエクゼキュータを作成し、Liferayインスタンスにデプロイする方法を示しています。

## サンプルジョブスケジューラ タスクエクゼキュータの配備

```{include} /_snippets/run-liferay-portal.md
```

次に、以下の手順でサンプルの Job Scheduler Task Executor をダウンロードし、ビルドして、新しい Docker コンテナにデプロイします。

1. サンプルモジュールをダウンロードして解凍します。

   ```bash
   curl https://learn.liferay.com/dxp/latest/ja/building-applications/core-frameworks/job-scheduler-framework/liferay-s7a3.zip -O
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

1. このモジュールを使って [Liferay インスタンスに新しい Job Scheduler Task](./using-job-scheduler.md#adding-a-new-job-scheduler-task) を追加し、モジュールが動作していることを確認します。

   ![新しいテンプレートを使って、新しいジョブスケジューラータスクを追加します。](./creating-a-new-job-scheduler-task-executor/images/01.png)

   タスクを作成したら、 ［**Run Now**］ をクリックします。

   ![新しいジョブスケジューラタスクの［今すぐ実行］をクリックします。](./creating-a-new-job-scheduler-task-executor/images/02.png)

   成功すると、実行時に次のメッセージがコンソールに出力されます。

   ```log
   INFO [liferay/dispatch/executor-2][S7A3DispatchTaskExecutor:30] Invoking #doExecute(DispatchTrigger, DispatchTaskExecutorOutput)
   ```

   また、タスクをクリックし、 **Logs** タブを開くと、過去に実行されたすべてのリストが表示されます。

   ![ジョブスケジューラタスクのログを表示・管理します。](./creating-a-new-job-scheduler-task-executor/images/03.png)

## サンプルジョブスケジューラ タスクエクゼキュータのコード

```{literalinclude} creating-a-new-job-scheduler-task-executor/resources/liferay-s7a3.zip/s7a3-impl/src/main/java/com/acme/s7a3/internal/dispatch/executor/S7A3DispatchTaskExecutor.java
   :language: java
   :lines: 15-44
```

モジュールはOSGi `@Component`として宣言され、`dispatch.task.executor.name`と`dispatch.task.executor.type`の2つのプロパティを定義します。 その後、モジュールを`DispatchTaskExecutor.class`サービスとして識別します。

`@Component`アノテーションに続いて、モジュールは`BaseDispatchTaskExecutor`抽象クラスを拡張し、`doExecute`メソッドをオーバーライドします。 このメソッドは、`LogFactoryUtil`を使用して、コンソールのログに通知メッセージを表示します。

## 関連トピック

* [ジョブスケジューラフレームワークの理解](./understanding-the-job-scheduler-framework.md)
* [ジョブスケジューラーを使う](./using-job-scheduler.md)
* [ジョブスケジューラーUIリファレンス](./job-scheduler-ui-reference.md)
