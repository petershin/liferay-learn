---
uuid: 811680aa-eb5f-4386-a8d2-be8e613b92a0
---

# 워크플로 작업 및 알림 구성

{bdg-primary}`구독`

워크플로 디자이너를 사용하여 사용자는 각 노드에 대한 워크플로 작업 및 알림을 구성할 수 있습니다.

작업은 매우 유연하며 노드에 들어가기 전, 노드를 종료한 후 또는 작업 노드가 할당된 후 작업이 발생하는 시기를 지정할 수 있습니다. 예를 들어 검토자가 웹 콘텐츠 기사를 거부하면 워크플로 작업은 자산의 상태를 **보류** 로 설정하고 기사를 원래 작성자에게 자동으로 재할당합니다.

![작업 노드에 작업을 추가할 수 있습니다.](./configuring-workflow-actions-and-notifications/images/01.png)

워크플로 알림은 작업 할당자에게 워크플로에 주의가 필요함을 알리거나 자산 작성자에게 프로세스 상태를 업데이트하기 위해 전송됩니다. 작업 또는 워크플로의 다른 유형의 노드에 대해 보낼 수 있습니다.

![작업 노드에 알림을 추가할 수 있습니다.](./configuring-workflow-actions-and-notifications/images/02.png)

그러나 모든 노드에 워크플로 작업 또는 알림이 필요한 것은 아닙니다. 일반적으로 검토 프로세스가 시작되었거나 종료되었음을 원래 작성자에게 알리지 않는 한 시작 및 종료 노드에는 작업이나 알림이 없습니다.

단일 승인자 정의에서 두 개의 [작업 노드(검토 및 업데이트)](./creating-workflow-tasks.md) 에는 작업 및 알림이 있습니다.

## 작업 추가

단일 승인자 워크플로 정의를 만드는 경우 거부 **작업****업데이트** 작업 노드에 추가해야 합니다. 이 거부 작업에는 실행 시 자산 상태를 **거부** , **보류** 으로 설정하는 Groovy 스크립트가 포함되어 있습니다.

아래 단계를 따르십시오.

1. **전역 메뉴** &rarr; **응용 프로그램** &rarr; **프로세스 빌더** 로 이동합니다.
1. **워크플로** 탭을 클릭합니다.
1. 워크플로 정의(예: **단일 승인자**)를 클릭합니다.
1. **업데이트** 노드를 클릭합니다.

    ![업데이트 노드를 수정합니다.](./configuring-workflow-actions-and-notifications/images/04.png)

1. 기존 작업을 클릭하거나 현재 정의된 작업이 없는 경우 **새로 만들기** 클릭합니다.
1. 이름 필드에 **거부** 입력합니다.
1. **Execution Type** 드롭다운 메뉴에서 **On Assignment** 선택합니다.
1. **Template(Groovy**) 필드에 스크립트를 입력합니다(일부 버전에서는 **Script** 필드라고 함). 단일 승인자 작업 흐름에는 자산 상태를 **거부** 로 설정한 다음 **보류** 로 설정하는 Groovy로 작성된 작업이 포함된 업데이트 작업이 포함되어 있습니다.

    ```java
    import com.liferay.portal.kernel.workflow.WorkflowConstants;
    import com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil;

    WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.getLabelStatus("denied"), workflowContext);
    WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.getLabelStatus("pending"), workflowContext);
    ```

    ![거부 조치를 추가하십시오.](./configuring-workflow-actions-and-notifications/images/05.png)

1. 완료되면 뒤로 화살표(![Back](../../../../images/icon-angle-left.png))를 클릭합니다(일부 버전에서는 작업 정의에서 **저장** 클릭해야 함).

다음으로 현재 제출이 거부되었으며 더 많은 작업이 필요함을 자산 생성자에게 알리는 알림을 추가합니다.

## 알림 추가

**업데이트** 작업 노드에 알림을 추가하여 자산 생성자에게 제출물에 더 많은 작업이 필요하고 그에게 다시 할당되었음을 알립니다.

아래 단계를 따르십시오.

1. 업데이트 노드의 속성 사이드바에서 기존 알림을 클릭하거나 아직 정의되지 않은 경우 **신규** 클릭합니다.

 ![알림은 속성 탭에서 찾을 수 있습니다.](./configuring-workflow-actions-and-notifications/images/03.png)

1. 다음을 입력:
    ***이름:** 작성자 수정 알림
    ***설명** : 이 알림에 대한 설명을 입력합니다.

1. **템플릿 언어** 드롭다운 메뉴에서 **Freemarker** 선택합니다.
1. **템플릿** 필드에 메시지를 입력합니다.
    * `Your submission was rejected by ${userName}, please modify and resubmit.`

   주입된 템플릿 변수에 대해 알아보려면 [워크플로 알림 템플릿 변수](../../developer-guide/workflow-notification-template-variables.md) 을 참조하십시오.

1. 알림 유형을 선택합니다.

    * 이메일
    * 사용자 알림

1. **Execution Type** 드롭다운 메뉴에서 **On Assignment** 선택합니다. 이 작업에 누군가가 지정되면 알림이 전송됩니다.
1. 수신자 유형을 선택합니다(**Asset Creator**).

     ![작성자에게 제출이 거부되었음을 알리는 알림을 업데이트 노드에 추가합니다.](./configuring-workflow-actions-and-notifications/images/06.png)

1. 완료되면 뒤로 화살표(![Back](../../../../images/icon-angle-left.png))를 클릭합니다(일부 버전에서는 알림 섹션에서 **저장** 클릭해야 함).

업데이트 노드에 대한 알림이 추가되었습니다.

## 추가 정보

* [워크플로 알림 템플릿 변수](../../developer-guide/workflow-notification-template-variables.md)
* [워크플로 작업 만들기](./creating-workflow-tasks.md)
* [분기 및 조인 사용](./using-forks-and-joins.md)
* [조건 노드 사용](./using-condition-nodes.md)
* [워크플로 노드](./assigning-task-nodes.md)
