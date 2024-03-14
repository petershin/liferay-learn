# 스타일 북을 사용하여 사이트 모양 표준화

{bdg-secondary}`7.3+ 사용 가능`

**스타일 북** 은 사이트 페이지 전반에 걸쳐 일관된 경험을 제공하기 위해 사이트에 적용되는 일련의 시각적 규칙입니다. 이는 요소(예: 위젯) 사이의 간격, 색상 및 글꼴을 포함하여 사이트의 다양한 시각적 설정을 결정합니다. 이러한 각 설정은 Style Book을 사용하는 모든 페이지에 동일하게 적용됩니다.

사이트 페이지에 할당한 테마에 따라 사이트의 Style Books에 사용할 수 있는 설정 범주가 결정됩니다. 개발자는 Style Books 구성을 위한 새로운 옵션을 사용하여 범주를 사용자 정의할 수 있습니다. 자세한 내용은 [Frontend 토큰 정의](./developer-guide/frontend-token-definitions.md)를 참조하세요.

## 페이지에 대한 스타일 북 선택

페이지에 대해 특정 스타일 북을 선택하지 않으면 해당 페이지는 [마스터 페이지](../../creating-pages/defining-headers-and-footers/master-page-templates.md) 에 대해 스타일 북을 사용합니다. 둘 다 설정되지 않은 경우 페이지는 사이트의 기본 스타일 북을 사용합니다.

```{note}
Liferay 7.4 U10+ 및 GA14+부터 모든 사이트에는 *스타일의 테마*라는 스타일 북이 하나 이상 있습니다. 이 Style Book은 테마에 정의된 토큰 정의를 모든 기본값과 함께 사용합니다. 이 Style Book은 편집할 수 없으며 다른 Style Book이 구성되지 않은 경우 사이트에 사용되는 기본값입니다.
```

페이지의 스타일 북을 설정하려면 다음 단계를 따르세요.

1. 페이지 상단 근처에 있는 **편집**(![아이콘 편집](../../../images/icon-edit.png))을 클릭합니다.

1. 사이드바에서 **페이지 디자인 옵션**(![페이지 디자인 옵션](../../../images/icon-format.png))을 클릭합니다.

1. **스타일 북** 탭을 열려면 클릭하세요.

   ![Open the Style Book tab to choose the desired Style Book from the list.](./using-a-style-book-to-standardize-site-appearance/images/01.png)

1. 목록에서 원하는 스타일북을 선택하세요.

1. **게시** 를 클릭하세요.

페이지는 새로운 Style Book을 사용하여 게시됩니다.

## 새 스타일 북 만들기

1. **사이트 메뉴** &rarr; **디자인** &rarr; **스타일 북** 으로 이동합니다.

1. 페이지 상단 근처에 있는 **추가**(![아이콘 추가](../../../images/icon-add.png))를 클릭합니다.

1. Style Book의 이름을 입력하고 **저장** 을 클릭합니다.

1. 화면 오른쪽 메뉴의 드롭다운 상자에 있는 카테고리에서 옵션을 변경하세요.

   ![Select any of the available categories and customize your Style Book.](./using-a-style-book-to-standardize-site-appearance/images/02.png)

   이러한 옵션은 사이트에 사용되는 테마에서 나옵니다. 기본 클래식 테마에 사용할 수 있는 카테고리에 대한 자세한 내용은 [기본 클래식 테마 카테고리](#default-classic-theme-categories) 을 참조하세요.

1. 선택한 카테고리에 제공된 필드를 사용자 정의하세요. 색상 필드는 구체적으로 색상을 선택하는 [방법을 제공합니다](#customizing-your-style-book-s-colors) .

1. **게시** 를 클릭하세요.

이제 편집 시 모든 페이지에 대한 옵션으로 Style Book을 선택할 수 있습니다.

이 Style Book을 사이트의 새로운 기본값으로 만들려면 새로 생성된 Style Book 옆에 있는 작업 메뉴(![작업 아이콘](../../../images/icon-actions.png))를 열고 **를 클릭합니다. 기본값으로 표시** .

### 스타일북 미리보기

{bdg-secondary}`7.4 DXP U9+ 또는 GA13+ 사용 가능`

스타일 북을 생성하거나 편집하는 동안 스타일 북이 페이지, 페이지 템플릿, 페이지 조각 등 사이트의 다양한 구성 요소 모양에 영향을 미치는 방식을 미리 볼 수 있습니다.

화면 상단에 있는 두 개의 드롭다운 메뉴를 사용하여 미리 볼 구성요소를 선택하세요. 왼쪽 드롭다운 메뉴는 표시할 전체 유형(페이지, 페이지 템플릿, 마스터 페이지 템플릿, 표시 페이지 템플릿 또는 페이지 조각)을 결정합니다. 오른쪽 드롭다운 메뉴는 표시할 선택한 유형의 특정 인스턴스(또는 해당되는 경우 카테고리)를 결정합니다. 목록에서 **추가** 를 클릭하지 않는 한 가장 최근에 사용한 옵션 4개만 오른쪽 드롭다운 메뉴에 표시됩니다.

![Use the two drop-down menus together to select what to display to preview your Style Book.](./using-a-style-book-to-standardize-site-appearance/images/03.png)

페이지 조각 컬렉션을 미리 보면 컬렉션의 모든 조각이 표시됩니다. 미리 보기에는 각 옵션의 인스턴스와 함께 여러(선택 가능한) 구성 옵션이 포함된 조각이 표시되므로 해당 옵션을 사용하여 Style Book을 미리 볼 수 있습니다.

![If you are previewing the Style Book's effect on Page Fragments, you can preview any configuration of the Fragments from the chosen Collection.](./using-a-style-book-to-standardize-site-appearance/images/04.png)

### 스타일 북 색상 사용자 정의

스타일 북에서 색상 필드에 대한 색상을 선택할 때 다양한 방법으로 색상을 선택할 수 있습니다.

* 왼쪽의 색상을 클릭하여 색상 선택기를 열고 원하는 색상을 선택하세요.

* 원하는 색상의 16진수 코드를 텍스트 상자에 입력하여 원하는 색상으로 변경할 수 있습니다.

* **스타일북 값** 버튼을 클릭하면 선택할 수 있는 사전 정의된 색상 메뉴가 열립니다. 사용자 정의할 수 있는 각 일반 카테고리의 색상을 재사용하도록 선택할 수 있습니다.

![You have several options available to change the color for any color option.](./using-a-style-book-to-standardize-site-appearance/images/05.png)

Stylebook의 값 버튼을 클릭하고 Style Book 토큰 값(다른 범주에서도 정의됨)을 선택하면 해당 색상 필드가 선택한 Style Book 토큰에 연결됩니다. 나중에 이 Style Book의 토큰 값을 변경하면 이 색상 필드도 변경됩니다.

색상 필드가 Style Book 토큰에 연결되면 Value from Stylebook 버튼이 **Detach Token** 버튼으로 대체됩니다. 토큰에서 색상 필드를 분리하려면(동일한 색상 값을 유지하려면) 이 버튼을 클릭하세요.

![Click the Detach Token button to detach a color field from the Style Book token, but keep the same color value.](./using-a-style-book-to-standardize-site-appearance/images/06.png)

```{note}
Style Book 토큰에 색상 값을 첨부하거나 분리하려면 Liferay DXP 7.4 U10+ 또는 GA14+가 필요합니다.
```

색상을 기본값(테마에 정의됨)으로 다시 재설정하려면 오른쪽에 있는 **선택 취소** 버튼을 클릭하세요.

```{note}
특정 페이지의 스타일 북에서 색상을 편집할 때 색상을 선택하는 동일한 옵션이 있습니다. 그러나 대신 *선택 취소* 버튼을 클릭하면 선택한 *스타일 북*에 정의된 기본값으로 색상 값이 재설정됩니다.
```

### 색상 선택기 사용

스타일 북을 맞춤설정하는 동안 색상 선택기를 사용하여 색상을 검색하고 검색 결과를 필터링하세요.

색상 선택기의 사용은 스타일 북에만 국한되지 않습니다. Liferay의 다른 부분에서도 찾을 수 있습니다(예: 콘텐츠 페이지를 편집하는 동안 [콘텐츠 페이지 편집](../../creating-pages/using-content-pages.md) .

색상 선택기에 액세스하려면 색상 값(배경 또는 테두리 등) 또는 아이콘을 사용할 수 없는 경우 색상 값(예: 텍스트 색상)을 클릭합니다.

![Access the color picker by clicking the Value from Style Book icon or by clicking on the color value when the icon is not available.](./using-a-style-book-to-standardize-site-appearance/images/10.png)

색상 선택기에서는 기존 색상이 카테고리 및 토큰 세트별로 구분됩니다. 색상 위에 커서를 놓으면 색상의 토큰 값을 볼 수 있습니다.

![See a color's token value by hovering the cursor over the color in the color picker.](./using-a-style-book-to-standardize-site-appearance/images/11.png)

특정 색상을 검색하려면 검색창을 사용하세요. [카테고리](./developer-guide/frontend-token-definitions.md#token-categories) , [토큰 세트](./developer-guide/frontend-token-definitions.md#token-sets) , [토큰 값](./developer-guide/frontend-token-definitions.md#token-definitions) 또는 [진수 색상 값](https://www.w3schools.com/html/html_colors_hex.asp) 로 검색할 수 있습니다.

검색창을 사용할 때 검색 시스템은 대소문자를 구분하지 않습니다. 또한, 검색 결과가 반환되지 않으면 **결과를 찾을 수 없음** 메시지가 검색 영역에 표시됩니다.

![If a search returns no results, a "No Results Found" message is displayed in the search area.](./using-a-style-book-to-standardize-site-appearance/images/12.png)

## 기본 클래식 테마 카테고리

스타일 북을 편집할 때 드롭다운 상자에서 사용할 수 있는 범주에는 페이지 스타일 지정을 위한 다양한 옵션이 표시됩니다. 각 카테고리에서 사용할 수 있는 옵션은 테마에 따라 정의됩니다.

```{tip}
페이지에 '스타일 가이드 샘플' 위젯을 배치하면 스타일 북 카테고리의 다양한 옵션을 테스트하는 데 도움이 됩니다. 이 샘플 위젯에는 클래식 테마의 기능 대부분을 활용하는 다양한 UI 요소가 포함되어 있으므로 이를 사용하여 페이지 스타일을 테스트할 수 있습니다.
```

여기에 나열된 카테고리는 클래식 테마에 대한 옵션으로 사용할 수 있습니다.

```{tip}
색상과 관련되지 않은 너비, 여백, 패딩 등의 옵션을 수정할 때 사전 정의된 단위 세트에서 선택하거나 사용자 정의 단위를 지정할 수 있습니다. 일부 옵션에는 픽셀(PX), 백분율(%), 전각 너비(EM) 및 루트 전각(REM)이 포함됩니다.
```

### 색상표

테마에 정의된 글꼴 및 시각적 요소에 사용되는 색상은 색상 시스템 범주에서 사용자 정의할 수 있습니다. 일반적으로 이는 페이지의 본문, 배경 및 텍스트 색상을 수정할 수 있음을 의미합니다.

![Change the colors used for displays or UI elements with options under the Color System category.](./using-a-style-book-to-standardize-site-appearance/images/07.png)

```{note}
경고 관련 요소(예: *성공* 또는 *경고*)의 색상을 변경하면 각 경고 유형이 다양한 색상 중 하나를 사용할 수 있으므로 사이트에 수신되는 경고의 색상에 영향을 미치지 않을 수 있습니다. 경고 색상을 완전히 사용자 정의하려면 사용자 정의 가능한 색상을 정의하고 이를 자신의 테마 카테고리에 사용해야 합니다.
```

### 간격

간격 카테고리의 옵션을 사용하여 페이지의 주요 요소 사이의 간격을 조정하세요. 해당 스타일 북을 사용하여 페이지 조각을 구성하는 경우 이러한 값은 조각의 여백 및 패딩 크기에 대한 옵션으로 제공됩니다.

![Change the colors used for displays or UI elements with options under the Color System category.](./using-a-style-book-to-standardize-site-appearance/images/08.png)

```{tip}
색상과 관련이 없는 너비, 여백, 패딩 등의 토큰을 수정할 때 사전 정의된 단위 세트에서 선택하거나 사용자 정의 단위를 지정할 수 있습니다. 이러한 유연성을 통해 스타일을 더욱 정밀하게 제어할 수 있습니다. 일부 옵션에는 픽셀(PX), 백분율(%), 전각 너비(EM) 및 루트 전각(REM)이 포함됩니다.
```

### 일반

이 옵션은 사이트의 모든 페이지에 나타나는 요소의 색상과 간격을 수정합니다. 예를 들어 **본문 배경** 옵션은 모든 페이지의 배경색을 변경합니다.

### 배치

이러한 옵션은 페이지의 컨테이너 너비를 수정합니다. 예를 들어, 새 빈 페이지의 기본 컨테이너는 초대형 설정의 크기를 통해 구성할 수 있습니다.

### 타이포그래피

이러한 옵션은 페이지의 새 글꼴을 정의합니다. 이 카테고리의 옵션을 통해 헤더 크기를 조정할 수도 있습니다.

### 버튼

이러한 옵션은 기본 버튼 유형의 스타일을 수정합니다. 클래식 테마에 사용되는 각 버튼의 배경색, 전경색, 테두리 색상을 사용자 지정할 수 있습니다.

![Change the colors under Button Primary to affect many common buttons for out-of-the-box widgets when using the Classic theme.](./using-a-style-book-to-standardize-site-appearance/images/09.png)

## 관련 주제

* [스타일 북 토큰 정의](./developer-guide/frontend-token-definitions.md)
