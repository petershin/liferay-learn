# 미니 카트 조각 사용

{bdg-secondary}`liferay DXP 7.4 U69+/GA69+`

미니 카트 조각은 카트에 대한 자세한 개요를 제공합니다. 이를 사용하여 제품 수량을 늘리거나 줄이거나, 제품을 삭제하거나, 결제를 위해 장바구니를 제출하거나, 제품을 검색하여 장바구니에 빠르게 추가할 수 있습니다.

조각이 올바르게 작동하려면 사이트에 카탈로그 [목록](../commerce-storefront-pages/catalog.md) , 열린 장바구니 [장바구니 열기](../commerce-storefront-pages/pending-orders.md) , 결제 [페이지](../commerce-storefront-pages/checkout.md) 있어야 합니다.

## 페이지에 미니 카트 조각 추가

1. 원하는 콘텐츠 페이지나 템플릿으로 이동하여 **편집**(![아이콘 편집](../../images/icon-edit-pencil.png))을 클릭하세요.

1. 조각 및 위젯 사이드바(![위젯 추가 아이콘](../../images/icon-plus.png))에서 **Mini Cart** 를 검색하세요.

   ![Search for the Mini Cart fragment from the Fragments and Widgets menu.](./using-the-mini-cart-fragment/images/01.png)

1. 조각을 페이지에 끌어다 놓습니다. 이 조각을 [Mini Cart](../liferay-commerce-widgets/using-the-mini-cart-widget.md) 위젯과 혼동하지 마십시오.

1. **게시** 를 클릭하세요.

   ![Click the cart icon to open the Mini Cart.](./using-the-mini-cart-fragment/images/02.png)

## 미니 카트 세부 정보

Mini Cart 프래그먼트를 페이지에 추가한 후,

1. 제품에 대해 **장바구니에 추가** 를 클릭하세요.

   ![Click Add to Cart on a product to add it to your Mini Cart.](./using-the-mini-cart-fragment/images/03.png)

1. 미니 카트 아이콘(![미니 카트](../../images/icon-mini-cart.png))을 클릭하면 다음 세부 정보를 볼 수 있습니다.

   * 상품 이름
   * SKU
   * 양
   * 가격
   * 소계
   * 소계 할인
   * 주문 할인
   * 합계

   ![The Mini Cart fragment gives a detailed overview of the current cart status.](./using-the-mini-cart-fragment/images/04.png)

헤더 영역에는 다음 두 개의 버튼이 있습니다.

**세부 정보 보기:** 미결 주문에 대한 자세한 내용을 보려면 미결 카트 페이지로 이동하세요.

**모든 항목 제거:** 장바구니의 제품을 지웁니다.

제품 목록 영역에는 장바구니에 있는 모든 제품이 수량 및 가격과 함께 표시됩니다. 여기에서 (![삭제](../../images/icon-delete.png))를 제거하거나 개별 제품의 수량을 조정할 수 있습니다. 변경하면 장바구니 요약 섹션이 자동으로 업데이트됩니다. 체크아웃을 계속하려면 **제출** 을 클릭하세요.

## 장바구니에 제품을 빠르게 추가하기

조각의 검색 창을 사용하여 장바구니에 항목을 빠르게 추가할 수 있습니다. 제품 이름이나 알려진 SKU로 검색하세요. 이를 통해 카탈로그를 검색하는 부담을 없애 주문 생성 시간을 줄일 수 있습니다.

Mini Cart 프래그먼트를 페이지에 추가한 후,

1. [계정 선택기](./using-the-account-selector-fragment.md) 통해 새 주문을 생성하세요.

1. 미니 카트를 열고 알려진 SKU 또는 제품을 검색하십시오.

1. SKU를 선택하고 미니 카트(![미니 카트](../../images/icon-mini-cart.png)) 아이콘을 클릭합니다.

장바구니에 SKU가 추가됩니다. 원하는 경우 여러 SKU를 한 번에 추가할 수 있습니다.

![Add multiple SKUs at once by selecting each SKU and clicking on the Mini Cart icon.](./using-the-mini-cart-fragment/images/05.gif)

<!-- Add this when ready

### Adding Discontinued Products to Cart

SKUs may reach end-of-life (EOL) and be marked as discontinued. Discontinued SKUs may or may not get a replacement. Replacement SKUs get added automatically to the cart when you try adding the discontinued SKU through quick add-to-cart.  -->

## 관련 주제

[카탈로그](../commerce-storefront-pages/catalog.md)

[대기 중인 주문](../commerce-storefront-pages/pending-orders.md)

[결제](../commerce-storefront-pages/checkout.md)
