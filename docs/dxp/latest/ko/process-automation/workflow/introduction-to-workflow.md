# 워크플로 소개

Liferay DXP는 사용자가 블로그, 웹 콘텐츠, Wiki와 같은 콘텐츠를 게시하기 전에 검토하고 승인할 수 있는 워크플로 엔진과 함께 제공됩니다. Workflow 응용 프로그램을 사용하면 포털 인터페이스를 통해 여러 비즈니스 프로세스/워크플로를 정의하고 배포하고 관리할 수 있습니다. 워크플로 프로세스는 `XML` 형식으로 작성되었으며 몇 가지 샘플 워크플로 프로세스를 참조할 수 있습니다. 마지막으로 워크플로 프로세스는 검토자 및 승인자로서 사용자, 그룹 및 역할과 통합할 수 있습니다. 검토 프로세스를 정의한 후 게시하기 전에 검토 프로세스가 필요한 콘텐츠 유형을 선택할 수 있습니다.

## 워크플로 활성화

특정 자산에 대해 워크플로가 활성화되면 **게시** 버튼이 **게시를 위해 제출** 버튼으로 바뀌고 즉시 게시 대신 자산 상태가 **보류** 로 설정됩니다. 게시하기 전에 워크플로를 거쳐야 합니다.

![게시 버튼 대신 게시를 위해 제출 버튼이 워크플로 사용 리소스에 나타납니다.](./introduction-to-workflow/images/01.png)

즉시 사용 가능한 워크플로 프로세스를 **단일 승인자** 이라고 합니다. 즉, 한 사람이 게시 전에 제출물을 검토하고 승인해야 합니다.

자세한 내용은 [워크플로 활성화](./using-workflows/activating-workflow.md) 및 [검토를 통해 자산 보내기](./using-workflows/reviewing-assets.md) 기사를 참조하십시오.

## 워크플로우 구축

워크플로를 통해 사용자는 여러 검토자와 승인자가 있을 수 있는 보다 복잡한 워크플로를 구축할 수 있습니다. 효과적인 워크플로를 구축하는 방법을 알아보세요.

* [XML로 검토 프로세스 만들기](./developer-guide/crafting-xml-workflow-definitions.md)
* [검토 프로세스를 시각적으로 디자인하기](./designing-and-managing-workflows/workflow-designer/workflow-designer-overview.md) (구독자)
* [워크플로 정의 업로드](./designing-and-managing-workflows/managing-workflows.md#uploading-a-new-workflow-definitions)
* [워크플로 정의 관리](./designing-and-managing-workflows/managing-workflows.md)

자신만의 워크플로 구축을 시작하려면 [워크플로 구축](./designing-and-managing-workflows/building-workflows.md)을 참조하십시오.

### 워크플로 메트릭을 사용하여 SLA 구현

> 기부금

**메트릭** 기능은 워크플로 프로세스에서 SLA(서비스 수준 계약) 성능을 측정하는 데 사용할 수 있습니다. SLA는 워크플로 프로세스의 이벤트에 대한 기한을 정의합니다. 귀하와 귀하의 고객 간에 공식적으로 합의된 기한일 수도 있고 내부 목표를 충족하기 위해 비공식적으로 생성되어 다음과 같은 이벤트를 추적할 수도 있습니다.

* 총 해결 시간
* 특정 워크플로 작업을 완료하는 데 걸리는 시간

SLA가 설정되면 SLA 타이머를 트리거하는 워크플로 제출은 워크플로 메트릭 프레임워크에 의해 자동으로 보고되고 **on time** 또는 **overdue** 상태가 지정됩니다.

![SLA를 기반으로 생성된 워크플로우 보고서를 참조하십시오.](./introduction-to-workflow/images/02.png)

워크플로에 SLA를 추가하는 방법을 알아보려면 [워크플로 메트릭 사용하기](./using-workflows/using-workflow-metrics.md) 문서를 참조하세요.

## 워크플로 상태 이해

워크플로 프로세스의 자산에는 항상 상태가 있습니다. 상태는 자산을 최종 사용자에게 표시할 수 있는지 여부와 같은 중요한 사항을 결정하는 데 사용됩니다. 많은 상태가 있지만 이해해야 할 가장 일반적이고 중요한 일부 상태는 다음과 같습니다.

- **초안** 상태는 워크플로에서 검토하거나 최종 사용자가 볼 준비가 되기 전에 저장할 수 있는 콘텐츠에 할당됩니다.
- **보류 중** 상태는 자산이 아직 완료되지 않은 워크플로 프로세스에 있음을 나타냅니다.
- **승인** 상태는 자산을 볼 수 있는 권한이 있는 모든 사용자의 UI에 자산을 표시할 준비가 되었음을 의미합니다.
- **거부** 상태는 워크플로를 통과하지 못한 자산에 대한 것입니다. 이 상태는 자산의 원래 제출자에 대한 알림을 트리거하는 데 사용될 수 있으며, 콘텐츠의 수정 및 다시 제출을 촉구할 수 있습니다.

![콘텐츠에는 워크플로 상태가 있을 수 있습니다.](./introduction-to-workflow/images/03.png)

사용 가능한 모든 상태를 보려면 소스 코드의 [WorkflowConstants 클래스](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/workflow/WorkflowConstants.java) 을 참조하십시오.

### 버전이 지정된 자산은 여러 상태를 가질 수 있습니다.

버전이 지정된 자산은 두 가지 상태를 가질 수 있습니다.

![버전이 지정된 자산은 두 가지 상태를 가질 수 있습니다.](./introduction-to-workflow/images/04.png)

대부분의 자산은 기본적으로 승인된 최신 버전을 표시합니다. 이미 승인된 자산이 업데이트되면 새 버전이 생성되어 워크플로를 통해 전송됩니다. 새 버전이 워크플로우에서 아직 승인되지 않은 동안 자산에 대한 두 번째 상태가 표시됩니다(예: **보류 중**). 마지막으로 승인된 버전은 새 버전이 승인될 때까지 계속 사용됩니다.

## 다음

* [워크플로 활성화](./using-workflows/activating-workflow.md)
* [워크플로 관리](./designing-and-managing-workflows/managing-workflows.md)
* [워크플로 디자이너 개요](./designing-and-managing-workflows/workflow-designer/workflow-designer-overview.md)
