# 메시지 듣기

DXP/Portal에 내장되어 있거나, 타사에서 정의했거나, 사용자가 만든 메시지 버스 대상으로 전송된 메시지를 수신할 수 있습니다. 동일한 대상으로 전송된 메시지는 일반적으로 유사한 이벤트 유형이나 주제와 같은 공통점이 있습니다. 여기서는 `DestinationNames.DOCUMENT_LIBRARY_PDF_PROCESSOR`이라는 대상에서 수신된 메시지를 수신 대기하는 클래스를 배포합니다. 문서 및 미디어는 업로드된 모든 PDF 파일을 처리한 후 이 대상으로 메시지를 보냅니다.

## 예제 메시지 리스너 실행

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르세요.

1. [예제 프로젝트](dxp/latest/en/building-applications/core-frameworks/message-bus/liferay-w3a4.zip)를 다운로드하고 압축을 풉니다.

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/building-applications/core-frameworks/message-bus/liferay-w3a4.zip -O
    ```

    ```bash
    unzip liferay-w3a4.zip
    ```

1. 프로젝트 모듈을 빌드하고 배포합니다.

    ```bash
    cd liferay-w3a4
    ```

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 컴파일된 모듈 JAR을 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
    ```

1. Liferay Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```bash
    STARTED com.acme.w3a4.impl_1.0.0 [2177]
    ```

1. UI에서 [PDF 파일을 문서 및 미디어에 업로드](../../../content-authoring-and-management/documents-and-media/uploading-and-managing/uploading-files.md).

Documents and Media가 PDF 파일 미리보기 생성을 완료한 후 예제 프로젝트의 `MessageListener` 이 듣고 있는 대상으로 메시지를 보냅니다. 메시지 버스는 대상에 등록된 모든 `MessageListener`에 메시지를 전달합니다. 릴레이된 메시지를 수신하면 프로젝트의 `MessageListener` 이 메시지의 페이로드와 대상을 기록합니다.

```bash
[liferay/document_library_pdf_processor-2][W3A4MessageListener:22] Received message payload [Ljava.lang.Object;@6df886c1 at destination liferay/document_library_pdf_processor
```

작동 방식은 다음과 같습니다.

## 목적지 결정

메시지 대상은 해당 이름으로 참조됩니다. API는 대상 이름을 지정합니다. 예를 들어 [`DestinationNames`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/DestinationNames.java) 클래스는 Liferay의 기본 제공 대상을 나열합니다. 예제 `MessageListener` 은 다음 `문자열` 상수로 명명된 Liferay 대상으로 전송된 메시지를 수신합니다.

```java
DestinationNames.DOCUMENT_LIBRARY_PDF_PROCESSOR
```

Liferay의 `*DestinationNames` 소스 코드 [클래스를 검색하거나 다른 API에서 수신기를 추가할 수 있는 대상을 검색](https://github.com/liferay/liferay-portal/tree/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]). 메시지 수신기에서 대상 이름을 지정합니다.

## `MessageListener` 인터페이스 구현

메시지를 수신하려는 클래스에서 [`MessageListener`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/MessageListener.java) 인터페이스를 구현합니다.

```{literalinclude} ./listening-for-messages/resources/liferay-w3a4.zip/w3a4-impl/src/main/java/com/acme/w3a4/internal/messaging/W3A4MessageListener.java
   :language: java
   :lines: 15
```

메시지 처리를 위한 논리로 `수신` 메서드를 재정의합니다. 다음은 `수신` 메서드 구현의 예입니다.

```{literalinclude} ./listening-for-messages/resources/liferay-w3a4.zip/w3a4-impl/src/main/java/com/acme/w3a4/internal/messaging/W3A4MessageListener.java
   :language: java
   :lines: 17-27
```

위의 구현은 메시지 페이로드 및 대상 이름을 기록합니다. 다른 메서드에 대한 자세한 내용은 [`메시지`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/messaging/MessageListener.java) 클래스를 참조하세요.

## 대상에 MessageListener 등록

`구성 요소` 주석을 사용하여 원하는 대상에서 메시지를 수신하도록 클래스를 등록합니다. 예를 들어,

```{literalinclude} ./listening-for-messages/resources/liferay-w3a4.zip/w3a4-impl/src/main/java/com/acme/w3a4/internal/messaging/W3A4MessageListener.java
   :language: java
   :lines: 11-15
```

위의 주석은 `DestinationNames.DOCUMENT_LIBRARY_PDF_PROCESSOR`이라는 대상에서 메시지를 수신하기 위해 클래스를 `MessageListener` 서비스 구성 요소로 등록합니다.

구성 요소의 `destination.name` 속성 값을 대상 이름으로 설정합니다.

프로젝트를 배포할 때 OSGi 런타임은 `MessageListener` 을 대상에 등록합니다. `MessageListener` 은 이제 목적지로 전송된 메시지를 수신합니다.

## 추가 정보

* [메시지 버스](../message-bus.md)
