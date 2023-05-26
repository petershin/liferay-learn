# 콘텐츠 검색

색인이 생성된 모든 콘텐츠(일명 Liferay DXP에서 자산 **개**)가 검색 결과로 반환될 수 있습니다. [사용자 지정 콘텐츠도 인덱싱할 수 있으므로](https://help.liferay.com/hc/ko/articles/360032260612-Model-Entity-Indexing-Framework) 설치 시 기본적으로 포함된 자산 유형 외에 추가 자산 유형이 있을 수 있습니다. 다음 이미지는 Liferay DXP에서 인덱싱되는 다양한 콘텐츠 유형의 예를 보여줍니다.

![이러한 앱이 배포되면 기본적으로 해당 콘텐츠를 검색할 수 있습니다.](./searching-for-content/images/08.png)

## 검색창 사용

기본 Liferay DXP 설정을 사용하여 사용자는 검색창에 검색어를 입력하여 검색에 참여할 수 있습니다. 검색을 실행하면 다양한 검색 위젯이 배포된 [검색 페이지](../search-pages-and-widgets/working-with-search-pages/search-pages.md) 로 이동합니다.

![기본 검색 구성은 기본 보기에 검색 표시줄을 표시하여 사용자가 검색 컨텍스트에 들어가도록 손짓합니다.](./searching-for-content/images/01.png)

### 검색어 입력

Liferay의 검색 인프라는 지원되는 검색 엔진( [Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/full-text-queries.html) 및 [Solr](http://lucene.apache.org/solr/features.html) )에 의해 구현된 전체 텍스트 검색을 지원합니다.

전체 텍스트 검색은 검색 쿼리에 입력된 모든 단어(예: **stock market**)를 각 색인 문서의 모든 단어와 비교합니다. Elasticsearch와 같은 검색 엔진은 관련성 점수를 계산하여 최상의 결과가 먼저 반환되도록 합니다(예: 최근 강세장에 대한 블로그 항목). **stock** 또는 **market** 과 같은 단어가 포함된 모든 항목이 반환됩니다.

전체 텍스트 검색 외에도 고급 검색 구문이 지원됩니다. 기본 검색 엔진이 정확한 동작을 결정하므로 자세한 내용은 [Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/7.6/query-dsl-simple-query-string-query.html) 또는 [Solr](https://lucene.apache.org/solr/guide/7_0/query-syntax-and-parsing.html) 설명서를 참조하십시오.

![Elasticsearch의 쿼리 문자열 구문을 사용하여 특정 필드에서 텍스트를 검색합니다.](./searching-for-content/images/02.png)

### 검색창 제안: 사용자 유형으로 검색

{bdg-secondary}`7.4 U36+ 및 GA36+`

최신 Liferay 7.4의 기본 제공 검색 표시줄은 사용자가 검색 구문을 입력할 때 검색 제안을 제공합니다.

![검색창 제안은 사용자가 검색창에 검색어를 입력할 때 예비 결과를 반환합니다.](./searching-for-content/images/11.png)

작동 방식에 대한 자세한 내용은 [검색 표시줄 제안](../search-pages-and-widgets/search-bar-suggestions.md)을 참조하세요.

### 정확한 구문 일치: 인용 검색

사용자가 검색어(예: **agile frameworks**)가 입력한 대로 정확한 구문으로 결과만 생성하기를 원하는 경우 어떻게 합니까? 일반 전체 텍스트 검색에서 **agile frameworks** 검색하면 **agile** 및 **frameworks** 라는 용어만 포함하는 검색 결과와 두 용어를 모두 포함하지만 다른 텍스트로 구분된 히트, 정확한 구 일치가 포함된 결과가 반환됩니다. 정확한 구가 포함된 적중만 반환되도록 하려면 따옴표로 묶습니다: **"agile frameworks"** .

![검색어를 따옴표로 묶어 정확한 구문 일치를 검색합니다.](./searching-for-content/images/04.png)

### 접두사 검색

접두사 검색을 사용하여 용어 **악기** 검색하면 전체 단어를 포함하는 문서뿐만 아니라 접두사로 **악기** 포함된 변형도 반환됩니다. 예를 들어 **instruments** , **instrumental** 및 **instrumentation** 결과도 반환됩니다.

!["레버" 을 검색하면 "레버리지" 과 "레버리지"도 반환됩니다.](./searching-for-content/images/03.png)

```{note}
접두사 검색은 기본적으로 많은 필드에서 사용할 수 있지만 내부적으로는 더 복잡합니다. 필드에서 사용되는 분석기 및 수행된 모든 변환을 포함하여 필드 매핑의 세부 사항이 최종 동작을 결정합니다.
```

사용자가 결과를 볼 수 있도록 하는 또 다른 방법은 [검색 제안](../search-pages-and-widgets/search-results/enabling-search-suggestions.md)을 이용하는 것입니다.

### 검색 표시줄 구성

검색 표시줄의 동작은 위젯 구성 화면을 통해 구성할 수 있습니다. 구성 옵션은 디스플레이 설정, 제안 구성 또는 고급 구성으로 분류됩니다.

![구성 화면에서 검색 표시줄 동작을 구성합니다.](./searching-for-content/images/05.png)

```{note}
한 페이지 상단에 전역적으로 포함된 검색창 위젯을 구성하면 사이트의 모든 페이지에 페이지 상단 검색창 위젯이 구성됩니다. 또한 [대상 검색 페이지의](../search-pages-and-widgets/working-with-search-pages/search-pages.md) 검색창 위젯이 다르게 구성된 경우 재정의합니다. 그러나 다른 페이지에 수동으로 배치된 검색 표시줄 위젯은 재정의하지 않습니다.
```

#### 전시 조정

**키워드 매개변수 이름:** 검색에 입력된 키워드에 대한 매개변수 이름을 편집합니다. 예를 들어 키워드 용어 **데이터** 을 검색할 때 기본 URL은 다음과 같습니다.

```
http://localhost:8080/web/guest/search?q=data
```

키워드 매개변수 이름을 **키워드** 로 변경하면 다음과 같습니다.

```
http://localhost:8080/web/guest/search?keyword=data
```

**범위:** 이 사이트(기본값), 전체 및 사용자 선택 허용의 세 가지 옵션 중에서 선택합니다. **이 사이트** 은 검색이 실행된 사이트와 관련된 자산만 검색됨을 의미합니다. **Everything** 선택하여 검색 범위를 모든 사이트로 확장합니다. 사용자가 검색할 범위를 선택하도록 하려면 **사용자가 선택하도록 허용** 선택합니다.

![사용자가 검색이 실행되는 범위를 선택하도록 합니다.](./searching-for-content/images/06.png)

**범위 매개변수 이름:** 검색이 수행되는 범위에 대한 URL 매개변수 이름을 설정하십시오. 이 매개변수는 범위 **사용자가** 선택하도록 선택한 경우에만 URL에 나타납니다. 기본값은 **범위** 이므로 단어 **데이터** 검색하면 다음과 같은 기본 URL이 생성됩니다.

```
http://localhost:8080/web/guest/search?q=data&scope=this-site
```

**범위****대상** 으로 변경하면 다음 URL이 생성됩니다.

```
http://localhost:8080/web/guest/search?q=data&target=this-site
```

**대상 페이지:** 검색 페이지에 친숙한 URL을 제공합니다. [](../search-pages-and-widgets/working-with-search-pages/search-pages.md). 구성되지 않았거나 존재하지 않는 페이지를 가리키는 경우 검색 표시줄이 사용자에게 표시되도록 구성해야 한다는 메시지가 관리자에게 표시됩니다.

#### 제안 구성

[검색창 제안](../search-pages-and-widgets/search-bar-suggestions.md) 사용 가능하고 활성화된 경우 검색창 위젯 구성에 추가 구성이 나타납니다. 이러한 구성 옵션을 이해하려면 [검색 표시줄 제안 구성](../search-pages-and-widgets/search-bar-suggestions/configuring-search-bar-suggestions.md) 참조하십시오.

#### 고급 설정

**고급 검색 구문 사용:** Elasticsearch를 사용하는 경우 이를 활성화하면 사용자가 검색 표시줄에 [쿼리 문자열 구문](https://www.elastic.co/guide/en/elasticsearch/reference/7.6/query-dsl-simple-query-string-query.html) 입력할 수 있습니다. Solr를 사용하는 경우 적절한 구문 [에 대한 설명서를 참조](https://lucene.apache.org/solr/guide/7_0/query-syntax-and-parsing.html) .

**Staged Sites의 결과 표시:** Content from [Staging environment](../../site-building/publishing-tools/staging.md) is [not searchable](../search-pages-and-widgets/search-results/search-results-behavior.md#search-and-staging) 라이브 사이트에서 이 설정에 관계없이. 이 설정을 사용하면 로컬 스테이징이 활성화된 사이트에서 Everything 범위가 구성된 경우 다른 로컬 스테이징 사이트에서 콘텐츠를 검색할 수 있습니다.

## Liferay 개체 검색

Liferay 7.4에는 GUI 기반 애플리케이션 구축 프레임워크인 [Liferay Objects](../../building-applications/objects.md)이 포함되어 있습니다. 각 개체의 정의 필드는 검색 가능하도록 선언할 수 있습니다. 그런 다음 개체 항목(응용 프로그램 사용자가 제출한 레코드)을 쿼리하고 검색 결과 위젯에 반환할 수 있습니다.

```{important}
객체의 범위는 검색 방법을 결정합니다.

* 객체의 범위가 회사인 경우 검색 표시줄이 Everything을 검색하도록 구성된 경우에만 객체의 항목이 검색됩니다.
* Object의 범위가 Site인 경우, This Site에서 검색하도록 Search bar를 설정해야 Object의 Entries를 검색할 수 있습니다.
```

유형 패싯 및 검색 결과 위젯은 다음과 같은 방식으로 Liferay 개체 검색을 지원합니다.

* 유형 패싯에는 게시된 개체가 자동으로 포함됩니다.

   ![게시된 개체가 유형 패싯 위젯에 추가됩니다.](./searching-for-content/images/09.png)

* 검색 결과 위젯은 개체 항목의 제목과 요약을 자동으로 표시합니다.

   ![개체 항목에 대한 제목 및 내용 요약이 표시됩니다.](./searching-for-content/images/10.png)

Liferay 7.4 U64+/GA64+의 경우 검색 결과에서 개체 항목을 클릭하면 해당 항목의 [디스플레이 페이지](../../building-applications/objects/displaying-object-entries.md#creating-display-page-templates-for-objects) 로 리디렉션됩니다(존재하는 경우).

## 관련 주제

* [검색 결과 이해](../search-pages-and-widgets/search-results/search-results-behavior.md)
* [검색 제안 활성화](../search-pages-and-widgets/search-results/enabling-search-suggestions.md)
