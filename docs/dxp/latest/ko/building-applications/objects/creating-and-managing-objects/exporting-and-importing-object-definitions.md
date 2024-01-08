# 개체 정의 내보내기 및 가져오기

{bdg-secondary}`liferay 7.4 U68+/GA68+`

객체 정의를 '.json' 파일로 내보내고 가져올 수 있습니다. 이러한 파일에는 정의의 전체 스키마(예: 구성, 필드, 작업 및 관계)가 포함됩니다.

관계가 포함된 정의를 내보낼 때 JSON 파일에는 현재 개체에 정의된 모든 관계는 물론 다른 개체에 정의된 다대다 관계도 포함됩니다. 그러나 파일에는 다른 개체에 정의된 일대다 관계가 포함되지 않습니다.

가져온 정의가 존재하지 않는 선택 목록이나 개체를 참조하는 경우 Liferay는 JSON 파일에 제공된 외부 참조 코드를 사용하여 자동으로 생성합니다.

<!--TASK: Uncomment when batch feature and documentation is ready...
```{tip}
You can use the batch client extension to help migrate object definitions between Liferay environments. See [Batch Client Extensions](../../client-extensions/batch-client-extensions.md) for more information.
```-->

## 정의 내보내기

1. **전역 메뉴**(![전역 메뉴](../../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 다음 **개체** 를 클릭합니다.

1. 원하는 개체에 대해 **작업** 버튼(![작업 버튼](../../../images/icon-actions.png))을 클릭하고 **JSON으로 내보내기** 를 선택합니다.

   ![Click the Actions button for the desired object and select Export as JSON.](./exporting-and-importing-object-definitions/images/01.png)

1. 개체 정의를 JSON 파일로 다운로드하려면 대화 상자 창에서 **저장** 을 클릭하세요.

내보낸 후에는 개체 정의를 호환되는 Liferay 환경으로 가져올 수 있습니다.

## 정의 가져오기

1. **전역 메뉴**(![전역 메뉴](../../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 다음 **개체** 를 클릭합니다.

1. 응용 프로그램 표시줄에서 **작업** 버튼(![작업 버튼](../../../images/icon-actions.png))을 클릭하고 **객체 가져오기** 를 선택합니다.

   ![Click the Actions button in the Application Bar and select Import Object.](./exporting-and-importing-object-definitions/images/02.png)

1. 개체의 이름을 입력합니다. 가져온 후에 이 값을 편집할 수 있습니다.

   ```{important}
   객체 이름은 고유해야 하며 PascalCase를 사용해야 합니다.
   ```

1. 가져올 JSON 파일을 선택하세요.

   선택하면 모달 창에 정의의 외부 참조 코드(ERC)가 표시됩니다. 가져온 후 ERC를 편집할 수 있습니다.

   ![Enter a name and select the desired JSON file.](./exporting-and-importing-object-definitions/images/03.png)

1. **가져오기** 를 클릭하세요.

개체 정의는 백그라운드에서 가져오기를 시작하며 몇 분 정도 걸릴 수 있습니다.

## 관련 주제

* [객체 생성](./creating-objects.md) 
* [개체 활성화 및 비활성화](./activating-and-deactivating-objects.md) 
* [데이터 마이그레이션 센터](../../../headless-delivery/consuming-apis/data-migration-center.md) 
