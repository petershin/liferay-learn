---
toc:
  - ./picklists/using-picklists.md
  - ./picklists/exporting-and-importing-picklists.md
  - ./picklists/managing-picklist-permissions.md
  - ./picklists/picklists-api-basics.md
---
# 선택목록

```{toctree}
:maxdepth: 3

picklists/using-picklists.md
picklists/exporting-and-importing-picklists.md
picklists/managing-picklist-permissions.md
picklists/picklists-api-basics.md
```

Liferay 선택 목록은 이름/키 쌍으로 구성되고 여러 항목을 포함할 수 있는 미리 정의된 문자열 값 목록입니다. 목록이 [생성되면](./picklists/using-picklists.md#creating-a-picklist) , 선택 목록 필드 유형 [선택 목록 필드 유형](./picklists/using-picklists.md#adding-picklist-fields-to-objects) 사용하여 개체 정의에 추가할 수 있습니다. 그런 다음 이 필드를 사용하여 [표시된](./displaying-object-entries.md) 를 필터링하거나 [사용자 정의 항목 상태를 정의할 수 있습니다](./creating-and-managing-objects/fields/adding-and-managing-custom-states.md). 상태를 정의하는 데 사용되는 경우 [유효성 검사](./creating-and-managing-objects/validations/adding-field-validations.md) 및 [작업](./creating-and-managing-objects/actions/defining-object-actions.md)을 사용하여 사용자 지정 비즈니스 논리를 각 상태와 연결할 수도 있습니다.

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} 선택 목록 사용
:link: ./picklists/using-picklists.md
:::

:::{grid-item-card} 선택 목록 내보내기 및 가져오기
:link: ./picklists/exporting-and-importing-picklists.md
:::

:::{grid-item-card} 선택 목록 권한 관리
:link: ./picklists/managing-picklist-permissions.md
:::

:::{grid-item-card} Picklists API 기초
:link: ./picklists/picklists-api-basics.md
:::
::::
