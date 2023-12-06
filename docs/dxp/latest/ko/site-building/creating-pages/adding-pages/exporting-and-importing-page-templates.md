# 페이지 템플릿 내보내기 및 가져오기

때로는 코드 편집기에서 템플릿을 편집하는 것이 더 쉽습니다. [페이지 템플릿을 생성](./creating-a-page-template.md)한 후에는 [export](../../sites/exporting-importing-site-pages-and-content.md)을 수행할 수 있습니다. 선택한 편집기에서 로컬로 편집한 다음 템플릿을 다시 Liferay로 가져옵니다. 템플릿을 시스템의 모든 사이트로 가져올 수 있습니다.

내보내기/가져오기 프레임워크에 대한 일반적인 정보는 [사이트 페이지 및 콘텐츠 내보내기/가져오기](../../sites/exporting-importing-site-pages-and-content.md)를 참조하세요.

```{note}
Liferay DXP 7.4+의 경우 Liferay UI에서는 페이지 템플릿 컬렉션을 페이지 템플릿 세트라고 합니다.
```

## 페이지 템플릿 내보내기

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 **디자인** &rarr; **페이지 템플릿** 으로 이동합니다.

1. **페이지 템플릿** 탭을 선택합니다.

1. 원하는 템플릿이 포함된 페이지 템플릿 세트를 선택합니다.

1. 원하는 콘텐츠 페이지 템플릿에 대해 **작업**(![작업 버튼](../../../images/icon-actions.png))을 클릭하고 **내보내기** 를 선택합니다.

   ![Click Export to export your page template as a ZIP file](./exporting-and-importing-page-templates/images/01.png)

콘텐츠 페이지 템플릿이 로컬 컴퓨터에 ZIP 파일로 다운로드됩니다.

```{tip}
한 번에 두 개 이상의 콘텐츠 페이지 템플릿을 내보낼 수 있습니다.
```

페이지 템플릿의 마지막 게시된 버전은 항상 내보내집니다. 페이지 템플릿이 게시된 적이 없으면 내보낼 수 없습니다.

내보낸 ZIP 파일에는 다음 파일이 포함되어 있습니다.

* `page-template-collection.json`: 페이지 템플릿이 저장되는 세트의 이름과 기타 메타데이터를 포함합니다.
* 선택적 썸네일 파일
* `page-template.json`: 페이지 템플릿 이름과 기타 메타데이터를 포함합니다.
* `page-definition.json`: 페이지 템플릿의 구조와 콘텐츠를 지정합니다.

ZIP 파일에는 `display-page-template.json`, `master-page.json`, `page-template-collection.json` 및 `page-template.json`과 같은 다양한 유형의 페이지 템플릿도 포함될 수 있습니다.

## 페이지 템플릿 가져오기

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 **디자인** &rarr; **페이지 템플릿** 으로 이동합니다.

1. 응용 프로그램 표시줄에서 **옵션**(![옵션 아이콘](../../../images/icon-options.png))을 클릭하고 **가져오기** 를 선택합니다.

   ![The import function is located in the options menu in the Application Bar.](./exporting-and-importing-page-templates/images/02.png)

1. 원하는 페이지 템플릿 파일을 선택합니다.

   변경하려면 **파일 바꾸기** 를 클릭하세요.

1. **가져오기** 를 클릭하세요.

   기존 페이지 템플릿을 가져오는 경우 자세한 내용은 [기존 페이지 템플릿 가져오기](#importing-an-existing-page-template) 를 참조하세요.

   작업을 취소하고 페이지 템플릿 페이지로 돌아가려면 **취소** 를 클릭하세요.

   ![Page templates are imported as ZIP files.](./exporting-and-importing-page-templates/images/03.png)

1. 가져오기 프로세스가 완료되면 [가져오기 결과 페이지](#import-outcome-page) 로 리디렉션됩니다.

1. 다른 파일을 가져오려면 **다른 파일 업로드** 를 클릭하고, 페이지 템플릿 페이지로 돌아가려면 **완료** 를 클릭하세요.

### 기존 페이지 템플릿 가져오기

페이지 템플릿을 가져오고 ZIP 파일의 항목이 이미 존재하는 경우 다음 세 가지 옵션 중 하나를 선택할 수 있습니다.

**기존 항목을 가져오지 않음** : 새 항목만 가져옵니다.

**기존 항목 덮어쓰기** : 중복된 기존 항목을 덮어씁니다.

**모두 유지** : 기존 항목의 번호가 매겨진 복사본을 가져옵니다.

가져오기 프로세스가 완료되면 [가져오기 결과 페이지](#import-outcome-page) 로 리디렉션됩니다.

![Choose one of three options when you import a duplicated page template](./exporting-and-importing-page-templates/images/04.png)

### 가져오기 결과 페이지

사용자가 파일을 가져오면 가져오기 프로세스에 대한 세부정보가 포함된 새 페이지로 리디렉션됩니다.

가져오기 결과 페이지에서 사용자는 성공적으로 가져온 항목, 경고(오작동을 일으킬 수 있는 가져오기 성공) 및 오류(가져오지 못한 항목)를 볼 수 있습니다.

![The import outcome page shows warnings and errors related to the importing process](./exporting-and-importing-page-templates/images/05.png)

## 관련 주제

[페이지 템플릿 만들기](./creating-a-page-template.md)

[사이트 페이지 및 콘텐츠 내보내기/가져오기](../../sites/exporting-importing-site-pages-and-content.md)

[컬렉션 만들기](../../../content-authoring-and-management/collections-and-collection-pages/creating-collections.md)
