---
uuid: e7769e8b-2afa-411c-bb53-413bddea507e
---

# 메뉴 디스플레이 구성

[메뉴 디스플레이](./using-the-navigation-menus-application.md)을 표시하고 구성하려면 [메뉴 디스플레이 조각](../creating-pages/building-and-managing-content-pages/page-fragments-user-interface-reference.md#menu-display) 또는 메뉴 디스플레이 위젯을 사용할 수 있습니다. 이 두 옵션 중 하나를 사용하여 사이트에 대한 메뉴 표시 옵션, 수준 및 동작을 정의할 수 있습니다.

```{tip}
Liferay를 처음 사용하는 경우 메뉴 표시 조각을 사용하여 사이트의 탐색 메뉴 구축을 시작하십시오. 메뉴 표시 조각은 [마스터 페이지 템플릿](../creating-pages/defining-headers-and-footers/creating-a-master-page-template.md)과 함께 작동하는 미리 보기 옵션과 메뉴 표시 구성의 용이성을 제공합니다. 위젯은 제공하지 않습니다.
```

## 메뉴 디스플레이 조각 구성

{bdg-secondary}`가능 7.4+`

Liferay 내비게이션 메뉴 애플리케이션을 사용하면 콘텐츠 페이지의 어느 위치에나 내비게이션 메뉴를 생성할 수 있습니다. 이 탐색 메뉴는 사이트의 페이지 계층 구조 또는 Liferay의 [탐색 메뉴 응용 프로그램](./using-the-navigation-menus-application.md)을 사용하여 정의한 다른 계층 구조를 기반으로 합니다. 메뉴 표시 스타일 옵션과 탐색에 포함할 하위 수준의 수를 정의할 수도 있습니다.

메뉴 표시 조각은 콘텐츠 페이지의 조각 및 위젯 섹션 아래에 나타납니다. 콘텐츠 페이지의 다른 조각과 마찬가지로 이 조각을 추가하고 구성합니다. 자세한 내용은 [콘텐츠 페이지에 요소 추가](../creating-pages/using-content-pages/adding-elements-to-content-pages.md) 및 [단편 구성](../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md)을 참조하십시오.

![메뉴 표시 조각은 콘텐츠 페이지의 조각 및 위젯 섹션 아래에 나타납니다.](./configuring-menu-displays/images/06.png)

두 가지 방법을 사용하여 메뉴 표시 조각에서 페이지 및 하위 페이지의 계층 구조를 구축할 수 있습니다.

- **사이트 탐색 메뉴**(A)는 [사이트 탐색](./managing-site-navigation.md)을 위해 Liferay DXP 탐색 메뉴를 사용하여 정의한 메뉴를 사용합니다. 기본적으로 Liferay DXP는 사이트의 페이지 계층 구조를 기반으로 두 개의 사이트 메뉴를 제공합니다.
- **컨텍스트 메뉴**(B)는 페이지 컨텍스트를 기반으로 하는 메뉴를 보여줍니다. 예를 들어 사이트 메뉴 중 하나에 연결된 첫 번째 수준의 메뉴 표시 조각을 하위 페이지만 표시하는 두 번째 수준의 메뉴 표시 조각과 결합하여 고급 탐색을 만들 수 있습니다. 이렇게 하면 사용자가 첫 번째 수준 메뉴에서 다른 페이지를 클릭할 때 두 번째 수준 메뉴가 동적으로 변경되어 하위 페이지를 표시합니다.

![사이트 메뉴 또는 컨텍스트 메뉴에서 메뉴 표시 조각의 계층 구조를 정의할 수 있습니다.](./configuring-menu-displays/images/05.png)

## 메뉴 표시 위젯 구성

다음은 메뉴 표시 위젯에서 가능한 모든 옵션입니다. Configuration 메뉴에 접근하려면 Menu Display 위젯 상단의 ![Options icon](../../images/icon-widget-options.png) 클릭하세요.

![구성 메뉴로 이동합니다.](./configuring-menu-displays/images/01.png)

### 내비게이션 메뉴

원하는 탐색 메뉴 유형을 선택합니다. 원하는 탐색 메뉴 유형이 미리보기 상자에 나타납니다.

| 탐색 메뉴 유형                 | 묘사                                                        |
|:------------------------ |:--------------------------------------------------------- |
| **페이지 계층** | 페이지 계층 구조는 사이트 작성기의 기본 계층 구조를 기반으로 합니다.                   |
| **Primary Navigation** | 기본 탐색은 페이지의 기본 탐색입니다.                                     |
| **Secondary Navigation** | 보조 탐색은 탐색의 두 번째 수준으로 사이드바 또는 페이지 내의 별도 메뉴일 수 있습니다.        |
| **소셜 내비게이션** | 소셜 내비게이션은 소셜 미디어 또는 유사한 작업에서 콘텐츠를 공유하기 위한 링크가 포함된 메뉴용입니다. |

또는 **선택** 버튼을 클릭하여 탐색 메뉴를 선택할 수 있습니다.

![탐색 메뉴 유형을 선택합니다.](./configuring-menu-displays/images/02.png)

### 디스플레이 템플릿

탐색 메뉴에 대해 [위젯 템플릿](../displaying-content/additional-content-display-options/styling-widgets-with-widget-templates.md) 선택할 수 있습니다.

![표시 템플릿을 선택합니다.](./configuring-menu-displays/images/03.png)

| XSL템플렛을 편집하십시요             | 묘사                                              |
|:-------------------------- |:----------------------------------------------- |
| **목록 메뉴** | 세로 목록의 모든 항목을 표시합니다.                            |
| **Pills Horizontal** | 항목을 가로로 표시하고 버튼 스타일을 사용하여 강조 표시합니다.             |
| **Pills Justified** | Pills Horizontal과 비슷하지만 가로 공간을 채우기 위해 항목을 채웁니다. |
| **Pills Stacked** | 알약 스타일의 수직 버전.                                  |
| **탭** | 탐색 탭과 같은 항목을 표시합니다.                             |
| **Tabs Justified** | 가로 공간을 채우는 탐색 탭.                                |
| **바 최소한의 스타일** | 페이지의 포함된 메뉴에 표시되는 기본 디스플레이의 경량 버전입니다.           |
| **막대 최소 양쪽 맞춤 스타일** | 라이크 바 최소 가로 패딩 스타일.                             |
| **바 기본 스타일** | 기본 내장 메뉴.                                       |
| **Split Button Dropdowns** | 여러 탐색 수준에 대한 드롭다운이 있는 버튼으로 각 항목을 표시합니다.         |

### 표시할 메뉴 항목

위젯에 표시되는 메뉴의 페이지 수준을 구성할 수 있습니다. 시작 레벨, 표시할 레벨 수 및 하위 레벨 표시 방법을 선택할 수 있습니다.

![표시할 메뉴 항목을 선택합니다.](./configuring-menu-displays/images/04.png)

| 분야             | 묘사                                                                                                             |
|:-------------- |:-------------------------------------------------------------------------------------------------------------- |
| **메뉴 항목으로 시작** | 레벨 유형 선택: **레벨** , **현재 메뉴 항목에 상대적인 레벨** , 또는 **부모 선택** .                                                               |
| **레벨 수** | 표시할 레벨 번호를 0에서 4까지 선택합니다. 수준 0은 상위 페이지를 나타내고 수준 1은 첫 번째 수준의 하위 페이지를 나타냅니다.                                     |
| **표시할 수준:** | 탐색에 표시할 수준 수를 1에서 무제한까지 선택합니다.                                                                                 |
| **하위 수준 확장:** | 이 드롭다운 메뉴에서 **자동** 또는 **모두** 선택합니다. 이는 내비게이션 위로 마우스를 가져가면 내비게이션 수준을 한 번에 하나씩 자동으로 표시할지 아니면 모든 수준을 한 번에 표시할지 결정합니다. |

## 추가 정보

- [탐색 메뉴 애플리케이션 사용](./using-the-navigation-menus-application.md)
- [사이트 탐색 관리](./managing-site-navigation.md)
- [콘텐츠 페이지에 요소 추가](../creating-pages/using-content-pages/adding-elements-to-content-pages.md)
- [콘텐츠 페이지 편집기 사용자 인터페이스 참조](../creating-pages/using-content-pages/content-page-editor-ui-reference.md)
