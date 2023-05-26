# 페이지에서 컬렉션 필터링

사이트에서 컬렉션을 보는 사용자의 경험을 개선하기 위해 페이지 조각을 추가하여 해당 컬렉션의 콘텐츠를 필터링할 수 있습니다. 예를 들어 키워드를 사용하여 표시된 컬렉션 콘텐츠를 검색하고 필터링하는 데 사용할 수 있는 조각을 추가할 수 있습니다.

사용자가 표시된 컬렉션의 콘텐츠를 필터링하는 데 도움이 되도록 페이지에 추가할 수 있는 두 개의 페이지 조각( [컬렉션 필터 조각](#using-the-collection-filter-fragment) 및 [적용된 필터 조각](#using-the-applied-filters-fragment) 이 있습니다.

## 컬렉션 필터 조각 사용

컬렉션 필터 조각은 페이지에서 선택한 컬렉션에 표시되는 콘텐츠를 필터링하는 데 사용됩니다. 사용자는 키워드를 검색하거나 범주 및 태그를 선택하여 필터 조각과 연결된 컬렉션을 필터링할 수 있습니다.

다음 단계에 따라 페이지에 컬렉션 필터 조각을 추가하고 구성합니다(이미 [컬렉션 표시 조각](./displaying-collections.md#configuring-a-collection-display-fragment) 에 컬렉션을 표시하고 있음).

1. 페이지를 편집하는 동안 페이지의 아무 곳에나 Collection Filter Fragment를 추가하십시오.

1. 조각의 **일반** 구성에서 원하는 컬렉션을 선택합니다. 컬렉션이 적용되려면 페이지의 컬렉션 표시 조각에 컬렉션이 표시되어야 합니다.

    ![컬렉션 표시 조각에 이미 표시된 컬렉션을 사용하도록 조각을 구성합니다.](./filtering-collections-on-a-page/images/01.png)

    호환되는 컬렉션을 선택하면 **필터** 드롭다운 메뉴가 나타납니다.

1. 필터 메뉴를 사용하여 **키워드** , **카테고리** 또는 **태그** 필터를 선택합니다.

    ```{note}
    맞춤 컬렉션 필터를 추가하는 모듈이 배포된 경우( [`FragmentCollectionFilter`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/fragment/fragment-collection-filter-api/src/main/java/com/liferay/fragment/collection/filter/FragmentCollectionFilter.java) 및 [`InfoFilter`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/info/info-api/src/main/java/com/liferay/info/filter/InfoFilter.java) 인터페이스) 목록에서 이러한 필터를 선택할 수도 있습니다.
    ```

컬렉션 필터 조각의 동작은 키워드, 범주 또는 태그 필터 유형을 구성했는지 여부에 따라 변경됩니다.

### 키워드로 필터링

 키워드를 선택하면 컬렉션 필터 조각이 검색 표시줄로 나타나며 여기서 사용자는 키워드를 입력하여 표시된 컬렉션 콘텐츠를 필터링할 수 있습니다.

![키워드 필터 유형은 사용자가 필터링할 키워드를 입력할 수 있는 검색 표시줄을 제공합니다.](./filtering-collections-on-a-page/images/03.png)

### 범주별 필터링

범주를 선택하면 소스 입력 필드를 사용하여 사용자가 선택할 수 있는 범주를 구성할 수 있습니다.

![원하는 범주 선택이 포함된 어휘 또는 범주를 선택합니다.](./filtering-collections-on-a-page/images/02.png)

1. 원하는 카테고리가 포함된 어휘 또는 상위 카테고리를 선택했으면 **이 수준 선택** 을 클릭합니다.

2. 페이지를 게시합니다.

범주 필터를 구성한 후 컬렉션 필터 조각에 범주 메뉴가 표시됩니다. 사용자는 하나 이상의 범주를 선택하여 컬렉션의 표시 콘텐츠를 필터링할 수 있습니다.

![범주 필터 유형은 사용자가 활성화하고 필터로 적용할 수 있는 범주 목록을 제공합니다.](./filtering-collections-on-a-page/images/04.png)

### 태그로 필터링

태그가 선택되면 사용자는 제공된 필드에 입력하고 선택할 수 있는 기존 태그를 보여주는 드롭다운을 볼 수 있습니다.

![태그 필터 유형은 사용 가능한 태그를 표시하는 자동 완성 기능이 있는 검색 표시줄을 제공합니다.](./filtering-collections-on-a-page/images/06.png)

## 적용된 필터 조각 사용

Applied Filters Fragment는 [Collection Filter Fragment](#using-the-collection-filter-fragment) 에 적용된 필터 목록을 보는 데 사용됩니다.

다음 단계에 따라 적용된 필터 조각을 페이지(이미 구성된 컬렉션 필터 조각이 있음)에 추가합니다.

1. 페이지를 편집하는 동안 페이지의 아무 곳에나 Applied Filter Fragment를 추가합니다.

1. Applied Filter Fragment의 **General** 구성에서 원하는 Collection을 선택합니다. 동일한 컬렉션이 페이지에 표시되고 [컬렉션 필터 단편](#using-the-collection-filter-fragment) 로 구성되어야 합니다.

1. 페이지를 게시합니다.

이제 사용자가 컬렉션 필터 조각으로 콘텐츠를 필터링하면 적용된 필터 조각에 현재 구성된 컬렉션에 적용되는 필터 목록이 표시됩니다. 사용자는 나열된 각 필터에서 **X** 버튼을 클릭하여 필터를 제거할 수도 있습니다.

![적용된 필터 조각에는 구성된 컬렉션에 현재 적용된 모든 필터가 표시됩니다.](./filtering-collections-on-a-page/images/05.png)

## 관련 주제

* [컬렉션 표시](./displaying-collections.md)
