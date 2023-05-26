# 선택 목록 사용

{bdg-secondary}`사용 가능한 Liferay 7.4+`

선택 목록은 문자열 값으로 저장된 이름/키 쌍 목록입니다. 일단 정의되면 개체 정의가 있는 목록을 사용하여 단일 또는 다중 선택 필드를 채울 수 있습니다. 더 많은 선택 목록 사용 사례는 [선택 목록](../picklists.md) 참조하십시오.

## 선택 목록 만들기

1. **글로벌 메뉴**(![Global Menu](../../../images/icon-applications-menu.png))을 열고 **제어판** 탭으로 이동하여 **선택 목록** 클릭합니다.

1. **추가**(![Add Button](../../../images/icon-add.png))을 클릭합니다.

   ![추가를 클릭하여 새 선택 목록을 만듭니다.](./using-picklists/images/01.png)

1. UI에서 목록을 식별할 수 있도록 선택 목록의 이름을 지정합니다. 생성 후 이름을 현지화할 수 있습니다.

1. **저장** 클릭하여 빈 선택 목록 정의를 만들고 외부 참조 코드(ERC)를 생성합니다. 생성 후 ERC를 편집할 수 있습니다.

1. 새 선택 목록을 클릭하여 편집을 시작합니다.

1. 항목에서 **추가**(![Add](../../../images/icon-add.png))을 클릭합니다.

   ![선택 목록에 새 항목을 추가하려면 추가를 클릭합니다.](./using-picklists/images/02.png)

1. 모달 창에서 항목의 이름과 키를 입력합니다.

   **이름** : 항목의 표시 이름을 결정하며 생성 후 현지화할 수 있습니다.

   **키** : 백엔드에서 애플리케이션이 이해하는 기준값을 결정하고 카멜케이스를 사용한다.

   ![이름과 키를 입력한 다음 저장을 클릭합니다.](./using-picklists/images/03.png)

1. **저장** 클릭합니다. 선택 목록은 새 항목으로 즉시 업데이트되고 외부 참조 코드(ERC)를 생성합니다.

   목록 항목을 클릭하여 이름을 현지화하거나 ERC를 편집할 수 있지만 키는 변경할 수 없습니다. 언제든지 항목을 제거할 수 있습니다.

1. 목록에 추가 항목을 추가하려면 위의 단계를 반복하십시오.

   ![선택 목록에 여러 항목을 추가합니다.](./using-picklists/images/04.png)

## 개체에 선택 목록 필드 추가

{bdg-secondary}`7.4 U56+/GA56+의 경우`

일단 생성되면 개체 필드를 생성할 때 선택 목록을 선택할 수 있습니다. **선택 목록** 또는 **다중 선택 선택 목록** 필드 유형을 선택하고 목록을 선택합니다. 자세한 내용은 [객체에 필드 추가](../creating-and-managing-objects/fields/adding-fields-to-objects.md) 및 [사용자 정의 상태 추가 및 관리](../creating-and-managing-objects/fields/adding-and-managing-custom-states.md) 참조하십시오.

![사용자는 새 개체 필드를 만들 때 선택 목록을 선택할 수 있습니다.](./using-picklists/images/05.png)

사용자가 개체 레이아웃에서 이 필드에 액세스하면 선택 목록의 항목을 나열하는 드롭다운 메뉴로 나타납니다.

![선택 목록은 개체 레이아웃에서 드롭다운 메뉴로 나타납니다.](./using-picklists/images/06.png)

```{important}
언제든지 목록 항목을 편집하고 제거할 수 있지만 개체 필드에서 목록을 사용하는 경우 목록을 삭제할 수 없습니다.

선택 목록 항목을 업데이트하거나 삭제하면 항목 값을 사용하여 모든 개체 항목이 자동으로 업데이트됩니다.
```

## 개체 API 호출의 선택 목록 필드

{bdg-secondary}`7.4 U56+/GA56+의 경우`

선택 목록 필드를 포함하는 개체에 대해 POST, PATCH 및 PUT API 호출을 수행할 때 선택 목록 및 다중 선택 선택 목록 필드에 대해 각각 다음 요청 페이로드 형식을 사용해야 합니다.

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

* [개체에 필드 추가](../creating-and-managing-objects/fields/adding-fields-to-objects.md)
* [선택 목록 권한 관리](./managing-picklist-permissions.md)
* [선택 목록 API 기본 사항](./picklists-api-basics.md)
