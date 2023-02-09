# 워크플로 디자이너 개요

{bdg-primary}`구독`

Process Builder의 워크플로 디자이너는 워크플로 프로세스 정의를 만들기 위한 그래픽 인터페이스입니다. 편리한 끌어서 놓기 인터페이스를 사용하면 [XML 정의를 직접 작성](../../developer-guide/crafting-xml-workflow-definitions)하는 것보다 작업 흐름 설계가 더 쉬워집니다. 제어판에서 액세스할 수 있습니다 &rarr; 작업 흐름 &rarr; 프로세스 빌더.

![노드를 디자이너 캔버스로 끌어다 놓습니다.](./workflow-designer-overview/images/01.png)


```{tip}
또는 Process Builder의 소스 보기에서 XML 정의를 작성하거나 업로드할 수 있습니다. [워크플로우 관리](../managing-workflows.md#uploading-a-new-workflow-definition)를 참조하십시오.
```

워크플로 디자이너는 [개 워크플로 노드](./workflow-nodes.md) 유형을 모두 지원합니다.

* [시작 및 종료 노드](./workflow-nodes.md#start-and-end-nodes)
* [포크 및 조인 노드](./using-forks-and-joins.md)
* [조건 노드](./using-condition-nodes.md)
* [상태 노드](./workflow-nodes.md#state-nodes)
* [작업 노드](./creating-workflow-tasks.md)

끌어서 놓기 인터페이스에서 제공하는 기능 외에도 Groovy(Java 기반 스크립팅 언어)의 모든 기능을 사용하여 워크플로를 통해 이동 중인 자산에 대해 [프로그래밍 작업](./../../developer-guide/using-the-script-engine-in-workflow.md) 을 수행할 수 있습니다.

기본적으로 하나의 워크플로우 정의(단일 승인자 워크플로우 정의)만 설치됩니다. Liferay 소스 코드에서 추가 예제를 볼 수 있습니다.

* [범주별 정의](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-runtime-impl/src/main/resources/META-INF/definitions/category-specific-workflow-definition.xml)
* [법적 마케팅 정의](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-runtime-impl/src/main/resources/META-INF/definitions/legal-marketing-workflow-definition.xml)
* [스크립팅된 할당이 있는 단일 승인자 정의](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-runtime-impl/src/main/resources/META-INF/definitions/single-approver-scripted-assignment-workflow-definition.xml)
* [단일 승인자 정의](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-runtime-impl/src/main/resources/META-INF/definitions/single-approver-workflow-definition.xml)


## 워크플로우 구축

워크플로를 구축하려면 전역 메뉴(![Global Menu](../../../../images/icon-applications-menu.png)) &rarr; 제어판 &rarr; 프로세스 빌더로 이동합니다.

시작하려면 (![Add icon](../../../../images/icon-add.png))을 클릭하십시오.

각 워크플로 노드는 검토 프로세스 시작, 자산 승인 또는 거부, 작업 재할당 등 승인 프로세스의 특정 지점을 나타냅니다.

[워크플로 전환](./workflow-transitions.md) 각 노드를 연결하여 검토 프로세스에서 원하는 흐름을 생성합니다. 첫 번째 노드를 종료하면 전환으로 표시된 다음 노드로 처리가 계속됩니다.

워크플로우에서 작업할 준비가 되셨습니까? 다음 단계는 [워크플로 작업 만들기](./creating-workflow-tasks.md)입니다.

## 워크플로 현지화

사용자는 워크플로 프로세스의 텍스트를 다음과 같은 방식으로 경험합니다.

- 관리자 및 워크플로 참가자(예: 워크플로 작업 할당자)는 워크플로 목록에서 워크플로 정의의 제목을 봅니다.
- 워크플로 참가자(예: 워크플로 작업 할당자)는 워크플로 콘텐츠를 관리하는 동안(예: 내 워크플로 작업에서) 노드 및 전환 레이블을 봅니다.

<!-- TODO: adjust this update number as needed -->
Liferay 7.4 U20부터 UI에 나타나는 워크플로 텍스트는 번역 가능합니다.

워크플로를 번역하려면

1. 워크플로를 열거나 글로벌 메뉴 &rarr; 애플리케이션 &rarr; 프로세스 빌더에서 새 워크플로를 추가합니다. 
1. 새 워크플로인 경우 [전환](./workflow-transitions.md)을 사용하여 시작 노드를 끝 노드에 연결합니다.
1. 현지화 가능한 모든 필드는 인스턴스의 기본 언어로 생성되었습니다. 번역을 시작하려면 워크플로의 제목 필드 근처에 있는 언어 선택기를 클릭합니다.
   
   ![언어 선택기를 사용하여 번역 언어를 선택하십시오.](./workflow-designer-overview/images/02.png)

1. 번역을 시작할 언어를 선택하세요.

1. 워크플로를 진행하고 노드 레이블, 전환 레이블 및 워크플로 제목을 번역합니다.
1. 워크플로를 저장합니다.

워크플로 정의가 게시되고 [자산](../../using-workflows/activating-workflow.md)에 연결되면 워크플로 작업 담당자와 같은 참가자가 자신의 언어로 워크플로와 상호 작용합니다.

## 추가 정보

* [워크플로 관리](../managing-workflows.md)
* [워크플로우 노드](./workflow-nodes.md)
* [분기 및 조인 사용](./using-forks-and-joins.md)
* [조건 노드 사용](./using-condition-nodes.md)
* [워크플로 작업 만들기](./creating-workflow-tasks.md)
* [워크플로 작업 및 알림 구성](./configuring-workflow-actions-and-notifications.md)
