# 개체 정의 내보내기 및 가져오기

{bdg-secondary}`사용 가능한 Liferay 7.4 U68+/GA68+`

개체 정의를 `.json` 파일로 내보내고 가져올 수 있습니다. 이러한 파일에는 정의의 전체 스키마(예: 구성, 필드, 작업 및 관계)가 포함됩니다.

관계가 있는 정의를 내보낼 때 JSON 파일에는 현재 개체에 정의된 모든 관계와 다른 개체에 정의된 다대다 관계가 포함됩니다. 그러나 파일에는 다른 개체에 정의된 일대다 관계가 포함되어 있지 않습니다.

가져온 정의가 선택 목록 또는 존재하지 않는 개체를 참조하는 경우 Liferay는 JSON 파일에 제공된 외부 참조 코드를 사용하여 이를 자동으로 생성합니다.

<!--TASK: Uncomment when batch feature and documentation is ready...
```{tip}
You can use the batch client extension to help migrate object definitions between Liferay environments. See [Batch Client Extensions](../../client-extensions/batch-client-extensions.md) for more information.
```
-->

## 정의 내보내기

1. **Global Menu**(![Global Menu](../../../images/icon-applications-menu.png))을 열고 **Control Panel** 탭으로 이동하여 **Objects** 클릭합니다.

1. 원하는 객체의 **Actions** 버튼(![Action Button](../../../images/icon-actions.png))을 클릭하고 **JSON으로 내보내기** 를 선택합니다.

   ![원하는 개체에 대한 작업 버튼을 클릭하고 JSON으로 내보내기를 선택합니다.](./exporting-and-importing-object-definitions/images/01.png)

1. 대화창에서 **저장** 을 클릭하여 개체 정의를 JSON 파일로 다운로드합니다.

내보낸 후에는 개체 정의를 호환되는 Liferay 환경으로 가져올 수 있습니다.

## 정의 가져오기

1. **Global Menu**(![Global Menu](../../../images/icon-applications-menu.png))을 열고 **Control Panel** 탭으로 이동하여 **Objects** 클릭합니다.

1. Application Bar에서 **Actions** 버튼(![Actions Button](../../../images/icon-actions.png))을 클릭하고 **Import Object** 선택합니다.

   ![애플리케이션 표시줄에서 작업 버튼을 클릭하고 개체 가져오기를 선택합니다.](./exporting-and-importing-object-definitions/images/02.png)

1. 개체의 이름을 입력합니다. 가져온 후에 이 값을 편집할 수 있습니다.

   ```{important}
   개체 이름은 고유해야 하며 PascalCase를 사용해야 합니다.
   ```

1. 가져올 JSON 파일을 선택합니다.

   선택하면 모달 창에 정의의 외부 참조 코드(ERC)가 표시됩니다. 가져온 후에 ERC를 편집할 수 있습니다.

   ![이름을 입력하고 원하는 JSON 파일을 선택합니다.](./exporting-and-importing-object-definitions/images/03.png)

1. **가져오기** 클릭합니다.

객체 정의는 백그라운드에서 가져오기를 시작하며 몇 분 정도 걸릴 수 있습니다.

## 관련 주제

* [개체 만들기](./creating-objects.md)
* [개체 활성화 및 비활성화](./activating-and-deactivating-objects.md)
* [개체 정의 내보내기 및 가져오기](./exporting-and-importing-object-definitions.md)
