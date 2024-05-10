---
toc:
- ./sending-emails/using-notification-templates.md
- ./sending-emails/configuring-the-commerce-notification-queue.md
- ./sending-emails/notification-template-variables-reference-guide.md
---
# 이메일 보내기

매장에서 발생하는 다양한 이벤트에 대한 이메일 알림을 보내도록 Liferay를 구성할 수 있습니다. 예를 들어 주문 관리자나 관심 있는 다른 사람에게 주문 세부 정보와 함께 업데이트를 보낼 수 있습니다. 여기에는 주문 ID, 배송 및 청구 주소, 사용한 결제 방법 등이 포함될 수 있습니다. 이렇게 하려면 이메일의 내용과 이벤트 트리거를 결정하는 알림 템플릿을 만들어야 합니다.

```{note}
Commerce에서 알림을 사용하려면 먼저 Liferay DXP에 대한 메일 설정을 구성해야 합니다. 자세한 내용은 [메일 구성](https://learn.liferay.com/w/dxp/installation-and-upgrades/setting-up-liferay/configuring-mail) 을 참조하십시오.
```

## 알림 템플릿

알림 템플릿은 발신자와 수신자, 이벤트 트리거, 이메일 알림 내용을 정의합니다. Liferay의 메일 설정을 구성한 후 **제어판** &rarr; **상거래** &rarr; **채널** 로 이동합니다. **알림 템플릿** 탭을 클릭하고 **추가** 클릭하여 알림 템플릿을 만듭니다. 이러한 알림은 [채널](./channels/introduction-to-channels.md)마다 구성됩니다. 이메일 템플릿을 디자인할 때 텍스트를 직접 입력하거나 변수를 사용하여 트리거 이벤트의 데이터를 동적으로 포함할 수 있습니다. 자세한 내용은 [알림 템플릿 사용](./sending-emails/using-notification-templates.md) 및 [알림 템플릿 변수 참조 가이드](./sending-emails/notification-template-variables-reference-guide.md) 참조하십시오.

## 알림 대기열

**알림 대기열** 탭에는 채널에 대한 모든 이메일 알림이 표시됩니다. 각 이메일 알림 항목에는 보낸 사람, 받는 사람, 이벤트 유형, 상태 및 우선 순위가 표시됩니다. 기본적으로 Liferay는 15분마다 알림 대기열에서 보내지 않은 알림을 확인합니다. 이 동작을 구성하는 방법은 [상거래 알림 대기열 구성](./sending-emails/configuring-the-commerce-notification-queue.md) 참조하십시오.

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card}  알림 템플릿 사용
:link: ./sending-emails/using-notification-templates.md
:::

:::{grid-item-card}  알림 대기열 구성
:link: ./sending-emails/configuring-the-commerce-notification-queue.md
:::

:::{grid-item-card}  알림 템플릿 변수 참조 가이드
:link: ./sending-emails/notification-template-variables-reference-guide.md
:::
::::
