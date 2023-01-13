# 검색 7.3의 새로운 기능은 무엇인가요?

## Elasticsearch 통합

### 엘라스틱서치 7 지원

> 가용성: Liferay CE 7.3 GA4+, Liferay DXP 7.3 GA1+

Liferay DXP 7.3은 Elasticsearch 7을 즉시 지원합니다. 최소 필수 버전은 7.9입니다. 자세한 지원 정보는 [검색 엔진 호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/360016511651) 을 참조하십시오.

```{important}
Elasticsearch 6.x는 Liferay CE/DXP 7.3에서 지원되지 않습니다.
```

### Elasticsearch 7 커넥터는 REST 클라이언트를 기반으로 합니다.

> 가용성: Liferay CE 7.3 GA4+, Liferay DXP 7.3 GA1+

DXP 7.3과 함께 번들로 제공되는 Elasticsearch 7 커넥터는 [Elastic의 Java REST Client](https://www.elastic.co/guide/en/elasticsearch/client/java-rest/7.x/java-rest-overview.html) 을 사용하여 HTTP를 통해 Elasticsearch와 통신합니다. 이 통신 프로토콜은 DXP와 Elasticsearch 간의 Java 직렬화가 필요하지 않으므로 이제 Elasticsearch 7 노드를 Liferay DXP와 다른 JVM에서 실행할 수 있습니다.

### X-Pack 보안 기능 통합

> 가용성: Liferay 7.3 CE GA4+, Liferay DXP 7.3 GA1+

_Liferay Enterprise Search Security_ (이전 _Liferay Connector to X-Pack Security_) 모듈의 기능은 _Liferay Connector to Elasticsearch 7_에 포함되어 있습니다. CE/DXP 7.3의 모든 고객은 [Liferay Enterprise Search(LES)](https://www.liferay.com/products/dxp/enterprise-search) 구독 없이 Elasticsearch 클러스터에 안전하게 연결할 수 있습니다.

[업그레이드](../installing-and-upgrading-a-search-engine/elasticsearch/upgrading-elasticsearch.md) 가이드에는 암호화 구성을 Elasticsearch 7 커넥터로 이동하는 방법에 대한 정보가 포함되어 있습니다.

### 다중 Elasticsearch 연결

> 가용성: Liferay CE 7.3 GA4+, Liferay DXP 7.3 GA1+

여러 Elasticsearch 클러스터에 대한 연결을 구성합니다. Liferay DXP 7.2에서는 Liferay가 연결된 Elasticsearch 클러스터의 모든 인덱스(Liferay가 아닌 인덱스 포함)에 대해 쿼리할 수 있었습니다. 이제 비 Liferay Elasticsearch 클러스터의 인덱스에 대해 쿼리할 수 있습니다. 이 기능은 저수준 검색 옵션 및 검색 결과 위젯과 함께 사용하여 Elasticsearch 클러스터를 사용하는 타사 시스템의 결과를 표시할 수 있습니다. 이 기능은 주로 LES(Liferay Enterprise Search) [클러스터 간 복제](#cross-cluster-replication) 기능을 지원하기 위해 추가되었습니다.

### 임베디드 모드가 사이드카로 대체됨

> 가용성: Liferay CE 7.3 GA4+, Liferay DXP 7.3 GA1+

[개발](#development)아래의 [사이드카](#a-sidecar-elasticsearch-7-is-bundled) 섹션을 참조하십시오.

## 검색 인프라 & 관리

### 다중 테넌트 색인 이름

> 가용성: Liferay 7.3 CE GA6+, Liferay DXP 7.3 GA1+, Liferay DXP 7.2 SP3+/FP8+

다중 테넌트 설치에서 단일 Elasticsearch 클러스터는 여러 Liferay CE/DXP 배포의 인덱스를 보유합니다. 적절하게 네임스페이스가 지정된 인덱스에 대한 필요성이 가장 중요합니다. 7.2(FP8/SP3 이전)에서는 인덱스 이름이 일치하지 않아 다중 테넌트 설치가 불가능할 수 있습니다. 최신 7.2 패치 및 7.3에서 모든 Liferay CE/DXP 인덱스(특정 애플리케이션에 의해 제어되는 인덱스 포함)는 시스템 설정의 Elasticsearch 7 구성 항목을 통해 접두사가 구성됩니다. 타사 애플리케이션 색인은 이제 동일한 API를 활용하여 설치 전체에서 일관된 네임스페이스 색인을 보장할 수 있습니다.

```bash
[indexNamePrefix]-[companyId]-[appName]
```

예를 들어,

```
liferay-20096-search-tuning-rankings
```

DXP 7.2 SP2 이하에서 7.3으로 업그레이드하면 새 DXP 인덱스가 자동으로 생성됩니다. 전체 재색인을 수행하고 성공적인 업그레이드를 확인한 후 이전 색인을 삭제할 수 있습니다.

### 검색 관리의 연결

> 가용성: Liferay CE 7.3 GA1+, Liferay DXP 7.3 GA1+

제어판의 검색 항목(구성 섹션에 있음)을 통해 Elasticsearch 연결의 상태를 봅니다. 보다

- 연결된 각 Elasticsearch 클러스터의 상태
- 각 클러스터 내의 노드 이름 및 버전
- Elasticsearch 클라이언트 버전

이는 이전 버전의 인덱스 작업 페이지 상단에 있는 정보 표시줄을 대체합니다.

### 표준화된 색인 문서 ID

> 가용성: Liferay CE 7.3 GA1+, Liferay DXP 7.3 GA1+

색인 문서의 UID(또는 `id`)는 이제 Liferay DXP 엔티티의 데이터베이스 행과 일대일 패리티를 갖습니다.

## 위젯 검색

### 위젯 템플릿을 사용하여 검색 위젯 사용자 지정

> 가용성: Liferay CE 7.3 GA4+, Liferay DXP 7.3 GA1+

검색 위젯은 이제 Freemarker 또는 Velocity 템플릿을 사용하여 각 위젯의 시각적 모양과 느낌을 사용자 지정하기 위해 [위젯 템플릿](./../../site-building/displaying-content/additional-content-display-options/styling-widgets-with-widget-templates.md) (이전에는 애플리케이션 표시 템플릿이라고 함)을 지원합니다. 예를 들어 카드 레이아웃을 표시하도록 검색 결과 위젯을 구성할 수 있으며 `작성자` 또는 `수정 날짜` 과 같은 자산 속성을 표시하거나 숨길 수 있습니다. 일부 기본 템플릿은 지원되는 각 검색 위젯에 대해 즉시 제공됩니다.

### 유사 결과

> **가입자**

> 가용성: Liferay DXP 7.3 GA1+와 함께 제공, [유사한 결과](https://web.liferay.com/marketplace/-/mp/application/172465398) Marketplace 앱을 통해 Liferay DXP 7.2 SP2+에 설치 가능

유사한 결과 위젯은 페이지의 기본 자산과 유사한 자산 모음을 표시합니다. 위젯은 URL을 사용하여 기본 자산 표시를 결정하고 이 쿼리</a> 과 같은 Elasticsearch의

을 활용하여 추가 자산을 찾습니다. 기본 자산은 표시 위젯(예: 블로그 위젯) 또는 자산 게시자를 사용하여 표시할 수 있습니다.</p> 

유사한 결과의 첫 번째 버전은 블로그, 게시판, 문서 및 위키를 지원합니다. 추가 자산 유형(네이티브 및 사용자 지정 자산 모두)에 대한 지원은 [확장점](../developer-guide/writing-a-similar-results-contributor.md)을 구현하여 가능합니다. 문서 유사성을 결정하는 데 사용되는 논리는 Elasticsearch의 More Like This [쿼리 매개변수](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-mlt-query.html)에 따라 구성할 수 있습니다. 

자세한 내용은 [유사한 결과](../search-pages-and-widgets/similar-results.md) 을 참조하십시오.



## 튜닝 검색



> **가입자**



### 검색 조정: 결과 순위



> 가용성: 라이프레이 DXP 7.2 SP1+, 라이프레이 DXP 7.3 GA1+

결과 순위는 주어진 쿼리에 대한 결과 관련성을 사용자 정의하기 위한 그래픽 UI입니다. 결과 순위에는 관련성을 수동으로 조정하는 세 가지 주요 기능이 있습니다.

1. 쿼리 결과를 고정하고 목록 맨 위에 정렬할 수 있습니다. 원하는 문서가 원본 결과 목록에 없으면 수동으로 추가할 수 있습니다. 이를 통해 사용자는 높은 가치의 결과를 홍보할 수 있습니다.
1. 결과 목록에서 결과를 숨길 수 있습니다. 이 기능은 오래되었거나 관련이 없는 결과를 제거하는 데 사용할 수 있습니다.
1. 별칭은 동일한 사용자 지정 고정 및 숨겨진 결과를 대체 검색 쿼리에 적용합니다. 예를 들어 "디지털 경험 플랫폼" 쿼리에 대해 고정 및 숨겨진 결과로 결과 순위가 생성된 경우 별칭 "portal" 및 "dxp"를 추가하면 동일한 고정 및 숨겨진 결과가 적용됩니다.



### 튜닝 검색: 동의어



> 가용성: 라이프레이 DXP 7.2 SP1+, 라이프레이 DXP 7.3 GA1+

동의어는 검색 시 동의어 쿼리에 동등한 가중치를 부여하여 비슷한 의미의 쿼리를 연결합니다. 예를 들어 "휴대 전화", "휴대 전화" 및 "손 전화"라는 검색어는 동일한 의미를 가지며 상호 교환하여 사용할 수 있습니다. 이 세 가지 쿼리로 동의어 집합을 정의하면 "휴대 전화" 또는 "손 전화"라는 단어가 포함된 "휴대 전화" 문서를 검색하는 사용자가 표시됩니다. Elastic</a>의 동의어 문서를 참조하세요.</p> 



## Liferay 엔터프라이즈 검색(LES)



> **[LES 가입자](https://www.liferay.com/products/dxp/enterprise-search)**



### 클러스터 간 복제(LES)



> 가용성: [Liferay Enterprise 검색 클러스터 간 복제](../liferay-enterprise-search/cross-cluster-replication/cross-cluster-replication.md) 애플리케이션을 통한 Liferay DXP 7.2 SP3+, Liferay DXP 7.3 GA1+.

클러스터 간 복제 애플리케이션은 재해 복구(고가용성) 및 지리적 근접성 성능 최적화를 위해 원격 데이터 센터 간에 Elasticsearch 클러스터를 복제합니다. 활성-수동 모델을 사용하여 분산 클러스터 간에 검색 인덱스를 복제하는 Elasticsearch의 [클러스터 간 복제](https://www.elastic.co/guide/en/elasticsearch/reference/7.9/xpack-ccr.html) 기능을 활용합니다. 모든 DXP 노드에 대한 모든 쓰기 작업은 단일 리더 인덱스로 라우팅되는 반면, 각 DXP 클러스터 노드는 모든 팔로워 인덱스에서 읽도록 구성할 수 있습니다.



### 순위 학습(LES)



> 가용성: Liferay DXP 7.2 SP2+, Liferay DXP 7.3 GA1+, [Liferay Enterprise 검색 학습을 통해](https://web.liferay.com/marketplace/-/mp/application/170666298) 순위 애플리케이션.

최적의 결과를 얻기 위해 검색을 수동으로 조정하는 것은 어렵습니다. 하나의 특정 검색어에 대해 검색 알고리즘을 최적화하면 의도치 않게 수백 개의 다른 검색어에 대한 결과가 좋지 않을 수 있습니다.

LTR(Learning to Rank)은 기계 학습(ML) 모델을 적용하여 검색 결과를 개선함으로써 이 문제를 해결합니다. 모델은 다음에 의해 훈련됩니다. 

- "특징" 선택(모델이 훈련될 때 고려할 검색 요소에 대한 용어-예: 최신성, 지리적 근접성, 태그 일치)
- 수동(예: 쿼리에 대한 결과 등급 지정 검색 전문가) 또는 반자동(예: 쿼리에 대한 사용자 클릭률 측정)으로 선별된 판단 목록("실측 정보"라고도 함)을 제공합니다.

판단 목록은 모델 교육에 정보를 제공하고 안내하는 진실의 출처입니다. 사용자가 검색 쿼리를 제출하면 LTR은 검색 엔진에서 반환된 처음 _x_ 개의 결과(기본적으로 처음 1,000개의 결과)를 가져온 다음 목록을 반환하기 전에 학습된 모델을 사용하여 해당 결과의 점수를 다시 매기고 재정렬합니다. 사용자에게.



### LES 애플리케이션의 이름이 변경됨

Liferay CE/DXP 7.3 릴리스에 명시적으로 연결되어 있지는 않지만 이러한 앱은 기능을 더 잘 반영하고 LES 앱으로서의 정체성을 강조하기 위해 이름이 변경되었습니다.

| 기능                      | 이전 앱 이름                                        | 새 앱 이름                      |
|:----------------------- |:---------------------------------------------- |:--------------------------- |
| Elasticsearch 클러스터 모니터링 | X-Pack 모니터링에 대한 Liferay 커넥터[Elastic Stack 6.x] | Liferay 엔터프라이즈 검색 모니터링      |
| Elasticsearch 클러스터 보안   | X-Pack 보안에 대한 Liferay 커넥터[Elastic Stack 6.x]   | Liferay 엔터프라이즈 검색 보안        |
| 기계 학습을 사용하여 검색 알고리즘 최적화 | 순위를 매기는 Elasticsearch 학습에 대한 Liferay 커넥터       | Liferay Enterprise 검색 순위 학습 |
| 원격 데이터 센터에서 인덱스 복제      | NA(새 앱)                                        | Liferay 엔터프라이즈 검색 클러스터 간 복제 |




## 발달



### 새 인덱스 설정 기여자 확장 지점



> 가용성: Liferay CE 7.3 GA6+, Liferay DXP 7.3 GA1+

Elasticsearch 버전에 구애받지 않는 `IndexSettingsContributor` 이 추가되었습니다(여기에[src 코드)](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-search/portal-search-spi/src/main/java/com/liferay/portal/search/spi/settings/IndexSettingsContributor.java):

* `com.liferay.portal.search.spi.settings.IndexSettingsContributor`
* `com.liferay.portal.search.spi.settings.IndexSettingsHelper.java`
* `com.liferay.portal.search.spi.settings.TypeMappingsHelper.java`



### 사이드카 Elasticsearch 7이 번들로 제공됨



> 가용성: Liferay CE 7.3 GA4+, Liferay DXP 7.3 GA1+

Elasticsearch의 호환 버전은 Liferay CE/DXP 7.3+ Tomcat 번들과 함께 번들로 제공되며 _사이드카_ JVM에서 동시에 시작됩니다. 이 사이드카 설치를 _개발 모드_이라고 하며 이전 _임베디드_ 모드를 대체합니다(둘 다 프로덕션 설치에 대해 지원되지 않음). 사이드카에는 시스템 설정의 Elasticsearch 7 구성에 전용 속성이 있습니다. 기본적으로 HTTP 포트 9201에서 실행됩니다. 자세한 내용은 [사이드카 또는 임베디드 Elasticsearch 사용](../installing-and-upgrading-a-search-engine/elasticsearch/using-the-sidecar-or-embedded-elasticsearch.md) 을 참조하십시오.

사이드카 Elasticsearch 서버는 처음 시작할 때 자동으로 다운로드됩니다. 배포에서 사이드카 서버를 다운로드할 수 없는 경우 [Elasticsearch를 원격 서버로 설치합니다](../installing-and-upgrading-a-search-engine/elasticsearch/getting-started-with-elasticsearch.md).



## DXP 7.3으로 업그레이드

이전 DXP 버전에서 7.3으로 업그레이드하려면 [REST 클라이언트](#the-elasticsearch-7-connector-is-based-on-the-rest-client)로 전환하기 때문에 몇 가지 특별한 단계가 필요합니다. 업그레이드 과정에 도움이 되는 중요한 정보는 [업그레이드 설명서](../installing-and-upgrading-a-search-engine/elasticsearch/upgrading-elasticsearch.md) 을 참조하십시오.



## 관련 항목

[7.3 주요 변경 사항: DDM 필드 인덱싱](../../liferay-internals/reference/7-3-breaking-changes.md#dynamic-data-mapping-fields-in-elasticsearch-have-changed-to-a-nested-document)
