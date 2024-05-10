# 알림 템플릿 생성

{bdg-secondary}`liferay 7.4 2023.Q4+/GA107+`

알림 템플릿을 사용하면 Liferay 서비스에 대한 자동화된 이메일 및 사용자 알림을 디자인할 수 있습니다. 각 템플릿은 보낸 사람, 받는 사람 및 메시지 내용을 식별합니다. 템플릿을 디자인하는 동안 지원되는 엔터티를 검색하고 해당 데이터를 이메일에 동적으로 삽입하는 필드 참조를 추가할 수 있습니다.

현재 알림 템플릿은 [개체 작업](../../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md) 만 지원합니다. 그러나 상거래 채널에는 채널 이벤트에 대한 알림 템플릿 기능이 내장되어 있습니다. 자세한 내용은 [이메일 보내기](https://learn.liferay.com/w/commerce/store-management/sending-emails) 참조하세요.

!!! important
이메일 알림을 사용하려면 인스턴스에 [메일 서버](../../installation-and-upgrades/setting-up-liferay/configuring-mail.md) 가 구성되어 있어야 합니다. 일단 구성되면 인스턴스 수준에서 추가 [이메일 알림 설정](../../system-administration/configuring-liferay/virtual-instances/email-settings.md) 에 액세스할 수 있습니다.

기본 알림 유형이 요구 사항을 충족하지 않는 경우 클라이언트 확장을 사용하여 사용자 정의 알림 유형을 만들 수 있습니다. 자세한 내용은 [마이크로서비스 클라이언트 확장](../../building-applications/client-extensions/microservice-client-extensions.md) 참조하세요.

## 이메일 알림 템플릿 추가

1. **전역 메뉴**(![전역 메뉴](../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 다음 **알림 템플릿** 을 클릭합니다.

1. **추가**(![추가 버튼](../../images/icon-add.png))를 클릭하고 **이메일** 을 선택합니다.

   ![Click the Add button and select Email.](./creating-notification-templates/images/01.png)

   필드 참조를 사용하여 메시지를 항목 및 사용자 데이터로 동적으로 채울 수 있습니다. 용어 정의 섹션에서 지원되는 필드를 참조하는 개체 정의를 선택할 수 있습니다. 일반 용어 섹션에서는 알림 작업을 트리거하는 사용자의 필드를 참조하는 용어를 찾을 수 있습니다. 원하는 대로 템플릿 필드에 이러한 참조 용어를 사용하십시오. 자세한 내용은 [용어 정의 참조](#definition-of-terms-reference) 참조하세요.

   ![Search entities to add references to supported fields.](./creating-notification-templates/images/02.png)

1. 기본 정보에 템플릿의 이름과 설명을 입력합니다.

   ![Under Basic Info, enter a name and description.](./creating-notification-templates/images/03.png)

1. 설정에서 이메일 보낸 사람과 받는 사람의 연락처 정보를 입력하세요.

   여러 수신자를 추가하려면 이메일 주소를 쉼표나 공백으로 구분하세요(예: `test@liferay.com,learn@liferay.com`, `[%TICKET_AUTHOR_EMAIL_ADDRESS%] [%CURRENT_USER_EMAIL_ADDRESS%]`).

   ![Under Settings, enter details for the sender and desired recipients.](./creating-notification-templates/images/04.png)

1. 이메일을 따로 보낼지, 함께 보낼지 결정합니다.

   함께 보내는 경우 이메일에는 받는 사람 필드의 전체 수신자 목록이 포함됩니다. 이메일을 별도로 보내면 수신자 목록이 숨겨집니다.

   !!! 팁
   이메일을 함께 보내면 투명성과 협업이 촉진될 수 있습니다. 이메일을 별도로 보내면 개인 정보 보호에 도움이 될 수 있습니다.

1. 콘텐츠에 제목을 입력하고 편집기 유형을 선택한 후 이메일 본문을 생성합니다.

   유형으로 서식 있는 텍스트 또는 FreeMarker 템플릿을 선택합니다.

   ![Under Content, enter a subject and craft the body of the email.](./creating-notification-templates/images/05.png)

1. (선택 사항) 이메일 알림에 해당 자산을 포함하려면 개체 첨부 파일 필드를 선택합니다.

   ```{important}
   알림 작업과 관련된 개체 항목의 자산만 첨부할 수 있습니다.
   ```

   ![Select attachment fields to include assets in email notifications.](./creating-notification-templates/images/06.png)

1. **저장** 을 클릭하세요.

일단 생성되면 개체 작업과 함께 알림 템플릿을 사용할 수 있습니다. 자세한 내용은 [개체 작업 정의](../../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md) 참조하세요.

## 사용자 알림 템플릿 추가

1. **전역 메뉴**(![전역 메뉴](../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 다음 **알림 템플릿** 을 클릭합니다.

1. **추가**(![추가 버튼](../../images/icon-add.png))를 클릭하고 **사용자 알림** 을 선택합니다.

   ![Click the Add Button and select User Notification.](./creating-notification-templates/images/07.png)

   필드 참조를 사용하여 메시지를 항목 및 사용자 데이터로 동적으로 채울 수 있습니다. 용어 정의 섹션에서 지원되는 필드를 참조하는 개체 정의를 선택할 수 있습니다. 일반 용어 섹션에서는 알림 작업을 트리거하는 사용자의 필드를 참조하는 용어를 찾을 수 있습니다. 원하는 대로 템플릿 필드에 이러한 참조 용어를 사용하십시오. 자세한 내용은 [용어 정의 참조](#definition-of-terms-reference) 참조하세요.

   ![Search entities to add references to supported fields.](./creating-notification-templates/images/08.png)

1. 기본 정보에 템플릿의 이름과 설명을 입력합니다.

   ![Under Basic Info, enter a name and description.](./creating-notification-templates/images/09.png)

1. 설정에서 알림 수신자를 결정합니다.

   정의된 용어, 사용자 이름 또는 사용자 역할을 사용할 수 있습니다. 여러 명의 수신자를 추가하려면 값을 쉼표나 공백으로 구분하세요(예: `[%TICKET_AUTHOR_ID%]`, `[%TICKET_R_ASSIGNEE_USERID%]`).

   !!! important
       수신자를 동적으로 설정하면 [객체 항목 추가 권한](../../building-applications/objects/understanding-object-integrations/permissions-framework-integration.md#creating-entries) 이 있는 사용자만 수신할 수 있습니다. 알림.

   ![Determine recipients by entering terms, individual user names, or user roles.](./creating-notification-templates/images/10.png)

1. 콘텐츠 섹션에 알림 메시지를 입력합니다.

   정의된 용어를 사용하여 값을 동적으로 채울 수 있습니다.

   ![Enter the notification's message in the Content section.](./creating-notification-templates/images/11.png)

1. **저장** 을 클릭하세요.

일단 생성되면 개체 작업과 함께 알림 템플릿을 사용할 수 있습니다. 자세한 내용은 [개체 작업 정의](../../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md) 참조하세요.

## 용어 정의 참조

참조 용어를 사용하여 사용자 및 항목 데이터에 액세스하고 템플릿 필드를 동적으로 채울 수 있습니다. [알림 작업](../../building-applications/objects/creating-and-managing-objects/actions/understanding-action-types.md#notification) 을 트리거하는 이벤트와 관련된 모든 항목과 사용자를 참조할 수 있습니다. 현재 항목이 일대다 관계의 하위 측에 있는 경우 관련 개체 항목의 필드를 참조할 수도 있습니다. 관련 항목 필드에 대한 참조는 `[%RELATIONSHIPNAME_PARENTOBJECTNAME_OBJECTFIELD%]` 패턴을 사용합니다.

사용자 시스템 개체와 일대다 관계의 하위 쪽에 있는 사용자 지정 티켓 개체가 있는 시나리오를 고려해 보세요. 이 관계에 따라 티켓 담당자가 결정됩니다. 항목 업데이트 시 담당자에게 알리기 위해 티켓 개체에 알림 작업을 추가하면 이 작업에 사용되는 템플릿은 업데이트된 티켓과 담당자 모두에 대한 데이터에 액세스할 수 있습니다.

사용자 정의 개체 필드와 기본 개체 필드 모두에 용어를 사용할 수 있습니다.

!!! important
알림 작업을 트리거하는 이벤트에 직접 관련된 항목 및 사용자에 대한 필드만 참조할 수 있습니다.

### 현재 항목의 기본 용어

이 용어를 사용하여 현재 개체 항목에 대한 정보에 액세스합니다.

| 라벨         | 커머스 약관                                 |
| :--------- | :------------------------------------- |
| 작성자 이메일 주소 | `[%OBJECTNAME_AUTHOR_EMAIL_ADDRESS%]`  |
| 작성자 이름     | `[%OBJECTNAME_AUTHOR_FIRST_NAME%]`     |
| 작성자 ID     | `[%OBJECTNAME_AUTHOR_ID%]`             |
| 작성자 성      | `[%OBJECTNAME_AUTHOR_LAST_NAME%]`      |
| 작성자 중간 이름  | `[%OBJECTNAME_AUTHOR_MIDDLE_NAME%]`    |
| 작성자 접두어    | `[%OBJECTNAME_AUTHOR_PREFIX%]`         |
| 작성자 접미사    | `[%OBJECTNAME_AUTHOR_SUFFIX%]`         |
| 날짜 생성      | `[%OBJECTNAME_CREATEDATE%]`            |
| 외부 참조 코드   | `[%OBJECTNAME_EXTERNALREFERENCECODE%]` |
| ID         | `[%OBJECTNAME_ID%]`                    |
| 변경된 날짜     | `[%OBJECTNAME_MODIFIEDDATE%]`          |
| 상태         | `[%OBJECTNAME_STATUS%]`                |

### 현재 사용자의 기본 용어

알림 작업을 트리거하는 현재 사용자에 대한 정보에 액세스하려면 이 용어를 사용하세요.

| 라벨            | 커머스 약관                           |
| :------------ | :------------------------------- |
| 현재 사용자 이메일 주소 | `[%CURRENT_USER_EMAIL_ADDRESS%]` |
| 현재 사용자 이름     | `[%CURRENT_USER_FIRST_NAME%]`    |
| 현재 사용자 접두사    | `[%CURRENT_USER_PREFIX%]`        |
| 현재 사용자 성      | `[%CURRENT_USER_LAST_NAME%]`     |
| 현재 사용자 중간 이름  | `[%CURRENT_USER_MIDDLE_NAME%]`   |
| 현재 사용자 ID     | `[%CURRENT_USER_ID%]`            |
| 현재 사용자 접미사    | `[%CURRENT_USER_SUFFIX%]`        |

## 관련 주제

* [메일 구성](../../installation-and-upgrades/setting-up-liferay/configuring-mail.md)
* [이메일 설정](../../system-administration/configuring-liferay/virtual-instances/email-settings.md)
* [알림](../notifications.md)
