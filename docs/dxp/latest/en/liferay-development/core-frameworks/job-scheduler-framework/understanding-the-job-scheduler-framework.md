---
uuid: b3d03520-8ea9-4eb3-bb02-b868d05f08cf
taxonomy-category-names:
- Integration
- Data Integration
- Liferay Self-Hosted
- Liferay PaaS
---
# Understanding the Job Scheduler Framework

Liferay Job Scheduler is a flexible framework built on top of Liferay's Scheduler Engine. You can use it to add, execute, and schedule tasks containing any custom logic across a Liferay instance.

The Job Scheduler framework consists of six essential parts:

* [Base `DispatchTaskExecutor`](#base-dispatchtaskexecutor)
* [`DispatchTrigger`](#dispatchtrigger)
* [`DispatchMessageListener`](#dispatchmessagelistener)
* [`DispatchTaskExecutorRegistry`](#dispatchtaskexecutorregistry)
* [`DispatchLog`](#dispatchlog)
* [`DispatchConfigurator`](#dispatchconfigurator)

## Base `DispatchTaskExecutor`

Implementations of the base [`DispatchTaskExecutor`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-api/src/main/java/com/liferay/dispatch/executor/DispatchTaskExecutor.java) interface create templates for Job Scheduler Tasks in a Liferay instance. Each implementation of `DispatchTaskExecutor` is registered as an OSGi component and contains the logic executed by the Job Scheduler task. All Job Scheduler tasks are instances of Java classes that implement the `DispatchTaskExecutor` interface and have the `dispatch.task.executor.name` and `dispatch.task.executor.type` OSGi component properties. See [Creating a New Job Scheduler Task Executor](./creating-a-new-job-scheduler-task-executor.md) to learn more.

## `DispatchTrigger`

The [`DispatchTrigger`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-api/src/main/java/com/liferay/dispatch/model/DispatchTrigger.java) interface extends `DispatchTriggerModel` and `PersistedModel`. This entity serves as a draft for a Liferay (Quartz) trigger. It is a connection between `DispatchTaskExecutor`s and the Liferay scheduler engine.

## `DispatchMessageListener`

The [`DispatchMessageListener`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-service/src/main/java/com/liferay/dispatch/internal/messaging/DispatchMessageListener.java) class initiates the execution of all Job Scheduler Task Executors. This means a new Liferay trigger is created for each scheduled instance of the `DispatchTaskExecutor` service class. This trigger is created with the same destination (`liferay/dispatch/executor`) and has a payload (`dispatchTriggerId`) that connects the Liferay trigger with `DispatchTaskExecutor`. The Liferay Scheduler engine then triggers `DispatchMessageListener` at the appropriate time with a message (`dispatchTriggerId`). Using `dispatchTriggerId`, `DispatchMessageListener` finds and runs the appropriate instance of `DispatchTaskExecutor` using the `DispatchTaskExecutorRegistry`.

## `DispatchTaskExecutorRegistry`

Implementations of the [`DispatchTaskExecutorRegistry`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-api/src/main/java/com/liferay/dispatch/executor/DispatchTaskExecutorRegistry.java) interface hold references to all implementations of `DispatchTaskExecutor` in the portal and validate that each `dispatch.task.executor.type` OSGi property value is unique.

## `DispatchLog`

The [`DispatchLog`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-api/src/main/java/com/liferay/dispatch/model/DispatchLog.java) interface extends `DispatchLogModel` and `PersistedModel`. This entity is responsible for persisting Job Scheduler task execution logs.

## `DispatchConfigurator`

The [`DispatchConfigurator`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-service/src/main/java/com/liferay/dispatch/internal/messaging/DispatchConfigurator.java) class defines properties of the Job Scheduler framework, such as the `DispatchMessageListener` destination, `executorService` queue size and thread pool, `RejectedExecutionHandler`, and more.

## Related Topics

* [Using Job Scheduler](./using-job-scheduler.md)
* [Job Scheduler UI Reference](./job-scheduler-ui-reference.md)
* [Creating a New Job Scheduler Executor](./creating-a-new-job-scheduler-task-executor.md)
