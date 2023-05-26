# 사이트 탐색 관리

Liferay는 페이지 생성 및 구성을 위한 강력한 도구를 제공합니다. 간단하고 평평한 사이트 탐색에서 여러 수준으로 중첩된 하위 페이지의 복잡한 계층 트리에 이르기까지 모든 것을 구축할 수 있습니다.

기본적으로 페이지를 구성하기 위해 정의된 페이지 계층 구조가 있습니다. 그러나 페이지 계층 구조와 별개인 **탐색 메뉴** 을 만들 수도 있습니다. 이러한 탐색 메뉴를 사용하여 일회성 랜딩 페이지 또는 여러 탐색 메뉴(주 메뉴, 보조 메뉴, 바닥글 메뉴 및 사용자 지정 메뉴)를 만들 수 있습니다.

```{note}
DXP 7.3+에서 여러 사이트에서 사용할 탐색 메뉴를 생성하려는 경우 전역 사이트에서 생성된 탐색 메뉴를 사용할 수 있습니다. 전역 탐색 메뉴에는 사이트별 정보(예: "페이지" 유형)가 필요한 메뉴 항목이 포함될 수 없습니다.
```

메뉴는 페이지마다 다를 수 있습니다. 랜딩 페이지는 자주 방문하는 페이지의 간단한 목록을 표시하고 나머지는 보조 탐색에 표시할 수 있습니다. 방문자를 관련 콘텐츠로 안내하기 위해 다양한 방문 페이지에 대한 특정 메뉴를 만들 수도 있습니다.

사이트 작성기 메뉴는 페이지와 탐색 메뉴를 만들고 구성할 수 있는 곳입니다.

## 페이지 관리

**Site Builder** &rarr; **Pages** 메뉴에 표시되는 계층 구조는 해당 사이트의 페이지 구성에 대한 기본 참조입니다. 탐색 메뉴는 일부 페이지를 표시하도록 사용자 지정되지만 이 메뉴는 항상 사이트 페이지의 기본 참조입니다.

![사이트 빌더의 페이지 메뉴는 사이트의 모든 페이지에 대한 기본 참조 역할을 합니다.](./managing-site-navigation/images/01.png)

**Site Builder** &rarr; **Pages** 메뉴에 새 페이지가 생성됩니다. 페이지를 추가하는 방법은 [사이트에 페이지 추가](../creating-pages/adding-pages/adding-a-page-to-a-site.md) 참조하십시오.

## 탐색 메뉴 사용

탐색 메뉴를 만들고 페이지에 배포하는 방법을 알아보려면 [탐색 메뉴 응용 프로그램 사용](./using-the-navigation-menus-application.md) 을 참조하십시오. [메뉴 디스플레이 조각](./configuring-menu-displays.md#configuring-the-menu-display-fragment)  (Liferay DXP 7.4+에서 사용 가능) 및 [메뉴 디스플레이 위젯](./configuring-menu-displays.md#configuring-the-menu-display-widget) 구성하는 방법에 대한 자세한 내용은 [메뉴 디스플레이 구성](./configuring-menu-displays.md) 참조하십시오.

## 페이지 트리 사용

사이트의 페이지 계층 구조를 관리하는 또 다른 방법은 **페이지 트리** 를 사용하는 것입니다. 여기에서 현재 사이트의 페이지를 보고 구성할 수 있습니다.

페이지 트리에 액세스하려면

1. **제품 메뉴**(![Product Menu](../../images/icon-product-menu.png))를 클릭합니다.
1. **페이지 트리** 클릭합니다.

   ![Page Tree 기능은 제품 메뉴 상단에 있습니다.](./managing-site-navigation/images/02.png)

1. 왼쪽 메뉴에는 사이트의 페이지 계층 구조가 표시됩니다.

    ![각 사이트의 페이지 트리를 봅니다.](./managing-site-navigation/images/03.png)

1. 이 드롭다운 컨트롤에서 탐색 메뉴를 선택할 수 있습니다.

1. 여기에서 할 수 있습니다

   - 검색 표시줄(1)을 사용하여 트리에서 페이지를 찾습니다.
   - 페이지 미리보기를 보려면 페이지를 클릭하십시오.
   - 추가(![Add](../../images/icon-plus.png)) 및 구성(![Configure](../../images/icon-settings.png)) 버튼과 각 페이지 이름(2) 옆에 있는 작업 메뉴(![Actions Menu](../../images/icon-actions.png))를 사용하여 페이지를 추가하거나 페이지를 구성합니다.
   - 트리에서 페이지를 끌어다 놓아 탐색 메뉴에서 페이지 순서를 수정합니다(3).

   ![페이지 트리 메뉴에서 페이지를 추가, 미리보기, 구성 또는 재정렬할 수 있습니다.](./managing-site-navigation/images/04.png)

## 관련 주제

* [사이트에 페이지 추가](../creating-pages/adding-pages/adding-a-page-to-a-site.md)
* [탐색 메뉴 사용](./using-the-navigation-menus-application.md)
* [페이지 계층 관리](./managing-page-hierarchies.md)
