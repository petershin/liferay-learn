---
uuid: ece95c64-ba3c-46ad-8343-5ebdeee906db
---

# 결제 수단 관리

[채널](../../store-management/channels/introduction-to-channels.md) 및 상점 [사이트](../../starting-a-store/sites-and-site-types.md)으로 범위가 지정된 Liferay Commerce의 결제 방법. Liferay Commerce 인스턴스에 동일한 인스턴스에서 호스팅되는 상점이 두 개 이상 있는 경우 관리자는 각 사이트에서 서로 다른 결제 방법을 사용할 수 있습니다.

결제 방법을 관리하려면 _제어판_ &rarr; _상거래_ &rarr; _채널_로 이동하십시오.

![커머스 2.1 채널](./managing-payment-methods/images/06.png)

원하는 채널을 선택한 후 이 매장 사이트의 결제 수단에 대해 _편집_ 클릭합니다.

![결제 수단 페이지](./managing-payment-methods/images/04.png)

선택한 결제 방법이 활성화되면 해당 값으로 결제 방법을 구성합니다.

## 결제 수단 구성

![결제 수단 구성](./managing-payment-methods/images/05.png)

### 세부 정보 탭

각 세부정보 화면에는 결제 방법이 결제 위젯에서 렌더링되는 방식을 결정하는 필드가 포함되어 있습니다.

| 분야  | 묘사                                                |
|:--- |:------------------------------------------------- |
| 이름  | 결제 수단 이름                                          |
| 묘사  | 결제 수단에 대한 간략한 설명                                  |
| 아이콘 | 결제 수단을 나타내는 작은 이미지 또는 로고를 업로드하세요.                 |
| 우선권 | 결제 프로세스에서 결제 방법이 표시되는 순서를 결정합니다. 낮은 숫자가 높게 표시됩니다. |
| 활성  | 토글을 전환하여 결제 수단을 활성화 또는 비활성화합니다.                   |

### 구성 탭

지불 방법에 대한 _구성_ 탭은 상점 관리자가 지불 방법에 대한 상점과의 통합을 구성하는 곳입니다.

각 결제 방법을 활성화하는 방법은 해당 문서를 참조하십시오.

* [Authorize.net](./authorize-net.md)
* [Mercanet](./mercanet.md)
* [우편환](./money-orders.md)
* [PayPal](./paypal.md)

## 상거래 2.0 이하

이전 버전의 Liferay Commerce에서 결제 방법은 매장 [사이트](../../starting-a-store/sites-and-site-types.md)로 범위가 지정됩니다.

Commerce 2.0 이하에서 결제 수단을 관리하려면 _사이트 관리_ → _상거래_ → _설정_로 이동합니다.

![결제 수단 페이지](./managing-payment-methods/images/07.png)

_결제 수단_ 탭을 선택합니다.

![결제 수단 페이지](./managing-payment-methods/images/01.png)

### 세부정보 탭(2.0)

![결제 수단 구성](./managing-payment-methods/images/02.png)

### 제한 탭(2.0)

제한은 지정된 국가의 구매자에 대한 결제 방법을 비활성화합니다.

![결제 수단 제한 설정](./managing-payment-methods/images/03.png)
