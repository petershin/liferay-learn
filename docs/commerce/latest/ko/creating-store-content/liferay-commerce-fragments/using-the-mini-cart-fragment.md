# 미니 카트 조각 사용

{bdg-secondary}`사용 가능한 Liferay DXP 7.4 U69+/GA69+`

미니 카트 조각은 카트에 대한 자세한 개요를 제공합니다. 이를 사용하여 제품 수량을 늘리거나 줄이고, 제품을 삭제하고, 결제를 위해 카트를 제출하거나, 제품을 검색하여 카트에 빠르게 추가할 수 있습니다.

프래그먼트가 올바르게 작동하려면 사이트에 [카탈로그](../commerce-storefront-pages/catalog.md), [오픈 카트](../commerce-storefront-pages/pending-orders.md), [체크아웃](../commerce-storefront-pages/checkout.md) 페이지가 있어야 합니다.

## 페이지에 미니 카트 조각 추가

1. 원하는 콘텐츠 페이지 또는 템플릿으로 이동하여 **편집**(![Edit icon](../../images/icon-edit-pencil.png))을 클릭합니다.

1. Fragments and Widgets 사이드바(![Add Widget icon](../../images/icon-plus.png))에서 **Mini Cart** 검색합니다.

   ![Fragments and Widgets 메뉴에서 Mini Cart 조각을 검색합니다.](./using-the-mini-cart-fragment/images/01.png)

1. 조각을 페이지로 끌어다 놓습니다. 이 조각을 [Mini Cart](../liferay-commerce-widgets/using-the-mini-cart-widget.md) 위젯으로 착각하지 마십시오.

1. **게시** 클릭합니다.

   ![카트 아이콘을 클릭하여 미니 카트를 엽니다.](./using-the-mini-cart-fragment/images/02.png)

## 미니 카트 세부 정보

Mini Cart 조각을 페이지에 추가한 후,

1. **장바구니에 담기** 제품을 클릭하세요.

   ![제품에서 카트에 추가를 클릭하여 미니 카트에 추가하십시오.](./using-the-mini-cart-fragment/images/03.png)

1. 다음 세부 정보를 보려면 미니 카트 아이콘(![Mini Cart](../../images/icon-mini-cart.png))을 클릭하십시오.

   * 상품 이름
   * SKU
   * 양
   * 가격
   * 소계
   * 소계 할인
   * 주문 할인
   * 합계

   ![미니 카트 조각은 현재 카트 상태에 대한 자세한 개요를 제공합니다.](./using-the-mini-cart-fragment/images/04.png)

머리글 영역에는 두 개의 버튼이 있습니다.

**세부 정보 보기:** 열린 주문에 대한 자세한 내용을 보려면 Open Carts 페이지로 이동합니다.

**모든 항목 제거:** 제품 카트를 비웁니다.

제품 목록 영역에는 장바구니에 있는 모든 제품이 수량 및 가격과 함께 표시됩니다. 여기에서 개별 제품의 수량을 제거(![Delete](../../images/icon-delete.png))하거나 조정할 수 있습니다. 변경하면 장바구니 요약 섹션이 자동으로 업데이트됩니다. 체크아웃을 계속하려면 **제출** 클릭하십시오.

## 장바구니에 제품을 빠르게 추가

프래그먼트의 검색 표시줄을 사용하여 장바구니에 항목을 빠르게 추가할 수 있습니다. 제품 이름 또는 알려진 SKU로 검색하십시오. 이를 통해 카탈로그를 검색해야 하는 부담을 제거하여 주문 생성 시간을 줄일 수 있습니다.

Mini Cart 조각을 페이지에 추가한 후,

1. [계정 선택기](./using-the-account-selector-fragment.md)통해 새 주문을 생성합니다.

1. 미니 카트를 열고 알려진 SKU 또는 제품을 검색합니다.

1. SKU를 선택하고 미니 카트(![Mini Cart](../../images/icon-mini-cart.png)) 아이콘을 클릭합니다.

이렇게 하면 장바구니에 SKU가 추가됩니다. 원하는 경우 한 번에 여러 SKU를 추가할 수 있습니다.

![각 SKU를 선택하고 미니 카트 아이콘을 클릭하여 한 번에 여러 SKU를 추가하십시오.](./using-the-mini-cart-fragment/images/05.gif)

<!-- Add this when ready

### Adding Discontinued Products to Cart

SKUs may reach end-of-life (EOL) and be marked as discontinued. Discontinued SKUs may or may not get a replacement. Replacement SKUs get added automatically to the cart when you try adding the discontinued SKU through quick add-to-cart.  -->

## 관련 주제

[카탈로그](../commerce-storefront-pages/catalog.md)

[주문을 보류](../commerce-storefront-pages/pending-orders.md)

[점검](../commerce-storefront-pages/checkout.md)
