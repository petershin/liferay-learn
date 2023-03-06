---
uuid: 2c1c1fa2-205d-4867-a52e-23177c13da25
---

# 매장 설정 개요

## 소개

이 문서는 Liferay Commerce에서 상점을 처음 구축하는 사용자에게 안내를 제공하기 위한 것입니다. Liferay Commerce(및 Liferay DXP)가 적절하게 설치되고 구성되었다고 가정합니다. 설치에 대한 자세한 내용은 [설치 개요](../installation-and-upgrades/installation-overview.md)참조하십시오.

## 로드맵

* [스토어 설정](#store-setup)
* [상점 만들기](#creating-the-storefront)
* [고객 계정 관리](#managing-customer-accounts)
* [주문 및 배송 관리](#managing-orders-and-shipments)

## 스토어 설정

```{note}
[Accelerator](../starting-a-store/accelerators.md)을 사용하여 매장 사이트를 만들 수 있습니다. 액셀러레이터를 사용하여 상점 사이트를 생성하면 이 섹션에서 언급된 많은 설정을 구성합니다. [Minium Accelerator를 사용하여 B2B 스토어 바로 시작](../starting-a-store/using-the-minium-accelerator- to-jump-start-your-b2b-store.md)를 참조하십시오.
```

초기 상점 설정은 [Admin 계정](./introduction-to-the-admin-account.md)로 수행됩니다. [Liferay Commerce 구성 개요](../store-management/liferay-commerce-configuration-overview.md) 을 읽고 Liferay Commerce 구성 레이아웃과 사용 가능한 옵션에 대해 더 잘 알아보십시오.

### 글로벌 상거래 설정 구성

Liferay Commerce의 글로벌 구성에는 상점 시간대 설정, 사용 가능한 언어, 지역 추가 및 지역별 측정 단위 등이 포함됩니다. 다음 문서에서 자세히 알아보세요.

* [로캘 옵션 설정](../store-management/locale-options.md)
* [지역 추가](../store-management/adding-regions.md)
* [창고 설정](../inventory-management/warehouse-reference-guide.md)
* [채널 생성](../store-management/channels/introduction-to-channels.md)

### 상점 사이트 만들기

Liferay Commerce는 B2B, B2C 및 B2C-B2B 상점을 지원합니다. [사이트 유형](../starting-a-store/sites-and-site-types.md) 매장의 비즈니스 모델을 지정하고 매장이 계정과 함께 작동하는 방식을 결정합니다.

Liferay Commerce는 Liferay DXP를 기반으로 합니다. Liferay DXP 사이트의 작동 방식에 대한 자세한 내용은 [사이트 구축](https://learn.liferay.com/dxp/latest/en/site-building/building-sites/adding-a-site.html) 참조하십시오.

### 상점 사이트 상거래 설정 구성

다음 섹션에서는 매장 사이트별 구성에 대해 설명합니다.

#### 결제 수락

Liferay Commerce는 여러 제3자 결제 프로세서에 대한 지원을 제공하며 우편환을 사용하여 결제를 수락할 수도 있습니다. 보다:

* [결제](../store-management/configuring-payment-methods.md)
* [결제 수단 관리](../store-management/configuring-payment-methods/managing-payment-methods.md)
* [Authorize.net](../store-management/configuring-payment-methods/authorize-net.md)
* [PayPal](../store-management/configuring-payment-methods/mercanet.md)
* [Mercanet](../store-management/configuring-payment-methods/mercanet.md)
* [우편환](../store-management/configuring-payment-methods/mercanet.md)

#### 해당 세금 징수

해당 세금을 징수하기 위해 Liferay Commerce는 세금 범주를 생성하고 주소 또는 고정 비율로 세율을 설정할 수 있습니다.

* [세금 범주 생성](../pricing/configuring-taxes/creating-tax-categories.md)
* [세금 계산을 위한 세율 설정](../pricing/configuring-taxes/setting-rates-for-tax-calculations.md)
* [세율 적용](../pricing/configuring-taxes/applying-tax-rates.md)

#### 배송 제품

Liferay Commerce에는 배송료를 계산하는 몇 가지 옵션이 있습니다. Commerce Enterprise 가입자는 즉시 FedEx 운송업체 통합을 받습니다.

* [배송 방법](../store-management/configuring-shipping-methods.md)
* [변동 환율](../store-management/configuring-shipping-methods/using-the-variable-rate-shipping-method.md)
* [고정 요금](../store-management/configuring-shipping-methods/using-the-flat-rate-shipping-method.md)
* [FedEx를 운송업체로 사용](../store-management/configuring-shipping-methods/using-the-fedex-shipping-method.md)

## 카탈로그 만들기

상점을 설정한 후 [새 카탈로그 작성을 시작하십시오](../product-management/catalogs/creating-a-new-catalog.md).

### 카탈로그에 제품 추가

제품을 추가할 때 **Simple** , **Grouped** , **Virtual** 의 세 가지 제품 유형이 있습니다. 자세한 내용은 [제품 유형 소개](../product-management/creating-and-managing-products/product-types.md) 참조하십시오.

#### 제품 정보 추가

Liferay Commerce Catalog는 다양한 제품 정보의 저장 및 관리를 지원합니다. 다음 문서에서는 사용 가능한 옵션 중 일부를 다룹니다.

* [상품 옵션](../product-management/creating-and-managing-products/products/using-product-options.md)
* [상품 상세](../product-management/creating-and-managing-products/products/specifications.md)
* [제품 이미지](../product-management/creating-and-managing-products/products/product-images.md)
* [상품 관계](../product-management/creating-and-managing-products/products/related-products-up-sells-and-cross-sells.md)
* [제품 분류](../product-management/creating-and-managing-products/products/organizing-your-catalog-with-product-categories.md)
* [가용성 추정치](../inventory-management/availability-estimates.md)
* [재고 부족 조치](../inventory-management/low-stock-action.md)

#### 제품 가격

제품 가격을 책정하는 방법에는 여러 가지가 있으며 이러한 방법은 기본 가격, 가격표, 계층 가격, 판촉 가격 및 할인과 같은 가격 책정 계층 구조에서 서로 관련되어 있습니다. 가격은 SKU별로 관리됩니다.

* [가격](../pricing/introduction-to-pricing.md)
* [가격 리스트](../pricing/creating-a-price-list.md)
* [할인](../pricing/promoting-products/introduction-to-discounts.md)

#### 재고 관리

* [재고 관리](../inventory-management.md)

## 상점 만들기

Liferay Commerce에서 상점을 구축하려면 완전한 카탈로그 이상이 필요합니다. 처음부터 상점 첫 화면을 구축하는 상점 관리자는 제품을 표시하고 판매하기 위해 일련의 페이지를 추가해야 합니다.

자세한 내용은 [매장 만들기](../creating-store-content/creating-your-storefront.md) 참조하십시오.

## 고객 계정 관리

계정, 사용자 계정 초대, 계정 역할 등에 대해 자세히 알아보려면 다음 문서를 읽어보세요.

* [계정 소개](../users-and-accounts/account-management.md)
* [새 계정 만들기](../users-and-accounts/account-management/creating-a-new-account.md)
* [계정에 사용자 초대](../users-and-accounts/account-management/inviting-users-to-an-account.md)
* [계정에 주소 추가](../users-and-accounts/account-management/adding-addresses-to-an-account.md)
* [계정 역할](../users-and-accounts/account-management/account-roles.md)
* [새 계정 그룹 만들기](../users-and-accounts/account-management/creating-a-new-account-group.md)

## 주문 및 배송 관리

주문이 접수되면 주문은 ERP 및 선택적으로 CRM으로 전송될 수 있습니다. 요청한 상품의 배송이 가능해지면 상점의 재고 전문가가 배송을 추적할 수 있습니다. 주문 및 배송 프로세스의 수명 주기에 대해 알아보려면 다음 문서를 참조하십시오.

* [주문 수명 주기](../order-management/orders/order-life-cycle.md)
* [선적 소개](../order-management/shipments/introduction-to-shipments.md)
* [발송물 생성](../order-management/shipments/creating-a-shipment.md)
* [배송 취소](../order-management/shipments/cancelling-a-shipment.md)
