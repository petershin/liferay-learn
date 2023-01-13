# 페이지 템플릿 내보내기 및 가져오기

경우에 따라 코드 편집기에서 템플릿을 편집하는 것이 더 쉽습니다. 페이지 템플릿을 [만들었으면](./creating-a-page-template.md)내보내고 [선택한 편집기에서 로컬로 편집한 다음 템플릿을 다시](../../sites/exporting-importing-site-pages-and-content.md) 로 가져올 수 있습니다. 템플릿을 시스템의 모든 사이트로 가져올 수 있습니다.

내보내기/가져오기 프레임워크에 대한 일반적인 정보는 [사이트 페이지 및 콘텐츠 내보내기/가져오기](../../sites/exporting-importing-site-pages-and-content.md)을 참조하십시오.

```{note}
Liferay DXP 7.4+의 경우 페이지 템플릿 컬렉션은 Liferay UI에서 페이지 템플릿 세트라고 합니다.
```

## 페이지 템플릿 내보내기

페이지 템플릿을 내보내려면 다음 단계를 따르십시오.

1. *사이트 메뉴* (![Site Menu](../../../images/icon-product-menu.png)) 을 열고 *디자인* &rarr; *페이지 템플릿*으로 이동 합니다 .

1. *페이지 템플릿* 탭을 클릭합니다.

1. 원하는 템플릿이 포함된 페이지 템플릿 집합을 선택합니다.

1. 원하는 페이지 템플릿에 대해 *작업* 버튼(![Actions Button](../../../images/icon-actions.png))을 클릭하고 *내보내기*를 선택합니다.

   ![내보내기를 클릭하여 페이지 템플릿을 Zip으로 내보냅니다.](./exporting-and-importing-page-templates/images/01.png)

1. 확인 창에서 *확인* 을 클릭합니다.

페이지 템플릿은 ZIP 파일로 로컬 컴퓨터에 다운로드됩니다.

```{tip}
한 번에 둘 이상의 컨텐트 템플릿을 내보낼 수 있습니다. 그러나 동일한 ZIP 파일에 콘텐츠 페이지가 있는 위젯 템플릿을 포함할 수 없습니다.
```

페이지 템플릿의 마지막 게시 버전은 항상 내보내집니다. 페이지 템플릿이 게시된 적이 없으면 내보낼 수 없습니다.

내보낸 ZIP 파일에는 다음 파일이 포함되어 있습니다.

* `page-template-collection.json`: 페이지 템플릿이 저장된 Set의 이름과 기타 메타 데이터를 포함합니다.
* 선택적 썸네일 파일
* `page-template.json`: 페이지 템플릿 이름 및 기타 메타데이터를 포함합니다.
* `page-definition.json`: 페이지 템플릿의 구조와 내용을 지정합니다.

ZIP 파일에는 `display-page-template.json`, `master-page.json`, `page-template-collection.json` 및 `page-template.json`과 같은 다양한 유형의 페이지 템플릿도 포함될 수 있습니다.

## 페이지 템플릿 가져오기

페이지 템플릿을 가져오려면 다음 단계를 따르십시오.

1. *사이트 메뉴* (![Site Menu](../../../images/icon-product-menu.png)) 을 열고 *디자인* &rarr; *페이지 템플릿*으로 이동 합니다 .

1. 0 Application Bar에서 *Actions* 버튼(![Actions Button](../../../images/icon-actions.png))을 클릭하고 *Import*를 선택합니다.

   ![가져오기 기능은 오른쪽 상단 옵션 메뉴에 있습니다.](./exporting-and-importing-page-templates/images/02.png)

1. 원하는 페이지 템플릿 파일을 선택합니다.

1. *가져오기*을 클릭합니다.

   ![페이지 템플릿은 ZIP 파일로 가져옵니다.](./exporting-and-importing-page-templates/images/03.png)

1. *가져오기* 창을 닫습니다.

페이지 템플릿을 사이트로 가져왔습니다.

## 추가 정보

* [페이지 템플릿 만들기](./creating-a-page-template.md)
* [사이트 페이지 및 콘텐츠 내보내기/가져오기](../../sites/exporting-importing-site-pages-and-content.md)
* [컬렉션 만들기](../../../content-authoring-and-management/collections-and-collection-pages/creating-collections.md)
