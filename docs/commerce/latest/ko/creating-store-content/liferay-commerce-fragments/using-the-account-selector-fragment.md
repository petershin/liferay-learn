# 계정 선택기 조각 사용

{bdg-secondary}`liferay DXP 7.4 U72+/GA72+`

계정 선택기 조각은 사용자가 제품을 검색하고 주문을 생성할 때 계정 간에 쉽게 전환할 수 있는 방법을 제공합니다.

```{tip}
조각은 [카탈로그](../commerce-storefront-pages/catalog.md), [장바구니 열기](../commerce-storefront-pages/pending-orders.md) 및 [체크아웃]이 있을 때 가장 잘 작동합니다](../commerce-storefront-pages/checkout.md) 페이지.
```

## 페이지에 계정 선택기 조각 추가

1. 원하는 콘텐츠 페이지나 템플릿으로 이동하여 **편집**(![아이콘 편집](../../images/icon-edit-pencil.png))을 클릭하세요.

1. 조각 및 위젯 사이드바(![위젯 추가 아이콘](../../images/icon-add-widget.png))에서 **account selector** 를 검색하세요.

   ![Search for the Account Selector fragment in the Fragments and Widgets sidebar.](./using-the-account-selector-fragment/images/01.png)

1. 조각을 페이지에 끌어다 놓습니다. 이 조각을 [계정 관리 위젯](https://learn.liferay.com/w/dxp/users-and-permissions/accounts/account-management-widget) 과 혼동하지 마십시오.

1. **게시** 를 클릭하세요.

   ![Click the account icon to open the account selector.](./using-the-account-selector-fragment/images/02.png)

계정 선택기는 사용자가 선택한 계정이 있는 경우 즉시 표시합니다.

## 계정 선택기 세부정보

계정 선택기 프래그먼트를 페이지에 추가한 후 계정 아이콘을 클릭하여 열 수 있습니다. 여기에서 관리 권한이 있는 계정에 액세스할 수 있습니다. **Create New Order** 버튼을 클릭하여 계정 선택기에서 새 주문을 생성할 수도 있습니다. 이것이 올바르게 작동하려면 [오픈 카트 페이지](../commerce-storefront-pages/pending-orders.md) 이 있어야 합니다.

활성 주문이 있는 경우 계정 선택기 프래그먼트는 계정 이름 바로 아래에 주문 번호와 상태를 표시합니다. 활성 워크플로가 있는 경우 주문은 **Draft** 상태로 생성됩니다.

![Open the account selector to create a new order or switch between accounts.](./using-the-account-selector-fragment/images/03.gif)

## 관련 주제

[카탈로그](../commerce-storefront-pages/catalog.md)

[대기 중인 주문](../commerce-storefront-pages/pending-orders.md)

[결제](../commerce-storefront-pages/checkout.md)
