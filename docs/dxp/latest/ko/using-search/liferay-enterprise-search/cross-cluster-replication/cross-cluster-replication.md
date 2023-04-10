# 교차 클러스터 복제

> **Liferay 엔터프라이즈 검색(LES) 가입자**

기존 Liferay DXP/검색 엔진 설치에서 하나의 Liferay DXP 클러스터는 하나의 Elasticsearch 클러스터와 통신하여 검색 엔진 클러스터에 대한 하나의 연결을 통해 모든 읽기(검색 쿼리 실행) 및 쓰기(문서 생성) 요청을 보냅니다. 이 설정에서는 모든 Elasticsearch 클러스터 노드가 단일 데이터 센터에 있다고 가정합니다(Liferay DXP 서버와 다른 데이터 센터에 있을 수 있음).

데이터 사이트 및 재해 복구에 대한 우려를 해결하기 위해 Elasticsearch는 Elasticsearch 7+에 대해 [LES 가입자](https://www.liferay.com/products/dxp/enterprise-search) 가 Liferay DXP와 함께 사용할 수 있는 [CCR(Cross-Cluster Replication)](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/xpack-ccr.html) 기능을 출시했습니다(버전 호환성 세부 정보는 [LES 호환성 매트릭스](https://help.liferay.com/hc/ko/articles/360016511651#Liferay-Enterprise-Search) 참조). ). LES CCR 모듈을 사용하면 대체 형태의 다중 데이터 센터 배포를 달성할 수 있습니다. Elasticsearch 클러스터의 노드를 여러 데이터 센터에 분산하는 것은 허용하지 않지만 각 데이터 센터에서 별도의 Elasticsearch 클러스터를 구성하고 연결할 수 있습니다.

이 구성은 **리더** 인덱스를 포함하는 하나의 클러스터와 리더에서 복제된 **팔로워** 인덱스를 포함하는 하나 이상의 클러스터를 가정합니다. 팔로어 인덱스는 Liferay DXP에서만 데이터를 읽는 데 사용됩니다. 리더 인덱스는 항상 쓰기에 사용되지만 읽기에도 사용할 수 있습니다.

![클러스터 간 복제를 사용하면 서로 다른 데이터 센터가 Liferay DXP 인덱스와 동기화된 Elasticsearch 클러스터를 보유할 수 있습니다.](./cross-cluster-replication/images/01.png)

위의 다이어그램은 CCR의 최소 예를 보여줍니다. 각 데이터 센터에는 하나 이상의 DXP 노드와 하나의 Elasticsearch 클러스터가 있습니다. 미국 데이터 센터에는 모든 DXP 노드가 쓰는 리더 인덱스가 있습니다. 헝가리 데이터 센터는 로컬(헝가리) DXP 노드가 읽는 팔로워 인덱스를 보유합니다. 데이터는 리더에서 팔로워로 한 방향으로 복제됩니다.

Liferay DXP는 WAN(Wide Area Network) 프로토콜을 통해 서로 다른 사이트에 노드가 있는 분산 클러스터 개념을 오랫동안 지원해 왔습니다. Liferay DXP의 유연성과 Elasticsearch의 클러스터 간 복제 지원은 다양한 시스템 설계를 지원할 수 있습니다.

클러스터 간 복제를 설정하려면 다음을 수행해야 합니다.

- [LES 활성화](../activating-liferay-enterprise-search.md)
- Liferay 7.2 및 7.3에서 팔로워 Elasticsearch 인덱스에서 읽는 Liferay DXP 노드에 CCR 모듈을 설치합니다.
- 리더 클러스터에서 복제할 인덱스 선택
- Elasticsearch 클러스터 구성
- Liferay DXP 클러스터의 Elasticsearch 연결 구성
- 팔로어 인덱스에서 읽는 Liferay DXP 노드에서 클러스터 간 복제 활성화 및 구성

## Liferay DXP: LES 클러스터 간 복제 모듈 설치

```{note}
Liferay DXP 7.4부터 Liferay Enterprise Search(LES) 애플리케이션이 모든 Liferay DXP 번들 및 Docker 컨테이너에 포함됩니다. 따라서 Liferay DXP 7.4+에서는 모듈을 설치할 필요가 없습니다. 자세한 내용은 [LES 활성화](../activating-liferay-enterprise-search.md)를 참조하십시오.
```

로컬 클러스터의 팔로워 인덱스에서 읽고 원격 클러스터의 리더 인덱스에 대한 별도의 연결을 통해 쓰는 Liferay DXP 노드에는 CCR 모듈이 설치되어 있어야 합니다. 일관성과 적응성을 위해 클러스터의 모든 노드에 설치하는 것이 가장 좋습니다. 이 모듈은 LES 구독으로 다운로드할 수 있습니다(LPKG 파일로).

## Liferay DXP: 원격 클러스터에서 복제할 인덱스 결정

설치 시 기본 Liferay DXP 7.3 색인은 아래 목록과 비슷합니다(변경될 수 있음). 기본 글로벌 **인덱스 이름 접두사** `liferay-`이며 Elasticsearch 7 커넥터 구성에서 변경할 수 있습니다. `20101` 데이터베이스에서 주어진 회사의 생성된 `companyId` 입니다. UI에 인스턴스 ID로 표시되며 [가상 인스턴스](../../../system-administration/configuring-liferay/virtual-instances.md)나타냅니다.

| 색인 ID                                               | 인덱스 유형 | 색인 목적                                                    |
|:--------------------------------------------------- |:------ |:-------------------------------------------------------- |
| 생명선-0                                               | 시스템 색인 | 시스템 설정 애플리케이션에서 검색                                       |
| 라이프레이-20101                                         | 회사 인덱스 | Liferay DXP 가상 인스턴스의 인덱싱된 자산 검색                          |
| liferay-20101-검색-조정-순위                              | 앱 인덱스  | 결과 순위 애플리케이션을 위한 저장소                                     |
| liferay-20101-검색-튜닝-동의어                             | 앱 인덱스  | 지정된 가상 인스턴스에 대한 동의어 세트 애플리케이션용 스토리지                      |
| liferay-20101-workflow-metrics-instances            | 앱 인덱스  | Workflow Metrics 애플리케이션의 Workflow 인스턴스에 대한 데이터 저장        |
| liferay-20101-workflow-metrics-nodes                | 앱 인덱스  | 워크플로 메트릭 애플리케이션의 워크플로 노드에 대한 데이터 저장                      |
| liferay-20101-workflow-metrics-processes            | 앱 인덱스  | 워크플로 메트릭 애플리케이션의 워크플로 프로세스에 대한 데이터 저장                    |
| liferay-20101-workflow-metrics-sla-instance-results | 앱 인덱스  | Workflow Metrics 애플리케이션의 Workflow Instance당 SLA 결과 저장    |
| liferay-20101-workflow-metrics-sla-task-results     | 앱 인덱스  | Workflow Metrics 애플리케이션에 대한 Workflow Task당 SLA 결과 저장     |
| liferay-20101-workflow-metrics-tokens               | 앱 인덱스  | 워크플로 메트릭 애플리케이션용 워크플로 토큰에 대한 데이터 저장                      |
| liferay-20101-workflow-metrics-transitions          | 앱 인덱스  | Workflow Metrics 애플리케이션의 Workflow Transitions에 대한 데이터 저장 |

```{important}
Liferay 7.2 인덱스 이름은 패치가 인덱스 명명 패턴에 변경 사항을 도입했기 때문에 더 복잡합니다. 자세한 내용은 [다중 테넌트 인덱스 이름](../../getting-started/whats-new-in-search-for-73.md#multi-tenant-index-names) 을 참조하세요.
Liferay 7.1 설치에는 회사 및 시스템 인덱스만 포함됩니다.
```

```{note}
Liferay DXP는 사용자가 완전히 제어할 수 있는 사용자 지정 Elasticsearch 색인을 만들고 사용(작성 및 읽기)하기 위한 API를 제공합니다. 이러한 API 사용에 대한 정보는 [개발자 가이드](../../developer-guide.html) 를 참조하세요.
```

[Liferay Commerce](https://www.liferay.com/products/commerce) 구독이 있고 설치에서 활성화된 경우 다음과 같은 인덱스도 있습니다.

| 색인 ID                                               | 인덱스 유형 | 색인 목적    |
|:--------------------------------------------------- |:------ |:-------- |
| liferay-20101-상거래-ml-예측                             | 앱 인덱스  | 기계 학습 기능 |
| liferay-20101-제품-콘텐츠-상거래-ml-추천                      | 앱 인덱스  | 추천 서비스   |
| liferay-20101-product-interaction-commerce-ml-권장 사항 | 앱 인덱스  | 추천 서비스   |

설정에서 그렇게 하지 말아야 할 매우 강력한 이유가 드러나지 않는 한 모든 Liferay DXP 인덱스와 모든 사용자 지정 인덱스를 팔로워 Elasticsearch 클러스터에 복제해야 합니다.

## Elasticsearch 클러스터 구성

클러스터 간 복제도 지원하는 Liferay DXP에서 지원되는 버전을 사용하여 Elasticsearch 클러스터를 설정합니다. 자세한 내용은 [LES 호환성 매트릭스](https://help.liferay.com/hc/ko/articles/360016511651#Liferay-Enterprise-Search) 참조하십시오.

CCR에는 Elasticsearch Platinum 수준 라이선스가 필요하지만 [LES 고객](../../liferay-enterprise-search.html) 은 이미 라이선스를 가지고 있습니다. 로컬에서 테스트하는 경우 각 클러스터에서 [평가판 라이선스](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/start-trial.html) 를 시작하세요. 

CCR에는 Elasticsearch Platinum 수준 라이선스가 필요하지만 [LES 고객](../../liferay-enterprise-search.html) 은 이미 이를 가지고 있습니다. 로컬에서 테스트하는 경우 각 클러스터에서 [평가판 라이선스](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/start-trial.html) 시작합니다.

## Liferay DXP를 Elasticsearch에 연결

```{important}
먼저 Liferay 클러스터링 동작을 구성하십시오. 자습서에 제공된 예제에서는 테스트 목적으로 일부 구성이 제공됩니다. 프로덕션 클러스터 설정에 대한 자세한 내용은 [클러스터링 설명서](../../../installation-and-upgrades/setting-up-liferay/clustering-for-high-availability.md)를 참조하세요.
```

모든 Liferay DXP 노드에는 두 가지 Elasticsearch 구성이 있어야 합니다. 즉, 프로덕션 모드 활성화 및 선언된 원격 Elasticsearch 연결입니다. 이를 지원하려면 Elasticsearch 연결에서 원격 Elasticsearch 연결을 구성해야 합니다. 팔로워 Elasticsearch 클러스터에서 읽는 노드에도 해당 추가 연결이 정의되어 있어야 합니다. `.config` 파일을 통해 또는 시스템 설정에서 적절한 구성 값을 제공한 다음 DXP 노드를 시작(또는 다시 시작)합니다. 리더 인덱스를 읽고 쓰는 노드가 제대로 작동하는지 확인하십시오.

노드를 시작하고 아직 설치하지 않은 경우 클러스터의 모든 노드에 LES 앱을 설치합니다.

## 클러스터 간 복제 활성화 및 구성

Liferay DXP에는 CCR 설정을 완료하는 논리가 포함되어 있지만 구성 파일 [](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md)않고 시스템 설정 UI에서 CCR 기능을 활성화하는 데 의존합니다. 최소한 `readFromLocalClusters` 속성은 UI에서 트리거되어야 합니다. CCR이 구성되면 인덱스 복제를 확인하고 검색을 시작하기만 하면 됩니다.

CCR을 처음 활성화할 때(구성에서 **업데이트** 클릭한 후 --- [로컬 팔로워 데이터 센터에서 CCR 구성](./configuring-ccr-in-a-local-follower-data-center.md)참조) 로컬 클러스터 구성의 각 항목이 처리됩니다. 먼저 [원격 클러스터](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/modules-remote-clusters.html) [클러스터 업데이트 설정 API](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/cluster-update-settings.html) 을 통해 등록됩니다. 원격 클러스터의 각 인덱스( `.` 로 시작하는 인덱스 또는 Excluded Indexes 설정에 정의된 인덱스 제외)에 대해 [Create Follower API](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/ccr-put-follow.html) 이 호출되어 원격 인덱스와의 팔로워/리더 관계를 설정합니다. 

기존 CCR 구성을 편집한 후 또는 CCR을 비활성화하면 이전에 로컬 클러스터 구성에 저장된 각 항목이 처리됩니다. 각 인덱스에 대해 [팔로잉이 일시 중지됨](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/ccr-post-pause-follow.html) , [인덱스가 닫힘](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/indices-close.html#indices-close) , [리더가 언팔로우됨](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/ccr-post-unfollow.html) , [팔로어 인덱스가 삭제됨](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/indices-delete-index.html) . 그러면 원격 클러스터가 [Cluster Update Settings API](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/cluster-update-settings.html) 을 통해 등록 취소됩니다. CCR을 비활성화하려는 경우 여기에서 처리가 종료됩니다. 구성을 편집하는 경우 기존 로컬 클러스터 구성 항목은 CCR을 처음 활성화하는 것처럼 계속 처리됩니다. 각 항목에 대해 [원격 클러스터](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/modules-remote-clusters.html) [클러스터 업데이트 설정 API](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/cluster-update-settings.html) 을 통해 등록됩니다. 각 원격 클러스터의 모든 인덱스( `.` 로 시작하거나 Excluded Indexes 설정에서 정의된 인덱스 제외)에 대해 [Create Follower API](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/ccr-put-follow.html) 호출되어 원격 인덱스와의 팔로워/리더 관계를 설정합니다.

이제 단계를 이해했으므로 기본 [구체적인 사용 사례가 있습니다.](./configuring-an-example-ccr-installation-replicating-between-data-centers.md) 로컬 예제 설정을 시작합니다.
