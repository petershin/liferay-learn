# 콘텐츠 추천 이해

사용자가 귀하의 웹사이트를 방문하면 귀하의 콘텐츠와 상호 작용하고 관심사에 따라 다른 행동을 보입니다. Liferay DXP는 [Liferay Analytics Cloud](https://learn.liferay.com/analytics-cloud/latest/en/index.html)과 함께 이 브라우징 동작을 분석하고 사용자에게 관련 콘텐츠를 표시할 수 있습니다. 이는 사용자가 구매하거나 소비할 가능성이 더 높은 특정 제품이나 콘텐츠를 홍보하는 데 유용할 수 있습니다. 예를 들어 사용자가 온라인 상점을 방문하고 특정 유형의 제품에 관심을 보이면 콘텐츠 추천을 사용하여 사용자에게 유사한 제품이나 관련 제품 프로모션을 보여줄 수 있습니다.

```{important}
Analytics Cloud를 Liferay DXP 인스턴스에 연결해야 합니다](https://learn.liferay.com/analytics-cloud/latest/en/connecting-data-sources/connecting-liferay-dxp-to-analytics-cloud.html ) 사용자에게 콘텐츠 추천을 제공합니다.
```

## 콘텐츠 추천 작동 방식

콘텐츠 권장 사항 구성은 2단계 프로세스입니다. 먼저 사용자의 행동을 추적하고 관심 주제를 정의합니다. 이 단계에서는 [DXP 인스턴스에 연결된 Analytics Cloud](https://learn.liferay.com/analytics-cloud/latest/en/connecting-data-sources/connecting-liferay-dxp-to-analytics-cloud.html)가 필요합니다. ). 사이트에서 이전 사용자의 행동을 기반으로 Analytics Cloud는 관심 주제를 정의하고 순위를 매기고 이러한 관심을 사이트의 사용자 식별자에 연결합니다. 둘째, 사용자의 관심사에 따라 추천 콘텐츠를 표시합니다. 이 단계에서는 [동적 컬렉션](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)을 생성하고 이를 표시해야 합니다. 귀하의 웹사이트에 수집합니다. Analytics Cloud는 사용자의 관심사에 따라 일련의 키워드를 DXP로 보내고 이러한 키워드는 컬렉션에서 필터로 작동합니다. 사용자에게 표시하려는 콘텐츠 유형을 정의하려면 컬렉션이 필요합니다.

```{note}
Analytics Cloud에서 Interests로 작업하는 방법에 대한 자세한 내용은 [Analytics Cloud 설명서](https://learn.liferay.com/analytics-cloud/latest/en/people/segments/segments.html)를 참조하세요.
```

![Liferay Analytics Cloud의 관심사 보기](./understanding-content-recommendations/images/01.png)

Analytics Cloud는 타일, 설명, [카테고리](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md)또는 [태그](../../../content-authoring-and-management/tags-and-categories/tagging-content-and-managing-tags.md)과 같은 다양한 콘텐츠 요소를 기반으로 관심사를 생성합니다. 콘텐츠 권장 사항을 생성하기 위해 콘텐츠에 카테고리 및 태그를 추가할 필요는 없습니다. 그러나 콘텐츠를 분류하고 태그를 지정하면 Analytics Cloud는 사용자의 관심사를 정의하기 위한 더 많은 정보를 보유하고 더 나은 권장 사항을 제공할 수 있습니다. 게다가 [카테고리 및 태그](../../../content-authoring-and-management/tags-and-categories/organizing-content-with-categories-and-tags.md) 을 사용하면 추천하고 싶은 콘텐츠에 대한 더 많은 제어 기능을 제공합니다.

```{note}
Analytics Cloud는 현재 사용자의 관심을 끌기 위해 영어로 된 제목과 설명만 고려합니다.
```

## 콘텐츠 추천 구성

콘텐츠 권장 사항은 다음 요소가 있는 한 자동으로 작동합니다.

1. [Analytics Cloud가 Liferay DXP 인스턴스](./configuring-content-recommendations.md#connecting-analytics-cloud-to-your-liferay-dxp-instance) 에 연결되고 사이트 콘텐츠가 동기화됩니다.
2. 다른 콘텐츠를 포함하여 Liferay DXP에서 동적 컬렉션 [을 생성하고 콘텐츠 추천 옵션을 활성화](./configuring-content-recommendations.md#creating-a-dynamic-collection).
3. 자산 게시자, [표시 조각 또는 컬렉션 페이지를 사용하여 동적 컬렉션을](./configuring-content-recommendations.md#displaying-the-dynamic-collection) 합니다.

```{note}
컬렉션은 Liferay DXP 7.2에서 콘텐츠 세트로 명명됩니다.
```

컬렉션 또는 콘텐츠 세트를 표시하는 방법은 Liferay DXP 버전에 따라 다릅니다. Liferay DXP 7.2에서는 Asset Publisher를 사용하여 디스플레이 페이지에 콘텐츠 세트를 표시합니다. DXP 7.3+에서는 Asset Publisher 외에도 Collection Display Fragment 또는 Collection Page를 사용하여 Collection의 콘텐츠를 표시할 수 있습니다. 컬렉션, 컬렉션 페이지 및 콘텐츠 세트에 대한 자세한 내용은 [컬렉션 및 컬렉션 페이지 정보](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)을 참조하십시오.

사이트에 대한 콘텐츠 권장 사항을 표시하는 방법에 대한 자세한 내용은 [콘텐츠 권장 사항 구성](./configuring-content-recommendations.md)을 참조하십시오.

## 콘텐츠 권장 사항을 구현하는 방법의 예

컨텍스트에서 콘텐츠 권장 사항을 이해하려면 다음 예를 고려하십시오. 온라인 주방용품 매장에서 다양한 주방 관련 제품을 판매하고 있습니다. 사용자가 귀하의 사이트를 방문하고 커피 메이커, 커피 머그 또는 커피 믹서기와 같은 커피 액세서리와 상호 작용합니다. 사용자 상호 작용을 기반으로 Analytics Cloud는 사용자의 관심 주제(이 예에서는 "커피")를 생성합니다.

DXP에서 수저류, 조리기구, 식품 저장고 및 커피 액세서리와 같은 다양한 유형의 제품에 대한 정보 및 프로모션을 포함하는 동적 컬렉션을 생성합니다. 동일한 사용자가 이 컬렉션을 표시하는 페이지에 액세스하면 Kitchenware 사이트는 다른 유형의 제품보다 커피 관련 제품 및 프로모션을 우선시하여 이 콘텐츠를 이 사용자에게 더 눈에 띄게 표시합니다.

사용자가 커피 관련 콘텐츠를 더 많이 방문하고 상호 작용할수록 이 사용자의 개인 프로필에 더 높은 "커피"가 연결되어 커피에 대한 콘텐츠 추천 수가 증가하고 다른 제품에 대한 추천이 감소합니다.

## 콘텐츠 추천 및 세그먼트

사용자 행동을 기반으로 추천 콘텐츠를 표시하는 것은 [세그먼트](../segmentation/creating-and-managing-user-segments.md)을 사용하여 사용자 경험을 개인화하는 것과 다릅니다. 세그먼트를 사용하면 사용자를 그룹으로 분류하고 이러한 특정 그룹에 대한 콘텐츠를 대상으로 지정합니다. 세그먼트 기반 개인화에서는 특정 사용자 그룹에 특정 콘텐츠를 대상으로 지정합니다. 콘텐츠 추천에서는 콘텐츠가 사이트에서의 이전 동작을 기반으로 사용자에게 자동으로 추천되기 때문에 그룹을 정의할 필요가 없습니다.

그러나 세그먼트 [로 컬렉션을 사용자 지정하는 기능을 활용하여 특정 사용자 그룹에 콘텐츠 권장](./personalizing-collections.md) 을 제공할 수 있습니다. 예를 들어 콘텐츠 추천에 대한 동적 컬렉션을 독일 방문자만 포함하는 세그먼트와 결합할 수 있습니다. 이 경우 독일에서 사이트를 방문하는 방문자만 이 컬렉션에서 콘텐츠 추천을 받습니다.

## 관련 정보

- [Liferay DXP를 Analytics Cloud에 연결](https://learn.liferay.com/analytics-cloud/latest/en/connecting-data-sources/connecting-liferay-dxp-to-analytics-cloud.html)
- [콘텐츠 추천 구성](./configuring-content-recommendations.md)
- [관심사(Analytics Cloud)](https://learn.liferay.com/analytics-cloud/latest/en/workspace-data/definitions/managing-interest-topics.html)
- [컬렉션 및 컬렉션 페이지 정보](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)
