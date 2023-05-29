# 알림 템플릿 생성

{bdg-secondary}`사용 가능한 Liferay 7.4 U75+/GA75+`

알림 템플릿을 사용하면 Liferay 서비스에 대한 자동화된 이메일 및 사용자 알림을 디자인할 수 있습니다. 각 템플릿은 보낸 사람, 받는 사람 및 메시지 콘텐츠를 식별합니다. 템플릿을 디자인하는 동안 지원되는 엔터티를 검색하고 해당 데이터를 전자 메일에 동적으로 삽입하는 필드 참조를 추가할 수 있습니다.

현재 알림 템플릿은 [개체 작업](../../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md)만 지원합니다. 그러나 상거래 채널에는 채널 이벤트에 대한 알림 템플릿 기능이 내장되어 있습니다. 자세한 내용은 [이메일 보내기](https://learn.liferay.com/commerce/latest/ko/store-management/sending-emails.html) 참조하십시오.

```{important}
이메일 알림을 사용하려면 인스턴스에 구성된 [메일 서버](../../installation-and-upgrades/setting-up-liferay/configuring-mail.md)가 있어야 합니다. 일단 구성되면 인스턴스 수준에서 추가 [이메일 알림 설정](../../system-administration/configuring-liferay/virtual-instances/email-settings.md)에 액세스할 수 있습니다.
```

<!--TASK: include this content when client extensions documentation is updated, "If the out-of-the-box notification types don't meet your needs, you can use client extensions to create custom types. See \[]() for more information or [\]() for a tutorial." -->

## 이메일 알림 템플릿 추가

1. **글로벌 메뉴**(![Global Menu](../../images/icon-applications-menu.png))을 열고 **제어판** 탭으로 이동하여 **알림 템플릿** 클릭합니다.

1. **추가**(![Add Button](../../images/icon-add.png))를 클릭하고 **이메일** 선택합니다.

   ![추가 버튼을 클릭하고 이메일을 선택합니다.](./creating-notification-templates/images/01.png)

   필드 참조를 사용하여 항목 및 사용자 데이터로 메시지를 동적으로 채울 수 있습니다. 용어 정의 섹션에서 지원되는 필드를 참조할 개체 정의를 선택할 수 있습니다. 일반 용어 섹션에서 알림 작업을 트리거하는 사용자의 필드를 참조하기 위한 용어를 찾을 수 있습니다. 원하는 대로 템플릿 필드에서 이러한 참조 용어를 사용하십시오. 자세한 내용은 [용어 정의 참조](#definition-of-terms-reference) 참조하십시오.

   ![지원되는 필드에 대한 참조를 추가하려면 엔터티를 검색하십시오.](./creating-notification-templates/images/02.png)

1. 기본 정보에서 템플릿의 이름과 설명을 입력합니다.

   ![기본 정보에서 이름과 설명을 입력합니다.](./creating-notification-templates/images/03.png)

1. 설정에서 이메일 발신자와 수신자의 연락처 정보를 입력합니다.

   여러 수신자를 추가하려면 이메일 주소를 쉼표 또는 공백으로 구분하십시오(예: `test@liferay.com,learn@liferay.com`, `[%TICKET_AUTHOR_EMAIL_ADDRESS%] [%CURRENT_USER_EMAIL_ADDRESS%]`).

   ![설정에서 보낸 사람과 원하는 받는 사람에 대한 세부 정보를 입력합니다.](./creating-notification-templates/images/04.png)

1. 콘텐츠에서 제목을 입력하고 편집자 유형을 선택한 다음 이메일 본문을 생성합니다.

   유형으로 서식 있는 텍스트 또는 FreeMarker 템플릿을 선택합니다.

   ![콘텐츠에서 제목을 입력하고 이메일 본문을 작성합니다.](./creating-notification-templates/images/05.png)

1. (선택 사항) 이메일 알림에 자산을 포함하려면 개체 첨부 필드를 선택합니다.

   ```{important}
   알림 작업과 관련된 개체 항목의 자산만 첨부할 수 있습니다.
   ```

   ![이메일 알림에 자산을 포함하려면 첨부 파일 필드를 선택하십시오.](./creating-notification-templates/images/06.png)

1. **저장** 클릭합니다.

일단 생성되면 개체 작업과 함께 알림 템플릿을 사용할 수 있습니다. 자세한 내용은 [개체 작업 정의](../../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md) 참조하십시오.

## 사용자 알림 템플릿 추가

1. **글로벌 메뉴**(![Global Menu](../../images/icon-applications-menu.png))을 열고 **제어판** 탭으로 이동하여 **알림 템플릿** 클릭합니다.

1. **추가**(![Add Button](../../images/icon-add.png))를 클릭하고 **사용자 알림을 선택합니다.** .

   ![추가 버튼을 클릭하고 사용자 알림을 선택합니다.](./creating-notification-templates/images/07.png)

   필드 참조를 사용하여 항목 및 사용자 데이터로 메시지를 동적으로 채울 수 있습니다. 용어 정의 섹션에서 지원되는 필드를 참조할 개체 정의를 선택할 수 있습니다. 일반 용어 섹션에서 알림 작업을 트리거하는 사용자의 필드를 참조하기 위한 용어를 찾을 수 있습니다. 원하는 대로 템플릿 필드에서 이러한 참조 용어를 사용하십시오. 자세한 내용은 [용어 정의 참조](#definition-of-terms-reference) 참조하십시오.

   ![지원되는 필드에 대한 참조를 추가하려면 엔터티를 검색하십시오.](./creating-notification-templates/images/08.png)

1. 기본 정보에서 템플릿의 이름과 설명을 입력합니다.

   ![기본 정보에서 이름과 설명을 입력합니다.](./creating-notification-templates/images/09.png)

1. 설정에서 알림 수신자를 결정합니다.

   정의된 용어, 사용자 이름 또는 사용자 역할을 사용할 수 있습니다. 여러 수신자를 추가하려면 쉼표 또는 공백으로 값을 구분하십시오(예: `[%TICKET_AUTHOR_ID%]`, `[%TICKET_R_ASSIGNEE_USERID%]`).

   ![용어, 개별 사용자 이름 또는 사용자 역할을 입력하여 수신자를 결정합니다.](./creating-notification-templates/images/10.png)

1. 콘텐츠 섹션에서 알림 메시지를 입력합니다.

   정의된 용어를 사용하여 값을 동적으로 채울 수 있습니다.

   ![콘텐츠 섹션에 알림 메시지를 입력합니다.](./creating-notification-templates/images/11.png)

1. **저장** 클릭합니다.

일단 생성되면 개체 작업과 함께 알림 템플릿을 사용할 수 있습니다. 자세한 내용은 [개체 작업 정의](../../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md) 참조하십시오.

## 용어 정의 참조

참조 용어를 사용하여 사용자 및 항목 데이터에 액세스하고 템플릿의 필드를 동적으로 채울 수 있습니다. [알림 작업](../../building-applications/objects/creating-and-managing-objects/actions/understanding-action-types.md#notification)을 트리거하는 이벤트에 관련된 모든 항목 및 사용자를 참조할 수 있습니다.

사용자 시스템 개체와의 일대다 관계의 하위 쪽에 있는 사용자 지정 티켓 개체가 있는 시나리오를 고려하십시오. 이 관계는 티켓 담당자를 결정합니다. 입장 업데이트 시 담당자에게 알리기 위해 티켓 개체에 알림 작업을 추가하면 이 작업에 사용되는 템플릿이 업데이트된 티켓과 담당자 모두에 대한 데이터에 액세스할 수 있습니다.

용어는 사용자 정의 및 기본 개체 필드 모두에 사용할 수 있습니다.

```{important}
알림 작업을 트리거하는 이벤트에 직접 관련된 항목 및 사용자에 대한 필드만 참조할 수 있습니다. 
```

### 현재 항목에 대한 기본 조건

현재 개체 항목에 대한 정보에 액세스하려면 이 용어를 사용하십시오.

| 라벨         | 용어                                     |
|:---------- |:-------------------------------------- |
| 작성자 이메일 주소 | `[%OBJECTNAME_AUTHOR_EMAIL_ADDRESS%]`  |
| 저자 이름      | `[%OBJECTNAME_AUTHOR_FIRST_NAME%]`     |
| 저자 ID      | `[%OBJECTNAME_AUTHOR_ID%]`             |
| 저자 성       | `[%OBJECTNAME_AUTHOR_LAST_NAME%]`      |
| 저자 중간 이름   | `[%OBJECTNAME_AUTHOR_MIDDLE_NAME%]`    |
| 저자 접두사     | `[%OBJECTNAME_AUTHOR_PREFIX%]`         |
| 저자 접미사     | `[%OBJECTNAME_AUTHOR_SUFFIX%]`         |
| 날짜 생성      | `[%OBJECTNAME_CREATEDATE%]`            |
| 외부 참조 코드   | `[%OBJECTNAME_EXTERNALREFERENCECODE%]` |
| ID         | `[%OBJECTNAME_ID%]`                    |
| 변경된 날짜     | `[%OBJECTNAME_MODIFIEDDATE%]`          |
| 상태         | `[%OBJECTNAME_STATUS%]`                |

### 현재 사용자의 기본 약관

이러한 용어를 사용하여 알림 작업을 트리거하는 현재 사용자에 대한 정보에 액세스합니다.

| 라벨            | 용어                               |
|:------------- |:-------------------------------- |
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
