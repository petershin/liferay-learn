# 콘텐츠 추천 이해

사용자가 귀하의 웹사이트를 방문하면 귀하의 콘텐츠와 상호작용하고 관심분야에 따라 다양한 행동을 보입니다. Liferay DXP는 [애널리틱 클라우드](https://learn.liferay.com/w/analytics-cloud/index) 와 함께 이러한 탐색 행동을 분석하고 사용자에게 관련 콘텐츠를 표시할 수 있습니다. 이는 사용자가 구매하거나 소비할 가능성이 더 높은 특정 제품이나 콘텐츠를 홍보하는 데 유용할 수 있습니다. 예를 들어 사용자가 온라인 상점을 방문하고 특정 유형의 제품에 관심을 보이면 콘텐츠 추천을 사용하여 사용자에게 유사한 제품이나 관련 제품 프로모션을 표시할 수 있습니다.

```{important}
사용자에게 콘텐츠 추천을 제공하려면 [Liferay DXP를 Analytics Cloud에 연결](https://learn.liferay.com/ko/w/analytics-cloud/getting-started/connecting-liferay-dxp-to-analytics-cloud) 연결해야 합니다.
```

## 콘텐츠 추천의 작동 방식

콘텐츠 추천 구성은 2단계 프로세스입니다. 먼저, 사용자의 행동을 추적하고 관심 주제를 정의합니다. 이 단계를 수행하려면 DXP 인스턴스 [Liferay DXP를 Analytics Cloud에 연결](https://learn.liferay.com/ko/w/analytics-cloud/getting-started/connecting-liferay-dxp-to-analytics-cloud) 필요합니다. Analytics Cloud는 사이트에서의 이전 사용자 행동을 기반으로 관심 있는 주제를 정의하고 순위를 매기고 이러한 관심 사항을 사이트의 사용자 식별자와 연결합니다. 둘째, 사용자의 관심분야에 따라 추천 콘텐츠를 표시합니다. 이 단계에서는 [동적 컬렉션](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md) 생성하고 이 컬렉션을 웹 사이트에 표시해야 합니다. Analytics Cloud는 사용자의 관심 분야를 기반으로 일련의 키워드를 DXP에 전송하며, 이러한 키워드는 컬렉션에서 필터 역할을 합니다. 사용자에게 표시하려는 콘텐츠 유형을 정의하려면 컬렉션이 필요합니다.

```{note}
Analytics Cloud에서 Interest를 사용하는 방법에 대한 자세한 내용은 [세그먼트](https://learn.liferay.com/w/analytics-cloud/people/segments/segments) 참조하십시오.
```

![Interests view in Liferay Analytics Cloud](./understanding-content-recommendations/images/01.png)

Analytics Cloud는 타일, 설명, [카테고리](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) 또는 [태그](../../../content-authoring-and-management/tags-and-categories/tagging-content-and-managing-tags.md) 과 같은 다양한 콘텐츠 요소를 기반으로 관심사를 생성합니다. 콘텐츠 추천을 생성하기 위해 콘텐츠에 카테고리 및 태그를 추가하는 것이 꼭 필요한 것은 아닙니다. 그러나 콘텐츠를 분류하고 태그를 지정하면 Analytics Cloud는 사용자의 관심사를 정의하기 위한 더 많은 정보를 갖고 더 나은 권장 사항을 제공할 수 있습니다. 게다가, [및 태그](../../../content-authoring-and-management/tags-and-categories/organizing-content-with-categories-and-tags.md) 을 사용하면 추천하려는 콘텐츠에 대해 더 많은 제어 기능을 제공합니다.

```{note}
Analytics Cloud는 현재 사용자의 관심 창출을 위해 영어로 된 제목과 설명만 고려합니다.
```

## 콘텐츠 추천 구성

다음 요소가 있는 경우 콘텐츠 추천이 자동으로 작동합니다.

1. [Analytics Cloud가 Liferay DXP 인스턴스](./configuring-content-recommendations.md#connecting-analytics-cloud-to-your-liferay-dxp-instance) 에 연결되고 사이트 콘텐츠가 동기화됩니다.
1. Liferay DXP에서 다양한 콘텐츠를 포함하는 동적 컬렉션 [생성하고 콘텐츠 추천 옵션을](./configuring-content-recommendations.md#creating-a-dynamic-collection) 합니다.
1. 자산 게시자, 컬렉션 표시 조각 또는 컬렉션 페이지를 사용하여 [컬렉션](./configuring-content-recommendations.md#displaying-the-dynamic-collection) 을 표시합니다.

```{note}
컬렉션은 Liferay DXP 7.2에서 콘텐츠 세트로 명명됩니다.
```

컬렉션 또는 콘텐츠 세트를 표시하는 방법은 Liferay DXP 버전에 따라 다릅니다. Liferay DXP 7.2에서는 자산 게시자를 사용하여 디스플레이 페이지에 콘텐츠 세트를 표시합니다. DXP 7.3+에서는 Asset Publisher 외에도 컬렉션 표시 조각 또는 컬렉션 페이지를 사용하여 컬렉션의 콘텐츠를 표시할 수 있습니다. 컬렉션, 컬렉션 페이지 및 콘텐츠 세트에 대한 자세한 내용은 [컬렉션 및 컬렉션 페이지 정보](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md) 참조하세요.

사이트에 대한 콘텐츠 추천을 표시하는 방법에 대한 자세한 내용은 [콘텐츠 추천 구성](./configuring-content-recommendations.md) 참조하세요.

## 콘텐츠 추천 구현 방법의 예

상황에 맞는 콘텐츠 추천을 이해하려면 다음 예를 고려하세요. 온라인 주방용품 매장에서는 다양한 주방 관련 제품을 판매하고 있습니다. 사용자가 귀하의 사이트를 방문하여 커피 메이커, 커피 머그, 커피 믹서기와 같은 커피 액세서리와 상호 작용합니다. 사용자 상호 작용을 기반으로 Analytics Cloud는 사용자가 관심을 갖는 주제(이 예에서는 "커피")를 생성합니다.

DXP에서는 수저류, 조리기구, 식품 보관함, 커피 액세서리 등 다양한 유형의 제품에 대한 정보와 프로모션을 포함하는 동적 컬렉션을 생성합니다. 동일한 사용자가 이 컬렉션을 표시하는 페이지에 액세스하면 주방용품 사이트는 다른 유형의 제품보다 커피 관련 제품 및 판촉 행사에 우선순위를 두어 해당 콘텐츠를 해당 사용자에게 더 눈에 띄게 표시합니다.

사용자가 커피 관련 콘텐츠를 더 많이 방문하고 상호 작용할수록 이 사용자의 개인 프로필에 더 많은 '커피'가 연결되어 커피에 대한 콘텐츠 추천 수가 늘어나고 다른 제품에 대한 추천 수가 줄어듭니다.

## 콘텐츠 추천 및 세그먼트

사용자 행동을 기반으로 추천 콘텐츠를 표시하는 것은 [Segments](../segmentation/creating-and-managing-user-segments.md) 을 사용하여 사용자 경험을 개인화하는 것과는 다릅니다. 세그먼트를 사용하면 사용자를 그룹으로 분류하고 이러한 특정 그룹에 대한 콘텐츠를 타겟팅합니다. 세그먼트 기반 개인화에서는 특정 콘텐츠를 특정 사용자 그룹에 타겟팅합니다. 콘텐츠 추천에서는 사이트에서의 이전 행동을 기반으로 사용자에게 콘텐츠가 자동으로 추천되므로 그룹을 정의할 필요가 없습니다.

그러나 세그먼트 [로 컬렉션을 사용자 정의하는 기능을 활용](./personalizing-collections.md) 특정 사용자 그룹에 콘텐츠 권장 사항을 제공할 수 있습니다. 예를 들어 콘텐츠 추천을 위한 동적 컬렉션을 독일 방문자만 포함하는 세그먼트와 결합할 수 있습니다. 이 경우 독일에서 귀하의 사이트를 방문한 방문자만 이 컬렉션의 콘텐츠 추천을 받을 수 있습니다.

## 관련 정보

- [Liferay DXP를 Analytics Cloud에 연결](https://learn.liferay.com/ko/w/analytics-cloud/getting-started/connecting-liferay-dxp-to-analytics-cloud)
- [콘텐츠 추천 구성](./configuring-content-recommendations.md)
- [관심사 이해](https://learn.liferay.com/ko/w/analytics-cloud/people/individuals/understanding-interests)
- [컬렉션 및 컬렉션 페이지 정보](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md)
