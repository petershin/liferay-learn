# 현장 모습

Liferay 사이트의 디자인과 기능은 다양한 보완 메커니즘을 통해 조정 및 사용자 정의할 수 있습니다. 이 표는 일반적인 작업과 목표를 달성하는 데 사용할 수 있는 Liferay 기능과 도구를 요약하고 대조합니다.

| 특징                        | 스타일 북 | 마스터 페이지 템플릿 | 주제 |
| ------------------------- |:-----:|:-----------:|:--:|
| 공통 조각/위젯 포함               |       |      ✓      | ✓  |
| 페이지의 공통 레이아웃 정의           |       |      ✓      | ✓  |
| UI를 통해 관리                 |   ✓   |      ✓      |    |
| 스타일, 간격, 색상 등을 사용자 지정합니다. |   ✓   |             | ✓  |
| 추가 기능 추가                  |       |             | ✓  |

## 마스터 페이지 템플릿

[마스터 페이지 템플릿](../creating-pages/defining-headers-and-footers/master-page-templates.md) 을 사용하면 조각, 특히 머리글과 바닥글을 사용하여 페이지의 공통 요소를 정의할 수 있습니다. 이를 사용하여 사이트의 여러 페이지를 디자인한 모양과 느낌에 맞출 수 있습니다.

![마스터 페이지 템플릿은 머리글 및 바닥글과 같은 모든 페이지에 공통적인 요소를 정의하는 간단한 방법입니다.](./site-appearance/images/01.png)

## 스타일 북

[Style Books](./style-books/using-a-style-book-to-standardize-site-appearance.md) 은 표준 색상 및 간격과 같이 사이트에 적용되는 시각적 표준 세트입니다. 이를 통해 각 페이지 간에 일관된 경험을 유지하면서 모든 페이지의 레이아웃을 독립적으로 디자인할 수 있습니다.

![Style Books는 텍스트 색상과 같은 사이트 모양에 대한 규칙을 정의합니다.](./site-appearance/images/02.png) <!--
TODO:

### Frontend Token Definitions

Note how they tie into themes as well (depending on them for definitions), possibly? And then maybe link to developer guide articles? (Unless maybe developer guide material is not good to go into for this overview... then perhaps it'd be better to just briefly reference their reliance on the theme and leave it as that, not even with an H3)
-->
## 위젯/조각 모양

조각과 위젯은 사이트의 빌딩 블록입니다. 사이트의 모양에 맞게 사용자 정의하는 방법에는 여러 가지가 있습니다.

* [조각 사용자 지정](../developer-guide/developing-page-fragments/developing-fragments-intro.md) 은 사이트 조각 페이지의 모양과 느낌을 맞춤화하는 데 사용할 수 있습니다.
* Widget Templates<!--Add link when available--> 사이트에서 위젯의 모양과 동작을 사용자 정의할 수 있습니다.

## 주제

[테마](./themes/introduction-to-themes.md) 은 사이트의 기본 모양과 느낌을 사용자 지정하기 위한 매우 유연한 도구입니다. [Style Books](#style-books) 및 [페이지 템플릿](../creating-pages/adding-pages/creating-a-page-template.md) 위에 구축할 기반을 제공합니다. 특정 배열을 보장하기 위해 위젯을 테마 자체에 포함할 수도 있습니다.

![사이트 페이지의 테마를 선택하면 사이트의 모양과 느낌이 크게 바뀔 수 있습니다.](./site-appearance/images/03.png)
