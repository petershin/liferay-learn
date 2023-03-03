# 주문 워크플로 활성화 또는 비활성화

[주문 워크플로](./introduction-to-order-workflows.md) 는 활성화된 경우 구매자나 판매자가 주문을 처리하기 전에 [내부적으로 사전 [승인](./approving-or-rejecting-orders-in-order-workflows.md)](../orders/processing-an-order.md)하도록 요구하는 채널별 설정입니다. 워크플로 활성화 방법을 알아보려면 [워크플로 활성화](https://learn.liferay.com/dxp/latest/ko/process-automation/workflow/using-workflows/activating-workflow.html) 을 참조하십시오.

이 문서에서는 주문 워크플로를 활성화 및 비활성화하는 방법을 설명합니다.

## 워크플로우 활성화

승인 워크플로우를 활성화하려면 다음을 수행하십시오.

1. _글로벌 애플리케이션_ 메뉴 &rarr; _커머스_ &rarr; _채널_로 이동합니다.
1. 원하는 채널을 선택합니다(예: _Sahara.com_). (액셀러레이터를 사용하여 사이트를 만든 경우 기본적으로 연결된 채널이 생성됩니다.)
1. _일반_ 탭을 클릭합니다.
1. 구매자 주문 승인 워크플로 드롭다운 메뉴에서 _단일 승인자(버전 1)_ 을 선택합니다.

    ![채널 메뉴에서 구매자 주문 승인 워크플로를 활성화합니다.](./enabling-or-disabling-order-workflows/images/06.png)

1. 판매자 주문 수락 워크플로를 활성화하려면 드롭다운 메뉴에서  _단일 승인자(버전 1)_ 을 선택합니다.
1. _저장_을 클릭합니다.

이 채널에 대해 워크플로우 프로세스가 활성화되었습니다. 두 워크플로는 동시에 작동할 수 있습니다.

### 상거래 2.1 이하

1. _제어판_ &rarr; _상거래_ &rarr; _채널_로 이동합니다.

    ![상거래 메뉴는 제어판에 있습니다.](./enabling-or-disabling-order-workflows/images/04.png)

1. 원하는 채널을 클릭합니다(예: _Sahara.com_). (액셀러레이터를 사용하여 사이트를 만든 경우 기본적으로 연결된 채널이 생성됩니다.)
1. _일반_ 탭을 클릭합니다.
1. 구매자 주문 승인 워크플로 드롭다운 메뉴에서 _단일 승인자(버전 1)_ 을 선택합니다.

    ![각 채널에 대해 승인 워크플로를 활성화할 수 있습니다.](./enabling-or-disabling-order-workflows/images/03.png)

1. 판매자 주문 수락 워크플로를 활성화하려면 드롭다운 메뉴에서  _단일 승인자(버전 1)_ 을 선택합니다.
1. _저장_을 클릭합니다.

이 채널에 대해 워크플로우 프로세스가 활성화되었습니다. 두 워크플로우는 동시에 작동할 수 있습니다.

### 상거래 2.0 이하

승인 워크플로우를 활성화하려면:

1. 매장이 있는 사이트로 이동합니다(예: _Sahara.com_).
1. _사이트 관리_ 메뉴를 확장한 다음 _상거래_ → _설정_를 클릭합니다.

    ![Commerce 2.0용 워크플로는 사이트 설정에서 찾을 수 있습니다.](./enabling-or-disabling-order-workflows/images/05.png)

1. _주문 워크플로_ 탭을 클릭합니다.
1. _Approval Workflow_ 필드를 클릭하고 드롭다운에서 사용 가능한 옵션 중에서 선택합니다.

   ![주문 워크플로 탭에서 구매자 승인 워크플로를 활성화합니다.](./enabling-or-disabling-order-workflows/images/01.png)

1. _Transmission Workflow_을 활성화하려면 _Transmission Workflow_ 필드를 클릭하고 드롭다운에서 사용 가능한 옵션 중에서 선택합니다.

   ![판매자 전송 워크플로를 활성화합니다.](./enabling-or-disabling-order-workflows/images/02.png)

1. _저장_을 클릭합니다.

## 주문 워크플로우 비활성화

주문 작업 흐름을 비활성화하려면 _작업 흐름 없음_ 옵션을 선택하고 _저장_을 클릭합니다.

## 추가 정보

즉시 사용 가능한 _단일 승인자(버전 1)_ 은 사용 가능한 주문 워크플로우입니다. [워크플로 소개](https://learn.liferay.com/dxp/latest/ko/process-automation/workflow/introduction-to-workflow.html) 을 생성한 다음 _주문 워크플로_ 탭에서 선택할 수 있습니다.

* [주문 워크플로 소개](./introduction-to-order-workflows.md)
* [주문 워크플로우에서 주문 승인 또는 거부](approving-or-rejecting-orders-in-order-workflows.md)
* [주문 처리](../orders/processing-an-order.md)
* [주문 수명 주기](../orders/order-life-cycle.md)
* [주문 관리 상태 참조 가이드](../orders/order-management-statuses-reference-guide.md)
