# 잠재고객 타겟팅에서 수동으로 마이그레이션

대상 사용자 세그먼트와 Liferay 7.2+ 세그먼트 간의 유사성으로 인해 대부분의 구성은 업그레이드 중에 Liferay Segmentation으로 자동 전송됩니다(자세한 내용은 [사용자 세그먼트 마이그레이션](./migrating-user-segments.md) 참조). 그러나 일부 대상자 타겟팅 규칙은 Liferay 7.2+ 세분화와 직접적으로 동일하지 않습니다. 여기에서 각 규칙 유형에 대한 권장 솔루션을 찾을 수 있습니다.

## 사용자 속성 규칙

성별 또는 연령과 같은 일부 사용자 속성은 Liferay 7.2+에서 직접적으로 상응하는 속성이 없습니다. Facebook과 같은 외부 소스에서 검색된 사용자 속성에도 대체 항목이 없습니다. 이를 대체하려면 사용자 정의 사용자 필드를 생성하고 [이를 사용](../../../users-and-permissions/users/adding-custom-fields-to-users.md) 새 세그먼트를 정의해야 합니다.

## 세션 규칙

직접적으로 상응하는 항목이 없는 세션 속성의 경우 현재 URL의 URL 필드나 사이트에서 이전에 방문한 URL을 기준으로 사용하세요. 고급 세션 추적이 필요한 경우 쿠키를 사용하세요.

## 행동 규칙

Liferay 7.2+부터 행동 기반 규칙은 Analytics Cloud를 사용하여 관리됩니다. 자세한 내용은 [세그먼트](https://learn.liferay.com/w/analytics-cloud/people/segments/segments) 참조하십시오.

## 맞춤 규칙 마이그레이션

Liferay 7.2+로 마이그레이션하기 전에 최신 Liferay 세분화 기능을 고려하여 대상 타겟팅 사용자 정의 규칙을 평가하십시오. [Liferay 세그먼트의 속성](../segmentation/segments-editor-ui-reference.md) 이 대상 타겟팅 사용자 정의 규칙을 대체할 수 있는 방법을 확인하는 것부터 시작하세요.

규칙을 완전히 다시 구현해야 하는 경우 [사용자 세그먼트 생성 및 관리](../segmentation/creating-and-managing-user-segments.md) 의 정보를 따르십시오.

## 표시 속성 마이그레이션

잠재고객 타겟팅을 사용하면 사용자 세그먼트 콘텐츠 표시 또는 자산 게시자 개인화를 사용하여 개인화된 콘텐츠를 표시할 수 있습니다. Audience Targeting을 통해 콘텐츠를 개인화하는 데 사용하는 방법에 따라 Liferay Segmentation에서 이 콘텐츠를 개인화하는 방법이 결정됩니다.

| 잠재고객 타겟팅 방법     | Liferay 분할 방법                                                                                                                                                  |
| :-------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 사용자 세그먼트 콘텐츠 표시 | [수동 콘텐츠 세트 또는 컬렉션](../../../site-building/displaying-content/collections-and-collection-pages/creating-collections.md#creating-a-manual-collection) |
| 자산 게시자 개인화      | [동적 콘텐츠 세트](../../../site-building/displaying-content/collections-and-collection-pages/creating-collections.md#creating-a-dynamic-collection)       |

```{note}
Liferay 7.2 사용자의 경우 컬렉션은 [콘텐츠 세트](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md#liferay-dxp-7-2) 로 참조됩니다.
```

콘텐츠 세트를 사용하든 컬렉션을 사용하든 [개인화된 변형](../experience-personalization/personalizing-collections.md) 을 사용하여 콘텐츠를 개인화할 수 있습니다.

또한 [콘텐츠 페이지 개인화](../../../site-building/personalizing-site-experience/experience-personalization/content-page-personalization.md) 기능은 이전에 잠재고객 타겟팅 방법 중 하나로 해결했던 사용 사례를 충족할 수 있습니다.

## 관련 정보

* [사용자 정의 사용자 필드 만들기](../../../users-and-permissions/users/adding-custom-fields-to-users.md)
* [세그먼트 편집기 UI 참조](../segmentation/segments-editor-ui-reference.md)
* [컬렉션 만들기](../../../site-building/displaying-content/collections-and-collection-pages/creating-collections.md)
* [세그먼트](https://learn.liferay.com/w/analytics-cloud/people/segments/segments)
