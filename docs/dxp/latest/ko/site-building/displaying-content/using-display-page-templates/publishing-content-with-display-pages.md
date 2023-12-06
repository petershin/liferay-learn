# 디스플레이 페이지를 사용하여 콘텐츠 게시

표시 페이지 템플릿을 사용하면 친숙한 URL에 콘텐츠 항목을 표시하기 위한 재사용 가능한 동적 디자인을 만들 수 있습니다. [템플릿을 디자인한 후](./creating-and-managing-display-page-templates.md) 이를 콘텐츠 유형을 표시하기 위한 기본 템플릿으로 만들거나 일부 콘텐츠 항목만 사용하도록 수동으로 구성할 수 있습니다. 일단 설정되면 사용자는 친숙한 URL을 방문하여 콘텐츠 항목의 표시 페이지를 볼 수 있습니다. 콘텐츠는 템플릿 디자인 및 매핑에 따라 동적으로 렌더링됩니다. 자세한 내용은 [표시 페이지 템플릿 사용](../using-display-page-templates.md)을 참조하세요.

```{note}
동일한 콘텐츠 유형에 대해 여러 개의 표시 페이지 템플릿을 만들 수 있더라도 기본 템플릿은 하나만 선택할 수 있습니다. 대체 템플릿을 기본값으로 사용하려면 템플릿을 콘텐츠 항목에 개별적으로 할당해야 합니다.
```

## 기본 표시 페이지 템플릿 설정

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 **디자인** &rarr; **페이지 템플릿** 을 클릭합니다.

1. **표시 페이지 템플릿** 탭을 클릭합니다.

1. 원하는 템플릿에 대해 **작업**(![Actions](../../../images/icon-actions.png))을 클릭하고 **기본값으로 표시** 를 선택합니다.

   ```{tip}
   각 템플릿의 콘텐츠 유형은 해당 이름(1) 아래에 나열됩니다. 파란색 체크(2)는 어떤 템플릿이 기본값으로 표시되어 있는지 나타냅니다.
   ```

   ![Select a display page template as the default one for the content type using the Actions menu.](./publishing-content-with-display-pages/images/01.png)

## 개별 콘텐츠 항목에 대한 표시 페이지 템플릿 설정

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 원하는 애플리케이션(예: 웹 콘텐츠, 블로그, 카테고리)으로 이동합니다.

1. 콘텐츠 항목 편집 또는 생성을 시작합니다.

   ![Edit or create a content item.](./publishing-content-with-display-pages/images/02.png)

1. 속성 탭에서 **표시 페이지 템플릿** 섹션을 확장하고 드롭다운 메뉴를 클릭한 다음 **특정** 을 선택합니다.

   ```{note}
   특정 디스플레이 페이지 템플릿을 선택하지 않으면 콘텐츠 유형에 대한 [기본 템플릿](#setting-a-default-display-page-template) 을 사용하여 콘텐츠가 게시됩니다.
   ```

   ![Select a specific display page template to configure it.](./publishing-content-with-display-pages/images/03.png)

1. **미리보기** 를 클릭하면 디스플레이 페이지의 모양을 미리 볼 수 있습니다.

1. (선택 사항) 속성 탭에서 **친숙한 URL** 패널을 확장하고 친숙한 URL을 수정합니다. 이는 표시 페이지 템플릿을 사용하여 콘텐츠 항목을 표시하기 위한 URL을 결정합니다.

   ```{note}
   Liferay 7.4 U34+/GA34+의 경우 표시 페이지 템플릿 프레임워크는 자산의 친숙한 URL 기록을 고려합니다. 이는 파일의 URL 기록에 저장된 모든 URL이 자동으로 파일의 현재 URL로 리디렉션됨을 의미합니다. 친숙한 URL 기록은 [문서](../../../content-authoring-and-management/documents-and-media/uploading-and-managing/configuring-document-urls.md)와 [블로그](../../../content-authoring-and-management/blogs/displaying-blogs.md) 모두에 지원됩니다.
   ```

   ![You can configure the friendly URL used for your displayed content.](./publishing-content-with-display-pages/images/04.png)

1. **게시** 를 클릭하세요.

일단 설정되면 Liferay는 템플릿을 사용하여 고유한 친숙한 URL에 콘텐츠 항목을 표시합니다. 원하는 경우 콘텐츠의 **작업** 버튼(![Actions](../../../images/icon-actions.png))을 클릭하고 **미리보기** 또는 **를 선택하여 언제든지 콘텐츠의 표시 페이지를 미리 볼 수 있습니다. 콘텐츠 보기**

**미리보기** 는 표시 페이지 템플릿 컨텍스트의 콘텐츠를 표시하는 반면, **콘텐츠 보기** 는 콘텐츠 항목의 친숙한 URL로 리디렉션됩니다.

![Preview your content in the context of the display page template or view the Display Page using the content's Action menu.](./publishing-content-with-display-pages/images/05.png)

## 관련 주제

[표시 페이지 템플릿 사용](../using-display-page-templates.md)

[표시 페이지 템플릿 생성 및 관리](./creating-and-managing-display-page-templates.md)
