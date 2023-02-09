# Liferay Commerce 구성 개요

Liferay Commerce 3.0의 구성은 _Global Applications_ 메뉴를 통해 도달합니다.

![Global Application 메뉴를 통해 Commerce 3.0에 액세스하십시오.](./liferay-commerce-configuration-overview/images/06.png)

_글로벌 애플리케이션_ 메뉴 &rarr; _상거래_로 이동합니다. 관리자는 다음을 구성할 수 있습니다.

* [채널](./channels/managing-channels.md)
* [가격 리스트](../pricing/creating-a-price-list.md)
* [할인](../pricing/promoting-products/introduction-to-discounts.md)
* 프로모션
* 상품 그룹
* [카탈로그](../product-management/catalogs/creating-a-new-catalog.md)
* [제품](../product-management/creating-and-managing-products/products/products-overview.md)
* [옵션](../product-management/creating-and-managing-products/products/using-product-options.md)
* [명령](../order-management/orders/orders-menu-reference-guide.md)
* [선적](../order-management/shipments/introduction-to-shipments.md)
* [BOM](../product-management/creating-and-managing-products/products/managing-boms.md)
* [구독](../order-management/subscriptions/managing-subscriptions.md)
* [환율](./currencies/adding-a-new-currency.md)
* [재고](../inventory-management/introduction-to-managing-inventory.md)
* [창고](../inventory-management/warehouse-reference-guide.md)
* [가용성 추정치](../inventory-management/availability-estimates.md)

## Liferay Commerce 2.1 이하

Liferay Commerce 2.1 구성은 Liferay _제품 메뉴_에서 여러 위치로 나뉩니다. Commerce _Control Panel_ 드롭다운에는 Liferay Commerce 설치에 _globally_를 적용하는 구성 및 설정이 포함되어 있습니다. Commerce_Site Menu_ 드롭다운에는 특정 상점 사이트로 범위가 지정된 구성 및 설정이 포함되어 있습니다.

### 상거래 제어판

_제어판_ → _상거래_ 으로 이동합니다. 다음 구성을 변경하면 상점 사이트 전체에 적용됩니다.

![글로벌 상거래 설정](./liferay-commerce-configuration-overview/images/01.png)

* [채널](./channels/managing-channels.md)
* [가격 리스트](../pricing/creating-a-price-list.md)
* [명령](../order-management/orders/orders-menu-reference-guide.md)

상거래 전역 설정 메뉴에는 다음 탭이 포함되어 있습니다.

![상거래 전역 설정 탭](./liferay-commerce-configuration-overview/images/02.png)

* [가용성 추정치](../inventory-management/availability-estimates.md)
* [새 통화 추가](./currencies/adding-a-new-currency.md)
* [측정 단위](./configuring-shipping-methods/measurement-units.md)
* [지역](./adding-regions.md)
* [창고](../inventory-management/warehouse-reference-guide.md)

### 상거래 사이트 설정

> 커머스 2.0 이하

다음 구성은 선택한 매장 사이트로 범위가 지정됩니다. 여기서의 변경 사항은 동일한 Liferay Commerce 인스턴스에서 호스팅되는 다른 상점에 적용되지 않습니다.

_제어판_ → _매장 사이트_ → _상거래_ 로 이동합니다.

![최소 전체 사이트 설정](./liferay-commerce-configuration-overview/images/03.png)

다음 사이트 설정은 여기에서 찾을 수 있습니다.

* [알림](./sending-emails/using-notification-templates.md)
* [주문 워크플로 소개](../order-management/order-workflows/introduction-to-order-workflows.md)
* [결제 방법](./configuring-payment-methods.md)
* [상품 디스플레이 페이지](../creating-store-content/creating-product-display-pages.md)
* [배송 방법](./configuring-shipping-methods/shipping-method-reference.md)
* [사이트 유형](../starting-a-store/sites-and-site-types.md)
