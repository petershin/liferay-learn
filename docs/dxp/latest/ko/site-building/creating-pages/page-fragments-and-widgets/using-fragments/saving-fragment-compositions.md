
# 단편 구성 저장

레이아웃과 구성은 페이지 디자인의 기초입니다. 이를 올바르게 하면 페이지를 더 쉽게 읽고 탐색할 수 있으므로 더 풍부하고 일관된 사용자 경험을 얻을 수 있습니다. 컨테이너 및 그리드 레이아웃 요소를 사용하여 놓기 영역을 정의하고 복잡한 컴포지션을 만든 다음 컴포지션을 새 조각으로 저장할 수 있습니다. 그런 다음 조각을 지원하는 다른 페이지 및 템플릿에서 재사용할 수 있습니다.

```{tip}
컴포지션을 디자인할 때 컨테이너 조각으로 시작합니다. 최대 유연성 및 레이아웃 제어를 위해 이 컨테이너에 다른 요소를 추가합니다.
```

조각 구성을 저장하려면 다음 단계를 따르십시오.

1. 저장하려는 구성이 포함된 페이지 또는 템플릿 편집을 시작합니다.

1. 원하는 **컨테이너** 또는 **그리드** 클릭합니다.

   또는 사이드바 메뉴에서 **브라우저** 패널(![Browser](../../../../images/icon-hierarchy.png))을 열고 원하는 **컨테이너** 또는 **그리드** 을 선택합니다.

1. 조각의 **옵션** 버튼(![Options Button](../../../../images/icon-app-options.png))을 클릭하고 **컴포지션 저장** 선택합니다.

   ![조각의 옵션 메뉴를 열고 컴포지션 저장을 선택합니다.](./saving-fragment-compositions/images/01.png)

1. 조각의 이름을 입력합니다.

1. (선택 사항) 새 조각에 대해 **썸네일** 및 **설명** 추가합니다.

1. 컴포지션의 **인라인 콘텐츠**(예: 링크, 텍스트, 이미지) 저장 여부 결정

1. 컴포지션의 [**매핑 구성**](./configuring-fragments/fragment-sub-elements-reference.md#mapping-settings) 을 저장할지 여부를 결정합니다.

1. 새 조각에 대해 원하는 조각 세트를 선택합니다.

   사용 가능한 Fragment Set이 없으면 컴포지션이 Saved Fragments라는 새 Set에 자동으로 저장됩니다.

   ![표시되는 대화 상자에서 조각 구성에 대한 정보를 제공합니다.](./saving-fragment-compositions/images/02.png)

1. **저장** 클릭합니다.

저장된 Fragment 구성은 선택한 Fragment Set 아래의 **Fragments** 패널에 나타납니다. 다른 프래그먼트처럼 페이지나 템플릿에 추가할 수 있습니다.

저장된 구성을 보고 관리하려면 **사이트 메뉴** 을 열고 **디자인** &rarr; **조각** 으로 이동합니다.

```{note}
Liferay DXP 7.1 및 7.2에서 *제품 메뉴*를 열고 *사이트* &rarr; *사이트 빌더* &rarr; *페이지 조각*으로 이동합니다.
```

여기에서 저장된 컴포지션의 이름을 바꾸거나 축소판 이미지를 변경하거나 `.zip` 파일로 내보내거나 세트 간에 이동하거나 삭제할 수 있습니다. 자세한 내용은 [단편 관리](./managing-fragments.md) 참조하십시오.

![저장된 Fragment 구성은 즉시 사용할 수 있습니다.](./saving-fragment-compositions/images/03.png)

```{note}
최신 버전의 [Liferay Fragments Toolkit](../../../developer-guide/reference/fragments/fragments-toolkit-command-reference.md)은 조각 컴포지션의 생성, 내보내기/가져오기 및 미리보기를 지원합니다. .
```

## 예: 배너 구성 만들기

이 단계별 예제에서는 중첩된 컨테이너 조각을 사용하여 배너 스타일 컴포지션을 만드는 방법을 보여줍니다. 이 예는 컴포지션을 저장하고 Style Book에서 해당 설정을 조정하는 방법도 보여줍니다.

![Container Fragment를 사용한 샘플 Fragment 구성의 예](./saving-fragment-compositions/images/04.png)

* [1단계: 새 콘텐츠 페이지 만들기](#step-1-creating-a-new-content-page) .
* [2단계: 컨테이너 조각 구성](#step-2-configuring-the-container-fragment) .
* [3단계: 조각 구성 저장](#step-3-saving-the-fragment-composition) .
* [4단계: Style Book에서 기본 컨테이너 너비 설정](#step-4-setting-the-default-container-width-in-the-style-book) .

### 1단계: 새 콘텐츠 페이지 만들기

1. 사이트 메뉴에서 **Site Builder** &rarr; **Pages** 로 이동합니다.

1. 0 새 페이지를 추가할 수준에서 **추가**(![Add Page](../../../../images/icon-plus.png))을 클릭하고 **페이지 추가를 선택합니다.** .

1. **Blank** 템플릿 또는 기존 템플릿 중 하나를 선택합니다.

1. **페이지 추가** 대화 상자에서 페이지의 **이름** 을 입력하십시오.

### 2단계: 컨테이너 조각 구성

1. 콘텐츠 페이지 사이드바에서 **Fragments and Widgets**(![Fragments and Widgets](../../../../images/icon-plus.png))를 선택하고 **Container** Fragment를 기본 드롭 영역 위로 끌어다 놓습니다.

    ![콘텐츠 페이지 드롭 영역 위에 컨테이너 조각을 끌어다 놓습니다.](./saving-fragment-compositions/images/05.png)

1. 컨테이너 조각을 클릭하고 **구성** 패널에서 **스타일** 탭을 클릭합니다.

1. **Spacing** 패널에서 4개의 Padding 옵션을 `5`으로 설정합니다.

1. **Background** 패널에서 **Style Book의 값** 버튼을 사용하여 **Gray 200** 을 선택합니다.

    ![컨테이너 조각의 패딩 및 배경색 값을 정의합니다.](./saving-fragment-compositions/images/06.png)

1. **조각 및 위젯**(![Fragments and Widgets](../../../../images/icon-plus.png))을 선택하고 기존 컨테이너 조각 위에 새 컨테이너 조각을 놓습니다. 이렇게 하면 **브라우저**(![Browser](../../../../images/icon-hierarchy.png)) 버튼을 클릭할 때 나타나는 중첩된 컨테이너 컴포지션이 생성됩니다.

1. Fragments and Widgets(![Fragments and Widgets](../../../../images/icon-plus.png)) 패널의 기본 구성 요소에서 컴포지션의 내부 컨테이너 내부에 **제목** 조각을 끌어다 놓습니다.

    ![내부 컨테이너 조각 안에 제목 조각을 끌어다 놓습니다.](./saving-fragment-compositions/images/08.png)

1. 제목 바로 아래에 **단락** 조각을 끌어다 놓습니다. 컴포지션에서 단락을 선택하고 **Styles** 섹션에서 **Margin Top** of `3`를 선택합니다.

    ![제목 조각 바로 아래에 단락 조각을 끌어다 놓습니다.](./saving-fragment-compositions/images/09.png)

1. 선택(![Selection](../../../../images/icon-pages-tree.png)) 패널에서 내부 컨테이너를 클릭합니다. **일반** 탭에서 사용자가 이 영역을 클릭할 때 리디렉션할 URL을 입력합니다.

    ![내부 컨테이너 조각에 대한 대상 링크 또는 페이지를 정의합니다.](./saving-fragment-compositions/images/10.png)

1. Fragments and Widgets(![Fragments and Widgets](../../../../images/icon-plus.png)) 패널의 Basic Components에서 단락 바로 아래 컴포지션의 **Button** Fragment를 드래그 앤 드롭합니다.

1. **Button** 선택하고 Styles 섹션에서 **Margin Top** of `3`를 설정합니다. **General** 섹션에서 **Type** 드롭다운 메뉴를 클릭하고 **Link** 선택합니다.

1. 브라우저(![Browser](../../../../images/icon-hierarchy.png)) 패널에서 버튼 조각에 대한 **링크** 를 클릭합니다. 링크 섹션에서 사용자가 버튼을 클릭할 때 리디렉션할 URL을 입력합니다.

    ![버튼 조각 유형 및 상단 여백을 구성합니다.](./saving-fragment-compositions/images/11.png)

```{note}
콘텐츠 페이지를 게시할 필요가 없습니다. 콘텐츠 페이지에서 진행 중인 작업은 자동으로 초안으로 저장됩니다.
```

### 3단계: 조각 구성 저장

위 단계에 따라 컴포지션을 새 조각으로 저장합니다.

![컨테이너 옵션 메뉴에서 조각 구성을 저장합니다.](./saving-fragment-compositions/images/12.png)

### 4단계: Style Book에서 기본 컨테이너 너비 설정

기본적으로 컨테이너 조각은 **유체** 너비 구성을 사용합니다. 기본 설정을 **고정 너비** 로 변경하고 동일한 Style Book을 기반으로 하는 다른 콘텐츠 페이지에 이 속성을 사용할 수 있습니다. 두 개의 중첩된 컨테이너가 있는 이 예제에서는 텍스트가 있는 컨테이너의 최대 너비를 제한하면서 페이지 너비에 맞게 외부 컨테이너를 구성할 수 있습니다. Liferay DXP의 Style Book에 대해 자세히 알아보려면 [Style Book을 사용하여 사이트 모양 표준화](../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md)참조하십시오.

![고정 너비를 사용하거나 페이지 너비에 맞게 컨테이너 너비 속성을 변경할 수 있습니다.](./saving-fragment-compositions/images/14.gif)

```{warning}
사이트 레이아웃 구성이 손상되지 않도록 하려면 스타일 북으로 작업할 때 테스트 환경을 사용하십시오. 프로덕션 사이트에서 테스트 목적으로 Style Book 구성을 업데이트하지 마십시오.
```

1. **브라우저**(![Browser](../../../../images/icon-hierarchy.png)) 버튼을 클릭한 다음 내부 컨테이너 조각을 클릭합니다.

1. 일반 탭에서 **컨테이너 너비** 특성을 **고정 너비** 으로 설정하십시오.

    ![내부 컨테이너 조각 너비 설정을 고정 너비로 변경합니다.](./saving-fragment-compositions/images/15.png)

1. **페이지 디자인 옵션**(![Page Design Options](../../../../images/icon-format.png))을 클릭하고 Style Book 섹션 아래에서 활성 Style Book을 확인합니다.

    ![콘텐츠 페이지에 사용 중인 기본 Style Book을 확인합니다.](./saving-fragment-compositions/images/16.png)

1. 사이트 메뉴에서 **Design** &rarr; **Style Books** 로 이동합니다.

    ![사이트 메뉴 및 디자인 섹션에서 Style Books 페이지를 엽니다.](./saving-fragment-compositions/images/17.png)

1. 콘텐츠 페이지에 해당하는 Style Book의 **작업**(![Actions](../../../../images/icon-actions.png)) 메뉴를 클릭하고 **편집** 선택합니다.

1. Style Book 편집기의 **페이지 미리보기** 드롭다운 메뉴에서 콘텐츠 페이지를 선택합니다.

    ![Style Book 편집기의 페이지 미리보기 드롭다운 메뉴에서 수정할 콘텐츠 페이지를 선택합니다.](./saving-fragment-compositions/images/18.png)

1. 오른쪽 드롭다운 메뉴에서 **레이아웃** 옵션을 선택하고 **초대형** 옵션에서 고정 너비 요소의 최대 너비 값(픽셀 단위)을 설정합니다.

    ![Style Book Layout 설정에서 Extra Large 옵션을 변경하여 Container Fragment 최대 너비를 업데이트합니다.](./saving-fragment-compositions/images/19.png)

1. **게시** 클릭하여 Style Book을 새 구성으로 업데이트합니다.

## 컨테이너 조각으로 고급 컴포지션 만들기

> 사용 가능: Liferay DXP/Portal 7.4+.

다른 컨테이너 조각 내에 하나 이상의 컨테이너를 구성할 때 **Flex** 디스플레이를 사용하여 고급 디스플레이 옵션을 정의할 수 있습니다.

1. 사이트 메뉴에서 **Site Builder** &rarr; **Pages** 로 이동합니다.

1. [새 콘텐츠 페이지를 만들거나](../../adding-pages/adding-a-page-to-a-site.md) 컨테이너 기반 구성으로 기존 페이지를 엽니다. [이 예제](#example-creating-a-banner-composition) 사용하여 컨테이너 조각을 사용하여 기본 컴포지션을 만들 수 있습니다.

1. **브라우저**(![Browser](../../../../images/icon-hierarchy.png)) 버튼을 클릭합니다.

1. 고급 구성을 적용하려는 요소를 그룹화하는 컨테이너 조각을 선택합니다. 예를 들어 Fragments가 포함된 컨테이너가 있는 경우 외부 컨테이너를 선택합니다.

1. 스타일 섹션에서 **Content Display** 드롭다운 메뉴를 클릭하고 사용 가능한 **Flex** 옵션 중 하나를 선택합니다.

1. **항목 정렬** 및 **콘텐츠 정렬** 설정을 원하는 대로 설정합니다.

    ![Flex 표시 옵션을 사용하여 스타일을 지정하려는 페이지 요소를 그룹화하는 컨테이너를 선택합니다.](./saving-fragment-compositions/images/20.png)

## 추가 정보

* [조각 사용](../using-fragments.md)
* [조각 관리](./managing-fragments.md)
* [콘텐츠 페이지 편집기 UI 참조](../../using-content-pages/content-page-editor-ui-reference.md)
* [그리드 조각으로 반응형 레이아웃 구축](../../../optimizing-sites/building-a-responsive-site/building-responsive-layouts-with-the-grid-fragment.md)
