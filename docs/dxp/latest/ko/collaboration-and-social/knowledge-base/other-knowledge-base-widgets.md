# 기타 기술 자료 위젯

[Knowledge Base Display 위젯](knowledge-base-display-widget.md) 외에 페이지에 추가할 수 있는 다른 Knowledge Base 위젯이 있습니다.

**기술 자료 기사** : 단일 기사의 콘텐츠를 표시합니다.

**기술 자료 섹션** : 특정 주제(섹션)와 관련된 기사를 게시합니다.

**기술 자료 검색** : 기사를 검색합니다.

**추가**(![아이콘 추가](../../images/icon-add.png)) &rarr; **위젯** &rarr; **콘텐츠 관리** 에서 이러한 위젯을 추가할 수 있습니다.

## 기술 자료 문서 위젯

기술 자료 기사 위젯은 단일 기사의 콘텐츠를 표시합니다. 심지어 하위 기사의 초록도 표시됩니다. 페이지에 여러 기술 자료 문서 인스턴스를 추가할 수 있으며 각각은 다른 문서를 표시할 수 있습니다.

사이트 페이지에 기술 자료 문서 위젯을 추가한 후,

1. **옵션**(![옵션 버튼](../../images/icon-options.png))을 클릭하고 **구성** 을 선택합니다.

1. **설정** 탭에서 **선택** 을 클릭합니다.

1. 기사를 선택하세요.

1. **저장** 을 클릭하고 구성 창을 닫습니다.

   ![Use the Knowledge Base Article widget to display an individual article.](./other-knowledge-base-widgets/images/01.png)

기술 자료 문서 위젯은 기술 자료 표시 위젯과 동일한 UI를 공유하여 해당 문서를 표시하고 관리합니다. 위젯 UI에 대한 자세한 설명은 [Knowledge Base Display 위젯](knowledge-base-display-widget.md) 설명서를 참조하세요.

## 기술 자료 섹션 위젯

```{note}
지식 베이스 3.0.0부터 지식 베이스 섹션 위젯은 더 이상 사용되지 않으며 [카테고리](../../content-authoring-and-management/tags-and-categories/organizing-content-with-categories-and-tags.md) 로 대체되었습니다.
```

기술 자료 섹션 위젯은 특정 주제(섹션)와 관련된 기사를 게시할 수 있습니다. 예를 들어, 하계 올림픽에 관한 사이트에는 팀 스포츠, 수상 스포츠, 무술 섹션이 있을 수 있습니다.

![The widget displays articles based on specific sections.](./other-knowledge-base-widgets/images/02.png)

섹션을 사용하려면 먼저 시스템 설정에서 기능을 구성하고 기술 자료 섹션 위젯에서 사용할 섹션 이름을 만들어야 합니다. 이 프로세스는 [기술 자료 시스템 설정](knowledge-base-system-settings.md) 에서 자세히 다룹니다.

기술 자료 문서를 생성하거나 편집할 때 작성자는 구성 &rarr; 섹션 필드에서 문서 섹션을 선택할 수 있습니다.

![Select a specific section for your article.](./other-knowledge-base-widgets/images/03.png)

지식 베이스 섹션 위젯의 여러 인스턴스를 페이지에 추가할 수 있습니다. 각 위젯은 원하는 수만큼 섹션의 기사를 표시할 수 있습니다. 기사 제목이나 초록을 표시하도록 위젯을 구성할 수 있습니다. 페이지 매김 또는 섹션 제목을 표시할지 여부도 정의할 수 있습니다.

기술 자료 섹션 위젯을 구성하려면,

1. **옵션**(![옵션 버튼](../../images/icon-options.png))을 클릭하고 **구성** 을 선택합니다.

   ![Customize the widget in the Configuration window.](./other-knowledge-base-widgets/images/04.png)

1. **설정** &rarr; **일반** 탭에서 사용하려는 섹션을 선택하고 **저장** 을 클릭하세요.

1. 업데이트를 보려면 구성 창을 닫으세요.

일치하는 기사가 앱의 섹션 제목 아래에 표시됩니다.

## 기술 자료 검색 위젯

```{note}
Knowledge Base 3.0.0부터 Knowledge Base Search 위젯은 더 이상 사용되지 않으며 Liferay Search로 대체됩니다.
```

기술 자료가 해당 문서의 구조를 표시할 수 있더라도 탐색을 통해 원하는 내용을 정확히 찾는 것이 어려울 수 있습니다. 이를 위해 기술 자료 검색 위젯을 사용할 수 있습니다.

검색어를 입력하고 **검색** 버튼을 누르세요. 결과는 일치하는 각 기사에 대해 다음 기준을 사용하여 표에 표시됩니다.

* 제목
* 작성자
* 생성일
* 수정된 날짜
* 조회수

![Use the app to get search results for Knowledge Base articles.](./other-knowledge-base-widgets/images/05.png)

페이지에 위젯을 추가한 후,

1. **옵션**(![옵션 버튼](../../images/icon-options.png))을 클릭하고 **구성** 을 선택합니다.

   ![Choose the criteria to display for the search results.](./other-knowledge-base-widgets/images/06.png)

1. **설정** &rarr; **일반** 탭에서 검색 결과에 표시할 기준을 선택합니다.

1. **저장** 을 클릭하고 구성 창을 닫습니다.

## 관련 주제

* [기술 자료 문서 작성](./creating-knowledge-base-articles.md) 
* [지식 베이스 관리](./managing-the-knowledge-base.md) 
* [지식 베이스 디스플레이 위젯](./knowledge-base-display-widget.md) 
