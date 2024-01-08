# 컬렉션 공급자를 사용하여 SKU를 옵션 값으로 정의

{bdg-secondary}`liferay DXP 2023.Q4+/포탈 7.4 GA98+`

제품에 대한 옵션을 구성할 때 하나 이상의 범주를 컬렉션 공급자로 지정할 수 있습니다. 이를 사용하여 SKU 그룹을 제품의 옵션 값으로 연결하여 고유한 사용자 정의 논리를 정의할 수 있습니다.

예를 들어 서로 관련이 없는 두 제품을 생각해 보세요. 이를 제품 옵션으로 추가하려면 카테고리를 생성하고 이를 두 제품에 연결한 다음 해당 카테고리를 새 제품의 컬렉션 공급자로 사용할 수 있습니다.

```{note}
제품에서 사용할 수 있도록 전역 범위에서 카테고리를 생성해야 합니다.
```

## 컬렉션 제공자로 카테고리 선택

카테고리 생성 및 이를 제품에 할당하는 방법에 대한 자세한 내용은 [새 제품 카테고리 생성](https://learn.liferay.com/w/commerce/product-management/creating-and-managing-products/products/creating-a-new-product-category) 및 [제품 카테고리로 카탈로그 구성](https://learn.liferay.com/w/commerce/product-management/creating-and-managing-products/products/organizing-your-catalog-with-product-categories) 을 참조하십시오.

카테고리를 생성하고 제품에 할당한 후에는

1. **글로벌 메뉴**(![애플리케이션 메뉴 아이콘](../../../images/icon-applications-menu.png))를 열고 **Commerce** &rarr; **제품** 으로 이동합니다.

1. 카테고리를 컬렉션 공급자로 추가하려는 제품을 찾아서 선택하세요.

1. **옵션** 탭을 클릭하세요.

1. 옵션 이름을 입력하고 **새로 만들기** 를 클릭합니다.

   ![Create a new option on the selected product.](./defining-skus-as-option-values-using-a-collection-provider/images/01.png)

   그러면 새 옵션이 생성되어 제품에 할당됩니다. 이제 새로운 옵션을 선택하세요. 또는 옵션 템플릿을 이미 생성한 경우 해당 템플릿을 선택합니다.

1. **외부 정의** 토글을 활성화합니다.

1. **가격 유형** 드롭다운을 **동적** 으로 설정합니다.

1. **저장** 을 클릭하세요.

   이렇게 하면 **가격 유형** 드롭다운 아래에 두 개의 새로운 드롭다운이 추가되어 컬렉션 공급자와 카테고리를 정의할 수 있습니다.

1. **카테고리별 SKU** 를 컬렉션 공급자로 선택하세요.

1. **저장** 을 클릭하세요.

1. 카테고리 드롭다운에서 하나 이상의 카테고리를 선택합니다.

    ![Choose the categories to add associated SKUs as option values.](./defining-skus-as-option-values-using-a-collection-provider/images/02.png)

1. **저장** 을 클릭하세요.

    이렇게 하면 선택한 카테고리로 SKU가 옵션 값으로 채워집니다.

```{important}
외부에서 옵션을 정의하기 전에 제품에 대해 하나의 활성 SKU가 있어야 합니다. 다중 SKU 제품은 현재 외부 옵션으로 추가할 수 없습니다.
```
