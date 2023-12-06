# 역할 변경 요청 앱 만들기

> **구독자**

역할 변경 요청 앱은 직원이 요청 양식을 제출하는 것으로 시작됩니다. 그런 다음 처리는 현재 관리자, 수신 관리자, 마지막으로 인사 부서로 진행됩니다. 각 단계마다 다른 형태가 제시되고, 객체는 데이터를 축적한다. 프로세스가 끝나면 전체 데이터 개체가 완성됩니다.

![The Role Change Request object flows through several steps in this Workflow Powered App.](./creating-the-role-change-request-object/images/01.png)

계속하기 전에 지원 개체, 양식 보기 및 테이블 보기를 만듭니다. 자세한 내용은 [역할 변경 요청 객체 생성](./creating-the-role-change-request-object.md)을 참조하세요. 여기에서는 여기에 제시된 지원 개체를 기반으로 Workflow Powered App을 만듭니다.

표준 앱은 개체 제어판 항목 내에서 생성할 수 있지만 워크플로 기반 앱은 생성할 수 없습니다. 대신 **Apps** 제어판 항목을 사용하세요.

1. 애플리케이션 메뉴(![애플리케이션 메뉴](../../../images/icon-applications-menu.png))를 열고 제어판 &rarr; 앱 빌더 &rarr; 앱으로 이동합니다.

1. **워크플로 기반** 탭을 클릭하세요. 기존 Workflow Powered 앱이 모두 표시됩니다.

1. 추가 버튼(![Add](../../../images/icon-add.png))을 클릭하여 새 워크플로 기반 앱 캔버스를 엽니다.

   ![The Workflow Powered App is underway.](./creating-a-workflow-powered-application/images/01.png)

1. 워크플로의 첫 번째 단계가 준비되었습니다. 이름을 **역할 변경 요청** 으로 바꾸세요. 첫 번째 단계는 신청서 프로세스를 시작하는 첫 번째 양식을 제출하는 것을 나타냅니다. 단계 이름을 바꾼 후 데이터 및 보기를 구성합니다.

   - 기본 데이터 개체: **Role Change Request** 개체를 선택합니다.
   - 양식 보기: **Employee Request** 양식을 선택합니다.
   - 테이블 보기: **역할 변경 요청 마스터 목록** 을 선택합니다(이 테이블 보기는 이 단계에서 사용되지 않습니다).

   작업 구성:

   - 현재 작업의 이름을 **관리자에게 보내기** 로 바꿉니다.

   응용 프로그램을 저장합니다.

1. 앱을 다시 열고 **plus** 아이콘을 클릭하여 워크플로에 단계를 추가하세요.

   이름을 **Review: Current Manager** 로 지정하고 **Administrator** 역할에 할당합니다. 역할 변경 요청 앱에 추가하는 각 단계는 다른 양식에 해당합니다. 모든 단계/양식이 함께 지원 개체의 모든 필드를 채웁니다.

   이제 데이터 및 보기를 구성합니다.

   - 양식 보기: **현재 관리자의 평가** . 편집 가능하게 만드세요.

   단계 구성 화면으로 돌아가서 작업을 구성합니다.

   - 작업 이름을 **수신 관리자에게 전달** 로 바꿉니다.

   앱을 저장합니다. 기존 앱 데이터에 업데이트를 적용하라는 경고 메시지가 표시되면 대화 상자에서 **저장** 을 클릭하세요. 현재 데이터 기록이 없는 새로운 앱이며 경고는 정보 제공용입니다.

1. 앱을 다시 열고 추가된 마지막 단계를 클릭한 후 **plus** 아이콘을 클릭하여 새 단계를 추가하세요.

   이름을 **검토: 수신 관리자** 로 지정하고 **관리자** 역할에 할당합니다.

   이제 데이터 및 보기를 구성합니다.

   - 양식 보기: **잠재 관리자 평가** . 편집 가능하게 만드세요.

   단계 구성 화면으로 돌아가서 작업을 구성합니다.

   - 기존 작업의 이름을 **인사 부서에 전달** 로 바꿉니다. 워크플로의 다음 단계로 전환됩니다.

   - **현재 관리자에게 다시 보내기** 라는 보조 작업을 추가합니다. 이전 워크플로 단계로 다시 전환되어 HR 검토 준비가 완료될 때까지 두 관리자가 세부 사항에 대해 협업할 수 있습니다.

1. 앱을 다시 열고 추가된 마지막 단계를 클릭한 후 더하기 아이콘을 클릭하여 새 단계를 추가하세요.

   이름을 **Review: HR** 로 지정하고 **Administrator** 역할에 할당합니다.

   이제 데이터 및 보기를 구성합니다.

   - 양식 보기: **HR 평가** . 편집 가능하게 만드세요.

   단계 구성 화면으로 돌아가서 작업을 구성합니다.

   - **Submit** 이라는 작업을 그대로 둡니다.

## 앱 배포

이제 앱을 사용할 준비가 되었습니다. 사용자가 데이터 전송을 시작할 수 있도록 [deployed](./creating-a-standard-application.md#deploying-the-application) 이어야 합니다.

역할 변경 요청 앱은 전용 링크가 있는 독립형 앱으로 배포할 수 있습니다. 이는 아마도 [Wiki](../../../collaboration-and-social/collaboration-and-social-overview.md#wiki) 또는 회사의 일부 절차를 읽은 후 사용해야 하는 앱 유형입니다. 직원 안내서 [document](../../../content-authoring-and-management/documents-and-media.md). 링크를 유지하면 직원이 역할 변경 요청을 시작하기 전에 해당 문서를 읽을 수 있습니다.

## 앱 사용

모든 워크플로 항목과 마찬가지로 양식을 작성하고 제출하려면 사용자에게 작업을 할당해야 합니다. 이를 수행하는 방법은 워크플로 작업에 액세스하는 방법에 따라 달라집니다.

직원 요청 양식이 제출되면 다음 단계에 할당된 역할은 [notification](../../../collaboration-and-social/notifications-and-requests/user-guide/managing-notifications-and-) 을 받습니다. 요청.md). 다음 양식 보기인 검토: 현재 관리자를 보려면 클릭하세요. 변경 아이콘(![Change](../../../images/icon-change.png))을 클릭하여 사용자에게 작업을 할당합니다.

![Each form of the app can be accessed via User Notification.](./creating-a-workflow-powered-application/images/03.png)

또는 앱의 테이블 보기에서 앱 항목의 워크플로 프로세스를 관리할 수 있습니다. 앱의 기본 보기는 테이블 보기이므로 역할 변경 요청과 같은 독립형 앱의 경우 전용 링크를 사용하여 앱으로 이동하세요. 항목의 작업 버튼(![Actions](../../../images/icon-actions.png))을 클릭합니다.

![Each form of the app can be accessed via the record's Actions menu.](./creating-the-role-change-request-app/images/04.png)

사용자에게 작업을 할당하려면 **할당 대상** 메뉴 항목을 사용하세요. 그런 다음 **Edit** 메뉴 옵션을 선택하여 해당 양식에 액세스할 수 있습니다.

```{note}
[내 워크플로 작업](../../../process-automation/workflow/using-workflows/reviewing-assets.md#signing-the-review-task) 앱을 사용하여 작업 단계를 관리할 수 없습니다. 워크플로 기반 앱.
```

## 역할 변경 요청 앱으로 더 나아가기

역할 변경 요청 앱이 완벽하게 작동하도록 개선 사항을 추가합니다.

1. 관리자 및 HR을 위한 [역할 생성](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) 관리자 역할을 사용하는 대신 각 역할에 적절한 단계를 할당하십시오.

1. 적절한 권한이 있는 사용자가 역할 변경 요청 개체에서 마스터 목록 테이블을 볼 수 있도록 표준 앱을 만듭니다. 관리자는 첫 번째 양식인 **Employee Request** 에 액세스할 수 있으므로 직원에 대한 양식을 시작할 수도 있습니다.

## 관련 정보

* [앱 빌더 개요](../app-builder.md)
* [표준 애플리케이션 생성](./creating-a-standard-application.md)
* [Workflow](../../../process-automation/workflow/introduction-to-workflow.md)
* [역할 및 권한](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md)
