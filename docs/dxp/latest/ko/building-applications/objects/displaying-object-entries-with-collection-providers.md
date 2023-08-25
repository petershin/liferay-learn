# 컬렉션 공급자가 있는 개체 항목 표시

{bdg-secondary}`사용 가능 7.4 이상`

개체를 게시하면 Liferay는 여러 개체 항목을 표시하기 위해 [컬렉션 디스플레이 조각(](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md#adding-a-collection-display-fragment-to-a-page) )과 함께 사용할 [컬렉션 공급자(](../../content-authoring-and-management/collections-and-collection-pages/collection-providers.md) )를 생성합니다. 그런 다음 컬렉션 표시 조각을 사용하여 특정 객체 유형을 표시하고, 조각의 필터링, 스타일 및 표시 옵션을 사용하고, 다른 조각을 삽입하여 나열된 각 객체 항목에 표시할 정보를 사용자 지정할 수 있습니다. [컬렉션 페이지](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md#displaying-collections-on-a-collection-page)를 사용하여 개체 컬렉션을 표시할 수도 있습니다.

## 조각 필드를 객체 필드에 매핑하기

컬렉션 디스플레이 조각 내에서 개체를 선택하면 해당 개체가 조각의 매핑 소스로 설정됩니다. 이제 조각 필드를 개체 필드에 매핑하여 개별 개체 항목에 대한 유연한 페이지 표시를 만들 수 있습니다. 헤더, 버튼 등과 같은 많은 기본 컴포넌트 조각은 해당 필드를 매핑 소스로 설정된 객체에 매핑할 수 있습니다. 해당 객체 유형과 연결된 컬렉션 페이지에 있는 경우에도 동일한 방식으로 작동합니다.

예를 들어 객체에 매핑된 컬렉션 표시 조각에 버튼을 임베드한 다음 컬렉션의 각 항목 이름을 표시하도록 버튼의 링크를 구성할 수 있습니다.

![매핑된 컬렉션 디스플레이 조각에 포함된 경우 많은 기본 컴포넌트 유형을 객체 필드에 매핑할 수 있습니다.](./displaying-object-entries-with-collection-providers/images/01.png)

## 관련 객체의 필드 매핑

{bdg-secondary}`7.4 U77 및 GA77+ 사용 가능`

```{important}
조각의 필드를 주 객체와 관련된 객체에 매핑하는 것은 현재 릴리스 기능 플래그 뒤에 있습니다. 자세한 내용은 [릴리스 기능 플래그](../../시스템-관리/설정-라이프레이/기능-플래그.md#릴리스-기능-플래그)를 참조하세요.
```

매핑된 객체가 다른 객체와 [일대다 관계](./creating-and-managing-objects/relationships/defining-object-relationships.md) (표시된 객체에 하나의 관련 객체가 있는 경우)인 경우 관련 객체의 필드에서 정보를 표시할 수도 있습니다.

예를 들어, 관련 `Country` 개체가 있는 `City` 개체에 대한 컬렉션 공급자가 있는 경우 `Country` 필드를 선택하여 임베디드 조각에 표시할 수 있습니다. 다음은 `도시의 국가`라는 관계의 예입니다:

![조각이 객체와 연결된 경우 객체의 필드 또는 단일 관련 객체가 있는 경우 해당 관련 객체의 필드를 표시할 수 있습니다.](./displaying-object-entries-with-collection-providers/images/02.png)

```{note}
동일한 관계에 다른 개체 항목이 여러 개 있는 경우 이와 같이 관련 개체 항목의 정보를 표시할 수 없습니다.
```

## 객체에 컬렉션 공급자 사용

객체를 게시한 후 다음 단계에 따라 컬렉션 표시 조각을 사용하여 객체의 항목을 표시합니다:

1. 새 [콘텐츠 페이지](../../site-building/creating-pages/using-content-pages.md) 또는 [디스플레이 페이지 템플릿](../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md)을 만듭니다. 또는 편집을 시작( ![편집 버튼](../../images/icon-edit-pencil.png) )를 기존 항목에 추가합니다.

   ```{note}
   컬렉션 공급업체를 사용하여 컬렉션 페이지를 만들 수도 있습니다. 자세한 내용은 [컬렉션 및 컬렉션 페이지](../../콘텐츠 저작 및 관리/컬렉션 및 컬렉션 페이지/정보-컬렉션 및 컬렉션 페이지.md)를 참조하세요.
   ```

1. 조각 및 위젯(![Fragments and Widgets](../../images/icon-plus.png)) 사이드바에서 *컬렉션 표시* 조각을 페이지 또는 템플릿으로 끌어다 놓습니다.

1. *컬렉션 디스플레이 조각* 을 선택하여 구성 옵션에 액세스하고 일반 탭에서 *컬렉션 선택* 을 클릭합니다.

   ![조각을 선택하고 컬렉션 선택을 클릭합니다.](../objects/displaying-object-entries-with-collection-providers/images/03.png)

1. 모달 창에서 *수집 공급자* 탭을 클릭하고 *개체의 공급자*를 선택합니다.

   ![컬렉션 공급자 탭에서 객체의 공급자를 선택합니다.](./displaying-object-entries-with-collection-providers/images/04.png)

1. (선택 사항) 표시된 개체 항목을 필터링합니다. 개체의 모든 선택 목록 또는 부울 필드를 기준으로 필터링할 수 있습니다:

   *컬렉션 옵션* (![Collection Options Button](../../images/icon-actions.png))을 클릭하고 *필터 컬렉션*을 선택합니다.

   ![컬렉션 옵션 버튼을 클릭하고 컬렉션 필터링을 선택합니다.](./displaying-object-entries-with-collection-providers/images/05.png)

   그런 다음 원하는 *필터* 를 선택하고 *적용*을 클릭합니다.

   ![적용할 필터를 선택합니다.](./displaying-object-entries-with-collection-providers/images/06.png)

원하는 공급자를 선택한 후 *목록 스타일* 및 *페이지 매김*을 포함한 추가 조각 옵션을 사용하여 객체 항목이 표시되는 방식을 결정합니다.

## 관련 개체 정보 표시

{bdg-secondary}`7.4 U77 및 GA77+ 사용 가능`

개체가 다른 개체와 [관계가 있는 경우](./creating-and-managing-objects/relationships/defining-object-relationships.md), 중첩된 컬렉션 표시 조각을 사용하여 해당 관계에 있는 관련 개체를 표시할 수도 있습니다. 임베디드 컬렉션 디스플레이 조각은 고유한 [관련 항목 컬렉션 공급자](../../content-authoring-and-management/collections-and-collection-pages/collection-providers.md#related-items-collections-providers) 를 사용하여 새 컬렉션을 구성합니다.

```{important}
관련 항목 컬렉션 공급자와 함께 관련 객체를 표시하는 것은 현재 릴리스 기능 플래그 뒤에 있습니다. 자세한 내용은 [릴리스 기능 플래그](../../시스템-관리/설정-라이프레이/기능-플래그.md#릴리스-기능-플래그)를 참조하세요.
```

관련 객체가 포함된 객체 데이터를 만들었으면 다음 단계를 따르세요:

1. [컬렉션 공급자를 사용하여 객체 컬렉션을 표시합니다.](#using-the-collection-provider-for-objects)

1. 기존 조각의 컬렉션에 있는 항목 아래에 다른 컬렉션 디스플레이 조각을 삽입합니다.

   ```{tip}
   페이지 편집 메뉴에서 *브라우저* 탭을 선택하고 새 컬렉션 표시 요소를 드래그하여 계층 구조의 컬렉션 항목 아래에 더 정확하게 임베드할 수 있습니다.
   ```

   ![브라우저 탭을 사용하여 컬렉션 디스플레이 조각을 올바르게 임베드할 수 있습니다.](./displaying-object-entries-with-collection-providers/images/07.png)

1. *새 컬렉션 디스플레이 조각의 구성 옵션에서 컬렉션* 을 선택합니다.

1. *관련 항목 수집 제공업체* 탭을 클릭합니다.

1. 개체 관계의 이름으로 컬렉션 공급자를 선택합니다. 연결된 개체 유형은 관계의 이름 아래에 표시됩니다.

   ![표시된 객체와 다른 객체 유형 간에 생성한 관계를 선택합니다.](./displaying-object-entries-with-collection-providers/images/08.png)

최상위 컬렉션 표시 조각의 각 항목에 대해 이제 새 조각이 선택한 관계에 있는 모든 개체를 나열합니다. 조각의 옵션을 사용하거나 조각을 더 추가하여 표시 방법을 표시합니다.

## 관련 주제

* [개체 만들기](./creating-and-managing-objects/creating-objects.md)
* [개체 전체 표시](./displaying-object-entries.md)
* [컬렉션 및 컬렉션 페이지 정보](../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)
* [컬렉션 제공자](../../content-authoring-and-management/collections-and-collection-pages/collection-providers.md)
* [개체 관계 정의하기](./creating-and-managing-objects/relationships/defining-object-relationships.md)
