---
toc:
  - ./setting-up-and-creating-products/creating-and-configuring-channels.md
  - ./setting-up-and-creating-products/configuring-workflows-and-notifications.md
  - ./setting-up-and-creating-products/creating-and-configuring-warehouses.md
  - ./setting-up-and-creating-products/creating-and-configuring-catalogs.md
  - ./setting-up-and-creating-products/creating-products.md
---
# 제품 설정 및 생성

Kyle과 Damian은 B2B 및 B2C 매장에 필요한 채널, 카탈로그, 제품을 만드는 데 여러분의 도움이 필요합니다. 관리자인 Kyle은 채널 생성을 담당하고, 카테고리 관리자인 Damian은 카탈로그, 제품 생성, 가격 구성 및 인벤토리 추가를 담당합니다.

![채널, 카탈로그, 제품, 창고 간의 관계입니다.](./setting-up-and-creating-products/images/01.png)

*채널* 의 범위는 Liferay 인스턴스로 지정됩니다. 채널은 고객 포털, B2B 마켓플레이스, 백오피스 전화 판매 등 제품을 판매하기 위한 수단입니다. Liferay 사이트에서 제품을 판매하려면 먼저 해당 사이트를 채널에 연결해야 합니다. 맛있는 분재에는 소비자를 위한 매장과 비즈니스 고객을 위한 매장이 있습니다. 이를 지원하기 위해 두 개의 채널을 만들고 해당 사이트에 연결합니다. 나중에 두 개의 공급업체 채널도 생성하게 됩니다. 이를 통해 Delectable Bonsai의 공급업체는 자신의 주문을 쉽게 확인하고 관리할 수 있습니다.

*카탈로그* Liferay 인스턴스로 범위가 지정되며 제품 정보를 저장합니다. 이름, 기본 통화, 기본 가격표, 기본 판촉 목록과 같은 카탈로그에 대한 기본 매개변수를 설정할 수 있으며 필요한 경우 공급업체 계정에 연결할 수도 있습니다. Delectable Bonsai가 제공하는 모든 제품을 담기 위해 하나의 카탈로그를 생성하게 됩니다. 나중에 서로 다른 두 공급업체의 제품이 포함된 두 공급업체 카탈로그를 생성합니다. 여러 카탈로그의 제품이 포함된 주문을 하면 자동으로 분할됩니다. 이를 통해 공급자는 주문의 일부를 이행할 수 있고 Delectable Bonsai는 주문을 이행할 수 있습니다.

*제품* 의 범위는 카탈로그로 지정됩니다. 카탈로그와 채널 사이에는 직접적인 관계가 없으므로 제품이 올바른 채널에 표시되도록 구성해야 합니다. 동일한 채널에 여러 카탈로그의 제품을 표시할 수 있습니다. 여러 제품, SKU를 생성하고 구성하고 재고, 가격 및 기타 필요한 정보를 추가하게 됩니다.

*창고* 은 제품 재고를 보관하는 물리적 사이트를 나타냅니다. Delectable Bonsai를 위한 두 개의 창고를 생성합니다. 하나는 비즈니스 주문과 소비자 주문을 모두 처리하고 다른 하나는 비즈니스 주문만 처리합니다. 이를 위해 기본 창고를 B2B 및 B2C 채널 모두에 연결하고 두 번째 창고를 B2B 채널에만 연결합니다.

이 모듈을 완료하면 다음과 같은 이점을 얻을 수 있습니다.

* 다양한 제품이 포함된 제품 카탈로그
* 채널이 구성되어 두 사이트 모두에 연결됨
* 결제수단 및 배송수단 설정
* 두 온라인 상점 모두에 서비스를 제공하는 창고

준비가 된?

[갑시다!](./setting-up-and-creating-products/creating-and-configuring-channels.md)
