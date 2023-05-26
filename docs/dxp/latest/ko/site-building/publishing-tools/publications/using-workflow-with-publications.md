# 발행물에 워크플로 사용

{bdg-secondary}`7.4 U44+/GA44+`

간행물은 Liferay의 [Workflow](../../../process-automation/workflow/introduction-to-workflow.md) 프레임워크와 통합되어 있으므로 간행물이 활성화되어 있는 동안 콘텐츠 및 페이지를 검토하기 위해 사용자 지정 워크플로를 계속 사용할 수 있습니다. 이렇게 하면 추적된 모든 변경 사항이 프로덕션에 게시되기 전에 원하는 승인 프로세스를 거치게 됩니다.

![간행물은 Liferay의 워크플로 프레임워크와 완전히 통합됩니다.](./using-workflow-with-publications/images/01.png)

게시를 사용하면 변경이 이루어진 환경(즉, 프로덕션 또는 게시)으로 변경 범위가 지정됩니다. 콘텐츠 검토자는 변경 사항을 검토하고 승인하기 위해 적절한 환경에 액세스할 수 있어야 합니다. 예를 들어 사이트 기여자가 게시를 변경하는 경우 워크플로 검토자도 해당 게시에 액세스할 수 있어야 합니다. 사용자를 출판물에 초대하고 권한을 할당하는 방법에 대한 자세한 내용은 [출판물의 공동 작업](./collaborating-on-publications.md) 을 참조하십시오.

기여자가 승인을 위해 변경 사항을 제출하면 워크플로 알림에 변경 사항이 적용된 환경이 포함됩니다. 그런 다음 검토자는 변경 사항을 보고 승인하기 전에 적절한 환경으로 전환해야 합니다.

![워크플로 알림은 변경된 환경을 나타냅니다.](./using-workflow-with-publications/images/02.png)

검토자는 프로덕션에 게시하기 전에 모든 변경 사항을 승인해야 합니다. 승인되지 않은 변경 사항을 게시하려고 하면 오류 메시지가 표시됩니다.

![승인되지 않은 변경 사항을 게시하려고 하면 오류 메시지가 표시됩니다.](./using-workflow-with-publications/images/03.png)

변경 사항이 승인되면 동일한 엔터티에 대한 추가 편집 사항은 각각 고유한 워크플로 상태가 있는 게시의 개별 변경 사항으로 추적됩니다.

![동일한 엔터티에 대한 추가 편집은 게시에서 별도의 변경으로 추적됩니다.](./using-workflow-with-publications/images/04.png)

## 관련 주제

* [워크플로 소개](../../../process-automation/workflow/introduction-to-workflow.md)
* [출판물 생성 및 관리](./creating-and-managing-publications.md)
* [간행물 공동 작업](./collaborating-on-publications.md)
