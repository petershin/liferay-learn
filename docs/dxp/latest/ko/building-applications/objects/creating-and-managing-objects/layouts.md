---
toc:
- ./layouts/designing-object-layouts.md
- ./layouts/adding-categorization-to-fields-tabs.md
---

# 배치

```{toctree}
:maxdepth: 3

layouts/designing-object-layouts.md
layouts/adding-categorization-to-fields-tabs.md
```

{bdg-secondary}`사용 가능한 Liferay 7.4+`

개체 레이아웃은 항목을 만들고 편집할 때 필드와 관계가 나타나는 방식을 정의합니다. 게시된 모든 개체에는 개체의 필드를 사전순으로 나열하는 단일 탭이 있는 자동 생성 레이아웃이 포함됩니다. 사용자 정의 개체에 대한 [자신만의 레이아웃을 디자인](./layouts/designing-object-layouts.md)하여 해당 필드와 관계가 표시되는 방식을 결정할 수 있습니다. 7.4 U31+ 및 GA31+의 경우 탭에 [분류 도구](./layouts/adding-categorization-to-fields-tabs.md)를 추가하여 최종 사용자가 개체 항목에 태그 및 범주를 적용할 수 있습니다.


```{important}
자동 생성된 레이아웃은 개체 관계를 표시하지 않습니다. 관계를 표시하려면 사용자 정의 레이아웃을 생성해야 합니다.
```


![사용자 정의 개체에 레이아웃을 추가하여 항목 생성 중 해당 필드 및 관계가 표시되는 방식을 정의합니다.](./layouts/images/01.png)

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} 개체 레이아웃 디자인
:link: ./layouts/designing-object-layouts.md
:::  

:::{grid-item-card} 필드 탭에 분류 추가
:link: ./layouts/adding-categorization-to-fields-tabs.md
:::
::::
