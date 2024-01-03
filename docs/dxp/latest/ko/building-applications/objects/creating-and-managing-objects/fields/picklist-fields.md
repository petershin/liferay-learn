# 선택 목록 필드

{bdg-secondary}`liferay 7.4 U72+/GA72+`

선택 목록은 개체 정의에서 단일 선택 또는 다중 선택 필드로 사용할 수 있는 텍스트 값 목록을 정의합니다. 기본적으로 단일 선택 필드는 드롭다운 메뉴로 표시되고 다중 선택 필드는 확인란으로 표시됩니다.

정적 또는 동적 기본값을 사용하도록 단일 선택 필드를 구성할 수 있습니다. 또한 단일 선택 필드를 사용하여 개체 항목에 대한 사용자 정의 상태를 정의하고 [유효성 검사](../validations/adding-field-validations.md) , [작업](../actions/defining-object-actions.md) 및 [워크플로 프로세스](../../enabling-workflows-for-objects.md) 개체 정의와 통합하여 복잡한 비즈니스 논리를 구현할 수 있습니다.

## 기본값 설정

1. 원하는 선택 목록 필드 편집을 시작합니다.

1. _고급_ 탭으로 이동하여 _기본값 사용_을 전환하세요.

   ![Toggle Use Default Value and select either Input as Value or Expression Builder.](./picklist-fields/images/01.png)

1. 기본값 설정 방법을 결정합니다.

   _값으로 입력_: 선택 목록에서 값을 선택합니다.

   _표현식 작성기_: 값을 동적으로 설정하는 표현식을 만듭니다.

1. _저장_을 클릭하세요.

이제 사용자가 항목을 생성하면 선택 목록 필드의 기본값이 설정된 값으로 지정됩니다.

```{important}
개체 필드에서 사용되는 목록은 삭제할 수 없지만 언제든지 목록 항목을 편집하고 제거할 수 있습니다.

선택 목록 항목을 업데이트하거나 삭제하면 항목 값을 사용하여 모든 개체 항목이 자동으로 업데이트됩니다.
```
## API와 함께 선택 목록 필드 사용

선택 목록 필드가 포함된 개체에 대해 POST, PATCH 및 PUT API 호출을 수행할 때 각각 선택 목록 및 다중 선택 선택 목록 필드에 대해 다음 요청 페이로드 형식을 사용해야 합니다.

### 선택 목록 필드 유형

```json
{ 
      "picklistExample": {
        "key": "firstOption",
        "name": "First Option"
      }
}
```

### 다중 선택 선택 목록 필드 유형

```json
{ 
      "picklistExample": [
        {
          "key": "firstOption",
          "name": "First Option"
        },
        {
          "key": "secondOption",
          "name": "Second Option"
        }
      ]
}
```

## 관련 주제

* [선택 목록](../../picklists.md) 
* [사용자 정의 상태 추가 및 관리](./adding-and-managing-custom-states.md) 
