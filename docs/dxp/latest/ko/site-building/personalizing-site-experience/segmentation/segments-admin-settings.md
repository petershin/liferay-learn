# 세그먼트 관리 설정

{bdg-secondary}`사용 가능한 Liferay DXP/Portal 7.3+`

시스템 또는 인스턴스 수준에서 세그먼트 동작을 구성할 수 있습니다. 이러한 설정을 사용하여 세분화를 활성화/비활성화하고, Analytics Cloud 세그먼트를 Liferay DXP와 동기화하는 간격을 설정하고, 세션 기반 세그먼트 속성을 생성하는 등의 작업을 수행할 수 있습니다.

세그먼트 설정에 액세스하려면

1. *글로벌 메뉴 열기* ![글로벌 메뉴](../../../images/icon-applications-menu.png), *제어판* 탭을 클릭하고 *시스템 설정* 또는 *인스턴스 설정*로 이동합니다.

   ```{note}
   Liferay DXP 7.4 U38+/GA38+부터 인스턴스 수준에서 세그먼트 설정을 구성할 수 있습니다.
   ```

1. 콘텐츠 및 데이터에서 *세그먼트* 을 클릭합니다.

시스템 및 인스턴스 범위가 작동하는 방법을 알아보려면 [구성 범위 이해](../../../system-administration/configuring-liferay/understanding-configuration-scope.md) 을 참조하십시오.

## 애널리틱스 클라우드 세그먼트

![Analytics Cloud 세그먼트 설정을 보고 구성합니다.](./segments-admin-settings/images/01.png)

[세그먼트](https://learn.liferay.com/analytics-cloud/latest/ko/people/segments/segments.html) 은 공통 속성 및 행동을 기반으로 개인을 집계합니다. 이 데이터를 Liferay DXP의 세그먼트와 통합하여 알려진 사용자와 익명 사용자 모두에게 관심 있는 콘텐츠를 전달할 수 있습니다.

*Analytics Cloud Segments*에서 다음 설정에 액세스할 수 있습니다.

**익명 사용자 세그먼트 캐시 만료 시간**: 익명 세그먼트 캐시가 저장되는 시간 제한(초)을 설정합니다. 시간이 만료되면 캐시가 지워집니다.

**관심 용어 캐시 만료 시간**: 관심 용어 캐시가 저장되는 시간 제한(초)을 설정합니다. 시간이 만료되면 캐시가 지워집니다. 자세한 내용은 [관심사 이해](https://learn.liferay.com/analytics-cloud/latest/en/workspace-data/definitions/managing-interest-topics.html#understanding-interests) 을 참조하십시오.

**업데이트 간격**: Analytics Cloud 세그먼트에서 업데이트를 수신하는 간격(분)을 설정합니다. 이 설정은 시스템 설정 아래에만 나타납니다.

## 세션 속성 어휘

*세션 속성 어휘*을 사용하면 미리 정의된 값을 사용하여 [세션 기반 세그먼트 속성](../../../site-building/personalizing-site-experience/segmentation/segments-editor-ui-reference.md#session-properties) 을 생성할 수 있습니다. 이것은 수동 입력 오류를 제거하면서 세그먼트를 정의하기 때문에 사용자가 미리 정의된 값 목록에서 속성을 선택하도록 하려는 경우에 유용합니다. 자세한 내용은 [세션 속성 어휘](../../../content-authoring-and-management/tags-and-categories/session-property-vocabularies.md) 을 참조하십시오.

## 세그먼트 서비스

![세그먼트 서비스 설정을 보고 구성합니다.](./segments-admin-settings/images/02.png)

*세그먼트 서비스*에서 이러한 설정에 액세스할 수 있습니다.

**분할 활성화**: 분할을 활성화 또는 비활성화합니다. 비활성화된 동안 Liferay는 최종 사용자에게 개인화된 컬렉션 및 경험을 표시하지 않습니다.

**세그먼트별 역할 할당 활성화**: 글로벌 세그먼트를 사용하여 동적으로 사용자에게 역할 할당을 활성화 또는 비활성화합니다. 활성화된 상태에서 변화하는 개인 그룹에 자동으로 역할을 할당할 수 있습니다. 자세한 내용은 [사용자 세그먼트에 역할 할당](../../../users-and-permissions/roles-and-permissions/assigning-roles-to-user-segments.md) 을 참조하십시오.

**복합 세그먼트 간격**: 규칙에 따라 복합 세그먼트를 확인하고 새로 고치는 간격(분)을 설정합니다. 이 설정은 시스템 설정 아래에만 나타납니다.

```{note}
[구성 범위](../../../system-administration/configuring-liferay/understanding-configuration-scope.md)에 유의하십시오. 시스템 수준에서 비활성화된 설정은 인스턴스 수준에서 활성화할 수 없지만 시스템 수준에서 활성화된 설정은 인스턴스 수준에서 비활성화할 수 있습니다.
```

## 추가 정보

* [세그먼트](https://learn.liferay.com/analytics-cloud/latest/ko/people/segments/segments.html)
* [세션 속성 어휘](../../../content-authoring-and-management/tags-and-categories/session-property-vocabularies.md)
