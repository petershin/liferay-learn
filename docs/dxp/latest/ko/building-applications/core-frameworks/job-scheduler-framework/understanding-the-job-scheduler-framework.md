# 작업 스케줄러 프레임워크 이해

Liferay 작업 스케줄러는 Liferay의 스케줄러 엔진 위에 구축된 유연한 프레임워크입니다. 이를 사용하여 Liferay 인스턴스 전체에서 사용자 지정 논리를 포함하는 작업을 추가, 실행 및 예약할 수 있습니다.

작업 스케줄러 프레임워크는 6개의 필수 부분으로 구성됩니다.

* [기본 `DispatchTaskExecutor`](#base-dispatchtaskexecutor)
* [`DispatchTrigger`](#dispatchtrigger)
* [`DispatchMessageListener`](#dispatchmessagelistener)
* [`DispatchTaskExecutorRegistry`](#dispatchtaskexecutorregistry)
* [`DispatchLog`](#dispatchlog)
* [`DispatchConfigurator`](#dispatchconfigurator)

## 기본 `DispatchTaskExecutor`

기본 [`DispatchTaskExecutor`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-api/src/main/java/com/liferay/dispatch/executor/DispatchTaskExecutor.java) 인터페이스의 구현은 Liferay 인스턴스의 작업 스케줄러 작업에 대한 템플릿을 생성합니다. `DispatchTaskExecutor` 의 각 구현은 OSGi 구성 요소로 등록되며 작업 스케줄러 작업에 의해 실행되는 논리를 포함합니다. 모든 작업 스케줄러 작업은 `DispatchTaskExecutor` 인터페이스를 구현하고 `dispatch.task.executor.name` 및 `dispatch.task.executor.type` OSGi 구성 요소 속성을 갖는 Java 클래스의 인스턴스입니다. 자세한 내용은 [새 작업 스케줄러 작업 실행기 만들기](./creating-a-new-job-scheduler-task-executor.md) 을 참조하십시오.

## `DispatchTrigger`

[`DispatchTrigger`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-api/src/main/java/com/liferay/dispatch/model/DispatchTrigger.java) 인터페이스는 `DispatchTriggerModel` 및 `PersistedModel`을 확장합니다. 이 엔티티는 Liferay(Quartz) 트리거의 초안 역할을 합니다. `DispatchTaskExecutor`s와 Liferay 스케줄러 엔진 간의 연결입니다.

## `DispatchMessageListener`

[`DispatchMessageListener`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-service/src/main/java/com/liferay/dispatch/internal/messaging/DispatchMessageListener.java) 클래스는 모든 작업 스케줄러 작업 실행기의 실행을 시작합니다. 이는 `DispatchTaskExecutor` 서비스 클래스의 예약된 각 인스턴스에 대해 새 Liferay 트리거가 생성됨을 의미합니다. 이 트리거는 동일한 대상(`liferay/dispatch/executor`)으로 생성되며 Liferay 트리거를 `DispatchTaskExecutor`와 연결하는 페이로드(`dispatchTriggerId`)가 있습니다. 그런 다음 Liferay 스케줄러 엔진은 메시지(`dispatchTriggerId`)와 함께 적절한 시간에 `DispatchMessageListener` 을 트리거합니다. `dispatchTriggerId`, `DispatchMessageListener` 을 사용하여 `DispatchTaskExecutorRegistry`을 사용하여 `DispatchTaskExecutor` 의 적절한 인스턴스를 찾아 실행합니다.

## `DispatchTaskExecutorRegistry`

[`DispatchTaskExecutorRegistry`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-api/src/main/java/com/liferay/dispatch/executor/DispatchTaskExecutorRegistry.java) 인터페이스의 구현은 포털에서 `DispatchTaskExecutor` 의 모든 구현에 대한 참조를 보유하고 각 `dispatch.task.executor.type` OSGi 속성 값이 고유한지 확인합니다.

## `DispatchLog`

[`DispatchLog`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-api/src/main/java/com/liferay/dispatch/model/DispatchLog.java) 인터페이스는 `DispatchLogModel` 및 `PersistedModel`을 확장합니다. 이 엔터티는 Job Scheduler 작업 실행 로그를 유지하는 역할을 합니다.

## `DispatchConfigurator`

[`DispatchConfigurator`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-service/src/main/java/com/liferay/dispatch/internal/messaging/DispatchConfigurator.java) 클래스는 `DispatchMessageListener` 대상, `executorService` 대기열 크기 및 스레드 풀, `RejectedExecutionHandler`등과 같은 Job Scheduler 프레임워크의 속성을 정의합니다.

## 추가 정보

* [작업 스케줄러 사용](./using-job-scheduler.md)
* [작업 스케줄러 UI 참조](./job-scheduler-ui-reference.md)
* [새 작업 스케줄러 실행기 만들기](./creating-a-new-job-scheduler-task-executor.md)
