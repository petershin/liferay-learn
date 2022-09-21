# ジョブスケジューラフレームワークの理解

Liferay Job Schedulerは、LiferayのScheduler Engineの上に構築された柔軟なフレームワークです。 これを使用して、Liferayインスタンス全体でカスタムロジックを含むタスクの追加、実行、およびスケジューリングができます。

ジョブスケジューラのフレームワークは、6つの要素で構成されています。

* [ベースの`DispatchTaskExecutor`](#base-dispatchtaskexecutor)
* [`ディスパッチトリガー`](#dispatchtrigger)
* [`DispatchMessageListener`](#dispatchmessagelistener)
* [`DispatchTaskExecutorRegistry（ディスパッチタスクエクセキュータレジストリ`](#dispatchtaskexecutorregistry)
* [`ディスパッチログ`](#dispatchlog)
* [`ディスパッチコンフィギュレータ`](#dispatchconfigurator)

## ベースの`DispatchTaskExecutor`

ベースとなる [`DispatchTaskExecutor`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-api/src/main/java/com/liferay/dispatch/executor/DispatchTaskExecutor.java) インターフェースの実装は、Liferay インスタンスでジョブスケジューラタスクのテンプレートを作成します。 `DispatchTaskExecutor` の各実装は、OSGiコンポーネントとして登録され、ジョブスケジューラタスクで実行されるロジックを含んでいます。 すべてのジョブスケジューラタスクは、 `DispatchTaskExecutor` インターフェースを実装し、 `dispatch.task.executor.name` と `dispatch.task.executor.type` OSGi コンポーネントのプロパティを持つ、Java クラスのインスタンスです。 詳しくは、 [新規ジョブスケジューラ タスクエクゼキュータの作成](./creating-a-new-job-scheduler-task-executor.md) をご覧ください。

## `ディスパッチトリガー`

[`DispatchTrigger`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-api/src/main/java/com/liferay/dispatch/model/DispatchTrigger.java) インターフェイスは、`DispatchTriggerModel`と`PersistedModel`を拡張します。 このエンティティは、Liferay（Quartz）トリガーのドラフトとして機能します。 これは、`DispatchTaskExecutor`とLiferayスケジューラーエンジン間の接続です。

## `DispatchMessageListener`

[`DispatchMessageListener`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-service/src/main/java/com/liferay/dispatch/internal/messaging/DispatchMessageListener.java) クラスは、すべてのジョブスケジューラタスクエクゼキュータの実行を開始します。 これは、`DispatchTaskExecutor`サービスクラスのスケジュールされたインスタンスごとに新しいLiferayトリガーが作成されることを意味します。 このトリガーは同じ宛先（`liferay/dispatch/executor`）で作成され、Liferayトリガーを`DispatchTaskExecutor`に接続するペイロード（`dispatchTriggerId`）を持っています。 次に、Liferayスケジューラーエンジンは、適切なタイミングでメッセージ（`dispatchTriggerId`）を使用して`DispatchMessageListener`をトリガーします。 `dispatchTriggerId`を使用すると、`DispatchMessageListener`は、`DispatchTaskExecutorRegistry`を使用して`DispatchTaskExecutor`の適切なインスタンスを見つけて実行します。

## `DispatchTaskExecutorRegistry（ディスパッチタスクエクセキュータレジストリ`

[`DispatchTaskExecutorRegistry`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-api/src/main/java/com/liferay/dispatch/executor/DispatchTaskExecutorRegistry.java) インターフェイスを実装すると、ポータル内の`DispatchTaskExecutor`のすべての実装への参照が保持され、各`dispatch.task.executor.type` OSGiのプロパティ値が一意であることが検証されます。

## `ディスパッチログ`

[`DispatchLog`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-api/src/main/java/com/liferay/dispatch/model/DispatchLog.java) インターフェイスは、`DispatchLogModel`と`PersistedModel`を拡張します。 このエンティティは、ジョブスケジューラタスクの実行ログを保持する責任を負う。

## `ディスパッチコンフィギュレータ`

[`DispatchConfigurator`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-service/src/main/java/com/liferay/dispatch/internal/messaging/DispatchConfigurator.java) クラスは、`DispatchMessageListener` の送信先、`executorService` のキューサイズとスレッドプール、`RejectedExecutionHandler` など、ジョブスケジューラーフレームワークのプロパティを定義します。

## 追加情報

* [ジョブスケジューラーを使う](./using-job-scheduler.md)
* [ジョブスケジューラーUIリファレンス](./job-scheduler-ui-reference.md)
* [ジョブスケジューラエクゼキュータの新規作成](./creating-a-new-job-scheduler-task-executor.md)
