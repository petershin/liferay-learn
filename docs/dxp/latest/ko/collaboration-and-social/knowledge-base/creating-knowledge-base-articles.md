# 기술 자료 문서 만들기

{bdg-secondary}`liferay 7.4 U72+/GA72+`

기술 자료는 기사 저장소를 만들고 관리하기 위한 도구를 제공합니다. 애플리케이션의 WYSIWYG 편집기를 사용하거나 ZIP 아카이브의 Markdown 파일(`.markdown`, `.md`)로 가져와 기사를 만들 수 있습니다.

![Create and manage a repository of articles.](./creating-knowledge-base-articles/images/01.png)

## 편집기에서 기사 작성

1. **사이트 메뉴**(![사이트 메뉴](../../images/icon-menu.png))를 열고 **콘텐츠 및 데이터** &rarr; **기술 자료** 로 이동합니다.

1. 폴더 및 아티클 섹션(![폴더 및 아티클](../../images/icon-pages-tree.png))에서 **추가**(![추가 버튼](../../images)를 클릭합니다. /icon-add.png))**기본 기사** 를 선택하세요.

   [기사 템플릿](./knowledge-base-templates.md) 을 생성한 경우 이를 대신 선택할 수 있습니다.

   ![Click Add and select the desired article template.](./creating-knowledge-base-articles/images/02.png)

1. 기사 제목을 입력하세요.

1. 기사의 내용을 입력하세요. 기사의 HTML 소스를 보거나 편집하려면 편집기에서 **소스** 버튼(![소스](../../images/icon-code.png))을 클릭하세요.

   ![Enter content for the article.](./creating-knowledge-base-articles/images/03.png)

1. (선택사항) 기사에 첨부파일을 추가합니다.

1. (선택 사항) 기사에 대해 [표시 페이지 템플릿](../../site-building/displaying-content/using-display-page-templates.md) 선택합니다. 이 구성은 기술 자료 문서의 기본 표시 페이지 템플릿을 재정의합니다.

1. (선택 사항) 기사에 [태그](../../content-authoring-and-management/tags-and-categories/tagging-content-and-managing-tags.md) 또는 [카테고리](../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) 추가하여 가시성과 구성을 개선합니다.

1. (선택사항) 만료 및 검토 날짜를 설정합니다. 기본적으로 기사는 만료되거나 검토가 필요하지 않도록 설정됩니다. 자세한 내용은 [지식 베이스 관리](./managing-the-knowledge-base.md) 참조하십시오.

1. (선택 사항) 자산을 기사와 연결합니다.

1. 기사의 친숙한 URL을 설정하세요. 기본적으로 URL은 제목 필드와 일치하지만 수동으로 변경할 수 있습니다.

    ```{important}
    기사를 저장하거나 게시한 후에는 해당 URL을 변경할 수 없습니다.
    ```

1. (선택 사항) 기사의 권한을 구성합니다. 기본적으로 보기 권한은 게스트 역할에 할당됩니다. 즉, 누구나 기사를 볼 수 있습니다.

1. 출판을 위해 기사를 제출하려면 **게시** 를 클릭하고, 나중에 작업하려면 **초안으로 저장** 을 클릭하세요.

저장되면 기사가 폴더 및 기사 섹션에 나타납니다. 기술 자료에 대한 워크플로를 활성화한 경우 기사는 게시되기 전에 승인 프로세스를 거쳐야 합니다.

## 마크다운 파일 가져오기

원하는 경우 기술 자료 문서를 Markdown 파일(`.markdown`, `.md`)로 가져올 수 있습니다. 이렇게 하려면 각 Markdown 파일의 형식이 적절하고 ZIP 아카이브로 패키지되어 있는지 확인해야 합니다. 가져온 아티클은 자동으로 HTML로 변환되어 아티클 및 폴더 섹션(![폴더 및 아티클](../../images/icon-pages-tree.png))에 나타납니다. 자세한 지침은 [기술 자료 문서 가져오기](./importing-knowledge-base-articles.md) 참조하세요.

## 관련 주제

* [지식 베이스 관리](./managing-the-knowledge-base.md) 
* [기술 자료 문서 가져오기](./importing-knowledge-base-articles.md) 
