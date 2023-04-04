
# 고정 요금 배송 방법 사용

구매자는 고정 요금 배송 옵션을 선택하여 모든 제품을 배송할 수 있습니다. 여러 고정 요금 옵션을 만들어 고객에게 비용, 속도 또는 보안에 대한 선택권을 제공할 수 있습니다.

고정 요금 배송은 카탈로그의 모든 제품에 동일한 비용을 부과합니다. 그러나 제품의 [구성](../../inventory-management/product-inventory-configuration-reference-guide.md) 탭에 있는 _배송 추가 가격_ 필드에서 개별 제품에 대한 예외를 생성할 수 있습니다.

기본적으로 고정 요금 배송 방법이 활성화되어 있습니다.

새로운 고정 요금 배송 옵션을 추가하려면:

1. _제어판_ &rarr; _상거래_ &rarr; _채널_로 이동합니다.

    ![제어판에서 채널로 이동](./using-the-flat-rate-shipping-method/images/02.png)

2. 원하는 채널(예: Sahara.com)을 클릭합니다. (Minium과 같은 액셀러레이터를 사용하여 사이트를 만든 경우 기본적으로 해당 채널이 이미 생성되어 있습니다.)
3. _배송 방법_까지 아래로 스크롤합니다.

    ![배송 방법은 채널에서 구성됩니다.](./using-the-flat-rate-shipping-method/images/03.png)

4. _편집_클릭합니다.
5. _활성_ 토글을 _예_으로 전환합니다.
6. _배송 옵션_ 탭을 클릭합니다.
7. 추가(![Add Icon](../../images/icon-add.png)) 버튼을 클릭하여 새 배송 옵션을 추가합니다.
8. 다음을 입력:
    * **이름**: 7일 배송
    * **금액**: 3.95
    * **우선순위**: 0.0

    ![새 배송 방법 옵션을 추가합니다.](./using-the-flat-rate-shipping-method/images/04.png)

9. _저장_클릭합니다.
10. 창을 닫습니다.

![새 배송 방법 옵션이 생성되었는지 확인합니다.](./using-the-flat-rate-shipping-method/images/05.png)

새로운 배송 방법 옵션이 추가되었습니다.

![새 배송 방법 옵션을 사용할 수 있는지 확인합니다.](./using-the-flat-rate-shipping-method/images/06.png)

## 상거래 2.0 이하

새로운 고정 요금 배송 옵션을 추가하려면:

1. _사이트 관리_ → _상업_ → _설정_로 이동합니다.
1. _배송 방법_ 탭을 클릭합니다.
1. _고정 요금_클릭합니다.
1. _배송 옵션_ 탭을 클릭합니다. (Minium 액셀러레이터를 사용하는 경우 기본적으로 _일반 배송_ 및 _긴급 배송_ 생성됩니다.)
1. 추가(![Add Icon](../../images/icon-add.png)) 버튼을 클릭하여 새 배송 옵션을 추가합니다.
1. 다음을 입력:
    * **이름**: 7일 배송
    * **금액**: 3.95
    * **우선순위**: 0.0
1. _저장_클릭합니다.

새 배송 옵션이 추가되었으며 결제 과정에서 사용할 수 있습니다.

## 추가 정보

* [가변 요율 배송 방법 사용](./using-the-variable-rate-shipping-method.md)
* [배송 방법으로 FedEx 사용](./using-the-fedex-shipping-method.md)
* [배송방법 제한 적용](./applying-shipping-method-restrictions.md)<!-- * \[Implementing a New Shipping Engine\](../../developer-guide/sales/implementing-a-new-shipping-engine.md) -->
