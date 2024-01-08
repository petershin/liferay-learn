# 유사 결과

`{bdg-primary}`구독`

`{bdg-link-secondary}` [DXP 7.3 및 7.4와 번들로 제공됨; DXP 7.2 SP2+/FP5+용 Liferay 마켓플레이스](https://web.liferay.com/marketplace/-/mp/application/172465398) `

```{note}
이 기능은 [Elasticsearch에서만](../installing-and-upgrading-a-search-engine/solr/solr-limitations.md) 작동합니다.
```

유사한 결과 위젯은 페이지에서 선택한 기본 자산과 유사한 검색 결과를 표시합니다.

주자산의 개념이 중요합니다. DXP의 특정 위젯은 자산 게시자, 블로그, Wiki 등 자산 목록을 표시합니다. 사용자가 표시된 자산 중 하나를 클릭하고 위젯이 페이지에 전체 콘텐츠를 표시하면 이제 해당 자산이 페이지의 **주 자산** 이 됩니다. 유사한 결과 위젯을 같은 페이지에 배치하면 [추가 유사한 쿼리](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-mlt-query.html) 에 의해 반환될 만큼 유사한 자산 목록이 표시됩니다. 주요 자산의 개념은 Elasticsearch의 [입력 문서](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-mlt-query.html#_how_it_works) 와 동의어입니다.

유사한 결과는 입력 문서/주 자산을 사용하여 쿼리에 가장 잘 일치하는 쿼리를 구성한 다음 이 분리 쿼리(또는 'OR')를 검색 엔진에 보내 일치하는 결과 문서를 반환합니다. 이 프로세스는 구성 가능합니다. 즉, 입력 문서를 처리하는 방법, 처리된 콘텐츠에서 용어를 선택하는 방법, 쿼리 자체를 구성하는 방법이 있습니다. [details]에 대한 Elasticsearch 설명서(https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-mlt-query.html#_parameters_2)를 참조하세요.

## 검색 결과 위젯 구성

1. [새 페이지](../../site-building/creating-pages/adding-pages/adding-a-page-to-a-site.md)를 만들거나 [기존 페이지를 편집](../ ../site-building/creating-pages/using-content-pages/adding-elements-to-content-pages.md)

1. **추가**( ![위젯 추가 아이콘](../../images/icon-add-widget.png) )를 클릭하여 조각 및 위젯 패널을 엽니다.

1. 위젯 탭의 검색 카테고리 아래에서 **유사한 결과** 위젯을 페이지의 원하는 사이트로 드래그하세요.

1. 유사한 결과 위젯 &rarr; **구성** 의 오른쪽 상단에 있는 **작업**( ![작업 아이콘.](../../images/icon-actions.png) )을 클릭합니다.

   ![Configure the Similar Results widget's display settings.](./similar-results/images/01.png)

사용 가능한 속성의 전체 목록은 [유사한 결과 구성](#similar-results-configurations) 을 참조하세요.

## 유사 결과 위젯 사용

유사한 결과 위젯이 페이지에 배치될 때 발생하는 상황은 현재 페이지에 표시되는 자산과 컨텍스트에 따라 다릅니다. 페이지에서 기본 자산을 선택하지 않은 경우 유사한 결과에는 아무 것도 표시되지 않습니다. 페이지의 해당 공간은 공백으로 유지됩니다. 사이트 관리자에게는 다음 정보 메시지가 표시됩니다.

**유사한 결과가 없습니다.**

주요 자산의 문서가 감지되면 위젯은 구성된 [위젯 템플릿](#similar-results-widget-templates) 에 지정된 형식으로 표시되는 동일한 자산 유형의 유사한 결과를 표시합니다.

두 가지 사용 사례를 고려하여 자세히 알아보세요.

## 사용 사례 1: 자산 게시자 페이지의 유사한 결과

자산 게시자에서 자산을 선택하면 동일한 자산 유형의 유사한 결과(일치하는 검색 결과로 반환되는 결과)가 표시됩니다.

이 예를 구성하려면

1. 위젯 페이지를 생성합니다. Asset Publisher 위젯과 유사한 결과 위젯을 추가합니다.

   ![Page with an Asset Publisher widget and Similar Results widget.](similar-results/images/02.png)

1. [Asset 게시자의 구성 디스플레이 설정](../../site-building/displaying-content/using-the-asset-publisher-widget/configuring-asset-publisher-display-settings.md)으로 이동하여 Asset을 설정합니다. **전체 콘텐츠 표시** 에 동작을 연결합니다.

   이렇게 하면 선택한 자산이 자산 게시자 내에 전체 콘텐츠를 표시하게 됩니다. **새 페이지에서 보기** 를 선택하면 자산이 기본적으로 존재하는 페이지로 리디렉션되어 유사한 결과 위젯이 쓸모 없게 됩니다.

1. 아래 나열된 유형의 유사한 자산을 여러 개 만듭니다. 유사한 결과 위젯이 결과를 채울 만큼 충분히 유사한지 확인하세요.

   유사한 결과 쿼리에 의해 반환될 자산을 생성하려면 생성한 자산의 콘텐츠와 [유사한 결과 위젯 구성](#similar-results-configurations) 에 주의하세요.  테스트하려면 **최소 용어 빈도** 와 **최소 문서 빈도** 값을 모두 '1'로 설정하는 것이 좋습니다.

   * 블로그 항목
   * 문서 및 미디어 파일
   * 문서 및 미디어 폴더
   * 웹 콘텐츠 기사
   * 웹 콘텐츠 폴더
   * Wiki 페이지
   * 메시지 보드 스레드
   * 메시지 보드 메시지
   * 메시지 보드 카테고리

Asset Publisher 위젯에 표시된 자산을 클릭하면 유사한 결과 위젯에 비슷한 결과가 나타납니다.

![Similar results are displayed for the asset selected.](similar-results/images/03.png)

유사한 결과 중 하나를 클릭하세요. Asset Publisher는 주 자산을 업데이트하고 새 주 자산에 대해 유사한 결과를 다시 계산합니다.

## 사용 사례 2: 자산 표시 페이지의 유사한 결과

이러한 위젯 및 관련 자산은 자산 목록을 표시하고 유사한 결과 위젯의 기본 자산으로 사용할 자산을 선택할 수 있습니다.

| 위젯 이름    | 자산 유형                  |
| -------- | ---------------------- |
| 블로그      | 블로그 항목                 |
| 문서 및 미디어 | 문서 및 미디어 파일, 폴더        |
| Wiki     | Wiki 페이지               |
| 게시판      | 메시지 보드 스레드, 메시지 및 카테고리 |

블로그에서 유사한 결과를 사용하는 예를 구성하려면,

1. 위젯 페이지를 생성합니다. 블로그 위젯과 유사한 결과 위젯을 추가합니다.

1. 유사한 블로그 항목을 여러 개 만듭니다. 유사한 결과 위젯이 결과로 반환할 만큼 충분히 유사한지 확인하세요.

   유사한 결과 쿼리에 의해 반환될 자산을 생성하려면 생성한 자산의 콘텐츠와 [유사한 결과 위젯 구성](#similar-results-configurations) 에 주의하세요.  테스트하려면 **최소 용어 빈도** 와 **최소 문서 빈도** 값을 모두 '1'로 설정하는 것이 좋습니다.

1. 블로그 위젯에서 블로그 게시물을 클릭하세요. 블로그 항목이 표시되고 유사한 결과 위젯에 유사한 항목에 대한 링크가 표시됩니다.

1. 유사한 결과 중 하나를 클릭하세요. 이제 해당 블로그 콘텐츠가 현재 페이지의 블로그 위젯에 렌더링됩니다.

   ![The similar results widget shows other similar blog posts.](similar-results/images/04.png)

## 유사한 결과 위젯 템플릿

기본적으로 비슷한 결과는 **컴팩트 레이아웃**[위젯 템플릿](../../site-building/displaying-content/additional-content-display-options/styling-widgets-with-widget-templates.md)을 사용하여 렌더링됩니다. ), 하이퍼링크된 제목 목록을 표시합니다.

**목록 레이아웃** 과 **카드 레이아웃** 이라는 두 가지 추가 위젯 템플릿을 즉시 사용할 수 있습니다.

목록 레이아웃:

![The list layout shows a list of results and their summary.](similar-results/images/05.png)

카드 레이아웃:

![The card layout shows each result as a card.](similar-results/images/06.png)

### 유사한 결과를 위한 사용자 정의 위젯 템플릿 추가

유사한 결과 표시를 위한 위젯 템플릿을 작성하려면,

1. 유사한 결과 위젯의 **옵션** 메뉴( ![옵션 아이콘](../../images/icon-app-options.png) )를 열고 **구성** 을 클릭합니다.

1. 위젯 템플릿 화면을 보려면 **템플릿 관리** 를 클릭하세요.

1. **추가**( ![아이콘 추가](../../images/icon-add.png) )를 클릭하여 템플릿 생성기 팔레트를 엽니다.

   표준 [위젯 템플릿](../../site-building/displaying-content/additional-content-display-options/styling-widgets-with-widget-templates.md) 변수 외에도 검색 기능을 활용하세요. 템플릿 편집기에서 제공되는 특정 변수.

1. 원하는대로 템플릿을 디자인하십시오. 자세한 내용은 [위젯 템플릿](../../site-building/displaying-content/additional-content-display-options/styling-widgets-with-widget-templates.md) 문서를 참조하세요.

사이트 메뉴의 사이트 작성기 섹션에 있는 위젯 템플릿 항목에서 동일한 템플릿 편집기에 액세스할 수 있습니다.

## 유사한 결과 구성

첫 번째 구성 옵션은 디스플레이 설정이라는 섹션에 나타납니다.

**표시 템플릿:** 유사한 결과가 표시되는 방식을 구성하려면 위젯 템플릿을 선택합니다.

**최대 항목 표시:** 위젯에 표시할 최대 결과 수를 설정합니다.

고급 구성 섹션에서는 위젯의
을 조정하기 위한 설정을 수집합니다. 이러한 설정 중 다수는
[Elasticsearch에 대한 유사한 쿼리](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-mlt-query.html) 를 구성하는 데 사용됩니다.

| 고급 설정                                      | 정의                                                                                                                                                                                                                           |
| :----------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 범위<br />{bdg-secondary}`사용 가능 7.4 U17+`    | 이 사이트(기본값)와 Everything 중에서 선택하여 현재 사이트에서만 유사한 결과를 표시하거나(This Site) 검색 범위를 모든 사이트(Everything)로 확장합니다.                                                                                                                         |
| 링크 동작<br />{bdg-secondary}`사용 가능 7.4 U18+` | 콘텐츠 표시(기본값)와 새 페이지에서 보기 중에서 선택하여 클릭한 결과를 동일한 디스플레이 페이지에 표시하거나(콘텐츠 표시) 해당 컨텍스트에 표시합니다(새 페이지에서 보기, 예를 들어 다른 페이지의 디스플레이 위젯에서).                                                                                                  |
| 분야                                         | 쉼표로 구분된 목록을 사용하여 다른 자산이 기본 자산과 일치하는지 여부를 결정하는 데 사용되는 콘텐츠의 키워드 또는 텍스트 필드를 지정합니다.                                                                                                                                              |
| 최대 검색어                                     | 기본 자산에서 추출할 최대 검색어 수를 설정합니다. 검색 결과를 기본 자산과 일치시키는 데 사용되는 용어입니다. 이 값을 늘리면 실행 속도가 저하되는 대신 반환된 결과의 관련성이 향상됩니다. 공백으로 두면 기본값은 '25'입니다.                                                                                             |
| 최소 항 빈도                                    | 유사한 결과를 일치시키는 데 사용하기 위해 용어가 색인에 나타나야 하는 횟수에 대한 최소 임계값을 설정합니다. 비워두면 기본값은 '2'입니다.                                                                                                                                              |
| 최소 문서 빈도                                   | 유사한 항목 쿼리를 구성하는 데 용어가 사용되도록 하려면 해당 용어를 포함하는 문서 수에 대한 최소 임계값을 설정하십시오. 공백으로 두면 기본값은 '5'입니다.                                                                                                                                    |
| 최대 문서 빈도                                   | 유사한 결과를 일치시키기 위해 용어를 사용하기 위해 용어가 나타날 수 있는 인덱스의 문서 수에 대한 최대 임계값을 설정합니다. 중지 단어와 같이 자주 사용되는 단어를 무시하려면 이 옵션을 사용합니다. 비워 두면 상한이 설정되지 않습니다.                                                                                         |
| 최소 단어 길이                                   | 유사한 항목 검색에서 해당 용어가 생략되는 최소 단어 길이를 설정합니다. 공백으로 두면 기본값은 '0'입니다.                                                                                                                                                                |
| 최대 단어 길이                                   | 유사한 항목 검색에서 해당 용어가 생략되는 최대 단어 길이를 설정합니다. 비워 두면 상한이 설정되지 않습니다.                                                                                                                                                                |
| 단어 중단                                      | 유사한 결과를 찾기 위해 무시해야 하는 흥미롭지 않은 중지 단어의 배열(쉼표로 구분된 목록)입니다. 구성된 분석기가 중지 단어를 허용하는 경우 이러한 단어는 유사한 항목 더보기 쿼리로 보내는 것을 완전히 피할 수 있습니다.                                                                                                 |
| 애널라이저                                      | 입력 문서의 필드에 사용할 분석기를 지정합니다. 공백으로 두면 기본값은 필드 구성의 첫 번째 항목과 연결된 분석기입니다.                                                                                                                                                          |
| 일치해야 하는 최소값                                | 분리형 쿼리가 형성된 후 이 매개변수는 일치해야 하는 용어 수를 제어합니다(기본값은 '30%').허용되는 구문은 [Elasticsearch 설명서](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-minimum-should-match.html#query-dsl-minimum-should-match) 를 참조하세요. |
| 용어 부스트                                     | 용어를 [tf-idf](https://en.wikipedia.org/wiki/Tf%E2%80%93idf) 점수로 부스팅하려는 경우 사용할 부스트 요인을 설정합니다. 공백으로 두면 기본값은 비활성화('0')입니다. 다른 양수 값은 주어진 부스트 요인으로 부스팅 용어를 활성화합니다.                                                                 |
| 연합 검색 키                                    | 이 위젯이 참여하고 있는 대체 검색의 키를 입력하세요.                                                                                                                                                                                               |
