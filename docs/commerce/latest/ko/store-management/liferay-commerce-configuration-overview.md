<<<<<<< HEAD

=======
>>>>>>> LRDOCS-11761 Fix ac and commerce ko translations' formats
# Liferay Commerce 구성 개요

전역 메뉴에서 상거래를 구성하는 옵션을 찾을 수 있습니다.

![글로벌 애플리케이션 메뉴를 통해 상거래에 액세스합니다.](./liferay-commerce-configuration-overview/images/01.png)

**글로벌 메뉴**(![Global Menu](../images/icon-applications-menu.png))을 열고 **커머스** 탭으로 이동합니다. 이 탭에는 다음 응용 프로그램이 포함되어 있습니다.

## 주문 관리

* [명령](../order-management/orders/orders-menu-reference-guide.md)
* [주문 유형](../order-management/order-types.md)
* [선적](../order-management/shipments/introduction-to-shipments.md)
* [구독](../order-management/subscriptions/managing-subscriptions.md)
* [이용약관](../order-management/terms-and-conditions.md)

## 재고 관리

* [목록](../inventory-management.md)
* [창고](../inventory-management/warehouse-reference-guide.md)

## 가격

* [가격표](../pricing/creating-a-price-list.md)
* [프로모션](../pricing/promoting-products/introduction-to-promotions.md)
* [할인](../pricing/promoting-products/introduction-to-discounts.md)
* [제품 그룹](../pricing/promoting-products/introduction-to-product-groups.md)
* [세금 범주](../pricing/configuring-taxes.md)

## 제품 관리

* [카탈로그](../product-management/catalogs/creating-a-new-catalog.md)
* [제품](../product-management/creating-and-managing-products/products/products-overview.md)
* [옵션](../product-management/creating-and-managing-products/products/using-product-options.md)
* [명세서](../product-management/creating-and-managing-products/products/specifications.md)

## 매장 관리

* [채널](./channels/managing-channels.md)
* [통화](./currencies/adding-a-new-currency.md)

## 설정

* [가용성 추정](../inventory-management/availability-estimates.md)
* [국가](./configuring-countries-and-regions.md)
* [측정 단위](./configuring-shipping-methods/measurement-units.md)

## Liferay Commerce 2.1 이하

Liferay Commerce 2.1 구성은 Liferay **제품 메뉴** 의 여러 사이트로 나뉩니다. 상거래 **제어판** 드롭다운에는 Liferay Commerce 설치에 전역 ** 적용하는 구성 및 설정이 포함되어 있습니다. 상거래 *사이트 메뉴* 드롭다운에는 특정 상점 사이트로 범위가 지정된 구성 및 설정이 포함되어 있습니다.

### 상거래 제어판

**제어판** &rarr; **상거래** 로 이동합니다. 다음 구성을 변경하면 모든 사이트에 적용됩니다.

![상거래 전역 메뉴에는 모든 구성 옵션이 포함되어 있습니다.](./liferay-commerce-configuration-overview/images/02.png)

* [채널](./channels/managing-channels.md)
* [가격표](../pricing/creating-a-price-list.md)
* [명령](../order-management/orders/orders-menu-reference-guide.md)

상거래 전역 설정 메뉴에는 다음 탭이 포함되어 있습니다.

![상거래 글로벌 메뉴에서 설정을 찾을 수 있습니다.](./liferay-commerce-configuration-overview/images/03.png)

* [가용성 추정](../inventory-management/availability-estimates.md)
* [국가](./configuring-countries-and-regions.md)
* [통화](./currencies/adding-a-new-currency.md)
* 기본 이미지
* [측정 단위](./configuring-shipping-methods/measurement-units.md)
* 건강 체크
* [창고](../inventory-management/warehouse-reference-guide.md)

### 상거래 사이트 설정

{bdg-secondary}`커머스 2.0 이하`

다음 구성은 선택한 매장 사이트로 범위가 지정됩니다. 여기에서 변경한 사항은 동일한 Liferay Commerce 인스턴스에서 호스팅되는 다른 상점에 적용되지 않습니다.

**제어판** &rarr; **스토어 사이트** &rarr; **상거래** 로 이동합니다.

![Minium 사이트에 대한 설정은 왼쪽 메뉴에서 사용할 수 있습니다.](./liferay-commerce-configuration-overview/images/04.png)

다음 사이트 설정은 여기에서 찾을 수 있습니다.

* [알림](./sending-emails/using-notification-templates.md)
* [주문 워크플로 소개](../order-management/order-workflows/introduction-to-order-workflows.md)
* [지불 방법](./configuring-payment-methods.md)
* [제품 디스플레이 페이지](../creating-store-content/creating-product-display-pages.md)
* [배송 방법](./configuring-shipping-methods/shipping-method-reference.md)
* [사이트 유형](../starting-a-store/sites-and-site-types.md)
