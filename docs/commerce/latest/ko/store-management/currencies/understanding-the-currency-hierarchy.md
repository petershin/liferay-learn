# 통화 계층 이해

Liferay Commerce를 사용하면 카탈로그, 가격표 및 채널에서 서로 다른 통화를 사용할 수 있습니다. 각 통화는 상거래 통화 계층 구조에서 고유한 역할을 합니다.

[카탈로그의](../../product-management/catalogs/creating-a-new-catalog.md) 통화는 각 제품의 기본 가격을 결정하는 기본 가격 목록의 초기 통화를 설정합니다. 그런 다음 사용자 정의 [가격표](../../pricing/creating-a-price-list.md) 을 대체 통화와 함께 사용하여 특정 채널, 계정 및 계정 그룹에 대한 기본 가격표를 재정의할 수 있습니다.

제품이 [채널](../../store-management/channels/managing-channels.md)에 추가되면 가격은 [Exchange Rate Provider](./managing-exchange-rates.md)를 사용하여 채널의 통화로 변환됩니다. 변환된 가격은 채널에 저장되고 표시 및 주문 가격에 사용됩니다.

예를 들어, 하나는 미국 고객용이고 다른 하나는 EU 고객용인 두 개의 채널이 있는 미국 기반 비즈니스를 고려하십시오. 이 비즈니스의 카탈로그 및 기본 가격 목록은 모두 USD를 사용하는 반면 해당 채널은 서로 다른 통화(USD 및 EUR)를 사용합니다. 제품이 이러한 채널에 제공되면 Commerce의 환율 공급자는 기본 USD 가격을 채널의 통화로 자동 변환합니다.

이 예에서 USD 가격은 EUR 가격으로 변환되어 EU 채널에 저장됩니다. 이렇게 저장된 가격은 채널의 연결된 사이트에 사용됩니다. 이를 통해 독일 고객은 EU 채널 사이트를 탐색할 때 EUR 가격을 볼 수 있고 미국 고객은 미국 채널 사이트에 액세스할 때 USD 가격을 볼 수 있습니다. 주문이 생성되면 각 채널은 저장된 가격을 적절한 통화로 사용합니다.

```{note}
*Global Menu*의 *Commerce* 탭에 있는 *Currencies* 페이지를 통해 사용 가능한 통화를 볼 수 있습니다. 여기에서 통화를 편집, 우선 순위 지정, 추가/제거 및 활성화/비활성화할 수 있습니다. 자세한 내용은 [통화 참조](./currencies-reference.md) 및 [새 통화 추가](./adding-a-new-currency.md)를 참조하세요.
```
<!-- Update article once \[COMMERCE-5171\](https://issues.liferay.com/browse/COMMERCE-5171) is implemented. It removes Catalog Currency and uses the Base Price List currency alone as currency basis. -->

## 추가 정보

* [새 통화 추가](./adding-a-new-currency.md)
* [환율 관리](./managing-exchange-rates.md)
* [통화 참조](./currencies-reference.md)
