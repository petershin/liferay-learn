# 콘텐츠 검색 중

색인이 생성된 모든 콘텐츠(일명 Liferay DXP의 **assets**)을 검색 결과로 반환할 수 있습니다. [사용자 정의 콘텐츠도 색인화할 수 있습니다](https://help.liferay.com/hc/ko/articles/360032260612-Model-Entity-Indexing-Framework) . 따라서 설치에는 포함된 자산 유형 외에 추가 자산 유형이 있을 수 있습니다. 기본적으로. 다음 이미지는 Liferay DXP에서 인덱싱되는 다양한 콘텐츠 유형의 예를 보여줍니다.

![If these apps are deployed, their content is searchable by default.](./searching-for-content/images/08.png)

## 검색창 사용

기본 Liferay DXP 설정을 사용하면 사용자는 검색 창에 검색어를 입력하여 검색에 참여할 수 있습니다. 검색을 실행하면 다양한 검색 위젯이 배포된 [검색 페이지](../search-pages-and-widgets/working-with-search-pages/search-pages.md)로 이동됩니다.

![The default search configuration displays a search bar in its default view, beckoning users to enter the search context.](./searching-for-content/images/01.png)

### 검색어 입력

Liferay의 검색 인프라는 지원되는 검색 엔진( [Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/full-text-queries.html) 및 [Solr](http://lucene.apache.org/solr/features.html) ).

전체 텍스트 검색은 검색 쿼리(예: **stock market**)에 입력된 모든 단어를 각 색인 문서의 모든 단어와 비교합니다. Elasticsearch와 같은 검색 엔진은 관련성 점수를 계산하여 최상의 결과가 먼저 반환되도록 합니다(예: 최근 강세장에 대한 블로그 항목). **stock** 또는 **market** 과 같은 단어가 포함된 모든 항목이 반환됩니다.

전체 텍스트 검색 외에도 고급 검색 구문이 지원됩니다. 기본 검색 엔진이 정확한 동작을 결정하므로 [Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/7.6/query-dsl-simple-query-string-query.html) 또는 [Solr]참조하세요. 자세한 내용은 (https://lucene.apache.org/solr/guide/7_0/query-syntax-and-parsing.html) 문서를 참조하세요.

![Search for text in a specific field using Elasticsearch's Query String syntax.](./searching-for-content/images/02.png)

### 검색창 제안: 사용자 유형에 따른 검색

{bdg-secondary}`7.4 U36+ 및 GA36+`

최신 Liferay 7.4에서는 기본적으로 검색 창에서 사용자가 검색 문구를 입력할 때 검색 제안을 제공합니다.

![Search Bar Suggestions returns preliminary results as the user types a search phrase into the Search Bar.](./searching-for-content/images/11.png)

작동 방식에 대한 자세한 내용은 [검색창 제안](../search-pages-and-widgets/search-bar-suggestions.md)을 참조하세요.

### 인용 검색

검색창 쿼리를 따옴표로 묶으면 검색 엔진이 더 엄격하게 일치하는 항목을 생성하게 됩니다. 정확한 동작은 검색되는 필드 유형에 따라 다릅니다.

#### 인용된 전문 검색: 일치 순서 보장

검색 창 쿼리를 따옴표로 묶으면 검색된 용어가 정확히 동일한 순서로 나타나는 경우에만 필드와 일치합니다. 인덱싱된 콘텐츠와 검색 문구에 대한 분석이 여전히 이루어지기 때문에 검색 엔진은 인용된 문구를 정확하게 일치시키지 않습니다.

'content' 필드에 다음 텍스트가 포함된 블로그 항목을 생각해 보세요.

> 적극적인 협업을 보장하기 위한 상생 생존 전략을 마련하세요.

기본 영어 분석기를 사용하면 검색 구문 **"strategy that presents"** 가 이 블로그 항목을 반환합니다. 형태소 분석, 불용어 제거 및 기타 토큰화를 고려하여 검색 키워드와 색인화된 텍스트에 대해 동일한 분석이 수행됩니다. 문구를 인용하면 문구의 개별 토큰이 서로에 대한 상대적 사이트를 포함하여 색인화된 문서 필드의 토큰과 일치하도록 강제됩니다.

반면에 검색 키워드 **"전략 보장"** 을 입력하면 위의 블로그 항목 문서가 반환되지 않습니다. 왜냐하면 분석을 통해 생성된 토큰의 상대적 사이트가 검색 키워드와 색인된 콘텐츠 간에 다르기 때문입니다.

![Enclose search terms in quotes to enforce that the token order matches in returned content.](./searching-for-content/images/04.png)

#### 인용 키워드 검색: 정확한 구문 매칭

분석되지 않은 필드(예: 키워드 필드)를 검색하는 경우 인용된 검색 문구와 필드 값이 정확히 일치해야 합니다.

일반 Liferay 검색에서는 분석된 필드와 분석되지 않은 필드가 모두 인덱스 문서에 있습니다. 분석되지 않은 필드는 콘텐츠가 인용된 검색 문구와 정확히 일치하는 경우에만 결과를 생성하는 반면, 분석된 필드는 해당 토큰이 인용된 검색 문구의 토큰과 일치하고 동일한 상대 사이트에 표시되는 한 결과를 생성합니다.

### 접두사 검색

접두사 검색을 사용하여 **instrument** 라는 용어를 검색하면 전체 단어뿐만 아니라 **instrument** 가 접두사로 포함된 변형도 포함하는 문서가 반환됩니다. 예를 들어 **instrumental** , **instrumentation** 이 포함된 결과도 반환됩니다.

![Searching for "lever" also returns "leverage" and "leveraging".](./searching-for-content/images/03.png)

```{note}
접두사 검색은 기본적으로 다양한 필드에 대해 사용할 수 있지만 내부적으로는 더 복잡합니다. 현장에서 사용되는 분석기와 수행된 변환을 포함한 필드 매핑의 세부 사항에 따라 최종 동작이 결정됩니다.
```

사용자에게 결과를 표시하는 또 다른 방법은 [검색 제안](../search-pages-and-widgets/search-results/enabling-search-suggestions.md)을 이용하는 것입니다.

### 검색창 구성

검색 표시줄의 동작은 위젯 구성 화면을 통해 구성할 수 있습니다. 구성 옵션은 디스플레이 설정, 제안 구성 또는 고급 구성으로 분류됩니다.

![Configure the search bar behavior in its configuration screen.](./searching-for-content/images/05.png)

```{note}
한 페이지 상단에 전체적으로 포함된 검색 창 위젯을 구성하면 사이트의 모든 페이지에 페이지 상단 검색 창 위젯이 구성됩니다. 또한 [대상 검색 페이지](../search-pages-and-widgets/working-with-search-pages/search-pages.md) 검색 표시줄 위젯이 다르게 구성된 경우 이를 재정의합니다. 그러나 다른 페이지에 수동으로 배치된 검색 표시줄 위젯은 재정의되지 않습니다.
```

#### 전시 조정

**표시 템플릿:** 스타일을 지정하는 [위젯 템플릿](../../site-building/displaying-content/additional-content-display-options/styling-widgets-with-widget-templates.md)을 선택합니다. 검색창. 기본적으로 사용할 수 있는 대체 템플릿은 왼쪽 정렬 아이콘 레이아웃입니다. [검색창 제안](../search-pages-and-widgets/search-bar-suggestions.md)을 사용하는 경우 기본 표시 템플릿을 사용해야 합니다.

**키워드 매개변수 이름:** 검색에 입력된 키워드에 대한 매개변수 이름을 편집합니다. 예를 들어 키워드 용어 **data** 를 검색할 때 기본 URL은 다음과 같습니다.

```
http://localhost:8080/web/guest/search?q=data
```

키워드 매개변수 이름을 **keyword** 로 변경하면 다음과 같습니다.

```
http://localhost:8080/web/guest/search?keyword=data
```

**범위:** 이 사이트(기본값), 전체, 사용자 선택의 세 가지 옵션 중에서 선택합니다. **이 사이트** 는 검색이 실행된 사이트와 관련된 자산만 검색한다는 의미입니다. **Everything** 을 선택하여 검색 범위를 모든 사이트로 확장합니다. 사용자가 검색할 범위를 선택할 수 있도록 하려면 **사용자가 선택하도록 허용** 을 선택하세요.

![Let the user choose which scope the search is executed for.](./searching-for-content/images/06.png)

**범위 매개변수 이름:** 검색이 수행되는 범위에 대한 URL 매개변수 이름을 설정합니다. 이 매개변수는 **사용자 선택 허용** 범위가 선택된 경우에만 URL에 나타납니다. 기본값은 **scope** 이므로 **data** 라는 단어를 검색하면 다음의 기본 URL이 생성됩니다.

```
http://localhost:8080/web/guest/search?q=data&scope=this-site
```

**scope** 를 **target** 으로 변경하면 다음 URL이 생성됩니다.

```
http://localhost:8080/web/guest/search?q=data&target=this-site
```

**대상 페이지:**[검색 페이지](../search-pages-and-widgets/working-with-search-pages/search-pages.md)에 대한 친숙한 URL을 제공합니다. 구성되지 않았거나 존재하지 않는 페이지를 가리키는 경우 검색 창을 구성해야 사용자에게 표시된다는 메시지가 관리자에게 나타납니다.

#### 제안 구성

[검색 창 제안](../search-pages-and-widgets/search-bar-suggestions.md)이 사용 가능하고 활성화된 경우 검색 창 위젯 구성에 추가 구성이 나타납니다. 이러한 구성 옵션을 이해하려면 [검색 창 제안 구성](../search-pages-and-widgets/search-bar-suggestions/configuring-search-bar-suggestions.md)을 참조하세요.

#### 고급 설정

**고급 검색 구문 사용:** Elasticsearch를 사용하는 경우 이를 활성화하면 사용자가 [쿼리 문자열 구문](https://www.elastic.co/guide/en/elasticsearch/reference/7.6/query-dsl-simple) 을 입력할 수 있습니다. -query-string-query.html)을 검색창에 추가하세요. Solr를 사용하는 경우 [적절한 구문](https://lucene.apache.org/solr/guide/7_0/query-syntax-and-parsing.html) 에 대한 설명서를 참조하세요.

**단계화된 사이트의 결과 표시:**[준비 환경](../../site-building/publishing-tools/staging.md)의 콘텐츠는 [검색할 수 없습니다](../search-pages-and- 이 설정에 관계없이 라이브 사이트의 widgets/search-results/search-results-behavior.md#search-and-staging) . 이 설정을 사용하면 로컬 준비가 활성화된 사이트에서 Everything 범위가 구성된 경우 다른 로컬 준비 사이트의 콘텐츠를 검색할 수 있습니다.

## Liferay 객체 검색

Liferay 7.4에는 GUI 기반 애플리케이션 구축 프레임워크인 [Liferay Objects](../../building-applications/objects.md)가 포함되어 있습니다. 각 개체 정의의 필드는 검색 가능으로 선언될 수 있습니다. 그런 다음 개체 항목(애플리케이션 사용자가 제출한 레코드)을 쿼리하고 검색 결과 위젯에 반환할 수 있습니다.

```{important}
객체의 범위에 따라 검색 방법이 결정됩니다.

* 개체의 범위가 회사인 경우 검색창이 모든 항목을 검색하도록 구성된 경우에만 개체의 항목이 검색됩니다.
* 개체의 범위가 사이트인 경우 검색창을 이 사이트에서 검색하도록 구성하면 개체의 항목을 검색할 수 있습니다.
```

Type Facet 및 검색 결과 위젯은 다음 방식으로 Liferay 개체 검색을 지원합니다.

- Type Facet에는 게시된 개체가 자동으로 포함됩니다.

  ![Published Objects are added to the Type Facet widget.](./searching-for-content/images/09.png)

- 검색 결과 위젯은 개체 항목의 제목과 요약을 자동으로 표시합니다.

  ![A title and a content summary are displayed for Object Entries.](./searching-for-content/images/10.png)

Liferay 7.4 U64+/GA64+의 경우 검색 결과에서 개체 항목을 클릭하면 해당 항목의 [표시 페이지](../../building-applications/objects/displaying-object-entries.md#creating-display-page-templates-for-objects) 로 리디렉션됩니다.

## 관련 주제

* [검색결과 이해](../search-pages-and-widgets/search-results/search-results-behavior.md)
* [검색 제안 활성화](../search-pages-and-widgets/search-results/enabling-search-suggestions.md)
