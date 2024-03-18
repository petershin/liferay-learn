# 마스터 페이지 템플릿 관리

{bdg-secondary}`사용 가능: Liferay DXP/Portal 7.3+`

마스터 페이지 템플릿을 관리하려면 다음 단계를 따르세요.

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 **디자인** &rarr; **페이지 템플릿** 으로 이동합니다.

1. **마스터** 탭을 선택하세요.

1. 마스터 페이지 템플릿에 대해 **작업**(![Actions](./../../../images/icon-actions.png))을 클릭하고 옵션 중 하나를 선택합니다.

   ![Manage the master page template from the masters tab of the page templates application and opening the actions menu.](./managing-master-page-templates/images/01.png)

**편집:** 마스터 페이지 템플릿을 구성합니다.

**썸네일 변경:** 마스터 페이지 템플릿 카드에 표시할 썸네일 이미지를 선택합니다.

**기본값으로 표시:** 템플릿을 위젯 페이지의 기본 마스터 페이지로 만듭니다. 이 옵션은 승인된 마스터 페이지 템플릿에서 사용할 수 있습니다.

**이름 바꾸기:** 템플릿 이름을 변경합니다.

**내보내기:** 마스터 페이지 템플릿 정의를 내보내고 다운로드합니다. 이 옵션은 승인된 마스터 페이지 템플릿에서 사용할 수 있습니다.

**사본 만들기:** 마스터 페이지 템플릿을 복제합니다. 복사본은 끝에 "Copy"가 추가된 동일한 이름을 사용합니다.

**권한:** 템플릿에 대한 권한을 정의합니다.

**삭제:** 마스터 페이지 템플릿을 제거합니다. 각 템플릿에 대한 확인란을 선택하고 관리에서 **휴지통**(![휴지통 아이콘](../../../images/icon-trash.png))을 선택하여 여러 마스터 페이지 템플릿을 한 번에 삭제할 수도 있습니다. 도구 모음.

**초안 삭제:** 마스터 페이지 초안을 삭제합니다. 이 옵션은 초안에서 사용할 수 있습니다.

```{note}
변경 사항을 적용하고 게시한 후에는 마스터 페이지 템플릿을 사용하는 모든 페이지에 전파됩니다.
```

## 페이지의 마스터 페이지 템플릿 변경

[콘텐츠 페이지 편집기](../using-content-pages/content-page-editor-ui-reference.md)에서 페이지의 마스터 페이지 템플릿을 변경할 수 있습니다. 페이지 템플릿을 변경하려면 다음 단계를 따르세요.

1. 마스터 페이지 템플릿을 변경하려는 페이지로 이동합니다.

1. **편집**(![아이콘 편집](../../../images/icon-edit.png))을 클릭합니다.

1. 편집 사이드바에서 **페이지 디자인 옵션** 메뉴(![페이지 디자인 메뉴](../../../images/icon-format.png))를 클릭합니다.

1. 마스터 섹션에서 사용하려는 마스터 페이지 템플릿을 선택합니다.

   ![Select the master page template you want to use through the page design options menu.](./managing-master-page-templates/images/02.png)

## 마스터 페이지 템플릿 디자인 변경

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 **디자인** &rarr; **페이지 템플릿** 으로 이동합니다.

1. **마스터** 탭을 선택하세요.

1. 구성하려는 마스터 페이지 템플릿에 대해 **작업**(![Actions](./../../../images/icon-actions.png))을 클릭합니다. &rarr; **편집** .

1. **페이지 디자인 옵션** 메뉴를 클릭합니다(![페이지 디자인 옵션 메뉴](../../../images/icon-format.png)) &rarr; **추가 페이지 디자인 옵션**(![추가 페이지 디자인 옵션] (../../../images/icon-cog3.png))

   ![Click More Page Design Options to access the master page templates general pptions](./managing-master-page-templates/images/03.png)

1. 디자인 탭에서 마스터 페이지 템플릿의 스타일을 변경할 수 있습니다.

   ![Select a new master page template from the available options.](./managing-master-page-templates/images/04.png)

**테마:** 사이트 페이지의 테마를 사용할지 아니면 현재 마스터 페이지 템플릿에 대한 특정 테마를 선택할지 선택합니다.

**파비콘:** 테마에 적용되는 기본 파비콘을 변경합니다.

**스타일북:** 테마에서 적용되는 기본 스타일북을 변경합니다.

**테마 CSS 클라이언트 확장:** [테마 CSS 클라이언트 확장](../../../building-applications/client-extensions/frontend-client-extensions.md#theme-css-client-extensions) 전체 테마를 배포하지 않고 테마에서 기본 CSS를 완전히 교체합니다.

**CSS 클라이언트 확장:** 재정의하려면 [CSS 클라이언트 확장](../../../building-applications/client-extensions/frontend-client-extensions.md#css-client-extensions) 을 추가하세요. 마스터 페이지 템플릿을 사용하는 콘텐츠 페이지의 CSS 스타일입니다.

**맞춤 CSS:** 맞춤 CSS도 적용할 수 있으며 테마 다음에 로드됩니다. 상속된 테마를 사용하면 맞춤 CSS가 비활성화됩니다.

**JavaScript 클라이언트 확장 및 사용자 정의 JavaScript:** [JavaScript 클라이언트 확장](../../../building-applications/client-extensions/frontend-client-extensions.md#javascript-client-extensions) 이 마스터 페이지 템플릿을 사용하는 페이지를 방문할 때 JavaScript가 실행되도록 추가할 수 있습니다. 페이지 하단에서 실행되는 사용자 정의 JavaScript 코드를 추가할 수 있습니다.

```{note}
테마는 마스터 페이지 템플릿을 통해 콘텐츠 페이지에 적용됩니다. 마스터 페이지 템플릿이 콘텐츠 페이지에 적용되면 콘텐츠 페이지의 디자인은 마스터 페이지 템플릿에 의해 정의됩니다.
```

## 관련 주제

[마스터 페이지 템플릿](./master-page-templates.md)

[마스터 페이지 템플릿 만들기](./creating-a-master-page-template.md)
