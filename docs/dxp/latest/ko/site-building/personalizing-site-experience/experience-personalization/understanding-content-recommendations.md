# 콘텐츠 추천 이해

사용자가 웹사이트를 방문하면 콘텐츠와 상호 작용하고 관심사에 따라 다양한 행동을 보입니다. Liferay DXP는 [Liferay 애널리틱스 클라우드](https://learn.liferay.com/analytics-cloud/latest/en/index.html)와 결합하여 이러한 브라우징 행동을 분석하고 사용자에게 관련 콘텐츠를 표시할 수 있습니다. 이는 사용자가 구매하거나 소비할 가능성이 높은 특정 제품이나 콘텐츠를 홍보하는 데 유용할 수 있습니다. 예를 들어, 사용자가 온라인 스토어를 방문하여 특정 유형의 제품에 관심을 보이는 경우 콘텐츠 추천을 사용하여 사용자에게 유사한 제품이나 관련 제품 프로모션을 표시할 수 있습니다.

```{important}
사용자에게 콘텐츠 추천을 제공하려면 [Liferay DXP 인스턴스에 애널리틱스 클라우드를 연결](https://learn.liferay.com/analytics-cloud/latest/en/connecting-data-sources/connecting-liferay-dxp-to-analytics-cloud.html)해야 합니다.
```

## 콘텐츠 추천의 작동 방식

콘텐츠 추천을 구성하는 과정은 두 단계로 이루어집니다. 먼저 사용자의 행동을 추적하고 관심 주제를 정의합니다. 이 단계에는 [Analytics Cloud가 DXP 인스턴스에 연결되어 있어야 합니다](https://learn.liferay.com/analytics-cloud/latest/en/connecting-data-sources/connecting-liferay-dxp-to-analytics-cloud.html). 사이트에서의 이전 사용자 행동에 기반하여 애널리틱스 클라우드는 관심 주제를 정의하고 순위를 매긴 다음 이러한 관심 주제를 사이트의 사용자 식별자와 연결합니다. 둘째, 사용자의 관심사에 따라 추천 콘텐츠를 표시합니다. 이 단계를 수행하려면 [동적 컬렉션](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md) 을 생성하고 웹사이트에 이 컬렉션을 표시해야 합니다. 애널리틱스 클라우드는 사용자의 관심사를 기반으로 일련의 키워드를 DXP로 전송하며, 이러한 키워드는 컬렉션에서 필터로 작동합니다. 사용자에게 표시할 콘텐츠 유형을 정의하려면 컬렉션이 필요합니다.

```{note}
애널리틱스 클라우드에서 관심 분야로 작업하는 방법에 대한 자세한 내용은 [애널리틱스 클라우드 문서](https://learn.liferay.com/analytics-cloud/latest/en/people/segments/segments.html)를 참조하세요.
```

![Liferay 애널리틱스 클라우드의 관심사 보기](./understanding-content-recommendations/images/01.png)

애널리틱스 클라우드는 타일, 설명, [카테고리](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md), 또는 [태그](../../../content-authoring-and-management/tags-and-categories/tagging-content-and-managing-tags.md)와 같은 다양한 콘텐츠 요소를 기반으로 관심사를 생성합니다. 콘텐츠 추천을 생성하기 위해 콘텐츠에 카테고리 및 태그를 반드시 추가해야 하는 것은 아닙니다. 하지만 콘텐츠를 분류하고 태그를 지정하면 애널리틱스 클라우드에서 사용자의 관심사를 정의할 수 있는 더 많은 정보를 확보하고 더 나은 추천을 제공할 수 있습니다. 또한 [카테고리 및 태그(](../../../content-authoring-and-management/tags-and-categories/organizing-content-with-categories-and-tags.md) )를 사용하면 추천하려는 콘텐츠를 더 잘 제어할 수 있습니다.

```{note}
애널리틱스 클라우드는 현재 사용자의 관심사를 생성할 때 영어로 된 제목과 설명만 고려합니다.
```

## 콘텐츠 권장 사항 구성

콘텐츠 추천은 다음 요소가 갖추어져 있으면 자동으로 작동합니다:

1. [애널리틱스 클라우드가 Liferay DXP 인스턴스(](./configuring-content-recommendations.md#connecting-analytics-cloud-to-your-liferay-dxp-instance) )에 연결되고 사이트 콘텐츠가 동기화됩니다.
2. [다양한 콘텐츠를 포함하는 동적 컬렉션(](./configuring-content-recommendations.md#creating-a-dynamic-collection) )을 Liferay DXP에서 생성하고 콘텐츠 추천 옵션을 활성화합니다.
3. [에셋 게시자, 컬렉션 표시 조각 또는 컬렉션 페이지를 사용하여 동적 컬렉션](./configuring-content-recommendations.md#displaying-the-dynamic-collection) 을 표시합니다.

```{note}
Liferay DXP 7.2에서 컬렉션의 이름은 콘텐츠 세트입니다.
```

컬렉션 또는 콘텐츠 집합을 표시하는 방식은 Liferay DXP 버전에 따라 다릅니다. Liferay DXP 7.2에서는 에셋 게시자를 사용하여 디스플레이 페이지에 콘텐츠 세트를 표시합니다. DXP 7.3 이상에서는 에셋 퍼블리셔 외에도 컬렉션 디스플레이 조각 또는 컬렉션 페이지를 사용하여 컬렉션의 콘텐츠를 표시할 수 있습니다. 컬렉션, 컬렉션 페이지 및 콘텐츠 세트에 대한 자세한 내용은 [컬렉션 및 컬렉션 페이지 정보](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)을 참조하십시오.

사이트에 대한 콘텐츠 권장 사항을 표시하는 방법에 대한 자세한 내용은 [콘텐츠 권장 사항 구성](./configuring-content-recommendations.md)을 참조하세요.

## 콘텐츠 추천을 구현하는 방법의 예시

콘텐츠 권장 사항을 맥락에서 이해하려면 다음 예를 고려하세요. 온라인 주방 용품 스토어에서 다양한 주방 관련 제품을 제공합니다. 사용자가 사이트를 방문하여 커피 메이커, 커피 머그잔, 커피 블렌더와 같은 커피 액세서리와 상호 작용합니다. 사용자 상호 작용을 기반으로 애널리틱스 클라우드는 사용자의 관심 주제(이 예에서는 '커피')를 생성합니다.

DXP에서 동적 컬렉션을 생성하여 칼, 조리 도구, 식품 보관, 커피 액세서리 등 다양한 유형의 제품에 대한 정보와 프로모션을 포함할 수 있습니다. 동일한 사용자가 이 컬렉션을 표시하는 페이지에 액세스하면 키친웨어 사이트는 다른 유형의 제품보다 커피 관련 제품 및 프로모션에 우선순위를 부여하여 이 사용자에게 해당 콘텐츠를 더 눈에 띄게 표시합니다.

사용자가 커피 관련 콘텐츠를 더 많이 방문하고 상호 작용할수록 이 사용자의 개별 프로필에서 '커피'가 더 많이 연관되어 커피에 대한 콘텐츠 추천 수가 증가하고 다른 제품에 대한 추천은 감소합니다.

## 콘텐츠 추천 및 세그먼트

사용자 행동을 기반으로 추천 콘텐츠를 표시하는 것은 [세그먼트](../segmentation/creating-and-managing-user-segments.md)를 사용하여 사용자 경험을 개인화하는 것과는 다릅니다. 세그먼트를 사용하면 사용자를 그룹으로 분류하고 이러한 특정 그룹에 대한 콘텐츠를 타겟팅할 수 있습니다. 세그먼트 기반 개인화에서는 특정 콘텐츠를 특정 사용자 그룹에 타겟팅할 수 있습니다. 콘텐츠 추천에서는 사이트에서의 이전 행동을 기반으로 사용자에게 콘텐츠가 자동으로 추천되므로 그룹을 정의할 필요가 없습니다.

[그러나 세그먼트](./personalizing-collections.md) 를 사용하여 컬렉션을 사용자 지정하여 특정 사용자 그룹에 콘텐츠 추천을 제공하는 기능을 활용할 수 있습니다. 예를 들어 콘텐츠 추천을 위한 동적 컬렉션을 독일 방문자만 포함하는 세그먼트와 결합할 수 있습니다. 이 경우 독일에서 사이트를 방문하는 방문자만 이 컬렉션의 콘텐츠 추천을 받게 됩니다.

## 관련 정보

- [Liferay DXP를 분석 클라우드에 연결하기](https://learn.liferay.com/analytics-cloud/latest/en/connecting-data-sources/connecting-liferay-dxp-to-analytics-cloud.html)
- [콘텐츠 권장 사항 구성](./configuring-content-recommendations.md)
- [관심 분야(애널리틱스 클라우드)](https://learn.liferay.com/analytics-cloud/latest/en/people/individuals/understanding-interests.md)
- [컬렉션 및 컬렉션 페이지 정보](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)
