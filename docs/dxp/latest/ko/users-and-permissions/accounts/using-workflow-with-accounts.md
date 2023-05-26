# 계정으로 워크플로 사용

{bdg-secondary}`사용 가능한 Liferay 7.4 U49+/GA49+`

계정은 Liferay의 [워크플로 엔진](../../process-automation/workflow/introduction-to-workflow.md) 과 완전히 통합되어 계정 생성을 위한 승인 프로세스를 활성화할 수 있습니다.

계정에 대한 워크플로를 활성화하려면

1. **글로벌 메뉴**(![Global Menu](../../images/icon-applications-menu.png))을 열고 **애플리케이션** 탭 &rarr; **프로세스 빌더** 로 이동합니다.

1. **구성** 탭으로 이동하고 계정 항목에 대해 **편집** 을 클릭합니다.

1. 드롭다운 메뉴를 사용하여 **작업 흐름** 을 선택합니다.

   사용자 지정 워크플로 설계에 대해 알아보려면 [워크플로 디자이너 개요](../../process-automation/workflow/designing-and-managing-workflows/workflow-designer/workflow-designer-overview.md) 을 참조하십시오.

   ![드롭다운 메뉴를 사용하여 워크플로를 선택합니다.](./using-workflow-with-accounts/images/01.png)

1. **저장** 을 클릭합니다.

이제 워크플로가 활성화되었습니다. 새 계정은 활성화되기 전에 정의된 승인 프로세스를 거쳐야 합니다.

[계정을 만들면](../accounts.md#creating-an-account) 상태가 보류 중으로 설정되고 검토자에게 알림이 전송됩니다.

![지정된 검토자는 새 계정에 대한 알림을 받습니다.](./using-workflow-with-accounts/images/02.png)

검토자는 보류 중인 계정을 승인하거나 거부할 수 있습니다. 검토 프로세스에 대한 자세한 내용은 [자산 검토](../../process-automation/workflow/using-workflows/reviewing-assets.md) 을 참조하십시오.

![검토자는 계정을 승인하거나 거부할 수 있습니다.](./using-workflow-with-accounts/images/03.png)

## 관련 주제

* [계정 생성](../accounts.md#creating-an-account)
* [워크플로 디자이너 개요](../../process-automation/workflow/designing-and-managing-workflows/workflow-designer/workflow-designer-overview.md)
* [자산 검토](../../process-automation/workflow/using-workflows/reviewing-assets.md)
