# 알림 대기열 사용

{bdg-secondary}`사용 가능한 Liferay 7.4 U34+ 및 GA34+`

Liferay는 개체 작업에 의해 트리거된 이메일 알림을 검토하기 위한 알림 대기열 애플리케이션을 제공합니다. 알림 상태를 확인하고 필요한 경우 다시 보낼 수 있습니다.

![알림 대기열 애플리케이션에서 이메일 알림을 검토합니다.](./using-the-notification-queue/images/01.png)

애플리케이션은 각 알림에 대해 다음 세부 정보를 나열합니다.

| 1 란    | 묘사                                                                                                                                                 |
|:------ |:-------------------------------------------------------------------------------------------------------------------------------------------------- |
| 주제     | 알림의 [템플릿](./creating-notification-templates.md)에 설정된 알림의 제목입니다.                                                                                    |
| 트리거 방법 | [알림 작업](../../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md#notification-actions) 트리거를 담당하는 개체입니다. |
| 에서     | 알림의 [템플릿](./creating-notification-templates.md)에 설정된 알림 발신자.                                                                                       |
| 에      | 알림의 [템플릿](./creating-notification-templates.md)에 설정된 알림 수신자.                                                                                       |
| 상태     | 알림이 전송되었는지(**Sent**) 전송 중인지(**Unsent**) 알림의 상태를 나타냅니다.                                                                                                 |

**작업** 버튼(![Actions Button](../../images/icon-actions.png))을 클릭하여 **삭제** 알림을 **다시 보내거나** 알림을 보냅니다.

![항목을 삭제하거나 알림을 다시 보내십시오.](./using-the-notification-queue/images/02.png)
