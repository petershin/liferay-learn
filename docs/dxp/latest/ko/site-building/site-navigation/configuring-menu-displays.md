# 메뉴 표시 구성

[메뉴 표시](./using-the-navigation-menus-application.md) 을 표시하고 구성하려면 [메뉴 표시 조각](#configuring-the-menu-display-fragment) 또는 [메뉴 표시 위젯](#configuring-the-menu-display-widget) 을 사용할 수 있습니다. 이 두 가지 옵션 중 하나를 사용하여 사이트의 메뉴 표시 옵션, 수준 및 동작을 정의할 수 있습니다.

```{tip}
Liferay를 처음 사용하는 경우 메뉴 표시 조각을 사용하여 사이트 탐색 메뉴 구축을 시작하세요. 메뉴 표시 조각은 [마스터 페이지 템플릿](../creating-pages/defining-headers-and-footers/creating-a-master-page-template.md) 에서 작동하는 미리 보기 옵션과 메뉴 표시 위젯이 제공하지 않는 구성 용이성을 제공합니다.
```

## 메뉴 표시 조각 구성

{bdg-secondary}`7.4+ 사용 가능`

콘텐츠 페이지 어디에서나 탐색 메뉴를 만들 수 있습니다. 이 탐색 메뉴는 사이트의 페이지 계층 구조 또는 Liferay의 탐색 메뉴 응용 프로그램 [네비게이션 메뉴 애플리케이션](./using-the-navigation-menus-application.md) 사용하여 정의한 기타 계층 구조를 기반으로 합니다. 탐색에 포함할 메뉴 표시 스타일 옵션과 하위 수준 수를 정의할 수도 있습니다.

메뉴 표시 조각은 콘텐츠 페이지의 조각 및 위젯 섹션 아래에 나타납니다. 콘텐츠 페이지의 다른 조각과 마찬가지로 이 조각을 추가하고 구성합니다. 자세한 내용은 [콘텐츠 페이지에 요소 추가](../creating-pages/using-content-pages/adding-elements-to-content-pages.md) 및 [조각 구성](../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md) 을 참조하세요.

![The Menu Display fragment appears under the Fragments and Widget section of your content page.](./configuring-menu-displays/images/01.png)

다음 두 가지 방법을 사용하여 메뉴 표시 부분에서 페이지 및 하위 페이지의 계층 구조를 구축할 수 있습니다.

- **사이트 탐색 메뉴**(A)는 사이트 탐색을 위해 Liferay DXP 탐색 메뉴를 사용하여 정의한 메뉴를 사용합니다. 기본적으로 Liferay DXP는 사이트의 페이지 계층 구조를 기반으로 두 개의 사이트 메뉴를 제공합니다.
- **컨텍스트 메뉴**(B)는 페이지 컨텍스트를 기반으로 하는 메뉴를 표시합니다. 예를 들어 사이트 메뉴 중 하나에 연결된 1단계 메뉴 표시 조각을 하위 페이지만 표시하는 2단계 메뉴 표시 조각과 결합하여 더욱 고급 탐색 기능을 만들 수 있습니다. 이렇게 하면 사용자가 첫 번째 수준 메뉴의 다른 페이지를 클릭할 때 두 번째 수준 메뉴가 동적으로 변경되어 하위 페이지가 표시됩니다.

![You can define the hierarchy of the Menu Display fragment from your site menus or from contextual menus.](./configuring-menu-displays/images/02.png)

## 메뉴 표시 위젯 구성

다음은 메뉴 표시 위젯에서 가능한 모든 옵션입니다. 구성 메뉴에 접근하려면 메뉴 표시 위젯 상단에 있는 **옵션**( ![옵션 아이콘](../../images/icon-widget-options.png) )을 클릭하세요.

![Navigate to the configuration menu.](./configuring-menu-displays/images/03.png)

### 탐색 메뉴

원하는 탐색 메뉴 유형을 선택합니다. 원하는 탐색 메뉴 유형이 미리보기 상자에 나타납니다.

| 탐색 메뉴 유형               | 묘사                                                    |
| :--------------------- | :---------------------------------------------------- |
| **페이지 계층** | 페이지 계층 구조는 사이트 빌더의 기본 계층 구조를 기반으로 합니다.                |
| **Primary Navigation** | 기본 탐색은 페이지의 기본 탐색입니다.                                 |
| **보조 탐색** | 보조 탐색은 탐색의 두 번째 수준으로, 사이드바 또는 페이지 내의 별도 메뉴일 수 있습니다.   |
| **소셜 내비게이션** | 소셜 탐색은 소셜 미디어에서 콘텐츠를 공유하거나 유사한 작업을 위한 링크가 포함된 메뉴용입니다. |

또는 **메뉴 선택** 을 선택하고 **선택** 버튼을 클릭하여 기존 탐색 메뉴를 선택할 수 있습니다(이 옵션을 사용하여 상위 사이트에서 탐색 메뉴를 선택할 수 있습니다).

![Select the type of navigation menu.](./configuring-menu-displays/images/04.png)

### 디스플레이 템플릿

탐색 메뉴에 대해 [위젯 템플릿](../displaying-content/additional-content-display-options/styling-widgets-with-widget-templates.md) 선택할 수 있습니다.

![Select the display template.](./configuring-menu-displays/images/05.png)

| XSL템플렛을 편집하십시요             | 묘사                                          |
| :------------------------- | :------------------------------------------ |
| **목록 메뉴** | 모든 항목을 세로 목록으로 표시합니다.                       |
| **Pills Horizontal** | 항목을 가로로 표시하고 강조 표시를 위해 버튼 스타일을 사용합니다.       |
| **Pills Justified** | Pills Horizontal과 비슷하지만 항목을 채워 가로 공간을 채웁니다. |
| **Pills Stacked** | 알약 스타일의 수직 버전입니다.                           |
| **탭** | 탐색 탭과 같은 항목을 표시합니다.                         |
| **Tabs Justified** | 수평 공간을 채우는 탐색 탭입니다.                         |
| **미니멀한 스타일의 바** | 페이지에 포함된 메뉴에 표시되는 기본 디스플레이의 경량 버전입니다.       |
| **최소 양쪽 맞춤 스타일의 막대** | Like Bar는 수평 패딩을 사용하여 최소한의 스타일을 적용했습니다.     |
| **바 기본 스타일** | 기본 포함 메뉴입니다.                                |
| **Split Button Dropdowns** | 여러 탐색 수준에 대한 드롭다운이 있는 버튼으로 각 항목을 표시합니다.     |

### 표시할 메뉴 항목

메뉴의 어느 수준에서 어느 페이지가 위젯에 표시되는지 구성할 수 있습니다. 시작 레벨, 표시할 레벨 수, 하위 레벨 표시 방법을 선택할 수 있습니다.

![Select the Menu Items to Show.](./configuring-menu-displays/images/06.png)

| 분야             | 묘사                                                                                                     |
| :------------- | :----------------------------------------------------------------------------------------------------- |
| **메뉴 항목으로 시작** | **레벨** , **현재 메뉴 항목에 상대적인 레벨** 또는 **상위 항목 선택** 중에서 레벨 유형을 선택합니다. 아래에서 이러한 옵션에 대해 자세히 알아보세요.                   |
| **레벨 수** | 0부터 4까지 표시할 레벨 번호를 선택합니다. 수준 0은 상위 페이지를 나타내고, 수준 1은 첫 번째 수준 하위 페이지를 나타내는 식입니다.                         |
| **표시할 수준:** | 1부터 무제한까지 탐색에 표시할 수준 수를 선택합니다.                                                                         |
| **하위 수준 확장:** | 이 드롭다운 메뉴에서 **자동** 또는 **모두** 를 선택하세요. 탐색 위에 마우스를 올리면 탐색 수준이 한 번에 하나씩 자동으로 표시되는지 아니면 모든 수준이 동시에 표시되는지 결정됩니다. |

다음은 메뉴 항목으로 시작 필드 아래에 있는 세 가지 옵션입니다.

1. **레벨** : 레벨 0은 루트 레벨에서 시작하고 레벨 1-4는 현재 페이지(존재하는 경우)로 이어지는 후속 레벨입니다. 거기에서 따라야 할 경로를 결정할 수 없기 때문에 더 이상의 레벨은 표시되지 않습니다.

1. **현재 기준 레벨** : 여기서는 순서가 반대입니다. 수준 0은 현재 페이지를 나타내고 수준 1-4는 바로 상위(1)부터 시작하여 가장 먼 상위 페이지 또는 루트 페이지까지의 상위 수준을 나타냅니다.

1. **상위 선택** : 메뉴의 시작점으로 사용하려는 페이지를 수동으로 선택합니다.

## 관련 주제

* [탐색 메뉴 애플리케이션 사용하기](./using-the-navigation-menus-application.md)
* [콘텐츠 페이지에 요소 추가하기](../creating-pages/using-content-pages/adding-elements-to-content-pages.md)
* [콘텐츠 페이지 편집기 사용자 인터페이스 참조](../creating-pages/using-content-pages/content-page-editor-ui-reference.md)
