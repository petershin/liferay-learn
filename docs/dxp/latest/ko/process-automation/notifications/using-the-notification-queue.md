# 알림 대기열 사용

{bdg-secondary}`사용 가능한 Liferay 7.4 U75+/GA75+`

Liferay는 개체 작업에 의해 트리거된 이메일 알림을 검토하기 위한 알림 대기열 애플리케이션을 제공합니다. 알림 상태를 확인하고 필요한 경우 다시 보낼 수 있습니다.

![알림 대기열 애플리케이션에서 이메일 알림을 검토합니다.](./using-the-notification-queue/images/01.png)

애플리케이션은 각 알림에 대해 다음 세부 정보를 나열합니다.

| 1 란    | 묘사                                                                                                                                                 |
|:------ |:-------------------------------------------------------------------------------------------------------------------------------------------------- |
| 주제     | [알림 템플릿](./creating-notification-templates.md)에 설정된 알림 제목입니다.                                                                                      |
| 트리거 방법 | [알림 작업](../../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md#notification-actions) 트리거를 담당하는 개체입니다. |
| 에서     | [알림 템플릿](./creating-notification-templates.md)에 설정된 알림 발신자.                                                                                        |
| 에      | [알림 템플릿](./creating-notification-templates.md)에 설정된 알림 수신자.                                                                                        |
| 상태     | 전송되었는지(**Sent**) 전송 중인지(**Unsent**) 알림 상태를 나타냅니다.                                                                                                      |

**작업** 버튼(![Actions Button](../../images/icon-actions.png))을 클릭하여 **삭제** 알림을 **다시 보내거나** 알림을 보냅니다.

![항목을 삭제하거나 알림을 다시 보내십시오.](./using-the-notification-queue/images/02.png)

## 알림 대기열 지우기

기본적으로 Liferay는 `43200` 분(예: 30일)마다 알림 대기열을 지웁니다. 이렇게 하면 상태에 관계없이 대기열의 모든 알림이 삭제됩니다.

삭제 간격을 구성하려면

1. **글로벌 메뉴**( ![Global Menu](../../images/icon-applications-menu.png) )을 열고 **제어판** 탭으로 이동하여 **시스템 설정** 클릭합니다.

1. 플랫폼에서 **알림** 클릭합니다.

1. 알림 대기열에서 삭제 작업 사이의 시간(분)을 입력합니다.

   간격은 `15` 분보다 커야 합니다.

   ![알림 대기열에서 삭제 작업 사이의 시간(분)을 입력합니다.](./using-the-notification-queue/images/03.png)

1. **저장** 클릭합니다.

## 관련 주제

* [알림 템플릿 생성](./creating-notification-templates.md)
* [개인 알림 구성](./configuring-personal-notifications.md)
