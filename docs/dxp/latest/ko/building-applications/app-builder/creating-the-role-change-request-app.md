# 역할 변경 요청 앱 만들기

> **가입자**

역할 변경 요청 앱은 직원이 요청 양식을 제출하는 것으로 시작됩니다. 그런 다음 처리는 현재 관리자, 수신 관리자, 마지막으로 인사부로 진행됩니다. 각 단계마다 다른 형태가 제시되고 객체는 데이터를 축적합니다. 프로세스가 끝나면 전체 데이터 개체가 완성됩니다.

![역할 변경 요청 개체는 이 워크플로 기반 앱에서 여러 단계를 거칩니다.](./creating-the-role-change-request-object/images/01.png)

계속하기 전에 지원 개체, 양식 보기 및 테이블 보기를 만듭니다. 자세한 내용은 [역할 변경 요청 객체 생성](./creating-the-role-change-request-object.md) 을 참조하십시오. 여기에서 제공된 지원 개체를 기반으로 Workflow Powered App을 생성합니다.

개체 제어판 항목 내에서 표준 앱을 만들 수 있지만 워크플로 기반 앱은 만들 수 없습니다. 대신 **앱** 제어판 항목을 사용하십시오.

1. 애플리케이션 메뉴(![Applications Menu](../../images/icon-applications-menu.png))를 열고 제어판 &rarr; 앱 빌더 &rarr; 앱으로 이동합니다.

1. **Workflow Powered** 탭을 클릭합니다. 기존 Workflow Powered 앱이 표시됩니다.

1. 추가 버튼(![Add](../../images/icon-add.png))을 클릭하여 새 워크플로 기반 앱 캔버스를 엽니다.

   ![Workflow Powered App이 진행 중입니다.](./creating-a-workflow-powered-application/images/01.png)

1. 워크플로의 첫 번째 단계가 준비되었습니다. 이름을 **Request Role Change** 로 바꿉니다. 첫 번째 단계는 애플리케이션 프로세스를 시작하는 첫 번째 양식 제출을 나타냅니다. 단계 이름을 바꾼 후 데이터 및 보기를 구성합니다.

   - 기본 데이터 개체: **역할 변경 요청** 개체를 선택합니다.
   - 양식 보기: **직원 요청** 양식을 선택하십시오.
   - 테이블 보기: **역할 변경 요청 마스터 목록** 을 선택합니다(이 단계에서는 이 테이블 보기가 사용되지 않음).

   작업 구성:

   - 현재 작업의 이름을 **Send to Manager** 로 바꿉니다.

   응용 프로그램을 저장하십시오.

1. 앱을 다시 열고 **더하기** 아이콘을 클릭하여 워크플로에 단계를 추가합니다.

   이름을 **검토: 현재 관리자** 로 지정하고 **관리자** 역할에 할당합니다. 역할 변경 요청 앱에 추가하는 각 단계는 다른 양식에 해당합니다. 함께 모든 단계/양식이 지원 개체의 모든 필드를 채웁니다.

   이제 데이터 및 보기를 구성합니다.

   - 양식 보기: **현재 관리자의 평가** . 편집 가능하게 만드십시오.

   단계 구성 화면으로 돌아가서 작업을 구성합니다.

   - 작업 이름을 **Forward to Receiving Manager** 로 바꿉니다.

   앱을 저장합니다. 기존 앱 데이터에 업데이트를 적용하라는 경고 메시지가 표시되면 대화 상자에서 **저장** 을 클릭합니다. 현재 데이터 레코드가 없는 새 앱이며 경고는 정보 제공용입니다.

1. 앱을 다시 열고 마지막으로 추가된 단계를 클릭한 다음 **더하기** 아이콘을 클릭하여 새 단계를 추가합니다.

   이름을 **검토: 수신 관리자** 로 지정하고 **관리자** 역할에 할당합니다.

   이제 데이터 및 보기를 구성합니다.

   - 양식 보기: **잠재적인 관리자의 평가** . 편집 가능하게 만드십시오.

   단계 구성 화면으로 돌아가서 작업을 구성합니다.

   - 기존 작업의 이름을 **Forward to Human Resources** 로 바꿉니다. 워크플로의 다음 단계로 전환됩니다.

   - **Send Back to Current Manager** 이라는 보조 작업을 추가합니다. 이전 워크플로 단계로 다시 전환되어 HR 검토 준비가 될 때까지 두 관리자가 세부 사항에 대해 협업할 수 있습니다.

1. 앱을 다시 열고 추가된 마지막 단계를 클릭한 다음 더하기 아이콘을 클릭하여 새 단계를 추가합니다.

   이름을 **검토: HR** 로 지정하고 **관리자** 역할에 할당합니다.

   이제 데이터 및 보기를 구성합니다.

   - 양식 보기: **HR 평가** . 편집 가능하게 만드십시오.

   단계 구성 화면으로 돌아가서 작업을 구성합니다.

   - **Submit** 이라는 작업을 그대로 둡니다.

## 앱 배포

이제 앱을 사용할 준비가 되었습니다. 사용자가 데이터 전송을 시작할 수 있도록 [배포](./creating-a-standard-application.md#deploying-the-application) 만 있으면 됩니다.

역할 변경 요청 앱은 전용 링크가 있는 독립 실행형 앱으로 배포할 수 있습니다. 이것은 아마도 [Wiki](../../collaboration-and-social/collaboration-and-social-overview.md#wiki) 또는 회사의 직원 핸드북 [문서](../../content-authoring-and-management/documents-and-media.md)에서 일부 절차를 읽은 후 사용해야 하는 유형의 앱입니다. 링크를 유지하면 직원이 역할 변경 요청을 시작하기 전에 적절한 문서를 읽을 수 있습니다.

## 앱 사용

모든 워크플로 항목과 마찬가지로 양식을 작성하고 제출하려면 작업을 사용자에게 할당해야 합니다. 이를 수행하는 방법은 워크플로 작업에 액세스하는 방법에 따라 다릅니다.

직원 요청 양식이 제출되면 다음 단계에 할당된 역할이 [알림](../../collaboration-and-social/notifications-and-requests/user-guide/managing-notifications-and-requests.md)을 받습니다. 클릭하면 다음 양식 보기인 검토: 현재 관리자가 표시됩니다. 변경 아이콘(![Change](../../images/icon-change.png))을 클릭하여 사용자에게 작업을 할당합니다.

![앱의 각 형태는 사용자 알림을 통해 액세스할 수 있습니다.](./creating-a-workflow-powered-application/images/03.png)

또는 앱의 테이블 보기에서 앱 항목의 워크플로우 프로세스를 관리할 수 있습니다. 앱의 기본 보기는 테이블 보기이므로 역할 변경 요청과 같은 독립 실행형 앱의 경우 전용 링크를 사용하여 앱으로 이동합니다. 항목의 작업 버튼(![Actions](../../images/icon-actions.png))을 클릭합니다.

![앱의 각 양식은 레코드의 작업 메뉴를 통해 액세스할 수 있습니다.](./creating-the-role-change-request-app/images/04.png)

사용자에게 작업을 할당하려면 **Assign To** 메뉴 항목을 사용합니다. 그런 다음 **편집** 메뉴 옵션을 선택하여 적절한 양식에 액세스할 수 있습니다.

```{note}
[My Workflow Tasks](../../process-automation/workflow/using-workflows/reviewing-assets.md#assigning-the-review-task) 앱을 사용하여 Workflow Powered App의 단계를 관리할 수 없습니다. .
```

## 역할 변경 요청 앱으로 더 나아가기

역할 변경 요청 앱이 완전히 작동하도록 개선 사항을 추가합니다.

1. [관리자 및 HR에 대한 역할](../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) 을 만듭니다. 관리자 역할을 사용하는 대신 각 역할에 적절한 단계를 지정하십시오.

2. 적절한 권한이 있는 사용자가 역할 변경 요청 개체에서 마스터 목록 테이블을 볼 수 있도록 표준 앱을 만듭니다. 관리자는 첫 번째 양식인 **Employee Request** 에 액세스할 수 있으므로 직원을 위한 양식을 시작할 수도 있습니다.

## 관련 정보

- [앱 빌더 개요](../app-builder.md)
- [표준 애플리케이션 생성](./creating-a-standard-application.md)
- [워크플로우](../../process-automation/workflow/introduction-to-workflow.md)
- [역할 및 권한](../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md)
