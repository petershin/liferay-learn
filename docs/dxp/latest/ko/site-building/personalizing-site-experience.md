---
toc:
- ./personalizing-site-experience/segmentation.md
- ./personalizing-site-experience/experience-personalization.md
- ./personalizing-site-experience/migration-from-audience-targeting.md
- ./personalizing-site-experience/enabling-automated-live-chat-systems.md
---
# 사이트 경험 개인화

```{toctree}
:maxdepth: 3

personalizing-site-experience/segmentation.md
personalizing-site-experience/experience-personalization.md
personalizing-site-experience/migration-from-audience-targeting.md
personalizing-site-experience/enabling-automated-live-chat-systems.md
```

Liferay DXP는 개인화된 경험을 이해하고 제공할 수 있는 강력한 도구와 함께 즉시 사용할 수 있습니다. 개인화된 경험을 제공하는 첫 번째 단계는 사용자를 수집하거나 세분화하는 것부터 시작하는 것입니다. [**사용자 세그먼트**](./personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) 동적으로 할당됨 [**컬렉션**](../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md). 컬렉션에 사용자를 수동으로 할당하는 대신 사용자는 공유 속성 또는 동작을 기반으로 세그먼트에 할당됩니다(자세한 내용은 [개인화 컬렉션](./personalizing-site-experience/experience-personalization/personalizing-collections.md) 참조).

## 분할

세그먼트 빌더를 사용하여 유사한 사용자를 사용자 프로필 속성, 동작, 사이트 역할 등으로 그룹화할 수 있습니다.

![다양한 사용자 속성 값을 확인하여 사용자 세그먼트를 구축합니다.](./personalizing-site-experience/images/01.png)

시작하려면 [세그먼트 생성 및 관리](./personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) 참조하십시오.

```{note}
사용자 세그먼트를 사용하여 역할을 할당할 수도 있습니다. 자세한 내용은 [사용자 세그먼트에 역할 할당](../users-and-permissions/roles-and-permissions/assigning-roles-to-user-segments.md)을 참조하십시오.
```

### Liferay Analytics Cloud로 사용자 세그먼트의 행동 추적

Liferay DXP 인스턴스를 Liferay Analytics Cloud와 통합하여 세그먼트를 강화하십시오. Analytics Cloud는 DXP를 Salesforce(tm) 및 기타 데이터 소스와 통합하여 사용자 기반을 이해하는 더 많은 방법을 제공합니다.

Analytics Cloud와의 통합은 DXP 사이트의 모든 페이지에 대한 사용자 행동 및 참여를 이해하는 데 도움이 되는 심층적인 머신 러닝 기반 데이터 분석 기능을 제공합니다. Analytics Cloud를 사용하면 표준 콘텐츠와 대상 콘텐츠 모두에 대한 사용자 행동 및 상호 작용을 볼 수 있습니다. 자세한 내용은 [사용자 세그먼트에 대한 분석 얻기](./personalizing-site-experience/segmentation/getting-analytics-for-user-segments.md) 참조하십시오.

![Analytics Cloud를 사용하는 사이트 지표.](./personalizing-site-experience/images/05.png)

## 개인화

사용자 세그먼트 [생성](./personalizing-site-experience/segmentation/creating-and-managing-user-segments.md)완료하면 사용자 세그먼트에 맞는 사이트 경험을 맞춤화할 수 있습니다. 콘텐츠 페이지 개인화 및 콘텐츠 세트 개인화는 개인화된 사용자 경험을 제공하는 데 사용할 수 있는 두 가지 방법입니다.

### 콘텐츠 페이지

콘텐츠 페이지 개인화는 페이지를 보는 사람에 따라 페이지 레이아웃과 콘텐츠를 동적으로 변경합니다. 페이지를 보는 사용자의 사용자 세그먼트 기준에 따라 다른 텍스트, 이미지, 위젯 및 다른 레이아웃을 제공하는 [콘텐츠 페이지](./creating-pages/using-content-pages.md) 에 대해 **경험** 생성할 수 있습니다. 자세한 내용은 [콘텐츠 페이지 개인화](./personalizing-site-experience/experience-personalization/content-page-personalization.md) 참조하십시오.

![다양한 사용자 세그먼트에 대해 고유한 경험을 만들 수 있습니다.](./personalizing-site-experience/images/02.png)

### 콜렉션

[컬렉션](../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md) 콘텐츠를 구성하고 표시합니다. [컬렉션 개인화](./personalizing-site-experience/experience-personalization/personalizing-collections.md) 사용자 세그먼트를 기반으로 컬렉션 선택을 제공합니다. 이는 주어진 컨텍스트에 나타나는 콘텐츠 세트가 [사용자 세그먼트](./personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) 기준에 의해 결정됨을 의미합니다. 예를 들어 컬렉션을 사용하여 페이지 상단에 "추천" 기사를 표시할 수 있습니다. 그런 다음 기본값이 아닌 더 전문화된 콘텐츠를 수신해야 하는 사용자를 포함하는 사용자 세그먼트를 생성할 수 있습니다. 그런 다음 해당 세그먼트는 기본값이 아닌 관심사에 맞게 개인화된 콘텐츠를 볼 수 있습니다. 자세한 내용은 [컬렉션 개인화](./personalizing-site-experience/experience-personalization/personalizing-collections.md) 참조하십시오.

![특정 사용자 세그먼트에 대한 자산을 표시하도록 콘텐츠 세트를 개인화할 수 있습니다.](./personalizing-site-experience/images/03.png)

```{note}
컬렉션은 Liferay DXP 7.2에서 콘텐츠 세트로 명명됩니다.
```

### 사용자 경험 미리보기

페이지 상단의 **시뮬레이션** 버튼(![Simulation](../images/icon-simulation.png))을 클릭하고 **세그먼트** 선택 항목에서 사용자 세그먼트를 선택하여 해당 사용자의 구성원으로 페이지를 미리 보면 사용자가 페이지에서 가질 수 있는 다양한 경험을 미리 볼 수 있습니다. 분절.

사용자 세그먼트의 관점을 보면 해당 사용자 세그먼트에 대한 콘텐츠 페이지 또는 콘텐츠 세트의 모든 개인화를 미리 볼 수 있습니다.

![미리보기 패널에서 다양한 경험을 미리 볼 수 있습니다.](./personalizing-site-experience/images/04.png)

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} 세분화
:link: ./personalizing-site-experience/segmentation.md
:::

:::{grid-item-card} 경험 개인화
:link: ./personalizing-site-experience/experience-personalization.md
:::

:::{grid-item-card} Audience Targeting에서 마이그레이션
:link: ./personalizing-site-experience/migration-from-audience-targeting.md
:::

:::{grid-item-card} 자동 라이브 채팅 시스템 활성화
:link: ./personalizing-site-experience/enabling-automated-live-chat-systems.md
:::
::::
