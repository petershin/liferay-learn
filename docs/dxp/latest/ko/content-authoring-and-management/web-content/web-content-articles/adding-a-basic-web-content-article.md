# 기본 웹 콘텐츠 기사 추가

웹 콘텐츠는 사이트 콘텐츠를 만드는 가장 실용적이고 필수적인 방법 중 하나입니다. 웹 콘텐츠 기사는 [위젯](../../../site-building/displaying-content/additional-content-display-options/using-the-web-content-display-widget.md), [단편](../../../site-building/creating-pages/page-fragments-and-widgets/using-fragments.md)또는 [디스플레이 페이지](../../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md)를 통해 표시될 수 있습니다.

각 웹 콘텐츠 기사는 사용 가능한 필드를 정의하는 구조를 기반으로 합니다. Liferay에는 **기본 웹 콘텐츠** 기본 구조가 포함되어 있지만 직접 만들 수 있습니다. 자세한 내용은 [웹 콘텐츠 구조 이해](../web-content-structures/understanding-web-content-structures.md) 을 참조하십시오.

## 기본 웹 콘텐츠 기사 만들기

1. 사이트 메뉴(![Site Menu](../../../images/icon-menu.png))를 열고 **콘텐츠 & 데이터** → **웹 콘텐츠** 로 이동합니다.

1. **추가** 버튼(![Add icon](../../../images/icon-add.png))을 클릭하고 **기본 웹 콘텐츠** 를 선택합니다.

    ![웹 콘텐츠 관리 페이지.](./adding-a-basic-web-content-article/images/01.png).

1. 새 기사에 대해 **제목**(필수)을 입력하고 해당 필드에 원하는 **콘텐츠** 을 추가합니다.

    ![새 웹 콘텐츠 기사의 편집 화면.](./adding-a-basic-web-content-article/images/02.png)

1. 완료되면 **게시** 을 클릭합니다.

    ```{tip}
    _미리보기_(![Preview](../../../images/icon-preview.png)) 버튼을 사용하여 기본 템플릿 및 디스플레이 페이지 템플릿을 사용할 때 콘텐츠가 어떻게 보이는지 확인하십시오.

    ![기본 템플릿 및 표시 페이지 템플릿에서 콘텐츠 미리보기.](./adding-a-basic-web-content-article/images/03.png)
    ```

축하합니다! 사이트에 기본 웹 콘텐츠 기사를 추가했습니다. 이 문서를 페이지에 표시하는 방법에 대한 자세한 내용은 [웹 콘텐츠 표시 위젯](../../../site-building/displaying-content/additional-content-display-options/using-the-web-content-display-widget.md) 사용을 참조하십시오.

## 속성 탭

**기본 웹 콘텐츠** 기사를 만들거나 편집할 때 사이드바 메뉴의 **속성** 탭을 통해 다음 옵션에 액세스할 수 있습니다.

| **재산** | **목적** | **추가 비고** |
|:-------------- |:----------------------------------------------- |:----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **기본 정보** | 웹 콘텐츠의 기반이 되는 구조와 짧은 설명을 입력할 수 있는 요약 필드를 표시합니다. | 기사가 생성되면 구조를 편집할 수 없습니다. 자세한 내용은 [웹 콘텐츠 구조](../web-content-structures/understanding-web-content-structures.md) 을 참조하십시오.                                          |
| **기본 템플릿** | 기본적으로 이 웹 콘텐츠를 표시하는 데 사용할 템플릿을 선택하는 데 사용됩니다.    | 자세한 내용은 [웹 콘텐츠 템플릿 추가](../web-content-templates/creating-web-content-templates.md) 을 참조하십시오.                                                                      |
| **페이지 템플릿 표시** | 원하는 경우 이 문서에 대한 표시 페이지 템플릿을 선택하는 데 사용됩니다.       | 자세한 내용은 [디스플레이 페이지 템플릿 생성 및 관리](../../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md) 을 참조하십시오. |
| **추천 이미지** | 기사의 섬네일로 사용할 작은 이미지를 선택하는 데 사용됩니다.              | 이미지는 URL에서 가져오거나 시스템에서 업로드할 수 있습니다.                                                                                                                               |
| **메타데이터** | 기사의 태그 또는 우선 순위를 설정하는 데 사용됩니다.                  | 자세한 내용은 [콘텐츠 태깅](../../tags_and_categories.html) 을 참조하십시오.                                                                                                        |
| **친절한URL** | 이 문서에 대한 사용자 정의 URL을 설정하는 데 사용됩니다.              |                                                                                                                                                                   |
| **계획** | 원하는 경우 기사를 표시하거나 만료할 날짜를 예약하는 데 사용됩니다.          | 자세한 내용은 [웹 콘텐츠 예약](https://help.liferay.com/hc/ko/articles/360029042011-Scheduling-Web-Content-Publication) 을 참조하십시오.                                          |
| **수색** | 이 기사를 검색용으로 색인화할지 여부를 설정하는 데 사용됩니다.             |                                                                                                                                                                   |
| **관련 애셋** | 원하는 경우 관련 자산을 선택하는 데 사용됩니다.                     |                                                                                                                                                                   |
| **권한** | 기사에 특정한 게스트 또는 사이트 구성원에 대한 권한을 설정하는 데 사용됩니다.    | 기사를 볼 수 있는 사람을 보려면 추가 옵션을 클릭하십시오. 자세한 내용은 [역할 및 권한](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) 을 참조하십시오.        |

## 추가 정보

* [표시 페이지 템플릿 생성 및 관리](../../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md)
* [웹 콘텐츠 구조 소개](../web-content-structures/understanding-web-content-structures.md)
* [웹 콘텐츠 기사 필터링 및 정렬](./filtering-and-sorting-web-content-articles.md)
