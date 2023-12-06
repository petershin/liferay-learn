# 선택 목록 만들기

{bdg-secondary}`라이프레이 7.4 U72+/GA72+`

선택 목록은 문자열 값으로 저장된 이름/키 쌍의 목록입니다. 정의한 후에는 객체 정의가 포함된 목록을 사용하여 단일 또는 다중 선택 필드를 채울 수 있습니다. 더 많은 선택 목록 사용 사례는 [선택목록](../picklists.md) 을 참조하세요.

선택 목록을 만들려면

1. **전역 메뉴**(![전역 메뉴](../../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 다음 **선택 목록** 을 클릭합니다.

1. **추가**(![추가 버튼](../../../images/icon-add.png))를 클릭합니다.

   ![Click Add to create a new picklist.](./creating-picklists/images/01.png)

1. UI에서 목록을 식별할 수 있도록 선택 목록의 이름을 지정합니다. 생성 후 이름을 현지화할 수 있습니다.

1. **저장** 을 클릭하여 빈 선택 목록 정의를 만들고 외부 참조 코드(ERC)를 생성합니다. ERC를 생성한 후 편집할 수 있습니다.

1. 편집을 시작하려면 새 선택 목록을 클릭하세요.

1. 항목 아래에서 **추가**(![Add](../../../images/icon-add.png))를 클릭합니다.

   ![Click Add to add a new item to the picklist.](./creating-picklists/images/02.png)

1. 모달 창에서 항목의 이름과 키를 입력합니다.

   **이름** : 항목의 표시 이름을 결정하며 생성 후 현지화할 수 있습니다.

   **Key** : 백엔드에서 애플리케이션이 이해하는 표준 값을 결정하며 Camel Case를 사용합니다.

   ![Enter a name and key, and then click Save.](./creating-picklists/images/03.png)

1. **저장** 을 클릭하세요. 선택 목록은 새 항목으로 즉시 업데이트되고 해당 항목에 대한 외부 참조 코드(ERC)를 생성합니다.

   목록 항목을 클릭하여 이름을 현지화하거나 ERC를 편집할 수 있지만 키를 변경할 수는 없습니다. 언제든지 항목을 제거할 수 있습니다.

1. 목록에 항목을 추가하려면 위 단계를 반복하세요.

   ![Add multiple items to a picklist.](./creating-picklists/images/04.png)

일단 생성되면 개체 필드를 생성할 때 선택 목록을 선택할 수 있습니다. *선택 목록*(단일 선택) 또는 *다중 선택 선택 목록* 필드 유형을 선택하고 목록을 선택합니다. 자세한 내용은 [개체에 필드 추가](../creating-and-managing-objects/fields/adding-fields-to-objects.md) 및 [선택 목록 필드](../creating-and-managing-objects/fields/picklist-fields.md) 를 참조하세요.

![Users can select the picklist when creating new object fields.](./creating-picklists/images/05.png)

## 관련 주제

* [객체에 필드 추가](../creating-and-managing-objects/fields/adding-fields-to-objects.md)
* [선택 목록 권한 관리](./managing-picklist-permissions.md)
* [선택 목록 API 기본 사항](./picklists-api-basics.md)
