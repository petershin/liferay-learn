# 사이트에 페이지 추가

아래 단계에서는 사이트에 새 페이지를 추가하고 일반 옵션을 구성하는 방법을 설명합니다. 나머지 페이지 설정을 구성하는 방법을 알아보려면 [개별 페이지 구성](../page-settings/configuring-individual-pages.md) 또는 [페이지 집합 구성](../page-settings/configuring-) 을 참조하세요. page-sets.md)를 사용하여 [페이지 세트](../understanding-pages/understanding-pages.md#page-sets) 에 대한 옵션을 구성합니다.

```{note}
Liferay 7.4 U22+ 및 GA22+의 경우 새로 설치하면 개인 페이지가 비활성화됩니다. 이를 활성화하려면 [비공개 페이지 활성화](../understanding-pages/understanding-pages.md#enabling-private-pages) 를 참조하세요.
```

## 새 페이지 추가

페이지 관리 화면이나 페이지 트리(Liferay DXP 7.3+에만 해당)에서 새 페이지를 추가할 수 있습니다.

### 페이지 관리에서 새 페이지 추가

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-menu.png))를 열고 **사이트 빌더** 를 확장한 다음 **페이지** 를 클릭합니다.

1. **추가**(![추가 버튼](../../../images/icon-add.png))를 클릭하고 **페이지** 를 선택합니다.

   ![Add a page to the site.](./adding-a-page-to-a-site/images/01.png)

1. 페이지 템플릿 세트에서 기본 또는 전역 템플릿을 선택합니다.

   빈 [콘텐츠 페이지](../understanding-pages/understanding-pages.md#page-types) 로 시작하려면 **빈** [마스터 페이지 템플릿](../defining-headers-and-footers/) 을 선택하세요. 마스터 페이지 템플릿.md).

   또는 사용 가능한 다른 템플릿 중에서 선택하세요.

   ![Select a Basic or Global template for your page.](./adding-a-page-to-a-site/images/02.png)

1. 페이지 추가 대화 상자에서 이름을 입력하고 **추가** 를 클릭합니다.

콘텐츠 페이지를 생성한 경우 조각 및 위젯 추가를 시작할 수 있는 초안 콘텐츠 페이지로 리디렉션됩니다.

위젯 페이지를 생성한 경우 페이지의 구성 옵션으로 리디렉션됩니다.

```{tip}
기본적으로 새 페이지는 사이트의 탐색 메뉴에 포함됩니다. 이 탐색 메뉴를 구성하려면 [사이트 탐색 관리](../../site-navigation/managing-site-navigation.md)를 참조하세요.
```

### 페이지 트리 메뉴에서 새 페이지 추가

{bdg-secondary}`사용 가능: Liferay DXP/Portal 7.3+`

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-menu.png))를 열고 **페이지 트리**(![페이지 트리](../../ ../images/icon-page-tree.png)).

1. **추가**(![추가 버튼](../../../images/icon-add-app.png))를 클릭하고 **페이지 추가** 를 선택합니다.

   ![Adding a new page using the page tree menu.](adding-a-page-to-a-site/images/03.png)

1. [새 페이지 추가](#adding-a-new-page) 에 표시된 대로 페이지 생성을 위한 표준 단계를 따르세요.

```{tip}
초안 상태의 페이지에는 페이지 트리의 이름 옆에 별표(*)가 표시됩니다.
```

## 하위 페이지 추가

페이지 관리 또는 페이지 트리(Liferay DXP 7.3+만 해당)에서 하위 페이지를 추가할 수 있습니다.

### 페이지 관리에서 하위 페이지 추가

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-menu.png))를 열고 **사이트 빌더** 를 확장한 다음 **페이지** 를 클릭합니다.

1. 기존 페이지에 대해 **추가**(![추가 버튼](../../../images/icon-duplicate.png))를 클릭합니다.

   ![Click the Add button next to an exiting page to create a new child page.](./adding-a-page-to-a-site/images/04.png)

1. [새 페이지 추가](#adding-a-new-page) 에 설명된 대로 페이지 생성을 위한 표준 단계를 따르세요.

```{tip}
페이지 옆에 있는 작업 메뉴(![작업 메뉴](../../../images/icon-actions.png))를 사용하면 콘텐츠 페이지 초안을 미리 볼 수 있습니다(Liferay DXP 7.2+). 이러한 옵션은 초안 상태의 페이지와 페이지 편집 권한이 있는 사용자에게 제공됩니다.
```

### 페이지 트리에서 하위 페이지 추가

{bdg-secondary}`사용 가능: Liferay DXP/Portal 7.3+`

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-menu.png))를 열고 **페이지 트리**(![페이지 트리](../../ ../images/icon-page-tree.png)).

1. 원하는 페이지에서 **작업**(![작업 버튼](../../../images/icon-actions.png))을 클릭하고 **하위 페이지 추가** 를 선택합니다.

   ![Adding a child page using the page tree menu.](adding-a-page-to-a-site/images/05.png)

1. [새 페이지 추가](#adding-a-new-page) 에 설명된 대로 페이지 생성을 위한 표준 단계를 따르세요.

## 페이지 미리보기

생성한 페이지를 활성화하기 전에 미리 보거나 작업해야 할 페이지를 식별할 수 있습니다.

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-menu.png))를 열고 **사이트 빌더** &rarr; 페이지를 선택하세요.

1. 미리 보려는 페이지에서 **작업**(![작업 아이콘](../../../images/icon-actions.png))을 클릭하고 **보기** 를 선택합니다.

![You can preview pages easily before working on them](./adding-a-page-to-a-site/images/06.png)

```{tip}
사용자가 로그인하여 페이지 편집 권한이 있고 여러 [경험](../../personalizing-site-experience/experience-personalization/creating-and-managing-experiences.md)이 있는 경우, 선택한 경험을 기반으로 페이지를 보거나 미리 볼 수 있습니다.
```

## 관련 주제

[페이지 이해](../understanding-pages/understanding-pages.md)

[콘텐츠 페이지 사용](../using-content-pages.md)

[사이트 탐색 관리](../../site-navigation/managing-site-navigation.md)
