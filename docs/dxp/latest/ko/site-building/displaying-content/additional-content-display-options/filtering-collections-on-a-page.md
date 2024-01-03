# 페이지에서 컬렉션 필터링

사이트에서 컬렉션을 보는 사용자의 경험을 향상시키려면 페이지 조각을 추가하여 해당 컬렉션의 콘텐츠를 필터링할 수 있습니다. 예를 들어 키워드를 사용하여 표시된 컬렉션 콘텐츠를 검색하고 필터링하는 데 사용할 수 있는 조각을 추가할 수 있습니다.

사용자가 표시된 컬렉션의 콘텐츠를 필터링하는 데 도움이 되도록 페이지에 추가할 수 있는 두 가지 페이지 조각이 있습니다. [컬렉션 필터 조각](#using-the-collection-filter-fragment) 및 [적용된 필터 조각](#using-the-applied-filters-fragment) .

## 컬렉션 필터 조각 사용

컬렉션 필터 조각은 페이지에서 선택한 컬렉션에 표시되는 콘텐츠를 필터링하는 데 사용됩니다. 사용자는 키워드를 검색하거나 카테고리 및 태그를 선택하여 필터 조각과 관련된 컬렉션을 필터링할 수 있습니다.

페이지에 컬렉션 필터 조각을 추가하고 구성하려면 다음 단계를 따르세요(이미 [컬렉션 표시 조각](../collections-and-collection-pages/displaying-collections.md#configuring-a-collection-display-fragment) 에 컬렉션을 표시하고 있음).

1. 페이지를 편집하는 동안 페이지의 아무 곳에나 컬렉션 필터 조각을 추가하세요.

1. 조각의 _일반_ 구성에서 원하는 컬렉션을 선택합니다. 컬렉션이 효과를 가지려면 페이지의 컬렉션 표시 조각에 표시되어야 합니다.

   ![Configure the Fragment to use a Collection that is already displayed in a Collection Display Fragment.](./filtering-collections-on-a-page/images/01.png)

   _필터_ 드롭다운 메뉴는 호환 가능한 컬렉션을 선택하면 나타납니다.

1. 필터 메뉴를 사용하여 _키워드_, _카테고리_ 또는 _태그_ 필터를 선택하세요.

    ```{note}
    사용자 정의 컬렉션 필터를 추가하는 모듈이 배포된 경우( [`FragmentCollectionFilter`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/fragment/fragment-collection-filter-api/src/main/java/com/liferay/fragment/collection/filter/FragmentCollectionFilter.java) 및 [`InfoFilter`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/info/info-api/src/main/java/com/liferay/info/filter/InfoFilter.java) 인터페이스 구현) 목록에서 이러한 필터를 선택할 수도 있습니다.
    ```

컬렉션 필터 조각의 동작은 키워드, 범주 또는 태그 필터 유형을 구성했는지 여부에 따라 변경됩니다.

```{note}
컬렉션 표시 조각에 사용되는 컬렉션 필터 조각은 오브젝트 컬렉션 공급자 또는 블루프린트 컬렉션 공급자에 매핑된 경우에만 작동합니다. 
```

### 키워드로 필터링

키워드를 선택하면 컬렉션 필터 조각이 검색 표시줄로 나타나며, 여기에서 사용자는 키워드를 입력하여 표시된 컬렉션 콘텐츠를 필터링할 수 있습니다.

![The Keywords filter type presents a search bar to users to enter keywords to filter by.](./filtering-collections-on-a-page/images/03.png)

### 카테고리별 필터링

카테고리를 선택하면 소스 입력 필드를 사용하여 사용자가 선택할 수 있는 카테고리를 구성할 수 있습니다.

![Select the vocabulary or category that contains the desired category selection.](./filtering-collections-on-a-page/images/02.png)

1. 원하는 카테고리가 포함된 어휘 또는 상위 카테고리를 선택했으면 _이 레벨 선택_을 클릭하세요.

1. 페이지를 게시합니다.

범주 필터를 구성한 후 컬렉션 필터 조각에 범주 메뉴가 표시됩니다. 사용자는 하나 이상의 범주를 선택하여 컬렉션의 표시된 콘텐츠를 필터링할 수 있습니다.

![The Category filter type presents a list of categories for Users to enable and apply as a filter.](./filtering-collections-on-a-page/images/04.png)

### 태그로 필터링

태그를 선택하면 사용자는 제공된 필드에 입력할 수 있으며 선택할 수 있는 기존 태그를 표시하는 드롭다운을 볼 수 있습니다.

![The Tags filter type presents a search bar with autocomplete that displays available tags.](./filtering-collections-on-a-page/images/06.png)

## 적용된 필터 조각 사용

적용된 필터 조각은 [컬렉션 필터 조각](#using-the-collection-filter-fragment) 에 적용된 필터 목록을 보는 데 사용됩니다.

페이지(이미 컬렉션 필터 조각이 구성되어 있음)에 적용된 필터 조각을 추가하려면 다음 단계를 따르세요.

1. 페이지를 편집하는 동안 페이지의 아무 곳에나 적용된 필터 조각을 추가하세요.

1. 적용된 필터 조각의 _일반_ 구성에서 원하는 컬렉션을 선택합니다. 동일한 컬렉션이 페이지에 표시되어야 하며 [컬렉션 필터 조각](#using-the-collection-filter-fragment) 로 구성되어야 합니다.

1. 페이지를 게시합니다.

이제 사용자가 컬렉션 필터 조각으로 콘텐츠를 필터링하면 적용된 필터 조각에 현재 구성된 컬렉션에 적용되는 필터 목록이 표시됩니다. 사용자는 나열된 각 필터에서 _X_ 버튼을 클릭하여 필터를 제거할 수도 있습니다.

![The Applied Filters Fragment shows all filters currently applied to the configured Collection.](./filtering-collections-on-a-page/images/05.png)

## 관련 주제

* [컬렉션 표시](../collections-and-collection-pages/displaying-collections.md)
