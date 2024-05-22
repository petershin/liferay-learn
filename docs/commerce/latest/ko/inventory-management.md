---
toc:
  - ./inventory-management/setting-up-warehouses.md
  - ./inventory-management/setting-inventory-by-warehouse.md
  - ./inventory-management/low-stock-action.md
  - ./inventory-management/availability-estimates.md
  - ./inventory-management/managing-product-status.md
  - ./inventory-management/using-the-inventory-management-system.md
  - ./inventory-management/inventory-management-reference-guide.md
  - ./inventory-management/warehouse-reference-guide.md
  - ./inventory-management/product-inventory-configuration-reference-guide.md
  - ./inventory-management/developer-guide.md
---
# 재고 관리

{bdg-secondary}`Commerce 2.1+`

Liferay의 재고 관리 도구는 하나의 창고가 있는 단일 매장부터 지리적으로 분산된 창고가 있는 여러 판매 채널에 이르기까지 광범위한 상거래 사용 사례를 지원할 수 있습니다.

Liferay의 재고 관리 기능은 다음과 같습니다.

* 창고 생성 및 관리
* 가용성 추정치 설정
* 재고 부족 작업 구성
* 창고별 SKU 재고 설정
* 재고를 [단위로 설정](./product-management/creating-and-managing-products/products/units-of-measure.md) {bdg-secondary}`Liferay DXP 2023.Q4+/Portal 7.4 GA98+`

재고 관리 시스템을 사용하여 한 곳에서 재고를 추적할 수 있습니다. 자세한 내용은 [재고 관리 시스템 사용](./inventory-management/using-the-inventory-management-system.md) 참조하세요.

## 창고

창고는 제품 재고를 관리하고 주문 이행을 위해 소싱할 수 있는 물리적 사이트
를 나타냅니다. 단일 SKU 또는 측정 단위는 둘 이상의 창고에서 사용할 수 있으며 재고는 창고별로 관리됩니다.

창고 관리에 대한 자세한 내용은 [상업 창고 설정](./inventory-management/setting-up-warehouses.md) 및 [창고 참조 안내서](./inventory-management/warehouse-reference-guide.md) 참조하십시오.

매장에서 주문을 수락하려면 관련 채널에 창고가 연결되어 있어야 합니다. 채널 작동 방식을 이해하려면 [채널 소개](./store-management/channels/introduction-to-channels.md)를 읽어보세요.

## 창고별 재고 설정

{bdg-secondary}`liferay DXP 2023.Q4+/포탈 7.4 GA98+`

SKU에 대해 구성된 측정 단위가 있는 경우 재고는 SKU에 대해 해당 단위로 관리됩니다.

{bdg-secondary}`Liferay DXP 2023.Q3/Portal 7.4 GA97 이하`

재고는 SKU 수준에서 추적됩니다.

```{important}
재고의 각 제품은 하나 이상의 SKU와 연결되어야 합니다.
```

자세한 내용은 [창고별 재고 설정](./inventory-management/setting-inventory-by-warehouse.md)을 참조하세요.

## 재고 부족 조치

재고 부족 작업은 사용 가능한 제품 재고가 특정 임계값에 도달할 때 작업을 수행합니다. 재고가 최소 임계값에 도달할 때 실행되는 작업을 구성하는 방법을 알아보려면 [재고 부족 작업](./inventory-management/low-stock-action.md) 읽어보세요.

자신만의 맞춤형 재고 부족 작업 생성에 관심이 있는 개발자는 [맞춤형 재고 부족 활동 구현](./developer-guide/managing-inventory/implementing-a-custom-low-stock-activity.md) 읽어보세요.

## 커머스 주소

재고가 없는 제품에 대한 예상 가용성을 구성할 수 있습니다. 다시 사용할 수 있게 되면 이를 고객에게 알립니다. 자세한 내용은 [가용성 추정](./inventory-management/availability-estimates.md)을 읽어보세요.


