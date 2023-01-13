# 검색 관리

*Control Panel* &rarr; *Configuration* &rarr; *Search* 에는 연결, 인덱스 작업 및 필드 매핑의 세 가지 관리 UI가 있습니다. Connections는 설치가 연결된 검색 엔진을 보여주고, Index Actions는 재인덱싱을 위한 인터페이스이며, Field Mappings는 Liferay에서 검색 인덱스로 매핑된 필드를 표시합니다.

![검색 관리 패널에는 세 개의 관리 화면이 있습니다.](./search-administration/images/02.png)

## 연결

검색 엔진 연결에 대한 정보가 여기에 표시됩니다. 예를 들어,

* 검색 엔진 공급업체: Elasticsearch
* 클라이언트 버전: 7.17.1
* 활성 연결: 1
* 건강: 녹색
* 연결 ID: \_REMOTE\_
* 연결 유형: 읽기/쓰기
* 클러스터 이름: LiferayElasticsearchCluster
* 노드: 1
* 노드 이름: lr-es
* 노드 버전: 7.15.1

## 인덱스 작업

색인 작업에서 다음 수준 중 하나에서 색인을 다시 생성합니다.

   * 인덱싱 가능한 모든 자산
   * 개별 인덱싱 가능한 자산
   * 모든 맞춤법 검사 색인

Liferay 7.4부터 서버 관리자는 재색인 작업의 범위를 특정 [가상 인스턴스](../../system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.md)로 제한할 수도 있습니다. 인덱스 작업이 적용되는 인스턴스를 선택하려면

1. 글로벌 메뉴 열기 &rarr; 제어판 &rarr; 색인 작업 탭을 검색하고 클릭합니다.
1. 실행 범위 탭을 사용하여 다시 인덱싱할 인스턴스를 선택합니다.

   ![재인덱싱할 인스턴스를 선택합니다.](./search-administration/images/03.png)

```{note}
[Workflow Metrics](../process-automation/workflow/using-workflows/using-workflow-metrics.md)는 애플리케이션의 전용 설정 메뉴를 통해 다시 인덱싱됩니다. Global Menu에서 Applications &rarr; Workflow 섹션의 _Metrics_를 클릭한 다음 Settings 창을 엽니다(![Options](../../images/icon-actions.png)). 자세한 내용은 [워크플로 메트릭 재인덱싱](../process-automation/workflow/using-workflows/using-workflow-metrics.md#re-indexing-workflow-metrics)을 참조하십시오.
```

## 필드 맵핑

필드 매핑 탭에는 시스템에서 유효한 모든 필드 매핑이 인덱스별로 표시됩니다. 현재 매핑을 보고, 복사하고, 확대 또는 축소하고, 어두운 테마로 볼 수 있습니다.

![Elasticsearch 클러스터의 인덱스에 대한 필드 매핑을 검사합니다.](./search-administration/images/01.png)

## 관련 내용

* [검색 구성 참조](../search-configuration-reference.md)
* [문맥 재산](../../installation-and-upgrades/reference/portal-properties.md)
* [Elasticsearch 커넥터 구성 참조](../installing-and-upgrading-a-search-engine/elasticsearch/elasticsearch-connector-configuration-reference.md)
