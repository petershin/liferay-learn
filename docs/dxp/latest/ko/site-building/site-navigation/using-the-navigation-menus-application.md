# 탐색 메뉴 애플리케이션 사용

탐색 메뉴 응용 프로그램은 사이트 페이지 및 콘텐츠에 대한 사용자 정의 메뉴를 만드는 데 사용됩니다. 이를 통해 메뉴에 포함된 요소와 구성 방법을 결정할 수 있습니다. 만든 후에는 [Page Fragments](../creating-pages/page-fragments-and-widgets/using-fragments.md) 또는 [Widgets](../creating-pages/using-widget-pages/adding-widgets-to-a-page.md)을 사용하여 사용자 정의 메뉴를 표시할 수 있습니다.

```{note}
Liferay 7.3 및 이전 버전의 경우 페이지는 탐색 메뉴에 추가할 수 있는 유일한 엔터티입니다. Liferay 7.4 U1+부터 탐색 메뉴는 탐색 메뉴에 추가 항목 유형을 추가하는 것을 지원합니다.
```

![사이트 페이지 및 콘텐츠에 대한 사용자 정의 메뉴 만들기](./using-the-navigation-menus-application/images/01.png)

```{tip}
Liferay 7.3 이상에서는 사용자 정의 필드를 사용하여 탐색 메뉴(*사용자 정의 필드* 메뉴의 *사이트 탐색 메뉴 항목* 아래)의 항목에 더 많은 정보를 추가할 수 있습니다. 그런 다음 애플리케이션 표시 템플릿과 함께 이 정보를 사용하여 탐색 메뉴를 추가로 사용자 정의할 수 있습니다.
```

## 탐색 메뉴 만들기

탐색 메뉴를 만들려면 다음 단계를 따르십시오.

1. **사이트 메뉴**(![Site Menu](../../images/icon-product-menu.png))을 열고 **사이트 빌더** &rarr; **탐색 메뉴** 로 이동합니다.

    ![사이트 메뉴에서 탐색 메뉴에 액세스합니다.](./using-the-navigation-menus-application/images/02.png)

1. **추가** 버튼(![Add Button](../../images/icon-add.png))을 클릭합니다.

1. 탐색 메뉴에 **이름** 을 입력합니다.

    ![탐색 메뉴를 만듭니다.](./using-the-navigation-menus-application/images/03.png)

1. **저장** 을 클릭합니다.

이렇게 하면 요소(예: 페이지, 문서, 범주)를 추가할 수 있는 새로운 사용자 지정 메뉴로 리디렉션됩니다.

### 탐색 메뉴에 새 요소 추가

탐색 메뉴를 편집하는 동안 탐색 메뉴에 요소를 추가하려면 다음 단계를 따르십시오.

1. **추가** 버튼(![Add Button](../../images/icon-add.png))을 클릭합니다.

1. 메뉴에 추가할 요소 유형(예: 페이지, 문서, 범주)을 선택합니다. 그러면 항목 선택기 창이 열립니다.

    동일한 메뉴에 여러 요소를 추가할 수 있습니다.

   ![메뉴에 추가할 요소 유형을 선택합니다.](./using-the-navigation-menus-application/images/04.png)

1. 추가할 요소를 선택하고 **선택** 을 클릭합니다.

    여러 요소를 선택할 수 있습니다.

    ```{important}
    추가된 요소에 [연결된 디스플레이 페이지](../displaying-content/using-display-page-templates.md)가 없으면 Liferay에서 경고를 표시합니다. 표시 페이지가 없는 항목은 링크가 없으며 메뉴에서 숨겨집니다.
    ```

    ![추가된 요소에 연결된 디스플레이 페이지가 없는 경우](./using-the-navigation-menus-application/images/05.png)

1. 필요에 따라 메뉴 요소를 끌어다 놓아 재구성하거나 계층 구조로 정렬할 수 있습니다.

    ```{tip}
    메뉴 요소를 계층 구조로 구성하는 것 외에도 _Submenu_ 유형을 사용하여 메뉴에 하위 섹션을 추가할 수도 있습니다. 하위 요소가 있는 요소를 삭제하면 하위 요소도 제거됩니다.
    ```

    ![탐색 메뉴에 요소 추가](./using-the-navigation-menus-application/images/06.png)

1. 선택적으로 각 메뉴 요소에 대한 사용자 지정 표시 이름을 정의합니다. 페이지 요소 또는 디스플레이 페이지를 사용하는 콘텐츠 유형 요소(블로그 항목, 웹 콘텐츠 기사, 문서, 어휘 및 카테고리 포함)에 대한 사용자 정의 이름을 정의할 수 있습니다.

    ```{note}
    Liferay 7.4 버전 U9+ 또는 GA13+에서 디스플레이 페이지를 사용하여 콘텐츠 유형 요소에 대한 사용자 정의 표시 이름만 정의할 수 있습니다.
    ```

    이렇게 하려면 메뉴 요소를 선택하고 측면 패널에서 **사용자 지정 이름 사용** 을 선택한 다음 이름을 입력하고 **저장** 을 클릭합니다.

    ![메뉴 요소의 표시를 사용자 지정합니다.](./using-the-navigation-menus-application/images/07.png)

메뉴에 대한 모든 변경 사항이 저장됩니다.

### 동적 어휘 요소 사용

[어휘 탐색 메뉴 요소](./navigation-menu-element-types.md#vocabularies) 은 동적입니다. 하나가 페이지에 표시되면 단일 요소 대신 현재 계층 구조에 모든 범주 및 하위 범주가 추가됩니다. 어휘 내용의 변경 사항은 자동으로 메뉴에 반영됩니다.

동적 어휘 요소를 사용하면 항목 계층이 변경될 때 탐색 메뉴를 빠르고 쉽게 업데이트할 수 있습니다. 예를 들어 카테고리를 사용하여 [새 카탈로그 만들기](https://learn.liferay.com/commerce/latest/ko/product-management/catalogs/creating-a-new-catalog.html) 의 제품 유형을 표시한 다음 카테고리를 업데이트하면 어휘를 사용하여 모든 메뉴가 자동으로 업데이트되도록 할 수 있습니다. 그런 다음 해당 범주에 사용된 [표시 페이지](../displaying-content/using-display-page-templates/publishing-content-with-display-pages.md) 에 따라 범주화에 대한 모든 변경 사항이 페이지 및 탐색 메뉴에 자동으로 반영될 수 있습니다.

![Dynamic Vocabulary 요소는 탐색 메뉴의 카테고리 계층 구조를 반영하도록 자동으로 업데이트됩니다.](./using-the-navigation-menus-application/images/08.png)

### 탐색 메뉴 미리보기

탐색 메뉴를 편집하는 동안 페이지에 표시될 때 어떻게 보이는지 확인하기 위해 탐색 메뉴를 미리 볼 수 있습니다. 눈 아이콘(![Eye icon](../../images/icon-view.png))을 클릭하여 탐색 메뉴의 미리보기가 있는 팝업 창을 엽니다.

![탐색 메뉴를 미리 보고 페이지에 표시될 때 어떻게 보이는지 확인하십시오.](./using-the-navigation-menus-application/images/09.png)

드롭다운 메뉴에서 다른 옵션을 선택하여 **목록** 또는 **탭** 스타일과 같이 메뉴를 표시할 수 있는 다양한 스타일을 볼 수도 있습니다.

## 페이지 생성 중 메뉴 사용

사용자가 사이트 페이지를 만들 때 기존의 모든 탐색 메뉴 목록이 표시됩니다. 사용 가능한 메뉴 목록에서 특정 메뉴를 숨겨 이 동작을 수정할 수 있습니다.

![기존 탐색 메뉴에서 선택](./using-the-navigation-menus-application/images/10.png)

탐색 메뉴에 대해 이 동작을 구성하려면 다음 단계를 따르십시오.

1. **사이트 메뉴**(![Site Menu](../../images/icon-product-menu.png))을 열고 **사이트 빌더** &rarr; **탐색 메뉴** 로 이동합니다.

1. 원하는 **메뉴** 을 선택합니다.

1. **작업** 버튼(![Actions](../../images/icon-actions.png))을 클릭합니다.

1. 설정을 선택 취소/확인합니다.

    ![사이트 페이지를 생성할 때 기존 탐색 메뉴에서 선택할 수 있습니다.](./using-the-navigation-menus-application/images/11.png)

1. **저장** 을 클릭합니다.

## 탐색 메뉴 유형 구성

탐색 메뉴 유형을 구성하려면 다음 단계를 따르십시오.

1. **사이트 메뉴**(![Site Menu](../../images/icon-product-menu.png))을 열고 **사이트 빌더** &rarr; **탐색 메뉴** 로 이동합니다.

1. 원하는 메뉴의 작업 버튼(![Actions Button](../../images/icon-actions.png))을 클릭합니다.

1. 원하는 탐색 유형을 선택합니다. **기본 탐색** , **보조 탐색** 또는 **소셜 탐색** .

    ![원하는 탐색 유형을 선택합니다.](./using-the-navigation-menus-application/images/12.png)

    선택하면 각 메뉴의 구성이 **Marked As** 열에 나타납니다.

| 탐색 메뉴 유형                 | 용법                                                        |
|:------------------------ |:--------------------------------------------------------- |
| **Primary Navigation** | 기본 탐색은 페이지의 기본 탐색입니다.                                     |
| **Secondary Navigation** | 보조 탐색은 탐색의 두 번째 수준으로 사이드바 또는 페이지 내의 별도 메뉴일 수 있습니다.        |
| **소셜 내비게이션** | 소셜 내비게이션은 소셜 미디어 또는 유사한 작업에서 콘텐츠를 공유하기 위한 링크가 포함된 메뉴용입니다. |

## 탐색 메뉴 삭제

1. 원하는 탐색 메뉴(예: **새 메뉴**) 옆에 있는 **작업** 버튼(![Actions Button](../../images/icon-actions.png))을 클릭한 다음 **삭제** 를 클릭합니다.
1. 확인에서 **확인** 을 클릭합니다.

내비게이션 메뉴가 삭제되었습니다.

## 추가 정보

* [사이트 탐색 관리](./managing-site-navigation.md)
* [탐색 메뉴 요소 유형](./navigation-menu-element-types.md)
* [메뉴 디스플레이 구성](./configuring-menu-displays.md)
