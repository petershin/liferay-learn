---
toc:
  - ./clustering/configuring-the-database.md
  - ./clustering/configuring-search.md
  - ./clustering/configuring-the-dxp-cluster.md
---
# 클러스터링

안정성과 성능 향상을 위해 Liferay를 클러스터링할 수 있습니다. 이렇게 하면 한 서버에 장애가 발생하더라도 다른 서버가 계속해서 데이터를 제공합니다.

Liferay는 수평 클러스터링 또는 수직 클러스터링 접근 방식으로 구성할 수 있습니다. 수평적 클러스터에서는 각 노드가 별도의 시스템에서 실행됩니다. 수직 클러스터에서는 여러 가상 Java 시스템이 단일 시스템에서 실행됩니다.

여기에서 다음 방법을 알아보세요.

* 클러스터된 환경에 대한 데이터베이스 구성
* 클러스터링된 환경을 위한 Elasticsearch 구성
* 수평 클러스터에서 두 개의 Liferay 노드 실행

첫 번째 단계는 데이터베이스를 구성하는 것입니다.

[갑시다!](./clustering/configuring-the-database.md)
