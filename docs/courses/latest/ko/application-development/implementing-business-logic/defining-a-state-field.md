# 상태 필드 정의

Delectable Bonsai는 애플리케이션의 진행 상황을 추적하고 추가 비즈니스 로직을 트리거하기 위한 사용자 정의 상태 필드를 정의하려고 합니다. 여기에서는 이러한 상태를 정의하는 선택 목록을 추가하고, 배포자 응용 프로그램 개체의 상태 필드에 사용하고, 상태 필드의 흐름을 관리합니다.

## 응용 프로그램 상태에 대한 선택 목록 추가

<!--TASK: Use client extensions or use the Export/Import center when ready. -->

1. *전역 메뉴* ( ![Global Menu](../../images/icon-applications-menu.png) )을 열고 *제어판* 탭으로 이동한 다음 *선택 목록*클릭합니다.

1. *추가* ( ![Add Button](../../images/icon-add.png) )을 클릭합니다.

1. 이름에 Application States를 입력하고 *저장*클릭합니다.

1. 선택 목록 편집을 시작합니다.

   ![응용 프로그램 상태 선택 목록을 만들고 편집합니다.](./defining-a-state-field/images/01.png)

1. *추가* ( ![Add Button](../../images/icon-add.png) )을 클릭하여 선택 목록에 다음 항목을 추가합니다.

   | 이름   | 열쇠            |
   |:---- |:------------- |
   | 열려있는 | `open`        |
   | 검토중  | `underReview` |
   | 승인되는 | `approved`    |
   | 부정하는 | `denied`      |
   | 빼는   | `withdrawn`   |
   | 파악에  | `onHold`      |

1. 각 항목을 편집하고 ERC를 다음 값으로 설정합니다.

   | 외부 참조 코드                         |
   |:-------------------------------- |
   | `APPLICATION_STATE_OPEN`         |
   | `APPLICATION_STATE_UNDER_REVIEW` |
   | `APPLICATION_STATE_APPROVED`     |
   | `APPLICATION_STATE_DENIED`       |
   | `APPLICATION_STATE_WITHDRAWN`    |
   | `APPLICATION_STATE_ON_HOLD`      |

   ![선택 목록에 항목을 추가하고 ERC를 업데이트합니다.](./defining-a-state-field/images/02.png)

1. Picklist의 ERC를 `LIST_APPLICATION_STATES`로 변경합니다.

   ![선택 목록의 ERC를 업데이트합니다.](./defining-a-state-field/images/03.png)

1. *저장*클릭하세요.

이제 선택 목록을 사용하여 배포자 응용 프로그램 개체에 상태 필드를 만들 수 있습니다.

## 애플리케이션 상태 필드 추가

1. *전역 메뉴* ( ![Global Menu](../../images/icon-applications-menu.png) )을 열고 *제어판* 탭으로 이동한 다음 *개체*클릭합니다.

1. Distributor Application 개체 편집을 시작하고 *Fields* 탭으로 이동합니다.

1. *Add* (![Add Button](../../images/icon-add.png))을 클릭하고 세부 정보를 입력한 후 *Save*클릭합니다.

   | 분야     | 가치                 |
   |:------ |:------------------ |
   | 라벨     | 애플리케이션 상태          |
   | 필드 이름  | `applicationState` |
   | 유형     | 선택목록               |
   | 선택목록   | 애플리케이션 상태          |
   | 필수적인   | 여실한                |
   | 상태로 표시 | 여실한                |
   | 기정값    | 열려있는               |

   ![Distributor Application 개체에 Application State 필드를 추가합니다.](./defining-a-state-field/images/04.png)

## 상태 흐름 관리

1. Distributor Application 개체를 편집하는 동안 *State Manager* 탭으로 이동합니다.

1. *애플리케이션 상태*클릭합니다.

1. 다음 흐름 값을 설정합니다.

   | 분야   | 가치                  |
   |:---- |:------------------- |
   | 열려있는 | 검토 중, 철회됨           |
   | 검토중  | 승인됨, 거부됨, 철회됨, 보류 중 |
   | 승인되는 | 검토중                 |
   | 부정하는 | 검토중                 |
   | 빼는   | 열려있는                |
   | 파악에  | 공개, 검토 중            |

   ![다음을 설정하세요 ](./defining-a-state-field/images/05.png)

1. *저장*클릭하세요.

애플리케이션 상태 필드를 업데이트할 때 사용자 옵션은 상태 흐름에 따라 결정됩니다.

## 애플리케이션 상태 필드 사용

애플리케이션 상태 사용을 연습하려면 먼저 개체의 레이아웃과 보기에 필드를 추가해야 합니다.

### 사용자 정의 레이아웃에 필드 추가

1. Distributor Application 개체를 편집하는 동안 *레이아웃* 탭으로 이동하여 레이아웃 편집을 시작합니다.

1. 정보 탭에서 레이아웃 이름을 상태 필드가 있는 레이아웃으로 바꿉니다.

   ![레이아웃 이름을 상태 필드가 있는 레이아웃으로 바꿉니다.](./defining-a-state-field/images/06.png)

1. *레이아웃* 탭으로 이동

1. 일반 세부 정보 블록에 대해 *Add Field* 클릭합니다.

1. 애플리케이션 상태 필드를 선택하고 *저장*클릭합니다.

   ![일반 세부 정보 블록에 애플리케이션 상태 필드를 추가합니다.](./defining-a-state-field/images/07.png)

1. 레이아웃에 대해 *저장* 클릭합니다.

### 사용자 정의 보기에 필드 추가

1. *보기* 탭으로 이동하여 보기 편집을 시작합니다.

1. 정보 탭에서 보기 이름을 상태 필드가 있는 보기로 바꿉니다.

   ![보기의 이름을 상태 필드가 있는 보기로 바꿉니다.](./defining-a-state-field/images/08.png)

1. *View Builder* 탭으로 이동합니다.

1. *추가*클릭하고 *애플리케이션 상태* 필드를 선택한 다음 *저장*클릭합니다.

   ![보기에 애플리케이션 상태 필드를 추가합니다.](./defining-a-state-field/images/09.png)

1. 필드를 드래그 앤 드롭하여 재정렬합니다.

   * ID
   * 신청자 이름
   * 비즈니스 이름
   * 날짜 생성
   * 애플리케이션 상태
   * 상태

1. 보기에 대해 *저장* 클릭합니다.

### 필드 사용

1. 배포자 애플리케이션으로 이동하여 기존 애플리케이션 편집을 시작합니다. 상태 필드가 추가되기 전에 항목이 생성되었더라도 기본값으로 설정됩니다.

1. 상태 필드의 값을 업데이트하고 *저장*클릭합니다. 사용 가능한 옵션은 필드의 현재 값에 따라 달라집니다.

   ![사용 가능한 옵션은 상태 흐름에 따라 다릅니다.](./defining-a-state-field/images/10.png)

1. 동일한 애플리케이션 편집을 시작합니다.

1. 상태 필드를 다시 업데이트하세요. 옵션이 다르다는 점에 유의하세요.

   ![상태 필드 옵션이 다릅니다.](./defining-a-state-field/images/11.png)

엄청난! 이제 상태 필드를 추가했으므로 Delectable Bonsai는 사용자가 이를 '승인' 또는 '거부'로 업데이트할 때 검토가 필요한 작업 흐름 프로세스를 추가하려고 합니다.

다음: [승인 워크플로 추가](./adding-an-approval-workflow.md)

## 관련 개념
