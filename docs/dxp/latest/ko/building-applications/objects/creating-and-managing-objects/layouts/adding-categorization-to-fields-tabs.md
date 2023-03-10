---
uuid: 4d712f4d-f49f-4132-bf0d-0bc60a5d279d
---

# 필드 탭에 분류 추가

{bdg-secondary}`사용 가능한 Liferay 7.4 U31+ 및 GA31+`

최종 사용자가 개체 항목에 태그 및 범주를 적용할 수 있도록 [필드 탭](./designing-object-layouts.md#fields-tabs) 에 범주화 블록을 추가할 수 있습니다. 다음과 같이하세요:

1. **Global Menu**(![Global Menu](../../../../images/icon-applications-menu.png))을 열고 **Control Panel** 탭으로 이동하여 **Objects** 클릭합니다.

1. 원하는 개체 정의 편집을 시작합니다.

   ```{note}
   System Object는 사용자 정의 레이아웃을 지원하지 않습니다. 자세한 내용은 [시스템 개체 확장](../extending-system-objects.md)을 참조하십시오.
   ```

1. 세부 정보 탭에서 분류를 활성화하고 **저장** 클릭합니다.

   ![분류를 활성화합니다.](./adding-categorization-to-fields-tabs/images/01.png)

1. **레이아웃** 탭을 클릭하고 원하는 레이아웃을 선택합니다.

1. **Layout** 탭으로 이동하여 원하는 [Fields 탭](./designing-object-layouts.md#fields-tabs) 에 대해 **Actions**(![Actions Button](../../../../images/icon-actions.png))를 클릭하고 **Add Categorization** 선택합니다.

   ![작업 버튼을 클릭하고 분류 추가를 선택합니다.](./adding-categorization-to-fields-tabs/images/02.png)

   이렇게 하면 분류 도구에 액세스할 수 있도록 탭에 새 블록이 추가됩니다.

   ```{important}
   분류 블록은 레이아웃당 하나의 탭에만 추가할 수 있습니다.
   ```

1. 블록이 **축소 가능** 인지 확인합니다.

   ![블록이 축소 가능한지 확인합니다.](./adding-categorization-to-fields-tabs/images/03.png)

1. **저장** 클릭합니다.

이제 개체의 항목을 생성하거나 편집할 때 사용자는 태그 및 범주에 액세스하고 적용할 수 있습니다.

![개체의 항목에 태그 및 범주에 액세스하고 적용합니다.](./adding-categorization-to-fields-tabs/images/04.png)

```{note}
가시성 및 권한은 분류 블록이 표시되는 방식에 영향을 줄 수 있습니다.
```

## 추가 정보

* [개체 만들기](../creating-objects.md)
* [개체 레이아웃 디자인](./designing-object-layouts.md)
