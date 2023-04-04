---
uuid: 29b299d7-f4aa-4ce7-b016-a16414b6dc83
---

# 수동 작업 사용

개체 작업에서 독립 실행형 트리거를 사용하면 작업이 수동이 됩니다. 즉, 다음 두 가지 방법 중 하나로 명시적으로 실행해야 합니다.

* 개체 정의의 UI를 통해 사용자가
* 헤드리스 API 호출

이 예에서는 알림 전송을 위한 독립 실행형 작업을 생성합니다.

![독립 실행형 트리거를 사용하여 모든 유형의 개체 작업을 수동으로 실행할 수 있습니다.](./using-manual-actions/images/01.png)

개체 정의에 독립 실행형 작업을 추가하는 방법은 [개체 작업 정의](./defining-object-actions.md) 참조하십시오.

## UI를 통한 트리거 작업

활성 독립 실행형 작업은 개체 항목에 대한 작업 메뉴에 나타납니다. UI를 통해 이러한 작업을 트리거하려면

1. 객체 정의의 애플리케이션 페이지로 이동합니다.

1. 원하는 항목에 대해 *작업* 버튼(![Action Button](../../../../images/icon-actions.png))을 클릭하고 독립 실행형 작업을 선택합니다.

   이 예에서 작업은 미리 알림 보내기입니다.

   ![원하는 항목에 대한 작업 버튼을 클릭하고 독립 실행형 작업을 선택합니다.](./using-manual-actions/images/02.png)

## API를 통한 트리거 작업

Liferay는 게시된 개체 정의에 대한 REST API를 자동으로 생성합니다. 여기에는 활성 독립 실행형 작업을 위한 API가 포함됩니다.

이러한 API를 보려면

1. `[server]:[port]/o/api` (예: `localhost:8080/o/api`)에서 Liferay의 API 탐색기를 엽니다.

1. *REST 애플리케이션* 클릭하고 원하는 오브젝트 정의를 선택하십시오. 사용자 지정 개체는 `c/[pluralobjectlabel]` 이름 지정 패턴(예: `c/티켓`)을 사용합니다.

각 독립 실행형 작업에 대해 Liferay는 두 개의 PUT API를 생성합니다. 하나는 항목의 ID를 사용하고 다른 하나는 항목의 외부 참조 코드(ERC)를 사용합니다.

![Liferay는 두 개의 PUT API를 생성합니다. 하나는 항목의 ID를 사용하고 다른 하나는 항목의 ERC를 사용합니다.](./using-manual-actions/images/03.png)

두 API 중 하나를 호출하면 지정된 항목에 대한 작업이 트리거됩니다.

![API를 호출하면 지정된 항목에 대한 작업이 트리거됩니다.](./using-manual-actions/images/04.png)

## 추가 정보

* [개체 작업 정의](./defining-object-actions.md)
* [작업 유형 이해](./understanding-action-types.md)
* [헤드리스 프레임워크 통합](../../understanding-object-integrations/headless-framework-integration.md)
