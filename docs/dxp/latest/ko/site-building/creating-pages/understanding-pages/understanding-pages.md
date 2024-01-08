# 페이지 이해

페이지는 사이트 사용자에게 콘텐츠와 애플리케이션을 표시합니다.

## 페이지 세트

비공개 페이지가 활성화되면 사이트의 페이지는 두 개의 [페이지 세트](../page-settings/configuring-page-sets.md), 즉 공개 페이지와 비공개 페이지로 구성됩니다.

```{note}
Liferay 7.4 U22+ 및 GA22+의 경우, 신규 설치 시 비공개 페이지는 기본적으로 비활성화되어 있습니다. 비공개 페이지를 활성화하려면 [비공개 페이지 활성화하기](#enabling-private-pages) 를 참조하세요.
```

공개 페이지와 비공개 페이지는 다음과 같은 점에서 다릅니다.

| 행동                         | 공중 페이지 | 개인 페이지 |
| :------------------------- | :----- | ------ |
| 인증되지 않은 사용자에게 표시           | ✔      |        |
| 보려면 로그인 및 사이트 회원가입이 필요합니다. |        | ✔      |
| 고유한 URL 패턴                 | ✔      | ✔      |

공개 페이지는 `[web-address]/`**web**`/[site-name]` URL 패턴을 사용하고, 비공개 페이지는 `[web-address]/`**group**`/[site-name]`을 사용합니다.

## 페이지 유형

[페이지 추가](../adding-pages/adding-a-page-to-a-site.md)에서는 여러 가지 페이지 유형을 사용할 수 있습니다. 기본 페이지 유형은 콘텐츠 페이지입니다. [페이지 템플릿](../adding-pages/creating-a-page-template.md)을 기반으로 페이지를 만들 수도 있습니다. 페이지 유형 및 페이지 템플릿은 아래에 자세히 설명되어 있습니다.

![You must select a page type when adding pages.](./understanding-pages/images/01.png)

```{tip}
현재 보고 있는 페이지의 유형이 페이지 상단에 표시되어 사용 중인 관리 옵션과 페이지를 구성하기 위해 어디로 이동해야 하는지 파악하는 데 도움이 됩니다.
```

### 콘텐츠 페이지

콘텐츠 페이지를 사용하면 사용자는 쉽게 관리할 수 있고 콘텐츠를 인라인으로 편집할 수 있는 전문적인 페이지를 구축할 수 있습니다. 콘텐츠 페이지는 주로 [페이지 조각](../page-fragments-and-widgets/using-fragments.md) 및 위젯을 사용하여 구축됩니다.

![Content pages can be composed of multiple fragments.](./understanding-pages/images/02.png)

콘텐츠 페이지를 사용하면 추가적인 강력한 기능과 이점에 액세스할 수 있습니다.

* [맞춤형 및 적응형 사이트 경험](../../personalizing-site-experience.md)
* [A/B 테스트](../../optimizing-sites/ab-testing/ab-testing.md)
* 친근한 콘텐츠 및 사이트 구축 경험

콘텐츠 페이지에 대한 자세한 내용은 [콘텐츠 페이지 사용](../using-content-pages.md)을 참조하세요. 구축을 시작하려면 [콘텐츠 페이지에 요소 추가](../using-content-pages/adding-elements-to-content-pages.md)를 참조하세요.

### 위젯 페이지

위젯 페이지에는 위젯(애플리케이션)을 표시하기 위한 세트 [layout](../../creating-pages/page-settings/configuring-individual-pages.md#page-layout) 이 있습니다. 위젯은 콘텐츠를 표시하거나 페이지에 대화형 및 동적 기능을 추가할 수 있습니다. 자세한 내용은 [페이지에 위젯 추가](../using-widget-pages/adding-widgets-to-a-page.md)를 참조하세요.

![Widget pages can provide a number of functions, such as a dedicated wiki page solution.](./understanding-pages/images/03.png)

### 콘텐츠 페이지와 위젯 페이지 비교

이 표에서는 콘텐츠 페이지와 위젯 페이지 간의 몇 가지 차이점을 비교합니다.

| 특징                | 콘텐츠 페이지 | 위젯 페이지 |
| :---------------- | :------ | ------ |
| 위젯 추가 기능          | ✔       | ✔      |
| 개인화된 사이트 경험       | ✔       |        |
| A/B 테스트에 대한 액세스   | ✔       |        |
| 간편한 레이아웃 및 콘텐츠 편집 | ✔       |        |
| 고급 사용자 정의 레이아웃    |         | ✔      |
| 사용자 정의 가능한 열      |         | ✔      |
| 준비 페이지 변형         |         | ✔      |

### 기타 페이지 유형

사용 가능한 페이지 유형은 여러 가지가 있으며 각각 특정 사용 사례를 충족합니다. 자세한 내용은 [기타 페이지 유형](../understanding-pages/other-page-types.md)을 참조하세요.

## 글로벌 페이지 템플릿

페이지를 추가할 때 페이지 템플릿을 선택할 수도 있습니다. 페이지 템플릿은 페이지에 이미 배포된 애플리케이션이 포함된 사전 설정된 페이지입니다. 기본적으로 전역 템플릿만 사용할 수 있지만 사용자가 생성한 추가 컬렉션도 옵션으로 표시됩니다.

| 글로벌 페이지 템플릿 | 묘사                                                                                                        |
| :---------- | :-------------------------------------------------------------------------------------------------------- |
| 검색          | 검색 창, 제안, 사이트 패싯, 유형 패싯, 태그 패싯, 카테고리 패싯, 폴더 패싯, 사용자 패싯, 수정된 패싯, 검색 결과 및 검색 옵션과 같은 위젯을 사용하여 위젯 페이지를 생성합니다. |

페이지 템플릿에 대한 자세한 내용은 [페이지 템플릿 만들기](../adding-pages/creating-a-page-template.md)를 참조하세요.

## 하위 페이지 및 페이지 계층 구조

페이지는 하위 페이지를 생성하여 계층적 방식으로 생성될 수도 있습니다. 하위 페이지는 카테고리로 구성할 수 있는 페이지가 여러 개 있는 경우 유용할 수 있습니다.

![You can add a child Page to a top-level page to organize pages hierarchically.](./understanding-pages/images/04.png)

```{tip}
사이트 맵 응용 프로그램을 사용하면 사이트 계층 구조의 페이지 간을 탐색할 수 있습니다. 사이트 관리자는 루트 페이지와 표시 깊이를 구성할 수 있습니다. 사이트 맵 응용 프로그램의 표시 깊이에 따라 표시할 중첩 페이지 수준이 결정됩니다.
```

## 비공개 페이지 활성화

{bdg-secondary}`Liferay 7.4 U22+ 및 GA22+의 경우`

기본적으로 새로운 Liferay 설치에는 사용자가 개인 페이지를 생성하지 못하도록 하는 릴리스 기능 플래그가 포함되어 있습니다. Liferay 시스템의 개인 페이지를 활성화하려면 다음 단계를 따르십시오.

1. **전역 메뉴**( ![전역 메뉴](../../../images/icon-applications-menu.png) )를 열고 **제어판** 탭으로 이동한 다음 **시스템 설정** 을 클릭합니다.

1. **릴리스 기능 플래그** 로 이동하세요.

1. 비활성화된 기능 드롭다운 메뉴에서 **비공개 페이지 비활성화** 를 선택합니다.

   ![Select disable private pages.](./understanding-pages/images/05.png)

1. **저장** 을 클릭하세요.

   비공개 페이지를 다시 비활성화하려면 **비공개 페이지 비활성화** 를 선택 취소하고 **업데이트** 를 클릭하세요.

## 관련 정보

* [페이지 추가](../adding-pages/adding-a-page-to-a-site.md)
* [개별 페이지 구성](../page-settings/configuring-individual-pages.md)
* [위젯 페이지의 사용자 개인화 활성화](../using-widget-pages/enabling-user-personalization-of-widget-pages.md)
