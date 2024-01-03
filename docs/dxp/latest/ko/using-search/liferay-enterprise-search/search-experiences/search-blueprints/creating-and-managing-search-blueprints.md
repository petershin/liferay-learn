# 검색 청사진 생성 및 관리

글로벌 메뉴의 애플리케이션 섹션 &rarr; 검색 경험에서 [검색 청사진](./understanding-search-blueprints.md) 을 생성할 수 있습니다. 이미 청사진이 있고 Liferay [검색 페이지](../../../search-pages-and-widgets/working-with-search-pages.md) 에서 해당 기능을 적용하려면 [검색 페이지에서 검색 청사진 사용](./using-a-search-blueprint-on-a-search-page.md) 참조하세요.

검색 청사진을 생성하려면,

1. 글로벌 메뉴 &rarr; 애플리케이션(검색 경험)에서 _Blueprints_를 클릭하여 Blueprints 애플리케이션을 엽니다.

1. _추가_(![추가](../../../../images/icon-add.png))를 클릭하여 블루프린트를 추가합니다.

   ![Start creating a Blueprint from the Add Blueprint modal window.](./creating-and-managing-search-blueprints/images/01.png)

1. New Search Blueprint 창에서 Blueprint에 이름(필수)과 설명(선택 사항)을 지정합니다.

1. 청사진 계획에 따라 다음 메뉴를 사용하여 [청사진](./understanding-search-blueprints.md#what-is-a-blueprint) 구축을 계속합니다.

   - [쿼리 빌더](#using-the-query-builder) : 쿼리 요소 섹션에서 Blueprint에 대한 요소를 선택하거나 구성하여 검색에 새 쿼리 절을 추가합니다. 쿼리 설정 섹션에서 쿼리에 대한 추가 설정(예: 검색할 자산 및 개체 유형)을 구성합니다.

   - [구성](#adding-configurations) : 검색의 고급 설정(예: 정렬 또는 집계)을 구성합니다.

1. 블루프린트를 빌드하고 구성하면서 테스트해 보세요. _미리보기_를 클릭하고 검색 키워드를 입력하세요.

   ![Preview a Blueprint before putting it in action.](./creating-and-managing-search-blueprints/images/02.png)

   자세한 내용은 [청사진 테스트](#testing-a-blueprint-with-the-preview-sidebar) 참조하세요.

1. 초기 블루프린트 생성이 완료되면 _Save_를 클릭하세요.

블루프린트 생성 프로세스는 빠르고 간단할 수 있지만 때로는 반복과 테스트가 필요합니다. 작업 내용을 보존하려면 블루프린트를 자주 저장하십시오.

액션 메뉴(![액션](../../../../images/icon-actions.png))에서 블루프린트를 편집하거나 삭제합니다.

[검색 청사진](#importing-and-exporting-blueprints) 가져오고 내보낼 수도 있습니다.

![Edit, delete, or export a Blueprint from its Actions menu.](./creating-and-managing-search-blueprints/images/03.png)

## 쿼리 빌더 사용

쿼리 빌더를 사용하여 다음을 수행합니다.

1. [Blueprint](#adding-elements-to-the-blueprint) 에 요소를 추가합니다.

1. [검색할 Liferay 자산을 선택하십시오.](#choosing-which-liferay-assets-to-search) .

### 청사진에 요소 추가

Blueprint에 쿼리 절 추가를 시작하려면 요소를 추가하세요.

1. 쿼리 요소 화면에서 _Add_ (![추가](../../../../images/icon-add.png))를 클릭하여 쿼리 요소 추가 사이드바를 엽니다.

   ![Add Elements to the Blueprint.](./creating-and-managing-search-blueprints/images/04.png)

1. 탐색하려는 요소 카테고리를 확장합니다.

1. 요소 위로 마우스를 이동한 다음 _추가_를 클릭하세요.

1. 요소가 쿼리 빌더에 추가되어 구성할 준비가 되었습니다.

   ![This Element gives a boost of 10 to content found on sites the searching user is a member of.](./creating-and-managing-search-blueprints/images/05.png)

1. 원하는 대로 검색 쿼리를 구성하는 데 필요한 만큼 요소를 추가합니다.

   각 기본 요소에 대한 설명은 [Search Blueprints 요소 참조](./search-blueprints-elements-reference.md) 을 참조하세요.

1. 사용자 정의 요소가 필요한 경우 사용자 정의 JSON 요소를 쿼리 빌더에 추가하고 필요한 쿼리 절을 작성하세요.

   사용자 정의 JSON 요소 구축에 대해 알아보려면 [요소 생성](./creating-and-managing-elements/creating-elements.md) 참조하세요.

```{important}
일부 요소는 쿼리 빌더의 Blueprint에 추가하는 것보다 더 많은 작업이 필요합니다. 예를 들어 Boost Longer Contents 요소 또는 Boost Contents with More Versions 요소를 사용하려면 제어판 &rarr; 검색 &rarr; 색인 작업에서 다음 항목을 다시 색인화해야 합니다.

* `com.liferay.blogs.model.BlogsEntry`
* `com.liferay.document.library.kernel.model.DLFileEntry`
* `com.liferay.journal.model.JournalArticle`
* `com.liferay.knowledge.base.model.KBArticle`
* `com.liferay.wiki.model.WikiPage`

지리적 사이트
 기능(예: Boost Proximity)을 제공하는 요소와 같은 다른 요소에는 추가 설정이 필요합니다. 자세한 내용은 [요소 참조](./search-blueprints-elements-reference.md) 을 참조하세요.
```

요소를 추가한 후 블루프린트를 저장했는지 확인하세요.

### 검색할 Liferay 자산 선택

Blueprint 쿼리에 포함할 Liferay 자산 유형을 결정합니다. 쿼리 설정 사용 &rarr; 검색 가능한 유형:

![Expand the Searchable Types drop-down to begin removing assets from the Search Blueprint.](./creating-and-managing-search-blueprints/images/06.png)

- 기본적으로 모든 자산 및 개체 유형이 선택됩니다.
- 특정 유형을 제거하려면 _자산 유형 선택_을 클릭하여 유형 선택을 연 다음 해당 확인란을 선택 취소하세요.

![The Select Types modal is used for bulk management of the assets to be searched.](./creating-and-managing-search-blueprints/images/07.png)

```{note}
검색 가능한 유형 모달에서 모든 자산을 선택 취소하는 것은 모든 유형을 선택하는 것과 동일합니다. 모든 자산 및 개체 유형이 검색됩니다. Liferay의 검색 절 대부분을 비활성화하는 방법에 대해 알아보려면 [쿼리 절 기여자 구성](#advanced-configuring-query-clause-contributors) 을 참조하세요.
```

검색 가능한 유형 구성을 편집한 후에는 항상 블루프린트를 저장하십시오.

검색 가능한 유형 구성에서 자산 유형을 비활성화한다는 것은 일반적으로 인덱싱 코드에 의해 제공되는 쿼리 절이 제외된다는 것을 의미합니다. 유형은 검색할 수 없으며 Blueprint가 검색에 적용될 때 최종 사용자는 제외된 유형의 결과를 볼 수 없습니다.

검색 가능한 유형 구성은 다른 조항 기여자 구성 옵션에 중요한 영향을 미치므로 자세한 내용은 아래에 나와 있습니다.

### 고급: 쿼리 절 기여자 구성

Liferay의 백엔드 코드(및 잠재적으로 Liferay 인스턴스에 배포된 모든 사용자 정의 애플리케이션)는 진행 중인 검색에 쿼리 절을 제공합니다.

백엔드에서 제공된 이러한 조항은 검색 청사진을 통해 구성할 수 있습니다. 그러나 대부분의 사용자는 다음 두 가지 설정을 절대 건드리면 안 됩니다.

- 검색 프레임웍 인덱서 조항
- 검색 프레임웍 쿼리 공헌자

일반적으로 기본 설정이면 충분합니다. [Searchable Types](#choosing-which-liferay-assets-to-search) 을 사용하는 것 이상으로 이 동작을 조정해야 한다고 확신한다면 이러한 백엔드 기여자가 작동하는 방식을 이해해야 합니다.

1. 개별 인덱서가 검색에 참여하지 못하도록 하려면 **검색 가능한 유형**을 사용하세요. 유형의 인덱서를 비활성화하면 쿼리 기여자를 선택한 경우에도 해당 유형에 대한 절이 검색 쿼리에 추가되지 않습니다. 이러한 유형에 대한 결과는 사용자에게 표시되지 않습니다.

1. **검색 프레임워크 인덱서 조항**을 사용하여 모든 Liferay의 인덱서가 검색에 기여하는 조항을 비활성화합니다. 모든 인덱서를 비활성화하는 유일한 이유는 검색 쿼리를 처음부터 작성하여 모든 쿼리 기여자와 검색 가능한 자산도 비활성화하는 것입니다.

1. 검색에 참여하는 특정 기여자를 제거하려면 **검색 프레임워크 쿼리 기여자** 섹션을 사용하세요. 자체 Blueprints 구성을 사용하여 이를 재정의하려면 특정 조항 기여자를 비활성화하거나 Liferay의 검색 동작을 완전히 재정의하려면 모든 조항을 비활성화하고 Liferay의 인덱서 및 검색 가능 유형도 비활성화합니다.

```{important}
* 모든 인덱서 및 쿼리 기여자를 비활성화하더라도 특정 필수 조항은 항상 Liferay의 검색 프레임워크에 의해 추가됩니다. 따라서 Blueprint를 사용하면 실제로 처음부터 쿼리를 작성할 수 없습니다.

* Liferay의 Indexer 프레임워크는 Liferay 7.2에서 리팩터링되었습니다. 웹 콘텐츠 기사 및 폴더와 같은 Liferay의 핵심 자산 중 일부는 새로운 패턴으로 업데이트되지 않았습니다. 이러한 자산에 대한 쿼리 기여자가 없기 때문에 이는 검색 청사진에 영향을 미칩니다. 따라서 Liferay Indexer 조항이 활성화되면 자산에 대한 표준 조항이 항상 검색 쿼리에 추가됩니다. 따라서 웹 콘텐츠 기사의 조항을 완전히 무시하는 것은 불가능합니다. 그러나 위에 더 많은 조항을 추가하여 이러한 자산의 검색 동작을 조정할 수 있습니다(예: 특정 조항 일치를 강화).

* 내부 제한으로 인해 Liferay의 '인덱서'를 모두 활성화하거나 비활성화하도록 선택해야 합니다. 기타 조항 기여자는 보다 유연하게 관리할 수 있습니다. 원하는 기여자 전체, 없음 또는 하위 집합을 포함하도록 선택하세요.

![Disable certain clause contributors or all indexers from contributing clauses to the search query.](./creating-and-managing-search-blueprints/images/08.png)
```

조항 기여자 또는 인덱서 동작을 편집하는 경우 Blueprint를 저장해야 합니다.

## 구성 추가

검색 쿼리를 세밀하게 관리하는 것 외에도 검색 청사진 설정을 추가하고 JSON 구성을 추가하세요.

- 집계
- 하이라이트
- 정렬
- 매개 변수
- 고급 구성

![Additional settings can be configured using JSON.](./creating-and-managing-search-blueprints/images/09.png)

이를 추가하려면 _구성_ 탭을 클릭한 다음 원하는 구성에 대한 텍스트 입력 상자를 찾으세요. JSON을 입력한 다음 블루프린트를 저장하세요.

다음은 '이름' 필드를 기준으로 검색 결과를 내림차순(알파벳 역방향-ZA)으로 정렬하는 정렬의 예입니다.

```json
{
	"sorts": [
		{
			"title_sortable": "desc"
		}
	]
}
```

자세한 내용은 [검색 청사진 구성 참조](./search-blueprints-configuration-reference.md) 을 참조하세요.

## 청사진 가져오기 및 내보내기

블루프린트는 JSON 객체입니다. 한 환경에서 Blueprint의 JSON을 내보내고 다른 환경으로 가져옵니다. 이는 블루프린트를 스테이징 및 테스트 환경에서 프로덕션 환경으로 가져올 때 유용할 수 있습니다.

Blueprint JSON을 내보내려면

1. 글로벌 메뉴 &rarr; 애플리케이션 &rarr; Blueprints(검색 경험 섹션)에서 Blueprints 애플리케이션을 엽니다.

1. 블루프린트 목록에서 블루프린트의 _Actions_ (![액션](../../../../images/icon-actions.png)) 메뉴를 열고 _Export_를 클릭하세요.

Blueprint의 JSON 정의를 가져오려면,

1. 글로벌 메뉴 &rarr; 애플리케이션 &rarr; Blueprints(검색 경험 섹션)에서 Blueprints 애플리케이션을 엽니다.

1. 메인 블루프린트 _Actions_ (![액션](../../../../images/icon-actions.png)) 메뉴를 열고 _Import_를 클릭하세요.

1. 유효한 Blueprint JSON 파일을 선택하세요. 유효한 요소 JSON 파일도 이 화면에서 가져올 수 있습니다.

   ![Import Blueprints and Elements.](./creating-and-managing-search-blueprints/images/10.png)

1. _가져오기_를 클릭하세요.

## 미리보기 사이드바로 블루프린트 테스트

진행 중인 블루프린트가 지원하는 검색 결과를 검토하는 데 유용한 미리보기 사이드바가 있습니다. 블루프린트 편집 화면에서 _미리보기_ 버튼을 클릭하여 미리보기에 액세스하세요.

![Preview a Blueprint before putting it in action.](./creating-and-managing-search-blueprints/images/14.png)

여기에서 다음 기능에 액세스할 수 있습니다.

- 7.4 U52+의 경우 _View Raw Request_를 클릭하면 전체 검색 요청 문자열을 볼 수 있습니다. 원시 요청 모달에서 요청을 클립보드에 복사하거나 JSON 파일로 다운로드할 수 있습니다. 이는 검색 페이지의 [Search Insights](../../../search-pages-and-widgets/search-insights.md) 위젯에 표시되는 것과 동일한 요청입니다.

- 전체 검색 응답 문자열을 보려면 _원시 응답 보기_를 클릭하세요. 여기에서 응답을 클립보드에 복사하거나 JSON 파일로 다운로드할 수 있습니다. 이는 검색 페이지의 [Search Insights](../../../search-pages-and-widgets/search-insights.md) 위젯에 표시되는 것과 동일한 문자열입니다.

  ![View the raw response string returned from Elasticsearch.](./creating-and-managing-search-blueprints/images/11.png)

- 각 결과의 점수는 결과 제목 왼쪽에 표시됩니다. 점수 설명을 보려면 점수를 클릭하세요.

  ![View the score explanation for a result.](./creating-and-managing-search-blueprints/images/12.png)

- 결과를 확장하고 반환된 문서의 모든 필드를 보려면 결과 제목 오른쪽에 있는 오른쪽 꺾쇠 괄호를 클릭하세요.

  ![Inspect the document's fields.](./creating-and-managing-search-blueprints/images/13.png)

[일부 요소](./search-blueprints-elements-reference.md) 은 수동으로 제공하거나 재정의할 수 있는 검색 컨텍스트 속성을 읽습니다. 이러한 요소로 블루프린트를 테스트하려면 톱니바퀴 아이콘(![기어](../../../../images/icon-cog3.png))을 클릭하여 블루프린트 미리보기 검색에 검색 컨텍스트 속성을 추가하세요. 속성의 키/값 쌍을 입력한 다음 _완료_를 클릭합니다. 이 속성은 블루프린트 미리보기에만 설정되며 블루프린트 자체에는 저장되지 않습니다. 검색 페이지에서 이러한 속성을 구성할 수 있습니다. 자세한 내용은 [검색 페이지에서 검색 청사진 사용](./using-a-search-blueprint-on-a-search-page.md) 을 참조하세요.

예를 들어,

1. _administrative_라는 카테고리 [있는 새로운](../../../../content-authoring-and-management/tags-and-categories.md) 어휘를 추가합니다.

1. 두 개의 새로운 [웹 콘텐츠 기사](../../../../content-authoring-and-management/web-content/web-content-articles.md) 을 추가합니다. 제목 필드에 둘 다 _test_가 있는지 확인하세요. 그 중 하나를 생성한 카테고리에 연결하세요.

1. 새 Blueprint를 생성하고 조건부 요소 _게스트 사용자에 대한 범주의 콘텐츠 숨기기_를 추가합니다. 생성한 카테고리에 대한 자산 카테고리 ID가 필요하지만 미리보기 창에서 찾을 수 있습니다.

1. 미리보기에서 _administrative_를 검색하세요. 카테고리가 있는 웹 콘텐츠 기사의 문서를 확장한 다음 'assetCategoryId'(예: 43013)를 찾으세요.

1. 요소 구성에서 ID를 사용하십시오.

1. 미리보기 사이드바의 _속성_을 열고 다음을 입력하세요.

   키: `user.is_signed_in`

   값: `거짓`

1. _완료_를 클릭한 다음 _test_에 대한 검색어를 입력하세요.

이제 분류되지 않은 웹 콘텐츠 기사만 반환됩니다. 다른 하나는 검색 사용자가 게스트인 것처럼 검색이 작동하도록 하는 검색 컨텍스트 속성으로 인해 숨겨졌습니다.

이 예에서는 컨텍스트 변수 `user.is_signed_in`을 읽는 요소를 사용합니다. 값을 수동으로 설정하면 블루프린트가 특정 동작을 보여줄 수 있도록 기존 값을 덮어쓰게 됩니다. 검색 컨텍스트에 값이 이미 존재하므로 수동으로 설정하는 것은 선택 사항입니다. 다른 요소에는 일반 검색 요청의 컨텍스트 내에 존재하지 않는 필수 맞춤 매개변수가 있습니다. 미리보기 사이드바에서 블루프린트를 테스트하든, 검색 페이지에서 사용할 블루프린트를 설정하든, 요소/블루프린트가 제대로 작동하려면 검색 컨텍스트에 수동으로 전달해야 합니다.

## 외부 참조 코드(ERC) 설정

{bdg-secondary}`liferay 2023.Q4+/GA102+`

편집 가능한 ERC를 통해 청사진을 참조할 수 있으며 가능하면 이를 권장합니다. 편의를 위해 ERC를 기억하기 쉽고 사람이 읽을 수 있는 것으로 설정할 수 있습니다. 블루프린트 편집기에서 ERC 옆에 있는 _Edit_ ![편집](../../../../images/icon-edit-pencil.png)을 클릭합니다.

![Edit the ERC to be memorable and readable.](./creating-and-managing-search-blueprints/images/15.png)

사람이 읽을 수 있는 이 ERC는 검색 페이지 [또는](../../../developer-guide/search-headless-apis.md) 리스 검색 요청 [에서 청사진](./using-a-search-blueprint-on-a-search-page.md) 설정할 때 유용합니다.

## 다음

* [검색 페이지에서 검색 청사진 사용](./using-a-search-blueprint-on-a-search-page.md)
