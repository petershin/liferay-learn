---
toc:
- ./validations/adding-custom-validations.md
- ./validations/expression-builder-validations-reference.md
---
# 검증

```{toctree}
:maxdepth: 3

validations/adding-custom-validations.md
validations/expression-builder-validations-reference.md
```

{bdg-secondary}`사용 가능한 Liferay 7.4+`

개체 유효성 검사는 유효한 필드 항목을 결정하기 위한 규칙을 설정하고 [Groovy 스크립트](./validations/adding-custom-validations.md#using-groovy-validations) 또는 [Liferay 식](./validations/adding-custom-validations.md#using-expression-builder-validations)을 사용하여 정의됩니다. 트리거되면 유효성 검사는 정의된 조건에 따라 유효한 필드 항목을 확인하고 잘못된 항목에 대한 오류 메시지를 표시합니다.

![개체 정의에 필드 유효성 검사를 추가합니다.](./validations/images/01.png)

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} 사용자 지정 유효성 검사 추가
:link: ./validations/adding-custom-validations.md
:::

:::{grid-item-card} 표현식 작성기 유효성 검사 참조
:link: ./validations/expression-builder-validations-reference.md
:::
::::
