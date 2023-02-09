# 위키 페이지 만들기

_Wiki_ 위젯은 _FrontPage_이라는 기본 위키 페이지로 시작합니다. 사용자는 이 페이지를 편집하여 첫 번째 위키 페이지를 만들 수 있습니다.

기본적으로 인증된 사용자만 _개의 Wiki_ 문서를 만들 수 있습니다. 게스트는 먼저 로그인해야 합니다.

## _FrontPage에서 콘텐츠 만들기_

1. _Wiki_ 위젯이 배포된 사이트 페이지로 이동합니다.

    ![콘텐츠가 없는 위키 위젯](./creating-wiki-pages/images/01.png)

1. _FrontPage_을 수정하려면 _이 페이지는 비어 있습니다. 일부 텍스트를 추가하려면 편집하십시오. 상자에_ 개의 링크가 있습니다.
1. Tne 기본 텍스트 편집기는 Creole을 사용합니다. 형식을 전환하려면 _구성_ 섹션을 확장합니다.

    ![텍스트 형식 변경](./creating-wiki-pages/images/02.png)

1. 새 형식(HTML)을 선택한 다음 _확인_ 을 클릭하여 변경 사항을 적용합니다.
1. 글의 내용을 입력하세요.

### 첨부 파일 업로드

사용자는 위키 페이지에 파일을 첨부할 수 있습니다.

1. 첨부 파일을 추가하려면 _첨부 파일_ 섹션을 확장합니다.
1. 업로드할 파일을 드래그 앤 드롭하거나 _파일 선택_ 버튼을 사용하여 파일 사이트를 탐색합니다.

    ![첨부 파일 업로드](./creating-wiki-pages/images/03.png)

```{important}
자동 바이러스 백신 검사를 활성화하여 업로드 시 파일을 검사할 수 있습니다. 자세한 내용은 [업로드된 파일에 대한 바이러스 백신 검사 활성화](../../system-administration/file-storage/enabling-antivirus-scanning-for-uploaded-files.md)를 참조하십시오.
```

### 태그 및 관련 자산을 사용하여 Wiki 페이지 구성

사용자는 페이지에 태그를 추가할 수 있습니다. 이 태그(예: _Toyota_)를 사용하여 콘텐츠를 검색하면 _Toyota_ 이 포함된 모든 게시물이 더 빨리 반환됩니다.

1. _분류_ 섹션을 확장합니다.
1. __ 선택 버튼을 클릭하여 기존 태그를 선택합니다. 또는 _태그_ 필드에 태그 이름을 입력하고 _추가_을 클릭하여 새 태그를 만듭니다. 자세한 내용은 태그 [에 대한](https://help.liferay.com/hc/articles/360028820472-Tagging-Content) 를 참조하십시오.

1. 완료되면 _게시_ 을 클릭합니다.

![FrontPage 페이지 게시](./creating-wiki-pages/images/05.png)

_FrontPage_ 기사가 작성되었습니다.

## 하위 페이지 만들기

_FrontPage_ 페이지가 생성되면 사용자는 _하위 페이지_을 생성할 수 있습니다. 이렇게 하면 위키 페이지의 간단한 상위-하위 계층이 생성됩니다. _위키 하위 페이지_ 은 상위 페이지에도 속해 있는 경우에도 자체 하위 문서를 가질 수 있습니다. _하위 페이지_을 생성하려면 _하위 페이지 추가_을 클릭합니다.

![하위 페이지 추가](./creating-wiki-pages/images/06.png)

동일한 _Wiki_ 페이지 편집기가 열립니다.

![Wiki 페이지 편집기는 모든 수준의 모든 페이지에서 동일합니다.](./creating-wiki-pages/images/07.png)

## 다른 최상위 페이지 만들기

위의 _하위 페이지 만들기_에서 언급한 것처럼 향후 위키 페이지는 구성 목적을 위해 하위 페이지로 생성됩니다. 다른 최상위 페이지를 생성하려면:

1. _모든 페이지_ 탭을 클릭합니다.
1. _Wiki_ 위젯 메뉴 위로 마우스를 이동하고 _페이지 추가_을 클릭합니다.

   ![다른 Wiki 최상위 수준 페이지 추가](./creating-wiki-pages/images/04.png)

그러면 동일한 _Wiki_ 페이지 편집기가 열립니다.

_Wiki_ 위젯은 여러 최상위 페이지를 가질 수 있습니다. 기본 _Wiki_ 위젯은 _FrontPage_ wiki 페이지만 표시하지만 사이트 콘텐츠 작성자는 [Wiki Display Widget](./using-the-wiki-display-widget.md) 을 사용하여 다른 최상위 페이지를 표시할 수 있습니다.

![Wiki Display Widget을 사용하여 다른 최상위 페이지 표시](./creating-wiki-pages/images/08.png)

## 다음

* [노드 생성](./creating-a-node.md)
* [Wiki 디스플레이 위젯 사용](./using-the-wiki-display-widget.md)
