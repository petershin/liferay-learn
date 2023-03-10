---
uuid: 648d34f3-b6f8-4569-93a2-92ce758dc3b4
---

# 선택 목록 사용

{bdg-secondary}`사용 가능한 Liferay 7.4+`

선택 목록은 Liferay 포털에서 이해되는 표준 값 목록을 생성하기 위한 응용 프로그램입니다. 선택 목록을 만드는 과정에는 초기 목록을 만들고 여기에 항목을 추가하는 과정이 포함됩니다. 이러한 값이 정의되면 지원되는 응용 프로그램에서 사용할 수 있습니다.

## 선택 목록 만들기

선택 목록을 만들려면 다음 단계를 따르십시오.

1. **글로벌 메뉴**(![Global Menu](../../../images/icon-applications-menu.png))을 열고 **제어판** 탭으로 이동하여 **선택 목록** 클릭합니다.

1. **추가** 버튼(![Add Button](../../../images/icon-add.png))을 클릭합니다.

   ![추가 버튼을 클릭하여 새 선택 목록을 만듭니다.](./using-picklists/images/01.png)

1. 선택 목록에 **이름** 입력하고 **저장** 클릭합니다. 이 값은 Liferay UI에서 목록을 식별하고 생성 후 현지화할 수 있습니다.

1. 새 선택 목록을 클릭하여 편집합니다.

1. 항목에서 **추가** 버튼(![Add Button](../../../images/icon-add.png))을 클릭합니다.

   ![선택 목록에 새 항목을 추가하려면 추가 버튼을 클릭합니다.](./using-picklists/images/02.png)

1. 모달 창에서 항목에 대해 **이름** 및 **키** 입력합니다.

   **이름** : 항목의 표시 이름을 결정하며 생성 후 현지화할 수 있습니다.

   **키** : 백엔드에서 애플리케이션이 이해하는 기준값을 결정하고 카멜케이스를 사용한다.

   ```{note}
   일단 생성된 항목의 키는 변경할 수 없지만 언제든지 이름을 수정하거나 삭제할 수 있습니다.
   ```

   ![이름과 키를 입력한 다음 저장을 클릭합니다.](./using-picklists/images/03.png)

1. **저장** 클릭합니다. 이렇게 하면 선택 목록이 새 항목으로 즉시 업데이트됩니다.

1. 목록에 추가 항목을 추가하려면 위의 단계를 반복하십시오.

   ![선택 목록에 여러 항목을 추가합니다.](./using-picklists/images/04.png)

## 개체에 선택 목록 필드 추가

{bdg-secondary}`7.4 U56+/GA56+의 경우`

목록을 만든 후 개체 필드를 만들 때 선택할 수 있습니다. **선택 목록** 또는 **다중 선택 선택 목록** 필드 유형을 선택하고 목록을 선택합니다. 자세한 내용은 [개체에 필드 추가](../creating-and-managing-objects/fields/adding-fields-to-objects.md) 참조하십시오.

![사용자는 새 개체 필드를 만들 때 선택 목록을 선택할 수 있습니다.](./using-picklists/images/05.png)

사용자가 개체 레이아웃에서 이 필드에 액세스하면 선택 목록 항목을 나열하는 드롭다운 메뉴로 나타납니다.

![선택 목록은 개체 레이아웃에서 드롭다운 메뉴로 나타납니다.](./using-picklists/images/06.png)

```{important}
목록 항목은 언제든지 편집 및 제거할 수 있지만 개체 필드에서 목록을 사용하는 경우 목록을 삭제할 수 없습니다.

선택 목록 항목을 업데이트하거나 삭제하면 항목 값을 사용하여 모든 개체 항목이 자동으로 업데이트됩니다.
```

## 선택 목록 API

Liferay는 선택 목록 생성 및 관리를 위한 헤드리스 API를 제공합니다. `headless-admin-list-type`아래의 `localhost:8080/o/api` 에서 Liferay의 API 탐색기에서 사용 가능한 Picklist API를 볼 수 있습니다.

![headless-admin-list-type에서 Picklist API에 액세스](./using-picklists/images/07.png)

Picklist API를 사용하면 Picklist 정의(`ListTypeDefinition`) 및 Picklist 항목(`ListTypeEntry`) 모두에 대해 CRUD 작업을 수행할 수 있습니다. 자세한 내용은 [Picklist API 기본 사항](./picklists-api-basics.md) 참조하십시오.

## 개체 API 호출의 선택 목록 필드

{bdg-secondary}`7.4 U56+/GA56+의 경우`

선택 목록 필드를 포함하는 개체에 대해 POST, PATCH 및 PUT API 호출을 수행할 때 선택 목록 및 다중 선택 선택 목록에 대해 각각 다음 요청 페이로드 형식을 사용해야 합니다.

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

## 추가 정보

* [개체에 필드 추가](../creating-and-managing-objects/fields/adding-fields-to-objects.md)
* [선택 목록 권한 관리](./managing-picklist-permissions.md)
* [선택 목록 API 기본 사항](./picklists-api-basics.md)
