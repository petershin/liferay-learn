# 사이트에 페이지 추가

아래 단계에서는 사이트에 새 페이지를 추가하고 일반 옵션을 구성하는 방법을 설명합니다. 나머지 페이지 설정을 구성하는 방법은 [개별 페이지 구성](../page-settings/configuring-individual-pages.md)을 참조하거나 [페이지 세트 구성](../page-settings/configuring-page-sets.md) 을 참조하여 [페이지 세트](../understanding-pages/understanding-pages.md#page-sets) 에 대한 옵션 구성을 참조하십시오.

```{note}
Liferay 7.4 U22+ 및 GA22+의 경우 새 설치에 대해 비공개 페이지가 비활성화됩니다. 그러나 원하는 경우 활성화할 수 있습니다. 자세한 내용은 [비공개 페이지 활성화](../understanding-pages/understanding-pages.md#enabling-private-pages) 를 참조하세요.
```

## 새 페이지 추가

페이지 관리 화면 또는 페이지 트리(Liferay DXP 7.3+만 해당)에서 새 페이지를 추가할 수 있습니다.

### 페이지 관리에서 새 페이지 추가

1. **사이트 메뉴**(![Site Menu](../../../images/icon-menu.png))을 열고 **사이트 빌더** 를 확장한 다음 **페이지** 을 클릭합니다.

1. ** 추가 버튼(![Add](../../../images/icon-add.png))을 클릭하고 *Page*를 선택합니다.

   ![사이트에 페이지를 추가합니다.](./adding-a-page-to-a-site/images/01.png)

1. 페이지 템플릿 집합에서 기본 또는 전역 템플릿을 선택합니다.

   비어 있는 [콘텐츠 페이지](../understanding-pages/understanding-pages.md#page-types) 로 시작하려면 **비어 있는**[마스터 페이지 템플릿](../defining-headers-and-footers/master-page-templates.md)를 클릭합니다.

   또는 사용 가능한 다른 템플릿에서 선택합니다.

   ![페이지에 대한 기본 또는 전역 템플릿을 선택합니다.](./adding-a-page-to-a-site/images/02.png)

1. 페이지 추가 대화 상자에서 이름을 입력하고 **추가** 을 클릭합니다.

콘텐츠 페이지를 만든 경우 조각 및 위젯 추가를 시작할 수 있는 초안 콘텐츠 페이지로 리디렉션됩니다.

위젯 페이지를 만든 경우 페이지의 구성 옵션으로 리디렉션됩니다.

```{tip}
기본적으로 새 페이지는 사이트의 탐색 메뉴에 포함됩니다. 이 탐색 메뉴를 구성하려면 [사이트 탐색 관리](../../site-navigation/managing-site-navigation.md)를 참조하십시오.
```

### 페이지 트리 메뉴에서 새 페이지 추가

> 사용 가능: Liferay DXP/Portal 7.3+.

1. **사이트 메뉴**(![Site Menu](../../../images/icon-menu.png))을 열고 **페이지 트리**(![Page Tree](../../../images/icon-page-tree.png))를 클릭합니다.

1. **추가** 버튼(![Add Button](../../../images/icon-add-app.png))을 클릭하여 새 페이지를 추가합니다.

   ![페이지 트리 메뉴를 사용하여 새 페이지를 추가합니다.](adding-a-page-to-a-site/images/03.png)

1. [위](#adding-a-new-page) 에 설명된 대로 페이지 생성을 위한 표준 단계를 따릅니다.

```{tip}
초안 상태의 페이지는 페이지 트리에서 이름 옆에 별표(*)가 있습니다.
```

## 하위 페이지 추가

페이지 관리 또는 페이지 트리(Liferay DXP 7.3+만 해당)에서 하위 페이지를 추가할 수 있습니다.

### 페이지 관리에서 하위 페이지 추가

1. **사이트 메뉴**(![Site Menu](../../../images/icon-menu.png))을 열고 **사이트 빌더** 를 확장한 다음 **페이지** 을 클릭합니다.

1. 기존 페이지에 대해 **추가** 버튼(![Add](../../../images/icon-duplicate.png))을 클릭합니다.
   
   ![종료 페이지 옆에 있는 추가 버튼을 클릭하여 새 하위 페이지를 만듭니다.](./adding-a-page-to-a-site/images/04.png)

1. [위](#adding-a-new-page) 에 설명된 대로 페이지 생성을 위한 표준 단계를 따릅니다.

```{tip}
페이지 옆에 있는 작업 메뉴(![작업 메뉴](../../../images/icon-actions.png))를 사용하여 콘텐츠 페이지 초안(Liferay DXP 7.2+)을 미리 보거나 드래프트(Liferay DXP 7.2만 해당). 이러한 옵션은 초안 상태의 페이지 및 페이지 편집 권한이 있는 사용자가 사용할 수 있습니다.
```

### 페이지 트리에서 하위 페이지 추가

> 사용 가능: Liferay DXP/Portal 7.3+.

1. **사이트 메뉴**(![Site Menu](../../../images/icon-menu.png))을 열고 **페이지 트리**(![Page Tree](../../../images/icon-page-tree.png))를 클릭합니다.

1. 원하는 페이지에 대해 **작업** 버튼(![Actions Button](../../../images/icon-actions.png))을 클릭하고 **하위 페이지** 를 선택합니다.
   
   ![페이지 트리 메뉴를 사용하여 하위 페이지 추가.](adding-a-page-to-a-site/images/05.png)

1. [위](#adding-a-new-page) 에 설명된 대로 페이지 생성을 위한 표준 단계를 따르십시오.

## 관련 정보

- [페이지 이해](../understanding-pages/understanding-pages.md)
- [콘텐츠 페이지 사용](../using-content-pages.md)
- [사이트 탐색 관리](../../site-navigation/managing-site-navigation.md)
