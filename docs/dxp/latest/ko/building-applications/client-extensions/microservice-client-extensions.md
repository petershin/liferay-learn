---
toc:
  - ./microservice-client-extensions/using-a-microservice-client-extension.md
  - ./microservice-client-extensions/object-action-yaml-configuration-reference.md
  - ./microservice-client-extensions/workflow-action-yaml-configuration-reference.md
  - ./microservice-client-extensions/notification-type-yaml-configuration-reference.md
---
# 마이크로서비스 클라이언트 확장

{bdg-secondary}`7.4 U45+/GA45+`

Liferay 인스턴스의 이벤트에 대한 응답으로 자체 코드를 실행하도록 마이크로서비스 클라이언트 확장을 정의합니다. 코드를 구현하는 방법은 귀하에게 달려 있습니다. 원하는 패턴과 기술을 사용하십시오. 마이크로서비스 클라이언트 확장은 Liferay 외부에서 호스팅되며 Liferay 자체의 신호에 의해 트리거됩니다.

마이크로서비스 클라이언트 확장은 요청을 적절하게 처리하고 보호된 Liferay API를 호출하기 위해 미리 구성된 인증 프로필이 필요합니다. 인증 프로필을 동일한 프로젝트 내의 클라이언트 확장으로 포함하여 추가할 수 있습니다(예: [OAuth 사용자 에이전트 클라이언트 확장](./configuration-client-extensions.md#oauth-user-agent-client-extensions)).

마이크로서비스 클라이언트 확장은 Liferay Experience Cloud 내에 배포될 때 자동으로 호스팅됩니다. Liferay 인스턴스를 자체 호스팅하는 경우 이러한 클라이언트 확장이 별도로 사용하는 마이크로서비스를 호스팅해야 합니다.

## 개체 작업 클라이언트 확장

{bdg-secondary}`Liferay Experience Cloud 및 Liferay DXP 7.4+(온프레미스)`

개체 작업 클라이언트 확장은 [개체 정의의](../objects.md) 작업 이벤트에 바인딩되는 외부 작업 핸들러를 정의합니다. 개체 작업이 발생할 때 마이크로 서비스의 핸들러 코드가 실행됩니다.

`client-extension.yaml` 파일에서 `유형` 값을 사용하여 개체 작업 클라이언트 확장을 지정합니다.

```yaml
type: objectAction
```

## 워크플로 작업 클라이언트 확장

{bdg-secondary}`Liferay Experience Cloud 및 Liferay DXP 7.4+(온프레미스)`

워크플로 작업 클라이언트 확장은 [Liferay 워크플로](../../process-automation/workflow/introduction-to-workflow.md)의 작업 이벤트에 바인딩하는 외부 워크플로 작업 핸들러를 정의합니다. 마이크로서비스의 핸들러 코드는 워크플로 작업이 발생할 때 실행됩니다.

`client-extension.yaml` 파일에서 `유형` 값을 사용하여 워크플로 작업 클라이언트 확장을 지정합니다.

```yaml
type: workflowAction
```

## 알림 유형 클라이언트 확장

{bdg-secondary}`Liferay Experience Cloud 및 Liferay DXP 7.4+(온프레미스)`

알림 유형 클라이언트 확장은 Liferay에서 [알림 이벤트](../../process-automation/notifications.md) 에 바인딩되는 외부 알림 핸들러를 정의합니다. 알림 이벤트가 발생하면 마이크로서비스의 핸들러 코드가 실행됩니다.

알림 유형 클라이언트 확장을 지정하려면 `client-extension.yaml` 파일에서 `유형` 값을 사용하십시오.

```yaml
type: notificationType
```

## 관련 항목

* [클라이언트 확장 소개](../client-extensions.md)
* [`client-extension.yaml`에서 클라이언트 확장 구성](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)
