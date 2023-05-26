# 작업 유형 이해

{bdg-secondary}`사용 가능한 Liferay 7.4 U60+/GA60+`

작업은 개체 항목 이벤트에 의해 트리거되는 사용자 지정 작업을 정의합니다. Liferay는 다음 작업 유형을 제공합니다.

| 유형                                    | 묘사                                              |
|:------------------------------------- |:----------------------------------------------- |
| [알림](#notification)                   | 미리 정의된 템플릿을 사용하여 이메일 또는 사용자 알림을 보냅니다.           |
| [객체 항목 추가](#add-an-object-entry)      | 활성 개체에 항목을 만듭니다.                                |
| [개체 항목 업데이트](#update-an-object-entry) | 현재 개체 항목의 필드를 업데이트합니다.                          |
| [Webhook](#webhook)                   | URL에 페이로드를 전달합니다.                               |
| [Groovy 스크립트](#groovy-script)         | [Groovy](https://groovy-lang.org/) 스크립트를 실행합니다. |

```{important}
Groovy 스크립트 작업은 Liferay Experience Cloud Self-Managed 및 Liferay DXP Self-Hosted에서만 사용할 수 있습니다.
```

<!--TASK: When Client Extensions documentation is ready, note that you can create custom object actions. -->

## 알림

개체 항목에 대한 사용자 또는 전자 메일 알림을 보내려면 알림 작업을 사용합니다. 사용 사례의 예는 다음과 같습니다.

* 새 주문에 대한 이메일 알림 자동 전송
* 맞춤형 발권 시스템 내에서 티켓 업데이트에 대한 사용자 알림 자동 전송
* 사용자에게 작업 및 이벤트를 상기시키기 위해 수동으로 이메일 알림 보내기

[알림 템플릿](../../../../process-automation/notifications/creating-notification-templates.md) 선택하여 각 메시지의 발신자, 수신자 및 콘텐츠를 결정해야 합니다. 이메일 알림의 경우 인스턴스에는 [구성된 메일 서버](../../../../installation-and-upgrades/setting-up-liferay/configuring-mail.md)도 필요합니다.

![알림 템플릿을 선택합니다.](./understanding-action-types/images/01.png)

<!--TASK: include this content when client extensions documentation is updated, "If the out-of-the-box notification types don't meet your needs, you can use client extensions to create your own. See \[]() for more information or [\]() for a tutorial.." -->

## 객체 항목 추가

지정된 개체에 항목을 만듭니다. 사용 사례의 예는 다음과 같습니다.

* 주문 결제 시 사용자 지정 배송 개체에 자동으로 항목 추가
* 새 계정에 대한 기본 사용자 자동 추가
* 사용자 지정 발권 시스템 내에서 현재 티켓에 수동으로 어린이 티켓 추가

활성 개체를 선택해야 합니다. 그런 다음 항목의 필드에 대해 미리 정의된 값을 설정할 수 있습니다. 이러한 값을 직접 입력하거나 **코드**( ![Code](../../../../images/icon-code.png) )을 클릭하여 값을 동적으로 설정하는 표현식을 사용합니다. 개체에 필수 필드가 포함된 경우 사전 정의된 값을 설정해야 합니다.

![활성 개체를 선택하고 생성된 항목에 대해 미리 정의된 값을 입력합니다.](./understanding-action-types/images/02.png)

## 개체 항목 업데이트

현재 개체 항목에서 하나 이상의 필드를 업데이트합니다. 사용 사례의 예는 다음과 같습니다.

* 사용자가 첨부 파일을 다운로드한 후 항목의 부울 필드를 `true` 로 자동 업데이트
* 버튼을 클릭할 때 티켓 담당자를 현재 사용자로 수동 업데이트하기
* 사용자가 항목을 즐겨찾기한 후 항목의 부울 필드를 `true` 로 자동 업데이트

현재 항목에서 업데이트할 필드를 선택하고 새 값을 입력해야 합니다. 이러한 값을 직접 입력하거나 **코드**( ![Code](../../../../images/icon-code.png) )을 클릭하여 값을 동적으로 설정하는 표현식을 사용할 수 있습니다.

![편집하려는 현재 개체 항목에서 필드를 선택하고 기본값을 입력합니다.](./understanding-action-types/images/03.png)

## Webhook

Webhook 작업은 설정된 URL에 데이터 페이로드를 전달합니다. 대상 URL을 입력해야 합니다. 해당하는 경우 암호를 입력합니다.

![웹후크 URL과 암호를 입력합니다.](./understanding-action-types/images/04.png)

<!--TASK: When Client Extensions documentation is ready, recommend using client extensions instead, since it can include OAuth. -->

## Groovy 스크립트

Groovy 스크립트 작업은 Groovy 스크립트를 실행합니다. 제공된 코드 창에 스크립트를 입력합니다. Liferay 7.4 U33+/GA33+의 경우 저장을 클릭하면 Liferay는 [GroovyShell 클래스](https://docs.groovy-lang.org/latest/html/api/groovy/lang/GroovyShell.html) 사용하여 Groovy 스크립트 구문을 검증합니다. 스크립트가 잘못된 경우 Liferay는 일반 오류 메시지를 표시합니다.

![Groovy 스크립트를 입력합니다.](./understanding-action-types/images/05.png)

<!--TASK: When Client Extensions documentation is ready, recommend custom object actions instead of groovy scripts due to limitations. -->

## 관련 주제

* [개체 만들기](../creating-objects.md)
* [개체 작업 정의](./defining-object-actions.md)
