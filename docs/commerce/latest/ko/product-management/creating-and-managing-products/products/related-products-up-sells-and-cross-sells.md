# 관련 제품, 상향 판매 및 교차 판매

제품 관계는 제품을 연결하는 데 사용할 수 있습니다. 제품이 연결되면 다른 제품에 대한 링크가 표시됩니다. 모든 관련 제품은 제품 관계 유형에 지정되어야 합니다. 그러면 해당 유형의 데이터를 소싱하도록 구성된 제품 게시자 위젯에서 이러한 제품을 표시할 수 있습니다.

하나 이상의 제품 게시자 위젯이 제품 세부 사항 페이지에 있는 경우 여러 관련 제품 세트가 표시될 수 있습니다. 예를 들어, 한 위젯은 페이지에 소개된 제품의 대안인 제품 세트를 표시하고 다른 위젯은 추천 제품의 액세서리인 제품을 표시할 수 있습니다.

참고: 액셀러레이터를 사용하여 사이트를 구축한 경우 여러 제품 관계 유형이 이미 마련되어 있습니다. 다음은 기본 제품 관계 목록입니다.

* **상향 판매** : 추천 상품과 비슷하지만 판매 가치가 더 높은 상품을 표시합니다.
* **예비** : 해당 제품의 예비 부품 또는 구성 요소인 제품을 표시합니다.
* **관련** : 포괄적인 세트.
* **액세서리** : 해당 제품과 함께 사용할 수 있는 추가 제품을 표시합니다.
* **교차 판매** : 추천 제품을 보완하는 제품을 표시합니다.

![제품 관계: 브레이크 로터 및 유체](./related-products-up-sells-and-cross-sells/images/05.png)

위 이미지에서 하단의 제품 게시자 위젯에 두 개의 관련 제품이 표시됩니다. 다른 유형의 제품 관계로 구성된 제품 게시자 위젯을 더 추가할 수 있는 옵션이 있습니다.

## 새 제품 관계 유형 추가

필요에 따라 제품 관계 유형을 추가할 수 있습니다. 여기에는 보증과 같은 무형 제품이 포함됩니다. 새 제품 관계를 추가하려면:

1. **글로벌 애플리케이션** 메뉴 → **제어판** → **시스템 설정** 으로 이동합니다.
1. **Commerce** 섹션에서 **Catalog** 을 클릭합니다.
1. 왼쪽 메뉴에서 **Product Relations** 을 클릭합니다.
1. **추가** 버튼을 클릭합니다.
1. **유형** 필드: 보증에 새 제품 관계를 입력하십시오.
1. **저장** 을 클릭합니다.

    ![새로운 제품 관계 생성](./related-products-up-sells-and-cross-sells/images/01.png)

새 제품 관계 유형이 추가되었습니다.

## 제품 간 관계 생성

1. **글로벌 애플리케이션** 메뉴 → **커머스** → **상품** 로 이동합니다.
1. 제품을 선택하십시오. 예: **브레이크 패드** .
1. **제품 관계** 하위 탭을 클릭합니다.
1. 왼쪽 메뉴에서 **관련 항목** 을 클릭합니다.

    ![관련 메뉴](./related-products-up-sells-and-cross-sells/images/02.png)

1. 하나 이상의 관계를 추가하려면 (+) 버튼을 클릭합니다. 이 예에서는 **Brake Rotors** 및 **Brake Fluid** 을 선택합니다.
1. **추가** 을 클릭합니다.

    ![두 개의 제품 추가](./related-products-up-sells-and-cross-sells/images/04.png)

이 두 제품은 이제 **브레이크 패드** 와 연결됩니다. 이 관계는 단방향입니다. 즉, **Brake Pads** 를 볼 때 새로운 제품 관계가 표시되지만 **Brake Rotors** 또는 **Brake Fluid** 제품을 볼 때 **Brake Pads** 는 관련 제품으로 나열되지 **않습니다** .

제품 관계가 생성되면 관계를 표시하도록 제품 게시자 위젯을 구성합니다.

## 제품 관계 표시

제품 게시자 위젯을 구성하여 제품 표시 페이지에 제품 관계를 표시할 수 있습니다. 먼저 [개의 제품 표시 페이지](https://help.liferay.com/hc/ko/articles/360017870292-Displaying-Product-Pages-) 이 있어야 합니다.

1. 제품을 검색합니다(예: **Brake Pads**).
1. 제품 세부 정보를 보려면 **브레이크 패드** 을 클릭하십시오.
1. 페이지 하단으로 스크롤하여 **제품 게시자** 위젯에 나열된 관련 제품을 봅니다.

   ![구성 메뉴](./related-products-up-sells-and-cross-sells/images/06.png)

1. **3점** 아이콘(옵션) → **구성** 을 클릭합니다.
1. **데이터 소스** 드롭다운 메뉴에서 **제품 관계 관련** 을 선택합니다.

    ![데이터 소스 선택](./related-products-up-sells-and-cross-sells/images/03.png)

1. **저장** 을 클릭하고 대화 상자를 닫습니다.

    ![제품 관계: 브레이크 로터 및 유체](./related-products-up-sells-and-cross-sells/images/05.png)

위의 예는 고객이 잠재적으로 유용할 수 있는 전체 범위의 제품을 볼 수 있도록 서로 다른 제품이 어떻게 관련될 수 있는지 보여줍니다.

## 상거래 2.1 이하

### 새 제품 관계 유형 추가

필요에 따라 더 많은 제품 관계 유형을 추가할 수 있습니다. 여기에는 보증과 같은 무형 자산이 포함됩니다. 새 제품 관계를 추가하려면:

1. **제어판** → **구성** → **시스템 설정** 로 이동합니다.
1. **Commerce** 섹션에서 **Catalog** 을 클릭합니다.
1. 왼쪽 메뉴에서 **Product Relations** 을 클릭합니다.
1. **추가** 버튼을 클릭합니다.
1. **유형** 필드: 보증에 새 제품 관계를 입력하십시오.
1. **저장** 을 클릭합니다.

    ![새로운 제품 관계 생성](./related-products-up-sells-and-cross-sells/images/01.png)

새 제품 관계 유형이 추가되었습니다.

### 제품 간 관계 생성

1. **제어판** 메뉴 → **커머스** → **상품** 로 이동합니다.
1. 제품을 선택하십시오. 예: **브레이크 패드** .
1. **제품 관계** 하위 탭을 클릭합니다.
1. 왼쪽 메뉴에서 **관련 항목** 을 클릭합니다.

    ![관련 메뉴](./related-products-up-sells-and-cross-sells/images/02.png)

1. 하나 이상의 관계를 추가하려면 (+) 버튼을 클릭합니다. 이 예에서는 **Brake Rotors** 및 **Brake Fluid** 을 선택합니다.
1. **추가** 을 클릭합니다.

    ![두 개의 제품 추가](./related-products-up-sells-and-cross-sells/images/04.png)

이 두 제품은 이제 **브레이크 패드** 와 연결됩니다. 이 관계는 단방향입니다. 즉, **Brake Pads** 를 볼 때 새로운 제품 관계가 표시되지만 **Brake Rotors** 또는 **Brake Fluid** 제품을 볼 때 **Brake Pads** 는 관련 제품으로 나열되지 **않습니다** .

제품 관계가 생성되면 관계를 표시하도록 제품 게시자 위젯을 구성합니다.

### 제품 관계 표시

제품 게시자 위젯을 구성하여 제품 표시 페이지에 제품 관계를 표시할 수 있습니다. 먼저 [개의 제품 표시 페이지](https://help.liferay.com/hc/ko/articles/360017870292-Displaying-Product-Pages-) 이 있어야 합니다.

1. 제품을 검색합니다(예: **Brake Pads**).
1. 제품 세부 정보를 보려면 **브레이크 패드** 을 클릭하십시오.
1. 페이지 하단으로 스크롤하여 **제품 게시자** 위젯에 나열된 관련 제품을 봅니다.

   ![구성 메뉴](./related-products-up-sells-and-cross-sells/images/06.png)

1. **3점** 아이콘(옵션) → **구성** 을 클릭합니다.
1. **데이터 소스** 드롭다운 메뉴에서 **제품 관계 관련** 을 선택합니다.

    ![데이터 소스 선택](./related-products-up-sells-and-cross-sells/images/03.png)

1. **저장** 을 클릭하고 대화 상자를 닫습니다.

    ![제품 관계: 브레이크 로터 및 유체](./related-products-up-sells-and-cross-sells/images/05.png)

위의 예는 고객이 잠재적으로 유용할 수 있는 전체 범위의 제품을 볼 수 있도록 서로 다른 제품이 어떻게 관련될 수 있는지 보여줍니다.
