---
toc:
- ./actions/defining-object-actions.md
- ./actions/understanding-action-types.md
---
# 액션

```{toctree}
:maxdepth: 3

actions/defining-object-actions.md
actions/understanding-action-types.md
```

작업은 개체 항목 이벤트에 의해 트리거되는 작업을 정의합니다. Liferay는 이벤트(추가, 삭제 또는 업데이트)를 수신하고 작업을 실행합니다.

![개체 정의에 작업을 추가합니다.](./actions/images/01.png)

Liferay는 다음 작업 유형을 제공합니다.

| 작업 유형                                                                           | 묘사                                              |
|:------------------------------------------------------------------------------- |:----------------------------------------------- |
| [Webhook](./actions/understanding-action-types.md#webhook-actions)              | URL에 페이로드를 전달합니다.                               |
| [Groovy 스크립트](./actions/understanding-action-types.md#groovy-script-actions)    | [Groovy](https://groovy-lang.org/) 스크립트를 실행합니다. |
| [알림](./actions/understanding-action-types.md#notification-actions)              | 미리 정의된 템플릿을 사용하여 이메일 알림을 보냅니다.                  |
| [객체 항목 추가](./actions/understanding-action-types.md#add-an-object-entry-actions) | 활성 개체에 항목을 만듭니다.                                |

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} 개체 작업 정의
:link: ./actions/defining-object-actions.md
:::

:::{grid-item-card} 동작 유형 이해
:link: ./actions/understanding-action-types.md
:::  
:
:::
