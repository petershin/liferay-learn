# Understanding the Job Scheduler Framework

Liferay Job Scheduler is a flexible framework built on top of Liferay's Scheduler Engine. これを使用して、Liferayインスタンス全体でカスタムロジックを含むタスクの追加、実行、およびスケジューリングができます。

The Job Scheduler framework consists of six essential parts:

* [ベースの`DispatchTaskExecutor`](#base-dispatchtaskexecutor)
* [`DispatchTrigger`](#dispatchtrigger)
* [`DispatchMessageListener`](#dispatchmessagelistener)
* [`DispatchTaskExecutorRegistry`](#dispatchtaskexecutorregistry)
* [`DispatchLog`](#dispatchlog)
* [`DispatchConfigurator`](#dispatchconfigurator)

## ベースの`DispatchTaskExecutor`

Implementations of the base [`DispatchTaskExecutor`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-api/src/main/java/com/liferay/dispatch/executor/DispatchTaskExecutor.java) interface create templates for Job Scheduler Tasks in a Liferay instance. Each implementation of `DispatchTaskExecutor` is registered as an OSGi component and contains the logic executed by the Job Scheduler task. All Job Scheduler tasks are instances of Java classes that implement the `DispatchTaskExecutor` interface and have the `dispatch.task.executor.name` and `dispatch.task.executor.type` OSGi component properties. See [Creating a New Job Scheduler Task Executor](./creating-a-new-job-scheduler-task-executor.md) to learn more.

## `DispatchTrigger`

[`DispatchTrigger`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-api/src/main/java/com/liferay/dispatch/model/DispatchTrigger.java) インターフェイスは、`DispatchTriggerModel`と`PersistedModel`を拡張します。 このエンティティは、Liferay（Quartz）トリガーのドラフトとして機能します。 これは、`DispatchTaskExecutor`とLiferayスケジューラーエンジン間の接続です。

## `DispatchMessageListener`

The [`DispatchMessageListener`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-service/src/main/java/com/liferay/dispatch/internal/messaging/DispatchMessageListener.java) class initiates the execution of all Job Scheduler Task Executors. これは、`DispatchTaskExecutor`サービスクラスのスケジュールされたインスタンスごとに新しいLiferayトリガーが作成されることを意味します。 このトリガーは同じ宛先（`liferay/dispatch/executor`）で作成され、Liferayトリガーを`DispatchTaskExecutor`に接続するペイロード（`dispatchTriggerId`）を持っています。 次に、Liferayスケジューラーエンジンは、適切なタイミングでメッセージ（`dispatchTriggerId`）を使用して`DispatchMessageListener`をトリガーします。 `dispatchTriggerId`を使用すると、`DispatchMessageListener`は、`DispatchTaskExecutorRegistry`を使用して`DispatchTaskExecutor`の適切なインスタンスを見つけて実行します。

## `DispatchTaskExecutorRegistry`

[`DispatchTaskExecutorRegistry`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-api/src/main/java/com/liferay/dispatch/executor/DispatchTaskExecutorRegistry.java) インターフェイスを実装すると、ポータル内の`DispatchTaskExecutor`のすべての実装への参照が保持され、各`dispatch.task.executor.type` OSGiのプロパティ値が一意であることが検証されます。

## `DispatchLog`

[`DispatchLog`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-api/src/main/java/com/liferay/dispatch/model/DispatchLog.java) インターフェイスは、`DispatchLogModel`と`PersistedModel`を拡張します。 This entity is responsible for persisting Job Scheduler task execution logs.

## `DispatchConfigurator`

The [`DispatchConfigurator`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-service/src/main/java/com/liferay/dispatch/internal/messaging/DispatchConfigurator.java) class defines properties of the Job Scheduler framework, such as the `DispatchMessageListener` destination, `executorService` queue size and thread pool, `RejectedExecutionHandler`, and more.

## 追加情報

* [Using Job Scheduler](./using-job-scheduler.md)
* [Job Scheduler UI Reference](./job-scheduler-ui-reference.md)
* [Creating a New Job Scheduler Executor](./creating-a-new-job-scheduler-task-executor.md)
