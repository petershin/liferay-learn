# 제품 게시 관리

Liferay Commerce는 매장 관리자가 **만료** 또는 **게시 취소** 제품의 게시 상태를 관리할 수 있는 두 가지 방법을 제공합니다.

제품이 **만료**이면 미래에 설정된 만료 날짜가 있으므로 해당 날짜 이후에는 제품을 더 이상 판매할 수 없습니다. 제품이 _만료_ 상태에 있으며 매장 검색 결과에 표시되지 않습니다. 매장 관리자는 전체 제품(모든 SKU) 또는 하나의 특정 SKU에 대한 만료 프로세스를 구성할 수 있습니다.

**게시 취소** 제품은 제품을 _초안_ 상태로 설정하고 검색 결과에서 제품을 제거합니다. 제품의 인벤토리가 최소 임계값 아래로 떨어지면 제품 게시 취소가 자동으로 발생하도록 구성할 수 있습니다. 자세한 내용은 [재고 부족 조치](./low-stock-action.md)문서를 참조하십시오.

## 제품 만료 일정 잡기

제품 만료를 예약하려면:

1. _글로벌 애플리케이션_ 메뉴 → _커머스_ → _상품_로 이동합니다.
1. 제품을 클릭합니다(예: _U-Joint_).
1. _제품 세부 정보_ 탭에서 _만료되지 않음_ 확인란의 선택을 취소합니다. 이 예에서 이 구성은 모든 SKU에 영향을 미칩니다.
1. 미래의 만료 날짜와 시간을 입력합니다. 모든 시간은 GMT 시간대를 사용하여 설정됩니다.

    ![제품 만료 날짜 설정](./managing-product-publication/images/03.png)

1. _게시_을 클릭합니다.

변경 후 확인 주기로 인해 _카탈로그_ 페이지에서 상품이 삭제되는 데 다소 시간이 걸릴 수 있습니다. 기본적으로 확인 간격은 15분으로 설정됩니다. 유통기한이 지난 상품은 _카탈로그_ 페이지에서 검색 시 반품되지 않습니다. 검색 컨테이너에서 제품 상태는 _Expired_로 표시됩니다.

![만료된 상태](./managing-product-publication/images/04.png)

새 만료 날짜를 입력하고 제품을 다시 게시하면 제품을 다시 표시할 수 있습니다.

## 제품 게시 취소

1. _제어판_ → _상거래_ → _제품_로 이동합니다.
1. 제품을 클릭합니다(예: _U-Joint_). > 필요한 경우 _일정_ 섹션을 확장합니다.
1. _게시됨_ 확인란의 선택을 취소합니다.

    ![선택되지 않은 게시됨 상자](./managing-product-publication/images/01.png)

1. _초안으로 저장_을 클릭합니다.
1. 매장 사이트로 이동합니다.
1. 제품을 검색합니다(이 예에서는_U-Joint_).

![미공개 U-조인트](./managing-product-publication/images/02.png)

카탈로그에서 제품을 검색할 수 없습니다. _제어판_에서 제품 상태가 _초안_으로 설정되어 있습니다.

![미공개 U-조인트](./managing-product-publication/images/05.png)

## 상거래 2.1 이하

Commerce 2.1 이하의 설정은 _제어판_에 있습니다.

### 제품 만료 일정 잡기

제품 만료를 예약하려면:

1. _제어판_ → _상거래_ → _제품_로 이동합니다.
1. 제품을 클릭합니다(예: _U-Joint_).
1. _제품 세부 정보_ 탭에서 _만료되지 않음_ 확인란의 선택을 취소합니다. 이 예에서 이 구성은 모든 SKU에 영향을 미칩니다.
1. 미래의 만료 날짜와 시간을 입력합니다. 모든 시간은 GMT 시간대를 사용하여 설정됩니다.

    ![제품 만료 날짜 설정](./managing-product-publication/images/03.png)

1. _게시_을 클릭합니다.

변경 후 확인 주기로 인해 _카탈로그_ 페이지에서 상품이 삭제되는 데 다소 시간이 걸릴 수 있습니다. 기본적으로 확인 간격은 15분으로 설정됩니다. 유통기한이 지난 상품은 _카탈로그_ 페이지에서 검색 시 반품되지 않습니다. 검색 컨테이너에서 제품 상태는 _Expired_로 표시됩니다.

![만료된 상태](./managing-product-publication/images/04.png)

새 만료 날짜를 입력하고 제품을 다시 게시하면 제품을 다시 표시할 수 있습니다.

### 제품 게시 취소

1. _제어판_ → _상거래_ → _제품_로 이동합니다.
1. 제품을 클릭합니다(예: _U-Joint_). > 필요한 경우 _일정_ 섹션을 확장합니다.
1. _게시됨_ 확인란의 선택을 취소합니다.

    ![선택되지 않은 게시됨 상자](./managing-product-publication/images/01.png)

1. _초안으로 저장_을 클릭합니다.
1. 매장 사이트로 이동합니다.
1. 제품을 검색합니다(이 예에서는_U-Joint_).

![미공개 U-조인트](./managing-product-publication/images/02.png)

카탈로그에서 제품을 검색할 수 없습니다. _제어판_에서 제품 상태가 _초안_으로 설정되어 있습니다.

![미공개 U-조인트](./managing-product-publication/images/05.png)

## 추가 정보

* [채널을 사용하여 제품 가시성 구성](../store-management/channels/configuring-product-visibility-using-channels.md)
* [간단한 제품 만들기](../product-management/creating-and-managing-products/product-types/creating-a-simple-product.md)
* [그룹화된 제품 만들기](../product-management/creating-and-managing-products/product-types/creating-a-grouped-product.md)
* [가상 제품 만들기](../product-management/creating-and-managing-products/product-types/creating-a-virtual-product.md)
* [재고 부족 조치](./low-stock-action.md)
