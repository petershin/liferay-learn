# 마스터 페이지 템플릿 만들기

{bdg-secondary}`사용 가능: Liferay DXP/Portal 7.3+`

사이트 페이지의 머리글과 바닥글의 모양과 느낌을 정의하는 데 사용할 수 있는 기본 마스터 페이지 템플릿이 있지만 더 많은 사용자 지정 솔루션이 필요할 수 있습니다. 이를 위해 사용자 정의 마스터 페이지 템플릿을 만들 수 있습니다.

마스터 페이지 템플릿을 만들려면 다음 단계를 따르세요.

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 **디자인** &rarr; **페이지 템플릿** 으로 이동합니다.

1. 마스터 탭에서 **추가**(![Add](./../../../images/icon-add.png))를 클릭하여 새 마스터 페이지 템플릿을 만듭니다.

1. 새 마스터 페이지 템플릿의 **이름** 을 입력합니다.

1. 사이드바의 조각 및 위젯(![조각 및 위젯](./../../../images/icon-add-widget.png))에서 필요한 공통 요소에 대한 조각을 추가합니다.

   ![Add the master page template's common elements from the footers and navigation bars sections.](./creating-a-master-page-template/images/01.png)

1. (선택 사항) 놓기 영역을 레이아웃의 새 사이트로 끌어서 놓습니다. 예를 들어 두 개의 모듈이 있는 그리드를 추가하고 놓기 영역을 하나의 모듈로 이동할 수 있으므로 사용자는 그리드의 해당 부분에만 페이지 조각을 추가할 수 있습니다.

   ![You can move the Drop Zone to control where users can add page fragments.](./creating-a-master-page-template/images/02.gif)

1. (선택 사항)**허용된 조각 구성** 버튼을 클릭하여 끌어 놓기 영역에 추가할 수 있는 페이지 조각을 지정합니다.

   이 마스터 페이지 템플릿에서 허용할 페이지 조각을 확인하세요.

   허용된 조각 목록에 새 조각 유형을 포함하려면 **자동으로 새 조각 선택** 상자를 선택합니다.

   ![Check and uncheck fragments from the allowed fragments dialog to specify whether they can be added to a page that uses this master page template.](./creating-a-master-page-template/images/03.png)

**저장** 을 클릭하여 허용된 조각 대화 상자를 닫습니다.

1. (선택 사항) 콘텐츠 페이지를 미리 보려면 오른쪽 상단에 있는 **옵션**(![Options](../../../images/icon-options.png))을 클릭하세요. &rarr; **새 탭에서 미리 보기** .

1. **마스터 게시** 를 클릭하여 마스터 페이지 템플릿을 만듭니다.

**실행 취소**(![실행 취소 아이콘](../../../images/icon-undo.png)) 또는 **다시 실행**(![다시 실행 아이콘](../../../images/icon-redo.png)) 버튼을 사용하거나 **기록**(![기록 아이콘](../../../images/를 사용하여 이전 버전의 편집 내용으로 돌아갈 수 있습니다. icon-time.png)) 버튼을 클릭하세요.

```{note}
사용자 정의 마스터 페이지 템플릿이 페이지에 사용되는 경우 페이지 테마는 마스터 페이지 템플릿을 통해 정의되며 페이지 설정을 통해 변경할 수 없습니다. 자세한 내용은 [마스터 페이지 템플릿 디자인 변경](./managing-master-page-templates.md#changing-a-master-page-templates-design) 을 참조하세요.
```

## 관련 주제

[마스터 페이지 템플릿 관리](./managing-master-page-templates.md)

[마스터 페이지 템플릿](./master-page-templates.md)
