# 검색 Blueprint 생성 및 관리

전역 메뉴의 응용 프로그램 섹션 &rarr; 검색 경험에서 [검색 청사진](./understanding-search-blueprints.md) 을 생성할 수 있습니다. 청사진이 이미 있고 Liferay [검색 페이지](../../../search-pages-and-widgets/working-with-search-pages.md)에서 그 기능을 적용하려면 [검색 페이지에서 검색 청사진 사용](./using-a-search-blueprint-on-a-search-page.md)참조하십시오.

검색 청사진을 만들려면

1. 전역 메뉴 &rarr; 애플리케이션(검색 경험)에서 **청사진** 클릭하여 청사진 애플리케이션을 엽니다.

1. **추가**(![Add](../../../../images/icon-add.png))을 클릭하여 청사진을 추가합니다.

   ![청사진 추가 모달 창에서 청사진 생성을 시작합니다.](./creating-and-managing-search-blueprints/images/01.png)

1. 새 검색 청사진 창에서 청사진에 이름(필수)과 설명(선택 사항)을 지정합니다.

1. Blueprint 계획에 따라 다음 메뉴를 사용하여 [Blueprint](./understanding-search-blueprints.md#what-is-a-blueprint) 빌드를 계속합니다.

   - [Query Builder](#using-the-query-builder) : Query Elements 섹션에서 Blueprint에 대한 요소를 선택하거나 구성하여 검색에 새 쿼리 절을 추가합니다. 쿼리 설정 섹션에서 쿼리에 대한 추가 설정(예: 검색할 자산 및 개체 유형)을 구성합니다.

   - [구성](#adding-configurations) : 검색에서 고급 설정(예: 정렬 또는 집계)을 구성합니다.

1. Blueprint를 빌드하고 구성하면서 테스트합니다. **미리보기** 클릭하고 검색어를 입력하세요.

   ![실행하기 전에 Blueprint를 미리 봅니다.](./creating-and-managing-search-blueprints/images/02.png)

   자세한 내용은 [청사진 테스트](#testing-a-blueprint-with-the-preview-sidebar) 참조하십시오.

1. 초기 Blueprint 생성이 완료되면 **저장** 클릭합니다.

블루프린트 생성 프로세스는 빠르고 간단할 수 있지만 때때로 반복 및 테스트가 필요합니다. 작업이 보존되도록 Blueprint를 자주 저장해야 합니다.

작업 메뉴(![Actions](../../../../images/icon-actions.png))에서 청사진을 편집하거나 삭제합니다.

검색 청사진을 [가져오고](#importing-and-exporting-blueprints) 내보낼 수도 있습니다.

![작업 메뉴에서 Blueprint를 편집, 삭제 또는 내보냅니다.](./creating-and-managing-search-blueprints/images/03.png)

## 쿼리 작성기 사용

쿼리 빌더를 사용하여

1. [Blueprint](#adding-elements-to-the-blueprint) 에 요소를 추가합니다.

1. [검색할 Liferay 자산 선택](#choosing-which-liferay-assets-to-search) .

### 청사진에 요소 추가

청사진에 쿼리 절을 추가하기 시작하려면 요소를 추가하십시오.

1. 쿼리 요소 화면에서 **추가**(![Add](../../../../images/icon-add.png))을 클릭하여 쿼리 요소 추가 사이드바를 엽니다.

   ![Blueprint에 요소를 추가합니다.](./creating-and-managing-search-blueprints/images/04.png)

1. 탐색하려는 요소 범주를 확장합니다.

1. 요소 위로 마우스를 가져간 다음 **추가** 클릭합니다.

1. 구성할 준비가 된 요소가 쿼리 빌더에 추가됩니다.

   ![이 요소는 검색 사용자가 회원인 사이트에서 찾은 콘텐츠에 10의 부스트를 제공합니다.](./creating-and-managing-search-blueprints/images/05.png)

1. 원하는 만큼 검색 쿼리를 구성하는 데 필요한 만큼 요소를 추가합니다.

   즉시 사용 가능한 각 요소에 대한 설명은 [청사진 요소 참조 검색](./search-blueprints-elements-reference.md) 을 참조하십시오.

1. 사용자 지정 요소가 필요한 경우 사용자 지정 JSON 요소를 쿼리 빌더에 추가하고 필요한 쿼리 절을 작성합니다.

   사용자 지정 JSON 요소 구축에 대해 알아보려면 [요소 생성](./creating-and-managing-elements/creating-elements.md) 참조하세요.

```{important}
일부 요소는 쿼리 빌더의 청사진에 추가하는 것보다 더 많은 작업이 필요합니다. 예를 들어 Boost Longer Contents 요소 또는 Boost Contents with More Versions 요소를 사용하려면 Control Panel &rarr; Search &rarr; Index Actions에서 다음 항목을 다시 인덱싱해야 합니다.


* `com.liferay.blogs.model.BlogsEntry`
* `com.liferay.document.library.kernel.model.DLFileEntry`
* `com.liferay.journal.model.JournalArticle`
* `com.liferay.knowledge.base.model.KBArticle`
* `com.liferay .wiki.model.WikiPage`

지리적 사이트 기능을 제공하는 요소(예: Boost Proximity)와 같은 기타 요소에는 추가 설정이 필요합니다. 자세한 내용은 [요소 참조](./search-blueprints-elements-reference.md)를 참조하세요.
```

요소를 추가한 후 청사진을 저장해야 합니다.

### 검색할 Liferay 자산 선택

청사진 쿼리에 포함할 Liferay 자산 유형을 결정합니다. 쿼리 설정 사용 &rarr; 검색 가능한 유형:

![검색 가능 유형 드롭다운을 확장하여 검색 청사진에서 자산 제거를 시작합니다.](./creating-and-managing-search-blueprints/images/06.png)

- 모든 자산 및 개체 유형이 기본적으로 선택됩니다.
- 특정 유형을 제거하려면 **자산 유형 선택** 클릭하여 유형 선택을 연 다음 해당 확인란을 선택 취소합니다.

![유형 선택 모달은 검색할 자산의 일괄 관리에 사용됩니다.](./creating-and-managing-search-blueprints/images/07.png)

```{note}
검색 가능한 유형 모달에서 모든 자산을 선택 취소하는 것은 모든 유형을 선택하는 것과 동일합니다. 모든 자산 및 객체 유형이 검색됩니다. 대부분의 Liferay 검색 절 비활성화에 대해 알아보려면 [쿼리 절 기여자 구성](#advanced-configuring-query-clause-contributors) 을 참조하십시오.
```

검색 가능한 유형 구성을 편집한 후에는 항상 Blueprint를 저장하십시오.

검색 가능한 유형 구성에서 자산 유형을 비활성화하면 인덱싱 코드에서 일반적으로 기여하는 쿼리 절이 제외됩니다. 유형은 검색할 수 없으며 Blueprint가 검색에 적용될 때 최종 사용자는 제외된 유형의 결과를 볼 수 없습니다.

검색 가능한 유형 구성에는 다른 절 기여자 구성 옵션에 대한 중요한 의미가 있으므로 자세한 내용은 아래에 나와 있습니다.

### 고급: 쿼리 절 기여자 구성

Liferay의 백엔드 코드(및 잠재적으로 Liferay 인스턴스에 배포된 모든 사용자 지정 애플리케이션)는 진행 중인 검색에 쿼리 절을 제공합니다.

백엔드에서 제공하는 이러한 조항은 검색 청사진을 통해 구성할 수 있습니다. 그러나 대부분의 사용자는 다음 두 가지 설정을 건드리면 안 됩니다.

- 검색 프레임웍 인덱서 조항
- 검색 프레임웍 쿼리 공헌자

일반적으로 기본 설정으로 충분합니다. [Searchable Types](#choosing-which-liferay-assets-to-search) 을 사용하는 것 이상으로 이 동작을 조정해야 한다면 이러한 백엔드 기여자가 작동하는 방식을 이해해야 합니다.

1. **검색 가능 유형** 을 사용하여 개별 인덱서가 검색에 참여하지 않도록 합니다. 유형의 인덱서를 비활성화하면 해당 쿼리 기여자를 선택하더라도 해당 유형에 대한 절이 검색 쿼리에 추가되지 않습니다. 이러한 유형에 대한 결과는 사용자에게 표시되지 않습니다.

1. **검색 프레임워크 인덱서 조항** 사용하여 모든 Liferay의 인덱서가 검색에 기여하는 조항을 비활성화합니다. 모든 인덱서를 비활성화하는 유일한 이유는 처음부터 검색 쿼리를 작성하여 모든 쿼리 기여자와 검색 가능한 자산도 비활성화하기 위해서입니다.

1. **검색 프레임워크 쿼리 기여자** 섹션을 사용하여 검색에 참여하는 특정 기여자를 제거합니다. 자신의 청사진 구성을 사용하여 재정의하려는 경우 특정 조항 기여자를 비활성화하거나 Liferay의 검색 동작을 완전히 재정의하여 Liferay의 인덱서 및 검색 가능한 유형도 비활성화하기 위해 모든 조항을 비활성화합니다.

```{important}
* 모든 인덱서 및 쿼리 기여자를 비활성화하더라도 특정 필수 조항은 항상 Liferay의 검색 프레임워크에 의해 추가됩니다. 따라서 Blueprint를 사용하여 처음부터 진정으로 쿼리를 작성하는 것은 아닙니다.

* Liferay의 인덱서 프레임워크는 Liferay 7.2에서 리팩토링되었습니다. 웹 콘텐츠 기사 및 폴더와 같은 일부 Liferay의 핵심 자산은 새 패턴으로 업데이트되지 않았습니다. 이는 이러한 자산에 대한 쿼리 기여자가 없기 때문에 검색 청사진에 영향을 미칩니다. 따라서 Liferay 인덱서 조항이 활성화되면 자산에 대한 표준 조항이 항상 검색 쿼리에 추가됩니다. 따라서 웹 콘텐츠 기사의 조항을 완전히 재정의하는 것은 불가능합니다. 그러나 위에 더 많은 조항을 계층화하여(예: 특정 조항 일치 부스트) 이러한 자산의 검색 동작을 조정할 수 있습니다.

* 내부 제한으로 인해 Liferay의 모든 `인덱서`를 활성화 또는 비활성화하도록 선택해야 합니다. 다른 조항 제공자는 보다 유연하게 관리할 수 있습니다. 모두 포함하거나 포함하지 않거나 원하는 제공자의 하위 집합을 포함하도록 선택합니다.

![특정 조항 기여자 또는 검색 쿼리에 기여하는 조항의 모든 인덱서를 비활성화합니다.](./creating-and-managing-search-blueprints/images/08.png)
```

절 기여자 또는 인덱서 동작을 편집할 때 청사진을 저장해야 합니다.

## 구성 추가

검색 쿼리를 미세 관리하는 것 외에도 Search Blueprint 설정을 추가하고 다음에 대한 JSON 구성을 추가합니다.

- 집계
- 하이라이트
- 정렬
- 매개 변수
- 고급 구성

![추가 설정은 JSON을 사용하여 구성할 수 있습니다.](./creating-and-managing-search-blueprints/images/09.png)

이를 추가하려면 **구성** 탭을 클릭한 다음 원하는 구성에 대한 텍스트 입력 상자를 찾으십시오. JSON을 입력한 다음 Blueprint를 저장합니다.

다음은 검색 결과를 `이름` 필드를 기준으로 내림차순(알파벳 역순-ZA)으로 정렬하는 Sort의 예입니다.

```json
{
    "sorts": [
        {
            "title_sortable": "desc"
        }
    ]
}
```

자세한 내용은 [검색 청사진 구성 참조](./search-blueprints-configuration-reference.md)을 참조하십시오.

## Blueprint 가져오기 및 내보내기

청사진은 JSON 객체입니다. 한 환경에서 Blueprint의 JSON을 내보내고 다른 환경으로 가져옵니다. 이는 스테이징 및 테스트 환경에서 생산 환경으로 청사진을 가져올 때 유용할 수 있습니다.

청사진 JSON을 내보내려면

1. 전역 메뉴 &rarr; 애플리케이션 &rarr; 청사진(검색 경험 섹션)에서 청사진 애플리케이션을 엽니다.

1. 청사진 목록에서 청사진의 **작업**(![Actions](../../../../images/icon-actions.png)) 메뉴를 열고 **내보내기** 클릭합니다.

청사진의 JSON 정의를 가져오려면

1. 전역 메뉴 &rarr; 애플리케이션 &rarr; 청사진(검색 경험 섹션)에서 청사진 애플리케이션을 엽니다.

1. 메인 Blueprints **Actions**(![Actions](../../../../images/icon-actions.png)) 메뉴를 열고 **Import** 클릭합니다.

1. 유효한 청사진 JSON 파일을 선택하세요. 유효한 요소 JSON 파일도 이 화면에서 가져올 수 있습니다.

   ![청사진 및 요소 가져오기.](./creating-and-managing-search-blueprints/images/10.png)

1. **가져오기** 클릭합니다.

## 미리보기 사이드바로 청사진 테스트

진행 중인 Blueprint에서 지원하는 검색 결과를 검토하는 데 편리한 미리보기 사이드바가 있습니다. 청사진 편집 화면에서 **미리보기** 버튼을 클릭하여 미리보기에 액세스합니다.

![실행하기 전에 Blueprint를 미리 봅니다.](./creating-and-managing-search-blueprints/images/14.png)

여기에서 다음 기능에 액세스할 수 있습니다.

- 7.4 U52+의 경우 전체 검색 요청 문자열을 보려면 **원시 요청 보기** 클릭하십시오. 원시 요청 모달에서 요청을 클립보드에 복사하거나 JSON 파일로 다운로드할 수 있습니다. 이것은 검색 페이지의 [검색 인사이트](../../../search-pages-and-widgets/search-insights.md) 위젯에 표시되는 것과 동일한 요청입니다.

- 전체 검색 응답 문자열을 보려면 **원시 응답 보기** 클릭하십시오. 여기에서 응답을 클립보드에 복사하거나 JSON 파일로 다운로드할 수 있습니다. 이는 검색 페이지의 [검색 인사이트](../../../search-pages-and-widgets/search-insights.md) 위젯에 표시되는 것과 동일한 문자열입니다.

   ![Elasticsearch에서 반환된 원시 응답 문자열을 봅니다.](./creating-and-managing-search-blueprints/images/11.png)

- 각 결과의 점수는 결과 제목 왼쪽에 나타납니다. 점수 설명을 보려면 점수를 클릭하십시오.

   ![결과에 대한 점수 설명을 봅니다.](./creating-and-managing-search-blueprints/images/12.png)

- 결과를 확장하고 반환된 문서의 모든 필드를 보려면 결과 제목 오른쪽에 있는 오른쪽 꺽쇠 괄호를 클릭하십시오.

   ![문서의 필드를 검사합니다.](./creating-and-managing-search-blueprints/images/13.png)

[일부 요소](./search-blueprints-elements-reference.md) 수동으로 제공하거나 재정의할 수 있는 검색 컨텍스트 특성을 읽습니다. 이러한 요소로 Blueprint를 테스트하려면 톱니바퀴 아이콘(![Gear](../../../../images/icon-cog3.png))을 클릭하여 Blueprint 미리보기 검색에 검색 컨텍스트 속성을 추가합니다. 속성에 대한 키/값 쌍을 입력한 다음 **완료** 클릭하십시오. 참고로 이 속성은 블루프린트 미리보기에만 설정되며 블루프린트 자체에는 저장되지 않습니다. 검색 페이지에서 이러한 속성을 구성할 수 있습니다. 자세한 내용은 [검색 페이지에서 검색 청사진 사용](./using-a-search-blueprint-on-a-search-page.md) 을 참조하십시오.

예를 들어,

1. **administrative** 라는 새 [카테고리가 있는 어휘](../../../../content-authoring-and-management/tags-and-categories.md)를 추가합니다.

1. 두 개의 새로운 [웹 콘텐츠 기사](../../../../content-authoring-and-management/web-content/web-content-articles.md)를 추가합니다. 둘 다 제목 필드에 **test** 가 있는지 확인하십시오. 그 중 하나를 생성한 범주에 연결합니다.

1. 새 청사진을 만들고 Conditional Element **Hide Contents in a Category for Guest Users** 을 추가합니다. 생성한 카테고리에 대한 자산 카테고리 ID가 필요하지만 미리보기 창에서 찾을 수 있습니다.

1 미리보기에서 **관리** 검색합니다. 범주가 있는 웹 콘텐츠 문서의 문서를 확장한 다음 `assetCategoryId` (예: 43013)을 찾습니다.

1. 요소 구성에서 ID를 사용하십시오.

1. 미리보기 사이드바의 **속성** 열고 다음을 입력합니다.
  
  키: `user.is_signed_in`
  
  값: `거짓`

1. **완료** 를 클릭한 다음 **test** 를 검색하십시오.

이제 분류되지 않은 웹 콘텐츠 기사만 반환됩니다. 다른 하나는 검색 사용자가 게스트인 것처럼 검색을 작동하게 하는 검색 컨텍스트 특성 때문에 숨겨졌습니다.

이 예제에서는 컨텍스트 변수 `user.is_signed_in`을 읽는 요소를 사용합니다. 값을 수동으로 설정하면 블루프린트가 특정 동작을 시연할 수 있도록 기존 값을 덮어씁니다. 값이 검색 컨텍스트에 이미 존재하므로 수동으로 설정하는 것은 선택 사항입니다. 다른 요소에는 일반 검색 요청 컨텍스트 내에 존재하지 않는 필수 맞춤 매개변수가 있습니다. 미리보기 사이드바에서 블루프린트를 테스트하든 검색 페이지에서 사용할 블루프린트를 설정하든 요소/블루프린트가 제대로 작동하려면 검색 컨텍스트에 수동으로 전달해야 합니다.

## 다음

- [검색 페이지에서 검색 청사진 사용](./using-a-search-blueprint-on-a-search-page.md)
