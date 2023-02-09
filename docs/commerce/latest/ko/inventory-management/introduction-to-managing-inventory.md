# 재고 관리 소개

Liferay Commerce는 단일 점포와 창고가 있는 사용자부터 여러 판매 채널과 지리적으로 분산된 창고가 있는 대규모 조직으로 확장되는 제품 재고 관리 도구를 제공합니다.

재고 관리에는 재고 관리, 창고, 가용성 예측, 재고 부족 조치 및 창고별로 재고를 설정하는 기능과 같은 여러 기능이 사용됩니다.

## 재고 관리

> 가용성: 상거래 2.1+

재고 관리 시스템을 통해 사용자는 모든 재고를 한 곳에서 추적할 수 있습니다. 재고 관리는 SKU별로 재고를 추적합니다. 동일한 SKU를 공유하는 모든 항목은 이제 제품 카탈로그에서 생성된 방식에 관계없이 동일한 재고를 공유합니다.

자세한 내용은 [재고 관리 사용](./using-the-inventory-management-system.md) 을 참조하십시오.

```{important}
인벤토리의 각 제품은 하나 이상의 SKU에 연결되어야 합니다.
```

## 창고

창고는 제품 재고가 관리되고 주문 이행을 위해 소싱되는 물리적 사이트를 나타냅니다. 제품 재고 수량은 창고별로 관리됩니다.

창고 관리에 대한 자세한 내용은 [상업 창고 설정](./setting-up-commerce-warehouses.md) 및 [창고 참조 안내서](./warehouse-reference-guide.md) 을 참조하십시오.

상점이 제품 주문을 수락하려면 관련 채널에 연관된 창고가 있어야 합니다. 채널 작동 방식에 대해서는 [채널 소개](../store-management/channels/introduction-to-channels.md) 문서를 참조하세요.

## 가용성 추정치

매장 소유자는 재고가 없는 제품을 다시 사용할 수 있을 때 고객에게 알리도록 가용성 예측을 구성할 수 있습니다.

자세한 내용은 [가용성 예측](./availability-estimates.md) 을 참조하십시오.

## 재고 부족 조치

사용 가능한 제품 재고가 지정된 임계값에 도달하면 자동화된 작업을 수행하도록 재고 부족 작업을 구성할 수 있습니다. 재고가 최소 임계값에 도달할 때 실행되는 동작을 구성하는 방법을 알아보려면 [재고 부족 조치](./low-stock-action.md) 을 참조하십시오.

자신만의 사용자 지정 재고 부족 작업을 생성하는 데 관심이 있는 개발자는 [사용자 지정 재고 부족 활동 구현](../developer-guide/managing-inventory/implementing-a-custom-low-stock-activity.md)을 참조할 수 있습니다.

## 창고별 재고 설정

Liferay Commerce에서 재고 관리는 제품 SKU별로 수행됩니다. 자세한 내용은 [창고별 재고 설정](./setting-inventory-by-warehouse.md) 기사를 참조하십시오.

![재고 수명 주기](./introduction-to-managing-inventory/images/01.png)

## 추가 정보

* [새 발송물 만들기](../order-management/shipments/creating-a-shipment.md)
* [재고 관리 참조 가이드](./inventory-management-reference-guide.md)
* [제품 인벤토리 구성 참조](./product-inventory-configuration-reference.md)
* [주문 수명 주기](../order-management/orders/order-life-cycle.md)
* [재고 관리 시스템 사용](./using-the-inventory-management-system.md)
