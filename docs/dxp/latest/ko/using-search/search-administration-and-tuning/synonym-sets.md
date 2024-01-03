# 동의어 세트

{bdg-primary}`구독`

```{note}
이 기능은 Elasticsearch에서만 작동합니다 [Elasticsearch에서만 가능](../installing-and-upgrading-a-search-engine/solr/solr-limitations.md).
```

동의어 집합은 동일한 의미를 지닌 단어나 구의 그룹입니다. 관리 사용자는 동의어 세트를 생성합니다. 검색 페이지 최종 사용자가 키워드나 문구를 검색하면 세트에 있는 동의어도 검색됩니다.

예를 들어 사용자가 "US"라는 단어를 검색할 수 있습니다. 아마도 사용자는 _America_, _USA_, _United States_ 등과 같은 동의어도 포함된 검색 결과를 원할 것입니다. 동의어 세트를 생성하면 사용자가 검색을 최대한 활용할 수 있습니다.

## 요구 사항 및 제한 사항

동의어 세트는 Elasticsearch를 검색 엔진으로 사용할 때만 지원됩니다. [Elasticsearch 시작하기](../installing-and-upgrading-a-search-engine/elasticsearch/getting-started-with-elasticsearch.md) 에서 Elasticsearch 설치에 대해 알아보세요.

동의어 집합은 현재 영어 또는 스페인어와 같은 기본 로캘 중 하나로 인덱싱된 필드에서 작동합니다. 이 두 언어 중 하나로 지역화 가능한 필드가 있는 Liferay 자산은 동의어 세트와 함께 작동합니다.

Elasticsearch에서 지원되는 [`=>` 형식](https://www.elastic.co/guide/en/elasticsearch/guide/current/synonyms.html) 동의어 설정 UI를 통해 지원되지 않습니다.

## 동의어 집합 생성 및 관리

원하는 만큼 동의어 키워드를 세트에 추가하여 동의어 세트를 만듭니다. 동의어 세트가 저장되면 동일한 회사 범위(동의어가 구성된 [가상 인스턴스](../../system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.md) 의 모든 사이트)의 검색이 적용됩니다.

새로운 동의어 세트를 생성하려면,

1. 글로벌 메뉴(![글로벌 메뉴](../../images/icon-applications-menu.png))에서 _응용 프로그램_ &rarr; _검색 튜닝_ &rarr; _동의어_로 이동합니다.

   ![Navigate to the Synonyms section in the Applications menu](synonym-sets/images/01.png)

1. _Add_ 아이콘(![추가 아이콘 클릭](../../images/icon-add.png))을 클릭하여 새 동의어 세트를 추가하세요.

1. 세트에 동의어 목록을 입력하십시오. 동의어 입력은 _Enter_를 클릭하거나 쉼표를 입력하여 수행됩니다.

   ![Type your different synonym words into the set.](synonym-sets/images/02.png)

1. 옆에 있는 _X_를 클릭하면 동의어를 삭제할 수 있습니다. 세트를 마치면 _게시_를 클릭하세요.

1. 세트를 편집하거나 삭제하려면 _옵션_ 아이콘(![옵션 아이콘을 클릭하세요.](../../images/icon-options.png))을 클릭하고 _편집_ 또는 _삭제_를 클릭하세요.

   ![Click on edit or delete to make changes.](synonym-sets/images/03.png)

   동의어 세트가 게시되면 사용할 준비가 된 것입니다.

## 동의어 세트 사용

세트에 저장한 동의어 키워드 중 하나를 검색하여 동의어 세트를 테스트할 수 있습니다. 키워드 및 동의어와 일치하는 결과가 검색 결과 위젯에 반환됩니다.

![Try searching for a synonym from your set.](synonym-sets/images/04.png)

위의 예에서 달 탐사선에 관한 이 블로그 기사에는 "LRV"라는 단어가 포함되어 있지 않지만 이제 검색 결과 일치 항목으로 반환됩니다. 동의어도 강조 표시되어 있습니다.

## 새로운 동의어 언어 필터 생성

> **가용성: Liferay DXP 7.3 FP2+ 및 Liferay DXP 7.2 FP13+**

기본적으로 동의어 세트는 [영어 및 스페인어로만 동의어를 지원합니다](#requirements-and-limitations) . 다른 언어에 대한 지원을 추가하려면 아래 구성 단계를 사용하십시오.

- 필요한 변경 사항을 적용하여 기본 [프랑스어](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/analysis-lang-analyzer.html#french-analyzer) 분석기를 다시 구현하여 [사용자 지정 분석기](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/analysis-custom-analyzer.html) 만듭니다(파이프라인의 추가 [동의어 그래프 토큰 필터](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/analysis-synonym-graph-tokenfilter.html) 포함).
- 커넥터 구성의 추가 인덱스 구성을 사용하여 인덱스 설정에 사용자 지정 분석기 정의를 추가합니다.
- 커넥터 구성의 유형 매핑 재정의 설정을 사용하여 Liferay DXP의 기본 유형 매핑을 재정의하여 원하는 필드에 사용자 지정 분석기를 적용합니다.
- 새 설정을 적용하려면 다시 색인을 생성하세요.

### 전제 조건: 기본 매핑 얻기

사용자 정의하기 전에 Elasticsearch 커넥터의 기본 JSON 매핑을 가져와야 합니다.

실행 중인 Liferay에서 매핑을 얻으려면,

1. 글로벌 메뉴(![글로벌 메뉴](../../images/icon-applications-menu.png))를 열고 _Control Panel_ &rarr; _Search_로 이동합니다.
1. _필드 매핑_ 탭을 클릭하세요.
1. 매핑(![복사](../../images/icon-copy.png))을 복사하고 저장합니다.

```{warning}
인덱스 매핑 및 설정은 버전 간에 변경될 수 있으며 때로는 부 버전 내에서(수정 팩 또는 서비스 팩을 통해) 변경될 수 있습니다. 새 패치 수준으로 업그레이드하거나 이동할 때 매핑 및 설정에 대한 사용자 정의를 검토하고 필요에 따라 조정해야 합니다. 또한 Liferay의 검색 팀은 향후 버전에서 기본적으로 더 많은 언어에 대한 지원을 추가하여 사용자 정의가 필요 없도록 할 계획입니다.
```

### 언어 추가

이제 기본 매핑 파일이 있으므로 필요한 변경을 수행하여 프랑스어 동의어에 필요한 설정을 추가합니다.

1. Elasticsearch 연결의 시스템 설정 항목---Elasticsearch 6/7로 이동합니다.

1. 추가 색인 구성 필드에 '분석' 블록을 추가합니다.

   ```json
   {
       "analysis": {
           "analyzer": {
               "custom_liferay_analyzer_fr": {
                   "filter": [
                       "french_elision",
                       "lowercase",
                       "french_stop",
                       "my-synonym-filter-fr",
                       "french_stemmer"
                   ],
                   "tokenizer": "standard"
               }
           },
           "filter": {
               "my-synonym-filter-fr": {
                   "lenient": true, 
                   "synonyms": [],
                   "type": "synonym_graph"
               },
               "french_stop":{
                   "type":"stop",
                   "stopwords":"_french_"
               },
               "french_stemmer":{
                   "type":"stemmer",
                   "language":"light_french"
               },
               "french_elision": {
                   "type": "elision",
                   "articles_case": true,
                   "articles": [
                       "l", "m", "t", "qu", "n", "s",
                       "j", "d", "c", "jusqu", "quoiqu",
                       "lorsqu", "puisqu"
                   ]
               }
           }
       }
   }
   ```

   이 구성에 설정을 추가하면 기본 인덱스 설정에서 사용 가능한 설정이 늘어납니다. 소스 코드의 `index-settings.json` 파일에서 기본 JSON 설정을 찾습니다. 여기서는 새로운 필터 `my-synonym-filter-fr`을 사용하는 `custom_liferay_analyzer_fr`이라는 새 분석기를 생성합니다. 현재 '동의어' 배열은 비어 있습니다. UI를 통해 생성된 동의어 세트가 여기에 표시됩니다.

1. 복사한 매핑 파일을 수정합니다. 여는 중괄호 `{`는 그대로 두고 두 번째와 세 번째 줄을 완전히 삭제합니다(인덱스 이름이 있는 줄과 `mappings`이 있는 줄).

   ```json
   "liferay-[COMPANY_ID]": {
       "mappings" : {
   ```

   그런 다음 매핑 끝에서 끝나는 두 개의 중괄호를 삭제합니다.

   ```json
       }
   }
   ```

   ```{note}
   Liferay 7.4 U80 이하의 경우 JSON 파일 시작 부분에 `LiferayDocumentType` 선언을 포함해야 합니다. 예를 들어 [Liferay 7.4 GA80 매핑을 참조하세요](https://github.com/liferay/liferay-portal/blob/7.4.3.80-ga80/modules/apps/portal-search-elasticsearch7/portal-search-elasticsearch7-impl/src/main/resources/META-INF/mappings/liferay-type-mappings.json) 
   ```

1. 유형 매핑 재정의 필드를 사용하여 사용자 정의 분석기(`custom_liferay_analyzer_fr`)를 사용하도록 `template_fr` 동적 필드에 대한 분석기를 변경합니다.

   ```{important}
   이 예는 간결성을 위해 잘렸습니다. 유형 매핑 재정의는 Liferay의 기본 유형 매핑을 완전히 재정의하고 무시하므로 재정의된 부분뿐만 아니라 완전한 매핑 파일을 제공해야 합니다.   
   ```

   ```json
    {
     "date_detection": false,
     "dynamic_templates": [
         // (...)
         {
             "template_fr": {
                 "mapping": {
                     "analyzer": "custom_liferay_analyzer_fr",
                     "store": true,
                     "term_vector": "with_positions_offsets",
                     "type": "text"
                 },
                 "match": "\\w+_fr\\b|\\w+_fr_[A-Z]{2}\\b",
                 "match_mapping_type": "string",
                 "match_pattern": "regex"
             }
         },
         // (...)
   ```

   여기서 중요한 변경 사항은 기본 할당 분석기(`french`)가 사용자 지정 분석기 `custom_liferay_analyzer_fr`로 대체된다는 것입니다.

1. 구성 변경 사항을 저장합니다.

   ```{tip}
   Sidecar Elasticsearch 서버를 사용하는 경우 콘솔에 오류가 표시될 수 있습니다. 문제를 해결하려면 Liferay DXP를 다시 시작하세요.
   ```

1. 이제 시스템 설정 &rarr; 검색 &rarr; 동의어로 이동하십시오.

1. 필터 이름 설정에 사용자 정의 필터 이름(예: `custom-synonym-filter-fr`)을 추가하고 구성을 저장합니다.

1. 전체 재색인 수행: 제어판 &rarr; 검색 &rarr; 색인 작업에서 모든 검색 색인에 대해 _Reindex_를 클릭합니다.

   사용자 정의 매핑이 성공적으로 적용되었는지 확인하려면 필드 매핑 탭으로 이동하여 인덱스(예: `liferay-20101`)를 선택하고 오른쪽 패널에서 `template_fr`을 찾으세요.

   사용자 지정 분석기를 포함한 추가 인덱스 설정도 추가되었는지 확인하려면 Elasticsearch에 `http://<host>:<port>/liferay-[company-id]/_settings` API 호출을 수행하고 다음에서 분석기 이름을 찾으세요. 응답. 예를 들어 `localhost`에서 실행 중인 Liferay DXP 서버의 사이드카 Elasticsearch 서버에 대한 인덱스 설정을 보려면 `20101`을 사용하여 <http://localhost:9201/liferay-20101/_settings> 방문하세요.

새 필터가 작동하는지 확인하려면

1. 동의어 애플리케이션으로 이동합니다. 글로벌 메뉴의 애플리케이션 탭에서 _Synonyms_(검색 조정 아래)를 클릭합니다.

1. 새로운 동의어 세트 `maison, logement`를 만듭니다.

1. 영어 및 프랑스어 번역으로 웹 콘텐츠 기사를 작성하세요. 프랑스어 제목에 _maison_을 추가하세요.

1. 영어 및 프랑스어 번역으로 또 다른 웹 콘텐츠 기사를 만듭니다. 프랑스어 제목에 _logement_를 추가하세요.

1. 프랑스어 로캘로 전환하고 _maison_을 검색하세요. 두 기사가 모두 반환됩니다.
