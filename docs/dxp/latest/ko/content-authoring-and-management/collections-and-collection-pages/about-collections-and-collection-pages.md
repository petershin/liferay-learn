# 컬렉션 및 컬렉션 페이지 정보

```{note}
이 정보는 Liferay DXP 7.3+에 적용됩니다. 이전 Liferay 버전에서는 컬렉션을 콘텐츠 세트라고 했습니다. 콘텐츠 세트에 대한 자세한 내용은 [Liferay DXP 7.2](#liferay-dxp-72) 를 참조하십시오.
```

컬렉션은 정보를 그룹화하고 필터링하는 데 사용할 수 있는 콘텐츠 항목 집합입니다. 컬렉션에는 다양한 유형의 콘텐츠가 포함될 수도 있고 특정 유형의 콘텐츠 하나만 포함될 수도 있습니다. 그런 다음 페이지 조각을 사용하여 원하는 형식으로 표시할 수 있는 [컬렉션 페이지](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md#displaying-collections-on-a-collection-page) 에 표시할 수 있습니다.

![컬렉션 페이지를 사용하여 원하는 형식으로 특정 컬렉션을 빠르게 표시합니다.](./about-collections-and-collection-pages/images/01.png)

다음 예를 고려하십시오. 고객 성공 사례가 있는 제품 웹 페이지에 새 섹션을 만들 계획입니다. 이러한 성공 사례가 게시될 때 이 섹션에 자동으로 새로운 성공 사례를 표시하려고 합니다. 이 경우 컬렉션의 콘텐츠를 표시하는 컬렉션 페이지를 사용하여 모든 성공 사례를 그룹화하는 컬렉션을 만들 수 있습니다. 컬렉션 페이지 외에도 컬렉션 표시 조각을 사용하여 다른 콘텐츠 페이지에 이 컬렉션을 표시할 수 있습니다(자세한 내용은 [컬렉션 표시](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md#displaying-collections-on-a-collection-page) 참조).

Liferay에는 두 가지 유형의 컬렉션이 있습니다.

- **수동 수집**

    컬렉션의 일부인 항목을 수동으로 선택하고 유지 관리합니다. 수동 컬렉션의 항목은 자동으로 변경되지 않습니다.

    예를 들어, 공개 웹 사이트에 여러 프로모션 웹 콘텐츠 기사가 포함된 **프로모션** 이라는 수동 컬렉션을 만듭니다. 컬렉션에서 항목을 선택한 후 컬렉션을 최신 상태로 유지하려면 수동으로 새 판촉 콘텐츠를 추가해야 합니다.

- **동적 콜렉션**

    이러한 항목에 대한 기준과 함께 컬렉션의 항목 유형을 정의합니다. 컬렉션 항목은 정의한 기준에 따라 변경될 수 있습니다. 동적 컬렉션은 콘텐츠가 기준과 일치하는 새 항목으로 최신 상태인지 확인하려는 경우에 유용합니다.

    예를 들어 Kitchenware Store의 경우 **도자기** 태그(이 태그는 기준을 나타냄)가 있는 모든 블로그 게시물을 포함하는 컬렉션을 만듭니다. 동적 컬렉션에는 **도자기** 태그가 있는 모든 새 블로그 게시물이 자동으로 포함됩니다.

![수동 컬렉션을 사용하여 컬렉션의 항목을 직접 선택하거나 동적 컬렉션을 사용하여 선택한 기준에 따라 항목을 자동으로 조합합니다.](./about-collections-and-collection-pages/images/02.png)

수동 또는 동적 모음을 만드는 방법에 대한 자세한 내용은 [모음 만들기](./creating-collections.md)을 참조하십시오.

## 컬렉션 표시

[컬렉션 페이지](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md#displaying-collections-on-a-collection-page) 또는 [컬렉션 표시 조각](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md#adding-a-collection-display-fragment-to-a-page) 을 사용하여 컬렉션을 표시할 수 있습니다.

컬렉션 페이지는 컬렉션에 연결된 페이지 유형입니다. 컬렉션 페이지를 사용하면 컬렉션을 표시하고 사용자 지정하는 작업이 쉬워집니다. 예를 들어 컬렉션 페이지를 사용하여 컬렉션에 새 항목을 빠르게 추가할 수 있습니다.

![컬렉션 페이지를 사용하여 컬렉션을 표시할 수 있습니다.](./about-collections-and-collection-pages/images/03.png)

컬렉션 디스플레이 조각은 컬렉션을 보여주는 조각 유형입니다. 이 조각을 사용하여 모든 콘텐츠 페이지, 페이지 템플릿 또는 디스플레이 페이지에 컬렉션을 표시할 수 있습니다.

![Collection Display 조각을 사용하여 컬렉션의 콘텐츠를 표시할 수 있습니다.](./about-collections-and-collection-pages/images/04.png)

자세한 내용은 [컬렉션 표시](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md)참조하십시오.

## 컬렉션 커스터마이징

Liferay 세그먼트를 컬렉션과 연결하여 [세그먼트 구성](../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md)에 따라 다른 컬렉션 항목을 표시할 수 있습니다.

다음 예를 고려하십시오. 등록된 사용자에게 독점 프로모션을 제공하여 Kitchenware Store의 판매를 늘리고 싶습니다. 등록된 사용자를 위한 프로모션과 제품에 대한 뉴스를 포함하는 컬렉션을 만듭니다. 모든 사람이 제품에 대한 뉴스를 볼 수 있기를 원하지만 프로모션은 등록된 사용자로 제한하고 싶습니다. 등록된 사용자에 대한 새 세그먼트를 생성하고 프로모션 콘텐츠를 필터링하는 새로운 **맞춤형 변형** 에 세그먼트를 연결할 수 있습니다.

자세한 내용은 [개인화 컬렉션](../../site-building/personalizing-site-experience/experience-personalization/personalizing-collections.md)참조하십시오.

## Asset Publisher 구성을 컬렉션으로 변환

컬렉션을 직접 생성하거나 자산 게시자 위젯 [에서](../../site-building/displaying-content/using-the-asset-publisher-widget/displaying-assets-using-the-asset-publisher-widget.md)할 수 있습니다. 자산 게시자 옵션은 사용자 정의를 다른 페이지의 모음으로 사용하려는 경우에 유용합니다. 자세한 내용은 [컬렉션 만들기](./creating-collections.md#creating-a-collection-from-an-asset-publisher) 참조하십시오.

## 라이프레이 DXP 7.2

### 콘텐츠 세트 관리

콘텐츠 세트는 말 그대로 콘텐츠 항목 세트입니다. 즉, 관리자는 콘텐츠 목록을 정의한 다음 해당 목록을 표시할 수 있습니다. 콘텐츠 집합이 표시되는 방식은 콘텐츠 집합을 표시하는 데 사용되는 방법에 따라 결정됩니다. 예를 들어 콘텐츠 세트가 스마트워치 앱에서 사용 중인 경우 간단한 제목 목록으로 표시될 수 있으며 제목을 선택하면 연결된 모바일 장치에 전체 기사가 표시됩니다. 동일한 콘텐츠 세트가 각 기사의 전체 콘텐츠와 함께 웹 브라우저에 표시될 수 있습니다.

```{note}
이전 버전의 Liferay DXP에서는 Asset Publisher를 사용하여 자산의 정적 목록 또는 태그, 범주 또는 자산 유형과 같은 기준에 따라 동적 목록을 정의하고 표시했습니다. Liferay DXP에서 콘텐츠 세트는 다양한 유형의 자산 목록을 정의하고 이를 확장하는 핵심 아이디어를 취합니다. 콘텐츠 목록은 특정 애플리케이션 또는 위젯의 컨텍스트 외부에서 생성되며 다양한 채널 및 애플리케이션에서 사용 및 재사용할 수 있습니다.
```

### 콘텐츠 세트 생성 및 표시

콘텐츠 세트는 사이트 관리 인터페이스를 통해 생성됩니다. 콘텐츠 세트를 만들고 관리하기 위한 모든 기능이 여기에 포함되어 있습니다. Liferay의 위젯 또는 사용자 지정 응용 프로그램을 사용하여 표시됩니다. [콘텐츠 세트 만들기](./creating-collections.md#creating-content-sets) 및 [콘텐츠 세트 표시](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md#displaying-content-sets) 에 대한 정보는 가이드를 참조하십시오.

### 콘텐츠 세트 개인화

콘텐츠 세트는 Liferay DXP의 개인화 엔진에 의해 구동되는 변형을 가질 수 있습니다. 콘텐츠 세트를 생성한 후 사용자 세그먼트가 하나 이상 생성된 경우 해당 세그먼트에 대한 콘텐츠 세트의 개인화된 경험을 생성할 수 있습니다. 콘텐츠 세트에 대한 경험 개인화의 힘을 활용하는 방법을 배우려면 [콘텐츠 세트 개인화](../../site-building/personalizing-site-experience/experience-personalization/personalizing-collections.md#content-set-personalization) 참조하십시오.

### Asset Publisher 구성을 콘텐츠 세트로 변환

Asset Publisher를 통해 완벽하고 선별된 콘텐츠 목록을 만들기 위해 이미 많은 작업을 수행했을 수 있지만 이제 작업을 복제하지 않고 다른 사이트에 해당 목록을 표시하려고 합니다. 콘텐츠 세트로 그렇게 할 수 있습니다. 자세한 내용은 [Asset Publisher 구성을 콘텐츠 세트로 변환](./creating-collections.md#converting-asset-publisher-configurations-to-content-sets) 기사를 읽어보십시오.

## 관련 정보

- [컬렉션 만들기](./creating-collections.md)
- [컬렉션 표시](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md)
- [컬렉션 개인화](../../site-building/personalizing-site-experience/experience-personalization/personalizing-collections.md)
