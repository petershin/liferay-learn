# 컬렉션 만들기

```{note}
이 정보는 Liferay DXP 7.3+에 적용됩니다. 이전 Liferay DXP 버전의 경우 [Liferay DXP 7.2](#liferay-dxp-7-2) 참조하세요.
```

**수동** 또는 **동적** 컬렉션을 만들 수 있습니다. 다양한 유형의 컬렉션에 대한 자세한 내용은 [컬렉션 및 컬렉션 페이지 정보](./about-collections-and-collection-pages.md) 을 참조하세요.

## 수동 컬렉션 생성

1. **사이트 관리** &rarr; **사이트 빌더** &rarr; **컬렉션** 으로 이동합니다.

1. **새로 만들기** 버튼(![추가](../../../images/icon-add.png))을 클릭하고 **수동 수집** 을 선택합니다.

1. 수동 컬렉션의 **제목** 을 추가하고 **저장** 을 클릭하세요.

1. **아이템 유형** 드롭다운 메뉴에서 컬렉션에 포함하려는 아이템 유형을 선택하세요.
   - 하나의 항목 유형만 포함하려는 경우

     1. **단일 품목 유형** 에서 유형을 선택합니다.
     1. 선택적으로 **아이템 유형** 에 하위 유형이 포함된 경우 **아이템 하위 유형** 드롭다운 메뉴에서 이를 선택하세요.
     1. **저장** 을 클릭하세요.

     ![Configure the content Type and Subtype for the Manual Collection](./creating-collections/images/01.png)

   - 두 개 이상의 항목 유형을 포함하려는 경우

     1. **여러 항목 유형** 에서 **하나 이상 선택** 을 선택합니다.
     1. 이중 목록 상자에서 컬렉션에 포함할 항목 유형을 추가하거나 제거합니다.

     ![Select the different item Types for the Manual Collection](./creating-collections/images/02.png)

1. **저장** 을 클릭하세요.

1. **컬렉션 항목** 옆에 있는 **선택** 을 클릭하고 항목 유형 중 하나를 선택하세요.

   ![Select the items you want to include in the Manual Collection](./creating-collections/images/03.png)

1. 선택 대화 상자에서 포함하려는 항목을 선택하십시오.

1. **추가** 를 클릭하세요.

1. 수동 컬렉션에 둘 이상의 항목 유형이 포함된 경우 다른 유형에 대해 6\~8단계를 반복합니다.

문서 및 미디어 폴더와 웹 콘텐츠 폴더를 컬렉션에 추가할 수 있습니다.

```{note}
문서, 미디어 및 웹 콘텐츠 폴더를 컬렉션에 추가할 수 있지만 해당 폴더가 컬렉션 페이지 또는 자산 게시자 위젯에 게시되면 콘텐츠가 표시되지 않습니다. 이러한 자산이 컬렉션에 추가되더라도 별도로 볼 수만 있습니다. 이는 알려진 제한사항이며 향후 릴리스에서 수정될 예정입니다.
```

## 동적 컬렉션 만들기

1. **사이트 관리** &rarr; **사이트 빌더** &rarr; **컬렉션** 으로 이동합니다.

1. **새로 만들기** 버튼(![추가](../../../images/icon-add.png))을 클릭하고 **동적 컬렉션** 을 선택합니다.

1. 수동 컬렉션의 **제목** 을 추가하고 **저장** 을 클릭하세요.

1. **아이템 유형** 드롭다운 메뉴에서 컬렉션에 포함하려는 아이템 유형을 선택하세요.
   - 하나의 항목 유형만 포함하려는 경우

     1. **단일 품목 유형** 에서 유형을 선택합니다.
     1. 선택적으로 **아이템 유형** 에 하위 유형이 포함된 경우 **아이템 하위 유형** 드롭다운 메뉴에서 이를 선택하세요.
     1. 특정 필드를 기준으로 **항목 하위 유형** 을 필터링하려면 **필드 기준 필터링** 스사이트
를 활성화하고 **선택** 을 클릭한 다음 필드를 선택하고 **적용** 을 클릭하세요.
     1. **저장** 을 클릭하세요.

     ![You can filter the Item Subtype in your Collection by one of the item fields](./creating-collections/images/09.gif)

   - 두 개 이상의 항목 유형을 포함하려면

     1. **여러 항목 유형** 에서 **유형 선택** 을 선택합니다.
     1. 이중 목록 상자에서 컬렉션에 포함할 항목 유형을 추가하거나 제거합니다.

     ![Select the different item Types for the Manual Collection](./creating-collections/images/02.png)

1. **범위** , **필터** , **콘텐츠 추천** 또는 **순서** 를 기반으로 동적 컬렉션에 대한 기준을 구성합니다.

   **범위:** 동적 컬렉션의 항목 소스를 정의합니다. 기본적으로 소스는 현재 사이트입니다.

   **필터:** 동적 컬렉션의 항목에 대한 규칙을 구성합니다. 예를 들어 "프로모션" 태그가 있는 항목만 포함할 수 있습니다.

   ![Filter your Dynamic Collection by adding one or more rules.](./creating-collections/images/10.png)

    ```{tip}
    추가 버튼을 클릭하면 필터에 여러 규칙을 추가할 수 있습니다. 동적 컬렉션의 최종 콘텐츠는 모든 규칙을 추가한 결과입니다.
    ```
   **콘텐츠 권장 사항:** 사용자 행동에 따라 콘텐츠를 표시하려면 이 옵션을 활성화합니다. 자세한 내용은 [콘텐츠 추천 구성](../../../site-building/personalizing-site-experience/experience-personalization/configuring-content-recommendations.md) 참조하세요.

   ```{note}
   콘텐츠 추천 옵션은 DXP 인스턴스를 Analytics Cloud에 연결하고 콘텐츠를 동기화해야 사용할 수 있습니다.
   ```

   **순서:** 컬렉션의 항목은 여기에서 정의한 순서 기준에 따라 표시됩니다.

1. **저장** 을 클릭하세요.

## 자산 게시자에서 컬렉션 생성

[Asset Publisher Widget](../../../site-building/displaying-content/using-the-asset-publisher-widget/displaying-assets-using-the-asset-publisher-widget.md) 에서 새 컬렉션을 생성할 수 있습니다. 이는 다른 페이지에서 컬렉션으로 사용하려는 Asset Publisher 사용자 정의가 있을 때 유용합니다.

![You can transform an Asset Publisher widget into a Collection.](./creating-collections/images/06.png)

1. **사이트 관리** &rarr; **사이트 빌더** &rarr; **페이지** 로 이동합니다.

1. Asset Publisher가 포함된 페이지 옆에 있는 **작업** 버튼(![추가](../../../images/icon-actions.png))을 클릭하고 **편집** 을 선택합니다.

   ![Edit the page which contains your Asset Publisher.](./creating-collections/images/11.png)

1. **Asset 게시자** 위에 마우스를 놓고 위젯 메뉴에서 **옵션** 아이콘(![옵션](../../../images/icon-app-options.png))을 클릭한 다음 **구성** 을 선택합니다.

   ![Configure the Asset Publisher Widget.](./creating-collections/images/07.png)

1. **Asset Publisher - 구성** 대화 상자에서 **설정** 탭과 **자산 선택** 하위 탭을 클릭합니다.

1. 아래로 스크롤하여 **이 구성에서 컬렉션 만들기** 를 클릭합니다.

   ![Click the Create a collection from this configuration to transform the Asset Publisher widget into a new Collection.](./creating-collections/images/08.png)

1. 컬렉션의 **제목** 을 입력하고 **저장** 을 클릭하세요.

1. **자산 게시자 - 구성** 대화 상자를 닫습니다.

1. **사이트 관리** &rarr; **사이트 빌더** &rarr; **컬렉션** 에서 새 컬렉션을 찾으세요.

## liferay DXP 7.2

### 콘텐츠 세트 생성

사이트 관리의 콘텐츠 세트 인터페이스를 통해 콘텐츠 세트를 생성할 수 있습니다. 콘텐츠 세트는 수동 또는 동적 선택을 사용할 수 있습니다. 콘텐츠 세트를 원하는 만큼 생성하고 Asset Publisher 또는 사용자 정의 애플리케이션을 통해 표시할 수 있습니다. 콘텐츠 세트에는 귀하가 지정한 기준에 따라 다양한 사용자에게 다양한 경험을 제공하는 개인화된 변형 [이](../../../site-building/personalizing-site-experience/experience-personalization/personalizing-collections.md#content-set-personalization) 있을 수도 있습니다. 기준 관리는 자산 게시자와 공유됩니다. 각 옵션에 대한 자세한 내용은 [자산 게시자에서 자산 선택](../../../site-building/displaying-content/using-the-asset-publisher-widget/selecting-assets-in-the-asset-publisher-widget.md) 을 참조하세요.

#### 수동 콘텐츠 세트 생성

수동 콘텐츠 세트 생성을 시연하려면 가상 우주 프로그램 웹사이트의 첫 페이지에 표시할 여러 이미지가 포함된 콘텐츠 세트를 생성하세요. 이 연습을 준비하려면 콘텐츠 세트에 사용할 적절한 이미지를 **문서 및 미디어** 에 업로드하세요.

1. **사이트 관리** &rarr; **콘텐츠 및 데이터** 로 이동하여 **콘텐츠 세트** 를 선택합니다.

   ![Content Sets is found in the Content & Data section of Site Administration.](./creating-collections/images/20.png)

1. ![추가](../../../images/icon-add.png)를 클릭하고 **수동 선택** 을 선택합니다.

1. 콘텐츠 세트의 이름을 **Space Program Images** 로 지정하세요.

다음 화면에서는 콘텐츠 세트에 포함할 자산을 선택할 수 있습니다.

1. **선택** &rarr; **기본 문서** 를 클릭하세요.

   ![You can select the type of asset to add to the Content Set.](./creating-collections/images/21.png)

1. 이제 추가하려는 각 이미지의 확인란을 선택하고 **추가** 를 클릭하세요.

이제 이 콘텐츠 세트는 그것이 생성된 사이트의 어느 곳에나 표시될 수 있습니다. 세트에서 항목을 추가하거나 제거할 수 있으며, 표시될 때마다 자동으로 업데이트됩니다.

#### 동적 콘텐츠 세트 만들기

동적 콘텐츠 세트 생성을 시연하려면 "인기" 태그가 지정된 다양한 자산을 포함하는 콘텐츠 세트를 생성하세요. 이 기능이 작동하려면 적절한 태그가 있는 기존 자산이 몇 개 필요합니다.

1. **컨텐츠 세트** 페이지에서 ![추가](../../../images/icon-add.png) &rarr; **동적 선택** 을 클릭합니다.
1. 이름에 **Trending** 을 입력하고 **저장** 을 클릭하세요.

동적 콘텐츠 세트를 사용하면 세트의 항목에 대한 **소스** , **범위** , **필터** 및 **순서** 를 선택할 수 있습니다.

1. **소스** 를 **모든** 으로 두고 **범위** 를 **현재 사이트** 로 둡니다.

1. **필터** 를 열고 **다음 태그 중 하나 포함** 으로 설정되어 있는지 확인한 다음 **태그** 상자에 "trending"을 입력합니다.

   ![Content Sets use the same filter system as the Asset Publisher.](./creating-collections/images/22.png)

1. **주문** 을 열고 **주문 기준** : **게시 날짜** , **다음 기준** : **제목** 으로 설정합니다.

1. **저장** 을 클릭하세요.

이렇게 하면 현재 **인기** 태그가 지정된 모든 항목을 포함하는 콘텐츠 세트가 생성되고 **인기** 태그가 있는 향후 항목은 자동으로 콘텐츠 세트에 추가됩니다.

이제 콘텐츠 세트가 생성되었으므로 [페이지에 표시할 수 있습니다](./displaying-collections.md#displaying-content-sets) .

### Asset Publisher 구성을 콘텐츠 세트로 변환

이 섹션의 이전 두 가이드에서는 [콘텐츠 세트 만들기](./creating-collections.md#creating-content-sets) 
및 [콘텐츠 세트 표시](./displaying-collections.md#displaying-content-sets) 살펴보았습니다. 다음으로 기존 Asset Publisher 구성을 콘텐츠 세트로 변환해 보세요.

이 경우, 페이지에 자산 게시자가 있는데, 이 게시자는 제목별로 알파벳 역순으로 **인기** 태그가 지정된 이미지를 표시하도록 구성되어 있습니다. **콘텐츠 세트** 생성기에서 재현하기가 그리 어렵지 않을 수도 있지만 자산 게시자에서 직접 콘텐츠 세트 정의를 생성하는 것이 훨씬 더 쉽습니다.

1. ![옵션](../../../images/icon-app-options.png) &rarr; **자산 게시자에 대한 구성** 으로 이동합니다.

1. **이 구성에서 콘텐츠 세트 만들기** 를 클릭하세요.

   ![You can generate a Content Set directly from the Asset Publisher configuration.](./creating-collections/images/23.png)

1. 제목을 입력하고 **저장** 을 클릭하세요.

그리고 사이트 어디에서나 자산 게시자와 함께 사용할 수 있는 새로운 콘텐츠 세트를 빠르게 얻을 수 있습니다.

![The Content Set is added right alongside any existing sets.](./creating-collections/images/24.png)

엄청난! Asset Publisher 구성을 콘텐츠 세트로 변환했습니다.

## 관련 정보

- [컬렉션 및 컬렉션 페이지 정보](./about-collections-and-collection-pages.md)
- [컬렉션 표시](./displaying-collections.md)
- [컬렉션 개인화](../../../site-building/personalizing-site-experience/experience-personalization/personalizing-collections.md)
