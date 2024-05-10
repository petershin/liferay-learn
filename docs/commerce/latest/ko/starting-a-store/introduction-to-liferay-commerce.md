# 라이프레이 커머스 소개

Liferay 상거래에 오신 것을 환영합니다!  Liferay Commerce는 모든 B2B 조직의 까다롭고 복잡한 요구 사항을 충족하기 위해 처음부터 구축된 디지털 상거래 플랫폼입니다. Liferay DXP의 엔터프라이즈 기반을 사용하는 Liferay Commerce는 완전히 통합된 웹 콘텐츠 관리 및 업계 최고의 포털 기능의 성능과 유연성을 갖추고 있습니다. Liferay DXP에 대해 자세히 알아보려면 [시작하기](https://learn.liferay.com/w/dxp/getting-started) 클릭하십시오.

## 개요

* [최신 매장 페이지 및 콘텐츠 관리](#modern-storefront-pages-and-content-management)
* [다중 채널 카탈로그 및 제품 정보 관리](#multi-channel-catalog-and-product-information-management)
* [B2B 중심의 계정 관리 및 구매 워크플로우](#b2b-focused-account-management-and-purchasing-workflow)
* [주문 관리 및 판매](#order-management-and-sales)
* [ML 기반 권장 사항 및 경고](#ml-powered-recommendations-and-alerts)
* [API 및 통합](#apis-and-integrations)
* [다음 단계](#next-steps)

시작하시겠습니까? Liferay Commerce **fast**[Liferay Commerce Docker 이미지 사용](../installation-and-upgrades/installing-commerce-2-1-and-below/using-the-liferay-commerce-docker-image.md)를 시작합니다.


## 최신 매장 페이지 및 콘텐츠 관리

Liferay Commerce에는 매장 설정을 위한 다양한 도구가 포함되어 있습니다. 예를 들어 새로운 검색 도구는 제품 카탈로그용으로 특별히 설계되었으며 사용자 정의 가능한 위젯을 사용하면 결제 및 장바구니 보기와 같은 공통 UI 요소를 페이지에 쉽게 추가할 수 있습니다. [스토어프론트 구축](../creating-store-content/creating-your-storefront.md)에 대해 자세히 알아보십시오.

![Liferay 상거래 대시보드](./introduction-to-liferay-commerce/images/01.png)

## 다중 채널 카탈로그 및 제품 정보 관리

Liferay Commerce에는 다양한 제품 유형을 지원하고 광범위한 제품 데이터를 저장하는 카탈로그 관리 시스템이 포함되어 있습니다. [제품 옵션](../product-management/creating-and-managing-products/products/using-product-options.md), [가격](../pricing/introduction-to-pricing.md), [이미지](../product-management/creating-and-managing-products/products/product-images.md)및 [사양](../product-management/creating-and-managing-products/products/specifications.md) 이 몇 가지 예입니다. 그런 다음 선택한 유통 채널에서 제품을 쉽게 사용할 수 있습니다.

![제품 카탈로그](./introduction-to-liferay-commerce/images/02.png)

[채널](../store-management/channels/introduction-to-channels.md) 은 제품이 판매되는 모든 장소에 카탈로그 및 제품을 연결합니다: Liferay Commerce 기반 매장, 타사 마켓플레이스 또는 백오피스 전화 판매.

![제품에 대해 활성화된 채널](./introduction-to-liferay-commerce/images/03.png)

[범주](../product-management/creating-and-managing-products/products/organizing-your-catalog-with-product-categories.md) 및 [제품 관계](../product-management/creating-and-managing-products/products/related-products-up-sells-and-cross-sells.md) 매장 탐색을 단순화하고 수익 창출 기회를 높입니다.

![제품 세부 정보 및 관련 제품](./introduction-to-liferay-commerce/images/04.png)

제품 가격 관리는 [가격표](../pricing/creating-a-price-list.md) 및 [계층 가격 책정](../pricing/using-price-tiers.md) 사용하여 유연하게 수행할 수 있습니다. 이 모든 항목은 고유한 고객 요구 사항을 충족하도록 맞춤화할 수 있습니다.

## B2B 중심의 계정 관리 및 구매 워크플로우

Liferay Commerce는 B2B 요구 사항을 해결하도록 설계된 기능을 갖춘 B2B 거래에 최적화되어 있습니다. [계정](../users-and-accounts/account-management.md), [계정 그룹](../users-and-accounts/account-management/creating-a-new-account-group.md)및 [계정 역할](../users-and-accounts/account-management/account-roles.md) 가 함께 작동하여 맞춤형 경험, 셀프 서비스 및 구매 워크플로를 통해 고객의 요구 사항을 충족할 수 있습니다.

![사용자 역할 선택](./introduction-to-liferay-commerce/images/05.png)

## 주문 관리 및 판매

Liferay Commerce는 구매자와 판매자가 주문을 준비, 배치, 승인, 전송 및 이행할 수 있는 주문 관리를 제공합니다.

주문에 대한 결제는 즉시 사용할 수 있는 여러 가지 [결제 방법](../store-management/configuring-payment-methods/managing-payment-methods.md) 사용하여 완료할 수 있습니다. 추가 사용자 정의를 통해 더 많은 결제 프로세서와 통합할 수 있습니다.

![결제 수단 페이지](./introduction-to-liferay-commerce/images/06.png)

여러 가지 [배송 방법](../store-management/configuring-shipping-methods/shipping-method-reference.md)을 사용하여 주문을 처리할 수 있습니다.
판매자는 [고정 요금 부과](../store-management/configuring-shipping-methods/using-the-flat-rate-shipping-method.md), [배송 방법 제한](../store-management 적용) /configuring-shipping-methods/applying-shipping-method-restrictions.md) 또는 [FedEx와 같은 배송업체 요금](../store-management/configuring-shipping-methods/using-the-fedex-shipping- 방법.md).

## ML 기반 권장 사항 및 경고

Liferay Commerce는 기계 학습 및 예측 분석을 적용하여 제안된 제품 그룹, 제품 수준까지의 주문 예측, 스마트 충성도 점수 알림 및 개인화된 제품 추천을 가능하게 합니다.

## API 및 통합

Mulesoft 커넥터, Talend 구성 요소를 통해 또는 Salesforce, SAP ERP(**출시 예정**) 또는 MS Dynamics NAV(**출시 예정**)용 사전 구축 커넥터를 사용하여 다른 비즈니스 시스템과 통합합니다.

## 다음 단계

* [설치 개요](../installation-and-upgrades/installation-overview.md)
* [Liferay Commerce Docker 이미지 사용](../installation-and-upgrades/installing-commerce-2-1-and-below/using-the-liferay-commerce-docker-image.md)
* [Miniium Accelerator를 사용하여 완전한 B2B 사이트 설정](../starting-a-store/using-the-minium-accelerator-to-jump-start-your-b2b-store.md)
