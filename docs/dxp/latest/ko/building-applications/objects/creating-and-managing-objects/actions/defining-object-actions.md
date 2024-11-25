# 개체 작업 정의

{bdg-secondary}`라이프레이 7.4 U60+/GA60+`

개체 작업은 개체 항목 이벤트에 대해 수동 또는 자동으로 실행할 수 있는 작업을 정의합니다.

작업을 추가하려면

1. **전역 메뉴**( ![전역 메뉴](../../../../images/icon-applications-menu.png) )를 열고 **제어판** 탭으로 이동한 후 **개체를 클릭합니다.** .

1. 객체 정의 편집을 시작합니다.

   ```{note}
   Liferay 7.4 U22+/GA22+의 경우 시스템 개체에 작업을 추가할 수 있습니다.
   ```

1. **작업** 탭으로 이동하여 **추가**( ![버튼 추가](../../../../images/icon-add.png) )를 클릭합니다.

1. 기본 정보 탭에서 작업에 대한 **이름** 과 **설명** 을 입력합니다.

   ![Enter an action name and description in the Basic Info tab.](./defining-object-actions/images/01.png)

1. **Action Builder** 탭으로 이동하여 사용자 정의 트리거, 조건 및 작업을 정의합니다.

   ![Go to the Action Builder tab to define a custom trigger, conditions, and action.](./defining-object-actions/images/02.png)

1. 작업이 수행되는 시기를 결정하려면 트리거 이벤트를 지정하세요.

   | 트리거         | 묘사                 |
   | :---------- | :----------------- |
   | 추가 이후 시     | 항목이 추가되면           |
   | 첨부다운로드 후 켜기 | 응모첨부파일을 다운로드 받은 경우 |
   | 삭제 이후 시     | 항목이 삭제된 경우         |
   | 업데이트 이후 시   | 항목이 업데이트되는 경우      |
   | 독립형         | 수동으로 트리거됨          |

   독립 실행형을 제외한 모든 트리거는 자동입니다. 독립 실행형 트리거는 모든 유형의 작업을 수동으로 실행하기 위한 것입니다. 자세한 내용은 [수동 작업 사용](./using-manual-actions.md)을 참조하세요.

   ![Determine when the action is performed.](./defining-object-actions/images/03.png)

1. (선택 사항) 자동 트리거 조건을 활성화합니다. **코드**( ![Code](../../../../images/icon-code.png) )를 클릭하면 사용 가능한 표현식을 볼 수 있습니다.

   Liferay 7.4 U33+/GA33+에서 Liferay는 **완료** 를 클릭하면 조건 구문의 유효성을 검사합니다. 표현식이 유효하지 않으면 Liferay는 오류 메시지를 표시합니다. 사용 가능한 필드, 연산자 및 함수에 대한 자세한 내용은 [Expression Builder 유효성 검사 참조](../validations/expression-builder-validations-reference.md)를 참조하세요.

   <!--TASK: See [Using Action Conditions]() for more information. -->

   ![Use expressions to set additional conditions for the trigger.](./defining-object-actions/images/04.png)

1. 수행할 작업 유형을 선택하고 모든 추가 필드를 작성합니다.

   | 유형          | 묘사                                                     |
   | :---------- | :----------------------------------------------------- |
   | 알림          | 사전 정의된 템플릿을 사용하여 이메일 또는 사용자 알림을 보냅니다.                  |
   | 객체 항목 추가    | 활성 개체에 항목을 만듭니다.                                       |
   | 객체 항목 업데이트  | 현재 개체 항목의 필드를 업데이트합니다.                                 |
   | Webhook     | 페이로드를 URL로 전달합니다.                                      |
   | Groovy 스크립트 | 사용자 정의 [Groovy](https://groovy-lang.org/) 스크립트를 실행합니다. |

   ```{important}
   그루비 스크립트 작업은 Liferay Experience Cloud 자체 관리형 및 Liferay DXP 자체 호스팅형에서만 사용할 수 있습니다.
   ```

   자세한 내용은 [액션 유형 이해](./understanding-action-types.md#understanding-action-types) 를 참조하세요.

1. **저장** 을 클릭하세요.

생성되면 구성에 따라 작업이 활성화되고 트리거됩니다.

기본 정보 탭에서 작업을 비활성화할 수 있습니다. **활성** 스사이트를 전환하고 **저장** 을 클릭합니다.

![Toggle the Active switch to deactivate the action.](./defining-object-actions/images/05.png)

## 관련 주제

* [오브젝트 생성](../creating-objects.md)
* [액션 유형 이해](./understanding-action-types.md)
