# 기본 동기 메시징 사용

기본 동기 메시징에서 발신자는 메시지 버스 스레드가 메시지를 등록된 메시지 리스너로 디스패치하는 동안 차단합니다. 발신자는 응답 메시지가 수신되거나 발신자 스레드가 시간 초과되면 차단을 해제합니다.

```{note}
발신자는 수신된 *첫 번째* 응답 메시지에서 차단을 해제합니다.
```

예제 프로젝트를 사용하여 기본 동기 메시지를 보냅니다. 그런 다음 메시지가 시간 초과되도록 예제를 수정합니다.

## 기본 동기 메시지 보내기

예제 프로젝트는 기본 모드에서 `SynchronousMessageSender` 을 사용하여 메시지를 보내고 응답을 기다립니다.

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르세요.

1. 예제를 다운로드하고 압축을 풉니다.

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/building-applications/core-frameworks/message-bus/liferay-m4q7.zip -O
    ```

    ```bash
    unzip liferay-m4q7.zip
    ```

1. 예제 프로젝트 모듈을 빌드하고 배포합니다.

    ```bash
    cd liferay-m4q7
    ```

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 모듈 JAR을 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
    ```

1. Docker 컨테이너 콘솔에 모듈 시작이 표시됩니다.

    ```bash
    STARTED com.acme.m4q7.able.impl_1.0.0
    STARTED com.acme.m4q7.baker.impl_1.0.0
    STARTED com.acme.m4q7.charlie.impl_1.0.0
    ```

1. `http://localhost:8080` 에서 브라우저로 Liferay 인스턴스를 방문하고 자격 증명을 사용하여 로그인합니다.

1. [Gogo 쉘](../../../liferay-internals/fundamentals/using-the-gogo-shell.md)을 엽니다.

1. Gogo 셸 명령 필드에 `m4q7:sendMessage` 을 입력한 다음 메시지를 입력합니다. 예를 들어,

    ```groovy
    m4q7:sendMessage foo
    ```

1. 출력이 다음과 같은지 확인합니다.

    ```
    INFO  [acme/m4q7_able-2][M4Q7CharlieMessageListener:23] Received message payload foo
    INFO  [acme/m4q7_baker-2][M4Q7BakerMessageListener:21] Received message payload M4Q7CharlieMessageListener
    INFO  [pipe-m4q7:sendMessage foo][M4Q7BakerOSGiCommands:28] Response: M4Q7CharlieMessageListener
    ```

`acme/m4q7_able` 목적지에서 `M4Q7CharlieMessageListener` 이 Gogo 쉘 메시지를 수신했습니다. `acme/m4q7_baker` 대상에서 `M4Q7BakerMessageListener` 이 `M4Q7CharlieMessageListener`에서 응답 메시지를 수신했습니다. 마지막으로 `M4Q7BakerOSGiCommands`의 `sendMessage` 메서드는 메시지 발신자로부터 반환된 응답 개체를 기록했습니다.

## 프로젝트 개요

세 가지 예제 모듈 클래스는 대상을 관리하고, 메시지를 수신하고, 메시지를 보냅니다.

**`m4q7-able-impl` 모듈:** `M4Q7AbleMessagingConfigurator` 는 이름이 `acme/m4q7_able` 인 메시지 대상을 생성하고 이를 메시지 버스에 등록합니다.

**`m4q7-baker-impl` 모듈:**

* `M4Q7BakerOSGiCommands` 은 메시지를 `acme/m4q7_able` 대상으로 보내고 응답을 기록합니다.
* `M4Q7BakerMessagingConfigurator` 은 `acme/m4q7_baker` 이라는 메시지 대상을 생성하고 이를 메시지 버스에 등록합니다.
* `M4Q7BakerMessageListener` 은 `acme/m4q7_baker` 대상으로 전송된 메시지를 수신하고 메시지 페이로드를 기록합니다.

**`m4q7-charlie-impl` 모듈:** `M4Q7CharlieMessageListener` 목적지로 전송된 메시지를 수신하고 `acme/m4q7_able` 메시지 페이로드를 기록하며 원래 메시지의 응답 목적지로 응답 메시지를 전송합니다.

이벤트 흐름은 다음과 같습니다.

1. `m4q7:sendMessage` Gogo 셸 명령을 호출하여 메시지를 전달합니다.
1. `M4Q7BakerOSGiCommands`의 `sendMessage(String)` 메서드는 Gogo 셸 명령에서 트리거하고 메시지의 명령 인수를 `acme/m4q7_able` 대상으로 보냅니다.
1. 메시지 버스 스레드는 메시지를 `M4Q7CharlieMessageListener`로 전달합니다.
1. `M4Q7CharlieMessageListener` 은 메시지 페이로드를 기록하고 원래 메시지의 응답 대상 `acme/m4q7_baker`에 대한 응답 메시지의 자체 클래스 이름을 보냅니다.
1. `M4Q7BakerMessageListener` 은 응답 메시지를 수신하고 페이로드를 기록합니다.
1. 처리는 `M4Q7BakerOSGiCommands`로 돌아가고 여기서 원본 메시지에 대한 응답을 기록합니다.

이제 대상 구성자부터 시작하여 각 클래스를 검사합니다.

## 대상 구성자 검사

`m4q7-able-impl` 모듈 및 `m4q7-baker-impl` 모듈은 각각 대상 구성자 클래스 `M4Q7AbleMessagingConfigurator` 및 `M4Q7BakerMessagingConfigurator`을 갖습니다. 그들은 각각 대상을 만들고 구성합니다.

`M4Q7AbleMessagingConfigurator` 클래스는 `acme/m4q7_able` 대상을 구성합니다.

```{literalinclude} ./using-default-synchronous-messaging/resources/liferay-m4q7.zip/m4q7-able-impl/src/main/java/com/acme/m4q7/able/internal/messaging/M4Q7AbleMessagingConfigurator.java
   :language: java
   :lines: 15-45
```

`M4Q7BakerMessagingConfigurator` 클래스는 `acme/m4q7_baker` 대상을 구성합니다.

```{literalinclude} ./using-default-synchronous-messaging/resources/liferay-m4q7.zip/m4q7-baker-impl/src/main/java/com/acme/m4q7/baker/internal/messaging/M4Q7BakerMessagingConfigurator.java
   :language: java
   :lines: 15-45
```

두 구성자는 모두 [`구성 요소`](https://docs.osgi.org/javadoc/osgi.cmpn/7.0.0/org/osgi/service/component/annotations/Component.html) 클래스입니다. 그들은 [`@Reference`](https://docs.osgi.org/javadoc/osgi.cmpn/7.0.0/org/osgi/service/component/annotations/Reference.html) 주석을 사용하여 `DestinationFactory` 인스턴스를 주입합니다.

`_activate(BundleContext)` 메서드는 [`DestinationFactory`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/ kernel/messaging/DestinationFactory.java) 및 [`DestinationConfiguration`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/ kernel/messaging/DestinationConfiguration.java) *직렬* 대상을 생성합니다. 마지막으로 `_activate(BundleContext)` 메서드는 [`Destination`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/ Portal/kernel/messaging/Destination.java) 'BundleContext'를 사용하는 OSGi 서비스에서.

```{warning}
기본 동기식 메시징과 함께 직렬 또는 병렬 대상만 사용하십시오. `DestinationConfiguration`의 `createSerialDestinationConfiguration(String)` 및 `createParallelDestinationConfiguration(String)` 메서드를 호출하여 만들 수 있습니다.

메시지 발신자 시간 초과를 무효화하므로 기본 동기 메시징과 함께 동기 대상을 사용하지 마십시오.
```

구성자가 비활성화되면 해당 `_deactivate()` 메서드가 대상 서비스를 등록 해제합니다.

## 리스너 검사

`m4q7-charlie-impl` 모듈의 `M4Q7CharlieMessageListener` 클래스는 `acme/m4q7_able` [`Destination`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/Destination.java) 로 전송된 메시지를 수신합니다. [메시지 듣기](./listening-for-messages.md) 이 보여주는 것과 같은 방식으로 등록됩니다.

`M4Q7CharlieMessageListener` 클래스:

```{literalinclude} ./using-default-synchronous-messaging/resources/liferay-m4q7.zip/m4q7-charlie-impl/src/main/java/com/acme/m4q7/charlie/internal/messaging/M4Q7CharlieMessageListener.java
   :language: java
   :lines: 12-40
```

`M4Q7CharlieMessageListener` 메시지를 수신하면 `receive(Message)` 메서드는 메시지 페이로드를 기록하고 원래 메시지의 응답 대상으로 응답 메시지를 보냅니다. 메서드는 응답 메시지 페이로드를 수신기 클래스 이름으로 설정하고 응답 메시지 ID를 원본 메시지의 응답 ID로 설정합니다.

```{important}
기본 동기식 메시징에서 응답 메시지는 원래 메시지의 응답 ID를 사용해야 *하고* 응답 대상으로 전송되어야 합니다.
```

`m4q7-baker-impl` 모듈의 `M4Q7BakerMessageListener` 클래스는 `M4Q7BakerOSGiCommands`메시지의 응답 대상인 `acme/m4q7_baker`로 전송된 메시지를 수신합니다.

`M4Q7BakerMessageListener` 클래스:

```{literalinclude} ./using-default-synchronous-messaging/resources/liferay-m4q7.zip/m4q7-baker-impl/src/main/java/com/acme/m4q7/baker/internal/messaging/M4Q7BakerMessageListener.java
   :language: java
   :lines: 10-26
```

`M4Q7BakerMessageListener` 이 메시지를 수신하면 `receive(Message)` 메서드가 메시지 페이로드를 기록합니다.

## 발신자 조사

`-baker-impl` 모듈의 `M4Q7BakerOSGiCommands` 클래스는 메시지의 명령 인수를 대상으로 `"acme/m4q7_able"` 전송하도록 트리거하는 OSGi 명령을 제공합니다.

```{literalinclude} ./using-default-synchronous-messaging/resources/liferay-m4q7.zip/m4q7-baker-impl/src/main/java/com/acme/m4q7/baker/internal/osgi/commands/M4Q7BakerOSGiCommands.java
   :language: java
   :lines: 12-38
```

`M4Q7BakerOSGiCommands` 은 자체 클래스 유형의 서비스 `구성 요소` 입니다. `@Reference` 주석을 사용하여 *기본* 모드(주석의 `target = "(mode=DEFAULT)"` 속성으로 지정됨)로 설정된 `SynchronousMessageSender` 을 삽입합니다.

```{note}
*기본* 모드에서 `SynchronousMessageSender`의 `send` 메서드는 응답 메시지가 수신되거나 발신자가 시간 초과될 때까지 호출 클래스를 차단합니다.
```

`M4Q7BakerOSGiCommands`의 `@Component` 속성은 `m4q7` 범위에서 `sendMessage` 라는 Gogo 셸 명령 함수를 정의합니다. 명령은 입력 `문자열` 을 사용하고 `M4Q7BakerOSGiCommands`의 `sendMessage(String)` 메서드에 매핑합니다.

`sendMessage(String)` 메서드는 Gogo 셸 명령의 `String` 을 페이로드로, `"acme/m4q7_baker"` 를 응답 대상으로 사용하여 [`Message`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/Message.java) 를 생성합니다.

`sendMessage(String)` 메서드는 `SynchronousMessageSender`의 `send(String, Message, long)` 메서드를 호출하고 `"acme/` " 대상 이름, 메시지 인스턴스 및 `10000` 밀리초 시간 초과. 기본 모드에서 `SynchronousMessageSender` 은 메시지 수신기에 메시지를 전달하기 위해 메시지 버스 스레드를 사용합니다. 원본 메시지의 응답 ID가 있는 메시지가 `"acme/m4q7_baker"` 응답 대상에서 수신될 때까지 `M4Q7BakerOSGiCommands` 클래스에서 실행이 차단됩니다. 응답이 수신되면 메시지 응답을 기록하는 `M4Q7BakerOSGiCommands` `sendMessage(String)` 메서드에서 실행이 계속됩니다. 일치하는 응답 메시지가 수신되기 전에 시간 초과가 만료되면 `SynchronousMessageSender`의 `send(String, Message, long)` 메서드는 `MessageBusException`를 발생시킵니다.

```{important}
기본 동기식 메시징에서 응답 메시지는 원래 메시지의 응답 ID를 사용해야 *하고* 응답 대상으로 전송되어야 합니다.
```

이제 메시지 리스너가 응답 메시지로 회신하는 것을 보았으므로 응답 제한 시간을 테스트할 수 있습니다.

## 응답 시간 초과 시연

메시지 응답 논리를 해제하여 제한 시간을 강제 적용하는 방법은 다음과 같습니다.

1. `M4Q7CharlieMessageListener`의 `receive(Message)` 메서드에서 `_messageBus.sendMessage(...)` 호출을 주석 처리합니다.

    ```java
    @Override
    public void receive(Message message) {
        if (_log.isInfoEnabled()) {
            Object payload = message.getPayload();

            _log.info("Received message payload " + payload.toString());
        }

        // _messageBus.sendMessage(
        //  message.getResponseDestinationName(),
        //  new Message() {
        //      {
        //          setPayload("M4Q7CharlieMessageListener");
        //          setResponseId(message.getResponseId());
        //      }
        //  });
    }
    ```

1. 예제 프로젝트를 재배포합니다.

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

1. Gogo 셸 명령 필드에 `m4q7:sendMessage` 을 입력한 다음 메시지를 입력합니다. 예를 들어,

    ```groovy
    m4q7:sendMessage foo
    ```

1. Gogo 셸 페이지가 다음과 같은지 확인합니다.

    ![오류: 메시지에 대한 답장이 수신되지 않았습니다.](./using-default-synchronous-messaging/images/01.png)

1. Docker 콘솔의 메시지가 다음과 같은지 확인합니다.

    ```bash
    INFO  [acme/m4q7_able-2][M4Q7CharlieMessageListener:23] Received message payload foo
    ```

`M4Q7CharlieMessageListener` 메시지를 받았지만 응답하지 않았습니다. `SynchronousMessageSender` 은 Gogo 셸 페이지에 인쇄된 `MessageBusException` 을 던졌습니다.

시간 초과와 동시에 메시지를 보내는 것을 축하합니다.

## 다음

*직접* 모드를 사용하여 동기 메시징을 탐색하려면 [직접 동기 메시징 사용](./using-direct-synchronous-messaging.md)을 참조하세요.

메시지를 보낸 후 즉시 처리를 계속하려면 [비동기 메시징 사용](./using-asynchronous-messaging.md)을 참조하십시오.

## 추가 정보

* [메시지 버스](../message-bus.md)
* [메시지 듣기](./listening-for-messages.md)
* [비동기 메시징 사용](./using-asynchronous-messaging.md)
* [등록 이벤트 수신](./listening-for-registration-events.md)