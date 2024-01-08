# 계정으로 워크플로 사용

{bdg-secondary}`liferay 7.4 U49+/GA49+`

계정은 Liferay의 [워크플로 엔진](../../process-automation/workflow/introduction-to-workflow.md) 과 완전히 통합되어 있으므로 계정 생성에 대한 승인 프로세스를 활성화할 수 있습니다.

계정에 대한 워크플로를 활성화하려면,

1. **전역 메뉴**(![전역 메뉴](../../images/icon-applications-menu.png))를 열고 **응용 프로그램** 탭 &rarr; **프로세스 빌더** 로 이동합니다.

1. **구성** 탭으로 이동하여 계정 항목에 대해 **편집** 을 클릭하세요.

1. 드롭다운 메뉴를 사용하여 **워크플로** 를 선택하세요.

   사용자 정의 워크플로 디자인에 대해 알아보려면 워크플로 디자이너 [워크플로 디자이너 개요](../../process-automation/workflow/designing-and-managing-workflows/workflow-designer/workflow-designer-overview.md) 을 참조하세요.

   ![Use the drop-down menu to select a workflow.](./using-workflow-with-accounts/images/01.png)

1. **저장** 을 클릭하세요.

이제 워크플로가 활성화되었습니다. 새 계정은 활성화되기 전에 정의된 승인 프로세스를 거쳐야 합니다.

[계정을 생성하면](../accounts.md#creating-an-account) 상태가 보류 중으로 설정되고 검토자에게 알림이 전송됩니다.

![Designated reviewers are notified of new accounts.](./using-workflow-with-accounts/images/02.png)

검토자는 보류 중인 계정을 승인하거나 거부할 수 있습니다. 검토 프로세스에 대한 자세한 내용은 [자산 검토](../../process-automation/workflow/using-workflows/reviewing-assets.md) 참조하십시오.

![Reviewers can approve or reject accounts.](./using-workflow-with-accounts/images/03.png)

## 관련 주제

* [계정 생성](../accounts.md#creating-an-account)
* [워크플로 디자이너 개요](../../process-automation/workflow/designing-and-managing-workflows/workflow-designer/workflow-designer-overview.md)
* [자산 검토](../../process-automation/workflow/using-workflows/reviewing-assets.md)
