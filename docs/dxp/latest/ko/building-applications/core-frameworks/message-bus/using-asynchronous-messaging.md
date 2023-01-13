# 비동기 메시징 사용

Message Bus의 비동기식 옵션은 "실행 후 삭제" 동작을 제공합니다. 메시지를 보내고 응답을 기다리지 않고 처리를 계속합니다.

비동기 메시지는 *직렬* 또는 *병렬* 대상으로 전송됩니다.

* *직렬* 대상의 경우 메시지 버스는 메시지를 대기열에 넣고 메시지당 하나의 작업자 스레드를 위임합니다. 스레드는 메시지 수신기를 순차적으로 처리합니다.

* *병렬* 대상의 경우 메시지 버스는 메시지를 대기열에 넣고 메시지 수신기당 메시지당 하나의 작업자 스레드를 위임합니다. 스레드는 메시지 수신기를 동시에 처리합니다.

다른 클래스(메시지 수신기)가 수신하는 직렬 대상으로 메시지를 보내는 것으로 시작합니다.

## 메시지를 보내다
```{include} /_snippets/run-liferay-portal.md
```

Then, start with sending a message in an example project.

1. Download and unzip the example.

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/building-applications/core-frameworks/message-bus/liferay-n8k5.zip -O
   ```

   ```bash
   unzip liferay-n8k5.zip
   ```

1. 대상 모듈 `n8k5-able-impl`을 빌드하고 배포합니다.

    ```bash
    cd liferay-n8k5/n8k5-able-impl
    ```

    ```bash
    ../gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 모듈 JAR을 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
    ```


    The Docker container console shows that the module started.

    ```bash
    STARTED com.acme.n8k5.able.impl_1.0.0
    ```

1. 수신기 모듈 `n8k5-charlie-impl`을 빌드하고 배포합니다.

    ```bash
    cd ../n8k5-charlie-impl
    ```

    ```bash
    ../gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```


    The Docker container console shows that the module started.

    ```bash
    STARTED com.acme.n8k5.charlie.impl_1.0.0
    ```

1. 송신기 모듈 `n8k5-baker-impl`을 빌드하고 배포합니다.

    ```bash
    cd ../n8k5-baker-impl
    ```

    ```bash
    ../gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```


    In the Docker container console, confirm `N8K5Baker` sent a message, `N8K5CharlieMessageListener` received a message, and the `n8k5-baker-impl` module started.

   ```bash
   INFO  [pipe-start 2025][N8K5Baker:24] Sent message to acme/n8k5_able
   INFO  [acme/n8k5_able-4][N8K5CharlieMessageListener:21] Received message payload N8K5Baker#_activate
   STARTED com.acme.n8k5.baker.impl_1.0.0 [2025]
   ```

`N8K5Baker` 이 대상 `acme/n8k5_able`에 메시지를 전송했다고 보고했습니다. `N8K5CharlieMessageListener` 이 대상 `acme/n8k5_able`에서 페이로드 `N8K5Baker#_activate` 이 포함된 메시지를 수신했습니다. 이제 예제 코드를 검사할 수 있습니다.

## 프로젝트 개요

예제의 세 모듈에는 각각 하나의 클래스가 있습니다. 각 클래스는 대상, 발신자, 수신기와 같은 메시징 구성 요소 중 하나를 나타냅니다.

예제 클래스:

| 종류                                              | 묘사                                               |
|:----------------------------------------------- |:------------------------------------------------ |
| n8k5-able-impl의 `N8K5AbleMessagingConfigurator` | `acme/n8k5_able` 이라는 메시지 대상을 생성하고 메시지 버스에 등록합니다. |
| n8k5-baker-impl의 `N8K5Baker`                    | `acme/n8k5_able` 목적지로 메시지를 보냅니다.                 |
| n8k5-charlie-impl의 `N8K5CharlieMessageListener` | `acme/n8k5_able` 대상으로 전송된 메시지를 수신합니다.            |

그들이 상호 작용하는 방법은 다음과 같습니다.

1. `N8K5Baker` 이 활성화되고(예: `n8k5-baker-impl` 모듈이 시작될 때) `acme/n8k5_able` 대상으로 메시지를 보냅니다.
1. 메시지 버스는 메시지를 `N8K5CharlieMessageListener`로 보냅니다.
1. `N8K5CharlieMessageListener` 이 메시지를 수신합니다.

대상 구성 및 발신자 클래스를 검사합니다. 리스너 클래스 `N8K5CharlieMessageListener` 은 [메시지 수신](./listening-for-messages.md) 에서 설명한 것과 같은 방식으로 등록합니다.

## 대상 구성 검사

`n8k5-able-impl` 모듈의 `N8K5AbleMessagingConfigurator` 클래스는 대상을 생성하고 구성합니다. 코드는 다음과 같습니다.

```{literalinclude} ./using-asynchronous-messaging/resources/liferay-n8k5.zip/n8k5-able-impl/src/main/java/com/acme/n8k5/able/internal/messaging/N8K5AbleMessagingConfigurator.java
:language: java
:lines: 15-42
```

모든 클래스는 대상을 만들고 구성할 수 있지만 [`구성 요소`](https://docs.osgi.org/javadoc/osgi.cmpn/7.0.0/org/osgi/service/component/annotations/Component.html) 에는 `DestinationFactory`와 같은 종속성이 주입될 수 있습니다. `_destinationFactory` 필드의 [`@Reference`](https://docs.osgi.org/javadoc/osgi.cmpn/7.0.0/org/osgi/service/component/annotations/Reference.html) 주석은 Liferay의 OSGi 프레임워크에 `DestinationFactory` 인스턴스를 주입하라는 신호를 보냅니다.

`_activate` 메서드에서 `N8K5AbleMessagingConfigurator` 은 [`DestinationFactory`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/DestinationFactory.java) 및 [`DestinationConfiguration`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/DestinationConfiguration.java) 을 사용하여 `acme/n8k5_able`라는 *직렬* 대상을 생성합니다. 그런 다음 OSGi 프레임워크 `BundleContext` 을 사용하여 `대상`에 대한 서비스를 등록합니다. `N8K5AbleMessagingConfigurator` 이 비활성화되면 `_deactivate` 메서드가 서비스 등록을 취소합니다.

## 발신자 조사

아래의 `N8K5Baker` 클래스는 페이로드 `"N8K5Baker#_activate"` 가 포함된 메시지를 목적지 `acme/n8k5_able`로 보냅니다.

```{literalinclude} ./using-asynchronous-messaging/resources/liferay-n8k5.zip/n8k5-baker-impl/src/main/java/com/acme/n8k5/baker/internal/N8K5Baker.java
:language: java
:lines: 12-23
```

구성 요소로서 `N8K5Baker` 은 `@Reference` 주석을 사용하여 `MessageBus` 인스턴스를 삽입합니다.

구성 요소 활성화 시 `N8K5Baker` 은 활성화 메서드 `_activate()`을 통해 메시지를 생성하고 보냅니다. [`Message`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/Message.java) 인스턴스를 구성하고 여기에 페이로드를 추가합니다. 페이로드는 `메시지`에 채울 수 있는 여러 항목 중 하나입니다.

주요 메시지 채우기 방법은 다음과 같습니다.

| 방법                                    | 묘사                        |
|:------------------------------------- |:------------------------- |
| `setPayload(Object)`                  | `Message`의 메인 콘텐츠를 추가합니다. |
| `setResponseDestinationName(String)`  | `대상` 을 참조하여 응답을 받습니다.     |
| `setValues(Map<String,Object>)` | `지도`에서 추가 데이터를 제공합니다.     |

`N8K5Baker` 은 [`MessageBus`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/MessageBus.java)의 `sendMessage(String, Message)` 메서드를 호출하여 `acme/n8k5_able` 이라는 이름의 [`목적지`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/Destination.java) 로 메시지를 보냅니다. `MessageBus` 은 새 스레드를 시작하고 `Message` 을 `acme/n8k5_able` `Destination`에 등록된 [`MessageListener`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/MessageListener.java) 인스턴스로 보냅니다. `N8K5Baker`의 스레드가 계속됩니다.

```{note}
`Message`에 대한 응답을 받으려면 `Message`에 응답 대상을 설정하고 해당 대상에 `N8K5Baker`와 같은 클래스를 `MessageListener`로 등록하십시오. 자세한 내용은 [메시지 듣기](./listening-for-messages.md)를 참조하십시오.
```

## 응답 처리 추가

메시지 수신자의 응답을 원하는 경우 답장에 대한 응답 대상을 설정합니다.

1. 메시지 응답을 위한 별도의 대상을 등록합니다.
1. 응답 대상에서 클래스(예: 원래 보낸 사람)를 `MessageListener` 로 등록합니다.
1. 메시지에 응답 대상을 전달합니다.
1. `MessageListener`s에 응답 로직을 추가합니다.

### 1단계: 응답 대상 등록

`N8K5Baker` 을 수정하여 `N8K5AbleDestinationConfigurator` 이 대상을 관리하는 것과 같은 방식으로 응답 대상을 관리할 수 있습니다. `_activate()` 메서드 서명을 `_activate(BundleContext bundleContext)` 으로 바꾸고 `acme/n8k5_baker` 응답 대상에 대한 서비스를 생성, 구성 및 등록하는 코드를 추가합니다. 서비스 등록을 취소하는 `_deactivate()` 메서드를 추가합니다. `_activate(BundleContext bundleContext)` 및 `_deactivate()` 메서드는 다음과 같아야 합니다.

```java
@Activate
private void _activate(BundleContext bundleContext) {
   Destination destination = _destinationFactory.createDestination(
      DestinationConfiguration.createSerialDestinationConfiguration(
         "acme/n8k5_baker"));

   _serviceRegistration = bundleContext.registerService(
      Destination.class, destination,
      MapUtil.singletonDictionary(
         "destination.name", destination.getName()));

   Message message = new Message();

   message.setPayload("N8K5Baker#_activate");

   _messageBus.sendMessage("acme/n8k5_able", message);
}

@Deactivate
private void _deactivate() {
   if (_serviceRegistration != null) {
      _serviceRegistration.unregister();
   }
}

@Reference
private DestinationFactory _destinationFactory;

private ServiceRegistration<Destination> _serviceRegistration;
```

### 2단계: `N8K5Baker` 을 응답 대상에 리스너로 등록

발신자 `N8K5Baker`에 대한 변경 사항은 다음과 같습니다.

1. `@Component` 주석을 업데이트하여 `N8K5Baker` 을 유형 `MessageListener.class` 의 서비스로 선언하고 `N8K5Baker` 을 속성 `"destination.name=acme/n8k5_baker"`를 통해 응답 대상에 매핑합니다.
1. [`MessageListener`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/MessageListener.java) 인터페이스를 구현합니다.
1. `receive(Message)` 메서드를 메시지 처리 논리로 재정의합니다.

발신자 변경사항은 다음과 같습니다.

```java
@Component(
    property = "destination.name=acme/n8k5_baker",
    service = MessageListener.class
)
public class N8K5Baker implements MessageListener {

    @Override
    public void receive(Message message) {
        Object payload = message.getPayload();

        _log.info("Received message payload " + payload.toString());
    }

   // Existing methods and fields

   private static final Log _log = LogFactoryUtil.getLog(N8K5Baker.class);
}
```

### 3단계: 메시지에 응답 대상 전달

N8K5Baker</code> 가 보내는 메시지 `에서 응답 대상으로 <code>acme/n8k5_baker` 을 설정합니다. 다음과 같습니다.

```java
@Activate
private void _activate(BundleContext bundleContext) {
   // Destination setup

   Message message = new Message();

   message.setPayload("N8K5Baker#_activate");
   message.setResponseDestinationName("acme/n8k5_baker");

   _messageBus.sendMessage("acme/n8k5_able", message);
}
```

### 4단계: `MessageListener`s에 응답 논리 추가

`MessageListener`의 `receive(Message)` 메서드에서 응답을 설정하고 메시지에서 응답 대상을 가져오고 `MessageBus` 인스턴스를 사용하여 응답 대상에 응답 메시지를 보냅니다. 다음과 같습니다.

```java
public void receive(Message message) {
   // Message processing

   message.setResponse("N8K5CharlieMessageListener");

   Message responseMessage = new Message();

   responseMessage.setDestinationName(
      message.getResponseDestinationName());
   responseMessage.setPayload("N8K5CharlieMessageListener");
   responseMessage.setResponseId(message.getResponseId());

   _messageBus.sendMessage(
      message.getResponseDestinationName(), responseMessage);
}

// Existing methods and fields

@Reference
private MessageBus _messageBus;
```

### 변경 사항 테스트

예제 프로젝트를 재배포하여 변경 사항을 테스트합니다.

```bash
cd ../../liferay-n8k5.zip
```

```bash
./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

출력은 다음과 같습니다.

```bash
STARTED com.acme.n8k5.charlie.impl_1.0.0 [2020]
STARTED com.acme.n8k5.baker.impl_1.0.0 [2025]
INFO  [acme/n8k5_able-2][N8K5CharlieMessageListener:23] Received message payload N8K5Baker#_activate
INFO  [acme/n8k5_baker-2][N8K5Baker:30] Received message payload N8K5CharlieMessageListener
```

`N8K5CharlieMessageListener` 은 `N8K5Baker`의 메시지를 수신한 후 응답 대상으로 응답 메시지를 보냅니다. `N8K5Baker` 은 응답 메시지를 수신하고 메시지 페이로드를 인쇄합니다.

```{note}
클래스에서 메시지를 다시 교환하려면 [Gogo Shell](../../../liferay-internals/fundamentals/using-the-gogo-shell.md에서 모듈(OSGi 번들)을 다시 시작하면 됩니다. ). 번들을 나열(`lb`)하여 번들 ID를 가져오고, 번들을 중지하고(`stop <id>), 번들을 다시 시작합니다(`start <id>).
```

```{note}
OSGi 구성 요소가 아닌 클래스에서는 [MessageBusUtil](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/)을 사용하여 메시지를 보낼 수 있습니다. 메시징/MessageBusUtil.java) 및 `Destination`, `DestinationConfiguration`, `Message` 및 `MessageListener` 인스턴스.

다른 방법으로 `BundleContext`를 가져와야 한다는 점을 제외하면 설명된 대로 `Destination` 서비스를 등록할 수 있습니다(예: `Bundle bundle = FrameworkUtil.getBundle(YourClass.class); BundleContext bundleContext = bundle.getBundleContext( )`).
```

축하합니다! 두 클래스 간에 비동기적으로 메시지를 교환했습니다.

## 무엇 향후 계획

이제 비동기 메시징에 익숙해졌으므로 최적의 성능을 위해 조정할 수 있습니다. [메시징 성능 조정](./tuning-messaging-performance.md)에서 방법을 알아보십시오.

*default* 및 *direct* 모드를 사용하여 동기식 메시징을 탐색하려면 자세한 내용은 [Direct Synchronous Messaging 사용](./using-direct-synchronous-messaging.md) 및 [Using Default Synchronous Messaging](./using-default-synchronous-messaging.md) 을 참조하십시오.

## 추가 정보

* [메시지 버스](../message-bus.md)
* [메시지 듣기](./listening-for-messages.md)
* [등록 이벤트 수신](./listening-for-registration-events.md)
