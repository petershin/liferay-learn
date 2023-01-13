# 워크플로우 노드

{bdg-primary}`구독`

워크플로 노드는 검토 프로세스 시작, 자산 승인 또는 거부, 작업 재할당 등 승인 프로세스의 특정 지점을 나타냅니다.

다음은 다양한 유형의 노드와 각 노드와 관련된 가능한 작업입니다.

## 노드 유형

| 마디       | 묘사                                                                         |
|:-------- |:-------------------------------------------------------------------------- |
| 업무       | _작업_ 노드는 워크플로 작업과 담당자를 나타냅니다.                                              |
| 포크 및 조인  | _Fork_ 및 _Join_ 은 여러 검토자의 검토 프로세스를 병렬로 분할한 다음 검토가 완료되면 다시 참여하기 위한 쌍 노드입니다. |
| Join XOR | _Join XOR_ 노드를 사용하면 병렬 검토자 중 하나에서 전환이 호출되는 한 워크플로를 계속 진행할 수 있습니다.          |
| 조건       | _조건_ 노드는 검토 프로세스를 진행하기 전에 조건을 설정합니다.                                       |
| 시작       | _시작_ 노드는 워크플로를 시작합니다.                                                      |
| 끝        | 기본 _종료_ 노드는 기본적으로 워크플로우 상태를 _승인됨_으로 설정합니다.                                 |
| 국가       | _상태_ 노드는 검토 프로세스를 특정 모드 또는 상태에 배치합니다. 시작 및 종료 노드는 특별한 유형의 상태 노드입니다.        |

### 시작 및 종료 노드

시작 및 종료 노드는 워크플로 처리를 시작하고 자산을 최종 승인 상태로 가져옵니다. 종종 수정하지 않고 기본 시작 및 끝 노드를 사용할 수 있습니다.

끝 노드에는 Groovy 스크립팅 언어를 사용하여 워크플로 상태를 승인됨으로 설정하는 기본 작업이 있습니다.

```java
import com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil;
import com.liferay.portal.kernel.workflow.WorkflowConstants;

WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.getLabelStatus("approved"), workflowContext);
```

### 상태 노드

상태 노드는 [개 작업 및 알림](./configuring-workflow-actions-and-notifications.md)를 가질 수 있습니다. 예를 들어 다음 Groovy 스크립트를 사용하여 상태를 _Expired_로 설정하는 노드를 생성할 수 있습니다.

```java
import com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil;
import com.liferay.portal.kernel.workflow.WorkflowConstants;

WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.getLabelStatus("expired"), workflowContext);
```

### 조건 노드

_조건_ 노드는 자산 또는 해당 실행 컨텍스트를 확인하고 결과에 따라 적절한 전환으로 보냅니다. 이 노드에는 전환 중 하나로 값을 설정하는 스크립트가 필요합니다.

[카테고리 특정 정의에서](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-runtime-impl/src/main/resources/META-INF/definitions/category-specific-workflow-definition.xml) 은 해당 자산을 조회하고 [자산 카테고리](../../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md)을 검색하고 초기 `returnValue`를 설정하는 스크립트입니다. 그런 다음 자산이 *법적* 범주로 표시되었는지 확인합니다. 그렇지 않은 경우 *콘텐츠 검토* (워크플로의 콘텐츠 검토 작업)을 거치고, 포함된 경우 *법적 검토* (워크플로의 법적 검토 작업)을 거칩니다.

### 태스크 노드

_태스크_ 노드는 모든 작업이 수행되는 위치를 나타냅니다. [작업 노드를 사용하여 워크플로 작업 만들기](./creating-workflow-tasks.md) 및 [](./assigning-task-nodes.md)을 참조하십시오.

## 추가 정보

* [워크플로 작업 만들기](./creating-workflow-tasks.md)
* [작업 노드 사용](./assigning-task-nodes.md)
* [Kaleo 양식](../../../forms/kaleo-forms.md)
* [워크플로 프레임워크 소개](https://help.liferay.com/hc/en-us/articles/360028727112-Introduction-to-The-Workflow-Framework)
* [동적 데이터 목록](../../../forms/dynamic-data-lists/getting-started-with-dynamic-data-lists.md)
