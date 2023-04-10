# 컬렉션 개인화

{bdg-secondary}`사용 가능한 Liferay Portal 7.3 GA6 / DXP 7.3+`

기본적으로 모든 사용자는 컬렉션의 모든 콘텐츠를 볼 수 있으며 **누구나** 그룹의 일부입니다. [세그먼트](../segmentation/creating-and-managing-user-segments.md)을 사용하여 컬렉션 항목의 **맞춤형 변형** 을 생성할 수 있습니다. 맞춤형 변형을 사용할 때 컬렉션의 일부인 항목은 변경되지 않지만 컬렉션 페이지 또는 컬렉션 표시 조각에는 세그먼트에 대해 필터링된 항목이 표시됩니다.

```{note}
세그먼트를 사용하여 컬렉션을 사용자 지정하려면 먼저 세그먼트를 정의해야 합니다. 자세한 내용은 [사용자 세그먼트 생성 및 관리](../segmentation/creating-and-managing-user-segments.md)를 참조하십시오.
```

![컬렉션은 기본적으로 누구나 사용할 수 있습니다.](./personalizing-collections/images/01.png)

다음 예를 고려하십시오. 등록된 사용자에게 독점 프로모션을 제공하여 온라인 주방용품 매장에서 판매를 늘리고 싶습니다. 등록된 사용자를 위한 프로모션과 제품에 대한 뉴스를 포함하는 컬렉션을 만듭니다. 모든 사용자가 제품에 대한 뉴스를 볼 수 있기를 원하지만 프로모션은 등록된 사용자로 제한하려고 합니다. 이 예에서는 등록된 사용자에 대한 새 세그먼트를 생성하고 프로모션 콘텐츠를 필터링하는 새로운 맞춤형 변형에 세그먼트를 연결할 수 있습니다.

```{tip}
컬렉션에 대해 여러 개의 맞춤형 변형을 생성하고 필요에 따라 편집하거나 삭제할 수 있습니다. *Anyone* Personalized Variation을 편집할 수도 있지만 삭제할 수는 없습니다.
```

## 변형 우선 순위 지정

{bdg-secondary}`Liferay DXP 7.4+에 사용 가능`

사용자가 여러 세그먼트에 속할 수 있는 경우 컬렉션 변형에 우선 순위를 지정하여 사용자에게 표시되는 변형을 결정할 수 있습니다. 컬렉션을 편집할 때 맞춤형 변형에 대한 정렬 가능한 목록에 액세스할 수 있습니다. **작업** 버튼(![Actions Button](../../../images/icon-actions.png))을 클릭하고 **우선 순위 지정** 또는 **우선 순위 낮춤** 을 선택하여 변형 순위를 변경할 수 있습니다. 변형을 드래그 앤 드롭하여 우선 순위를 재정렬할 수도 있습니다.

```{note}
목록에서 각 항목의 사이트에 따라 우선순위가 지정됩니다. 가장 높은 우선 순위는 목록의 맨 위에 있는 사이트입니다.
```

![컬렉션 변형의 우선 순위를 지정하여 사용자에게 표시되는 변형을 결정할 수 있습니다.](./personalizing-collections/images/02.png)

## 맞춤형 변형 만들기

1. **사이트 관리** &rarr; **사이트 빌더** &rarr; **컬렉션** 로 이동합니다.
1. **컬렉션** 탭에서 사용자 지정하려는 컬렉션 옆에 있는 **옵션** 메뉴(![Options](../../../images/icon-staging-bar-options.png))를 클릭하고 **편집** 을 선택합니다.

    ![사용자 지정하려는 컬렉션 편집](./personalizing-collections/images/03.png)

1. **맞춤형 변형** 아래에서 **새 맞춤형 변형** 을 클릭하거나 새로 만들기 버튼(![New](../../../images/icon-plus.png))을 클릭합니다.
1. **New Personalized Variation** 대화 상자에서 이 컬렉션에 연결할 세그먼트를 클릭합니다.
1. 맞춤형 변형에 대한 속성을 구성합니다. 자세한 내용은 [컬렉션 만들기](../../../content-authoring-and-management/collections-and-collection-pages/creating-collections.md)을 참조하십시오.

    예를 들어 이것이 수동 수집인 경우 개인화 변형에 표시할 항목을 선택할 수 있습니다. 동적 컬렉션인 경우 필터를 추가하여 콘텐츠를 사용자 지정할 수 있습니다.

    ![맞춤형 변형에 대한 속성 구성](./personalizing-collections/images/04.png)

1. 동적 컬렉션을 사용자 지정하는 경우 **저장** 을 클릭합니다.
1. 이 컬렉션의 일부인 항목을 미리 보려면:
    - 수동 컬렉션에서 개인화된 변형의 이름을 클릭하면 항목을 볼 수 있습니다.
    - Dynamic Collection에서 Personalized Variation의 이름 옆에 있는 **옵션** 메뉴(![Options](../../../images/icon-staging-bar-options.png))를 클릭하고 **항목 보기** 를 선택합니다.

        ![사용자 지정하려는 컬렉션 편집](./personalizing-collections/images/05.png)

## 라이프레이 DXP 7.2

### 콘텐츠 세트 개인화

이제 [세그먼트](../segmentation/creating-and-managing-user-segments.md) 을 사용하여 콘텐츠 세트 개인화를 시연합니다. 이 예에서는 **홈** 페이지에 표시되는 기본값이 될 콘텐츠 세트를 만듭니다. 그런 다음 이를 수정하여 **American Engineers** 세그먼트의 구성원에 대한 기술 기사가 포함된 개인화된 변형을 생성합니다.

콘텐츠 세트에 익숙하지 않은 경우 여기에서 시작하기 전에 [콘텐츠 세트 만들기](../../../content-authoring-and-management/collections-and-collection-pages/creating-collections.md#creating-content-sets) 기사를 참조하십시오.

#### 기본 콘텐츠 세트 생성 및 설정

먼저 기본 콘텐츠 세트를 만들고 자산 게시자를 사용하여 홈 페이지에서 구성합니다.

1. **사이트 관리** &rarr; **콘텐츠 & 데이터** &rarr; **콘텐츠 세트** 로 이동합니다.
2. 추가 버튼(![Add](../../../images/icon-add.png))을 클릭하고 **수동 선택** 를 선택합니다.
3. 이름을 **홈 페이지 콘텐츠** 로 지정합니다.
4. 새 콘텐츠 세트의 경우 **자산 항목 옆에 있는** 선택 **을 클릭****기본 웹 콘텐츠** 를 선택합니다.

    ![새 자산 항목을 추가하려면 선택을 클릭하십시오.](./personalizing-collections/images/06.png)

5. **기본 웹 콘텐츠 선택** 페이지에서 추가할 콘텐츠 옆에 있는 상자를 체크하고 **추가** 를 클릭합니다.
6. **홈** 페이지로 이동하여 자산 게시자를 페이지에 추가합니다.
7. Asset Publisher에 대해 **구성** 을 엽니다.
8. **Asset Selection** 에서 **Content Set** 을 선택합니다.
9. **콘텐츠 세트** 선택에서 **선택** 을 클릭하고 **홈 페이지 콘텐츠** 를 선택하고 **저장** 을 클릭합니다.

이제 구성한 콘텐츠 세트가 **홈 페이지** 의 자산 게시자에 나타납니다. 다음으로 개인화를 위한 콘텐츠 세트를 구성합니다.

#### 콘텐츠 세트 개인화

이제 엔지니어를 위한 콘텐츠 세트를 생성하고 해당 디스플레이를 구성합니다.

1. **Site Administration** 의 콘텐츠 세트로 돌아갑니다.
2. **New Personalized Variation** 을 클릭하고 **American Engineers** 세그먼트를 선택합니다.

    ![새로운 개인화 변형을 생성합니다.](./personalizing-collections/images/07.png)

3. ***자산 항목 옆에 있는** 선택 **을 클릭하고** 기본 웹 콘텐츠*를 선택합니다.
4. 엔지니어링 독자에게 적합한 기사를 선택하고 **추가** 을 클릭하십시오.

이제 **American Engineers** 세그먼트의 구성원이 이 콘텐츠 세트가 표시되는 것을 볼 때마다 기본값이 아닌 개인화된 버전을 보게 됩니다. **Simulator** 을 사용하여 지금 이것을 테스트하십시오.

## 관련 정보

- [컨텐츠 페이지 개인화](./content-page-personalization.md)
- [컬렉션 및 컬렉션 페이지 정보](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)
- [사용자 세그먼트 생성](../segmentation/creating-and-managing-user-segments.md)
- [사용자 세그먼트에 역할 할당](../../../users-and-permissions/roles-and-permissions/assigning-roles-to-user-segments.md)
