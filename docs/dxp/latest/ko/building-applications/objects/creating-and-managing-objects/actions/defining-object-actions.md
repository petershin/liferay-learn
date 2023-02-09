# 개체 작업 정의

{bdg-secondary}`사용 가능한 Liferay 7.4 U33+/GA33+`

작업은 개체 항목 이벤트에 의해 트리거되는 사용자 지정 작업을 정의합니다. Liferay는 이벤트(추가, 삭제 또는 업데이트)를 수신하고 작업을 실행합니다.

작업을 추가하려면

1. Global Menu( ![Global Menu](../../../../images/icon-applications-menu.png) )를 열고 *Control Panel* 탭으로 이동하여 *Objects*를 클릭합니다.

1. 개체 정의 편집을 시작합니다.

   ```{note}
   Liferay 7.4 U22+ 및 GA22+의 경우 시스템 개체에 작업을 추가할 수 있습니다.
   ```

1. *작업* 탭으로 이동하여 *추가* ( ![Add Button](../../../../images/icon-add.png) )를 클릭합니다.

1. 기본 정보 탭에서 조치에 대해 *이름* 및 *설명* 을 입력하십시오.

   ![기본 정보 탭에 작업 이름과 설명을 입력합니다.](./defining-object-actions/images/01.png)

1. *Action Builder* 탭으로 이동하여 사용자 지정 트리거, 조건 및 작업을 정의합니다.

   ![작업 작성기 탭으로 이동하여 사용자 지정 트리거, 조건 및 작업을 정의합니다.](./defining-object-actions/images/02.png)

1. 작업이 수행되는 시점을 결정하는 트리거 이벤트를 지정합니다.

   | 트리거       | 묘사         |
   |:--------- |:---------- |
   | 추가 이후 시   | 항목이 추가되면   |
   | 삭제 이후 시   | 항목이 삭제된 경우 |
   | 업데이트 이후 시 | 항목이 업데이트되면 |

   ![작업이 수행되는 시기를 결정합니다.](./defining-object-actions/images/03.png)

1. (선택 사항) 작업이 트리거되는 조건을 활성화합니다. 사용 가능한 표현식을 보려면 *코드* 버튼( ![Code](../../../../images/icon-code.png) )을 클릭하십시오.

   Liferay 7.4 U33+ 및 GA33+에서 *완료*을 클릭하면 Liferay가 식 구문의 유효성을 검사합니다. 식이 유효하지 않으면 Liferay에 오류 메시지가 표시됩니다.

   ![식을 사용하여 트리거에 대한 추가 조건을 설정합니다.](./defining-object-actions/images/04.png)

1. 작업에서 수행된 작업 유형을 선택하고 모든 추가 필드를 작성합니다. 자세한 내용은 [작업 유형 이해](./understanding-action-types.md#understanding-action-types) 을 참조하십시오.

1. *저장*을 클릭합니다.

일단 생성되면 구성에 따라 작업이 활성화되고 트리거됩니다.

기본 정보 탭에서 작업을 비활성화할 수 있습니다. *활성* 스사이트를 전환하고 *저장*을 클릭합니다.

![작업을 비활성화하려면 활성 스사이트를 전환합니다.](./defining-object-actions/images/05.png)

## 추가 정보

* [개체 만들기](../creating-objects.md)
* [작업 유형 이해](./understanding-action-types.md)
