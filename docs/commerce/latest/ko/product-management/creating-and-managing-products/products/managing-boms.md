# BOM 관리

> 요구되는 기부금

재료 명세서(BOM) 다이어그램은 제품에 속하는 구성 요소 부품을 식별합니다. 사용자는 상점의 제품을 참조하는 Liferay Commerce에서 BOM 다이어그램을 만들고 주석을 달 수 있습니다. 그런 다음 사이트 페이지에 BOM 다이어그램을 표시할 수 있습니다.

BOM 다이어그램은 다이어그램과 매핑된 제품의 두 부분으로 구성됩니다.

```{important}
Liferay Commerce 4.0부터 BOM을 더 이상 사용할 수 없습니다. 보다 강력한 Shop by Diagram 기능으로 대체됩니다. 자세한 내용은 [다이어그램으로 쇼핑하기](../product-types/shop-by-diagram.md) 을 참조하십시오. 
```

## 새 BOM 다이어그램 추가

새 BOM 다이어그램을 추가하려면:

1. **글로벌 애플리케이션** 메뉴 &rarr; **상거래** &rarr; **BOM** 로 이동합니다.
1. 추가(![Add Icon](../../../images/icon-add.png))를 클릭한 다음 **정의 추가를 클릭합니다.** .
1. 클릭 **파일 선택** 또는 제품 이미지를 드래그 앤 드롭하세요.
1. 제품 이름을 입력합니다(일반 디젤 엔진).
1. **저장** 을 클릭합니다.

## BOM 다이어그램에 제품 매핑

이미지가 업로드되면 부품을 카탈로그의 제품에 매핑합니다.

1. **항목** 탭을 클릭합니다.

    ![항목을 보고 이미지에 매핑하려면 항목 탭을 클릭합니다.](./managing-boms/images/02.png)

2. 오른쪽의 **매핑된 제품** 창에는 모든 하위 부품이 나열됩니다. 사용자가 다이어그램 위로 마우스를 가져가면 더하기 기호가 나타납니다.

    ![더하기 기호를 클릭하여 새 제품을 BOM에 매핑할 수 있습니다.](./managing-boms/images/03.png)

3. 제품과 관련된 다이어그램 부분을 클릭하십시오(예: **Fuel Injector 1**).

4. 다음 정보를 입력하십시오.

    * **Number** : 1 (매핑된 상품 리스트의 숫자순)
    * **제품** : MIN59999 (제품명 또는 SKU)

      ```{tip}
      텍스트 자동 완성은 제품 이름을 입력할 때 제안 사항을 표시합니다.
      ```

    ![BOM 다이어그램에서 제품 연결을 시작합니다.](./managing-boms/images/04.png)

5. **저장** 을 클릭합니다.

나머지 제품을 계속 추가합니다. 동일한 제품이 둘 이상인 경우에도 각 항목에는 매핑된 제품 목록에 고유한 숫자 식별자가 있어야 합니다. 이 예에는 두 개의 연료 인젝터가 있으며 둘 다 고유한 제품 매핑 번호가 있습니다.

![BOM 다이어그램에서 제품 연결을 계속합니다.](./managing-boms/images/05.png)

## 사이트 페이지에 BOM 표시

상거래 BOM 위젯은 BOM 다이어그램을 표시하는 데 사용됩니다.

1. 원하는 상점 사이트 페이지로 이동하여 BOM 위젯을 추가하십시오. BOM 위젯은 생성된 모든 BOM 및 폴더를 표시합니다.

    ![사이트 페이지에 BOM 위젯을 배포합니다.](./managing-boms/images/06.png)

1. BOM 위젯에서 BOM 썸네일을 클릭하여 BOM 정의를 선택합니다.

    ![상거래 BOM 위젯에 다이어그램이 표시됩니다.](./managing-boms/images/07.png)

BOM 위젯에 다이어그램이 표시됩니다.

## BOM 폴더 추가

폴더를 생성하여 상점의 BOM을 그룹화하고 구성할 수 있습니다.

폴더를 추가하려면:

1. 추가(![Add Icon](../../../images/icon-add.png))를 클릭한 다음 **폴더 추가를 클릭합니다.** .
1. 다음을 입력:
    * **Name** : 폴더명(자동차부품)
1. **저장** 을 클릭합니다.

## 상거래 2.1 이하

### 새 BOM 다이어그램 추가

새 BOM 다이어그램을 추가하려면:

1. **제어판** &rarr; **상거래** &rarr; **제품** 로 이동합니다.
1. **BOM** 을 클릭합니다.

    ![BOM 관리 메뉴](./managing-boms/images/01.png)

1. 추가(![Add Icon](../../../images/icon-add.png))를 클릭한 다음 **정의 추가를 클릭합니다.** .
1. 클릭 **파일 선택** 또는 제품 이미지를 드래그 앤 드롭하세요.
1. 제품 이름을 입력합니다(일반 디젤 엔진).
1. **저장** 을 클릭합니다.

### BOM 다이어그램에 제품 매핑

1. **항목** 탭을 클릭합니다.

    ![BOM 항목 탭](./managing-boms/images/02.png)

1. 오른쪽의 **매핑된 제품** 창에는 모든 하위 부품이 나열됩니다. 사용자가 다이어그램 위로 마우스를 가져가면 더하기 기호가 나타납니다.

    ![BOM 항목 탭](./managing-boms/images/03.png)

1. 제품과 관련된 다이어그램 부분을 클릭하십시오(예: **Fuel Injector 1**).

1. 다음을 입력:

    * **Number** : 1 (매핑된 상품 리스트의 숫자순)
    * **제품** : MIN59999 (제품명 또는 SKU)

      ```{tip}
      텍스트 자동 완성은 제품 이름을 입력할 때 제안을 표시합니다.
      ```

    ![BOM 다이어그램에서 제품 연결을 시작합니다.](./managing-boms/images/04.png)

1. **저장** 을 클릭합니다.

나머지 제품을 계속 추가합니다. 동일한 제품이 둘 이상인 경우에도 각 항목에는 매핑된 제품 목록에 고유한 숫자 식별자가 있어야 합니다. 이 예에는 두 개의 연료 인젝터가 있으며 둘 다 고유한 제품 매핑 번호가 있습니다.

![BOM 다이어그램에서 제품 연결을 계속합니다.](./managing-boms/images/05.png)

### BOM 표시

상거래 BOM 위젯은 BOM 다이어그램을 표시하는 데 사용됩니다.

1. 원하는 상점 사이트 페이지로 이동하여 BOM 위젯을 추가하십시오. BOM 위젯은 생성된 모든 BOM 및 폴더를 표시합니다.

    ![사이트 페이지에 BOM 위젯을 배포합니다.](./managing-boms/images/06.png)

1. BOM 위젯에서 BOM 썸네일을 클릭하여 BOM 정의를 선택합니다.

    ![상거래 BOM 위젯에 다이어그램이 표시됩니다.](./managing-boms/images/07.png)

BOM 위젯에 다이어그램이 표시됩니다.

### BOM 폴더 추가

폴더를 생성하여 상점의 BOM을 그룹화하고 구성할 수 있습니다.

폴더를 추가하려면:

1. 추가(![Add Icon](../../../images/icon-add.png))를 클릭한 다음 **폴더 추가를 클릭합니다**.
1. 다음을 입력:
    * **Name** : 폴더명(자동차부품)
1. **저장** 을 클릭합니다.

## 관련 주제

* [제품 변형에 대한 SKU 만들기](./creating-skus-for-product-variants.md)
* [사이트에 페이지 추가](https://learn.liferay.com/w/dxp/site-building/creating-pages/adding-pages/adding-a-page-to-a-site)
* [페이지에 위젯 추가](https://learn.liferay.com/w/dxp/site-building/creating-pages/using-widget-pages/adding-widgets-to-a-page)
