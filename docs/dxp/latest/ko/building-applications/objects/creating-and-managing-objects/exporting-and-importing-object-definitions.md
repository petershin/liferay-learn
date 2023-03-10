# 개체 정의 내보내기 및 가져오기

{bdg-secondary}`사용 가능한 Liferay 7.4 U5+/GA9+`

개체 정의를 `.json` 파일로 가져오고 내보낼 수 있습니다. 이를 통해 Liferay 환경 간에 개체를 쉽게 마이그레이션할 수 있습니다.

```{important}
개체는 관계 내보내기 및 가져오기를 지원하지 않습니다. 다른 모든 개체 요소 및 구성이 지원됩니다(예: 범위, 필드, 레이아웃, 작업).
```

## 정의 내보내기

1. **Global Menu**(![Global Menu](../../../images/icon-applications-menu.png))을 열고 **Control Panel** 탭으로 이동하여 **Objects** 을 클릭합니다.

1. 원하는 객체의 **Actions** 버튼(![Action Button](../../../images/icon-actions.png))을 클릭하고 **JSON으로 내보내기** 를 선택합니다.

   ![원하는 개체에 대한 작업 버튼을 클릭하고 JSON으로 내보내기를 선택합니다.](./exporting-and-importing-object-definitions/images/01.png)

1. 대화 상자 창에서 **저장** 을 클릭하여 개체 정의를 JSON 파일로 다운로드합니다.

내보낸 후에는 개체 정의를 호환되는 Liferay 환경으로 가져올 수 있습니다.

## 정의 가져오기

1. **Global Menu**(![Global Menu](../../../images/icon-applications-menu.png))을 열고 **Control Panel** 탭으로 이동하여 **Objects** 을 클릭합니다.

1. Application Bar에서 **Actions** 버튼(![Actions Button](../../../images/icon-actions.png))을 클릭하고 **Import Object** 를 선택합니다.

   ![애플리케이션 표시줄에서 작업 버튼을 클릭하고 개체 가져오기를 선택합니다.](./exporting-and-importing-object-definitions/images/02.png)

1. 새 개체에 대해 **이름** 을 입력하고 가져오려는 **JSON 파일** 을 선택합니다.

   ```{important}
   개체 이름은 고유해야 하며 PascalCase를 사용해야 합니다.
   ```

   ![이름을 입력하고 원하는 JSON 파일을 선택합니다.](./exporting-and-importing-object-definitions/images/03.png)

1. **가져오기** 을 클릭합니다.

개체 정의는 백그라운드에서 가져오며 몇 분 정도 걸릴 수 있습니다.

## 추가 정보

* [개체 만들기](./creating-objects.md)
* [개체 활성화 및 비활성화](./activating-and-deactivating-objects.md)
* [개체 정의 내보내기 및 가져오기](./exporting-and-importing-object-definitions.md)
