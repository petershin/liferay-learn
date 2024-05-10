---
toc:
- ./notifications/configuring-personal-notifications.md
- ./notifications/creating-notification-templates.md
- ./notifications/using-the-notification-queue.md
---
# 알림

Liferay는 통합 알림 도구를 제공하므로 플랫폼 이벤트에 대해 사용자에게 경고할 수 있습니다. Liferay DXP의 경우 다음 기본 애플리케이션에 대한 이메일 및 웹사이트 알림이 포함됩니다.

| 신청           | 이메일      | 웹사이트     |
|:------------ |:-------- |:-------- |
| 블로그          | &#10004; | &#10004; |
| 댓글           | &#10004; | &#10004; |
| 컨택 센터        |          | &#10004; |
| 문서 및 미디어     | &#10004; | &#10004; |
| 가져오기/내보내기 센터 |          | &#10004; |
| 일원을 초대하십시오   |          | &#10004; |
| 멘션           | &#10004; | &#10004; |
| 게시판          | &#10004; | &#10004; |
| 내 워크플로 작업    | &#10004; | &#10004; |
| 출판           |          | &#10004; |
| 세그먼트 실험      | &#10004; | &#10004; |
| 나누는          | &#10004; | &#10004; |
| 웹 콘텐츠        | &#10004; | &#10004; |
| 위키           | &#10004; | &#10004; |

이메일 알림을 사용하려면 인스턴스에 대한 메일 서버를 [구성해야](../installation-and-upgrades/setting-up-liferay/configuring-mail.md). 일단 구성되면 인스턴스 수준에서 추가 [이메일 알림 설정](../system-administration/configuring-liferay/virtual-instances/email-settings.md) 에 액세스할 수 있습니다. Liferay 7.4 U33+/GA33+부터 객체에 대한 이메일 알림을 설계하고 동적으로 채우기 위해 [알림 템플릿](./notifications/creating-notification-templates.md) 을 생성할 수도 있습니다. 자세한 내용은 [알림 작업](../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md#notification-actions) 을 참조하십시오.

상거래 컨텍스트에서 채널 이벤트에 대한 알림이 지원됩니다. 자세한 내용은 [Store Emails](https://learn.liferay.com/w/commerce/store-management/sending-emails/store-emails) 을 참조하십시오.

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} 개인 알림 설정
:link: ./notifications/configuring-personal-notifications.md
:::

:::{grid-item-card} 알림 템플릿 만들기
:link: ./notifications/creating-notification-templates.md
:::

:::{grid-item-card} 알림 대기열 사용
:link: ./notifications/using-the-notification-queue.md
:::
::::
