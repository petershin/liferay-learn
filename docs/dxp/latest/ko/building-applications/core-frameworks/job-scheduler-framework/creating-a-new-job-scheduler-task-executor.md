# 새 작업 스케줄러 작업 실행기 만들기

각 작업 스케줄러 작업은 `DispatchTaskExecutor` 인터페이스를 구현하여 생성되며 모든 논리를 실행할 수 있습니다. Liferay DXP는 즉시 사용 가능한 여러 실행기를 제공하지만 직접 만들 수 있습니다. 생성 및 배포되면 작업 스케줄러 작업을 Liferay 인스턴스에 추가할 수 있습니다.

다음 단계에 따라 `DispatchTaskExecutor` 인터페이스 구현을 직접 만드십시오.

1. **OSGI 구성 요소** : `@Component` 주석을 사용하여 모듈을 OSGi 프레임워크 내의 구성 요소로 선언합니다.

1. **서비스** : `@Component` 주석 내에서 모듈을 `DispatchTaskExecutor.class` 서비스로 식별합니다.

1. **OSGi 속성** : `@Component` 주석에 다음 속성을 추가합니다.

   * `dispatch.task.executor.name`: Job Scheduler UI에서 실행기 이름에 사용되는 문자열을 정의합니다.

      ```{note}
      Job Scheduler 작업에서 현지화된 이름을 사용하려면 `dispatch.task.executor.name` 속성의 언어 키 값을 모듈의 `resources/content/Language.properties` 파일에 추가하십시오.
      ```

   * `dispatch.task.executor.type`: 올바른 Job Scheduler Task Executor 및 Job Scheduler Trigger와 일치하도록 고유한 `유형` 값을 정의합니다.

      ```{note}
      올바른 실행기가 일치하도록 하려면 값이 고유해야 합니다. 값이 고유하지 않은 경우 시작 시 로그에 동일한 속성 값이 있는 실행기를 나타내는 오류가 표시됩니다.
      ```

1. [**`DispatchTaskExecutor`**](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-api/src/main/java/com/liferay/dispatch/executor/DispatchTaskExecutor.java) : `DispatchTaskExecutor` 인터페이스를 구현하거나 구현을 확장합니다(예: `BaseDispatchTaskExecutor`).

      ```{important}
      'DispatchTaskExecutor' 인터페이스의 구현은 Job Scheduler 작업에 대한 상태 로그를 처리해야 합니다. 프레임워크는 작업의 동시 실행을 제어하기 위해 해당 로그에 의존하기 때문입니다.

      귀하의 편의를 위해 Liferay는 `BaseDispatchTaskExecutor` 추상 [class](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dispatch/dispatch-api/src/main/java/com/liferay) 을 제공합니다. /dispatch/executor/BaseDispatchTaskExecutor.java) Job Scheduler 작업의 상태를 `IN PROGRESS`, `SUCCESSFUL` 또는 `FAILED`로 기록합니다.
      ```

1. **방법** : `DispatchTaskExecutor` 인터페이스를 직접 구현하는 경우 `execute()` 메서드를 재정의하여 사용자 지정 논리를 구현합니다. 대신 `BaseDispatchTaskExecutor` 추상 클래스를 확장하는 경우 `doExecute()` 메서드를 재정의합니다.

   ```{note}
   `getName()` 메서드는 더 이상 사용되지 않으며 `dispatch.task.executor.name` 속성으로 대체됩니다.
   ```

   ```{tip}
   `dispatchTrigger.getDispatchTaskSettings()` 메서드를 사용하여 Job Scheduler 작업의 설정 편집기에 설정된 속성을 가져올 수 있습니다.
   ```

다음 샘플 모듈은 사용자 정의 Job Scheduler Task Executor를 생성하고 Liferay 인스턴스에 배포하는 방법을 보여줍니다.

## 샘플 작업 스케줄러 태스크 실행자 배포

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계에 따라 샘플 Job Scheduler Task Executor를 다운로드, 빌드 및 새 Docker 컨테이너에 배포합니다.

1. 예제 모듈을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/building-applications/core-frameworks/job-scheduler-framework/liferay-s7a3.zip -O
   ```

   ```bash
   unzip liferay-s7a3.zip
   ```

1. 이 `gradlew` 명령을 실행하여 JAR 파일을 빌드하고 새 Docker 컨테이너에 배포합니다.

   ```bash
   cd liferay-s7a3
   ```

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   JAR은 `build/libs` 폴더(예: `s7a3-impl/build/libs/com.acme.s7a3.impl-1.0.0`)에 생성됩니다.

1. 컨테이너 콘솔을 통해 모듈이 성공적으로 배포되고 시작되었는지 확인합니다.

   ```log
   Processing com.acme.s7a3.impl-1.0.0.jar
   STARTED com.acme.s7a3.impl-1.0.0 [1656]
   ```

1. 모듈을 사용하여 Liferay 인스턴스에 새 작업 스케줄러 작업 [을 추가하여 모듈이 작동하는지 확인](./using-job-scheduler.md#adding-a-new-job-scheduler-task) .

   ![새 템플릿을 사용하여 새 작업 스케줄러 작업을 추가합니다.](./creating-a-new-job-scheduler-task-executor/images/01.png)

   작업을 생성했으면 **지금 실행** 을 클릭합니다.

   ![새 작업 스케줄러 작업에 대해 지금 실행을 클릭합니다.](./creating-a-new-job-scheduler-task-executor/images/02.png)

   성공하면 실행될 때 콘솔에 다음 메시지를 인쇄해야 합니다.

   ```log
   INFO [liferay/dispatch/executor-2][S7A3DispatchTaskExecutor:30] Invoking #doExecute(DispatchTrigger, DispatchTaskExecutorOutput)
   ```

   작업을 클릭하고 **Logs** 탭으로 이동하여 모든 이전 실행 목록을 볼 수도 있습니다.

   ![작업 스케줄러 작업에 대한 로그를 보고 관리합니다.](./creating-a-new-job-scheduler-task-executor/images/03.png)

## 샘플 작업 스케줄러 작업 실행기용 코드

```{literalinclude} creating-a-new-job-scheduler-task-executor/resources/liferay-s7a3.zip/s7a3-impl/src/main/java/com/acme/s7a3/internal/dispatch/executor/S7A3DispatchTaskExecutor.java
   :language: java
   :lines: 15-44
```

모듈은 OSGi `@Component` 로 선언되고 두 가지 속성( `dispatch.task.executor.name` 및 `dispatch.task.executor.type`)을 정의합니다. 그런 다음 모듈을 `DispatchTaskExecutor.class` 서비스로 식별합니다.

`@Component` 주석에 이어 모듈은 `BaseDispatchTaskExecutor` 추상 클래스를 확장하고 `doExecute` 메서드를 재정의합니다. 이 방법은 `LogFactoryUtil` 을 사용하여 콘솔 로그에 INFO 메시지를 표시합니다.

## 관련 주제

* [작업 스케줄러 프레임워크 이해](./understanding-the-job-scheduler-framework.md)
* [작업 스케줄러 사용](./using-job-scheduler.md)
* [작업 스케줄러 UI 참조](./job-scheduler-ui-reference.md)
