# 사용자 세그먼트 생성 및 관리

_세그먼트_를 사용하면 사용자 _직위_ 또는 사용자 _언어_와 같은 공통 속성 세트를 기반으로 다양한 사용자 그룹을 생성할 수 있습니다. 세그먼트를 정의하는 데 사용할 수 있는 속성 목록은 세그먼트 편집기 UI 참조 [세그먼트 편집기 UI 참조](./segments-editor-ui-reference.md) 참조하세요. 기존 속성 외에도 사용자 및 조직 그룹에 대해 [사용자 정의 필드](../../../system-administration/configuring-liferay/adding-custom-fields.md) 을 추가하고 세그먼트 기준에 이러한 필드를 사용할 수 있습니다.

## 복합 세그먼트

{bdg-secondary}`liferay DXP/포탈 7.3+`

기존 세그먼트를 결합하여 새로운 _복합 세그먼트_를 생성할 수 있습니다. 복합 세그먼트는 기반이 되는 세그먼트의 속성을 상속하고 구성원을 자동으로 업데이트합니다. 추가 속성을 추가하여 복합 세그먼트를 추가로 사용자 정의할 수 있습니다.

복합 세그먼트의 작동 방식을 이해하려면 다음 예를 고려하십시오. 미국과 캐나다 방문자는 요구 사항이 다르므로 속성이 다른 두 개의 세그먼트(각 국가당 하나씩)를 만듭니다. 나중에 미국 및 캐나다 세그먼트의 속성을 수동으로 복사하는 북미 방문자를 위한 새로운 표준 세그먼트를 만듭니다. 미국 또는 캐나다 세그먼트의 속성을 변경하면 북미 세그먼트는 변경 사항을 상속하지 않습니다. 이러한 변경 사항을 반영하려면 북미 세그먼트를 수동으로 업데이트해야 합니다. 그러나 북미 세그먼트를 복합 세그먼트로 생성하는 경우 미국 또는 캐나다 세그먼트를 변경할 때 이 복합 세그먼트는 해당 정의와 멤버를 자동으로 업데이트합니다.

```{important}
기존 복합 세그먼트를 사용하여 새 세그먼트를 생성할 수 없습니다.
```

![Combine two or more segments to create a new Compound Segment](./creating-and-managing-user-segments/images/08.png)

## 사용자 세그먼트 생성

다음 단계에서는 새 세그먼트를 만드는 방법을 설명합니다.

1. 화면 왼쪽의 사이트 메뉴에서 _사람_ &rarr; _세그먼트_로 이동합니다.

   ![Add User Segments from the People Menu.](./creating-and-managing-user-segments/images/01.png)

1. _추가_ 버튼(![추가](../../../images/icon-add.png))을 클릭합니다.

1. 상단 텍스트 영역을 클릭하고 사용자 세그먼트의 이름을 입력하세요.

   ```{tip}
   세그먼트 이름 옆에 있는 플래그 선택기를 사용하여 세그먼트 이름을 번역할 수 있습니다.
   ```

1. _속성_ 영역에서 그룹과 속성을 선택하여 세그먼트를 정의하세요. _속성_을 _조건_ 영역으로 끌어서 놓습니다.

1. 세그먼트에 대한 조건을 구성합니다(아래 [세그먼트 조건 설정](#configuring-segment-conditions)을 참조하세요).

1. _저장_을 클릭하세요.

### 세그먼트 조건 구성

_조건_ 영역에는 다음과 같은 옵션이 있습니다.

- 비교 드롭다운 메뉴(A)를 사용하여 비교 기준을 편집합니다.
- 조건 이름(B) 옆에 있는 버튼을 사용하여 동일한 _속성_ 그룹에서 _조건_을 추가하거나 제거합니다.
- _속성_(C)을 끌어서 놓아 다른 _속성_ 그룹을 사용하여 조건을 추가합니다.
- _조건_을 _AND_ 및 _OR_ 연산자(D 및 E)와 결합합니다.

  ![Add and combine Conditions to define the Segment criteria.](./creating-and-managing-user-segments/images/06.png)

[세션 속성](./segments-editor-ui-reference.md#session-properties) 의 경우 [세션 속성 어휘](../../../content-authoring-and-management/tags-and-categories/session-property-vocabularies.md) 사용하여 사전 정의된 값 목록을 구성할 수 있습니다. 이 옵션을 사용하면 세그먼트 정의 작업이 쉬워지고 수동 입력 오류가 발생하지 않습니다.

```{note}
Liferay DXP 7.4 U42+/GA42+부터 지리적 사이트
별로 세그먼트를 생성할 수 있습니다. 자세한 내용은 [지리적 사이트
별 분할](./segmentation-by-geolocation.md) 을 참조하세요.
```

편집할 때 기준을 충족하는 구성원 수가 조건 영역 상단에 나타납니다. _회원보기_를 클릭하시면 목록을 보실 수 있습니다. 이는 세그먼트를 올바르게 정의하고 있는지 확인하는 데 도움이 됩니다.

![You can view the list of Segment members at any time.](./creating-and-managing-user-segments/images/04.png)

사용자 세그먼트를 만든 후에는 *세그먼트* 페이지의 사용자 세그먼트 목록에서 볼 수 있습니다. 여기에서 사용자 세그먼트의 작업 메뉴(![작업](../../../images/icon-actions.png)를 통해 사용자 세그먼트를 관리(편집, 삭제, [사이트 역할 할당](../../../users-and-permissions/roles-and-permissions/assigning-roles-to-user-segments.md))하거나 사용자 세그먼트에 액세스할 수 있는 권한(사용자 세그먼트에 액세스할 수 있는 사람)을 변경할 수 있습니다. 사용자 세그먼트의 이름을 클릭하여 편집할 수도 있습니다.

![You can edit, delete or manage permissions from the actions menu.](./creating-and-managing-user-segments/images/05.png)

```{note}
경험에 사용된 사용자 세그먼트는 삭제할 수 없습니다.
```

## 관련 정보

* [사용자 세그먼트에 역할 할당](../../../users-and-permissions/roles-and-permissions/assigning-roles-to-user-segments.md)
* [사용자 세그먼트에 대한 분석 받기](./getting-analytics-for-user-segments.md)
* [콘텐츠 페이지 개인화](../experience-personalization/content-page-personalization.md)
* [세션 속성 어휘](../../../content-authoring-and-management/tags-and-categories/session-property-vocabularies.md)
