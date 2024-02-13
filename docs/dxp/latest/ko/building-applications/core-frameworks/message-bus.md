---
toc:
- ./message-bus/listening-for-messages.md
- ./message-bus/using-asynchronous-messaging.md
- ./message-bus/using-default-synchronous-messaging-in-previous-versions.md
- ./message-bus/using-direct-synchronous-messaging-in-previous-versions.md
- ./message-bus/listening-for-registration-events.md
- ./message-bus/tuning-messaging-performance.md
---
# 메시지 버스

메시지 버스는 느슨하게 결합된 메시지 교환 방법을 제공합니다. 메시지를 보내는 클래스는 메시지 버스를 호출하여 메시지를 목적지로 보내고, 그 목적지에 등록된 다른 클래스(리스너 **개**)는 메시지를 받습니다. 수신기는 발신자에게 투명하며 그 반대도 마찬가지입니다.

주요 메시징 구성 요소는 다음과 같습니다.

**대상:** 메시지가 전송되는 논리적(물리적이 아님) 명명된 사이트.

**리스너:** 특정 대상으로 전송된 메시지를 **수신** 하는 클래스.

**메시지 버스:** 목적지 등록을 처리하고 리스너에게 메시지를 보내는 프레임워크.

**메시지:** 선택적 응답 대상을 포함하여 페이로드 및 메타데이터를 포함할 수 있는 개체입니다.

**발신자:** 메시지 버스를 호출하여 대상의 수신기에 메시지를 보내는 임의의 클래스입니다.

아래 그림은 구성 요소 상호 작용을 보여줍니다.

![메시징 구성 요소 상호 작용의 예](./message-bus/images/01.png)

다음은 상호 작용 시퀀스의 예입니다.

1. 임의의 클래스는 `메시지` 을 등록된 `대상`으로 보냅니다.
1. Message Bus는 목적지의 등록된 `MessageListener`s에 `Message` 을 발송합니다.

메시지 발신자는 Message Bus를 사용하여 대상에 메시지를 보내는 데에만 관심이 있습니다. 메시지 수신자와는 관련이 없습니다. 메시지 리스너는 대상에서 메시지를 수신하는 데에만 관심이 있습니다. 그들은 메시지 발신자와 관련이 없습니다.

## 동기식 및 비동기식 메시징

메시지 버스는 동기식 및 비동기식으로 메시지를 보냅니다.

```{important}
동기식 메시징이 제거되었으며 더 이상 Liferay DXP 7.4 U49/Liferay Portal 7.4 GA49 이상에서 지원되지 않습니다.
```

**동기식 메시징:** 발신자가 메시지를 보낸 후 차단합니다. 발신자의 조건(발신자 유형에 의해 결정됨)이 충족되면 발신자는 차단을 해제하고 처리를 계속합니다.

**비동기 메시징:** 보낸 사람은 메시지를 보낸 후 즉시 처리를 계속합니다.

다음 항목에서는 두 가지 메시징 방법을 다룹니다.

* [비동기 메시징 사용](./message-bus/using-asynchronous-messaging.md) 대상을 구성하고 대상에 비동기적으로 메시지를 보내는 방법을 보여줍니다. 이것은 메시지를 보내는 가장 간단한 방법입니다.

* [이전 버전에서 기본 동기식 메시징 사용](./message-bus/using-default-synchronous-messaging-in-previous-versions.md) 한 수신기가 메시지에 응답할 때까지 메시지 발신자 차단을 보여줍니다. **또는** 수신기가 응답하지 않으면 메시지 시간이 초과될 때까지.

* [이전 버전에서 Direct Synchronous Messaging 사용](./message-bus/using-default-synchronous-messaging-in-previous-versions.md)은 **모든** 리스너가 메시지를 수신할 때까지 메시지 발신자가 메시지 전송을 차단함을 보여줍니다.

## 튜닝 성능

Message Bus API는 등록 이벤트, 대상, 대상 메시지 수신기 및 메시지 대기열의 모니터링을 용이하게 합니다. 대상 유형, 메시지 대기열 매개변수 및 스레드 매개변수를 조정하여 필요에 맞게 Message Bus 구성 요소를 구성할 수 있습니다. 자세한 내용은 [메시징 성능 조정](./message-bus/tuning-messaging-performance.md) 참조하십시오.

## 무다음

Liferay의 기본 제공 대상에서 수신하는 것은 Message Bus 사용을 시작하는 좋은 방법입니다. 다음에 [메시지 듣기](./message-bus/listening-for-messages.md) 부터 시작합니다.
