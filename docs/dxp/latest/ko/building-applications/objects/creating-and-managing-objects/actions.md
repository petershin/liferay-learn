---
toc:
  - ./actions/defining-object-actions.md
  - ./actions/understanding-action-types.md
  - ./actions/using-manual-actions.md
---
# 액션

개체 작업은 개체 항목 이벤트에 대해 수동 또는 자동으로 실행할 수 있는 사용자 정의 비즈니스 논리를 정의합니다. 예를 들어 웹후크 URL에 항목 이벤트 데이터 전달, 항목 업데이트 후 이메일 알림 보내기, 항목 생성 후 사용자 정의 Groovy 스크립트 실행 등이 있습니다.

자동 트리거를 사용할 때 Liferay는 이벤트를 수신하고 미리 정의된 조건에 따라 자동으로 작업을 실행합니다.

독립 실행형 트리거를 사용할 때 Liferay는 객체 항목에 대한 작업 메뉴( ![Actions Button](../../../images/icon-actions.png) )에 작업을 추가하고 이를 트리거하는 헤드리스 API를 생성합니다. 작업은 수동으로 실행해야 하지만 작업을 버튼 조각에 매핑할 수 있습니다. 수동 작업에 대한 자세한 내용은 [수동 작업 사용](./actions/using-manual-actions.md) 참조하세요.

![객체 정의에 작업을 추가합니다.](./actions/images/01.png)

Liferay 객체는 다음과 같은 작업 유형을 제공합니다.

| 유형          | 묘사                                              |
|:----------- |:----------------------------------------------- |
| 알림          | 사전 정의된 템플릿을 사용하여 이메일 또는 사용자 알림을 보냅니다.           |
| 객체 항목 추가    | 활성 개체에 항목을 만듭니다.                                |
| 객체 항목 업데이트  | 현재 개체 항목의 필드를 업데이트합니다.                          |
| Webhook     | 페이로드를 URL로 전달합니다.                               |
| Groovy 스크립트 | [Groovy](https://groovy-lang.org/) 스크립트를 실행합니다. |

```{important}
Groovy 스크립트 작업은 Liferay Experience Cloud 자체 관리형 및 Liferay DXP 자체 호스팅에만 사용할 수 있습니다.
```

<!--TASK: When client extensions docs are ready, mention being able to add Action Types and Notification Types.-->



