# 블로그 항목 추가

블로그 항목의 범위는 사이트로 지정됩니다. 기본적으로 인증된 사용자만 블로그 항목을 만들 수 있습니다. 자세한 내용은 [블로그 권한 참조](./blog-permissions-reference.md)를 참조하세요.

[블로그 항목을 생성](#creating-an-entry) 하고 [페이지에 표시](./displaying-blogs.md)할 수 있습니다.

```{tip}
블로그 [위젯](../../site-building/creating-pages/using-widget-pages/adding-widgets-to-a-page.md)을 사용하는 것은 블로그 항목을 표시하는 가장 쉬운 방법 중 하나입니다. 페이지에.
```

## 항목 만들기

1. **사이트 메뉴**( ![제품 메뉴](../../images/icon-product-menu.png) )를 열고 **콘텐츠 및 데이터** &rarr; **블로그** 로 이동합니다.

1. 항목 탭에서 **추가**( ![아이콘 추가](../../images/icon-add.png) )를 클릭하여 새 블로그 항목을 추가합니다.

   ![Blog entry form editor](./adding-blog-entries/images/01.png)

1. 항목의 선택적 표지 이미지로 업로드할 파일을 끌어서 놓거나 선택합니다. 기본적으로 이 표지 이미지는 블로그 항목 초록의 일부로 게시됩니다.

1. 블로그 항목의 제목을 입력합니다.

1. 항목에 대한 선택적 자막을 입력합니다.

1. **내용** 필드에 항목의 내용을 입력합니다. 다양한 텍스트 편집 기능에 대해 자세히 알아보려면 [블로그 항목 편집기 참조](./blog-entry-editor-reference.md)를 참조하세요.

### 블로그 항목 분류

<!-- ```{note} Available in Liferay DXP 7.3+. This section must be updated to reflect the new by-default categories and vocabularies in 7.3``` -->

블로그 항목을 분류하여 사용자가 사이트의 콘텐츠를 찾는 데 도움을 줄 수 있습니다.

카테고리(공개 및 내부), 태그를 사용하거나 항목을 자산에 연결하여 블로그 항목을 분류하세요. 카테고리와 어휘에 대한 자세한 내용은 [콘텐츠에 대한 카테고리 및 어휘 정의](../tags-and-categories/defining-categories-and-vocabularies-for-content.md)를 참조하고, 태그 사용에 대한 자세한 내용은 [콘텐츠 태그 지정 및 태그 관리](../tags-and-categories/tagging-content-and-managing-tags.md)를 참조하세요.
카테고리와 태그를 사용하여 항목을 분류하려면,

1. 분류 섹션을 확장합니다.

1. 기존 카테고리나 태그를 선택하려면 **선택** 을 클릭하세요.

   또는 태그 필드에 태그 이름을 입력하고 Return 키를 눌러 새 태그를 생성할 수 있습니다.

자산을 항목에 연결하려면

1. 관련 자산 섹션을 확장하고 **선택** 을 클릭하여 자산을 선택하고 항목에 연결합니다.

### 항목 표시 방법 구성

블로그 항목과 표시 방법을 구성하려면 **구성** 및 **표시 페이지** 섹션을 확장하고 다음 설정을 조정하세요.

| 설정                | 묘사                                                                                                                                     |
| :---------------- | :------------------------------------------------------------------------------------------------------------------------------------- |
| URL               | 항목 URL 구성: **자동** 은 항목 제목을 기준으로 URL을 설정합니다. **Custom** 은 사용자 정의 친숙한 URL을 묻는 메시지를 표시합니다.                                                      |
| 요약                | 항목의 초록을 지정합니다. 기본적으로 블로그 애플리케이션은 처음 400단어를 사용합니다. **Custom Abstract** 는 수동 설명을 요구합니다.                                                     |
| 작은 심상             | 항목의 썸네일로 표시할 작은 이미지를 추가하세요.                                                                                                            |
| 전시 날짜             | 항목에 사용할 표시 날짜를 구성합니다.                                                                                                                  |
| 이메일 항목 업데이트됨 보내기. | 항목 업데이트에 대한 의견을 보내십시오.                                                                                                                 |
| 핑백 허용             | 게시물에 다른 웹사이트의 콘텐츠에 대한 링크를 포함하고 해당 웹사이트가 핑백을 지원하는 경우 해당 웹사이트는 귀하의 사이트로부터 알림 또는 "핑"을 받습니다. 핑백은 연결된 URL에 대한 XML-RPC 요청을 사용합니다.            |
| 페이지 템플릿 표시        | 블로그 항목을 표시하려면 기본 [표시 페이지 템플릿](../../site-building/displaying-content/using-display-page-templates.md), 특정 템플릿 또는 표시 페이지 템플릿 없음을 선택하세요. |

![When creating a blog entry, use the Configuration panel to control when and where the blog entry appears, and what to use for the entry's abstract.](./adding-blog-entries/images/02.png)

### 블로그 항목 게시

블로그 항목 편집, 분류 및 구성을 마친 후 **게시** 를 클릭하여 게시하세요.

동료 사이트 회원은 댓글을 추가하고 항목을 평가하거나 다른 소셜 미디어 사이트에서 공유할 수 있습니다.

![The Blog Entry has been published.](./adding-blog-entries/images/03.png)

## 관련 주제

[블로그 항목 관리](./managing-blog-entries.md)

[블로그 앱 구성](./configuring-the-blogs-app.md)

[블로그 표시](./displaying-blogs.md)
