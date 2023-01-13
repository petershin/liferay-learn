# 카탈로그 페이지 생성

[카탈로그](./commerce-storefront-pages/catalog.md) 페이지는 고객이 채널 제품을 탐색, 검색 및 선택하는 기본 방법입니다. 카탈로그 페이지에는 다음 위젯이 권장됩니다. _검색 표시줄_, _옵션 패싯_, _사양 패싯_, _범주 패싯_, _정렬_및 _검색 결과_. 이러한 위젯 및 기타 상거래 위젯에 대한 자세한 내용은 [위젯 참조](./liferay-commerce-widgets/widget-reference.md)을 참조하십시오.

이 기사는 [액셀러레이터](../starting-a-store/accelerators.md)을 사용하지 않고 카탈로그 페이지를 작성하는 방법의 예를 문서화합니다.

## 전제 조건

사이트 및 페이지 생성에 대한 자세한 내용은 다음 링크를 참조하십시오.

* [페이지 조각 만들기](https://help.liferay.com/hc/en-us/articles/360018171331-Creating-Page-Fragments)
* [단편에서 콘텐츠 페이지 구축](https://help.liferay.com/hc/en-us/articles/360018171351-Building-Content-Pages-from-Fragments-)
* [탐색 메뉴 생성 및 관리](https://help.liferay.com/hc/en-us/articles/360018171531-Creating-and-Managing-Navigation-Menus)
* [애플리케이션 표시 템플릿 사용](https://help.liferay.com/hc/en-us/articles/360017892632-Styling-Widgets-with-Application-Display-Templates)

## 페이지 추가 및 구성

1. _Widget_ 템플릿을 사용하여 페이지를 만듭니다.
1. _30-70 열_ 레이아웃이 기본 선택입니다. 이 레이아웃에는 검색을 구체화하는 위젯에 대해 더 좁은 왼쪽 열이 있고 _검색 결과_ 위젯에 대해 더 넓은 오른쪽 열이 있습니다. 매장 디자이너는 다양한 스타일에 대해 다양한 레이아웃을 선택할 수 있습니다.

## 페이지에 위젯 추가

1. 위젯을 원하는 위치로 끌어다 놓습니다.
1. 위젯 제목을 추가하거나 제거하려면 _점 3개 아이콘_ , _모양 및 느낌 구성_ 을 차례로 클릭합니다.

위젯을 사용하여 페이지를 만들고 구성한 후 기본 카탈로그 페이지는 다음과 같을 수 있습니다.

![빈 카탈로그 페이지](./creating-a-catalog-page/images/02.png)

## _검색 표시줄_ 위젯 구성

글로벌 사이트 범위의 데이터를 표시하려면 _검색 표시줄_ 위젯을 구성해야 합니다. 이는 모든 제품이 사이트 수준이 아닌 전역 수준에 저장되기 때문입니다.

1. Search Bar 위젯의 _Actions_ 버튼(![Actions Button](../images/icon-actions.png))을 클릭하고 _Configuration_를 선택합니다.

    ![검색 창 위젯의 작업 버튼을 클릭하고 구성을 선택합니다.](./creating-a-catalog-page/images/03.png)

1. 위젯의 범위를 _Everything_로 설정합니다.

    ![위젯의 범위를 모두로 설정합니다.](./creating-a-catalog-page/images/04.png)

1. _저장_을 클릭합니다.

이제 _검색 표시줄_ 위젯이 모든 채널 콘텐츠를 표시하도록 구성되었습니다.

## 검색 없이 전체 카탈로그 표시(선택 사항)

_검색 옵션_ 위젯을 사용하면 검색 쿼리 없이 모든 채널 제품을 표시하도록 _검색 결과_ 위젯을 구성할 수 있습니다. 이를 통해 고객은 채널에 표시되는 모든 제품을 쉽게 찾아보고 필터링할 수 있습니다.

1. _검색 옵션_ 위젯에서 _이 페이지에서 추가 검색 옵션 구성_ 을 클릭합니다.

1. _빈 검색 허용_확인란을 선택합니다.

1. _저장_을 클릭합니다.

1. _구성_ 창을 닫습니다.

이 옵션이 활성화되면 모든 채널 제품이 _검색 결과_ 위젯에 표시됩니다.

![활성화되면 모든 채널 제품이 검색 결과 위젯에 표시됩니다.](./creating-a-catalog-page/images/01.png)

기본적으로 제품은 모든 채널에서 볼 수 있습니다. 그러나 가시성은 특정 채널로 제한될 수 있습니다. 자세한 내용은 [채널을 사용하여 제품 가시성 구성](../store-management/channels/configuring-product-visibility-using-channels.md)을 참조하세요.