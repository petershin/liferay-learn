---
toc:
  - ./validations/adding-field-validations.md
  - ./validations/expression-builder-validations-reference.md
---
# 검증

{bdg-secondary}`liferay 7.4+`

객체 유효성 검사는 유효한 필드 입력을 결정하기 위한 규칙을 설정하고 [Groovy 스크립트](./validations/adding-field-validations.md#using-groovy-validations) 또는 [Liferay 표현식](./validations/adding-field-validations.md#using-expression-builder-validations) 을 사용하여 정의됩니다. 트리거되면 유효성 검사는 정의된 조건에 따라 유효한 필드 입력을 확인하고 잘못된 입력에 대한 오류 메시지를 표시합니다.

![Add field validations to object definitions.](./validations/images/01.png)

기본 유효성 검사가 요구 사항을 충족하지 않는 경우 `objectValidationRule` 클라이언트 확장을 사용하여 사용자 정의 유효성 검사를 만들 수 있습니다. 자세한 내용은 [마이크로서비스 클라이언트 확장](../../client-extensions/microservice-client-extensions.md) 참조하세요.

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} 필드 유효성 검사 추가
:link: ./validations/add-field-validations.md
:::

:::{grid-item-card} 표현식 빌더 검증 참조
:link: ./validations/expression-builder-validations-reference.md
:::
::::