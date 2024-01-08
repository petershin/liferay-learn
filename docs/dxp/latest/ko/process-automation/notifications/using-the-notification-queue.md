# 알림 대기열 사용

{bdg-secondary}`liferay 7.4 U75+/GA75+`

Liferay는 개체 작업에 의해 트리거된 이메일 알림을 검토하기 위한 알림 대기열 애플리케이션을 제공합니다. 알림 상태를 확인하고 필요한 경우 다시 보낼 수 있습니다.

![Review email notifications in the Notification Queue application.](./using-the-notification-queue/images/01.png)

애플리케이션은 각 알림에 대해 다음 세부정보를 나열합니다.

| 열      | 묘사                                                                                                                                                                |
| :----- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 주제     | [알림 템플릿](./creating-notification-templates.md) 에 설정된 알림 제목입니다.                                                                                          |
| 트리거 방법 | [알림 작업을 트리거하는 작업을 담당하는 개체](../../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md#notification-actions) . |
| 에서     | [알림 템플릿](./creating-notification-templates.md) 에 설정된 알림의 보낸 사람입니다.                                                                                      |
| 에      | [알림 템플릿](./creating-notification-templates.md) 에 설정된 알림 수신자입니다.                                                                                         |
| 상태     | 알림이 전송되었는지(_Sent_) 전송 중인지(_Unsent_) 알림 상태를 나타냅니다.                                                                           |

해당 항목을 **삭제** 하거나 알림을 **재전송** 하려면 **작업** 버튼(![작업 버튼](../../images/icon-actions.png))을 클릭하세요.

![Delete entries or resend notifications.](./using-the-notification-queue/images/02.png)

## 알림 대기열 지우기

기본적으로 Liferay는 '43200'분(즉, 30일)마다 알림 대기열을 지웁니다. 이렇게 하면 상태에 관계없이 대기열의 모든 알림이 삭제됩니다.

삭제 간격을 구성하려면

1. **전역 메뉴**( ![전역 메뉴](../../images/icon-applications-menu.png) )를 열고 **제어판** 탭으로 이동한 다음 **시스템 설정** 을 클릭합니다.

1. 플랫폼에서 **알림** 을 클릭하세요.

1. 알림 대기열에서 삭제 작업 사이의 시간(분)을 입력합니다.

   간격은 '15'분보다 커야 합니다.

   ![Under Notification Queue, enter the number of minutes between deletion operations.](./using-the-notification-queue/images/03.png)

1. **저장** 을 클릭하세요.

## 관련 주제

* [알림 템플릿 생성](./creating-notification-templates.md)
* [개인 알림 구성](./configuring-personal-notifications.md)
