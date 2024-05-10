# 세그먼트 관리 설정

{bdg-secondary}`liferay DXP/포탈 7.3+`

시스템 또는 인스턴스 수준에서 세그먼트 동작을 구성할 수 있습니다. 이러한 설정을 사용하면 세분화를 활성화/비활성화하고, Analytics Cloud 세그먼트를 Liferay DXP와 동기화하는 간격을 설정하고, 세션 기반 세그먼트 속성을 생성하는 등의 작업을 수행할 수 있습니다.

세그먼트 설정에 액세스하려면

1. **전역 메뉴** ![전역 메뉴](../../../images/icon-applications-menu.png)를 열고 **제어판** 탭을 클릭한 다음 **시스템 설정** 또는 **인스턴스로 이동합니다. 설정** .

   ```{note}
   Liferay DXP 7.4 U38+/GA38+부터는 인스턴스 수준에서 세그먼트 설정을 구성할 수 있습니다.
   ```

1. 콘텐츠 및 데이터에서 **세그먼트** 를 클릭하세요.

시스템 및 인스턴스 범위의 작동 방식을 알아보려면 [구성 범위 이해](../../../system-administration/configuring-liferay/understanding-configuration-scope.md)를 참조하세요.

## 애널리틱스 클라우드 세그먼트

![View and configure Analytics Cloud Segments settings.](./segments-admin-settings/images/01.png)

[세그먼트](https://learn.liferay.com/w/analytics-cloud/people/segments/segments) 공통 속성 및 행동을 기반으로 개인을 집계합니다. 이 데이터를 Liferay DXP의 세그먼트와 통합하여 알려진 사용자와 익명 사용자 모두에게 관심 있는 콘텐츠를 제공할 수 있습니다.

**Analytics Cloud Segments** 에서 다음 설정에 액세스할 수 있습니다.

**익명 사용자 세그먼트 캐시 만료 시간** : 익명 세그먼트 캐시가 저장되는 기간에 대한 시간 제한(초)을 설정합니다. 시간이 만료되면 캐시가 지워집니다.

**관심 용어 캐시 만료 시간** : 관심 용어 캐시가 저장되는 기간에 대한 시간 제한(초)을 설정합니다. 시간이 만료되면 캐시가 지워집니다. 자세한 내용은 [관심사 이해](https://learn.liferay.com/w/analytics-cloud/people/individuals/understanding-interests) 참조하세요.

**업데이트 간격** : Analytics Cloud 세그먼트에서 업데이트를 수신하는 간격(분)을 설정합니다. 이 설정은 시스템 설정에만 나타납니다.

## 세션 속성 어휘

**세션 속성 어휘** 를 사용하면 사전 정의된 값을 사용하여 [세션 기반 세그먼트 속성](../../../site-building/personalizing-site-experience/segmentation/segments-editor-ui-reference.md#session-properties) 을 생성할 수 있습니다. 이는 수동 입력 오류를 제거하면서 세그먼트를 정의하므로 사용자가 미리 정의된 값 목록에서 속성을 선택하도록 할 때 도움이 됩니다. 자세한 내용은 [세션 속성 어휘](../../../content-authoring-and-management/tags-and-categories/session-property-vocabularies.md) 참조하세요.

## 세그먼트 서비스

![View and configure Segments Service settings.](./segments-admin-settings/images/02.png)

**세그먼트 서비스** 에서 다음 설정에 액세스할 수 있습니다.

**분할 활성화** : 분할을 활성화 또는 비활성화합니다. 비활성화된 동안 Liferay는 최종 사용자에게 컬렉션 및 경험의 개인화된 변형을 표시하지 않습니다.

**세그먼트별 역할 할당 활성화** : 글로벌 세그먼트를 사용하여 사용자에게 동적으로 역할 할당을 활성화 또는 비활성화합니다. 활성화된 동안 변화하는 개인 그룹에 역할을 자동으로 할당할 수 있습니다. 자세한 내용은 [사용자 세그먼트에 역할 할당](../../../users-and-permissions/roles-and-permissions/assigning-roles-to-user-segments.md) 참조하세요.

**복합 세그먼트 간격** : 규칙에 따라 복합 세그먼트를 확인하고 새로 고치는 간격(분)을 설정합니다. 이 설정은 시스템 설정에만 나타납니다.

```{note}
[구성 범위](../../../system-administration/configuring-liferay/understanding-configuration-scope.md) 에 유의하세요. 시스템 수준에서 비활성화된 설정은 인스턴스 수준에서 활성화할 수 없지만, 시스템 수준에서 활성화된 설정은 인스턴스 수준에서 비활성화할 수 있습니다.
```

## 관련 주제

* [세그먼트](https://learn.liferay.com/w/analytics-cloud/people/segments/segments)
* [세션 속성 어휘](../../../content-authoring-and-management/tags-and-categories/session-property-vocabularies.md)
