# 등록 이벤트 수신

메시징 API는 대상 및 메시지 수신기 등록 이벤트 수신을 지원합니다. 다음은 이러한 이벤트를 수신해야 하는 몇 가지 이유입니다.

* 관심 있는 메시지가 새로운 대상으로 전송될 수 있습니다.
* 목적지에서의 메시징은 조정이 필요할 수 있습니다.
* 등록되지 않은 대상에 의존할 수 있습니다.
* 등록을 취소하면 재할당할 수 있는 리소스가 확보됩니다.

예제 프로젝트는 이러한 등록 이벤트를 수신하는 방법을 보여줍니다. 예제 실행부터 시작하십시오. 그런 다음 이벤트 리스너 구현을 검토하십시오. 마지막으로 등록 취소 이벤트를 트리거합니다.

## 예제에서 이벤트 트리거

대상 등록 수신기, 메시지 수신기 등록 수신기 및 수신 중인 이벤트를 트리거하는 클래스를 배포합니다.

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르세요.

1. 예제를 다운로드하고 압축을 풉니다.

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/building-applications/core-frameworks/message-bus/liferay-s3z9.zip -O
    ```

    ```bash
    unzip liferay-s3z9.zip
    ```

1. `s3z9-able-impl` 모듈을 배포하여 메시지 버스 이벤트 수신기를 시작합니다.

    ```bash
    cd liferay-s3z9/s3z9-able-impl
    ```

    ```bash
    ../gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 모듈 JAR을 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
    ```

1. `s3z9-baker-impl` 모듈을 배포하여 대상을 추가합니다.

    ```bash
    cd ../s3z9-baker-impl
    ```

    ```bash
    ../gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

1. Docker 컨테이너 콘솔에 새로 추가된 대상에 대한 `S3Z9AbleMessageBusEventListener`의 응답이 표시됩니다.

    ```bash
    [main][S3Z9AbleMessageBusEventListener:17] Destination added acme/s3z9_baker
    ```

1. `s3z9-charlie-impl` 모듈을 배포하여 대상 이벤트 수신기를 시작합니다.

    ```bash
    cd ../s3z9-charlie-impl
    ```

    ```bash
    ../gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

1. `s3z9-dog-impl` 모듈을 배포하여 대상에 메시지 수신기를 등록합니다.

    ```bash
    cd ../s3z9-dog-impl
    ```

    ```bash
    ../gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

1. Docker 컨테이너 콘솔은 새로 등록된 메시지 수신기에 대한 `S3Z9CharlieDestinationEventListener`의 응답을 보여줍니다.

    ```bash
    [S3Z9CharlieDestinationEventListener:23] Registered message listener to acme/s3z9_baker
    ```

모듈 개요는 다음과 같습니다.

1. `s3z9-able-impl`'s [`MessageBusEventListener`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/MessageBusEventListener.java) 구현은 대상 추가 및 제거를 수신 대기합니다.
1. `s3z9-baker-impl`의 메시징 구성자 클래스는 대상을 추가합니다. `s3z9-able-impl`의 `MessageBusEventListener` 구현은 추가된 대상 알림을 수신하고 이벤트를 기록합니다.
1. `s3z9-charlie-impl`'s [`DestinationEventListener`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/DestinationEventListener.java) 구현은 대상에 등록 또는 등록 취소하는 메시지 리스너를 수신합니다.
1. `s3z9-dog-impl`'s [`MessageListener`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/MessageListener.java) 구현은 대상에 등록합니다. `s3z9-charlie-impl`의 `DestinationEventListener` 구현은 메시지 리스너 등록 알림을 수신하고 이벤트를 기록합니다.

## `MessageBusEventListener`검사

Message Bus는 [`Destination`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/Destination.java) s가 추가되거나 제거될 때 [`MessageBusEventListener`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/MessageBusEventListener.java) s에 알립니다. 다음은 `MessageBusEventListener` 구현의 예입니다.

```{literalinclude} ./listening-for-registration-events/resources/liferay-s3z9.zip/s3z9-able-impl/src/main/java/com/acme/s3z9/able/internal/messaging/S3Z9AbleMessageBusEventListener.java
:language: java
:lines: 10-31
```

[`@Component`](https://docs.osgi.org/javadoc/osgi.cmpn/7.0.0/org/osgi/service/component/annotations/Component.html) 주석과 해당 `service = MessageBusEventListener.class` 속성은 런타임 프레임워크에 `S3Z9AbleMessageBusEventListener` 을 `MessageBusEventListener`로 등록하도록 신호를 보냅니다. 구현은 `MessageBusEventListener`의 두 가지 방법을 재정의합니다.

* `destinationAdded(Destination destination)` 은 새로 추가된 `Destination`에 응답합니다.
* `destinationRemoved(목적지 목적지)` 은 새로 제거된 `목적지`에 응답합니다.

`S3Z9AbleMessageBusEventListener`의 메소드 구현은 대상 이벤트를 기록합니다.

## `DestinationEventListener`검사

Message Bus는 [`MessageListener`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/MessageListener.java) 이 `DestinationEventListener`의 지정된 대상에 등록하거나 등록을 취소할 때 [`DestinationEventListener`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/DestinationEventListener.java) 에 알립니다. 다음은 `DestinationEventListener` 구현 예입니다.

```{literalinclude} ./listening-for-registration-events/resources/liferay-s3z9.zip/s3z9-charlie-impl/src/main/java/com/acme/s3z9/charlie/internal/messaging/S3Z9CharlieDestinationEventListener.java
:language: java
:lines: 10-38
```

`@Component` 주석의 `속성 = "destination.name=acme/s3z9_baker"` 및 `서비스 = MessageBusEventListener.class` 속성은 `acme/s3z9_baker` 대상에 대해 `S3Z9CharlieDestinationEventListener` 을 `DestinationEventListener` 로 등록하도록 런타임 프레임워크에 신호를 보냅니다. . 구현은 `DestinationEventListener`의 두 메서드를 재정의합니다.

* `messageListenerRegistered(String destinationName, MessageListener messageListener)` 은 목적지에 등록된 새로운 메시지 리스너에 응답합니다.
* `messageListenerUnregistered(String destinationName, MessageListener messageListener)` 은 대상에서 등록되지 않은 새 메시지 수신기에 응답합니다.

`S3Z9CharlieDestinationEventListener`의 메소드 구현은 메시지 리스너 등록 이벤트를 기록합니다.

예제 `MessageBusEventListener` 및 `DestinationEventListener` 이 메시지 버스 수신기 등록 취소 및 대상 제거에 응답하는 것을 보려면 계속 읽으십시오.

## 다른 이벤트 트리거

모듈을 중지하여 예제 메시지 수신기를 등록 취소하고 예제 대상을 제거할 수 있습니다. `s3z9-dog-impl` 은 메시지 수신기를 배포했고 `s3z9-able-impl` 은 대상을 배포했습니다. 이러한 모듈을 중지하면 해당 클래스는 메시지 수신기와 대상을 각각 등록 취소합니다.

1. `http://localhost:8080` 에서 브라우저로 Liferay 인스턴스를 방문하고 자격 증명을 사용하여 로그인합니다.

1. [Gogo 쉘](../../../liferay-internals/fundamentals/using-the-gogo-shell.md)을 엽니다.

1. Gogo 셸 명령 필드에 다음 명령을 입력하여 예제 모듈을 나열합니다.

    ```bash
    lb | grep S3Z9
    ```

    각 줄의 시작 부분에는 해당 모듈의 ID 번호가 포함됩니다.

    ```bash
    1839|Active     |   10|Acme S3Z9 Able Implementation (1.0.0)|1.0.0
    1840|Active     |   10|Acme S3Z9 Baker Implementation (1.0.0)|1.0.0
    1841|Active     |   10|Acme S3Z9 Charlie Implementation (1.0.0)|1.0.0
    1842|Active     |   10|Acme S3Z9 Dog Implementation (1.0.0)|1.0.0
    ```

1. 다음 Gogo 셸 명령을 입력하여 메시지 리스너의 모듈을 중지하고 숫자를 모듈의 ID로 바꿉니다.

    ```bash
    stop 1842
    ```

1. 메시지 리스너 등록 해제에 대한 대상 이벤트 리스너의 로그 응답을 확인합니다.

    ```bash
    [S3Z9CharlieDestinationEventListener:33] Unregistered message listener from acme/s3z9_baker
    ```

1. 다음 Gogo 셸 명령을 입력하여 대상 모듈을 중지하고 번호를 모듈의 ID로 바꿉니다.

    ```bash
    stop 1840
    ```

축하합니다! 모든 메시지 버스 이벤트 리스너 및 대상 이벤트 리스너 이벤트를 트리거했습니다.

## 다음

이제 이러한 Message Bus 이벤트를 수신하는 방법을 알았 [새](./tuning-messaging-performance.md) 에서 메시지를 수신하거나 새 등록 관련 활동에 대한 응답으로 메시징 환경을 조정할 수 있습니다.

## 추가 정보

* [메시징 성능 조정](./tuning-messaging-performance.md)
* [메시지 듣기](./listening-for-messages.md)
* [비동기 메시징 사용](./using-asynchronous-messaging.md)
