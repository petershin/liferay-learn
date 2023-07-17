# 마스터 페이지 템플릿 관리

> 사용 가능: Liferay DXP/Portal 7.3+

마스터 페이지 템플릿을 관리하려면 다음 단계를 따르십시오.

1. 제품 메뉴를 열고 **디자인** &rarr; **페이지 템플릿** 로 이동합니다.
1. **마스터** 탭을 선택합니다.
1. 마스터 페이지 템플릿에 대한 **작업**(![Actions](./../../../images/icon-actions.png)) 메뉴를 열고 옵션 중 하나를 선택합니다.

    ![페이지 템플릿 애플리케이션의 마스터 탭에서 작업 메뉴를 열어 마스터 페이지 템플릿을 관리합니다.](./managing-master-page-templates/images/01.png)

**편집:** 마스터 페이지 템플릿을 구성합니다.

**썸네일 변경:** **마스터** 탭에서 마스터 페이지 템플릿의 카드에 대해 표시할 썸네일 이미지를 선택합니다.

**이름 바꾸기:** 마스터 페이지 템플릿의 이름을 변경합니다.

**사본 만들기:** 마스터 페이지 템플릿을 복제합니다. 복사본은 끝에 "Copy"가 추가된 동일한 이름을 사용합니다.

**내보내기:** 마스터 페이지 템플릿 정의를 내보내고 다운로드합니다. 이 옵션은 마스터 페이지 템플릿이 **승인됨** 상태일 때 사용할 수 있습니다.

**권한:** 마스터 페이지 템플릿에 대한 권한을 정의합니다.

**삭제:** 마스터 페이지 템플릿을 제거합니다. 또한 각 템플릿의 확인란을 선택하고 `X`클릭하거나 관리 도구 모음에서 **삭제** 작업을 선택하여 여러 마스터 페이지 템플릿을 한 번에 삭제할 수 있습니다.

**초안 폐기:** 마스터 페이지 초안을 폐기합니다. 이 옵션은 마스터 페이지 템플릿이 **초안** 상태일 때 사용할 수 있습니다.

```{note}
변경하고 게시한 후에는 마스터 페이지 템플릿을 사용하는 모든 페이지에 전파됩니다.
```

## 페이지의 마스터 페이지 템플릿 변경

[Content Page Editor](../using-content-pages/content-page-editor-ui-reference.md)에서 페이지의 마스터 페이지 템플릿을 변경할 수 있습니다. 다음과 같이하세요:

1. 마스터 페이지 템플릿을 변경하려는 페이지로 이동합니다.
1. 클릭 **편집**(![Edit icon](../../../images/icon-edit.png))
1. 편집 사이드바에서 **페이지 디자인** 메뉴(![Page Design menu](../../../images/icon-format.png))를 클릭합니다.
1. 마스터 섹션에서 사용하려는 **마스터 페이지 템플릿** 클릭합니다.

   ![페이지 디자인 메뉴를 통해 사용하려는 마스터 페이지 템플릿을 클릭합니다.](./managing-master-page-templates/images/03.png)

## 마스터 페이지 템플릿의 모양과 느낌 변경

마스터 페이지 템플릿의 모양과 느낌 및 기타 옵션을 관리하려면 다음 단계를 따르십시오.

1. 제품 메뉴를 열고 **디자인** &rarr; **페이지 템플릿** 로 이동합니다.

1. **마스터** 탭을 선택합니다.

1. 구성하려는 마스터 페이지 템플릿에 대해 **작업** 메뉴(![Actions](./../../../images/icon-actions.png)) &rarr; **편집** 엽니다.

1. **페이지 디자인** 메뉴 클릭 (![Page Design menu](../../../images/icon-format.png)) &rarr; **기타 페이지 디자인 옵션**(![More Page Design Options](../../../images/icon-cog3.png))

   ![추가 페이지 디자인 옵션을 클릭하여 마스터 페이지 템플릿 일반 옵션에 액세스합니다.](./managing-master-page-templates/images/06.png)

1. 모양 및 느낌 탭에서 마스터 페이지 템플릿의 스타일을 필요에 맞게 조정할 수 있습니다.

    ![사용 가능한 옵션에서 새 마스터 페이지 템플릿을 선택합니다.](./managing-master-page-templates/images/05.png)

**파비콘:** 테마에서 적용되는 기본 파비콘을 변경합니다.

**Style Book:** 테마에서 적용된 기본 Style Book을 변경합니다.

**테마:** 사이트의 페이지에서 테마를 사용할지 또는 현재 마스터 페이지 템플릿에 대한 특정 테마를 선택할지 선택합니다.

**설정:** 바닥글 및 머리글 검색 막대와 같은 테마 측면을 표시할지 여부를 결정하도록 토글합니다. 사용자 지정 CSS는 테마가 로드된 후 적용할 수도 있습니다.

**테마 CSS 클라이언트 확장:** 전체 테마를 배포하지 않고 테마의 기본 CSS를 완전히 교체하려면 [테마 CSS 클라이언트 확장](../../../building-applications/client-extensions/front-end-client-extensions.md#theme-css-client-extensions) 추가합니다.

**CSS 클라이언트 확장:** [CSS 클라이언트 확장](../../../building-applications/client-extensions/front-end-client-extensions.md#css-client-extensions) 추가하여 마스터 페이지 템플릿을 사용하는 콘텐츠 페이지의 CSS 스타일을 재정의합니다.

**JavaScript 코드 및 JavaScript 클라이언트 확장:** **고급** 탭에서 페이지 하단에서 실행되는 JavaScript 코드를 추가할 수 있습니다. 이 마스터 페이지 템플릿을 사용하는 페이지를 방문할 때 JavaScript가 실행되도록 [JavaScript 클라이언트 확장](../../../building-applications/client-extensions/front-end-client-extensions.md#javascript-client-extensions) 추가할 수 있습니다.

```{note}
테마는 마스터 페이지 템플릿을 통해 콘텐츠 페이지에 적용됩니다. 마스터 페이지 템플릿이 콘텐츠 페이지에 적용되면 콘텐츠 페이지의 모양과 느낌이 마스터 페이지 템플릿에 의해 정의됩니다.
```

## 관련 주제

- [마스터 페이지 템플릿](./master-page-templates.md)
- [마스터 페이지 템플릿 만들기](./creating-a-master-page-template.md)
