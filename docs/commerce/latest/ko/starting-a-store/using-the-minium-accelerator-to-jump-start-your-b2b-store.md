# Miniium Accelerator를 사용하여 B2B Store를 빠르게 시작하십시오.

Minium은 제조업체의 요구 사항을 충족하도록 설계된 B2B(Business-to-Business) 상점을 쉽고 빠르게 설정하여 최신 B2B 디지털 상거래 경험을 선보이는 Liferay Commerce [Accelerator](./accelerators.md) 입니다. 기능적이고 우아한 요소를 모두 포함하여 가능한 한 원활한 경험을 제공하는 기능으로 설계되었습니다.

액셀러레이터는 사이트 페이지의 기본 계층 구조와 디자인, 샘플 데이터 및 사이트 구성을 단일 작업으로 제공하여 이를 수행합니다. Minium은 또한 Liferay Commerce의 B2B 계정 관리 기능을 강조하여 [계정 역할](../users-and-accounts/account-management/account-roles.md), [계정 그룹](../users-and-accounts/account-management/creating-a-new-account-group.md)및 [주문 워크플로우](../order-management/order-workflows/introduction-to-order-workflows.md)를 사용하여 간소화된 계정 관리 및 셀프 서비스를 가능하게 합니다.

이 문서는 Minium Accelerator의 주요 기능을 살펴보는 역할을 합니다.

## 페이지 및 디자인

### 페이지

Minium은 여러 페이지와 위젯으로 사이트를 채워 구매자에게 완전한 사용자 경험을 제공합니다. 생성된 페이지의 전체 목록을 보려면 *사이트 메뉴 → 빌드 → 페이지*로 이동하십시오.

![최소 페이지](./using-the-minium-accelerator-to-jump-start-your-b2b-store/images/01.png)

일반적으로 이러한 페이지는 이름에서 알 수 있듯이 약간의 차이는 있지만 작동합니다. 예를 들어 전용 카테고리 페이지를 사용하는 대신 사이트 홈페이지에 카탈로그의 전체 콘텐츠가 표시됩니다. 단일 범주의 제품을 표시하려면 범주 패싯 위젯에서 확인란을 선택합니다.

![카탈로그 페이지](./using-the-minium-accelerator-to-jump-start-your-b2b-store/images/02.png)

### 디자인

Minium 액셀러레이터에는 팝업 탐색, 장바구니 메뉴, 계정 선택기를 비롯한 다양한 내장 기능이 포함되어 있습니다. 탐색 메뉴는 카탈로그, 보류 및 과거 주문, 계정 관리에 대한 링크를 제공하며 카트 메뉴는 현재 주문을 표시합니다. 마지막으로 옴니 서치 바를 통해 사용자는 원하는 제품을 빠르게 찾을 수 있습니다.

![미니엄 테마](./using-the-minium-accelerator-to-jump-start-your-b2b-store/images/03.png)

Minium은 테마가 포함된 카트 메뉴에 포함된 체크아웃 페이지에 대한 링크를 사용합니다.

계정 선택기는 현재 사용자가 액세스할 수 있는 계정을 표시합니다(관리자는 모든 계정에 액세스할 수 있음). 계정을 선택하면 미결 주문이 표시됩니다. 여러 계정을 서비스하는 판매 대리점 및 구매자가 계정 간에 전환하는 것은 매우 쉽습니다.

## 카탈로그 데이터

Minium의 카탈로그에는 미리 정의된 여러 범주로 구성된 다양한 샘플 제품이 포함되어 있습니다.

![사전 설정 카테고리](./using-the-minium-accelerator-to-jump-start-your-b2b-store/images/04.png)

> 범주는 _전역_ 범위 수준에서 정의됩니다. 자세한 내용은 [제품 카테고리](../product-management/creating-and-managing-products/products/organizing-your-catalog-with-product-categories.md)을 참조하십시오.

샘플 제품에는 미리 설정된 [옵션](../product-management/creating-and-managing-products/products/using-product-options.md), [사양](../product-management/creating-and-managing-products/products/specifications.md)및 이미지가 함께 제공됩니다.

![상품 상세](./using-the-minium-accelerator-to-jump-start-your-b2b-store/images/05.png)

_샘플 데이터는 데모 목적으로 추가되며 상점 관리자가 Miniium을 상점 사이트의 기반으로 사용하려는 경우 안전하게 삭제할 수 있습니다._

## 검색

Minium을 사용하면 구매자가 카탈로그를 빠르게 검색할 수 있습니다. 옴니 검색 표시줄 외에도 Minium에는 검색 표시줄을 여는 특수 키보드 단축키가 있습니다. _카탈로그_ 기본 페이지에서 슬래시(/)를 누르면 검색 표시줄이 열리고 초점이 맞춰집니다.

![슬래시를 사용하여 검색](./using-the-minium-accelerator-to-jump-start-your-b2b-store/images/06.png)

## 기타 구성

Minium은 빈 사이트에 대해 기본적으로 설정되지 않은 여러 다른 사이트 구성을 적용합니다. 다음 표는 Miniium이 B2B 상점을 바로 시작하기 위해 만드는 주목할만한 추가 또는 구성 목록을 제공합니다.

| 특징                                                                                                                     | 세부사항                       |
|:---------------------------------------------------------------------------------------------------------------------- |:-------------------------- |
| [창고](../inventory-management/setting-up-commerce-warehouses.md)                                                        | 이탈리아, 미국 북동부, 미국 남서부       |
| [사이트 유형](../starting-a-store/sites-and-site-types.md)                                                                  | B2B                        |
| [배송 방법 옵션](../store-management/configuring-shipping-methods/using-the-flat-rate-shipping-method.md)                    | 일반 배송, 빠른 배송               |
| 채널                                                                                                                     | 미니 포털                      |
| 국가                                                                                                                     | 프랑스, 중국, 미국 외 245개         |
| [환율](../store-management/currencies/adding-a-new-currency.md)                                                          | USD, AUD, GBP 외 7개         |
| 기본 이미지                                                                                                                 | &#10003;                   |
| [측정 단위](../store-management/configuring-shipping-methods/measurement-units.md) - 치수                                    | 인치, 밀리미터, 피트, 미터           |
| [측정 단위](../store-management/configuring-shipping-methods/measurement-units.md) - 무게                                    | 온스, 파운드, 킬로그램, 그램          |
| [계정 역할](../users-and-accounts/account-management/account-roles.md)                                                     | 구매자, 계정 관리자, 판매 에이전트       |
| [가용성 추정치](../inventory-management/availability-estimates.md)                                                           | 3-5일, 5-7일, 7-14일          |
| [제품 관계 유형](../product-management/creating-and-managing-products/products/related-products-up-sells-and-cross-sells.md) | 상향 판매, 예비, 관련, 액세서리, 교차 판매 |
