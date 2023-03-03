# 페이지에서 컬렉션 필터링

사이트에서 컬렉션을 보는 사용자의 경험을 개선하기 위해 페이지 조각을 추가하여 해당 컬렉션의 콘텐츠를 필터링할 수 있습니다. 예를 들어 키워드를 사용하여 표시된 컬렉션 콘텐츠를 검색하고 필터링하는 데 사용할 수 있는 조각을 추가할 수 있습니다.

사용자가 표시된 컬렉션의 콘텐츠를 필터링하는 데 도움이 되도록 페이지에 추가할 수 있는 두 개의 페이지 조각( [컬렉션 필터 조각](#using-the-collection-filter-fragment) 및 [적용된 필터 조각](#using-the-applied-filters-fragment) )이 있습니다.

## 컬렉션 필터 조각 사용

컬렉션 필터 조각은 페이지에서 선택한 컬렉션에 표시되는 콘텐츠를 필터링하는 데 사용됩니다. 사용자는 키워드를 검색하거나 범주를 선택하여 필터 조각과 연결된 컬렉션을 필터링할 수 있습니다.

다음 단계에 따라 페이지에 컬렉션 필터 조각을 추가하고 구성합니다(이미 [컬렉션 표시 조각](./displaying-collections.md#configuring-a-collection-display-fragment) 에 컬렉션을 표시하고 있음).

1. 페이지를 편집하는 동안 페이지의 아무 곳에나 Collection Filter Fragment를 추가하십시오.

1. 조각의 *일반* 구성에서 원하는 컬렉션을 선택합니다. 컬렉션이 적용되려면 페이지의 컬렉션 표시 조각에 컬렉션이 표시되어야 합니다.

    ![컬렉션 표시 조각에 이미 표시된 컬렉션을 사용하도록 조각을 구성합니다.](./filtering-collections-on-a-page/images/01.png)

    호환되는 컬렉션을 선택하면 *필터* 드롭다운 메뉴가 나타납니다.

1. Filter 메뉴를 사용하여 Fragment에 대한 필터 유형( *Keywords* 또는 *Category*)을 선택합니다.

    ```{note}
    사용자 지정 컬렉션 필터를 추가하여 모듈이 배포된 경우( [`FragmentCollectionFilter`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/fragment/fragment-collection-filter- api/src/main/java/com/liferay/fragment/collection/filter/FragmentCollectionFilter.java) 및 [`InfoFilter`](https://github.com/liferay/liferay-portal/blob/master/modules/apps /info/info-api/src/main/java/com/liferay/info/filter/InfoFilter.java) 인터페이스) 목록에서 이러한 필터를 선택할 수도 있습니다.
    ```

    *키워드* 필터 유형을 선택하면 사용자는 컬렉션을 필터링할 키워드를 검색할 수 있습니다. *카테고리* 필터 유형을 선택하면 *소스* 입력 필드가 나타나 사용자가 선택할 수 있는 카테고리 선택을 구성합니다.

1. 카테고리 필터 유형을 선택한 경우 소스 입력 필드를 클릭하고 팝업 대화 상자를 사용하여 사용자가 선택할 카테고리 소스를 선택하십시오.

    ![원하는 범주 선택이 포함된 어휘 또는 범주를 선택합니다.](./filtering-collections-on-a-page/images/02.png)

1. 클릭 *이 레벨 선택* 원하는 카테고리를 포함하는 어휘 또는 상위 카테고리 *를 선택했을 때*.

1. 페이지를 게시합니다.

컬렉션 필터 조각의 동작은 구성한 키워드 또는 카테고리 필터 유형에 따라 달라집니다.

키워드 유형을 선택한 경우 컬렉션 필터 조각이 검색 표시줄로 나타납니다. 사용자는 키워드를 입력하여 페이지에 표시된 컬렉션을 해당 키워드가 포함된 콘텐츠로 필터링할 수 있습니다.

![키워드 필터 유형은 사용자가 필터링할 키워드를 입력할 수 있는 검색 표시줄을 제공합니다.](./filtering-collections-on-a-page/images/03.png)

범주 유형을 선택한 경우 조각이 선택할 수 있는 모든 범주를 나열하는 메뉴로 나타납니다. 사용자는 이러한 범주를 얼마든지 선택하고 적용하여 컬렉션을 해당 범주의 콘텐츠로 필터링할 수 있습니다.

![범주 필터 유형은 사용자가 활성화하고 필터로 적용할 수 있는 범주 목록을 제공합니다.](./filtering-collections-on-a-page/images/04.png)

## 적용된 필터 조각 사용

Applied Filters Fragment는 [Collection Filter Fragment](#using-the-collection-filter-fragment) 에 적용된 필터 목록을 보는 데 사용됩니다.

다음 단계에 따라 적용된 필터 조각을 페이지(이미 구성된 컬렉션 필터 조각이 있음)에 추가합니다.

1. 페이지를 편집하는 동안 페이지의 아무 곳에나 Applied Filter Fragment를 추가합니다.

1. Applied Filter Fragment의 *General* 구성에서 원하는 Collection을 선택합니다. 동일한 컬렉션이 페이지에 표시되고 [컬렉션 필터 단편](#using-the-collection-filter-fragment) 로 구성되어야 합니다.

1. 페이지를 게시합니다.

이제 사용자가 컬렉션 필터 조각으로 콘텐츠를 필터링하면 적용된 필터 조각에 현재 구성된 컬렉션에 적용되는 필터 목록이 표시됩니다. 사용자는 나열된 각 필터에서 *X* 버튼을 클릭하여 필터를 제거할 수도 있습니다.

![적용된 필터 조각에는 구성된 컬렉션에 현재 적용된 모든 필터가 표시됩니다.](./filtering-collections-on-a-page/images/05.png)

## 추가 정보

* [컬렉션 표시](./displaying-collections.md)
