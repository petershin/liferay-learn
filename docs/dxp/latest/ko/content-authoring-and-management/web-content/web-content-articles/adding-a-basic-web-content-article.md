# 기본 웹 콘텐츠 기사 추가

사이트에 게시할 콘텐츠가 많을 때 Liferay의 콘텐츠 관리 시스템은 이를 관리하는 실용적이고 필수적인 방법을 제공합니다. 웹 콘텐츠 기사는 [위젯](../../../site-building/displaying-content/additional-content-display-options/using-the-web-content-display-widget.md)을 통해 표시될 수 있습니다. , [조각](../../../site-building/creating-pages/page-fragments-and-widgets/using-fragments.md) 또는 [표시 페이지](../../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md).

각 웹 콘텐츠 기사는 사용 가능한 필드를 정의하는 구조를 기반으로 합니다. Liferay에는 기본 웹 콘텐츠 구조가 포함되어 있지만 직접 만들 수도 있습니다. 자세한 내용은 [웹 콘텐츠 구조 이해](../web-content-structures/understanding-web-content-structures.md)를 참조하세요.

## 기본 웹 콘텐츠 기사 작성

1. 사이트 메뉴(![사이트 메뉴](../../../images/icon-menu.png))를 열고 **콘텐츠 및 데이터** &rarr; **웹 콘텐츠** 로 이동합니다.

1. 웹 콘텐츠 탭에서 **추가**(![아이콘 추가](../../../images/icon-add.png))를 클릭하고 **기본 웹 콘텐츠** 를 선택합니다.

   ![웹 콘텐츠 관리 페이지입니다.](./adding-a-basic-web-content-article/images/01.png).

1. 새 기사의 **제목**(필수)을 입력하고 원하는 **내용** 을 해당 필드에 추가하세요.

   ![The edit screen for a new web content article.](./adding-a-basic-web-content-article/images/02.png)

1. **게시** 를 클릭하세요.

이제 [웹 콘텐츠 표시 위젯](../../../site-building/displaying-content/additional-content-display-options/using-the-web) 을 사용하여 페이지에 웹 콘텐츠 기사를 표시할 수 있습니다. -content-display-widget.md) 등이 있습니다.

## 웹 콘텐츠 기사 미리보기

게시하기 전에 선택한 기본 템플릿이나 표시 페이지 템플릿을 사용하여 콘텐츠를 미리 볼 수 있으므로 콘텐츠가 사용자에게 의도한 대로 표시되도록 조정할 수 있습니다.

### 템플릿을 사용하여 웹 콘텐츠 기사 미리보기

1. 속성 탭에서 템플릿을 선택하여 웹 콘텐츠 기사를 미리 봅니다.

1. **미리보기**( ![Preview](../../../images/icon-preview.png) )를 클릭합니다.

   ![The default template has a preview button that looks like an eye.](./adding-a-basic-web-content-article/images/04.png)

```{note}
 초안으로 게시되거나 저장된 웹 콘텐츠 기사만 미리 볼 수 있습니다.
```

### 디스플레이 페이지를 사용하여 웹 콘텐츠 기사 미리보기

모든 사이트 또는 자산 라이브러리의 디스플레이 페이지 템플릿을 사용하여 웹 콘텐츠를 미리 볼 수 있습니다.

1. 속성 탭에서 사이트 및 디스플레이 페이지를 선택하여 웹 콘텐츠 기사를 미리 봅니다.

1. **미리보기**( ![Preview](../../../images/icon-preview.png) )를 클릭합니다.

   ![When you've selected a display page template, use the preview button in the properties tab.](./adding-a-basic-web-content-article/images/05.png)

```{note}
미리보기 버튼을 선택하면 미리보기를 표시하기 전에 웹 콘텐츠 기사의 초안이 저장됩니다.
```

## 속성 탭

기본 웹 콘텐츠 기사를 생성하거나 편집할 때 사이드바 메뉴의 속성 탭에 다음 옵션이 나타납니다.

| **재산** | **목적** | **추가 비고** |
| :------------- | :--------------------------------------------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **기본 정보** | 기사의 기반이 되는 웹 콘텐츠 구조, 버전 및 상태, ID, 편집 가능한 간단한 설명 등 기사에 대한 기본 정보를 확인하세요. | 기사가 생성되면 구조를 편집할 수 없습니다. 자세한 내용은 [웹 콘텐츠 구조](../web-content-structures/understanding-web-content-structures.md)를 참조하세요.                                                                          |
| **기본 템플릿** | 이 웹 콘텐츠를 표시하려면 기본 템플릿을 선택하세요.                                          | 자세한 내용은 [웹 콘텐츠 템플릿 만들기](../web-content-templates/creating-web-content-templates.md)를 참조하세요.                                                                                                     |
| **페이지 템플릿 표시** | 원하는 경우 이 기사에 대한 표시 페이지 템플릿을 선택하십시오.                                    | 자세한 내용은 [표시 페이지 템플릿 생성 및 관리](../../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md)를 참조하세요. 추가 정보.                             |
| **추천 이미지** | 기사의 썸네일로 사용할 작은 이미지를 선택하세요.                                            | 이미지는 URL에서 가져오거나 시스템에서 업로드하거나 문서 및 미디어에 있는 파일에서 가져올 수 있습니다.                                                                                                                                     |
| **분류** | 기사의 공개 또는 비공개 카테고리, 태그 또는 우선순위를 설정하세요.                                 | [콘텐츠 태그 지정](../../tags-and-categories/tagged-content-and-managing-tags.md) 및 [카테고리 및 태그로 콘텐츠 구성](../../tags-and-를 참조하세요. 자세한 내용은 카테고리/organizing-content-with-categories-and-tags.md)를 참조하세요. |
| **친절한URL** | 이 기사에 대한 사용자 지정 친숙한 URL을 설정하세요.                                        |                                                                                                                                                                                                 |
| **일정** | 원하는 경우 기사를 표시하거나 만료할 날짜를 예약합니다.                                        | 자세한 내용은 [웹 콘텐츠 예약](./using-expiration-and-review-dates-in-web-content.md)을 참조하세요.                                                                                                               |
| **검색** | 이 기사를 검색용으로 색인화할지 여부를 설정합니다.                                           |                                                                                                                                                                                                 |
| **관련 애셋** | 원하는 경우 관련 자산을 선택합니다.                                                   |                                                                                                                                                                                                 |

## 관련 주제

[표시 페이지 템플릿 생성 및 관리](../../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md)

[웹 콘텐츠 구조 소개](../web-content-structures/understanding-web-content-structures.md)

[웹 콘텐츠 기사 필터링 및 정렬](./filtering-and-sorting-web-content-articles.md)
