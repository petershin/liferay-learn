# 작업 유형 이해

{bdg-secondary}`liferay 7.4 U60+/GA60+`

작업은 개체 항목 이벤트에 의해 트리거되는 사용자 정의 작업을 정의합니다. Liferay는 다음과 같은 작업 유형을 제공합니다.

| 유형                                               | 묘사                                                         |
| :----------------------------------------------- | :--------------------------------------------------------- |
| [알림](#notification)                   | 사전 정의된 템플릿을 사용하여 이메일 또는 사용자 알림을 보냅니다.                      |
| [개체 항목 추가](#add-an-object-entry)      | 활성 개체에 항목을 만듭니다.                                           |
| [개체 항목 업데이트](#update-an-object-entry) | 현재 개체 항목의 필드를 업데이트합니다.                                     |
| [웹훅](#webhook)                        | 페이로드를 URL로 전달합니다.                                          |
| [그루비 스크립트](#groovy-script)            | [Groovy](https://groovy-lang.org/) 스크립트를 실행합니다. |

```{important}
Groovy 스크립트 작업은 Liferay Experience Cloud 자체 관리형 및 Liferay DXP 자체 호스팅에만 사용할 수 있습니다.
```

<!--TASK: When Client Extensions documentation is ready, note that you can create custom object actions. -->

## 알림

객체 항목에 대한 사용자 또는 이메일 알림을 보내려면 알림 작업을 사용합니다. 사용 사례의 예는 다음과 같습니다.

* 새 주문에 대한 이메일 알림을 자동으로 보내기
* 맞춤형 티켓팅 시스템 내에서 티켓 업데이트에 대한 사용자 알림을 자동으로 보냅니다.
* 사용자에게 작업 및 이벤트를 상기시키기 위해 이메일 알림을 수동으로 보내기

각 메시지의 보낸 사람, 받는 사람 및 내용을 결정하려면 [알림 템플릿](../../../../process-automation/notifications/creating-notification-templates.md) 을 선택해야 합니다. 이메일 알림의 경우 인스턴스 [구성된 메일 서버](../../../../installation-and-upgrades/setting-up-liferay/configuring-mail.md) 도 필요합니다.

![Select a notification template.](./understanding-action-types/images/01.png)

기본 알림 유형이 요구 사항을 충족하지 않는 경우 클라이언트 확장을 사용하여 사용자 정의 알림 유형을 만들 수 있습니다. 자세한 내용은 [마이크로서비스 클라이언트 확장](../../../client-extensions/microservice-client-extensions.md) 참조하세요.

## 객체 항목 추가

지정된 개체에 항목을 만듭니다. 사용 사례의 예는 다음과 같습니다.

* 주문이 결제되면 사용자 정의 배송 개체에 항목을 자동으로 추가합니다.
* 새 계정에 대한 기본 사용자 자동 추가
* 맞춤형 발권 시스템 내에서 현재 항공권에 어린이 항공권을 수동으로 추가

활성 개체를 선택해야 합니다. 그런 다음 항목 필드에 대해 사전 정의된 값을 설정할 수 있습니다. 이러한 값을 직접 입력하거나 **코드**( ![Code](../../../../images/icon-code.png) )를 클릭하여 값을 동적으로 설정하는 표현식을 사용합니다. 개체에 필수 필드가 포함된 경우 사전 정의된 값을 설정해야 합니다.

![Select an active object and enter predefined values for the created entries.](./understanding-action-types/images/02.png)

## 객체 항목 업데이트

현재 개체 항목에서 하나 이상의 필드를 업데이트합니다. 사용 사례의 예는 다음과 같습니다.

* 사용자가 첨부 파일을 다운로드한 후 항목의 부울 필드를 'true'로 자동 업데이트합니다.
* 버튼을 클릭하면 티켓 담당자를 현재 사용자로 수동 업데이트
* 사용자가 항목을 즐겨찾기에 추가하면 해당 항목의 부울 필드를 'true'로 자동 업데이트합니다.

현재 항목에서 업데이트할 필드를 선택하고 새 값을 입력해야 합니다. 이러한 값을 직접 입력하거나 **코드**( ![Code](../../../../images/icon-code.png) )를 클릭하여 값을 동적으로 설정하는 표현식을 사용할 수 있습니다.

![Select the fields from the current object entry that you want to edit and enter default values.](./understanding-action-types/images/03.png)

## Webhook

웹훅 작업은 데이터 페이로드를 설정된 URL로 전달합니다. 대상 URL을 입력해야 합니다. 해당하는 경우 비밀을 입력하세요.

![Enter a webhook URL and secret.](./understanding-action-types/images/04.png)

<!--TASK: When Client Extensions documentation is ready, recommend using client extensions instead, since it can include OAuth. -->

## Groovy 스크립트

Groovy 스크립트 작업은 Groovy 스크립트를 실행합니다. 제공된 코드 창에 스크립트를 입력하세요. Liferay 7.4 U33+/GA33+의 경우 Liferay는 저장을 클릭할 때 [GroovyShell 클래스](https://docs.groovy-lang.org/latest/html/api/groovy/lang/GroovyShell.html) 사용하여 Groovy 스크립트 구문의 유효성을 검사합니다. 스크립트가 유효하지 않으면 Liferay는 일반 오류 메시지를 표시합니다.

![Enter your Groovy script.](./understanding-action-types/images/05.png)

<!--TASK: When Client Extensions documentation is ready, recommend custom object actions instead of groovy scripts due to limitations. -->

## 관련 주제

* [객체 생성](../creating-objects.md)
* [개체 작업 정의](./defining-object-actions.md)
