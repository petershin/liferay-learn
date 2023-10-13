# 상거래 알림 대기열 구성

채널 이벤트가 알림을 트리거하면 Commerce는 이를 채널의 알림 대기열 탭에 `Unsent` 상태로 기록합니다. 기본적으로 Liferay는 15분마다 대기 중인 알림을 확인하고 `Unsent` 상태인 경우 알림을 보냅니다. 그러나 알림이 43200분(30일) 후에 `Unsent` 상태가 되면 Liferay는 이를 삭제합니다.

대기 중인 알림을 보내고 제거하는 간격을 변경할 수 있습니다.

1. **전역 메뉴**(![Global Menu](../../images/icon-applications-menu.png)) 을 열고 **제어판** &rarr; **시스템 설정** 로 이동합니다.

1. **주문** 클릭한 다음 **상거래 알림 대기열** 선택합니다.

1. **알림 큐 항목 확인 간격** 및 **알림 큐 항목 삭제 간격** 필드에 새 값을 입력합니다. 값은 분 단위로 설정됩니다(예: 15 = 15분).

   ![알림 대기열 항목 확인 및 삭제 간격의 기본값 변경](./configuring-the-commerce-notification-queue/images/01.png)

1. **저장** 클릭하세요.

```{warning}
이 기능을 비활성화해야 하는 경우 [blacklist](https://learn.liferay.com/web/guest/w/dxp/system-administration/installing-and-managing-apps/managing-apps/blacklisting-osgi-components.md) 구성 요소입니다. 간격에 0이나 음수를 입력하지 마십시오.
```

## 관련 주제

* [알림 템플릿 사용](./using-notification-templates.md)
