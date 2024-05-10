# 개별 제품 카탈로그에 대한 별도의 카탈로그 페이지 생성

상점 첫화면에는 여러 카탈로그의 제품이 포함될 수 있습니다. Liferay는 제품을 카탈로그에 저장하고 **카탈로그 페이지** 을 사용하여 상점 첫 화면에 표시합니다. 자세한 내용은 [카탈로그 페이지 만들기](./creating-a-catalog-page.md) 을 참조하십시오. 서로 다른 카탈로그에는 서로 다른 종류의 제품이 포함될 수 있으므로 여러 카탈로그 페이지를 사용하여 제품을 구분할 수 있습니다.

이렇게 하려면 먼저 두 개 이상의 카탈로그와 하나 이상의 카탈로그 페이지가 있어야 합니다. 그런 다음 기존 카탈로그 페이지를 복제하고 두 페이지 모두에 [사용자 정의 필터 예](https://learn.liferay.com/w/dxp/using-search/search-pages-and-widgets/search-results/custom-filter-examples) 위젯을 추가하여 카탈로그 ID로 제품을 필터링합니다.

## 기존 카탈로그 페이지 복사

Liferay DXP 7.4 U22+ 및 GA22+에서 Miniium 사이트의 카탈로그 페이지를 복사하려면 먼저 인스턴스에 대해 개인 페이지 [페이지 이해](https://learn.liferay.com/w/dxp/site-building/creating-pages/understanding-pages/understanding-pages#enabling-private-pages) . 이전 버전을 사용 중인 경우 이 단계가 필요하지 않습니다.

1. 비공개 페이지가 활성화되면 **사이트 메뉴**(![Site Menu](../images/icon-product-menu.png))을 열고 **사이트 빌더** &rarr; **페이지** 로 이동합니다.

1. **비공개 페이지** 을 클릭합니다.

1. 카탈로그 페이지 옆에 있는 **3점 아이콘**(![3점 아이콘](../images/icon-actions.png))을 클릭하고 **페이지 복사** 를 선택합니다.

1. 새 카탈로그 페이지의 이름을 입력하고 **추가** 를 클릭합니다.

기존 카탈로그 페이지와 동일한 콘텐츠를 표시하는 새 페이지가 상점 첫화면에 나타납니다.

## 사용자 지정 필터 추가

사용자 정의 필터를 추가하기 전에 먼저 필터링하려는 카탈로그의 ID를 검색해야 합니다. 이렇게 하려면 **글로벌 메뉴**(![Applications Menu icon](../images/icon-applications-menu.png))을 열고 **상거래** &rarr; **카탈로그** 로 이동합니다. 카탈로그를 클릭하고 이름 옆에 있는 ID를 복사합니다.

![카탈로그 페이지에서 제품을 필터링하려면 카탈로그 ID를 복사하십시오.](./creating-separate-catalog-pages-for-individual-product-catalogs/images/01.png)

카탈로그 페이지로 돌아가기:

1. 상단 메뉴에서 **추가** 버튼을 클릭합니다.

1. **Widgets** 섹션에서 **Custom Filter** 위젯을 검색합니다.

   ```{important}
   콘텐츠 페이지를 사용하는 경우 두 가지 방법으로 위젯을 추가할 수 있습니다.
   1. 상단 메뉴에서 *편집* 버튼(![편집 버튼](../images/icon-edit-pencil.png))을 클릭하고 *추가*(![아이콘 추가](../images/icon- add.png)) 오른쪽에 있습니다. 나머지 단계는 위와 동일합니다.

   2. *사이트 메뉴*(![사이트 메뉴](../images/icon-product-menu.png))를 열고 *사이트 빌더* &rarr; *페이지*를 선택합니다. 원하는 페이지로 이동하고 *3점 아이콘* (![3점 아이콘](../images/icon-actions.png)) &rarr; *편집*을 클릭합니다. 나머지 단계는 위와 동일합니다.
   ```

1. 스토어프론트의 원하는 영역으로 위젯을 끌어다 놓습니다.

1. 위젯 위로 마우스를 이동하고 **3점 아이콘**(![3-dot icon](../images/icon-actions.png))을 클릭하고 **구성** 를 선택합니다.

1. 다음 정보를 입력하고 **저장** 을 클릭합니다.

   **필터 필드:** `commerceCatalogId`

   **필터 값:** `43445` (복사한 카탈로그 ID 입력)

   **필터 유형:** 일치

   **발생:** 필터

   ![사용자 지정 필터 위젯을 구성합니다.](./creating-separate-catalog-pages-for-individual-product-catalogs/images/02.png)

1. 사용자 지정 필터에서 **적용** 을 클릭하여 변경 사항을 적용합니다.

페이지에는 하나의 카탈로그에 있는 제품만 표시되어야 합니다. 다른 카탈로그 페이지의 다른 카탈로그에 대해 위의 단계를 반복합니다.

```{note}
사용자 지정 필터를 비활성화하고 *구성* 메뉴 내부의 확인란을 사용하여 변경할 수 없고 보이지 않게 할 수도 있습니다. 다양한 사용 사례에 사용자 지정 필터를 사용할 수 있습니다. 자세한 내용은 [사용자 정의 필터 예](https://learn.liferay.com/w/dxp/using-search/search-pages-and-widgets/search-results/custom-filter-examples) 를 참조하세요.
```

## 관련 주제

* [카탈로그 페이지 생성](./creating-a-catalog-page.md)
* [사용자 정의 필터 예](https://learn.liferay.com/w/dxp/using-search/search-pages-and-widgets/search-results/custom-filter-examples)
