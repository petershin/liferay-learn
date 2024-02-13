---
toc:
  - ./upgrading-elasticsearch/upgrading-search-infrastructure.md
  - ./upgrading-elasticsearch/upgrading-to-elasticsearch-8.md
  - ./upgrading-elasticsearch/upgrading-to-elasticsearch-7.md
  - ./upgrading-elasticsearch/backing-up-elasticsearch.md
---
# Elasticsearch 업그레이드

Liferay는 Elasticsearch 8을 지원합니다. [호환성 매트릭스](https://help.liferay.com/hc/ko/sections/360002103292-Compatibility-Matrix) 은 최신 지원 세부 정보를 제공합니다.

```{important}
Solr 통합은 Liferay 7.3에서 더 이상 사용되지 않으며 7.4에서 제거되고 Elasticsearch 통합으로 대체됩니다. Elasticsearch로 마이그레이션하려면 [Elasticsearch 설정](./getting-started-with-elasticsearch.md) 및 [Liferay 연결](./connecting-to-elasticsearch.md)이 필요합니다.
```

```{important}
Elasticsearch 6.x는 Liferay 7.3+에서 지원되지 않습니다.
```

업그레이드를 계획하기 전에 [검색 인프라 업그레이드](./upgrading-elasticsearch/upgrading-search-infrastructure.md)읽으십시오. 이전 Liferay/Elasticsearch 시스템을 지원되는 최신 검색 스택으로 업그레이드하는 데 필요한 단계에 대한 개요를 제공합니다. 항상 [Elasticsearch를 업그레이드하기 전에 [검색 색인을 백업하십시오](./upgrading-elasticsearch/upgrading-to-elasticsearch-8.md)](./upgrading-elasticsearch/backing-up-elasticsearch.md).

* [검색 인프라 업그레이드](upgrading-elasticsearch/upgrading-search-infrastructure.md)
* [Elasticsearch 8로 업그레이드](upgrading-elasticsearch/upgrading-to-elasticsearch-8.md)
* [Elasticsearch 7로 업그레이드](upgrading-elasticsearch/upgrading-to-elasticsearch-7.md)
* [Elasticsearch 백업](upgrading-elasticsearch/backing-up-elasticsearch.md)
