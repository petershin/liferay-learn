# 컬렉션 공급자를 사용하여 개체 항목 표시

{bdg-secondary}`liferay 7.4 U77+/GA77+`

객체 정의를 게시하면 Liferay는 이에 대해 [컬렉션 공급자](../../site-building/displaying-content/collections-and-collection-pages/collection-providers.md) 생성합니다. [컬렉션 표시 조각](../../site-building/displaying-content/collections-and-collection-pages/displaying-collections.md#adding-a-collection-display-fragment-to-a-page) 및 [컬렉션 페이지](../../site-building/displaying-content/collections-and-collection-pages/displaying-collections.md#displaying-collections-on-a-collection-page) 과 함께 이 공급자를 사용하여 해당 항목을 표시할 수 있습니다. 개체는 필터링, 스타일 지정, 표시 옵션을 포함한 모든 컬렉션 표시 기능을 지원합니다.

## 개체의 컬렉션 공급자 사용

1. 새 [콘텐츠 페이지](../../site-building/creating-pages/using-content-pages.md) 또는 [표시 페이지 템플릿을 만듭니다](../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md) . 또는 기존 항목 편집( ![Edit Button](../../images/icon-edit-pencil.png) )을 시작합니다.

   ```{note}
   컬렉션 공급자를 사용하여 컬렉션 페이지를 만들 수도 있습니다. 자세한 내용은 [컬렉션 및 컬렉션 페이지](../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md) 을 참조하세요.
   ```

1. 조각 및 위젯(![조각 및 위젯](../../images/icon-plus.png)) 사이드바에서 **컬렉션 표시** 조각을 페이지나 템플릿으로 끌어서 놓습니다.

1. **컬렉션 표시 조각** 을 선택하여 구성 옵션에 액세스하고 일반 탭에서 **컬렉션 선택** 을 클릭하세요.

   ![Select the fragment and click Select Collection.](../objects/displaying-object-entries-with-collection-providers/images/01.png)

1. 모달 창에서 **컬렉션 공급자** 탭을 클릭하고 **객체 공급자** 를 선택합니다.

   ![In the Collection Providers tab, select the object's provider.](./displaying-object-entries-with-collection-providers/images/02.png)

1. (선택 사항) 표시된 개체 항목을 필터링합니다. 개체의 선택 목록이나 부울 필드를 기준으로 필터링할 수 있습니다.

**컬렉션 옵션**(![컬렉션 옵션 버튼](../../images/icon-actions.png))을 클릭하고 **컬렉션 필터링** 을 선택합니다.

   ![Click the Collection Options button and select Filter Collection.](./displaying-object-entries-with-collection-providers/images/03.png)

   그런 다음 원하는 **필터** 를 선택하고 **적용** 을 클릭하세요.

   ![Select the Filters to apply.](./displaying-object-entries-with-collection-providers/images/04.png)

원하는 공급자를 선택한 후 추가 조각 옵션을 사용하여 **목록 스타일** 및 **페이지 매기기** 를 포함한 개체 항목이 표시되는 방식을 결정합니다.

## 조각을 개체 필드에 매핑

컬렉션 표시 조각에 대한 개체를 선택하면 해당 개체가 매핑 소스로 설정됩니다. 이제 조각을 추가하고 해당 [하위 요소](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md) 개체 필드에 매핑하여 개별 개체 항목에 대한 유연한 페이지 표시를 만들 수 있습니다. 컬렉션 페이지에도 마찬가지입니다.

예를 들어 개체에 매핑된 컬렉션 표시 조각에 버튼을 포함시킨 다음 컬렉션의 각 항목 이름을 표시하도록 버튼의 링크를 구성할 수 있습니다.

![Map fragment sub-elements in Collection Display fragments to object fields.](./displaying-object-entries-with-collection-providers/images/05.png)

## 관련 개체 필드에 조각 매핑

```{important}
조각 요소를 관련 개체 필드에 매핑하는 것은 릴리스 기능 플래그 뒤에 있습니다. 자세한 내용은 [릴리스 기능 플래그](../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) 을 읽어보세요.
```

매핑된 객체가 [일대다 관계](./creating-and-managing-objects/relationships/defining-object-relationships.md) 의 하위 측에 있는 경우 조각 요소를 상위 객체의 필드에 매핑할 수 있습니다. 포함된 컬렉션 표시 조각은 고유한 [관련 항목 컬렉션 공급자](../../site-building/displaying-content/collections-and-collection-pages/collection-providers.md#related-items-collections-providers) 사용하여 새 컬렉션을 구성합니다.

예를 들어 'City' 개체(하위)가 'Country' 개체(상위)와 관련된 경우 조각을 'Country' 개체의 필드에 매핑할 수 있습니다.

조각을 관련 객체의 필드에 매핑하려면,

1. 컬렉션 표시 조각과 함께 개체의 컬렉션 공급자를 사용합니다.

1. 초기 컬렉션 디스플레이 내에 다른 컬렉션 디스플레이 조각을 포함합니다.

   ```{tip}
   페이지 편집 메뉴의 *브라우저* 탭을 사용하면 페이지 계층 구조 내에서 조각을 보다 정확하게 배치하는 데 도움이 될 수 있습니다.
   ```
   ![Use the Browser tab to help properly embed the Collection Display fragment.](./displaying-object-entries-with-collection-providers/images/06.png)

1. 새 컬렉션 표시 조각의 구성 옵션에서 **컬렉션 선택** 을 클릭하세요.

1. **관련 항목 컬렉션 공급자** 탭을 클릭합니다.

1. 개체 관계의 이름으로 컬렉션 공급자를 선택합니다. 연관된 개체 유형이 관계 이름 아래에 나타납니다. 이 예에서는 관계를 '국가 내 도시'라고 합니다.

   ![Select the relationship that you created with between the displayed object and another object type.](./displaying-object-entries-with-collection-providers/images/07.png)

이제 새 컬렉션 표시에 조각을 포함하고 관련 개체의 필드에 매핑할 수 있습니다.

![Map fragment sub-elements to fields in parent objects.](./displaying-object-entries-with-collection-providers/images/08.png)

## 관련 주제

* [객체 생성](./creating-and-managing-objects/creating-objects.md) 
* [개체 전체 표시](./displaying-object-entries.md) 
* [컬렉션 및 컬렉션 페이지 정보](../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md) 
* [컬렉션 제공자](../../site-building/displaying-content/collections-and-collection-pages/collection-providers.md) 
* [개체 관계 정의](./creating-and-managing-objects/relationships/defining-object-relationships.md) 
