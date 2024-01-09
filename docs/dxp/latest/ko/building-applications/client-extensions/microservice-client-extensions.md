---
toc:
  - ./microservice-client-extensions/using-a-microservice-client-extension.md
  - ./microservice-client-extensions/object-action-yaml-configuration-reference.md
  - ./microservice-client-extensions/object-validation-rule-yaml-configuration-reference.md
  - ./microservice-client-extensions/workflow-action-yaml-configuration-reference.md
  - ./microservice-client-extensions/notification-type-yaml-configuration-reference.md
---
# 마이크로서비스 클라이언트 확장

{bdg-primary}`Liferay Self-Hosted`
{bdg-primary}`Liferay SaaS`
{bdg-warning}`Liferay PaaS`

{bdg-secondary}`Liferay 7.4+`


Liferay 인스턴스의 이벤트에 대한 응답으로 자체 코드를 실행하도록 마이크로서비스 클라이언트 확장을 정의합니다. 코드를 구현하는 방법은 귀하에게 달려 있습니다. 원하는 패턴과 기술을 사용하십시오. 마이크로서비스 클라이언트 확장은 Liferay 외부에서 호스팅되며 Liferay 자체의 신호에 의해 트리거됩니다.

마이크로서비스 클라이언트 확장에는 요청을 적절하게 처리하고 보호된 Liferay API를 호출하기 위해 사전 구성된 인증 프로필이 필요합니다. 인증 프로필을 동일한 프로젝트 내의 클라이언트 확장으로 포함하여 추가할 수 있습니다(예: [OAuth 사용자 에이전트 클라이언트 확장](./configuration-client-extensions.md#oauth-user-agent-client-extensions) ).

마이크로서비스 클라이언트 확장은 Liferay Experience Cloud 내에 배포될 때 자동으로 호스팅됩니다. Liferay 인스턴스를 자체 호스팅하는 경우 이러한 클라이언트 확장이 별도로 사용하는 마이크로서비스를 호스팅해야 합니다.

## 개체 작업 클라이언트 확장

개체 작업 클라이언트 확장은 [개체 정의의](../objects.md) 작업 이벤트에 바인딩되는 외부 작업 처리기를 정의합니다. 개체 작업이 발생할 때 마이크로서비스의 핸들러 코드가 실행됩니다.

개체 작업 클라이언트 확장을 지정하려면 `client-extension.yaml` 파일의 `type` 값을 사용하세요.

```yaml
type: objectAction
```

## 객체 유효성 검사 규칙 클라이언트 확장

개체 유효성 검사 규칙 클라이언트 확장은 개체 정의에 추가할 수 있는 사용자 지정 유효성 검사 [검증](../objects/creating-and-managing-objects/validations.md) 정의합니다. 객체 항목 제출 이벤트에 바인딩하고 사용자가 항목을 생성하거나 업데이트할 때 실행되는 외부 이벤트 핸들러를 정의하여 작동합니다. 이러한 클라이언트 확장 프로그램을 생성할 때 유효한 필드 입력을 결정하기 위해 조건을 얼마든지 사용할 수 있지만 각 조건은 'validationCriteriaMet' 키를 'true' 또는 'false'로 설정하고 반환해야 합니다. 기본 예는 [`ObjectValidationRule1RestController`](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-etc-spring-boot/src/main/java/com/liferay/sample/ObjectValidationRule1RestController.java) 참조하세요.

이 유형의 클라이언트 확장을 사용하려면 `client-extension.yaml` 파일에 `objectValidationRule` 유형을 추가하세요.

```yaml
type: objectValidationRule
```

배포되면 이러한 클라이언트 확장은 개체 정의에 유효성 검사를 추가할 때 옵션으로 나타납니다. 자세한 내용은 [필드 유효성 검사 추가](../objects/creating-and-managing-objects/validations/adding-field-validations.md) 참조하세요.

![These client extensions appear as options when adding validations to an object definition.](./microservice-client-extensions/images/01.png)

## 워크플로 작업 클라이언트 확장

워크플로 작업 클라이언트 확장은 [Liferay 워크플로](../../process-automation/workflow/introduction-to-workflow.md) 의 작업 이벤트에 바인딩하는 외부 워크플로 작업 핸들러를 정의합니다. 워크플로 작업이 발생할 때 마이크로서비스의 핸들러 코드가 실행됩니다.

워크플로 작업 클라이언트 확장을 지정하려면 `client-extension.yaml` 파일의 `type` 값을 사용하세요.

```yaml
type: workflowAction
```

## 알림 유형 클라이언트 확장

알림 유형 클라이언트 확장은 Liferay의 [알림 이벤트](../../process-automation/notifications.md) 에 바인딩되는 외부 알림 처리기를 정의합니다. 알림 이벤트가 발생하면 마이크로서비스의 핸들러 코드가 실행됩니다.

알림 유형 클라이언트 확장을 지정하려면 `client-extension.yaml` 파일의 `type` 값을 사용하세요.

```yaml
type: notificationType
```

## 관련 주제

* [클라이언트 확장 소개](../client-extensions.md)
* [`client-extension.yaml`에서 클라이언트 확장 구성](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)
