---
uuid: 692ed11e-986f-4d53-963a-3142a0a683de
---

# 이전 버전에서 직접 동기식 메시징 사용

```{important}
동기식 메시징이 제거되었으며 더 이상 Liferay DXP 7.4 U49/Liferay Portal 7.4 GA49 이상에서 지원되지 않습니다.
```

직접 동기식 메시징은 모든 수신기가 메시지를 받을 때까지 처리를 차단하는 가장 쉬운 방법입니다. `SynchronousMessageSender`의 `send(String, Message)` 메서드를 호출하고 대상 이름과 메시지 인스턴스를 전달합니다. `SynchronousMessageSender` 은 현재 스레드를 사용하여 각 대상의 등록된 메시지 수신기에서 직접 메시지 수신을 처리합니다. 리스너 처리가 완료되면 `send(String, Message)` 메서드를 호출한 클래스에서 실행이 계속됩니다. 이 예는 직접 동기식 메시징을 사용하는 방법을 보여줍니다.

## 다이렉트 동기 메시지 보내기

예제 프로젝트에서는 `SynchronousMessageSender` 사용하여 두 수신기에 직접 메시지를 보냅니다.
```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps:

1. Download and unzip the example.

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/building-applications/core-frameworks/message-bus/liferay-x6n5.zip -O
    ```

    ```bash
    unzip liferay-x6n5.zip
    ```

1. 예제 프로젝트 모듈을 빌드하고 배포합니다.

    ```bash
    cd liferay-x6n5
    ```

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 모듈 JAR을 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
    ```

1. Docker 컨테이너 콘솔은 모듈이 시작되었음을 보여줍니다.

    ```bash
    STARTED com.acme.x6n5.able.impl_1.0.0
    STARTED com.acme.x6n5.baker.impl_1.0.0
    STARTED com.acme.x6n5.charlie.impl_1.0.0
    STARTED com.acme.x6n5.dog.impl_1.0.0
    ```

1. `http://localhost:8080` 에서 브라우저로 Liferay 인스턴스를 방문하고 자격 증명을 사용하여 로그인합니다.

1. [Gogo Shell](../../../liferay-internals/fundamentals/using-the-gogo-shell.md)을 엽니다.

1. Gogo Shell 명령 필드에 `x6n5:sendMessage` 입력한 다음 메시지를 입력합니다. 예를 들어,

    ```groovy
    x6n5:sendMessage foo
    ```

1. 출력이 다음과 같은지 확인합니다.

    ```
   INFO  [pipe-x6n5:sendMessage foo][X6N5DogMessageListener:21] Received message payload foo
   INFO  [pipe-x6n5:sendMessage foo][X6N5CharlieMessageListener:21] Received message payload foo
   INFO  [pipe-x6n5:sendMessage foo][X6N5BakerOSGiCommands:28] Response: X6N5CharlieMessageListener
    ```

스레드는 메시지를 보낼 때 메시지 발신자(예: `X6N5BakerOSGiCommands`)에서 차단됩니다. `X6N5CharlieMessageListener` 및 `X6N5DogMessageListener`에서 메시지를 처리한 후 스레드는 메시지 발신자에서 계속됩니다.

## 프로젝트 개요

4개의 예제 모듈에는 하나의 클래스가 있습니다. 클래스에서 목적지를 관리하고 다른 클래스는 메시지를 보내고 다른 두 클래스는 목적지로 전송된 메시지를 수신 대기합니다.

예제 클래스:

| 종류                              | 모듈                  | 묘사                                                                      |
|:------------------------------- |:------------------- |:----------------------------------------------------------------------- |
| `X6N5AbleMessagingConfigurator` | `x6n5-able-impl`    | `acme/x6n5_able` 이라는 메시지 대상을 생성하고 메시지 버스에 등록합니다.                        |
| `X6N5BakerOSGiCommands`         | `x6n5-baker-impl`   | `acme/x6n5_able` 목적지로 메시지를 보내고 응답을 기록합니다.                               |
| `X6N5CharlieMessageListener`    | `x6n5-charlie-impl` | `acme/x6n5_able` 대상으로 전송된 메시지를 수신합니다. 메시지 페이로드를 기록하고 메시지에 대한 응답을 설정합니다. |
| `X6N5DogMessageListener`        | `x6n5-dog-impl`     | `acme/x6n5_able` 대상으로 전송된 메시지를 수신합니다. 메시지 페이로드를 기록하고 메시지에 대한 응답을 설정합니다. |

이벤트 흐름은 다음과 같습니다.

1. 사용자가 `x6n5:sendMessage` Gogo 셸 명령을 실행하면 `X6N5BakerOSGiCommands` 메시지 페이로드의 명령 인수를 `acme/x6n5_able` 대상으로 보냅니다.
1. 현재 스레드는 각 리스너(즉, `X6N5CharlieMessageListener` 및 `X6N5DogMessageListener`)에 대한 메시지 수신을 순차적으로 처리합니다. 수신기는 메시지 페이로드를 기록하고 메시지에 대한 응답을 설정합니다. 가장 최근에 처리된 리스너의 응답이 이전 응답보다 우선합니다.
1. 처리가 `X6N5BakerOSGiCommands`로 돌아가서 메시지 응답을 기록합니다.

이제 대상 구성자부터 시작하여 각 클래스를 검사할 수 있습니다.

## 대상 구성자 검사

`x6n5-able-impl` 모듈의 `X6N5AbleMessagingConfigurator` 클래스는 `acme/x6n5_able`라는 대상을 만들고 구성합니다. 코드는 다음과 같습니다.

```{literalinclude} ./using-direct-synchronous-messaging/resources/liferay-x6n5.zip/x6n5-able-impl/src/main/java/com/acme/x6n5/able/internal/messaging/X6N5AbleMessagingConfigurator.java
   :language: java
   :lines: 15-42
```

이 구성자는 [`구성 요소`](https://docs.osgi.org/javadoc/osgi.cmpn/7.0.0/org/osgi/service/component/annotations/Component.html) 클래스입니다. [`@Reference`](https://docs.osgi.org/javadoc/osgi.cmpn/7.0.0/org/osgi/service/component/annotations/Reference.html) 주석을 사용하여 `DestinationFactory` 인스턴스를 주입합니다.

`_activate(BundleContext)` 메서드는 [`DestinationFactory`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/DestinationFactory.java) 및 [`DestinationConfiguration`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/DestinationConfiguration.java) 를 사용하여 `acme/x6n5_able`이라는 *동기식* 대상을 생성합니다. 동기 대상은 동기 메시징에 최적화되어 있습니다. 마지막으로 이 메소드는 `BundleContext`를 사용하여 OSGi 서비스에 [`Destination`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/Destination.java) 등록합니다.

`X6N5AbleMessagingConfigurator` 비활성화되면 `_deactivate()` 메서드가 대상 서비스를 등록 해제합니다.

## 발신자 조사

`x6n5-baker-impl` 모듈의 `X6N5BakerOSGiCommands` 클래스는 대상에 메시지를 보내는 OSGi 명령을 제공합니다.

```{literalinclude} ./using-direct-synchronous-messaging/resources/liferay-x6n5.zip/x6n5-baker-impl/src/main/java/com/acme/x6n5/baker/internal/osgi/commands/X6N5BakerOSGiCommands.java
   :language: java
   :lines: 12-37
```

`X6N5BakerOSGiCommands` 자체 클래스 유형의 서비스 `구성 요소` 입니다. `@Reference` 주석을 사용하여 *다이렉트* 모드로 설정된 `SynchronousMessageSender` 삽입합니다(주석의 `target = "(mode=DIRECT)"` 속성으로 지정됨).

```{note}
*직접* 모드에서 `SynchronousMessageSender` `send` 메소드는 현재 스레드가 모든 리스너에게 메시지를 전달할 때까지 호출 클래스를 차단합니다.
```

`X6N5BakerOSGiCommands`의 `@Component` 속성은 `sendMessage` 라는 Gogo 셸 명령 함수를 `x6n5` 범위에서 정의합니다. 이 명령은 `sendMessage(String)` 메서드에 매핑되고 `String`입력을 받습니다.

`sendMessage(String)` 메소드는 Gogo 쉘 명령의 `String` 페이로드로 사용하여 [`Message`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/Message.java) 생성합니다. `SynchronousMessageSender` `send(String, Message)` 메서드는 현재 스레드를 사용하여 메시지를 `acme/x6n5_able` [`대상`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/Destination.java) 메시지 수신기로 전달합니다. 스레드가 모든 [`MessageListener`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/MessageListener.java) s에서 메시지를 처리할 때까지 `X6N5BakerOSGiCommands` 클래스에서 실행이 차단됩니다. 그런 다음 메시지 응답을 기록하는 `X6N5BakerOSGiCommands` `sendMessage(String)` 메서드에서 실행이 계속됩니다.

## 리스너 검사

`x6n5-charlie-impl` 모듈의 `X6N5CharlieMessageListener` 클래스 및 `x6n5-dog-impl` 모듈의 `X6N5DogMessageListener` 클래스는 `acme/x6n5_able` [`Destination`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/Destination.java) 에 전송된 메시지를 수신합니다. 그들은 메시지 듣기 [](./listening-for-messages.md) 보여주는 것과 같은 방식으로 등록합니다.

`X6N5CharlieMessageListener` 클래스:

```{literalinclude} ./using-direct-synchronous-messaging/resources/liferay-x6n5.zip/x6n5-charlie-impl/src/main/java/com/acme/x6n5/charlie/internal/messaging/X6N5CharlieMessageListener.java
   :language: java
   :lines: 10-28
```

`X6N5DogMessageListener` 클래스:

```{literalinclude} ./using-direct-synchronous-messaging/resources/liferay-x6n5.zip/x6n5-dog-impl/src/main/java/com/acme/x6n5/dog/internal/messaging/X6N5DogMessageListener.java
   :language: java
   :lines: 10-28
```

각 리스너의 `receive(Message)` 메서드는 메시지 페이로드를 기록한 다음 메시지 응답을 자체 클래스 이름으로 설정합니다.

축하해요! 직접 동기식 메시징을 사용하는 방법을 알고 있습니다.

## 무엇 향후 계획

기본 *모드를 사용하여 동기식 메시징을 탐색* [이전 버전에서 기본 동기식 메시징 사용](./using-default-synchronous-messaging-in-previous-versions.md)참조하십시오.

메시지를 보낸 후 즉시 처리를 계속하려면 [비동기 메시징 사용](./using-asynchronous-messaging.md)참조하십시오.

## 추가 정보

* [메시지 버스](../message-bus.md)
* [메시지 듣기](./listening-for-messages.md)
* [비동기 메시징 사용](./using-asynchronous-messaging.md)
* [등록 이벤트 수신](./listening-for-registration-events.md)
