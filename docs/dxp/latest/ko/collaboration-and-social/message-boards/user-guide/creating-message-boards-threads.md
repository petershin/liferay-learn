# 게시판 스레드 만들기

기본적으로 필요한 권한(최소 _메시지 추가_, _메시지_에 회신 3 , _파일 추가_및 _보기_)이 있는 인증된 사용자만 스레드를 생성할 수 있습니다. 자세한 내용은 [메시지 보드 권한 참조](./message-boards-permissions-reference.md) 을 참조하십시오. 관리자는 게스트가 스레드를 게시할 수 있도록 기능을 활성화할 수 있습니다.

## 새 스레드 게시

스레드는 메시지 보드 자체의 루트 수준과 생성된 [개의 범주 내에서 생성될 수 있습니다](./creating-message-boards-categories.md).

새 스레드를 생성하려면:

1. 게시판 _새 스레드_ 버튼을 클릭합니다. _메시지 추가_ 양식이 나타납니다.
1. **제목** 필드에 제목을 입력합니다.
1. **본문** 필드에 스레드의 콘텐츠를 만듭니다.

    ```{note}
    이 필드는 HTML 대신 BBCode를 사용한다는 점을 제외하면 블로그 앱과 동일한 편집기를 사용합니다. 자세한 지침은 [편집기 사용](https://help.liferay.com/hc/articles/360018173051-Using-the-Blog-Entry-Editor-)에 대한 설명서를 참조하십시오.
    ```

    ![그림 1. 첫 게시물 작성](./creating-message-boards-threads/images/01.png)

### 첨부 파일을 업로드 중

사용자는 포럼 게시물에 파일을 첨부할 수 있습니다.

1. 첨부 파일을 추가하려면 _첨부 파일_ 섹션을 확장합니다.
1. 업로드할 파일을 드래그 앤 드롭하거나 *파일 선택* 버튼을 사용하여 파일 사이트를 탐색합니다.

    ![그림 2. 첨부 파일 업로드](./creating-message-boards-threads/images/03.png)

```{important}
자동 바이러스 백신 검사를 활성화하여 업로드 시 파일을 검사할 수 있습니다. 자세한 내용은 [업로드된 파일에 대한 바이러스 백신 검사 활성화](../../../system-administration/file-storage/enabling-antivirus-scanning-for-uploaded-files.md)를 참조하십시오.
```

### _태그_ 및 _관련 자산_ 을 사용하여 스레드 구성

_카테고리_ 을 사용하여 스레드를 구성하는 것 외에도 사용자는 포럼 게시물에 태그를 추가할 수 있습니다. 이 태그(예: _Toyota_)를 사용하여 콘텐츠를 검색하면 _Toyota_ 이 포함된 모든 게시물이 더 빨리 반환됩니다.

1. _분류_ 섹션을 확장합니다.
1. __ 선택 버튼을 클릭하여 기존 태그를 선택합니다. 또는 _태그_ 필드에 태그 이름을 입력하고 _추가_을 클릭하여 새 태그를 만듭니다. 자세한 내용은 태그 [에 대한](https://help.liferay.com/hc/articles/360028820472-Tagging-Content) 를 참조하십시오.

이제 게시판 게시물에 태그가 있습니다.

Message Boards 스레드는 DXP의 다른 기존 자산에 연결할 수 있습니다.

1. 스레드와 관련된 포털의 기존 자산(예: 미디어 파일, 블로그 게시물 등)을 선택하려면 _관련 자산_ 섹션을 확장하고 _선택_ 버튼을 사용하여 해당 자산을 선택합니다.

    ![그림 3. 태그 및 관련 자산 추가](./creating-message-boards-threads/images/04.png)

### 스레드의 우선순위 설정

메시지 보드 스레드는 _긴급_, _고정_또는 _공지_로 우선순위를 지정할 수 있습니다. 기본적으로 "없음"으로 설정되어 있습니다.

1. _추가 설정_ 섹션을 확장합니다.<!-- Broken Image Link !\[Figure 4. Setting a thread priority\](./creating-message-boards-threads/images/07.png) -->1. 스레드의 우선 순위를 선택합니다.
1. _게시_을 클릭합니다.

새로운 포스트가 생성되었습니다. 사이트 관리자는 나중에 이 게시물을 다른 범주로 이동할 수 있습니다.

## 스레드를 질문으로 사용

메시지 보드 스레드는 아이디어와 의견을 공유하는 것 이상일 수 있습니다. 포럼 회원은 게시물을 다른 사이트 회원의 질문으로 전환할 수 있습니다. 질문에 가장 잘 맞는 답변을 답변으로 표시할 수 있습니다.

스레드가 질문을 게시하도록 하려면:

1. _새 스레드_ 버튼을 클릭합니다.
1. _추가 설정_ 섹션을 확장합니다.
1. _Mark as a Question_상자를 선택하십시오.

    ![그림 5. 스레드를 질문으로 표시](./creating-message-boards-threads/images/05.png)

회신을 답변으로 선택하려면:

1. 점 3개 아이콘을 클릭합니다.
1. _답변으로 표시_을 클릭합니다.

    ![그림 6. 회신은 게시판 질문에 대한 답변으로 표시될 수 있습니다.](./creating-message-boards-threads/images/02.png)

1. 스레드를 게시하려면 _게시_ 을 클릭합니다.

## 게시판 스레드 답글

스레드를 보려면 클릭하십시오. 답글이 상위 스레드 아래에 정렬되도록 메시지가 스레드 보기에 표시됩니다. 이렇게 하면 대화를 쉽게 따라갈 수 있습니다. 스레드 응답은 상위 스레드 아래에 들여쓰기됩니다.

![그림 7: 스레드 보기에는 스레드 및 스레드에 대한 모든 응답에 대한 작성자 정보와 스레드 콘텐츠가 표시됩니다.](./creating-message-boards-threads/images/06.png)

스레드의 메시지에 회신하려면:

1. _응답_ 버튼을 클릭합니다. 답장을 입력하기 위한 텍스트 필드만 포함된 빠른 답장 양식이 열립니다.
1. 텍스트 필드에 답장을 입력합니다. 회신에 대한 더 많은 옵션에 액세스하려면 _고급 회신_ 링크를 클릭하십시오. 그러면 스레드 추가/편집 양식에서 전체 편집기가 열립니다.
1. _게시_을 클릭합니다.

메시지에 회신하는 것 외에도 메시지를 평가하거나 불쾌함을 표시할 수 있습니다. 게시판 조정자는 플래그가 지정된 메시지를 평가하고 메시지 및 해당 작성자를 처리하는 방법을 결정할 수 있습니다.

## 추가 정보

* [게시판 카테고리 만들기](./creating-message-boards-categories.md)<!-- Is there a placeholder for an article on "Enabling User Mentions for Collaboration Applications"? This should be link to a placeholder.
* User can [mention other users](https://help.liferay.com/hc/en-us/articles/360028720892-Mentioning-Users) by entering the `@` character and their user name.
-->* [메시지 보드 구성 참조](./message-boards-configuration-reference.md)
