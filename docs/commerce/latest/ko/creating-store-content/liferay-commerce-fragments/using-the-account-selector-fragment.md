# 계정 선택기 조각 사용

{bdg-secondary}`사용 가능한 Liferay DXP 7.4 U72+/GA72+`

계정 선택기 프래그먼트는 사용자가 제품을 탐색하고 주문을 생성할 때 계정 간에 전환할 수 있는 쉬운 방법을 제공합니다.

```{tip}
프래그먼트는 [카탈로그](../commerce-storefront-pages/catalog.md) , [장바구니 열기](../commerce-storefront-pages/pending-orders.md) 및 [checkout](.. /commerce-storefront-pages/checkout.md) 페이지.
```

## 계정 선택기 조각을 페이지에 추가

1. 원하는 콘텐츠 페이지 또는 템플릿으로 이동하여 **편집**(![Edit icon](../../images/icon-edit-pencil.png))을 클릭합니다.

1. 조각 및 위젯 사이드바(![Add Widget icon](../../images/icon-add-widget.png))에서 **계정 선택기** 검색합니다.

   ![조각 및 위젯 사이드바에서 계정 선택기 조각을 검색합니다.](./using-the-account-selector-fragment/images/01.png)

1. 조각을 페이지로 끌어다 놓습니다. 이 조각을 [계정 관리 위젯](https://learn.liferay.com/dxp/latest/ko/users-and-permissions/accounts/account-management-widget.html) 로 착각하지 마십시오.

1. **게시** 클릭합니다.

   ![계정 아이콘을 클릭하여 계정 선택기를 엽니다.](./using-the-account-selector-fragment/images/02.png)

계정 선택기는 사용자가 선택한 계정이 있는 경우 즉시 표시합니다.

## 계정 선택기 세부정보

계정 선택기 조각을 페이지에 추가한 후 계정 아이콘을 클릭하여 열 수 있습니다. 여기에서 관리 권한이 있는 계정에 액세스할 수 있습니다. **Create New Order** 버튼을 클릭하여 계정 선택기에서 새 주문을 생성할 수도 있습니다. 이것이 올바르게 작동하려면 [Open Carts page](../commerce-storefront-pages/pending-orders.md)이 있어야 합니다.

활성 주문이 있는 경우 계정 선택기 프래그먼트는 계정 이름 바로 아래에 주문 번호와 상태를 표시합니다. 활성 워크플로우가 있는 경우 **초안** 상태로 주문이 생성됩니다.

![새 주문을 만들거나 계정 간에 전환하려면 계정 선택기를 엽니다.](./using-the-account-selector-fragment/images/03.gif)

## 관련 주제

[카탈로그](../commerce-storefront-pages/catalog.md)

[주문을 보류](../commerce-storefront-pages/pending-orders.md)

[점검](../commerce-storefront-pages/checkout.md)
