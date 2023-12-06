---
toc:
  - ./picklists/creating-picklists.md
  - ./picklists/exporting-and-importing-picklists.md
  - ./picklists/managing-picklist-permissions.md
  - ./picklists/picklists-api-basics.md
---
# 선택목록

```{toctree}
:maxdepth: 3

picklists/creating-picklists.md
picklists/exporting-and-importing-picklists.md
picklists/managing-picklist-permissions.md
picklists/picklists-api-basics.md
```

{bdg-보조}`Liferay 7.4+`

Liferay **선택 목록**은 이름/키 쌍으로 구성되고 원하는 수의 항목을 포함할 수 있는 사전 정의된 문자열 값 목록입니다. 목록이 [생성되면](./picklists/creating-picklists.md) 이를 사용하여 단일 선택 또는 다중 선택 필드를 객체 정의에 추가할 수 있습니다. 이러한 필드를 사용하여 [표시된 항목 필터링](./displaying-object-entries.md), [사용자 정의 항목 상태 정의](./creating-and-managing-objects/fields/adding-and-managing-custom- states.md) 등이 있습니다. 선택 목록을 사용하여 상태를 정의할 때 [validations](./creating-and-managing-objects/validations/adding-field-validations.md), [actions](./creating-and-managing-objects/actions)를 사용할 수 있습니다. /defining-object-actions.md) 및 [워크플로 프로세스](./enabling-workflows-for-objects.md)를 사용하여 각 상태에 대한 복잡한 비즈니스 로직을 구현합니다.

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} 선택 목록 만들기
:link: ./picklists/creating-picklists.md
:::

:::{grid-item-card} 선택 목록 내보내기 및 가져오기
:link: ./picklists/exporting-and-importing-picklists.md
:::

:::{grid-item-card} 선택 목록 권한 관리
:link: ./picklists/managing-picklist-permissions.md
:::

:::{grid-item-card} 선택 목록 API 기본 사항
:link: ./picklists/picklists-api-basics.md
:::
::::