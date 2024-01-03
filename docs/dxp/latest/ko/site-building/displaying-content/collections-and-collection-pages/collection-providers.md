# 컬렉션 제공자

컬렉션 공급자는 페이지에 표시할 항목을 컬렉션으로 그룹화합니다. 여러 가지가 기본적으로 사용 가능하거나 정보 프레임워크를 사용하여 항목을 필요한 컬렉션으로 그룹화하여 생성할 수 있습니다.

```{note}
_items_라는 용어는 제품, 카테고리 등 콘텐츠 이상의 의미를 가질 수 있으며 현재 사이트 또는 Liferay 인스턴스 외부에 사이트
할 수 있습니다.
```

## 기본 컬렉션 공급자

다음 컬렉션 공급자는 기본적으로 사용 가능하며 동일한 이름을 가진 위젯과 동일하게 작동합니다.

* 가장 많이 본 자산: 현재 사이트에서 가장 많이 본 자산을 가장 많이 본 자산부터 가장 적게 본 자산 순으로 표시합니다.
* 최고 등급 자산: 최고 등급 자산부터 최저 등급 순으로 표시됩니다.
* 최근 콘텐츠: 최근 수정된 자산을 가장 최근 항목부터 가장 최근 항목 순으로 표시합니다.

![When configuring a collection display fragment, you can choose collection providers such as Most Viewed Assets, Highest Rated Assets, and Recent Content.](./collection-providers/images/01.png)

일부 컬렉션 공급자는 Liferay의 애플리케이션에 의해 자동으로 생성됩니다. 예를 들어,

* 객체가 게시되면 Liferay는 해당 객체에 대한 컬렉션 공급자를 만듭니다. 자세한 내용은 [개체에 대한 컬렉션 공급자 사용](../../../building-applications/objects/displaying-object-entries.md#using-the-collection-provider-for-objects) 참조하세요.
* [Liferay DXP] 검색 청사진이 게시되면 Liferay는 이에 대한 컬렉션 공급자를 생성합니다. 자세한 내용은 [검색 블루프린트](../../../using-search/liferay-enterprise-search/search-experiences/search-blueprints/collections-with-search-blueprints.md) 을 사용한 컬렉션]을 참조하세요.

## 관련 항목 콜렉션 제공자

관련 항목 컬렉션 공급자는 표시되는 주요 항목과 관련된 항목 목록을 표시합니다. 다음 두 가지 방법으로 이러한 컬렉션 공급자에 액세스할 수 있습니다.

1. 디스플레이 페이지에 컬렉션 디스플레이 조각을 추가합니다.

1. 콘텐츠 페이지의 컬렉션 표시 조각 내에 컬렉션을 중첩합니다.

![When configuring a collection display fragment, you can choose Related Items collection providers.](./collection-providers/images/02.png)

**관련 자산:** 전시된 주요 품목과 관련된 품목을 표시합니다.

**이 항목의 카테고리:** 현재 항목 또는 자산의 카테고리를 표시합니다.

**동일한 어휘에 카테고리가 있는 항목:** 보고 있는 주요 자산과 동일한 어휘에 있는 항목을 표시합니다. 예를 들어, 기본 자산에 _football_ 카테고리가 있고 _football_이 _sports_ 어휘의 일부인 경우 _sports_ 어휘 아래의 다른 모든 카테고리가 표시됩니다.

**동일 카테고리의 항목:** 현재 보고 있는 기본 항목과 동일한 카테고리의 항목을 표시합니다. 예를 들어 기본 항목에 _축구_ 카테고리가 있으면 동일한 카테고리의 항목이 나타납니다. _고급 규칙_에서 _동일한 어휘의 모든 카테고리_ 또는 _특정 카테고리_를 선택하여 결과를 더욱 세분화할 수 있습니다.

![Items with the Same Categories requires you to choose an item type.](./collection-providers/images/04.png)

**관계에 있는 개체:** (개체를 볼 때) 보고 있는 개체와 관계가 있는 다른 개체를 표시합니다. 기본 개체가 갖는 모든 관계에 대해 새로운 관련 항목 컬렉션 공급자가 나타납니다. 예를 들어, 기본 개체가 _국가_이고 _도시_ 개체(하나의 국가에 매핑된 많은 도시 포함)와의 일대다 [가](../../../building-applications/objects/creating-and-managing-objects/relationships/defining-object-relationships.md) 인 경우 해당 국가 항목과 관련된 모든 도시 개체 항목이 표시됩니다.

### 동일한 카테고리의 품목에 대한 고급 규칙

유형에 따라 필터링하면서 표시된 항목을 더욱 세분화할 수 있습니다.

![When configuring the Items with the Same Categories provider, you can choose advanced rules from the drop-down.](./collection-providers/images/03.png)

**동일 어휘의 모든 카테고리:** 주요 자산과 동일한 어휘의 카테고리가 있는 모든 항목을 표시합니다. 예를 들어, 주 자산에 _football_ 카테고리가 있는 경우 _스포츠_ 어휘의 다른 모든 항목이 표시됩니다.

**특정 카테고리:** 목록을 더욱 구체화하기 위해 추가 카테고리의 결과를 표시합니다. 예를 들어, _속보_라는 추가 카테고리를 추가하여 _축구_ 카테고리의 자산을 표시하고 축구 속보와 일치하는 자산을 표시하는 _속보_를 표시할 수 있습니다.

```{tip}
기본적으로 상위 카테고리를 선택하면 해당 하위 카테고리가 자동으로 선택됩니다. 이는 제어판의 *인스턴스 설정*에서 변경할 수 있습니다.
```
