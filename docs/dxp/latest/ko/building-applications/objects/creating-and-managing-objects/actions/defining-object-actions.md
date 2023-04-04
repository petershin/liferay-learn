---
uuid: 196c7b9c-e63b-4072-a33f-71cb75361fc2
---

# 개체 작업 정의

{bdg-secondary}`사용 가능한 Liferay 7.4 U60+/GA60+`

개체 작업은 개체 항목 이벤트에 대해 수동 또는 자동으로 실행할 수 있는 작업을 정의합니다.

작업을 추가하려면

1. *Global Menu* ( ![Global Menu](../../../../images/icon-applications-menu.png) )을 열고 *Control Panel* 탭으로 이동하여 *Objects*클릭합니다.

1. 개체 정의 편집을 시작합니다.

   ```{note}
   Liferay 7.4 U22+/GA22+의 경우 시스템 개체에 작업을 추가할 수 있습니다.
   ```

1. *작업* 탭으로 이동하여 *추가* ( ![Add Button](../../../../images/icon-add.png) )를 클릭합니다.

1. 기본 정보 탭에서 조치에 대해 *이름* 및 *설명* 입력하십시오.

   ![기본 정보 탭에 작업 이름과 설명을 입력합니다.](./defining-object-actions/images/01.png)

1. *Action Builder* 탭으로 이동하여 사용자 지정 트리거, 조건 및 작업을 정의합니다.

   ![작업 작성기 탭으로 이동하여 사용자 지정 트리거, 조건 및 작업을 정의합니다.](./defining-object-actions/images/02.png)

1. 작업이 수행되는 시기를 결정하는 트리거 이벤트를 지정합니다.

   | 트리거             | 묘사              |
   |:--------------- |:--------------- |
   | 추가 이후 시         | 항목이 추가되면        |
   | 첨부 파일 다운로드 후 켜기 | 출품작 첨부파일 다운로드 시 |
   | 삭제 이후 시         | 항목이 삭제된 경우      |
   | 업데이트 이후 시       | 항목이 업데이트되면      |
   | 독립형             | 수동으로 트리거됨       |

   독립 실행형 이외의 모든 트리거는 자동입니다. 독립 실행형 트리거는 모든 유형의 작업을 수동으로 실행하기 위한 것입니다. 자세한 내용은 [수동 작업 사용](./using-manual-actions.md) 참조하십시오.

   ![작업이 수행되는 시기를 결정합니다.](./defining-object-actions/images/03.png)

1. (선택 사항) 자동 트리거 조건을 활성화합니다. 사용 가능한 표현식을 보려면 *코드* ( ![Code](../../../../images/icon-code.png) )을 클릭하십시오.

   Liferay 7.4 U33+/GA33+에서 Liferay는 *완료*클릭할 때 조건 구문의 유효성을 검사합니다. 식이 유효하지 않으면 Liferay에 오류 메시지가 표시됩니다.

   <!--TASK: See \[Using Action Conditions\]() for more information. -->

   ![식을 사용하여 트리거에 대한 추가 조건을 설정합니다.](./defining-object-actions/images/04.png)

1. 수행할 조치 유형을 선택하고 모든 추가 필드를 작성하십시오.

   | 유형          | 묘사                                                     |
   |:----------- |:------------------------------------------------------ |
   | 알림          | 미리 정의된 템플릿을 사용하여 이메일 또는 사용자 알림을 보냅니다.                  |
   | 객체 항목 추가    | 활성 개체에 항목을 만듭니다.                                       |
   | 개체 항목 업데이트  | 현재 개체 항목의 필드를 업데이트합니다.                                 |
   | Webhook     | URL에 페이로드를 전달합니다.                                      |
   | Groovy 스크립트 | 사용자 지정 [Groovy](https://groovy-lang.org/) 스크립트를 실행합니다. |

   ```{important}
   Groovy 스크립트 작업은 Liferay Experience Cloud Self-Managed 및 Liferay DXP Self-Hosted에서만 사용할 수 있습니다.
   ```

   자세한 내용은 [작업 유형 이해](./understanding-action-types.md#understanding-action-types) 참조하십시오.

1. *저장*클릭합니다.

일단 생성되면 구성에 따라 작업이 활성화되고 트리거됩니다.

기본 정보 탭에서 작업을 비활성화할 수 있습니다. *활성* 스위치를 전환하고 *저장*클릭합니다.

![작업을 비활성화하려면 활성 스위치를 전환합니다.](./defining-object-actions/images/05.png)

## 추가 정보

* [개체 만들기](../creating-objects.md)
* [작업 유형 이해](./understanding-action-types.md)
