# 경험 생성 및 관리

{bdg-secondary}`사용 가능한 Liferay 7.4+, 7.3 FP1+ 및 7.2 FP11+`

**경험** 을 사용하여 다양한 사용자 그룹에 맞게 콘텐츠 페이지를 맞춤 설정할 수 있습니다. 경험이 사이트 개인화에 어떻게 기여할 수 있는지 알아보려면 [콘텐츠 페이지 개인화](./content-page-personalization.md)를 참조하세요.

## 경험 만들기

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 **사이트 빌더** &rarr; **페이지** 로 이동합니다.

1. 콘텐츠 페이지에 대해 **작업**(![작업 버튼](../../../images/icon-actions.png))을 클릭하고 **편집** 을 선택합니다. 또는 [콘텐츠 페이지를 생성](../../creating-pages/using-content-pages.md)하세요.

1. **경험** 드롭다운 메뉴를 열고 **새 경험** 을 클릭하세요.

   ![Open the Experience drop-down menu and click New Experience.](./creating-and-managing-experiences/images/01.png)

1. 경험의 이름을 입력하고 타겟팅하려는 대상 세그먼트를 선택하세요. 또는 [세그먼트를 생성](../segmentation/creating-and-managing-user-segments.md)하세요.

   기본적으로 새로운 경험은 **누구나** 세그먼트(예: 모든 사이트 방문자)를 대상으로 합니다.

1. 대상 세그먼트에 표시되는 정보와 레이아웃을 결정하려면 콘텐츠 페이지를 디자인하세요.

1. **경험** 드롭다운 메뉴를 열고 **위로**(![Up](../../../images/icon-angle-up.png)) 또는 **아래로**(![Down](../ ../../images/icon-angle-down.png)) 버튼을 사용하여 경험의 우선순위를 설정하세요.

   사이트 방문자는 해당 세그먼트에 대해 가장 높은 순위의 경험을 봅니다. 자세한 내용은 [경험 작동 방식 이해](./content-page-personalization.md#understanding-how-experiences-work) 를 참조하세요.

1. **게시** 를 클릭하세요.

```{tip}
사용자가 로그인하여 페이지를 편집할 수 있는 권한이 있고 여러 경험이 있는 경우 선택한 경험을 기반으로 [페이지 보기/미리 보기](../../creating-pages/adding-pages/adding-a-page-to-a-site.md#previewing-pages) 를 할 수 있습니다.
```

## 경험 관리

콘텐츠 페이지를 편집할 때 환경을 클릭하여 해당 페이지에 대한 옵션을 관리할 수 있습니다.

![You can add, edit, delete, or change priority for Experiences.](./creating-and-managing-experiences/images/03.png)

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 **사이트 빌더** &rarr; **페이지** 로 이동합니다.

1. 콘텐츠 페이지에 대해 **작업**(![작업 버튼](../../../images/icon-actions.png))을 클릭하고 **편집** 을 선택합니다.

1. **경험** 드롭다운 메뉴를 엽니다. 여기에서,

   - Up(![Up](../../../images/icon-angle-up.png)) 및 Down(![Down](../../../images/icon)을 사용하여 경험 우선순위를 설정합니다. -angle-down.png)) 제어합니다.
   - 경험 이름 또는 선택한 세그먼트를 편집(![Edit](../../../images/icon-edit.png))합니다.
   - 경험을 복제하세요(![Duplicate](../../../images/icon-copy.png)).
   - 경험을 삭제합니다(![Delete](../../../images/icon-delete.png)).

   ```{important}
   드롭다운 메뉴의 경험 순서에 따라 우선순위가 결정됩니다. 자세한 내용은 [경험 작동 방식 이해](./content-page-personalization.md#understanding-how-experiences-work) 를 참조하세요.
   ```

## 관련 정보

* [콘텐츠 페이지 개인화](./content-page-personalization.md)
* [컬렉션 개인화](./personalizing-collections.md)
* [사용자 세그먼트 생성 및 관리](../segmentation/creating-and-managing-user-segments.md)
