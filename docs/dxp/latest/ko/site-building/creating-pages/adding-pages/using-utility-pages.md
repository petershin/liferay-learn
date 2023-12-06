# 유틸리티 페이지 사용

{bdg-secondary}`7.4 U86+ 및 GA86+`

유틸리티 페이지는 특정 운영 작업 및 작업을 제공하며 일반적으로 사용자가 웹 사이트 또는 애플리케이션과 효과적으로 상호 작용하는 데 필수적입니다. 사이트의 500 및 404 오류 페이지에 대해 유틸리티 페이지를 구성할 수 있습니다. 앞으로 이 기능은 다른 공통 페이지(예: 로그인 및 사용 약관 페이지)를 포함하도록 확장될 것입니다.

Liferay는 쉽게 사용자 정의할 수 있는 [기본 유틸리티 페이지](#viewing-utility-pages) 를 제공합니다. 처음부터 [유틸리티 페이지를 생성](#creating-a-new-utility-page) 할 수도 있습니다.

![Liferay provides out-of-the-box solutions that you can use or customize to fit your needs.](./using-utility-pages/images/01.png)

## 유틸리티 페이지 보기

유틸리티 페이지를 편집, 미리보기 또는 복사할 수 있습니다.

1. **사이트 메뉴**( ![사이트 메뉴](../../../images/icon-product-menu.png) )를 열고 **사이트 빌더** &rarr; **페이지** &rarr; **유틸리티 페이지** 탭으로 이동합니다.

   기본 제공 페이지에는 'PROVIDED BY LIFERAY' 태그가 표시되어 있습니다.

1. 페이지를 선택하고 **작업**( ![작업 아이콘](../../../images/icon-actions.png) )을 클릭하여 사용 가능한 옵션(예: 편집, 미리보기 또는 만들기) 중 하나를 보고 선택합니다. 사본).

```{tip}
[콘텐츠 페이지](../using-content-pages/adding-elements-to-content-pages.md)를 편집하는 것과 같은 방식으로 유틸리티 페이지를 편집합니다.
```

## 새 유틸리티 페이지 만들기

1. **사이트 메뉴**( ![사이트 메뉴](../../../images/icon-product-menu.png) )를 열고 **사이트 빌더** &rarr; **페이지** &rarr; **유틸리티 페이지** 탭으로 이동합니다.

1. **추가**( ![작업 메뉴](../../../images/icon-add.png) )를 선택합니다.

1. 생성하려는 유틸리티 페이지 유형을 선택합니다.

1. 빈 콘텐츠 페이지의 경우 **비어 있음** 을 선택하거나 사용 가능한 마스터 페이지 템플릿을 선택하세요.

1. 유틸리티 페이지의 이름을 지정하고 **저장** 을 클릭합니다.

[콘텐츠 페이지](../using-content-pages/adding-elements-to-content-pages.md)를 편집하는 것과 동일한 방식으로 새로 생성된 유틸리티 페이지를 편집할 수 있습니다.

## 유틸리티 페이지를 기본값으로 선택

새 유틸리티 페이지를 기본값으로 선택하려면 다음 단계를 따르십시오.

1. **사이트 메뉴**(![사이트 메뉴 아이콘](../../../images/icon-product-menu.png))를 열고 **사이트 빌더** &rarr; **페이지** &rarr; **유틸리티 페이지** 로 이동합니다. 탭.

1. 기본값으로 설정하려는 유틸리티 페이지에 대해 작업(![작업 메뉴](../../../images/icon-actions.png))을 선택합니다.

1. **기본값으로 표시** 를 선택합니다.

![Select a utility page as the default page in the actions menu.](./using-utility-pages/images/02.png)

```{note}
사이트에 페이지가 없으면 유틸리티 페이지를 적용하더라도 기본 404 오류 페이지가 표시됩니다.
```

## 유틸리티 페이지 권한

유틸리티 페이지에는 해당 사용을 관리하는 권한이 있습니다.

| 권한 이름          | 묘사                              |
| :------------- | :------------------------------ |
| 유틸리티 페이지 추가    | 유틸리티 페이지를 추가하는 데 필요합니다.         |
| 기본 유틸리티 페이지 할당 | 유틸리티 페이지에 기본 페이지를 할당하는 데 필요합니다. |

<!-- TASK: LPS-155184 Document 404 Error pages can be added to custom site initializers -->
