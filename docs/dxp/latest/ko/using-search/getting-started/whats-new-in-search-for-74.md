# 검색 7.4의 새로운 기능은 무엇인가요?

7.4 릴리스에 대한 Liferay의 검색 인프라에 몇 가지 주요 기능과 새로운 기능이 추가되었습니다. 새로운 기능에는 Liferay CE 7.4 GA4 및 Liferay DXP 7.4 GA1용 제품에 추가된 기능이 포함됩니다.

```{tip}
이후 7.4 DXP 업데이트 및 Portal GA 릴리스에 추가된 기능에 대해 알아보려면 릴리스 정보를 참조하십시오.

Liferay DXP: 릴리스 정보는 [고객 포털의 Liferay DXP 릴리스 정보 페이지](https://customer.liferay.com/dxp-release-notes) 에서 확인할 수 있습니다.

Liferay Portal: 릴리스 정보는 Liferay 커뮤니티 사이트에서 [릴리스 발표 블로그](https://liferay.dev/blogs/-/blogs) 로 제공됩니다. 예를 들어 [Liferay Portal 7.4 GA43 릴리스 발표](https://liferay.dev/blogs/-/blogs/liferay-portal-7-4-ga43-and-liferay-commerce-4-0-ga43-release) .
```

## Elasticsearch 7 통합

Elasticsearch 7은 Liferay 7.4에서 지원됩니다. 지원되는 최소 버전, 클라이언트 버전 및 지원되는 최신 Elasticsearch 버전을 포함한 최신 정보는 [검색 엔진 호환성 매트릭스](https://help.liferay.com/hc/ko/articles/360016511651) 을 확인하십시오.

![Elasticsearch 7.15는 Liferay DXP 7.4 GA1에서 실행되도록 지원됩니다.](./whats-new-in-search-for-74/images/03.png)

```{important}
* Elasticsearch 6.x는 Liferay CE/DXP 7.4에서 지원되지 않습니다.
* Solr는 Liferay CE/DXP 7.4에서 지원되지 않습니다.
```

## 검색 인프라 & 관리

### 가상 인스턴스를 독립적으로 재인덱싱

Liferay 7.4부터 서버 관리자는 재색인 작업의 범위를 특정 [가상 인스턴스](../../system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.md)로 제한할 수 있습니다. 인덱스 작업이 적용되는 인스턴스를 선택하려면

1. 글로벌 메뉴 열기 &rarr; 제어판 &rarr; 색인 작업 탭을 검색하고 클릭합니다.
1. 실행 범위 탭을 사용하여 다시 인덱싱할 인스턴스를 선택합니다.

   ![재인덱싱할 인스턴스를 선택합니다.](./whats-new-in-search-for-74/images/01.png)

## 위젯 검색

### Liferay 개체 검색

[Liferay Objects](../../building-applications/objects.md)검색을 지원하기 위해 일부 검색 위젯이 향상되었습니다.

* 유형 패싯은 게시된 개체를 자동으로 포함합니다.

   ![게시된 개체는 유형 패싯 위젯에 추가됩니다.](./whats-new-in-search-for-74/images/05.png)

* 검색 결과 위젯은 개체 항목의 제목과 요약을 자동으로 표시합니다.

   ![개체 항목에 대한 제목 및 내용 요약이 표시됩니다.](./whats-new-in-search-for-74/images/06.png)

<!-- * If configured in the Object, a display page can be shown when the Object Entry is clicked in Search Results. -->

Liferay 객체 및 검색에 대한 자세한 내용은 [Liferay 객체 검색](./searching-for-content.md#searching-for-liferay-objects) 을 참조하십시오.

## 튜닝 검색

> **DXP 가입자**

### 검색 튜닝 데이터는 데이터베이스에 저장됩니다.

DXP Liferay 7.4부터 결과 순위 및 동의어 집합 데이터가 Liferay 데이터베이스에 저장되며 검색 관리 패널의 색인 재지정 작업을 사용하여 각 애플리케이션의 색인을 적절한 데이터로 채울 수 있습니다. 이전 버전에서 인덱스는 이러한 애플리케이션의 기본 데이터 저장소로 사용되었습니다.

이것이 업그레이드 프로세스에 어떤 영향을 미치는지 알아보려면 [검색 인프라 업그레이드](../installing-and-upgrading-a-search-engine/elasticsearch/upgrading-elasticsearch/upgrading-search-infrastructure.md) 및 [Elasticsearch 백업](../installing-and-upgrading-a-search-engine/elasticsearch/upgrading-elasticsearch/backing-up-elasticsearch.md)을 읽어보십시오.

![다른 Liferay DXP 자산과 마찬가지로 검색 조정 데이터를 다시 인덱싱합니다.](./whats-new-in-search-for-74/images/02.png)

## Liferay 엔터프라이즈 검색(LES)

> ** [LES 가입자](https://www.liferay.com/products/dxp/enterprise-search) **

### LES 설치 간소화

Liferay DXP 7.4부터 [Liferay Enterprise Search(LES)](../liferay-enterprise-search.md) 애플리케이션이 모든 Liferay DXP 번들 및 Docker 컨테이너에 포함됩니다. LES는 기본적으로 활성화되어 있으며 추가 설치 단계가 필요하지 않습니다. 그러나 공식 Liferay 지원 및 추가 혜택을 받으려면 LES 애드온 구독을 구매해야 합니다. LES 애플리케이션에 대한 유지 관리 및 업데이트는 Liferay DXP 업데이트와 함께 제공됩니다.

![클러스터 간 복제와 같은 LES 앱은 Liferay DXP 7.4와 함께 설치됩니다.](./whats-new-in-search-for-74/images/04.png)

## DXP 7.4로 업그레이드

이전 DXP 버전에서 7.4로 업그레이드하는 경우 대부분의 설정에서 특별한 고려 사항이 필요하지 않습니다. 그러나 Liferay Enterprise Search 또는 Search Tuning을 사용하는 경우 다음 사항을 고려해야 합니다.

1. Search Tuning 애플리케이션은 이제 데이터베이스 테이블에 의해 지원되는 반면, 이전 버전은 데이터 저장을 위해 Elasticsearch 인덱스를 사용했습니다. 자세한 내용은 [검색 인프라 업그레이드](../installing-and-upgrading-a-search-engine/elasticsearch/upgrading-elasticsearch/upgrading-search-infrastructure.md) 을 참조하십시오.
1. Liferay 엔터프라이즈 검색 애플리케이션은 Liferay DXP와 함께 번들로 제공됩니다. 7.4로 업그레이드할 때 추가 설치 단계가 필요하지 않습니다.

## 관련 항목

* [검색 인프라 업그레이드](../installing-and-upgrading-a-search-engine/elasticsearch/upgrading-elasticsearch/upgrading-search-infrastructure.md)
* [7.4 주요 변경 사항](../../liferay-internals/reference/7-4-breaking-changes.md)
