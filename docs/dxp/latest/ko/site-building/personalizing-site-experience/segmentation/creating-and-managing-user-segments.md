# 사용자 세그먼트 생성 및 관리

**세그먼트** 을 사용하면 사용자 **직위** 또는 사용자 **언어** 와 같은 공통 속성 집합을 기반으로 다양한 사용자 그룹을 만들 수 있습니다. 세그먼트를 정의하는 데 사용할 수 있는 속성 목록은 세그먼트 편집기 UI 참조 [을 참조](./segments-editor-ui-reference.md). 기존 속성 외에도 사용자 및 조직 그룹에 대해 [개의 사용자 정의 필드](../../../system-administration/configuring-liferay/adding-custom-fields.md) 을 추가하고 세그먼트 기준에서 이러한 필드를 사용할 수 있습니다.

## 복합 세그먼트

{bdg-secondary}`사용 가능한 Liferay DXP/Portal 7.3+`

기존 세그먼트를 결합하여 새로운 **복합 세그먼트** 을 생성할 수 있습니다. 복합 세그먼트는 기반이 되는 세그먼트에서 속성을 상속하고 멤버를 자동으로 업데이트합니다. 추가 속성을 추가하여 복합 세그먼트를 추가로 사용자 지정할 수 있습니다.

복합 세그먼트의 작동 방식을 이해하려면 다음 예를 고려하십시오. 미국과 캐나다의 방문자는 서로 다른 요구 사항을 가지고 있으므로 속성이 다른 두 개의 세그먼트(각 국가에 대해 하나의 세그먼트)를 생성합니다. 나중에 미국 및 캐나다 세그먼트의 속성을 수동으로 복사하는 북미 방문자를 위한 새 표준 세그먼트를 만듭니다. 미국 또는 캐나다 세그먼트의 속성을 변경하면 북미 세그먼트는 변경 사항을 상속하지 않습니다. 이러한 변경 사항을 반영하려면 북미 세그먼트를 수동으로 업데이트해야 합니다. 그러나 북미 세그먼트를 복합 세그먼트로 생성하면 미국 또는 캐나다 세그먼트를 변경할 때 이 복합 세그먼트가 해당 정의 및 구성원을 자동으로 업데이트합니다.

```{important}
기존 복합 세그먼트를 사용하여 새 세그먼트를 생성할 수 없습니다.
```

![두 개 이상의 세그먼트를 결합하여 새로운 복합 세그먼트 생성](./creating-and-managing-user-segments/images/08.png)

## 사용자 세그먼트 생성

다음 단계에서는 새 세그먼트를 만드는 방법을 설명합니다.

1. 화면 왼쪽의 사이트 메뉴에서 **People** &rarr; **Segments** 로 이동합니다.

    ![People 메뉴에서 사용자 세그먼트를 추가합니다.](./creating-and-managing-user-segments/images/01.png)

1. **추가** 버튼(![Add](../../../images/icon-add.png))을 클릭합니다.

1. 상단 텍스트 영역을 클릭하고 사용자 세그먼트의 이름을 입력합니다.

   ```{tip}
   세그먼트 이름 옆에 있는 플래그 선택기를 사용하여 세그먼트 이름을 번역할 수 있습니다.
   ```

1. **속성** 영역에서 그룹과 속성을 선택하여 세그먼트를 정의합니다. **속성** 을 **조건** 영역으로 끌어다 놓습니다.

1. 세그먼트에 대한 조건을 구성합니다(아래 [세그먼트의 조건 구성](#configuring-segment-conditions) 참조).

1. **저장** 을 클릭합니다.

### 세그먼트 조건 구성

**조건** 영역에는 다음과 같은 옵션이 있습니다.

- 비교 드롭다운 메뉴(A)를 사용하여 비교 기준을 편집합니다.
- 조건 이름(B) 옆에 있는 버튼을 사용하여 동일한 **속성** 그룹에서 **조건** 을 추가하거나 제거합니다.
- **속성**(C)을 드래그 앤 드롭하여 다른 **속성** 그룹을 사용하여 조건을 추가합니다.
- **조건** 을 **AND** 및 **OR** 연산자(D 및 E)와 결합합니다.

   ![조건을 추가하고 결합하여 세그먼트 기준을 정의합니다.](./creating-and-managing-user-segments/images/06.png)

[세션 속성](./segments-editor-ui-reference.md#session-properties) 의 경우 [세션 속성 어휘](../../../content-authoring-and-management/tags-and-categories/session-property-vocabularies.md)을 사용하여 미리 정의된 값 목록을 구성할 수 있습니다. 이 옵션은 세그먼트 정의 작업을 용이하게 하고 수동 입력 오류를 제거합니다.

```{note}
Liferay DXP 7.4 U42+/GA42+부터 지리적 사이트별로 세그먼트를 생성할 수 있습니다. 자세한 내용은 [Geolocation별 세분화](./segmentation-by-geolocation.md)를 참조하세요.
```

편집할 때 기준을 충족하는 구성원 수가 조건 영역 상단에 나타납니다. **회원 보기** 을 클릭하면 목록을 볼 수 있습니다. 이렇게 하면 세그먼트를 올바르게 정의하고 있는지 확인할 수 있습니다.

![언제든지 세그먼트 구성원 목록을 볼 수 있습니다.](./creating-and-managing-user-segments/images/04.png)

사용자 세그먼트를 만든 후 **세그먼트** 페이지의 사용자 세그먼트 목록에서 볼 수 있습니다. 여기에서 작업 메뉴(![Actions](../../../images/icon-actions.png))를 통해 사용자 세그먼트를 관리(수정, 삭제, [사이트 역할 할당](../../../users-and-permissions/roles-and-permissions/assigning-roles-to-user-segments.md)또는 권한 변경(사용자 세그먼트에 액세스할 수 있는 사람))할 수 있습니다. 사용자 세그먼트의 이름을 클릭하여 편집할 수도 있습니다.

![작업 메뉴에서 권한을 수정, 삭제 또는 관리할 수 있습니다.](./creating-and-managing-user-segments/images/05.png)

```{note}
경험에서 사용 중인 사용자 세그먼트는 삭제할 수 없습니다.
```

## 관련 정보

* [사용자 세그먼트에 역할 할당](../../../users-and-permissions/roles-and-permissions/assigning-roles-to-user-segments.md)
* [사용자 세그먼트에 대한 분석 얻기](./getting-analytics-for-user-segments.md)
* [컨텐츠 페이지 개인화](../experience-personalization/content-page-personalization.md)
* [세션 속성 어휘](../../../content-authoring-and-management/tags-and-categories/session-property-vocabularies.md)
