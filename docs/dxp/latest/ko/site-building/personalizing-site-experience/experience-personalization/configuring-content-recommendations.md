# 콘텐츠 추천 구성

사용자가 Liferay DXP 사이트를 탐색하고 콘텐츠와 상호 작용하면 Liferay Analytics Cloud는 탐색 행동을 기반으로 관심 주제를 자동으로 생성하고 순위를 매깁니다. 이러한 관심분야를 활용하여 사용자가 구매하거나 소비할 가능성이 높은 관련 콘텐츠를 추천할 수 있습니다. 콘텐츠 추천에 대한 자세한 내용은 [콘텐츠 추천 이해하기](./understanding-content-recommendations.md) 참조하세요.

다음 요소가 있는 경우 콘텐츠 추천이 자동으로 작동합니다.

1. [Analytics Cloud가 Liferay DXP 인스턴스](#connecting-analytics-cloud-to-your-liferay-dxp-instance) 에 연결되고 사이트 콘텐츠가 동기화됩니다.
1. Liferay DXP에서 다양한 콘텐츠로 동적 컬렉션 [생성하고 콘텐츠 추천 옵션을](#creating-a-dynamic-collection) 합니다.
1. 자산 게시자, 컬렉션 표시 조각 또는 컬렉션 페이지를 사용하여 [컬렉션](#displaying-the-dynamic-collection) 을 표시합니다.

## Analytics Cloud를 Liferay DXP 인스턴스에 연결

사용자에게 콘텐츠 추천을 제공하려면 Analytics Cloud를 Liferay DXP 인스턴스에 연결해야 합니다.

Analytics Cloud를 Liferay DXP에 연결하고 사이트의 콘텐츠를 동기화하는 방법을 알아보려면 [Liferay DXP를 Analytics Cloud에 연결](https://learn.liferay.com/analytics-cloud/latest/en/connecting-data-sources/connecting-liferay-dxp-to-analytics-cloud.html) 을 참조하십시오.

![Connecting Liferay DXP to Analytics Cloud](./configuring-content-recommendations/images/02.png)

## 동적 컬렉션 만들기

사용자의 탐색 행동을 기반으로 콘텐츠 추천을 표시하려면 동적 컬렉션을 사용해야 합니다. 컬렉션은 Analytics Cloud에 대한 사용자의 관심 사항을 사이트의 콘텐츠 권장 사항과 연결하는 구성 요소입니다. 컬렉션을 사용하여 추천할 콘텐츠 유형과 선택적으로 대상 고객을 정의합니다.

동적 컬렉션을 생성하려면 [컬렉션 생성](../../../site-building/displaying-content/collections-and-collection-pages/creating-collections.md#creating-a-dynamic-collection) 의 지침을 따르십시오.

![Managing Collections in Liferay DXP](./configuring-content-recommendations/images/01.png)

동적 컬렉션을 생성할 때 다음 정보를 고려하십시오.

- 동적 컬렉션에서 _콘텐츠 추천_ 옵션을 활성화해야 합니다. 이 옵션이 비활성화되면 컬렉션은 콘텐츠 추천을 사용하지 않습니다.

    ```{note}
    콘텐츠 추천 옵션은 DXP 인스턴스를 Analytics Cloud에 연결하고 콘텐츠를 동기화해야 사용할 수 있습니다.
    ```

  ![Enable the Content Recommendation option for the Dynamic Collection](./configuring-content-recommendations/images/03.png)

- 동적 컬렉션의 필터는 선택 사항입니다. 예를 들어 콘텐츠에 '프로모션' 태그를 사용하고 프로모션만 추천하려는 경우 이 태그를 필터로 사용할 수 있습니다.

  ![You can optionally use a Filter in the Dynamic Collection for your content recommendations](./configuring-content-recommendations/images/04.png)

- 특정 사용자 그룹(예: "독일의 웹사이트 방문자")에게 콘텐츠 추천을 타겟팅하려는 경우 개인화된 변형 [을 사용하여 동적 컬렉션을 세그먼트](./personalizing-collections.md) 과 결합할 수 있습니다.

  ![Customize your content recommendations Collection for a specific user Segment](./configuring-content-recommendations/images/05.png)

## 동적 컬렉션 표시

컬렉션 또는 콘텐츠 세트를 표시하는 방법은 Liferay DXP 버전에 따라 다릅니다. Liferay DXP 7.2에서는 자산 게시자를 사용하여 디스플레이 [에 콘텐츠 세트를 표시](#display-the-collection-or-content-set-in-a-display-page-using-the-asset-publisher) . DXP 7.3+에서는 Asset Publisher 외에도 컬렉션 표시 조각 또는 컬렉션 페이지 [을 사용하여 컬렉션의 콘텐츠](#display-the-collection-using-a-collection-display-fragment-or-a-collection-page) 을 표시할 수 있습니다.

```{note}
컬렉션은 Liferay DXP 7.2에서 콘텐츠 세트로 명명됩니다.
```
### 컬렉션 표시 조각 또는 컬렉션 페이지를 사용하여 컬렉션 표시

> liferay DXP 7.3+

컬렉션 표시 조각은 컬렉션을 표시하는 조각 유형입니다. 이 조각을 사용하여 콘텐츠 페이지, 페이지 템플릿 또는 표시 페이지에 컬렉션을 표시할 수 있습니다. 컬렉션 표시 조각을 구성하려면 [컬렉션 표시 조각 구성](../../displaying-content/collections-and-collection-pages/displaying-collections.md#configuring-a-collection-display-fragment) 섹션을 참조하세요.

컬렉션 페이지는 컬렉션에 연결된 페이지 유형입니다. 컬렉션 페이지를 사용하여 컬렉션을 표시하려면 [컬렉션 표시](../../displaying-content/collections-and-collection-pages/displaying-collections.md) 항목의 [컬렉션 페이지에 컬렉션 표시](../../displaying-content/collections-and-collection-pages/displaying-collections.md#displaying-collections-on-a-collection-page) 섹션을 참조하세요.

### Asset Publisher를 사용하여 표시 페이지에 컬렉션 또는 콘텐츠 세트 표시

> liferay DXP 7.2+

표시 페이지와 자산 게시자를 사용하여 컬렉션을 표시하려면 다음 단계를 완료해야 합니다.

1. [디스플레이 페이지 템플릿 만들기](../../displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md).
1. 컬렉션(Liferay 7.3+) 또는 콘텐츠 세트(Liferay 7.2)로 자산 게시자를 구성합니다. 자세한 내용은 [컬렉션 표시](../../displaying-content/collections-and-collection-pages/displaying-collections.md) 참조하세요.

## 관련 정보

- [콘텐츠 추천 이해하기](./understanding-content-recommendations.md)
- [Liferay DXP를 Analytics Cloud에 연결하기](https://learn.liferay.com/analytics-cloud/latest/en/connecting-data-sources/connecting-liferay-dxp-to-analytics-cloud.html)
- [컬렉션 만들기](../../../site-building/displaying-content/collections-and-collection-pages/creating-collections.md#creating-a-dynamic-collection)
- [표시 페이지 템플릿 생성 및 관리](../../displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md)
