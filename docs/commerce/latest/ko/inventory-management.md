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

```{toctree}
:maxdepth: 1

inventory-management/setting-up-warehouses.md
inventory-management/setting-inventory-by-warehouse.md
inventory-management/low-stock-action.md
inventory-management/availability-estimates.md
inventory-management/managing-product-status.md
inventory-management/using-the-inventory-management-system.md
inventory-management/inventory-management-reference-guide.md
inventory-management/warehouse-reference-guide.md
inventory-management/product-inventory-configuration-reference-guide.md
inventory-management/developer-guide.md
```

{bdg-secondary}`사용 가능한 커머스 2.1+`

Liferay의 재고 관리 도구는 하나의 창고가 있는 단일 매장에서 지리적으로 분산된 창고가 있는 여러 판매 채널에 이르기까지 광범위한 상거래 사용 사례를 지원할 수 있습니다.

Liferay의 재고 관리 기능은 다음과 같습니다.

* 창고 생성 및 관리
* 가용성 추정치 설정
* 낮은 스톡 동작 구성
* 창고별 SKU 인벤토리 설정

재고 관리 시스템을 사용하여 한 곳에서 재고를 추적할 수 있습니다. 자세한 내용은 [재고 관리 시스템 사용](./inventory-management/using-the-inventory-management-system.md) 참조하십시오.

## 창고

창고는 제품 재고를 관리하고 주문 이행을 위해 소싱할 수 있는 물리적 사이트를 나타냅니다. 단일 SKU는 둘 이상의 창고에서 사용할 수 있으며 재고는 창고별로 관리됩니다.

창고 관리에 대한 자세한 내용은 [상업 창고 설정](./inventory-management/setting-up-warehouses.md) 및 [창고 참조 안내서](./inventory-management/warehouse-reference-guide.md) 참조하십시오.

상점이 주문을 수락하려면 관련 채널에 연결된 창고가 있어야 합니다. 채널 작동 방식을 이해하려면 [채널 소개](./store-management/channels/introduction-to-channels.md) 을 읽으십시오.

## 창고별 재고 설정

Liferay에서 재고는 SKU별로 관리됩니다. 자세한 내용은 [창고](./inventory-management/setting-inventory-by-warehouse.md) 별 재고 설정을 참조하십시오.

```{important}
인벤토리의 각 제품은 하나 이상의 SKU에 연결되어야 합니다.
```

## 재고 부족 조치

재고 부족 조치는 사용 가능한 제품 재고가 특정 임계값에 도달하면 조치를 수행합니다. 재고가 최소 임계값에 도달할 때 실행되는 작업을 구성하는 방법을 알아보려면 [재고 부족 작업](./inventory-management/low-stock-action.md) 읽으십시오.

자신만의 사용자 지정 재고 부족 작업을 만드는 데 관심이 있는 개발자는 [사용자 지정 재고 부족 활동 구현](./developer-guide/managing-inventory/implementing-a-custom-low-stock-activity.md)읽을 수 있습니다.

## 가용성 추정치

재고가 없는 제품에 대한 예상 가용성을 구성할 수 있습니다. 이것은 다시 사용할 수 있을 때 고객에게 알립니다. 자세한 내용은 [가용성 예측](./inventory-management/availability-estimates.md) 읽으십시오.

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card}  창고 설정
:link: ./inventory-management/setting-up-warehouses.md
:::

:::{grid-item-card}  창고별 재고 설정
:link: ./inventory-management/setting-inventory-by-warehouse.md
:::

:::{grid-item-card}  재고 부족 조치
:link: ./inventory-management/low-stock-action.md
:::

:::{grid-item-card}  가용성 예측
:link: ./inventory-management/availability-estimates.md
:::

:::{grid-item-card}  상품 상태 관리
:link: ./inventory-management/managing-product-status.md
:::

:::{grid-item-card}  재고 관리 시스템 사용
:link: ./inventory-management/using-the-inventory-management-system.md
:::

:::{grid-item-card}  재고 관리 참조 가이드
:link: ./inventory-management/inventory-management-reference-guide.md
:::

:::{grid-item-card}  창고 참조 가이드
:link: ./inventory-management/warehouse-reference-guide.md
:::

:::{grid-item-card}  제품 인벤토리 구성 참조 가이드
:link: ./inventory-management/product-inventory-configuration-reference-guide.md
:::

:::{grid-item-card}  개발자 가이드
:link: ./inventory-management/developer-guide.md
:::
::::
