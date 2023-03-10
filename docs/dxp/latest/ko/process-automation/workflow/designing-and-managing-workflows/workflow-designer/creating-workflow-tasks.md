# 워크플로 작업 만들기

{bdg-primary}`구독`

기본 [단일 승인자 정의](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-runtime-impl/src/main/resources/META-INF/definitions/single-approver-workflow-definition.xml) 은 워크플로 작업에 대한 간단한 소개를 제공합니다. 여기에는 검토 및 업데이트라는 두 개의 작업 노드만 있습니다. 콘텐츠 제작자가 검토를 위해 자산을 제출하면 워크플로가 검토 노드로 들어갑니다. 검토 시 자산을 수락하거나 거부할 수 있습니다. 거부되면 프로세스가 업데이트 작업으로 이동합니다. 그런 다음 제출자는 자산을 수정하고 검토를 위해 다시 제출할 수 있습니다.

![단일 승인자 정의에는 두 개의 작업 노드가 있습니다.](./creating-workflow-tasks/images/01.png)

태스크 노드는 워크플로 정의에서 가장 복잡한 부분인 경우가 많습니다. 사용자 또는 자원 작업에 작업을 할당할 수 있는 할당이 있을 수 있습니다( [작업 노드 할당](./assigning-task-nodes.md)참조).

작업 노드에는 알림 및 작업도 포함되어 있으며 둘 다 [워크플로 스크립트](../../developer-guide/using-the-script-engine-in-workflow.md)를 지원합니다. [워크플로 작업 및 알림 구성](./configuring-workflow-actions-and-notifications.md)을 참조하십시오.

검토가 완료되고 승인된 전환이 트리거되면 워크플로가 다음 노드로 진행됩니다. Single Approver 프로세스에서는 Approved nd 노드로 이동합니다.

## 단일 승인자 워크플로 만들기

다음 4단계로 워크플로를 만듭니다.

* 워크플로를 만들고 이름을 지정합니다.
* 검토 노드 만들기
* 업데이트 노드 생성
* 끝 노드 구성

### 워크플로 만들기

1. 전역 메뉴 &rarr; 애플리케이션 &rarr; 프로세스 빌더로 이동합니다.
1. **워크플로** 탭을 클릭합니다.
1. **추가**(![Add icon](../../../../images/icon-add.png))을 클릭합니다.
1. 워크플로에 My Single Approver와 같이 설명이 포함된 이름을 지정합니다.

### 검토 노드 생성

1. 워크플로 디자이너 캔버스에서 시작 노드와 끝 노드를 연결하는 전환이 있는 경우 삭제합니다. 마우스로 선택하고 키보드에서 Delete 키를 누릅니다.
1. 작업 노드를 캔버스로 끌어다 놓습니다.
1. 노드가 선택되지 않았는지 확인한 다음 포인터를 시작 노드의 가장자리로 이동하여 시작 노드를 작업 노드에 연결합니다. 커서 모양이 바뀌면 시작 노드에서 작업 노드로 전환을 클릭하여 끌 수 있습니다.
1. 전환을 선택하고 이름을 **검토** 로 바꿉니다.
1. 속성 업데이트를 시작하려면 작업 노드를 클릭합니다.
1. 노드에 이름을 지정하십시오: **Review** .
1. 알림 추가:

    * **이름** : 검토 알림
    * **템플릿 언어** : Freemarker
    * **템플릿** : 다음 Freemarker 알림 입력: `${userName} 은 워크플로우에서 검토를 위해 ${entryType} 를 보냈습니다.`
    * **알림 유형** : 다중 선택 필드에서 **이메일** 과 **사용자 알림** 를 선택합니다.
    * **실행 유형** : 지정 시
    * **수신자 유형** : 업무 담당자

    ![자산을 검토할 준비가 되었다는 이메일 및 사용자 알림을 보내도록 작업 노드의 알림 설정을 구성합니다.](./creating-workflow-tasks/images/02.png)

1. 다른 알림 추가:

   * **이름:** 리뷰 완료 알림
   * **템플릿 언어:** Freemarker
   * **템플릿:** 이 Freemarker 알림 입력: `귀하의 제출물이 검토되었습니다<#if taskComments?has_content> 그리고 검토자는 다음을 적용했습니다 ${taskComments}</#if>.`
   * **알림 유형:** 이메일
   * **실행 유형: 종료 시**
   * **수신자 유형:** 자산 생성자

1. 알림을 완료하면 뒤로 화살표(![Back](../../../../images/icon-angle-left.png)) 또는 **저장**(이전 버전의 워크플로 디자이너를 사용하는 경우)를 클릭합니다.
1. **과제** 을 추가합니다. 검토 작업을 역할, 역할 유형, 특정 사용자 또는 자원 작업에 할당할 수 있습니다. 이 예에서는 리뷰 작업을 역할 유형에 할당합니다. 다음 역할을 선택하고 새 역할을 추가해야 할 때마다 **새 섹션** 을 클릭합니다.

   * 자산 라이브러리 역할 유형:
      * 자산 라이브러리 관리자
      * 자산 라이브러리 콘텐츠 검토자
      * 자산 라이브러리 소유자
   * 조직 역할 유형:
      * 조직 관리자
      * 조직 콘텐츠 검토자
      * 조직 소유자
   * 일반 역할 유형:
      * 관리자
      * 포털 콘텐츠 검토자
   * 사이트 역할 유형
      * 사이트 관리자
      * 사이트 콘텐츠 검토자
      * 사이트 주인

   자동 생성을 선택하면 워크플로가 저장될 때 현재 존재하지 않는 역할이 자동으로 생성됩니다. 역할 및 권한에 대한 자세한 내용은 [역할 및 권한 이해](../../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) 및 [역할에 사용자 지정](../../../../users-and-permissions/roles-and-permissions/assigning-users-to-roles.md)을 참조하십시오.

   ![자산을 검토할 준비가 되었다는 이메일 및 사용자 알림을 보내도록 태스크 노드의 알림 설정을 구성합니다.](./creating-workflow-tasks/images/03.png)

1. End 노드를 클릭하고 이름을 **Approved** 로 바꿉니다.

1. 검토 노드를 승인된 끝 노드에 연결합니다. 커넥터 이름을 **승인** 로 지정합니다.

이제 이 작업 노드가 구성되었습니다. 특정 역할에 할당된 사용자에게 제출물을 검토할 준비가 되었다는 알림을 보냅니다.

다른 사용자 또는 역할 유형 대신 리소스 작업에 작업 노드를 할당할 수도 있습니다. 자세한 내용은 [작업 노드 할당](./assigning-task-nodes.md)을 참조하십시오.

### 업데이트 노드 생성

1. 다른 작업 노드를 캔버스로 끌어다 놓습니다.
1. 선택된 노드가 없는지 확인한 다음 포인터를 시작 노드의 가장자리로 이동하여 검토 노드를 새 작업 노드에 연결합니다. 커서 모양이 바뀌면 검토 노드에서 커넥터를 클릭하여 새 작업 노드로 끌 수 있습니다.
1. 커넥터를 선택하고 이름을 **reject** 로 바꿉니다.
1. 속성 업데이트를 시작하려면 작업 노드를 클릭합니다.
1. 노드에 이름을 지정하십시오: **Update** .
1. 이제 **Notification** 을 추가하십시오.

   * **이름:** 작성자 수정 알림
   * **템플릿 언어:** Freemarker
   * **템플릿:** 이 Freemarker 알림 입력: `제출이 ${userName}에 의해 거부되었습니다. 수정하여 다시 제출하십시오.`
   * **알림 유형:** 다중 선택 필드에서 **이메일** 및 **사용자 알림** 를 선택합니다.
   * **실행 유형:** 지정 시
   * **수신자 유형:** 작업 담당자

1. 알림이 완료되면 뒤로 화살표(![Back](../../../../images/icon-angle-left.png)) 또는 **저장**(이전 버전의 워크플로 디자이너를 사용하는 경우)를 클릭합니다.
1. **할당** 을 클릭합니다. **Asset Creator** 을 선택합니다.
1. 할당이 완료되면 뒤로 화살표(![Back](../../../../images/icon-angle-left.png)) 또는 **저장**(이전 버전의 워크플로 디자이너를 사용하는 경우)를 클릭합니다.
1. 이제 **작업** 을 추가합니다.

   * **이름:** 거부
   * **템플릿(그루비):**
     ```groovy
      import com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil;
      import com.liferay.portal.kernel.workflow.WorkflowConstants;

      WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.getLabelStatus("denied"), workflowContext);
      WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.getLabelStatus("pending"), workflowContext);
     ```
   * 나머지 기본값은 그대로 둡니다(예: Execution type **On Entry**).

1. 작업을 마치면 뒤로 화살표(![Back](../../../../images/icon-angle-left.png)) 또는 **저장**(이전 버전의 워크플로 디자이너를 사용하는 경우)를 클릭합니다.
1. 팔레트에서 아무것도 선택되지 않았는지 확인하십시오. 마우스 포인터를 **업데이트** 노드의 가장자리로 이동합니다. **업데이트** 노드에서 **검토** 노드로 커넥터를 다시 끕니다.
1. 새 커넥터의 이름을 **resubmit** 로 지정하십시오.
1. 워크플로 정의를 저장합니다.

![워크플로우가 구체화되고 있습니다. 남은 것은 끝 노드를 연결하는 것입니다.](./creating-workflow-tasks/images/04.png)

1. **게시** 버튼을 클릭하여 워크플로를 게시합니다.

이제 워크플로 생성 과정을 살펴보고 워크플로 디자이너를 사용하는 방법을 배웠으므로 워크플로 프로세스를 다음 단계로 끌어올릴 수 있는 노드 유형을 추가하는 방법을 살펴보십시오. 예를 들어 [포크 및 조인](./using-forks-and-joins.md) 또는 [조건](./using-condition-nodes.md).

## 추가 정보

* [워크플로 활성화](../../using-workflows/activating-workflow.md)
* [워크플로우 노드](./workflow-nodes.md)
* [워크플로 작업 및 알림 구성](./configuring-workflow-actions-and-notifications.md)
* [작업 노드 사용](./assigning-task-nodes.md)
