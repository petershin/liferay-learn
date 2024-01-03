# 컬렉션 개인화

{bdg-secondary}`liferay 포털 7.3 GA6 / DXP 7.3+`

기본적으로 모든 사용자는 컬렉션의 모든 콘텐츠를 볼 수 있으며 누구나 맞춤화된 변형의 일부입니다. 그러나 [세그먼트](../segmentation/creating-and-managing-user-segments.md) 사용하여 컬렉션 항목의 개인화된 변형을 생성할 수 있습니다. 개인화된 변형을 사용하는 경우 컬렉션의 일부인 항목은 변경되지 않지만 컬렉션 페이지, 컬렉션 표시 조각 또는 자산 표시 위젯에는 세그먼트에 대해 필터링된 항목이 표시됩니다.

```{important}
세그먼트를 사용하여 컬렉션을 사용자 정의하고 컬렉션에 대한 개인화된 변형을 설정하려면 먼저 세그먼트를 정의해야 합니다. 자세한 내용은 [사용자 세그먼트 생성 및 관리](../segmentation/creating-and-managing-user-segments.md) 참조하세요.
```

![Collections are available for anyone, by default](./personalizing-collections/images/01.png)

다음 예를 고려하십시오. 등록된 사용자에게 독점 프로모션을 제공하여 온라인 주방용품 매장의 매출을 늘리고 싶습니다. 등록된 사용자를 위한 프로모션과 제품에 대한 뉴스를 포함하는 컬렉션을 만듭니다. 모든 사용자가 귀하의 제품에 대한 뉴스를 볼 수 있기를 원하지만 프로모션은 등록된 사용자로 제한하려고 합니다. 이 예에서는 등록된 사용자를 위한 새 세그먼트를 생성하고 프로모션 콘텐츠를 필터링하는 새로운 개인화된 변형에 세그먼트를 연결할 수 있습니다.

```{tip}
컬렉션에 대해 여러 개인화된 변형을 만들고 필요에 따라 편집하거나 삭제합니다. 누구나 개인화된 변형을 편집할 수도 있지만 삭제할 수는 없습니다.
```

## 맞춤형 변형 만들기

사용자를 위해 [세그먼트](../segmentation/creating-and-managing-user-segments.md) 생성한 후 해당 세그먼트를 기반으로 컬렉션에 대한 개인화된 변형을 추가할 수 있습니다.

1. _사이트 메뉴_( ![사이트 메뉴](../../../images/icon-applications-menu.png) )를 열고 _사이트 빌더_ &rarr; _컬렉션_으로 이동합니다.

1. [컬렉션](../../../site-building/displaying-content/collections-and-collection-pages/creating-collections.md) 생성하거나 기존 컬렉션을 선택하세요.

1. _맞춤 변형 추가_를 클릭하세요.

   이미 개인화된 변형이 있고 사용 가능한 다른 세그먼트가 있는 경우 _추가_(![추가 아이콘](../../../images/icon-add-app.png)를 클릭하여 새로운 개인화된 변형을 추가하세요. )) 맞춤 변형 옆에 있습니다.

1. 세그먼트를 선택하고 그에 따라 컬렉션을 맞춤설정하세요.

이제 모든 세그먼트의 컬렉션 항목을 결합하는 [또는](#combining-collection-entries-from-all-segments) [개인화된 변형 우선순위를 지정하여 사용자가 볼 수 있는 내용을 제어할 수 있습니다](#personalizing-collections) .

## 변형 우선순위 지정

{bdg-secondary}`Liferay DXP 7.4+용`

사용자가 여러 세그먼트에 속할 수 있는 상황에서는 사용자가 속한 모든 세그먼트의 컬렉션 항목 [을 결합](#combining-collection-entries-from-all-segments) 개인화된 변형의 우선순위를 지정하여 사용자에게 표시되는 개인화된 변형을 결정할 수 있습니다.

컬렉션을 편집할 때 개인화된 변형에 대한 정렬 가능한 목록에 액세스하고 해당 _작업_ 버튼( ![작업 버튼](../../../images/icon-actions.png)을 클릭하여 변형 순위를 변경합니다. ) ) _우선순위_ 또는 _우선순위 해제_를 선택합니다. 대안을 끌어서 놓아 우선순위를 재정렬할 수도 있습니다.

```{note}
목록에 있는 각 항목의 사이트
에 따라 우선순위가 지정됩니다. 가장 높은 우선순위는 목록의 맨 위에 있는 사이트
입니다.
```

![Prioritize collections variations to determine which variation is displayed for users](./personalizing-collections/images/02.png)

## 모든 세그먼트의 컬렉션 항목 결합

여러 [세그먼트](../segmentation/creating-and-managing-user-segments.md) 에 속한 사용자의 경우 기본 항목 또는 우선 순위가 지정된 [우선순위](#prioritizing-variations) 개인화된 변형만 표시하는 대신 자신이 속한 모든 세그먼트의 컬렉션 항목을 결합하고 표시할 수 있습니다.

1. _글로벌 메뉴_( ![응용 프로그램 메뉴 아이콘](../../../images/icon-applications-menu.png) )를 열고 구성에서 _제어판_ 탭 &rarr; _시스템 설정_을 선택합니다.

1. 콘텐츠 및 데이터에서 _자산_을 선택합니다.

1. 시스템 범위에서 _컬렉션_을 선택합니다.

1. 동적 및 수동 컬렉션 기능을 활성화합니다.

1. _저장_을 클릭하세요.

![Enable the feature to combine assets from all segments in asset publisher for dynamic and manual collections.](./personalizing-collections/images/03.png)

여러 세그먼트에 속한 사용자는 이제 모든 세그먼트의 콘텐츠를 볼 수 있습니다.

예를 들어 등록된 사용자, 브라질 사용자 및 캐나다 사용자라는 세 가지 세그먼트가 있습니다. 등록된 사용자인 경우 해당 세그먼트에 대해 선택된 콘텐츠만 볼 수 있습니다. 브라질 및 캐나다 사용자에게도 동일하게 적용됩니다. 그러나 브라질에 거주하는 등록 사용자인 경우 두 세그먼트 모두에 대해 선택된 콘텐츠를 볼 수 있습니다. 어떤 세그먼트에도 속하지 않은 경우 콘텐츠가 모든 사람으로 설정된 것으로 표시됩니다.

![Users that belong to multiple segments can see content from all segments](./personalizing-collections/images/04.png)

## liferay DXP 7.2

### 콘텐츠 세트 개인화

이제 [세그먼트](../segmentation/creating-and-managing-user-segments.md) 사용하여 콘텐츠 세트 개인화를 보여드리겠습니다. 이 예에서는 홈 페이지에 표시되는 기본값으로 설정된 콘텐츠를 만듭니다. 그런 다음 이를 수정하여 American Engineers 세그먼트 회원을 위한 기술 기사가 포함된 개인화된 변형을 만듭니다.

콘텐츠 세트에 익숙하지 않은 경우 여기에서 시작하기 전에 [콘텐츠 세트 만들기](../../../site-building/displaying-content/collections-and-collection-pages/creating-collections.md#creating-content-sets) 문서를 참조하세요.

#### 기본 콘텐츠 세트 생성 및 설정

먼저 기본 콘텐츠 세트를 생성하고 자산 게시자를 사용하여 홈 페이지에서 구성합니다.

1. _사이트 메뉴_( ![사이트 메뉴](../../../images/icon-applications-menu.png) )를 열고 _콘텐츠 및 데이터_ &rarr; _콘텐츠 세트_로 이동합니다.

1. _추가_( ![추가](../../../images/icon-add.png) )를 클릭하고 _수동 선택_을 선택합니다.

1. 이름을 _홈 페이지 콘텐츠_로 지정합니다.

1. 새 콘텐츠 세트의 경우 자산 항목 옆에 있는 _선택_을 클릭하고 _기본 웹 콘텐츠_를 선택합니다.

   ![Click Select to add a new asset entry.](./personalizing-collections/images/05.png)

1. 기본 웹 콘텐츠 선택 페이지에서 추가하려는 콘텐츠를 선택하고 _추가_를 클릭하세요.

1. 홈 페이지로 이동하여 페이지에 Asset Publisher 위젯을 추가합니다.

1. 자산 게시자의 _구성_을 엽니다.

1. 자산 선택에서 _콘텐츠 세트_를 선택합니다.

1. 콘텐츠 세트 선택에서 _선택_을 클릭하고 _홈 페이지 콘텐츠_를 선택한 다음 _저장_을 클릭합니다.

이제 구성한 콘텐츠 세트가 홈 페이지의 Asset Publisher 위젯에 나타납니다. 다음으로 개인화할 콘텐츠 세트를 구성합니다.

#### 콘텐츠 세트 개인화

이제 엔지니어를 위한 콘텐츠 세트를 생성하고 해당 디스플레이를 구성합니다.

1. 사이트 관리에서 설정된 콘텐츠로 돌아갑니다.

1. _New Personalized Variation_을 클릭하고 American Engineers 세그먼트를 선택하세요.

   ![Create a new personalized variation.](./personalizing-collections/images/06.png)

1. 자산 항목 옆에 있는 _선택_을 클릭하고 _기본 웹 콘텐츠_를 선택하세요.

1. 엔지니어링 독자에게 적합한 기사를 선택하고 _추가_를 클릭하세요.

이제 American Engineers 세그먼트의 구성원이 이 콘텐츠 세트가 표시되는 것을 볼 때마다 기본값이 아닌 개인화된 버전이 표시됩니다. 지금 시뮬레이터를 사용하여 테스트해 보세요.

## 관련 정보

* [콘텐츠 페이지 개인화](./content-page-personalization.md)
* [컬렉션 및 컬렉션 페이지 정보](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md)
* [사용자 세그먼트 생성](../segmentation/creating-and-managing-user-segments.md)
* [사용자 세그먼트에 역할 할당](../../../users-and-permissions/roles-and-permissions/assigning-roles-to-user-segments.md)
