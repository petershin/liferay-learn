# 컬렉션 만들기

```{note}
이 정보는 Liferay DXP 7.3+에 적용됩니다. 이전 Liferay DXP 버전의 경우 [Liferay DXP 7.2](#liferay-dxp-7-2)를 참조하십시오.
```

*개의 수동* 또는 *동적* 컬렉션을 생성할 수 있습니다. 컬렉션의 다양한 유형에 대한 정보는 [컬렉션 및 컬렉션 페이지 정보](./about-collections-and-collection-pages.md)을 참조하십시오.

## 수동 컬렉션 만들기

1. *사이트 관리* &rarr; *사이트 빌더* &rarr; *컬렉션*로 이동합니다.
1. *New* 버튼(![Add](../../images/icon-add.png))을 클릭하고 *Manual Collection을 선택합니다.*.
1. 수동 컬렉션에 *제목* 을 추가하고 *저장*을 클릭합니다.
1. *항목 유형* 드롭다운 메뉴에서 컬렉션에 포함할 항목 유형을 선택합니다.
    - 하나의 항목 유형만 포함하려는 경우

       1. *Single Item Type*에서 유형을 선택합니다.
       1. 선택적으로 *항목 유형* 에 하위 유형이 포함된 경우 *항목 하위 유형* 드롭다운 메뉴에서 이를 선택합니다.
       1. *저장*을 클릭합니다.

       ![수동 컬렉션에 대한 콘텐츠 유형 및 하위 유형 구성](./creating-collections/images/01.png)

    - 하나 이상의 항목 유형을 포함하려는 경우

       1. 선택 *둘 이상 선택* 아래 *다중 항목 유형*.
       1. 이중 목록 상자에서 컬렉션에 포함하려는 항목 유형을 추가하거나 제거합니다.

       ![수동 수집에 대한 다른 항목 유형을 선택합니다.](./creating-collections/images/02.png)

1. *저장*을 클릭합니다.
1. *컬렉션 항목* 옆에 있는 *선택* 을 클릭하고 항목 유형 중 하나를 선택합니다.

   ![수동 컬렉션에 포함할 항목을 선택합니다.](./creating-collections/images/03.png)

1. 선택 대화 상자에서 포함할 항목을 선택합니다.
1. *추가*을 클릭합니다.
1. 수동 컬렉션에 항목 유형이 두 개 이상 포함된 경우 다른 유형에 대해 6~8단계를 반복합니다.

문서 및 미디어 폴더와 웹 콘텐츠 폴더를 컬렉션에 추가할 수 있습니다.

```{note}
문서, 미디어 및 웹 콘텐츠 폴더를 컬렉션에 추가할 수 있지만 폴더가 컬렉션 페이지 또는 자산 게시자 위젯에 게시되면 콘텐츠가 표시되지 않습니다. 이러한 자산이 컬렉션에 추가되더라도 개별적으로만 볼 수 있습니다. 이는 알려진 제한 사항이며 향후 릴리스에서 수정될 예정입니다.
```

## 동적 컬렉션 만들기

1. *사이트 관리* &rarr; *사이트 빌더* &rarr; *컬렉션*로 이동합니다.
1. *New* 버튼(![Add](../../images/icon-add.png))을 클릭하고 *Dynamic Collection*를 선택합니다.
1. 수동 컬렉션에 *제목* 을 추가하고 *저장*을 클릭합니다.
1. *항목 유형* 드롭다운 메뉴에서 컬렉션에 포함할 항목 유형을 선택합니다.
    - 하나의 항목 유형만 포함하려면

       1. *Single Item Type*에서 유형을 선택합니다.
       1. 선택적으로 *항목 유형* 에 하위 유형이 포함된 경우 *항목 하위 유형* 드롭다운 메뉴에서 이를 선택합니다.
       1. *항목 하위 유형* 특정 필드로 필터링하려면 *필드별 필터링* 스위치를 활성화하고 *선택*을 클릭하고 필드를 선택한 다음 *적용*을 클릭하십시오.
       1. *저장*을 클릭합니다.

       ![항목 필드 중 하나로 컬렉션의 항목 하위 유형을 필터링할 수 있습니다.](./creating-collections/images/09.gif)

    - 하나 이상의 항목 유형을 포함하려면

       1. *여러 항목 유형*에서 *유형 선택* 을 선택합니다.
       1. 이중 목록 상자에서 컬렉션에 포함하려는 항목 유형을 추가하거나 제거합니다.

       ![수동 수집에 대한 다른 항목 유형을 선택합니다.](./creating-collections/images/02.png)

1. *범위*, *필터*, *콘텐츠 추천*또는 *주문*을 기준으로 동적 컬렉션에 대한 기준을 구성합니다.

   **범위:** 동적 컬렉션의 항목 소스를 정의합니다. 기본적으로 소스는 현재 사이트입니다.

   **필터:** 동적 컬렉션의 항목에 대한 규칙을 구성합니다. 예를 들어 "프로모션" 태그가 있는 항목만 포함할 수 있습니다.

   ![하나 이상의 규칙을 추가하여 동적 컬렉션을 필터링합니다.](./creating-collections/images/10.png)

    ```{tip}
    추가 버튼을 클릭하면 필터에 여러 규칙을 추가할 수 있습니다. 동적 컬렉션의 최종 콘텐츠는 모든 규칙을 추가한 결과입니다.
    ```

   **콘텐츠 권장 사항:** 사용자 행동에 따라 콘텐츠를 표시하려면 이 옵션을 활성화합니다. 자세한 내용은 [콘텐츠 추천 구성](../../site-building/personalizing-site-experience/experience-personalization/configuring-content-recommendations.md)을 참조하십시오.

   ```{note}
   콘텐츠 추천 옵션은 DXP 인스턴스를 Analytics Cloud에 연결하고 콘텐츠를 동기화할 때 사용할 수 있습니다.
    ```

   **정렬:** 여기에서 정의한 순서 기준을 사용하여 컬렉션의 항목이 나타납니다.

1. *저장*을 클릭합니다.

## 자산 게시자에서 컬렉션 만들기

[Asset Publisher Widget](../../site-building/displaying-content/using-the-asset-publisher-widget/displaying-assets-using-the-asset-publisher-widget.md)에서 새 컬렉션을 생성할 수 있습니다. 이는 다른 페이지에서 컬렉션으로 사용하려는 Asset Publisher 사용자 정의가 있는 경우에 유용합니다.

![Asset Publisher 위젯을 컬렉션으로 변환할 수 있습니다.](./creating-collections/images/06.png)

1. *사이트 관리* &rarr; *사이트 빌더* &rarr; *페이지*로 이동합니다.
1. Asset Publisher가 포함된 페이지 옆에 있는 *작업* 버튼(![Add](../../images/icon-actions.png))을 클릭하고 *편집*을 선택합니다.

   ![Asset Publisher가 포함된 페이지를 편집합니다.](./creating-collections/images/11.png)

1. *Asset Publisher*위로 마우스를 가져간 다음 위젯 메뉴에서 *옵션* 아이콘(![Options](../../images/icon-app-options.png))을 클릭하고 *구성*을 선택합니다.

   ![자산 게시자 위젯을 구성합니다.](./creating-collections/images/07.png)

1. *자산 게시자 - 구성* 대화 상자에서 *설정* 탭과 *자산 선택* 하위 탭을 클릭합니다.
1. 아래로 스크롤하여 *이 구성에서 컬렉션 생성*을 클릭합니다.

   ![이 구성에서 컬렉션 만들기를 클릭하여 자산 게시자 위젯을 새 컬렉션으로 변환합니다.](./creating-collections/images/08.png)

1. 컬렉션에 *제목* 을 입력하고 *저장*을 클릭하십시오.
1. *Asset Publisher - 구성* 대화 상자를 닫습니다.
1. *사이트 관리* &rarr; *사이트 빌더* &rarr; *컬렉션*에서 새 컬렉션을 찾으십시오.

## 라이프레이 DXP 7.2

### 콘텐츠 세트 생성

사이트 관리의 콘텐츠 세트 인터페이스를 통해 콘텐츠 세트를 생성할 수 있습니다. 콘텐츠 세트는 수동 또는 동적 선택을 사용할 수 있습니다. 원하는 만큼 콘텐츠 세트를 생성하고 Asset Publisher 또는 사용자 지정 애플리케이션을 통해 표시할 수 있습니다. 콘텐츠 세트에는 지정한 기준에 따라 다양한 사용자에게 다양한 경험을 제공하는 [개인화된 변형](../../site-building/personalizing-site-experience/experience-personalization/personalizing-collections.md#content-set-personalization) 이 있을 수 있습니다. 기준 관리는 자산 게시자와 공유됩니다. 각 옵션에 대한 자세한 내용은 [Asset Publisher에서 자산 선택](../../site-building/displaying-content/using-the-asset-publisher-widget/selecting-assets-in-the-asset-publisher-widget.md)을 참조하십시오.

#### 수동 콘텐츠 세트 만들기

수동 콘텐츠 세트 생성을 시연하기 위해 가상의 우주 프로그램 웹 사이트의 첫 페이지에 표시할 여러 이미지가 포함된 콘텐츠 세트를 생성합니다. 이 연습을 준비하려면 콘텐츠 세트에 사용할 몇 가지 적절한 이미지를 *문서 및 미디어* 에 업로드하십시오.

1. *사이트 관리* &rarr; *콘텐츠 & 데이터* 로 이동하여 *콘텐츠 세트*을 선택합니다.

    ![콘텐츠 세트는 사이트 관리의 콘텐츠 & 데이터 섹션에 있습니다.](./creating-collections/images/20.png)

2. ![Add](../../images/icon-add.png) 을 클릭하고 *수동 선택*를 선택합니다.
3. 콘텐츠 세트 이름 지정 *공간 프로그램 이미지*.

다음 화면에서 콘텐츠 세트에 포함할 자산을 선택할 수 있습니다.

1. 클릭 *선택* &rarr; *기본 문서*.

    ![콘텐츠 세트에 추가할 자산 유형을 선택할 수 있습니다.](./creating-collections/images/21.png)

2. 이제 추가하려는 각 이미지의 상자를 선택하고 *추가*을 클릭하십시오.

이제 이 콘텐츠 세트는 생성된 사이트 어디에나 표시될 수 있습니다. 세트에서 항목을 추가하거나 제거할 수 있으며 표시될 때마다 자동으로 업데이트됩니다.

#### 동적 콘텐츠 세트 만들기

동적 콘텐츠 세트 생성을 시연하려면 "트렌딩" 태그가 지정된 다양한 자산이 포함된 콘텐츠 세트를 생성합니다. 이것이 작동하려면 적절한 태그가 있는 몇 개의 기존 자산이 필요합니다.

1. *Content Sets* 페이지에서 ![Add](../../images/icon-add.png) &rarr; *Dynamic Selection*를 클릭합니다.
2. 이름에 *Trending* 을 입력하고 *Save*를 클릭합니다.

동적 콘텐츠 세트를 사용하면 세트의 항목에 대해 *소스*, *범위*, *필터*및 *주문* 을 선택할 수 있습니다.

1. *소스* 을 *로 둡니다. 임의* 및 *범위* 를 *으로 둡니다. 현재 사이트*
2. *Filter*을 열고 *Contains Any of the following Tags*로 설정되어 있는지 확인한 다음 *Tags* 상자에 "trending"을 입력합니다.

    ![콘텐츠 세트는 자산 게시자와 동일한 필터 시스템을 사용합니다.](./creating-collections/images/22.png)

3. *Ordering* 을 열고 *로 설정합니다. Order By*: *Publish Date*, *And Then By*: *Title*.
4. *저장*을 클릭합니다.

이렇게 하면 현재 *트렌드* 로 태그가 지정된 모든 항목을 포함하는 콘텐츠 세트가 생성되고 *트렌드* 태그가 있는 향후 항목이 자동으로 콘텐츠 세트에 추가됩니다.

이제 콘텐츠 세트를 만들었으므로 [페이지에 표시할 수 있습니다](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md#displaying-content-sets).

### Asset Publisher 구성을 콘텐츠 세트로 변환

이 섹션의 이전 두 가이드에서 [콘텐츠 세트 만들기](./creating-collections.md#creating-content-sets) 및 [콘텐츠 세트 표시](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md#displaying-content-sets) 시연을 보았습니다. 다음으로 기존 Asset Publisher 구성을 콘텐츠 세트로 변환해 보십시오.

이 경우 페이지에 *트렌드* 로 태그가 지정된 이미지를 제목의 알파벳 역순으로 표시하도록 구성된 자산 게시자가 있습니다. 이것은 *콘텐츠 세트* 생성자에서 재현하기가 그리 어렵지 않을 수 있지만 자산 게시자에서 직접 콘텐츠 세트 정의를 생성하는 것이 훨씬 더 쉽습니다.

1. Asset Publisher의 ![Options](../../images/icon-app-options.png) &rarr; *구성* 으로 이동합니다.
2. *이 구성에서 콘텐츠 세트 만들기*을 클릭합니다.

    ![Asset Publisher 구성에서 직접 콘텐츠 세트를 생성할 수 있습니다.](./creating-collections/images/23.png)

3. 제목을 입력하고 *저장*을 클릭합니다.

사이트의 어디에서나 Asset Publishers와 함께 사용할 수 있는 새로운 콘텐츠 세트가 있는 만큼 신속하게 사용할 수 있습니다.

![콘텐츠 세트는 기존 세트 옆에 바로 추가됩니다.](./creating-collections/images/24.png)

엄청난! Asset Publisher 구성을 콘텐츠 세트로 변환했습니다.

## 관련 정보

- [컬렉션 및 컬렉션 페이지 정보](./about-collections-and-collection-pages.md)
- [컬렉션 표시](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md)
- [컬렉션 개인화](../../site-building/personalizing-site-experience/experience-personalization/personalizing-collections.md)
