
# 콘텐츠 대시보드 인터페이스

{bdg-secondary}`가능 7.3+`

콘텐츠 대시보드 사용자 인터페이스에는 세 가지 주요 섹션이 있습니다.

1. [콘텐츠 감사 도구](#content-audit-tool)
1. [콘텐츠 목록](#contents-list)
1. [콘텐츠 정보 사이드바](#content-info-sidebar)

![콘텐츠 대시보드 사용자 인터페이스에는 세 가지 주요 섹션이 있습니다.](./content-dashboard-interface/images/01.png)

대시보드에 액세스하려면 **글로벌 메뉴**( ![Global Menu](../../images/icon-applications-menu.png) )을 열고 **애플리케이션** 탭으로 이동한 다음 **콘텐츠 대시보드** 클릭합니다. 여기에서 페이지 상단의 [콘텐츠 감사 도구](#content-audit-tool) (1)과 하단의 [콘텐츠 목록](#contents-list) (2)을 볼 수 있습니다. 콘텐츠 목록에서 콘텐츠 항목 위로 마우스를 이동하고 **정보** 버튼( ![Info](../../images/icon-information.png) )을 클릭하여 [콘텐츠 정보 사이드바](#content-info-sidebar) (3)에 액세스할 수 있습니다. 또는 콘텐츠 항목의 **작업** 버튼( ![Actions Button](../../images/icon-actions.png) )을 클릭하고 **정보** 선택할 수 있습니다.

```{note}
인스턴스가 Analytics Cloud에 연결된 경우 *메트릭 보기*를 선택하여 콘텐츠 성능 측면 패널을 열 수도 있습니다. 자세한 내용은 [콘텐츠 성능 도구 정보](../page-performance-and-accessibility/about-the-content-performance-tool.md)를 참조하세요.
```

## 콘텐츠 감사 도구

콘텐츠 감사 도구는 [콘텐츠 목록](#contents-list) 섹션의 자산을 차트로 표시합니다. 이 차트는 선택한 [어휘 및 범주](#customizing-vocabularies-and-categories-for-the-content-audit-tool) 에 대한 총 자산 수를 나타내며 모든 사이트 및 자산 라이브러리의 항목을 포함할 수 있습니다. 그러나 차트에는 현재 사용자가 액세스할 수 있는 데이터만 표시됩니다. [콘텐츠 목록 필터](#filtering-and-sorting-content-in-the-contents-list) 을 사용하여 차트 결과를 제한할 수도 있습니다.

![콘텐츠 감사 도구는 콘텐츠 목록 섹션의 자산을 차트로 표시합니다.](./content-dashboard-interface/images/02.png)

```{tip}
차트에 예상 정보가 표시되지 않으면 선택한 어휘에 대해 [카테고리를 확인](../tags-and-categories/defining-categories-and-vocabularies-for-content.md)하고 [콘텐츠가 분류됨](../tags-and-categories/organizing-content-with-categories-and-tags.md).
```

콘텐츠 감사 도구에는 네 가지 UI 요소가 포함되어 있습니다.

1. 차트 범례

1. 첫 번째 어휘에 대한 X축 범주

1. 두 번째 어휘의 Y축 범주

1. 막대 차트

![콘텐츠 감사 도구에는 다음 UI 요소가 포함됩니다.](./content-dashboard-interface/images/03.png)

### 콘텐츠 감사 도구에 대한 어휘 및 범주 사용자 지정

기본적으로 막대형 차트는 선택한 어휘의 각 범주에 대한 총 자산 수를 표시합니다. 이러한 어휘를 변경하려면

1. 콘텐츠 감사 영역에서 **구성** 버튼( ![Configure Button](../../images/icon-settings.png) )을 클릭합니다.

1. **왼쪽** 및 **오른쪽** 화살표 버튼을 사용하여 차트에 표시할 어휘를 선택합니다.

   한 번에 하나 또는 두 개의 어휘만 사용할 수 있습니다. 또한 동일한 사이트의 어휘만 결합할 수 있습니다. 그러나 모든 사이트의 어휘와 함께 전역 어휘를 사용할 수 있습니다.

1. **up** 및 **down** 화살표 버튼을 클릭하여 어휘를 정렬합니다.

   차트는 x축에 대한 상위 어휘와 y축에 대한 하위 어휘를 사용합니다.

   ![콘텐츠 감사 차트에 대한 어휘를 선택합니다.](./content-dashboard-interface/images/04.png)

1. **저장** 클릭합니다.

```{tip}
*Flip Axes* 버튼( ![Flip Axes](../../images/icon-change.png) )을 클릭하여 x축과 y축을 빠르게 전환합니다.
```

## 콘텐츠 목록

기본적으로 콘텐츠 목록에는 사이트 및 자산 라이브러리에서 액세스할 수 있는 모든 콘텐츠가 표시됩니다. 여기에서 기본 제공 또는 사용자 지정 필터를 사용하여 이 콘텐츠를 정렬하고 필터링할 수 있습니다. 콘텐츠 감사 도구 차트는 설정한 필터에 따라 동적으로 변경됩니다.

콘텐츠 목록에는 네 가지 UI 요소가 포함됩니다.

1. 필터 및 정렬 선택기

1. 필터 편집기

1. 검색 필드

1. 내용 목록

![콘텐츠 목록에는 콘텐츠를 찾는 데 도움이 되는 여러 요소가 포함되어 있습니다.](./content-dashboard-interface/images/05.png)

내용 목록에는 다음 열이 있습니다.

| 1 란             | 묘사                                                                                                              |
|:--------------- |:--------------------------------------------------------------------------------------------------------------- |
| 제목              | 콘텐츠의 제목입니다.                                                                                                     |
| 작성자             | 콘텐츠 작성자입니다.                                                                                                     |
| 유형              | 콘텐츠 유형: 웹 콘텐츠 기사, 문서 {bdg-secondary}`7.4+`또는 블로그 항목 {bdg-secondary}`7.4 U23+/GA23+`                             |
| 특수형             | 콘텐츠 [하위 유형](../tags-and-categories/defining-categories-and-vocabularies-for-content.md#creating-subcategories) . |
| 사이트 혹은 애셋 라이브러리 | Liferay 인스턴스에서 콘텐츠 항목의 사이트입니다.                                                                                   |
| 상태              | 각 콘텐츠 항목에 대한 워크플로 상태입니다.                                                                                        |
| 어휘(x축)          | 콘텐츠 감사 도구의 [x축 어휘](#content-audit-tool) 에서 콘텐츠 항목에 적용되는 카테고리입니다.                                                 |
| 어휘(y축)          | 콘텐츠 감사 도구의 [y축 어휘](#content-audit-tool) 에서 콘텐츠 항목에 적용된 카테고리입니다.                                                  |
| 변경된 날짜          | 콘텐츠의 마지막 수정 날짜                                                                                                  |

콘텐츠 목록은 **페이지** 아이콘( ![Page Icon](../../images/icon-page.png) )을 사용하여 [디스플레이 페이지 템플릿](../../site-building/displaying-content/using-display-page-templates.md)가 있는 자산을 식별합니다.

목록의 콘텐츠 위로 마우스를 가져가면 다음 작업에 액세스할 수 있습니다.

* **보기**( ![View](../../images/icon-preview.png) ): 콘텐츠의 표시 페이지를 봅니다.

* **편집**( ![Edit](../../images/icon-edit.png) ): 편집 모드에서 콘텐츠를 엽니다.

* **정보**( ![Information](../../images/icon-information.png) ): [콘텐츠 정보](#content-info-sidebar) 사이드바를 엽니다.

* **메트릭 보기**( ![View Metrics](../../images/icon-analytics.png) ): [콘텐츠 성능 패널](../page-performance-and-accessibility/about-the-content-performance-tool.md)엽니다.

    ![작업 메뉴 또는 각 콘텐츠 행의 아이콘에서 콘텐츠 정보 사이드바 및 콘텐츠 성능 패널에 액세스합니다.](./content-dashboard-interface/images/06.png)

### 콘텐츠 목록에서 콘텐츠 필터링 및 정렬

**필터 및 주문** 드롭다운 메뉴에서 [미리 정의된 필터](#filter-options-reference) 를 선택합니다. 제목이나 수정 날짜별로 콘텐츠를 정렬할 수도 있습니다.

검색 표시줄을 사용하여 키워드로 콘텐츠를 필터링하거나 [콘텐츠 감사](#content-audit-tool) 차트의 표시줄을 클릭하여 선택한 범주별로 콘텐츠를 필터링할 수 있습니다.

![필터 편집기를 사용하여 필터 영역에서 특정 필터 또는 모든 필터를 제거합니다.](./content-dashboard-interface/images/07.png)

필터 결합 방법에 대한 자세한 내용은 [콘텐츠 목록 필터 이해](#understanding-contents-list-filters) 참조하십시오.

```{note}
대시보드 페이지를 닫으면 기본 필터 및 정렬 옵션이 재설정됩니다.
```

### 필터 옵션 참조

{bdg-secondary}`7.4+의 경우`

**필터 및 주문** 드롭다운 메뉴에서 다음 옵션을 선택할 수 있습니다.

| 여과기             | 묘사                                                                                                     |
|:--------------- |:------------------------------------------------------------------------------------------------------ |
| 분류              | 어휘에서 하나 이상의 [카테고리](../tags-and-categories/organizing-content-with-categories-and-tags.md) 사용하여 필터링합니다. |
| 사이트 혹은 애셋 라이브러리 | 사이트 또는 자산 라이브러리별로 필터링합니다.                                                                              |
| 유형              | 기본 및 사용자 지정 하위 유형을 포함하여 콘텐츠 유형 및 하위 유형별로 필터링합니다.                                                       |
| 연장              | 파일 확장자로 필터링:</br><ul><li>`오디오`</li><li>`부호`</li><li>`압축됨`</li><li>`심상 화랑 심상`</li><li>`프레젠테이션`</li><li>`스프레드시트`</li><li>`원본`</li><li>`벡터`</li><li>`비디오`</li><li>`기타`</li></ul>                                                             |
| 꼬리표             | 콘텐츠 [태그](../tags-and-categories/tagging-content-and-managing-tags.md)로 필터링합니다.                         |
| 작성자로 필터링        | 콘텐츠 작성자별로 필터링합니다.                                                                                      |
| 상태로 필터링         | 콘텐츠의 [워크플로 상태](../../process-automation/workflow/introduction-to-workflow.md)기준으로 필터링합니다.              |

![콘텐츠 항목을 필터링합니다.](./content-dashboard-interface/images/08.png)

### 콘텐츠 목록 필터 이해

* 둘 이상의 기준으로 카테고리 또는 태그 필터를 사용하면 결과는 모든 기준을 충족하는 콘텐츠에 해당합니다(예 A 참조).

* 동일한 필터 기준에 대해 여러 옵션을 선택하면 콘텐츠 목록에 하나 이상의 옵션과 일치하는 자산이 표시됩니다(예시 B 참조).

* 서로 다른 필터의 기준은 `과` 연산자를 사용하여 결합됩니다(예제 C 참조).

| 예 | 필터링 기준   | 필터 예                    | 콘텐츠 목록 결과                             |
|:- |:-------- |:----------------------- |:------------------------------------- |
| ㅏ | 분류       | 범주: **기업가** 및 **가족** | **기업가** `및` 가족 범주 모두에 속하는 자산만 해당됩니다.    |
| B | 저자       | 저자: **Peter** and **Linda** | **Peter** `또는` **Linda** `또는` 둘 다 저작한 자산. |
| 씨 | 카테고리, 저자 | 카테고리는 **기업가** 이고 저자는 **린다** | Linda가 작성한 **기업가** 범주 `및` 의 자산만 해당됩니다.  |

## 콘텐츠 정보 사이드바

정보 사이드바는 선택한 자산에 대한 작업 및 메타데이터에 대한 액세스를 제공합니다. 사이드바를 열려면 원하는 자산에 대해 **작업** 버튼( ![Actions Button](../../images/icon-actions.png) )을 클릭하고 **정보** 선택합니다. 또는 자산 위에 마우스를 놓고 **정보** 버튼( ![Information Button](../../images/icon-information.png) )을 클릭할 수 있습니다.

![콘텐츠 정보 사이드바에 액세스하려면 정보 버튼을 클릭합니다.](./content-dashboard-interface/images/09.png)

이 표에는 다양한 자산 유형에 대해 사용 가능한 메타데이터 및 작업이 나열되어 있습니다.

| 자산 유형                                    | 메타데이터/액션                  |
|:---------------------------------------- |:------------------------- |
| 웹 콘텐츠                                    | <ul><li>제목</li><li>유형 {bdg-secondary}'7.4 U44+/GA44+'</li><li>특수형 </li><li>버전(현재 활성 버전)</li><li>상태</li><li>작성자</li><li>미리보기 이미지 {bdg-secondary}`7.4 U42+/GA42+`</li><li>번역한 대상 언어</li><li>전시 날짜</li><li>작성 날짜</li><li>변경된 날짜</li><li>식별</li><li>구독하기 {bdg-secondary}`7.4 U42+/GA42+`</li><li>버전(버전 기록을 보려면 클릭){bdg-secondary}`7.4 U53+/GA53+`</li></ul> |
| 문서 및 미디어 {bdg-secondary}`7.4 U23+/GA23+` | <ul><li>제목</li><li>URL</li><li>WebDAV URL {bdg-secondary}`7.4 U42+/GA42+`</li><li>파일 이름</li><li>유형 {bdg-secondary}'7.4 U44+/GA44+'</li><li>특수형</li><li>MIME 유형 {bdg-secondary}`7.4 U44+/GA44+`</li><li>버전(현재 활성 버전)</li><li>상태</li><li>작성자</li><li>미리보기 이미지</li><li>다운로드</li><li>공유 {bdg-secondary}`7.4 U42+/GA42+`</li><li>연장</li><li>규모</li><li>작성 날짜</li><li>변경된 날짜</li><li>식별</li><li>버전 (버전 기록을 보려면 클릭){bdg-secondary}`7.4 U53+/GA53+`</li></ul> |
| 오래 되는 입장                                 | <ul><li>제목</li><li>유형</li><li>버전(현재 활성 버전)</li><li>상태</li><li>작성자</li><li>미리보기 이미지 {bdg-secondary}`7.4 U42+/GA42+`</li><li>공유 {bdg-secondary}`7.4 U42+/GA42+`</li><li>전시 날짜</li><li>작성 날짜</li><li>변경된 날짜</li><li>식별</li></ul> |

![콘텐츠 정보 사이드바는 콘텐츠에 대한 메타데이터 및 작업을 제공합니다.](./content-dashboard-interface/images/10.png)

### 버전 전적

{bdg-secondary}`사용 가능 7.4 U53+/GA53+`

콘텐츠 정보 패널에는 웹 콘텐츠와 문서 및 미디어의 자산에 대한 버전 기록이 표시됩니다. 버전 기록을 보려면 콘텐츠 항목에 대해 **정보**(![Info Button](../../images/icon-information.png))를 클릭하고 **버전** 탭으로 이동합니다.

이 탭에는 항목에 대해 사용 가능한 버전이 최대 10개까지 나열됩니다. 더 많은 버전이 있는 경우 더 보기 버튼을 클릭하여 볼 수 있습니다.

각 버전에는 버전 작성자, 생성 시간 및 변경 로그가 표시됩니다. 버전에 대한 작업 버튼(![Actions Button](../../images/icon-actions.png))을 클릭하여 다음 작업에 액세스할 수 있습니다.

**미리보기:** 렌더링된 웹 콘텐츠 또는 문서를 표시합니다.

**비교 대상:** 선택한 버전과 다른 버전 간의 차이를 표시합니다. 이렇게 하면 버전 간 추가, 삭제 및 서식 변경 사항을 보여주는 새 페이지가 열립니다. 이 작업은 두 개 이상의 활성 버전이 있는 경우에만 사용할 수 있습니다.

**만료:** 버전을 비활성화하고 다음 사용 가능한 버전을 활성화합니다. 예를 들어 1.2와 1.1의 두 가지 버전이 있고 1.2를 만료하면 1.1이 활성 버전이 됩니다.

![콘텐츠 대시보드 항목의 버전 기록을 보려면 버전 탭을 클릭합니다.](./content-dashboard-interface/images/11.png)

## 추가 정보

* [콘텐츠 대시보드 정보](./about-the-content-dashboard.md)
* [콘텐츠 성능 도구 정보](../page-performance-and-accessibility/about-the-content-performance-tool.md)
* [콘텐츠의 범주 및 어휘 정의](../tags-and-categories/defining-categories-and-vocabularies-for-content.md)
