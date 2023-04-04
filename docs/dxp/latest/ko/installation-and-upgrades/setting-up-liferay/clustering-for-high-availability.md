---
toc:
- ./clustering-for-high-availability/example-creating-a-simple-dxp-cluster.md
- ./clustering-for-high-availability/database-configuration-for-cluster-nodes.md
- ./clustering-for-high-availability/configuring-cluster-link.md
- ./clustering-for-high-availability/configuring-unicast-over-tcp.md
uuid: e38676bb-0c00-45cb-a1ff-37038f7ad701
---

# 고가용성을 위한 클러스터링

```{toctree}
:maxdepth: 3

고가용성을 위한 클러스터링/example-creating-a-simple-dxp-cluster.md
고가용성을 위한 클러스터링/데이터베이스 구성을 위한 클러스터 노드.md
고가용성을 위한 클러스터링 -availability/configuring-cluster-link.md
clustering-for-high-availability/configuring-unicast-over-tcp.md
```

Liferay DXP는 가장 작은 웹 사이트에서 가장 큰 웹 사이트에 이르기까지 모든 것을 제공하도록 확장할 수 있습니다. 기본적으로 단일 서버 환경에 최적으로 구성되어 있습니다. 높은 트래픽이 예상되거나 사이트의 전반적인 내결함성을 개선하려는 경우 DXP 클러스터링을 고려하십시오.

![Liferay DXP는 필요에 따라 대규모 설치로 확장할 수 있도록 설계되었습니다.](./clustering-for-high-availability/images/01.png)

Liferay DXP는 여러 시스템의 클러스터(수평 클러스터) 또는 단일 시스템의 여러 VM 클러스터(수직 클러스터) 또는 모든 조합에서 잘 작동합니다.

## 클러스터링 요구 사항

효과적으로 작동하는 DXP 클러스터를 생성하는 데 필요한 사항은 다음과 같습니다.

1.  별도의 애플리케이션 서버 노드에 있는 Liferay DXP [installed](../installing-liferay.md)

2.  모든 노드에 액세스할 수 있는 [데이터베이스 또는 데이터베이스 클러스터](./clustering-for-high-availability/database-configuration-for-cluster-nodes.md)

3.  모든 노드에서 액세스할 수 있는 [파일 저장소](../../system-administration/file-storage.md)

4.  [선택적으로 클러스터링되는 검색 엔진(DXP 외부에서 실행)](../../using-search/installing-and-upgrading-a-search-engine/installing-a-search-engine.md)

5.  [모든 노드에서 통신 및 캐시 복제를 활성화하도록 구성된 클러스터 링크](./clustering-for-high-availability/configuring-cluster-link.md)

```{note}
동시성 문제가 없고 마스터 노드가 올바르게 선택되었는지 확인하려면 노드를 순차적으로 시작하십시오.
```

DXP 클러스터를 구성한 후 여기에 애플리케이션을 배포하고 사용자 경험을 계속 개선할 수 있습니다. 자세한 내용은 [클러스터 설치 유지 관리](../maintaining-a-liferay-installation/maintaining-clustered-installations.md)를 참조하십시오.

## 무엇 향후 계획

예시를 통해 클러스터를 생성하는 것은 DXP 클러스터링을 이해하는 훌륭한 첫 단계입니다. 자세한 내용은 [예제: 단순 DXP 클러스터 생성](./clustering-for-high-availability/example-creating-a-simple-dxp-cluster.md)부터 시작하십시오. 그런 다음 위에 나열된 [클러스터링 요구 사항](#clustering-requirements)을 처리합니다.

```{note}
이 문서에서는 Java EE 애플리케이션 서버, HTTP 서버 및 로드 밸런서와 같은 타사 소프트웨어의 특정 구현을 사용하지 않고 DXP 특정 클러스터 구성에 대해 설명합니다. 해당 구성 요소에 대한 설명서를 참조하여 구성하십시오. DXP 클러스터를 생성하기 전에 OS가 127.0.0.1에서 로컬 네트워크에 대한 시스템의 호스트 이름을 정의하지 않는지 확인하십시오.
```
