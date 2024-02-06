---
toc:
  - ./clustering-for-high-availability/example-creating-a-simple-dxp-cluster.md
  - ./clustering-for-high-availability/configuring-cluster-link.md
    - ./clustering-for-high-availability/configuring-unicast-over-tcp.md
---
# 고가용성을 위한 클러스터링

Liferay DXP는 소규모 웹 사이트부터 대규모 웹 사이트까지 모든 규모에 맞게 확장할 수 있습니다. 즉시 사용 가능하며 단일 서버 환경에 최적으로 구성됩니다. 트래픽이 많을 것으로 예상되거나 사이트의 전반적인 내결함성을 개선하려는 경우 DXP를 클러스터링하는 것을 고려하세요.

![Liferay DXP는 필요한 만큼 대규모 설치로 확장할 수 있도록 설계되었습니다.](./clustering-for-high-availability/images/01.png)

Liferay DXP는 여러 머신의 클러스터(수평 클러스터) 또는 단일 머신의 여러 VM 클러스터(수직 클러스터) 또는 모든 조합에서 잘 작동합니다.

## 클러스터링 요구 사항

다음은 효과적으로 작동하는 DXP 클러스터를 만드는 데 필요한 사항입니다.

1. 별도의 애플리케이션 서버 노드에 Liferay DXP [설치](../installing-liferay.md)

1. 모든 노드에서 액세스할 수 있는 [데이터베이스 또는 데이터베이스 클러스터](./clustering-for-high-availability/database-configuration-for-cluster-nodes.md)

1. 모든 노드에서 액세스할 수 있는 [파일 저장소](../../system-administration/file-storage.md)

1. 선택적으로 클러스터링되는 [검색 엔진(DXP 외부에서 실행됨)](../../using-search/installing-and-upgrading-a-search-engine/installing-a-search-engine.md)

1. [모든 노드에서 통신 및 캐시 복제를 사용하도록 구성된 클러스터 링크](./clustering-for-high-availability/configuring-cluster-link.md)

```{note}
동시성 문제가 없고 마스터 노드가 올바르게 선택되었는지 확인하려면 노드를 순차적으로 시작하세요.
```

DXP 클러스터를 구성한 후에는 클러스터에 애플리케이션을 배포하고 사용자 경험을 지속적으로 개선할 수 있습니다. 자세한 내용은 [클러스터된 설치 유지 관리](../maintaining-a-liferay-installation/maintaining-clustered-installations.md) 를 참조하세요.

## 다음 단계

예제를 통해 클러스터를 생성하는 것은 DXP 클러스터링을 이해하는 첫 번째 단계입니다. [예제로 시작하세요: 간단한 DXP 클러스터 만들기](./clustering-for-high-availability/example-creating-a-simple-dxp-cluster.md) 에서 자세히 알아보세요. 그런 다음 위에 나열된 [클러스터링 요구 사항](#clustering-requirements) 을 참조하세요.

```{note}
이 문서에서는 Java EE 애플리케이션 서버, HTTP 서버, 로드 밸런서 등 타사 소프트웨어의 특정 구현에 대해서는 다루지 않고 DXP 전용 클러스터 구성에 대해 설명합니다. 구성하려면 해당 구성 요소에 대한 설명서를 참조하세요. DXP 클러스터를 만들기 전에 OS에서 시스템의 호스트 이름을 127.0.0.1로 로컬 네트워크에 정의하고 있지 않은지 확인하세요.
```
