# 작업 유형 이해

작업은 개체 항목 이벤트에 의해 트리거되는 사용자 지정 작업을 정의합니다. Liferay Objects는 네 가지 작업 유형을 제공합니다.

| 작업 유형                                    | 묘사                                                     |
|:---------------------------------------- |:------------------------------------------------------ |
| [Webhook](#webhook-actions)              | URL에 페이로드를 전달합니다.                                      |
| [Groovy 스크립트](#groovy-script-actions)    | 사용자 지정 [Groovy](https://groovy-lang.org/) 스크립트를 실행합니다. |
| [알림](#notification-actions)              | 미리 정의된 템플릿을 사용하여 이메일 알림을 보냅니다.                         |
| [객체 항목 추가](#add-an-object-entry-actions) | 활성 개체에 항목을 만듭니다.                                       |

```{important}
Groovy 스크립트 작업은 Liferay Experience Cloud Self-Managed 및 Liferay DXP Self-Hosted에서만 사용할 수 있습니다.
```

## 웹후크 작업

{bdg-secondary}`사용 가능한 Liferay 7.4+`

**Webhook** 작업은 설정된 URL에 데이터 페이로드를 전달합니다. 대상 URL을 입력해야 합니다. 해당하는 경우 암호를 입력합니다.

![웹후크 URL과 암호를 입력합니다.](./understanding-action-types/images/01.png)

## Groovy 스크립트 작업

{bdg-secondary}`사용 가능한 Liferay 7.4 U27+ 및 GA27+`

**Groovy 스크립트** 작업은 Groovy 스크립트를 실행합니다. 제공된 코드 창에 스크립트를 입력하십시오. Liferay 7.4 U33+ 및 GA33+의 경우 저장을 클릭하면 Liferay는 [GroovyShell 클래스](https://docs.groovy-lang.org/latest/html/api/groovy/lang/GroovyShell.html) 을 사용하여 Groovy 스크립트 구문의 유효성을 검사합니다. 스크립트가 유효하지 않으면 Liferay에 오류 메시지가 표시됩니다.

![Groovy 스크립트를 입력합니다.](./understanding-action-types/images/02.png)

## 알림 작업

{bdg-secondary}`사용 가능한 Liferay 7.4 U32+ 및 GA32+`

**알림** 작업을 사용하여 객체 이벤트에 대한 이메일 알림을 자동화합니다. 귀하의 인스턴스에는 [구성된 메일 서버](../../../../installation-and-upgrades/setting-up-liferay/configuring-mail.md) 및 하나 이상의 [알림 템플릿](../../../../process-automation/notifications/creating-notification-templates.md)이 필요합니다.

각 이메일의 발신자, 수신자 및 콘텐츠를 결정하려면 알림 템플릿이 필요합니다.

![알림 템플릿을 선택합니다.](./understanding-action-types/images/03.png)

## 개체 항목 작업 추가

{bdg-secondary}`사용 가능한 Liferay 7.4 U33+ 및 GA33+`

**개체 항목 추가** 작업은 지정된 개체에 항목을 만듭니다. 활성 개체를 선택해야 합니다. 개체에 필수 필드가 포함된 경우 새 항목에 대해 미리 정의된 값을 설정해야 합니다. 이러한 값을 직접 입력하거나 표현식 빌더를 사용하여 동적으로 값을 설정하십시오. 원하는 경우 필수가 아닌 필드의 값을 설정할 수 있습니다.

![활성 개체를 선택하고 생성된 항목에 대해 미리 정의된 값을 입력합니다.](./understanding-action-types/images/04.png)

## 추가 정보

* [개체 만들기](../creating-objects.md)
* [개체 작업 정의](./defining-object-actions.md)
