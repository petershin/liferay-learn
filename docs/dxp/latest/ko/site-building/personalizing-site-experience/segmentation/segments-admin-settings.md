# 세그먼트 관리자 설정

{bdg-secondary}`사용 가능한 Liferay DXP/Portal 7.3+`

시스템 또는 인스턴스 수준에서 세그먼트 동작을 구성할 수 있습니다. 이러한 설정을 통해 세그먼테이션을 활성화/비활성화하고, Analytics Cloud 세그먼트를 Liferay DXP와 동기화하는 간격을 설정하고, 세션 기반 세그먼트 속성을 생성하는 등의 작업을 수행할 수 있습니다.

세그먼트 설정에 액세스합니다,

1. *글로벌 메뉴*열기 ![글로벌 메뉴](../../../images/icon-applications-menu.png)를 클릭하고 *제어판* 탭을 클릭한 다음 *시스템 설정* 또는 *인스턴스 설정*으로 이동합니다.

   ```{note}
   Liferay DXP 7.4 U38+/GA38+부터는 인스턴스 수준에서 세그먼트 설정을 구성할 수 있습니다.
   ```

1. 콘텐츠 및 데이터 아래의 *세그먼트* 를 클릭합니다.

시스템 및 인스턴스 범위가 어떻게 작동하는지 알아보려면 [구성 범위 이해](../../../system-administration/configuring-liferay/understanding-configuration-scope.md) 를 참조하세요.

## 애널리틱스 클라우드 세그먼트

![애널리틱스 클라우드 세그먼트 설정을 보고 구성합니다.](./segments-admin-settings/images/01.png)

[세그먼트](https://learn.liferay.com/analytics-cloud/latest/ko/people/segments/segments.html) 는 공통 속성 및 행동을 기반으로 개인을 집계합니다. 이 데이터를 Liferay DXP의 세그먼트와 통합하여 알려진 사용자와 익명 사용자 모두에게 관심 있는 콘텐츠를 제공할 수 있습니다.

*에서 이러한 설정에 액세스할 수 있습니다. 애널리틱스 클라우드 세그먼트*:

**익명 사용자 세그먼트 캐시 만료 시간**: 익명 세그먼트 캐시가 저장되는 기간에 대한 제한 시간(초)을 설정합니다. 시간이 만료되면 캐시가 지워집니다.

**이자 조건 캐시 만료 시간**: 이자 조건 캐시가 저장되는 기간에 대한 제한 시간(초)을 설정합니다. 시간이 만료되면 캐시가 지워집니다. 자세한 내용은 [관심사 이해](https://learn.liferay.com/analytics-cloud/latest/en/people/individuals/understanding-interests.md) 를 참조하세요.

**업데이트 간격**: 애널리틱스 클라우드 세그먼트에서 업데이트를 수신하는 간격(분)을 설정합니다. 이 설정은 시스템 설정에서만 나타납니다.

## 세션 속성 어휘

*세션 속성 어휘집*을 사용하면 미리 정의된 값을 사용하여 [세션 기반 세그먼트 속성](../../../site-building/personalizing-site-experience/segmentation/segments-editor-ui-reference.md#session-properties) 을 만들 수 있습니다. 이 기능은 수동 입력 오류를 제거하면서 세그먼트를 정의하므로 사용자가 미리 정의된 값 목록에서 속성을 선택하도록 하려는 경우에 유용합니다. 자세한 내용은 [세션 속성 어휘집](../../../content-authoring-and-management/tags-and-categories/session-property-vocabularies.md) 을 참조하세요.

## 세그먼트 서비스

![세그먼트 서비스 설정을 보고 구성합니다.](./segments-admin-settings/images/02.png)

*세그먼트 서비스*에서 이러한 설정에 액세스할 수 있습니다:

**세분화 활성화**: 세분화를 활성화 또는 비활성화합니다. 비활성화된 상태에서는 Liferay가 최종 사용자에게 개인화된 컬렉션 및 경험의 변형을 표시하지 않습니다.

**세그먼트별 역할 할당 활성화**: 글로벌 세그먼트를 사용하여 사용자에게 동적으로 역할을 할당하는 기능을 사용하거나 사용하지 않도록 설정합니다. 활성화된 상태에서는 변경되는 개인 그룹에 자동으로 역할을 할당할 수 있습니다. 자세한 내용은 [사용자 세그먼트에 역할 할당하기](../../../users-and-permissions/roles-and-permissions/assigning-roles-to-user-segments.md) 를 참조하세요.

**복합 세그먼트 간격**: 규칙에 따라 복합 세그먼트를 확인하고 새로 고치는 간격(분)을 설정합니다. 이 설정은 시스템 설정에서만 나타납니다.

```{note}
구성 범위](../../../시스템-관리/구성-라이프레이/이해-구성-범위.md)를 참고하세요. 시스템 수준에서 비활성화된 설정은 인스턴스 수준에서 활성화할 수 없지만, 시스템 수준에서 활성화된 설정은 인스턴스 수준에서 비활성화할 수 있습니다.
```

## 관련 주제

* [세그먼트](https://learn.liferay.com/analytics-cloud/latest/ko/people/segments/segments.html)
* [세션 속성 어휘](../../../content-authoring-and-management/tags-and-categories/session-property-vocabularies.md)
