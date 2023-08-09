# 新しいジョブ・スケジューラー・タスク・エクゼキューターの作成

各ジョブスケジューラタスクは、 `DispatchTaskExecutor` インターフェイスを実装して作成され、任意のロジックを実行できます。 Liferay DXPは、すぐに使える複数のエグゼキュータを提供しますが、独自のエグゼキュータを作成することもできます。 ジョブスケジューラタスクが作成され、デプロイされると、Liferayインスタンスにジョブスケジューラタスクを追加することができます。

次の手順に従って、`DispatchTaskExecutor`インターフェースの独自の実装を作成します。

1. **OSGIコンポーネント**：`@Component`アノテーションを使用して、OSGiフレームワーク内でモジュールをコンポーネントとして宣言します。

1. **サービス**：モジュールを`@Component`アノテーション内の`DispatchTaskExecutor.class`サービスとして識別します。

1. **OSGiプロパティ**：次のプロパティを`@Component`アノテーションに追加します。

   * `dispatch.task.executor.name`: ジョブスケジューラーのUIで実行者名に使用される文字列を定義します。

      ```{note}
      ジョブスケジューラタスクでローカライズされた名前を使いたい場合は、`dispatch.task.executor.name` プロパティの言語キー値をモジュールの `resources/content/Language.properties` ファイルに追加してください。
      ```

   * `dispatch.task.executor.type`: ジョブ・スケジューラー・タスク・エクゼキューターとジョブ・スケジューラー・トリガーにマッチする一意な `type` 値を定義します。

      ```{note}
      正しいエグゼキュータが一致するように、値は一意である必要があります。 値が一意でない場合、ログには起動時にエラーが表示され、同じプロパティ値を持つエグゼキュータが示されます。
      ```

1. [**`DispatchTaskExecutor`**](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-api/src/main/java/com/liferay/dispatch/executor/DispatchTaskExecutor.java)：`DispatchTaskExecutor`インターフェースを実装するか、その実装を拡張します（`BaseDispatchTaskExecutor`など）。

      ```{important}
      DispatchTaskExecutor` インターフェイスの実装では、ジョブスケジューラタスクのステータスログを扱わなければならない。

      便宜上、Liferay は `BaseDispatchTaskExecutor` abstract [class](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-api/src/main/java/com/liferay/dispatch/executor/BaseDispatchTaskExecutor.java) を提供し、ジョブスケジューラタスクのステータスを `IN PROGRESS`, `SUCCESSFUL`, `FAILED` のいずれかで記録します。
      ```

1. **メソッド**：`DispatchTaskExecutor`インターフェースを直接実装している場合は、`execute()`メソッドをオーバーライドしてカスタムロジックを実装します。 代わりに、`BaseDispatchTaskExecutor`抽象クラスを拡張する場合は、その`doExecute()`メソッドをオーバーライドします。

   ```{note}
   `getName()`メソッドは廃止予定となり、`dispatch.task.executor.name`プロパティに置き換えられました。
   ```

   ```{tip}
   `dispatchTrigger.getDispatchTaskSettings()`メソッドを使用すると、ジョブスケジューラタスクの設定エディタに設定されているプロパティを取得することができます。
   ```

次のサンプルモジュールは、カスタムジョブスケジューラタスクエクゼキュータを作成してLiferayインスタンスにデプロイする方法を示しています。

## サンプルジョブスケジューラタスクエクゼキュータの配置

```{include} /_snippets/run-liferay-portal.md
```

次に、次の手順に従って、サンプルの Job Scheduler Task Executor をダウンロード、ビルドし、新しい Docker コンテナにデプロイします。

1. サンプルモジュールをダウンロードして解凍します。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/core-frameworks/job-scheduler-framework/liferay-s7a3.zip -O
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

1. このモジュールを使って [新しいジョブスケジューラタスク](./using-job-scheduler.md#adding-a-new-job-scheduler-task) を Liferay インスタンスに追加して、モジュールが動作していることを確認してください。

   ![新しいテンプレートを使って新しいジョブスケジューラタスクを追加します。](./creating-a-new-job-scheduler-task-executor/images/01.png)

   タスクを作成したら、*［Run Now］*をクリックします。

   ![新しいジョブスケジューラタスクの［今すぐ実行］をクリックします。](./creating-a-new-job-scheduler-task-executor/images/02.png)

   成功すると、実行時に次のメッセージがコンソールに出力されます。

   ```log
   INFO [liferay/dispatch/executor-2][S7A3DispatchTaskExecutor:30] Invoking #doExecute(DispatchTrigger, DispatchTaskExecutorOutput)
   ```

   また、タスクをクリックし、 *Logs* タブに移動して、過去のすべての実行のリストを見ることもできます。

   ![ジョブスケジューラタスクのログを表示、管理します。](./creating-a-new-job-scheduler-task-executor/images/03.png)

## サンプル・ジョブ・スケジューラー・タスク・エクゼキューターのコード

```{literalinclude} creating-a-new-job-scheduler-task-executor/resources/liferay-s7a3.zip/s7a3-impl/src/main/java/com/acme/s7a3/internal/dispatch/executor/S7A3DispatchTaskExecutor.java
   :language: java
   :lines: 15-44
```

モジュールはOSGi `@Component`として宣言され、`dispatch.task.executor.name`と`dispatch.task.executor.type`の2つのプロパティを定義します。 その後、モジュールを`DispatchTaskExecutor.class`サービスとして識別します。

`@Component`アノテーションに続いて、モジュールは`BaseDispatchTaskExecutor`抽象クラスを拡張し、`doExecute`メソッドをオーバーライドします。 このメソッドは、`LogFactoryUtil`を使用して、コンソールのログに通知メッセージを表示します。

## 関連トピック

* [ジョブ・スケジューラ・フレームワークを理解する](./understanding-the-job-scheduler-framework.md)
* [ディスパッチの使用](./using-job-scheduler.md)
* [ジョブスケジューラUIリファレンス](./job-scheduler-ui-reference.md)
