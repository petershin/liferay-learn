---
toc:
  - ./semantic-search/setting-up-a-text-embedding-provider.md
  - ./semantic-search/creating-a-search-blueprint-for-semantic-search.md
---
# 시맨틱 검색
{bdg-secondary}`7.4 U70+`
{bdg-link-primary}`[베타 기능](../../../system-administration/configuring-liferay/feature-flags.md)`

```{toctree}
:maxdepth: 1

./semantic-search/setting-up-a-text-embedding-provider.md
./semantic-search/creating-a-search-blueprint-for-semantic-search.md
```

_시맨틱_ 검색은 검색된 구 뒤에 있는 의도를 평가합니다. 한편, _키워드_ 검색은 검색된 구문을 인덱스 텍스트 필드에 일치시키고 의미를 기반으로 일치를 생성할 수 없습니다.

| 검색된 문구    | 인덱싱된 콘텐츠                   | 일치 유형                                |
|:--------- |:-------------------------- |:------------------------------------ |
| 기술의 새로운 점 | Liferay, 7.3용 검색 환경 출시     | 시맨틱 &#10004;<br />키워드 &#10008; |
| 새로운 출시    | Liferay 검색 경험에서 출시된 새로운 기능 | 시맨틱 &#10004;<br />키워드 &#10004; |

Liferay(Elasticsearch에서 제공)와 같은 정교한 키워드 검색도 다음과 같은 독창적인 기술을 사용함에도 불구하고 사용자의 의도를 색인화된 문서와 일치시킬 수 없습니다.
- 키워드 및 문서 필드를 토큰화하기 위한 분석.
- 부정확한 일치를 가능하게 하는 흐릿함과 기울기.
- 동의어 일치를 허용하기 위해 단어를 어근으로 분해하는 형태소 분석.
- 중요하지 않은 단어를 무시하는 단어 중지.

토큰화된 키워드 및 문서 필드로 검색하면 많은 검색 요구에 충분할 수 있습니다. 검색 경험에서 더 많은 것이 필요한 경우 시맨틱 검색은 키워드 검색이 달성할 수 있는 것과 사용자가 검색에서 실제로 원하는 것 사이의 격차를 크게 줄여줍니다. 즉, 검색 단어뿐만 아니라 의도도 처리합니다.

![자연어 검색 구문은 시맨틱 검색 시스템에 의해 처리됩니다.](./semantic-search/images/03.png)

시맨틱 검색을 통해 추가 콘텐츠 처리 파이프라인을 사용할 수 있습니다. 활성화되면 플랫폼은 텍스트 임베딩이라는 입력 텍스트의 벡터 표현을 생성하고 이를 Elasticsearch의 인덱스 문서에 저장합니다. 검색 시 사용자가 입력한 검색 키워드는 동일한 벡터화 및 임베딩 프로세스를 거치므로 사용자에게 보다 의미 있는 검색 결과를 제공하는 유사성 검색을 수행할 수 있습니다. 모든 콘텐츠 유형이 텍스트 포함을 지원하는 것은 아닙니다.

| 지원되는 콘텐츠 유형 | 기본으로 활성됨? |
|:----------- |:--------- |
| Blogs입장     | &#10004;  |
| 기술 자료 문서    | &#10004;  |
| 전보국 메시지     | &#10008;  |
| 기본 웹 콘텐츠 기사 | &#10004;  |
| Wiki페이지     | &#10004;  |

```{important}
효과적인 시맨틱 검색 솔루션에는 데이터 도메인에 대해 훈련된 모델이 필요합니다. 가장 간단한 접근 방식은 적합한 사전 훈련된 모델을 찾은 다음 데이터에 맞게 미세 조정하는 것입니다. 여기에 설명된 예는 생산 준비가 된 시맨틱 검색 솔루션이 아닙니다.
```

## 시맨틱 검색 활성화

Liferay에서 시맨틱 검색을 활성화하려면

1. *글로벌 메뉴* (![Global Menu](../../../images/icon-applications-menu.png))을 연 다음 *제어판* &rarr; *인스턴스 설정*클릭합니다.
1. *플랫폼* &rarr; *기능 플래그* 섹션을 엽니다.
1. 베타 항목에서 시맨틱 검색을 활성화합니다.

![시맨틱 검색은 베타 기능이며 인스턴스 설정에서 활성화해야 합니다.](./semantic-search/images/02.png)

[포털 속성](../../../installation-and-upgrades/reference/portal-properties.md)을 사용하여 시맨틱 검색을 활성화하려면 다음을 `portal-ext.properties`에 추가하십시오.

```properties
feature.flag.LPS-122920=true
```

[환경 변수](../../../installation-and-upgrades/installing-liferay/using-liferay-docker-images/configuring-containers.md#using-liferay-env-variables)을 사용하여 시맨틱 검색을 활성화하려면 다음을 구성에 추가하십시오.

```properties
LIFERAY_FEATURE_PERIOD_FLAG_PERIOD__UPPERCASEL__UPPERCASEP__UPPERCASES__MINUS__NUMBER1__NUMBER2__NUMBER2__NUMBER9__NUMBER2__NUMBER0_=true
```

시맨틱 검색을 구성하려면

1. [모델을 선택하거나 직접 만드십시오.](#choosing-a-model)
1. [텍스트 임베딩 공급자를 활성화하고 Liferay에서 구성합니다.](./semantic-search/setting-up-a-text-embedding-provider.md)
1. [텍스트 임베딩을 다시 인덱싱합니다.](#re-indexing-the-text-embeddings)
1. [벡터화된 검색어와 문서 간의 유사성 검색을 수행하기 위해 검색 청사진을 생성합니다.](./semantic-search/creating-a-search-blueprint-for-semantic-search.md)

### 모델 선택

[적절하게 훈련된 모델](https://www.sbert.net/docs/pretrained_models.html) 이 가장 중요합니다. 인덱스의 데이터는 선택한 모델에 적합해야 합니다. 미리 훈련된 모델로 작업하는 것은 편리하지만 생산에 사용하기 전에 데이터를 미세 조정해야 할 수 있습니다. 강력한 테스트를 통해서만 선택한 모델이 적절하다는 것을 알 수 있습니다.

예를 들어 사용자가 _검색하면 스케이트는 어떻게 움직일까요?_볼 수 있듯이 해양 생물학에 대해 훈련된 모델은 레크리에이션에 대해 훈련된 모델과 다른 결과를 제공합니다.

[Hugging Face 모델 허브](https://huggingface.co/models) 은 사전 훈련된 도메인별 모델의 대규모 컬렉션을 제공합니다.

### 텍스트 임베딩 인덱싱

텍스트 임베딩은 다음과 같은 경우 인덱싱되어야 합니다.

1. 시맨틱 검색을 처음으로 활성화합니다.
1. 시맨틱 검색 구성에서 텍스트 임베딩 공급자, 모델, 벡터 차원 또는 텍스트 자르기 전략을 변경합니다.

텍스트 임베딩을 색인화하려면 색인 작업 화면을 사용하고 시맨틱 검색 시스템 또는 인스턴스 설정의 자산 항목 클래스 이름 설정에서 활성화한 모델 유형에 대해서만 _재색인_ 버튼을 클릭합니다.

## 시맨틱 검색 구성

텍스트 임베딩 공급자 설정 [](./semantic-search/setting-up-a-text-embedding-provider.md)시맨틱 검색에 추가 구성 옵션을 사용할 수 있습니다. 제어판 &rarr; 인스턴스 설정 &rarr; 시맨틱 검색을 방문하십시오.

텍스트 임베딩 제공자 설정은 [시맨틱 검색 활성화](#enabling-semantic-search)에서 다룹니다.

색인 설정에는 다음이 포함됩니다.

**최대 문자 수:** 텍스트 임베딩 공급자에게 보낼 최대 문자 수를 설정합니다. 기본적으로 최대 500개의 문자가 전송되어 벡터 표현으로 변환됩니다. 여기서 이상적인 값은 사용 중인 [텍스트 임베딩 공급자](./semantic-search/setting-up-a-text-embedding-provider.md) 에 따라 다릅니다.

**텍스트 자르기 전략:** 텍스트의 시작(기본값), 중간 또는 끝에서 사전 변환 샘플을 추출할지 여부를 선택합니다. 이 설정은 원본 텍스트가 최대 문자 수보다 긴 경우에만 적용됩니다. 전략 및 최대 문자 수에 따라 제목/주제 및 콘텐츠/본문의 일부를 사용하여 텍스트 임베딩을 생성할 수 있습니다.

**유형:** 변환할 콘텐츠 유형을 선택합니다. 기본적으로 블로그 항목, 기술 자료 문서, 웹 콘텐츠 문서 및 Wiki 페이지를 포함하여 지원되는 네 가지 유형이 처리됩니다. 메시지 보드 원하는 경우 메시지 엔터티를 구성할 수 있습니다.

```{note}
현재 기본 웹 콘텐츠 기사만 지원됩니다.
```

**언어:** 변환할 언어와 현지화를 선택합니다. 기본적으로 나열된 모든 언어가 선택됩니다. _Ctrl + 클릭_ 을 사용하여 목록에서 여러 언어를 선택합니다.

```{warning}
언어를 활성화해도 해당 언어에 대한 문장 임베딩이 생성된다는 보장은 없습니다. 해당 언어는 사이트에서 사용할 수 있어야 합니다. 시스템/인스턴스 설정에서 언어가 활성화되고 사이트에서 사용할 수 있지만 지정된 콘텐츠에 대한 번역이 없는 경우 기본 번역이 텍스트 임베딩을 생성하는 데 사용됩니다.
```

**텍스트 임베딩 캐시 시간 초과:** 변환된 검색 키워드에 대한 캐시 시간 초과를 밀리초 단위로 설정합니다. 캐시가 시간 제한 내에 있는 경우 Liferay는 텍스트 임베딩 제공자로부터 키워드의 텍스트 임베딩을 요청하지 않습니다. 기본적으로 제한 시간은 604800ms(약 10분)입니다.

## Liferay의 시맨틱 검색 이해

Liferay의 시맨틱 검색은 다음 중 하나입니다.

1. 검색 청사진에서 일반 인덱서가 비활성화되고 관련 콘텐츠를 검색하는 데 텍스트 임베딩만 사용되는 전체 시맨틱 검색입니다.

1. 키워드 검색이 먼저 수행되고 텍스트 임베딩이 결과의 점수를 다시 매기는 데 사용되는 하이브리드 시맨틱 검색입니다.

시맨틱 검색과 그 복잡성에 대한 강력한 이해를 제공하는 것은 이 간단한 설명의 범위를 벗어납니다. 다음은 시맨틱 검색의 몇 가지 기본 개념을 설명하면서 Liferay 하이브리드 시맨틱 검색 구현이 어떻게 작동하는지 설명합니다.

시맨틱 검색은 인덱스 시간과 검색 시간 모두에서 Liferay 검색에 영향을 미치며 추가 수준의 콘텐츠 처리를 도입합니다.

### 인덱싱 단계에서의 시맨틱 검색

* 첫째, 정기적인 콘텐츠 처리가 발생합니다.
  * [LIFERAY] Liferay의 콘텐츠는 데이터 유형에 따라 처리되는 검색 엔진으로 전송됩니다. 텍스트는 적절하게 분석되어 인덱스에 저장됩니다.
* [LIFERAY] 추가 시맨틱 검색 처리가 발생합니다.
   * 시스템/인스턴스 설정의 구성에 따라 Liferay에서 텍스트 스니펫을 텍스트 임베딩 공급자에게 보냅니다.
      * 최대 문자 수 및 텍스트 자르기 전략에 따라 텍스트 임베딩 공급자에게 전송되는 스니펫이 결정됩니다.
      * Liferay는 블로그 항목, 기술 자료 문서, Wiki 페이지, 기본 웹 콘텐츠 문서의 제목과 콘텐츠를 선택합니다. 게시판 메시지의 경우 제목 및 본문 필드가 처리됩니다.
  * [TEXT EMBEDDING PROVIDER] 먼저 매개변수에 따라 스니펫을 토큰화하는 구성된 모델에 따라 스니펫이 처리됩니다. 자주 사용되는 BERT 모델의 경우 512개는 모델이 처리하는 최대 토큰 수입니다. 이는 시스템/인스턴스 설정의 시맨틱 검색 &rarr; 최대 문자 수 설정에서 설정한 문자 수의 영향을 받습니다.
  * [텍스트 임베딩 공급자] 텍스트 임베딩이라고 하는 소스의 벡터 표현은 변환기에서 사용하는 모델을 기반으로 생성됩니다.
  * [LIFERAY] 텍스트 임베딩 프로세스의 결과는 각 문서[^1]에 대한 [dense_vector](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/dense-vector.html) 필드로 [Liferay Company Index](../../search-administration-and-tuning/elasticsearch-indexes-reference.md) 에 저장됩니다.
  * 시스템/인스턴스 설정의 구성에 따라 텍스트 스니펫이 텍스트 임베딩 공급자에게 전송되고 텍스트 임베딩이 발생하며 변환기에서 사용하는 모델을 기반으로 벡터 표현이 생성됩니다. 텍스트 임베딩 프로세스의 결과는 각 문서[^1]에 대한 [dense_vector](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/dense-vector.html) 필드로 [Liferay Company Index](../../search-administration-and-tuning/elasticsearch-indexes-reference.md) 에 저장됩니다.

### 검색 단계에서의 시맨틱 검색

* 일반 키워드 일치가 발생합니다.
  * 검색 창 위젯에 입력된 검색 구문은 Liferay의 검색 프레임워크에서 수신되어 분석 및 추가 처리를 위해 검색 엔진으로 전송되고 검색 엔진의 기존 색인 문서와 일치하며 관련성에 대해 점수가 매겨지고 추가를 위해 Liferay로 반환됩니다. 처리(강조 표시, 요약, 권한에 대한 추가 필터링 수행 등).
* 추가 시맨틱 검색 처리가 발생합니다.
  * 검색 구문이 텍스트 임베딩 공급자에게 전송되고 벡터 표현이 생성됩니다( [텍스트 임베딩](https://neuml.github.io/txtai/embeddings/)). 키워드 검색 관련성에 의해 점수가 매겨진 검색 결과를 렌더링하기 전에 창 제한 설정 내에서 캡처된 결과는 검색 구의 벡터 표현을 인덱스 문서의 벡터 표현과 비교하여 다시 점수가 매겨집니다. 새 점수가 계산되고 최종 사용자가 사용할 수 있도록 결과가 검색 페이지로 반환됩니다. 자세한 내용은 Elastic의 [벡터 검색이란 무엇입니까](https://www.elastic.co/what-is/vector-search) 참조하십시오.

[^1]: 문서의 필드를 검사하려면 [문서 형식](../../search-pages-and-widgets/search-results/configuring-the-search-results-widget.md) 에 결과 표시 설정 또는 [검색 청사진 미리보기](./search-blueprints/creating-and-managing-search-blueprints.md#testing-a-blueprint-with-the-preview-sidebar) 기능을 사용합니다.
