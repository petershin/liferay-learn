---
toc:
  - ./personalizing-site-experience/segmentation.md
  - ./personalizing-site-experience/experience-personalization.md
  - ./personalizing-site-experience/migration-from-audience-targeting.md
  - ./personalizing-site-experience/enabling-automated-live-chat-systems.md
---
# 사이트 경험 개인화

Liferay DXP는 사용자에게 개인화된 경험을 이해하고 제공하기 위한 강력한 도구를 즉시 제공합니다.

예를 들어, [사용자 세그먼트](./personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) 생성하고 이를 다른 [경험](./personalizing-site-experience/experience-personalization/creating-and-managing-experiences.md) 에 매핑할 수 있습니다. 경험을 바탕으로 [컬렉션을 개인화하고](./personalizing-site-experience/experience-personalization/personalizing-collections.md) 사용자가 보는 콘텐츠 또는 페이지 [방식](./personalizing-site-experience/experience-personalization/content-page-personalization.md) 맞춤화합니다.

```{tip}
사용자가 여러 세그먼트에 속해 있는 경우 [특정 개인화된 변형의 우선순위를 지정하거나](./personalizing-site-experience/experience-personalization/personalizing-collections.md#creating-personalized-variations) 또는 [모든 세그먼트의 컬렉션 항목을 결합할 수 있습니다](./personalizing-site-experience/experience-personalization/personalizing-collections.md#combining-collection-entries-from-all-segments) .
```

## 분할

세그먼트 빌더를 사용하면 사용자 프로필 속성, 행동, 사이트 역할 등을 기준으로 유사한 사용자를 그룹화할 수 있습니다.

![Build user segments by checking for different user property values.](./personalizing-site-experience/images/01.png)

시작하려면 [세그먼트 생성 및 관리](./personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) 참조하세요.

```{note}
사용자 세그먼트에 역할을 할당할 수 있습니다. 자세한 내용은 [사용자 세그먼트에 역할 할당](../users-and-permissions/roles-and-permissions/assigning-roles-to-user-segments.md) 참조하세요.
```

### Liferay Analytics Cloud를 사용하여 사용자 세그먼트의 행동 추적

Liferay DXP 인스턴스를 Liferay Analytics Cloud와 통합하여 세그먼트를 강화하세요. Analytics Cloud는 DXP를 Salesforce(tm) 및 기타 데이터 소스와 통합하여 사용자 기반을 이해하는 더 많은 방법을 제공합니다.

Analytics Cloud와의 통합은 심층적인 머신 러닝 기반 데이터 분석 기능을 제공하여 DXP 사이트의 모든 페이지에 대한 사용자 행동과 참여를 이해하는 데 도움이 됩니다. Analytics Cloud를 사용하면 표준 콘텐츠와 타겟 콘텐츠 모두에서 사용자 행동과 상호 작용을 확인할 수 있습니다. 자세한 내용은 [사용자 세그먼트에 대한 분석 가져오기](./personalizing-site-experience/segmentation/getting-analytics-for-user-segments.md) 참조하세요.

![Site metrics using Analytics Cloud.](./personalizing-site-experience/images/02.png)

## 개인화

사용자 세그먼트 [사용자 세그먼트 생성](./personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) 생성하면 사용자 세그먼트에 맞게 사이트 [경험](./personalizing-site-experience/experience-personalization/creating-and-managing-experiences.md) 조정할 수 있습니다. 콘텐츠 페이지 개인화와 콘텐츠 세트 개인화는 개인화된 사용자 경험을 제공하는 데 사용할 수 있는 두 가지 방법입니다.

### 콘텐츠 페이지

콘텐츠 페이지 개인화는 현재 사용자를 기반으로 페이지 레이아웃과 콘텐츠를 동적으로 변경합니다. 현재 사용자의 사용자 세그먼트 기준에 따라 콘텐츠 페이지 [에 대해 다양한 텍스트, 이미지, 위젯은 물론 다양한 레이아웃](./creating-pages/using-content-pages.md) 제공하는 경험을 만들 수 있습니다. 자세한 내용은 [콘텐츠 페이지 개인화](./personalizing-site-experience/experience-personalization/content-page-personalization.md) 참조하세요.

![You can create unique experiences for different segments of users.](./personalizing-site-experience/images/03.png)

### 콜렉션

[컬렉션](./displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md) 콘텐츠를 정리하고 표시합니다. [컬렉션 개인화](./personalizing-site-experience/experience-personalization/personalizing-collections.md) 사용자 세그먼트를 기반으로 컬렉션 선택을 제공합니다. 이는 특정 컨텍스트에 나타나는 콘텐츠 세트가 [사용자 세그먼트](./personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) 기준에 따라 결정됨을 의미합니다. 예를 들어 컬렉션을 사용하여 페이지 상단에 "추천" 기사를 표시할 수 있습니다. 그런 다음 기본 콘텐츠가 아닌 더 전문적인 콘텐츠를 수신해야 하는 사용자가 포함된 사용자 세그먼트를 만들 수 있습니다. 그러면 해당 세그먼트는 기본값이 아닌 관심 분야에 맞춰 개인화된 콘텐츠를 보게 됩니다. 자세한 내용은 [컬렉션 개인화](./personalizing-site-experience/experience-personalization/personalizing-collections.md) 참조하세요.

![You can personalize content sets to display assets for specific user segments.](./personalizing-site-experience/images/04.png)

```{note}
컬렉션은 Liferay DXP 7.2에서 콘텐츠 세트로 명명됩니다.
```

### 사용자 경험 미리보기

페이지 상단의 **시뮬레이션** 버튼(![시뮬레이션](../images/icon-simulation.png))을 클릭하고 다음에서 사용자 세그먼트를 선택하여 페이지에서 사용자가 가질 수 있는 다양한 경험을 미리 볼 수 있습니다. 해당 사용자 세그먼트의 구성원으로 페이지를 미리 보려면 세그먼트를 선택하세요.

사용자 세그먼트의 관점을 보면 해당 사용자 세그먼트에 대한 콘텐츠 페이지 또는 콘텐츠 세트의 개인화를 미리 볼 수 있습니다.

![You can preview different experiences from the Preview panel.](./personalizing-site-experience/images/05.png)

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} 분할
:link: ./personalizing-site-experience/segmentation.md
:::

:::{grid-item-card} 개인화 경험
:link: ./personalizing-site-experience/experience-personalization.md
:::

:::{grid-item-card} 잠재고객 타겟팅에서 이전
:link: ./personalizing-site-experience/migration-from-audience-targeting.md
:::

:::{grid-item-card} 자동화된 라이브 채팅 시스템 활성화
:link: ./personalizing-site-experience/enabling-automated-live-chat-systems.md
:::
::::
