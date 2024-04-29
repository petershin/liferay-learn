# 블로그 표시

Liferay는 블로그 항목을 표시하는 두 가지 방법, 즉 [표시 페이지 템플릿](#using-display-page-templates) 및 [블로그 위젯](#using-the-blogs-widget) 제공합니다.

## 표시 페이지 템플릿 사용

[표시 페이지 템플릿](../../site-building/displaying-content/using-display-page-templates.md) 사용하여 친숙한 URL에 블로그 항목을 표시하기 위한 재사용 가능한 동적 디자인을 만들 수 있습니다. 기본적으로 모든 블로그 항목에는 고유하고 친숙한 URL이 자동으로 할당됩니다. 이 URL을 사용하여 표시 페이지에서 블로그 항목을 볼 수 있습니다.

블로그의 친숙한 URL은 표시 페이지의 URL(예: `display-page-url/blog-Friendly-url`)에 추가되며 언제든지 편집할 수 있습니다. 이를 변경하면 Liferay는 항목의 친숙한 URL 기록에 이전 URL을 저장합니다. 이전 URL이 이 기록에 남아 있는 한 사용자는 최신 버전의 블로그 항목에 액세스할 수 있습니다. 블로그 항목 표시를 위한 템플릿 설정에 대한 자세한 지침은 [표시 페이지로 콘텐츠 게시](../../site-building/displaying-content/using-display-page-templates/publishing-content-with-display-pages.md) 참조하세요.

블로그 항목에 대한 표시 페이지를 설정한 후에는 컬렉션을 사용하여 콘텐츠 페이지에 해당 항목을 나열할 수 있습니다. 자세한 내용은 [컬렉션 및 컬렉션 페이지 정보](../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md) 참조하세요.

<!-- It would be a good idea do include use cases here to exemplify what was said -->

### 친숙한 URL 기록

이전 블로그 항목 URL이 친숙한 URL 기록에 나타나면 동일한 사이트의 다른 항목에 사용할 수 없습니다. 새 항목에 사용하기 전에 먼저 항목의 친숙한 URL 기록에서 이를 제거해야 합니다.

블로그 항목의 친숙한 URL 기록을 관리하려면 다음 단계를 따르세요.

1. **사이트 메뉴**( ![사이트 메뉴](../../images/icon-product-menu.png) )를 열고 **콘텐츠 및 데이터** 를 확장한 다음 **블로그** 로 이동합니다.

1. 원하는 항목에 대해 **작업** 버튼( ![작업 버튼](../../images/icon-actions.png) )을 클릭하고 **편집** 을 선택합니다.

1. 구성 섹션을 확장하고 친숙한 URL 필드에서 **기록** 버튼( ![기록 버튼](../../images/icon-history.png) )을 클릭합니다.

   ![Click the History button for the Friendly URL field.](./displaying-blogs/images/01.png)

1. **복원** 버튼( ![복원 버튼](../../images/icon-restore2.png) )을 클릭하여 현재 친숙한 URL을 선택한 URL로 바꿉니다.

1. **URL 잊어버리기** 버튼( ![URL 잊어버리기 버튼](../../images/icon-delete.png) )을 클릭하여 항목 기록에서 선택한 URL을 제거합니다. 제거되면 더 이상 해당 URL을 사용하여 블로그 항목에 액세스할 수 없습니다.

   ![Click the Restore or Forget URL buttons.](./displaying-blogs/images/02.png)

친숙한 URL 기록에 대한 변경 사항은 자동으로 저장됩니다.

## 블로그 위젯 사용

블로그 위젯을 페이지에 추가하면 블로그 인터페이스가 사이트 회원에게 노출됩니다. 마찬가지로, 사용자의 개인 사이트(프로필)에 위젯을 추가하면 해당 사용자만을 위한 블로그가 생성됩니다. 위젯은 두 경우 모두 동일한 방식으로 작동합니다.

페이지에 블로그 위젯을 추가하려면,

1. [새 페이지를 만듭니다.](../../site-building/creating-pages/adding-pages/adding-a-page-to-a-site.md) 또는 [콘텐츠 페이지 편집을 시작합니다.](../../site-building/creating-pages/using-content-pages/adding-elements-to-content-pages.md) .

1. **추가**( ![위젯 추가 아이콘](../../images/icon-add-widget.png) )를 클릭하여 조각 및 위젯 패널을 엽니다.

1. 위젯 탭의 공동 작업 카테고리 아래에서 **블로그** 위젯을 페이지의 한 사이트
로 드래그합니다.

페이지에 블로그 위젯을 추가하면 목록을 원하는 대로 구성할 수 있는 여러 가지 표시 옵션이 있습니다.

위젯을 구성하려면 **옵션**(![옵션 아이콘](../../images/icon-app-options.png)) &rarr; **구성** 을 클릭하세요.

![There are different setup options for the Blogs widget](displaying-blogs/images/03.png)

### 설정 탭

**평점 활성화:** 블로그 항목에 대해 [등급 시스템](../../collaboration-and-social/social-toolse/using-the-ratings-system.md) 활성화합니다.

**댓글 활성화:** 블로그 항목에 댓글을 활성화합니다.

**조회수 표시:** 각 항목의 조회수 표시를 활성화합니다.

**소셜 북마크:** **현재** 열에 추가하는 소셜 미디어 플랫폼에서 블로그 항목 공유를 활성화합니다. **현재** 열과 **사용 가능** 열 사이에서 소셜 네트워킹 사이트를 이동하려면 사이트를 선택하고 해당 열 사이에 있는 화살표를 사용하십시오. 마찬가지로 현재 열 아래의 위쪽/아래쪽 화살표를 사용하여 각 블로그 항목에 표시되는 사이트 순서를 변경합니다.

**표시 스타일:** 소셜 북마크가 표시되는 방식을 정의합니다. **인라인** 은 기본값이며 소셜 북마크 아이콘을 연속으로 표시합니다. **메뉴** 는 공유 메뉴 안에 해당 항목을 숨깁니다.

**표시할 최대 항목 수:** 초기 페이지에 표시할 블로그 항목의 총 개수입니다. 한 번에 최대 60개까지 선택하여 표시할 수 있습니다.

**디스플레이 템플릿:** 블로그의 디스플레이 레이아웃을 선택합니다.

* **요약:** 각 블로그 항목의 요약을 표시합니다.

* **전체 콘텐츠:** 각 블로그 항목의 전체 콘텐츠를 표시합니다.

* **제목:** 각 블로그 항목의 제목만 표시합니다.

* **기본:** 텍스트가 적고 표지 이미지가 없는 간단한 버전의 초록입니다.

* **카드:** 표지 이미지, 제목, 작성자, 게시 날짜 및 몇 줄의 텍스트를 표시하는 카드 모양의 직사각형으로 각 블로그 항목을 표시합니다.

![The card display template makes your blog posts look like fun little trading cards.](displaying-blogs/images/04.png)

다른 ADT(애플리케이션 디스플레이 템플릿)를 선택하거나 직접 만들려면 **템플릿 관리** 를 클릭하세요.

**부적절한 콘텐츠 신고 활성화:** 부적절한 콘텐츠 신고를 활성화하여 관리자에게 이메일을 보냅니다.

**댓글에 대한 평가 활성화:** 블로그 항목 댓글에 대해 [평가 시스템](../../collaboration-and-social/social-tools/using-the-ratings-system.md) 을 활성화합니다.

**관련 자산 표시:** 다른 위젯의 관련 콘텐츠 표시를 활성화합니다.

### 통신, 공유 및 범위 탭

**통신:** 위젯이 페이지의 다른 위젯에 게시하는 공개 렌더링 매개변수를 나열합니다. 다른 위젯은 이를 읽고 조치를 취할 수 있습니다. 각 공유 매개변수에 대해 매개변수를 사용한 통신 허용 여부를 지정하고 이를 채울 수 있는 수신 매개변수를 선택할 수 있습니다.

**공유:** 위젯 인스턴스를 웹사이트, Facebook, Netvibes의 위젯 또는 OpenSocial 가젯으로 삽입하세요.

**범위:** 위젯이 표시하는 블로그 인스턴스(현재 사이트의 블로그(기본값), 글로벌 블로그 또는 페이지의 블로그)를 지정합니다.

## 관련 주제

[블로그 항목 추가하기](./adding-blog-entries.md)

[표시 페이지 템플릿 사용](../../site-building/displaying-content/using-display-page-templates.md)
