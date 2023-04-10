# Learning to Rank

> **Liferay 엔터프라이즈 검색(LES) 가입자**

Elasticsearch와 같은 검색 엔진에는 일반 검색 목적에 적합한 잘 조정된 관련성 알고리즘이 있습니다.

LES Learning to Rank는 기계 학습을 활용하여 검색 결과 순위를 향상시킵니다. 데이터 과학자의 전문 지식과 기계 학습을 결합하여 검색 쿼리에 적용되는 더 스마트한 점수 매기기 기능을 생성합니다.

순위를 매기는 LES Learning에는 Liferay Enterprise Search 구독이 필요합니다. [Elasticsearch Learning to Rank 플러그인](https://elasticsearch-learning-to-rank.readthedocs.io/en/latest/index.html) Elastic에서 생성되지 않으며 Liferay에서 지원하는 모든 Elasticsearch 버전에 대해 미리 빌드된 플러그인이 없다는 점을 이해하는 것이 중요합니다. 자세한 내용은 [LES 호환성 매트릭스를 참조하십시오](https://help.liferay.com/hc/ko/articles/360016511651#Liferay-Enterprise-Search) .

## 검색 페이지에서 순위를 매기는 학습 비활성화

순위 학습은 [정렬 위젯](../search-pages-and-widgets/search-results/sorting-search-results.md)에서 작동하지 않습니다.

LES Learning to Rank가 배포되었지만 특정 검색 페이지에서 비활성화해야 하는 경우(아마도 정렬 위젯 사용),

1. 검색 페이지에 [하위 수준 검색 옵션](../search-pages-and-widgets/search-results/understanding-low-level-search-options.md) 위젯을 추가합니다.

1. 를 클릭하여 위젯의 구성 화면을 엽니다.

**이 페이지에서 추가 하위 수준 검색 옵션을 구성합니다.**

1. 제외할 기여자 필드에 다음을 입력합니다.

    `com.liferay.portal.search.learning.to.rank`

이제 페이지의 검색 표시줄에 입력된 쿼리에 대해 다시 채점하는 학습 프로세스를 건너뜁니다. 결과는 정렬 가능하며 기본 관련성 알고리즘을 사용하여 반환됩니다.

## 전제 조건

Elasticsearch로 전송된 Liferay 쿼리를 다시 채점하기 위해 Learning to Rank를 사용하기 위한 몇 가지 전제 조건이 있습니다.

- 순위 학습에는 [Liferay Enterprise Search](https://www.liferay.com/products/dxp/enterprise-search) (LES) 구독이 필요합니다. 구독이 완료되면 [Liferay Enterprise Search Learning을 다운로드하여 순위](https://customer.liferay.com/en/downloads?p_p_id=com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_productAssetCategoryId=118191013&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_fileTypeAssetCategoryId=118191060) LPKG 파일을 만들고 [설치합니다](../../system-administration/installing-and-managing-apps/installing-apps.md).

   ```{note}
   Liferay DXP 7.4부터 Liferay Enterprise Search(LES) 애플리케이션이 모든 Liferay DXP 번들 및 Docker 컨테이너에 포함됩니다. 자세한 내용은 [LES 활성화](./activating-liferay-enterprise-search.md)를 참조하세요.
   ```

- 데이터가 인덱싱된 원격 Elasticsearch 서버.

- [Elasticsearch Learning to Rank](https://github.com/o19s/elasticsearch-learning-to-rank) 플러그인의 해당 버전이 Elasticsearch에 설치되었습니다.

- Learning to Rank 플러그인에 업로드된 [훈련된 모델](https://elasticsearch-learning-to-rank.readthedocs.io/en/latest/training-models.html) .

## 기술 개요

일반 검색에서 사용자는 Liferay DXP의 [검색 표시줄](../getting-started/searching-for-content.md)통해 검색 엔진에 쿼리를 보냅니다. 반환된 결과의 순서는 검색 엔진의 [점수 알고리즘](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/index-modules-similarity.html#bm25) 에 의해 결정됩니다.

여기에서 Learning to Rank가 개입하여 프로세스를 다르게 만듭니다.

1. 사용자가 검색창에 검색어를 입력합니다.

1. Liferay는 쿼리를 Elasticsearch로 보내고 검색 엔진의 관련성 알고리즘을 사용하여 평소와 같이 처음 1000개의 결과를 검색합니다.

1. 상위 1000개 결과는 검색 적중으로 반환되지 않지만 Elasticsearch에서 [재점수](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/search-request-body.html#request-body-search-rescore) [점수 기능](https://elasticsearch-learning-to-rank.readthedocs.io/en/latest/searching-with-your-model.html#rescore-top-n-with-sltr) 을 통해 사용됩니다.

1. 결과는 [SLTR 쿼리](https://elasticsearch-learning-to-rank.readthedocs.io/en/latest/searching-with-your-model.html) 에 의해 다시 채점되며 여기에는 재채점에 사용할 키워드 및 훈련된 모델이 포함됩니다.

1. 훈련된 모델이 결과의 순위를 다시 지정하면 Liferay의 [검색 결과](../search-pages-and-widgets/search-results/search-results.md) 에 새로운 순서로 반환됩니다.

위의 정렬된 목록의 하위 글머리 기호에 불과하지만 이 패러다임 작업의 대부분은 훈련된 모델을 만들고 연마하는 것입니다. 여기에서는 범위를 벗어나지만 아래는 Liferay 쿼리에서 기계 학습의 마법을 조율하기 위해 모든 부분을 제자리에 가져오는 데 도움이 됩니다. 다음은 **모델 교육** 을 구성하는 요소에 대한 간략한 개요입니다.

## 모델 교육

좋은 판단 목록과 좋은 기능 세트가 Learning to Rank 알고리즘(퍼즐의 기계 학습 부분임)에 공급될 때 유용한 훈련된 모델이 생성됩니다. 따라서 조립하는 것은 귀하의 의무입니다.

- 교육 모델을 만드는 데 사용하려는 Learning to Rank 알고리즘입니다. 이 데모에서는 [RankLib](https://sourceforge.net/p/lemur/wiki/RankLib/) 사용합니다.

- 검색 결과의 등급 목록을 포함하는 **판단 목록** . 알고리즘은 판단 목록의 순서를 존중하는 모델을 생성합니다.

- 신뢰할 수 있는 모델을 생성하기 위해 판단 목록과 함께 사용하는 순위 학습 알고리즘에 전달하는 모든 **기능** 을 포함하는 기능 세트입니다. Liferay에 대한 예제 기능 세트가 예제에 나와 있습니다.


[판정 목록](https://elasticsearch-learning-to-rank.readthedocs.io/en/latest/core-concepts.html#judgments-expression-of-the-ideal-ordering) 등급별 검색 결과 목록입니다.

[기능](https://elasticsearch-learning-to-rank.readthedocs.io/en/latest/core-concepts.html#features-the-raw-material-of-relevance) 은 알고리즘이 더 스마트한 방식으로 결과를 점수화할 수 있는 함수를 만드는 데 사용하는 변수입니다. 충분한(또는 올바른) 관련 기능을 제공하지 않으면 모델이 개선된 결과를 제공할 만큼 충분히 "스마트"하지 않습니다.

시작하기 전에 Liferay와 통신하는 원격 [Elasticsearch](../installing-and-upgrading-a-search-engine.md) 클러스터가 있어야 합니다. 자세한 내용은 [검색 엔진 호환성 매트릭스를 참조하십시오](https://help.liferay.com/hc/ko/articles/360016511651) .

```{tip}
[Suggestions](../search-pages-and-widgets/search-results/enabling-search-suggestions.md)을 사용하여 가장 일반적인 쿼리를 검색합니다(이는 Learning to Rank 모델을 생성할 쿼리를 결정하는 한 가지 방법일 수 있음). .
```

## 1단계: Elasticsearch에 Learning to Ranking 플러그인 설치

Learning to Rank 플러그인 설치에 대한 자세한 내용은 [Elasticsearch Learning to Rank 플러그인 설명서](https://elasticsearch-learning-to-rank.readthedocs.io/en/latest/#installing) 을 참조하십시오.

```{warning}
Elasticsearch 7.14+와 함께 Liferay DXP 7.2를 실행하는 경우 플러그인을 설치하기 전에 JDK8 또는 JDK11(Liferay 설치에서 사용 중인 것)로 컴파일해야 합니다. 필요한 단계 및 추가 배경 정보는 [이 문서](https://help.liferay.com/hc/ko/articles/5194953858701) 를 참조하십시오.
```

설치하는 플러그인 버전에 따라 다음과 같은 명령을 실행하게 됩니다.

```bash
./bin/elasticsearch-plugin install https://github.com/o19s/elasticsearch-learning-to-rank/releases/download/v1.5.7-es7.13.4/ltr-plugin-v1.5.7-es7.13.4.zip
```

[Elasticsearch 클러스터에서 X-Pack 보안](../installing-and-upgrading-a-search-engine/elasticsearch/securing-elasticsearch.md)을 사용하는 경우 [추가 단계가 있을 수 있습니다.](https://elasticsearch-learning-to-rank.readthedocs.io/en/latest/x-pack.html)

## 2단계: 모델 교육 및 업로드

학습 모델에 대한 자세한 지침은 이 가이드의 범위를 벗어납니다. 이를 위해서는 적절한 도구와 모델을 추천할 수 있는 데이터 과학자의 개입이 필요합니다. 당신에게 맞는 것을 사용하십시오. 그렇게 하면 좋은 검색 결과를 생성하는 모델을 생성하기 위해 선택한 교육 도구에서 사용할 수 있는 [판단 목록](https://elasticsearch-learning-to-rank.readthedocs.io/en/latest/core-concepts.html#judgments-expression-of-the-ideal-ordering) 및 [기능 세트](https://elasticsearch-learning-to-rank.readthedocs.io/en/latest/building-features.html) 을 컴파일하게 될 것입니다. 모델이 있으면 Learning to Rank 플러그인에 업로드하십시오.

## 3단계: Learning to Ranking Plugin에 모델 업로드

`POST` 요청을 사용하여 모델을 업로드하지만 먼저 Learning to Rank 플러그인에 업로드된 기능 세트와 `_ltr` 인덱스가 있는지 확인해야 합니다. Kibana를 사용하여( [LES 모니터링 위젯](./monitoring-elasticsearch.md)통해) 이러한 작업을 더 쉽게 만드십시오.

1. `_ltr` 인덱스가 아직 없는 경우 새로 만듭니다. 

   ```json
   PUT _ltr
   ```

1. `_ltr` 인덱스에 기능 세트를 추가합니다. 이 예에서 세트는 `liferay`이라고 합니다. 

   ```json
   POST _ltr/_featureset/liferay
   {
     "featureset": {
       "name": "liferay",
       "features": [
         {
           "name": "title",
           "params": [
             "keywords"
           ],
           "template": {
             "match": {
               "title_en_US": "{{keywords}}"
             }
           }
         },
         {
           "name": "content",
           "params": [
             "keywords"
           ],
           "template": {
             "match": {
               "content_en_US": "{{keywords}}"
             }
           }
         },
         {
           "name": "asset tags",
           "params": [
             "keywords"
           ],
           "template": {
             "match": {
               "assetTagNames": "{{keywords}}"
             }
           }
         }
       ]
     }
   }
   ```

필수이므로 여기에 사용된 구문을 기록해 두십시오.

1. 학습된 모델을 기능 세트에 추가합니다. 

   ```json
   POST _ltr/_featureset/liferay/_createmodel
   {
     "model": {
       "name": "linearregression",
       "model": {
         "type": "model/ranklib",
         "definition": """
   ## Linear Regression
   ## Lambda = 1.0E-10
   0:-0.717621803830712 1:-0.717621803830712 2:-2.235841905601106 3:19.546816765721594
   """
       }
     }
   }
    ```

Liferay 자체에서 할 일이 많지 않기 때문에 이것은 매우 높은 수준의 지침 세트입니다. 필요한 사항에 대해 자세히 알아보려면 [Learning to Rank 플러그인 설명서](https://elasticsearch-learning-to-rank.readthedocs.io/en/latest/index.html) 을 참조하십시오.

```{tip}
그 판단 목록을 계속 수정하십시오!
```

## 4단계: 학습 순위 지정 활성화

제어판 &rarr; 구성 &rarr; 시스템 설정 &rarr; 검색 &rarr; 순위 학습에서 순위 학습을 활성화합니다. 간단한 켜기/끄기 구성과 검색 쿼리에 적용할 훈련된 모델의 이름을 입력해야 하는 텍스트 필드가 있습니다.

이전 단계의 모델 이름은 `linearregression`이므로 입력해야 합니다.

![시스템 설정 항목에서 Liferay의 순위 지정 학습을 활성화합니다.](./learning-to-rank/images/01.png)

이것이 교육된 모델, 기능 세트 및 Liferay의 검색 쿼리를 사용하여 Elasticsearch Learning to Rank 플러그인을 가져오는 데 필요한 모든 구성입니다.
