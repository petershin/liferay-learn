# 채널 참조 가이드

> 커머스 2.1+

이 문서에서는 채널 관리 인터페이스에 대한 개요를 제공합니다. 채널을 만들려면 [채널 관리](./managing-channels.md)참조하십시오.

## 일반적인

**일반** 탭은 통화, 주문 워크플로, 결제, 배송 및 세금과 같은 많은 중요한 채널 설정이 있는 곳입니다.

### 세부

**상세** 섹션은 채널의 이름, 통화, [Commerce Site Type](../../starting-a-store/sites-and-site-types.md) 이 설정되는 곳입니다.

![세부 정보 탭은 이름, 통화 및 사이트 유형이 설정되는 곳입니다.](./channels-reference-guide/images/01.png)

### 명령

사용자는 [구매자 및 판매자](../../order-management/order-workflows/introduction-to-order-workflows.md)에 대한 워크플로우를 활성화할 수 있습니다. 또한 사용자는 게스트 체크아웃을 활성화 또는 비활성화하고 구매 주문 번호 표시 여부(해당되는 경우)를 지정할 수 있습니다.

![주문 탭은 워크플로가 활성화된 곳입니다.](./channels-reference-guide/images/02.png)

### 물가

사용자는 [배송세 카테고리](../../pricing/configuring-taxes/creating-tax-categories.md), 가격 유형 및 할인 대상 가격 유형을 설정할 수 있습니다.

**가격 유형** 의 경우 사용자는 제품 가격을 세금 포함(총 가격) 또는 세금 제외(순 가격)로 표시할지 여부를 결정할 수 있습니다.

**할인 대상** 의 경우 사용자는 적용 가능한 할인이 제품의 총 가격 또는 순 가격을 기준으로 계산되는지 여부를 결정할 수 있습니다.

![가격 탭은 세금 범주 및 가격이 설정되는 곳입니다.](./channels-reference-guide/images/03.png)

### 상태 확인

상태 확인을 통해 사용자는 상점이 작동하는 데 필요한 누락된 위젯과 같은 상점 사이트의 일반적인 설정 문제를 신속하게 수정할 수 있습니다.

![상태 확인을 통해 상거래 포틀릿을 빠르게 추가하거나 사이트를 수동으로 구축한 경우 문제를 수정할 수 있습니다.](./channels-reference-guide/images/04.png)

### 지불 방법

사용자는 채널에 사용할 [지불 방법](../../store-management/configuring-payment-methods/managing-payment-methods.md) 구성할 수 있습니다. 또한 사용자는 [맞춤형 결제 엔진](../../developer-guide/sales/implementing-a-new-payment-method.md)사용할 수 있습니다.

![지불 방법 섹션에서는 사용할 지불 방법을 선택할 수 있습니다.](./channels-reference-guide/images/05.png)

### 배송 방법

사용자는 채널의 배송 방법을 구성할 수 있습니다. 기본적으로 [고정 요금](../../store-management/configuring-shipping-methods/using-the-flat-rate-shipping-method.md) 활성화되어 있습니다. 사용자는 [변동 요금](../../store-management/configuring-shipping-methods/using-the-variable-rate-shipping-method.md) 배송 방법을 활성화할 수도 있습니다. 가입자는 [FedEx](../../store-management/configuring-shipping-methods/using-the-fedex-shipping-method.md)활성화할 수도 있습니다.

<!-- Commenting until developer guide is added back
Lastly, users can use a [custom shipping engine](../../developer-guide/sales/implementing-a-new-shipping-engine.md). 
-->

![배송 방법 섹션에서는 사용할 배송 방법을 선택할 수 있습니다.](./channels-reference-guide/images/06.png)

### 세금 계산

사용자는 채널의 세금 계산을 구성할 수 있습니다. 세율 설정에 대한 자세한 내용은 [세금 계산을 위한 세율 설정](../../pricing/configuring-taxes/setting-rates-for-tax-calculations.md)참조하십시오.

![사용자는 채널의 세금 계산을 구성할 수 있습니다.](./channels-reference-guide/images/07.png)

## 유형

채널은 DXP 사이트에 연결할 수 있습니다. 또는 Amazon Marketplace와 같은 DXP가 아닌 사이트에 채널을 연결할 수 있습니다. 여기에서 사용자는 채널을 연결할 DXP 사이트를 선택할 수 있습니다.

![채널과 연결된 사이트를 선택합니다.](./channels-reference-guide/images/10.png)

## 알림 대기열

Liferay Commerce는 다양한 이벤트에 의해 트리거되는 이메일 알림을 보내도록 구성할 수 있습니다. 이벤트가 알림을 트리거하면(예: 주문이 접수됨) 알림이 채널의 **알림 대기열** 탭에 기록됩니다. 기본적으로 Liferay Commerce 인스턴스는 15분마다 알림이 전송되었는지 확인하고 43200분(30일) 후에 전송되지 않은 알림을 삭제합니다.

자세한 내용은 [상거래 알림 대기열 구성](../../store-management/sending-emails/configuring-the-commerce-notification-queue.md) 기사를 참조하십시오.

## 알림 템플릿

알림 템플릿을 사용하면 사용자가 이메일 알림을 사용자 지정하고 트리거 이벤트를 정의할 수 있습니다.

이메일 알림 보내기에 대한 자세한 내용은 [이메일 보내기](../sending-emails.md)참조하세요.

알림 템플릿 생성 및 사용에 대한 자세한 내용은 [알림 템플릿 사용](../../store-management/sending-emails/using-notification-templates.md)참조하십시오.

![알림 템플릿을 만듭니다.](./channels-reference-guide/images/11.png)

## 카테고리 표시 페이지

카테고리 표시 페이지 탭에는 상점 사이트에서 작성된 모든 카테고리 표시 페이지 목록이 표시됩니다. **카테고리 디스플레이 페이지** 은 사용자가 지정된 카테고리에 태그가 지정된 모든 제품을 표시하는 특정 DXP 사이트 페이지를 대체할 수 있도록 합니다. 사용자는 먼저 [제품 범주](../../product-management/creating-and-managing-products/products/organizing-your-catalog-with-product-categories.md)를 생성하고 원하는 제품과 연결한 다음 페이지를 생성해야 합니다.

DXP 사이트 페이지 생성에 대한 자세한 내용은 [페이지 만들기](https://learn.liferay.com/w/dxp/site-building/creating-pages) 을 참조하십시오. 일반적으로 태그 및 범주 생성에 대해 자세히 알아보려면 [태그 및 카테고리](https://learn.liferay.com/w/dxp/content-authoring-and-management/tags-and-categories) 을 참조하십시오.

## 제품 디스플레이 페이지

제품 표시 페이지는 카테고리 표시 페이지와 유사한 전제에서 작동합니다. 사용자는 기본 카탈로그 페이지 대신 특정 제품을 강조 표시하는 특정 사이트 페이지를 만들 수 있습니다. **제품 디스플레이 페이지** 탭에서 사용자는 사이트에서 생성된 모든 제품 디스플레이 페이지 목록을 볼 수 있습니다. 자세한 내용은 [제품 디스플레이 페이지 만들기](../../creating-store-content/creating-product-display-pages.md) 참조하십시오.

## 결제 제한

사용자는 구매자의 국가에 대해 어떤 지불 방법이 **제한** 인지 구성할 수 있습니다. (청구지 주소가 기재되지 않은 경우 채널에서 배송지 확인합니다.) 이렇게 하려면 최소 하나의 [결제 수단](../../store-management/configuring-payment-methods/managing-payment-methods.md) 활성화되어야 합니다. 해당 국가의 계정에서 해당 결제 수단을 사용할 수 없도록 각 국가의 체크박스를 선택하세요.

![결제 제한](./channels-reference-guide/images/08.png)

## 배송 제한

사용자는 구매자의 국가에 대해 어떤 배송 방법이 **제한** 인지 구성할 수 있습니다.

![선적 제한](./channels-reference-guide/images/09.png)


<!--
## Punch Out

Users can manage their Punch Out procurement systems from here. Purchasing the additional Liferay Commerce Connector to PunchOut2Go ("PunchOut2Go Connector") is required. See [Liferay Commerce Connector to PunchOut2Go]() for more information.

-->

## 관련 주제

* [채널을 사용하여 제품 가시성 구성](./configuring-product-visibility-using-channels.md)
* [주문 워크플로 활성화 또는 비활성화](../../order-management/order-workflows/enabling-or-disabling-order-workflows.md)
