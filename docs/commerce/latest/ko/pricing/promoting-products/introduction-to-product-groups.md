# 제품군 소개

제품 그룹은 대상 할인 또는 가격 책정에 사용할 수 있는 정적 제품 그룹입니다. 제품 그룹은 다음 두 가지 시나리오에 이상적입니다.

1. 단일 카테고리에 속하지 않는 제품이 있고 특정 고객에 대해 가격이 다르게 책정되기를 원하는 경우.

1. 단일 카테고리에 속하지 않는 제품이 있고 특정 고객에게 다르게 할인을 제공하려는 경우.

```{note}
제품 그룹은 제품이 구매자에게 그룹화되거나 표시되는 방식을 변경하지 않으며 관리 목적으로 사용됩니다. 
```

## 제품 그룹 생성

1. 애플리케이션 메뉴 ![애플리케이션 메뉴](../../images/icon-applications-menu.png)를 열고 **Commerce** &rarr; **Product Groups** 로 이동합니다.

1. **추가**(![추가](../../images/icon-add.png))를 클릭하고 제품 그룹의 이름과 설명을 입력하세요.

   ![Enter details for the product group.](./introduction-to-product-groups/images/01.png)

1. **제출** 을 클릭하세요.

이렇게 하면 제품 그룹이 생성됩니다.

## 제품 그룹에 제품 추가

제품 그룹이 생성되면 해당 그룹에 제품을 추가해야 합니다. 아래에서 두 개의 제품을 선택하고 제품 그룹에 추가하면 타겟 가격이나 할인에 사용할 수 있습니다.

1. **제품 추가** 검색창을 사용하여 추가하려는 제품을 찾으세요. 입력한 내용에 따라 옵션이 자동으로 나타납니다.

   ![Search for products to be added to the product group.](./introduction-to-product-groups/images/02.png)

1. 선택한 제품 옆에 있는 **선택** 을 클릭하여 그룹에 추가하세요.

이제 이 제품 그룹을 가격표 또는 할인에 연결할 수 있습니다.

```{note}
제품 그룹에 제품을 추가하는 것 외에도 제품 그룹을 제품에 연결할 수도 있습니다. 이렇게 하려면 제품 목록에서 원하는 제품을 선택하고 제품 그룹 탭을 선택한 후 생성한 제품 그룹을 검색하세요. 원하는 제품 그룹 옆에 있는 *선택*을 클릭하면 제품 그룹과 해당 제품이 연결됩니다.
```

## 제품 그룹에 할인 연결

1. 애플리케이션 메뉴 &rarr; **Commerce** 탭을 클릭하고 **Pricing** &rarr; **Discounts** 로 이동하세요.

1. **추가**(![추가](../../images/icon-add.png))를 클릭하고 다음 정보를 입력합니다.

   **Name** : 예시상품군 할인

   **Type** : 백분율

   **적용 대상** : 제품 그룹

   ![Enter details for a Discount.](./introduction-to-product-groups/images/03.png)

1. **제출** 을 클릭하세요.

   이렇게 하면 새 할인이 생성되고 제품 그룹에 적용될 수 있습니다.

   할인 세부정보 페이지에서 유형을 변경하고, 금액을 추가하고, 할인 활성 상태와 수준을 설정할 수 있습니다. 자세한 내용은 [할인 소개](./introduction-to-discounts.md) 읽어보세요. 할인이 생성되면 앞서 생성한 제품 그룹에 연결해야 합니다.

1. 할인 세부정보 페이지에서 제품 그룹 선택 섹션까지 아래로 스크롤합니다.

   ![Search for the product group to be added to the Discount.](./introduction-to-product-groups/images/04.png)

1. 앞서 생성한 제품 그룹의 이름을 입력하세요. 입력한 내용에 따라 결과가 자동으로 채워집니다.

1. 제품 그룹 옆에 있는 **선택** 을 클릭하세요. 추가한 후 **게시** 를 클릭하여 제품 그룹에 대한 할인을 활성화하세요.

카탈로그의 제품을 확인하여 할인을 확인하여 확인할 수 있습니다.

![The discount is applied to the product in the product group.](./introduction-to-product-groups/images/05.png)

## 가격표를 제품 그룹에 연결

가격표를 제품 그룹에 연결하려면 먼저 가격표를 생성한 다음 생성한 제품 그룹을 대상으로 하는 가격 수정자를 생성해야 합니다.

1. 애플리케이션 메뉴 ![애플리케이션 메뉴](../../images/icon-applications-menu.png), &rarr; **Commerce** 탭을 열고 **Pricing** &rarr; **Price Lists** 로 이동합니다.

1. **추가**(![추가](../../images/icon-add.png))를 클릭하고 가격표의 이름, 카탈로그 및 통화를 입력하세요.

   ![Configure the price list.](./introduction-to-product-groups/images/06.png)

1. 완료되면 **제출** 을 클릭하세요.

1. 가격 수정자 섹션에서 **추가**(![추가](../../images/icon-add.png))를 클릭하고 다음 정보를 입력하세요.

   **Name** : 바퀴 수정자

   **Target** : 제품그룹

   **Modifier** : 백분율/대체/고정 금액

   ![Configure the price modifier.](./introduction-to-product-groups/images/07.png)

1. 완료되면 **제출** 을 클릭하세요.

   ![Detailed configuration view of the price modifier.](./introduction-to-product-groups/images/08.png)

   이렇게 하면 가격 수정자가 생성되고 이를 구성할 수 있는 더 자세한 보기가 열립니다.

    ```{note}
    가격 수정자에 언급된 금액은 할인으로 간주되지 않습니다. 예를 들어 백분율 수정자를 선택하고 금액을 10으로 설정하면 제품 가격이 10% 인상됩니다. 가격을 낮추려면 음수 비율을 사용하세요.
    ```

    ```{important}
    동일한 제품을 대상으로 하는 가격표가 두 개 있는 경우 변경 사항을 적용하려면 우선 순위가 더 높은 새 가격표를 생성해야 합니다.
    ```

   ![Search for the product group to be added to the price modifier.](./introduction-to-product-groups/images/09.png)

1. 제품 그룹 섹션에서 생성한 제품 그룹을 검색하세요. 입력한 내용에 따라 결과가 자동으로 채워집니다.

1. 제품 그룹 옆에 있는 **선택** 을 클릭하세요. 추가한 후 **게시** 를 클릭하여 제품 그룹의 가격표를 활성화하세요.

카탈로그에서 제품을 확인하여 업데이트된 가격을 확인하여 이를 확인할 수 있습니다.

![The price modifier is applied to the product in the product group.](./introduction-to-product-groups/images/10.png)

할인 또는 가격표가 상품 그룹에 연결되어 있는지 확인하려면 **애플리케이션 메뉴** ![애플리케이션 메뉴](../../images/icon-applications-menu.png)를 클릭하고 **커머스** 탭을 클릭한 후 이동하세요. **가격** &rarr; **제품 그룹** 으로. 가격표 및 할인 아래에서 관련 엔터티를 볼 수 있습니다.

## 관련 주제

* [할인 소개](./introduction-to-discounts.md)
* [가격 소개](../introduction-to-pricing.md)
* [가격표 생성](../creating-a-price-list.md)
* [가격 목록에 제품 추가](../adding-products-to-a-price-list.md)
