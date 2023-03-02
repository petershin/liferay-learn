---
uuid: 955491f3-1692-420e-9f3e-c9d1b44aefa6
---

# 메시징 성능 조정

메시징 성능은 대상에서 조정됩니다. 성능은 대상 유형, 메시지 수신기에 필요한 처리량 및 메시지 처리에 사용할 수 있는 스레드 풀에 따라 다릅니다.

세 가지 대상 유형은 다음과 같습니다.

**병렬 대상**
* 여기에서 보낸 메시지는 대기 중입니다.
* 스레드 풀의 작업자 스레드는 등록된 메시지 수신기에 메시지를 전달합니다(메시지 수신기당 메시지당 하나의 작업자 스레드). 스레드는 대상의 메시지 수신기에 동일한 메시지를 동시에 전달합니다.

**직렬 대상**
* 여기에서 보낸 메시지는 대기 중입니다.
* 스레드 풀의 작업자 스레드는 메시지당 하나의 작업자 스레드인 등록된 메시지 수신기에 메시지를 전달합니다.

**동기 대상**
* 여기에서 보낸 메시지는 메시지 수신기에 직접 전달됩니다.
* 메시지를 보내는 스레드는 메시지를 모든 메시지 수신기에도 전달합니다.

해당 대상 유형을 사용하여 다양한 방법으로 메시지를 보낼 수 있습니다.

**대상 유형 호환성**

다음은 각 대상 유형의 [비동기 메시징](./using-asynchronous-messaging.md), [기본 동기 메시징](./using-default-synchronous-messaging-in-previous-versions.md)및 [직접 동기 메시징](./using-direct-synchronous-messaging-in-previous-versions.md)과의 호환성입니다.

| 대상 유형   | 비동기 메시징 | 기본 동기식 메시징 | 직접 동기식 메시징 |
|:------- |:------- |:---------- |:---------- |
| **평행한** | 그렇다     | 그렇다        | 부정         |
| **연속물** | 그렇다     | 그렇다        | 부정         |
| **동기식** | 부정      | 부정         | 그렇다        |

여기에서는 예제 프로젝트의 메시징 성능을 검사하는 것으로 시작합니다. 그런 다음 API를 사용하여 대상 통계를 얻고 대상을 구성합니다. 마지막으로 예제 대상 설정을 재구성하고 예제를 다시 실행하고 통계를 검사합니다.

## 예제 프로젝트의 모니터링 메시징

예제 프로젝트는 목적지를 생성하고, 메시지 리스너를 등록하고, Gogo 셸 명령을 통해 목적지 통계를 나열합니다.
```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps:

1. Download and unzip the example.

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/building-applications/core-frameworks/message-bus/liferay-w3r2.zip -O
    ```

    ```bash
    unzip liferay-w3r2.zip
    ```

1. 예제 프로젝트 모듈을 빌드하고 배포합니다.

    ```bash
    cd liferay-w3r2
    ```

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 모듈 JAR을 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
    ```

1. Docker 컨테이너 콘솔은 모듈 시작을 확인하고 대상 구성을 보고합니다.

    ```
    STARTED com.acme.w3r2.charlie.impl_1.0.0 [1390]
    STARTED com.acme.w3r2.able.impl_1.0.0 [1388]
    [W3R2AbleMessagingConfigurator:27] {_destinationName=acme/w3r2_able,
    _destinationType=serial, _maximumQueueSize=2147483647,
    _rejectedExecutionHandler=null, _workersCoreSize=2, _workersMaxSize=5}
    STARTED com.acme.w3r2.baker.impl_1.0.0 [1389]
    ```

1. `http://localhost:8080` 에서 브라우저로 Liferay 인스턴스를 방문하고 자격 증명을 사용하여 로그인합니다.

1. [스크립트 콘솔](../../../system-administration/using-the-script-engine/running-scripts-from-the-script-console.md)엽니다.

1. 스크립트 필드에서 다음 Groovy 코드를 실행하여 메시지를 보냅니다.

    ```groovy
   import com.liferay.portal.kernel.messaging.*;

    MessageBusUtil.sendMessage(
        "acme/w3r2_able",
        new Message() {
            {
                setPayload("foo");
            }
        });
    ```

1. `W3R2BakerMessageListenerManager` 의 메시지 리스너가 메시지를 수신했는지 확인합니다.

    ```
    [acme/w3r2_able-2][W3R2BakerMessageListenerManager:30] Received message payload foo
    [acme/w3r2_able-2][W3R2BakerMessageListenerManager:30] Received message payload foo
    [acme/w3r2_able-2][W3R2BakerMessageListenerManager:30] Received message payload foo
    [acme/w3r2_able-2][W3R2BakerMessageListenerManager:30] Received message payload foo
    [acme/w3r2_able-2][W3R2BakerMessageListenerManager:30] Received message payload foo
    ```

1. [Gogo 쉘](../../../liferay-internals/fundamentals/using-the-gogo-shell.md)을 엽니다.

1. Gogo 셸 명령 필드에서 `w3r2:listDestinationStats` 명령을 실행하여 대상 통계를 가져옵니다.

    ```groovy
    w3r2:listDestinationStats
    ```

1. `acme/w3r2_able` 목적지의 리스너 10개와 보낸 메시지 수를 확인합니다.

    ```
    [pipe-w3r2:listDestinationStats][W3R2CharlieOSGiCommands:29] acme/w3r2_able
    active thread count 0, current thread count 1, largest thread count 1, max
    thread pool size 1, message listener count 10, min thread pool size 1, pending
    message count 0, sent message count 1
    ```

예제의 3개 모듈은 대상을 구성하고 10개의 메시지 수신기를 등록했으며 대상의 통계를 나열하는 Gogo 셸 명령을 제공했습니다.

`w3r2-able-impl` 의 `W3R2AbleMessagingConfigurator` 활성화되면 `acme/w3r2_able` 대상을 구성하고 `DestinationConfiguration`의 `toString()` 값을 기록합니다.

```{literalinclude} ./tuning-messaging-performance/resources/liferay-w3r2.zip/w3r2-able-impl/src/main/java/com/acme/w3r2/able/internal/messaging/W3R2AbleMessagingConfigurator.java
   :dedent: 1
   :language: java
   :lines: 20-37
```

`w3r2-charlie-impl` 모듈의 `W3R2CharlieOSGiCommands` 은 제공하는 `w3r2:listDestinationStats` Gogo 셸 명령을 사용하여 대상 통계를 기록합니다. `W3R2CharlieOSGiCommands`의 `listDestinationStats()` 메서드가 대상 통계를 가져오는 방법을 조사합니다.

```{literalinclude} ./tuning-messaging-performance/resources/liferay-w3r2.zip/w3r2-charlie-impl/src/main/java/com/acme/w3r2/charlie/internal/osgi/commands/W3R2CharlieOSGiCommands.java
   :language: java
   :lines: 13-56
```

`listDestinationStats()` 메서드는 `_messageBus` 인스턴스를 사용하여 `대상` 가져온 다음 대상에서 `DestinationStatistics` 인스턴스를 가져옵니다. 대상은 `DestinationStatistics` 개체를 최신 통계로 채웁니다. 이 메서드는 다음 대상 정보를 기록합니다.

* 활성 스레드 수
* 현재 스레드 수
* 최대 스레드 수
* 최대 스레드 풀 크기
* 메시지 리스너 수
* 최소(시작) 스레드 풀 크기
* 보류 중인 메시지 수
* 보낸 메시지 수

이 동일한 API를 사용하여 메시지 대상을 모니터링할 수 있습니다.

## 메시징 모니터링

메시징 API는 설정 컨텍스트에서 대상에서 메시징 성능 모니터링을 용이하게 합니다. 다음 표에는 대상 설정 및 메시징 통계에 액세스하는 API 방법이 나열되어 있습니다.

**대상 설정:**

| 목적지 설정      | API 방식                                                                                            |
|:----------- |:------------------------------------------------------------------------------------------------- |
| 대상 유형       | `Destination#getDestinationType()`                                                                |
| 최대 스레드 풀 크기 | `DestinationConfiguration#getWorkersMaxSize()` and `DestinationStatistic#getMaxThreadPoolSize()`  |
| 최소 스레드 풀 크기 | `DestinationConfiguration#getWorkersCoreSize()` and `DestinationStatistic#getMinThreadPoolSize()` |
| 메시지 대기열 크기  | `DestinationConfiguration#getMaximumQueueSize()`                                                  |

**대상 통계:**

| 목적지 통계      | API 방식                                           |
|:----------- |:------------------------------------------------ |
| 메시지 리스너 수   | `Destination#getMessageListenerCount()`          |
| 보류 중인 메시지 수 | `DestinationStatistics#getPendingMessageCount()` |
| 보낸 메시지 수    | `DestinationStatistics#getSentMessageCount()`    |
| 현재 스레드 수    | `DestinationStatistics#getCurrentThreadCount()`  |
| 활성 스레드 수    | `DestinationStatistics#getActiveThreadCount()`   |
| 최대 스레드 수    | `DestinationStatistics#getLargestThreadCount()`  |

설정 컨텍스트에서 대상의 통계를 다이제스트해야 합니다.

대상 통계를 검토한 후 대상을 재구성하여 성능을 개선할 수 있습니다.

## 대상 유형 변경

직렬 대상을 사용 중이고 메시지가 일부 메시지 수신기에 충분히 빨리 도달하지 않는 경우 최대 스레드 풀 크기(다음에 설명됨)를 늘리거나 병렬 대상 유형으로 전환해 볼 수 있습니다. Message Bus는 스레드 풀의 스레드를 사용하여 병렬 대상 메시지 수신기를 동시에 처리합니다.

현재 [`DestinationConfiguration`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/DestinationConfiguration.java) 을 원하는 유형 중 하나로 교체하여 대상 유형을 전환할 수 있습니다. 적용 가능한 `DestinationConfiguration` 메서드를 사용하여 새 병렬 또는 직렬 `DestinationConfiguration` 만듭니다.

* `createParallelDestinationConfiguration(String)`
* `createSerialDestinationConfiguration(String)`

자세한 내용은 [예제 대상 재구성](#reconfigure-the-example-destination) 참조하십시오.

## 메시지 큐 및 스레드 풀 구성

각 직렬 및 병렬 대상에는 메시지 대기열과 전용 스레드 풀이 있습니다.

대기열이 가득 찼을 때 메시지가 도착하면 대상의 `RejectedExecutionHandler` 이 메시지를 처리합니다. 기본 핸들러는 메시지를 버리고 경고를 기록합니다. 기본 최대 메시지 대기열 크기는 Java의 최대 정수 값이지만 원하는 경우 줄일 수 있습니다.

메시지 버스는 대상의 스레드 풀에서 스레드를 처리하는 메시지 리스너를 그립니다. 풀에는 시작 크기와 최대 크기가 있습니다.

다음 [`DestinationConfiguration`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/DestinationConfiguration.java) 메서드를 사용하여 최대 메시지 큐 크기, 거부된 실행 핸들러, 스레드 풀 시작 크기(코어 크기) 및 스레드 풀 최대 크기를 변경할 수 있습니다.

* `setMaximumQueueSize(int maximumQueueSize)`
* `setRejectedExecutionHandler(RejectedExecutionHandler rejectedExecutionHandler)`
* `setWorkersCoreSize(int workersCoreSize)`
* `setWorkersMaxSize(int workersMaxSize)`

다음으로 예제 대상을 재구성합니다.

## 예제 대상 재구성

여기에서 다음 설정으로 예제의 `acme/w3r2_able` 대상을 재구성합니다.

* 대상 유형: `병렬`
* 시작 스레드 풀 크기: `10`
* 최대 스레드 풀 크기: `20`

단계는 다음과 같습니다.

1. `W3R2AbleMessagingConfigurator`의 `_activate(BundleContext)` 메서드를 다음 코드로 대체하여 다른 `DestinationConfiguration` 사용합니다.

    ```java
    @Activate
    private void _activate(BundleContext bundleContext) {
        DestinationConfiguration destinationConfiguration =
            DestinationConfiguration.createParallelDestinationConfiguration(
                "acme/w3r2_able");

        destinationConfiguration.setWorkersCoreSize(10);
        destinationConfiguration.setWorkersMaxSize(20);

        if (_log.isInfoEnabled()) {
            _log.info(destinationConfiguration.toString());
        }

        Destination destination = _destinationFactory.createDestination(
            destinationConfiguration);

        _serviceRegistration = bundleContext.registerService(
            Destination.class, destination,
            MapUtil.singletonDictionary(
                "destination.name", destination.getName()));
    }
    ```

1. 모듈을 재배포합니다.

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

1. Docker 컨테이너 콘솔은 `w3r2-able-impl` 모듈 시작을 확인하고 대상 구성을 보고합니다.

    ```
    STARTED com.acme.w3r2.able.impl_1.0.0 [1388]
    [W3R2AbleMessagingConfigurator:27] {_destinationName=acme/w3r2_able,
    _destinationType=parallel, _maximumQueueSize=2147483647,
    _rejectedExecutionHandler=null, _workersCoreSize=10, _workersMaxSize=20}
    ```

1. 다음 Gogo 셸 명령을 실행하여 메시지 수신기 모듈(Acme W3R2 Baker 구현) ID를 가져옵니다.

    ```bash
    lb | grep W3R2
    ```

    각 줄은 해당 모듈의 ID 번호로 시작합니다.

    ```bash
    1388|Active     |   10|Acme W3R2 Able Implementation (1.0.0)|1.0.0
    1389|Active     |   10|Acme W3R2 Baker Implementation (1.0.0)|1.0.0
    1390|Active     |   10|Acme W3R2 Charlie Implementation (1.0.0)|1.0.0
    ```

1. 다음 Gogo 셸 명령으로 메시지 수신기 모듈을 다시 시작하여 메시지 수신기를 대상 교체에 바인딩합니다. 숫자를 모듈의 ID로 바꿉니다.

    ```bash
    stop 1389
    ```

    ```bash
    start 1389
    ```

1. 스크립트 콘솔에서 다음 Groovy 코드를 다시 실행하여 다른 메시지를 보냅니다.

    ```groovy
    import com.liferay.portal.kernel.messaging.*;

    MessageBusUtil.sendMessage(
        "acme/w3r2_able",
        new Message() {
            {
                setPayload("foo");
            }
        });
    ```

1. Gogo 셸에서 `w3r2:listDestinationStats` 명령을 실행하여 대상 통계를 가져옵니다.

    ```bash
    w3r2:listDestinationStats
    ```

이와 같은 로그 메시지는 새 설정을 확인합니다.

```bash
[pipe-w3r2:listDestinationStats][W3R2CharlieOSGiCommands:29] acme/w3r2_able
active thread count 0, current thread count 10, largest thread count 10, max
thread pool size 20, message listener count 10, min thread pool size 10,
pending message count 0, sent message count 2
```

이제 대상에서 메시징을 모니터링하고 대상 설정을 조정하는 방법을 알았습니다. 다양한 설정을 테스트하여 성능을 최적화할 수 있습니다.

## 추가 정보

* [비동기 메시징 사용](./using-asynchronous-messaging.md)
* [이전 버전에서 기본 동기 메시징 사용](./using-default-synchronous-messaging-in-previous-versions.md)
* [이전 버전에서 직접 동기식 메시징 사용](./using-direct-synchronous-messaging-in-previous-versions.md)
