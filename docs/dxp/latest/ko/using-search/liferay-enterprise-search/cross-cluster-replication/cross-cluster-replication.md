# 교차 클러스터 복제

> **Liferay 엔터프라이즈 검색(LES) 구독자**

기존의 Liferay DXP/검색 엔진 설치에서는 하나의 Liferay DXP 클러스터가 하나의 Elasticsearch 클러스터와 통신하여 모든 읽기(검색 쿼리 실행) 및 쓰기(문서 생성) 요청을 하나의 연결을 통해 검색 엔진 클러스터로 전송합니다. 이 설정에서는 모든 Elasticsearch 클러스터 노드가 단일 데이터 센터에 있다고 가정합니다(Liferay DXP 서버와 다른 데이터 센터에 있을 수 있음).

데이터 로컬리티와 재해 복구에 대한 우려를 해결하기 위해 Elasticsearch는 [클러스터 간 복제(CCR)](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/xpack-ccr.html) 기능을 출시했으며, [LES 구독자](https://www.liferay.com/products/dxp/enterprise-search) 가 Liferay DXP와 함께 사용할 수 있습니다(버전 호환성에 대한 자세한 내용은 [LES 호환성 매트릭스](https://help.liferay.com/hc/ko/articles/360016511651#Liferay-Enterprise-Search) 를 참조하세요). LES CCR 모듈을 사용하면 다른 형태의 다중 데이터 센터 배포를 달성할 수 있습니다. 이 모듈은 여러 데이터 센터에 Elasticsearch 클러스터의 노드를 배포할 수는 없지만 각 데이터 센터에서 별도의 Elasticsearch 클러스터를 구성하고 연결할 수 있게 해줍니다.

이 구성에서는 **leader** 인덱스를 보유한 클러스터 1개와 리더로부터 복제된 **follower** 인덱스를 보유한 클러스터 1개 이상이 있다고 가정합니다. 팔로워 인덱스는 Liferay DXP에서 데이터 읽기용으로만 사용됩니다. 리더 인덱스는 항상 쓰기용으로 사용되지만 읽기용으로도 사용할 수 있습니다.

![클러스터 간 복제를 사용하면 서로 다른 데이터 센터에서 Liferay DXP 인덱스가 있는 동기화된 Elasticsearch 클러스터를 보유할 수 있습니다.](./cross-cluster-replication/images/01.png)

위의 다이어그램은 CCR의 최소한의 예를 보여줍니다. 각 데이터 센터에는 하나 이상의 DXP 노드와 하나의 Elasticsearch 클러스터가 있습니다. 미국 데이터 센터는 모든 DXP 노드가 쓰는 리더 인덱스를 보유하고 있습니다. 헝가리 데이터 센터는 로컬(헝가리) DXP 노드가 읽는 팔로워 인덱스를 보유합니다. 데이터는 리더에서 팔로워로 한 방향으로 복제됩니다.

Liferay DXP는 광역 네트워크(WAN) 프로토콜을 통해 서로 다른 사이트에 있는 노드가 있는 분산 클러스터라는 개념을 오랫동안 지원해 왔습니다. Liferay DXP의 유연성과 Elasticsearch의 클러스터 간 복제에 대한 지원은 다양한 시스템 설계를 지원할 수 있습니다.

클러스터 간 복제를 설정하려면 다음을 수행해야 합니다.

* [LES 활성화](../activating-liferay-enterprise-search.md)
- Liferay 7.2 및 7.3에서, 팔로워 Elasticsearch 인덱스에서 읽는 Liferay DXP 노드에 CCR 모듈을 설치합니다.
- 리더 클러스터에서 복제할 인덱스를 선택합니다.
- Elasticsearch 클러스터 구성하기
- Liferay DXP 클러스터의 Elasticsearch 연결 구성
- 팔로워 인덱스에서 읽는 Liferay DXP 노드에서 클러스터 간 복제를 활성화하고 구성합니다.

## Liferay DXP: LES 클러스터 간 복제 모듈 설치

```{note}
Liferay DXP 7.4부터 Liferay Enterprise Search(LES) 애플리케이션은 모든 Liferay DXP 번들 및 Docker 컨테이너에 포함되어 있습니다. 따라서 Liferay DXP 7.4 이상에서는 모듈을 설치할 필요가 없습니다. 자세한 내용은 [LES 활성화하기](../activating-liferay-enterprise-search.md)를 참조하세요.
```

로컬 클러스터의 팔로워 인덱스에서 읽고 원격 클러스터의 리더 인덱스에 별도의 연결을 통해 쓰는 Liferay DXP 노드에는 CCR 모듈이 설치되어 있어야 합니다. 일관성과 적응성을 위해 클러스터의 모든 노드에 설치하는 것이 가장 좋습니다. 이 모듈은 LES 구독을 통해 다운로드(LPKG 파일로)할 수 있습니다.

## Liferay DXP: 원격 클러스터에서 복제할 인덱스 결정

설치 시 기본 Liferay DXP 7.3 인덱스는 아래 목록과 대략 비슷합니다(변경될 수 있음). 기본 글로벌 **인덱스 이름 접두사** 는 `liferay-`이며, Elasticsearch 7 커넥터 구성에서 변경할 수 있습니다. `20101` 은 데이터베이스에 있는 특정 회사의 생성된 `companyId` 입니다. UI에 인스턴스 ID로 표시되며 [가상 인스턴스](../../../system-administration/configuring-liferay/virtual-instances.md)를 나타냅니다.

| 인덱스 ID                               | 인덱스 유형 | 색인 목적                                      |
|:------------------------------------ |:------ |:------------------------------------------ |
| liferay-0                            | 시스템 색인 | 시스템 설정 애플리케이션에서 검색하기                       |
| liferay-20101                        | 회사 인덱스 | Liferay DXP 가상 인스턴스의 인덱싱된 자산 검색하기          |
| 라이프레이-20101-검색-튜닝-랭킹                 | 앱 색인   | 결과 순위 애플리케이션을 위한 저장소                       |
| liferay-20101-검색-튜닝-동의어              | 앱 색인   | 지정된 가상 인스턴스에 대한 동의어 집합 애플리케이션의 저장소         |
| liferay-20101-워크플로-메트릭-인스턴스          | 앱 색인   | 워크플로 메트릭 애플리케이션의 워크플로 인스턴스에 대한 데이터 저장      |
| liferay-20101-워크플로우-메트릭스-노드          | 앱 색인   | 워크플로 메트릭 애플리케이션을 위한 워크플로 노드에 대한 데이터 저장     |
| liferay-20101-워크플로-메트릭-프로세스          | 앱 색인   | 워크플로 메트릭 애플리케이션을 위한 워크플로 프로세스에 대한 데이터 저장   |
| liferay-20101-워크플로우-메트릭스-sla-인스턴스-결과 | 앱 색인   | 워크플로 메트릭 애플리케이션의 워크플로 인스턴스별 SLA 결과를 위한 저장소 |
| liferay-20101-워크플로우-메트릭스-sla-작업-결과   | 앱 색인   | 워크플로 메트릭 애플리케이션의 워크플로 작업별 SLA 결과를 위한 저장소   |
| liferay-20101-워크플로우-메트릭스-토큰          | 앱 색인   | 워크플로 메트릭 애플리케이션을 위한 워크플로 토큰에 대한 데이터 저장     |
| liferay-20101-워크플로-메트릭-전환            | 앱 색인   | 워크플로 메트릭 애플리케이션을 위한 워크플로 전환에 대한 데이터 저장     |

```{important}
패치로 인해 인덱스 이름 지정 패턴이 변경되었기 때문에 Liferay 7.2 인덱스 이름은 더 복잡해졌습니다. 자세한 내용은 [멀티테넌트 인덱스 이름](../../getting-started/whats-new-in-search-for-73.md#multi-tenant-index-names) 을 참조하세요.
Liferay 7.1 설치에는 회사 및 시스템 인덱스만 포함되어 있습니다.
```

```{note}
Liferay DXP는 사용자가 완전히 제어할 수 있는 사용자 정의 Elasticsearch 인덱스 생성 및 사용(쓰기 및 읽기)을 위한 API를 제공합니다. 이러한 API 사용에 대한 자세한 내용은 [개발자 가이드](../../developer-guide.html) 를 참조하세요.
```

[Liferay Commerce](https://www.liferay.com/products/commerce) 구독이 있고 설치에서 활성화되어 있는 경우 이와 같은 인덱스도 있습니다:

| 인덱스 ID                        | 인덱스 유형 | 색인 목적    |
|:----------------------------- |:------ |:-------- |
| 라이프레이-20101-커머스-ml-예측         | 앱 색인   | 머신 러닝 기능 |
| 라이프레이-20101-제품-콘텐츠-커머스-ml-추천  | 앱 색인   | 추천 서비스   |
| 라이프레이-20101-제품-인터랙션-커머스-ml-추천 | 앱 색인   | 추천 서비스   |

설정에서 그렇게 하지 말아야 할 특별한 이유가 없는 한, 모든 Liferay DXP 인덱스와 모든 사용자 정의 인덱스를 팔로워 Elasticsearch 클러스터에 복제해야 합니다.

## Elasticsearch 클러스터 구성하기

클러스터 간 복제도 지원하는 Liferay DXP에서 지원되는 버전을 사용하여 Elasticsearch 클러스터를 설정합니다. 자세한 내용은 [LES 호환성 매트릭스](https://help.liferay.com/hc/ko/articles/360016511651#Liferay-Enterprise-Search) 를 참조하세요.

[Liferay DXP에 필요한 Elasticsearch 플러그인을 설치하고 팔로워 클러스터와 리더 클러스터를 구분할 수 있도록 클러스터 이름](../../installing-and-upgrading-a-search-engine/elasticsearch/installing-elasticsearch.md#configure-elasticsearch) 을 제공하세요.

CCR에는 Elasticsearch 플래티넘 레벨 라이선스가 필요하지만, [LES 고객(](../../liferay-enterprise-search.html) )은 이미 이 라이선스를 보유하고 있습니다. 로컬에서 테스트하는 경우, 각 클러스터에서 [평가판 라이선스](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/start-trial.html) 를 시작하세요.

## Liferay DXP를 Elasticsearch에 연결하기

```{important}
먼저 Liferay 클러스터링 동작을 구성합니다. 튜토리얼에 제공된 예제에서는 테스트 목적으로 일부 구성이 제공됩니다. 프로덕션 클러스터 설정에 대한 자세한 내용은 [클러스터링 문서](../../../설치-업그레이드/설정-리퍼레이/고가용성을 위한 클러스터링.md)를 참조하세요.
```

모든 Liferay DXP 노드에는 프로덕션 모드가 활성화되고 원격 Elasticsearch 연결이 선언된 두 가지 Elasticsearch 구성이 있어야 합니다. 이를 지원하려면 Elasticsearch 연결에서 원격 Elasticsearch 연결을 구성해야 합니다. 팔로워 Elasticsearch 클러스터에서 읽는 노드에도 해당 추가 연결이 정의되어 있어야 합니다. `.config` 파일 또는 시스템 설정에서 적절한 구성 값을 제공한 다음 DXP 노드를 시작(또는 다시 시작)합니다. 리더 인덱스를 읽고 쓰는 노드가 제대로 작동하는지 확인합니다.

노드를 시작하고 아직 설치하지 않은 경우 클러스터의 모든 노드에 LES 앱을 설치합니다.

## 클러스터 간 복제 사용 및 구성

Liferay DXP에는 CCR 설정을 완료하는 로직이 포함되어 있지만 [구성 파일](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md)이 아닌 시스템 설정 UI에서 CCR 기능을 활성화하는 데 의존합니다. 최소한 `readFromLocalClusters` 프로퍼티가 UI에서 트리거되어야 합니다. CCR이 구성되면 이제 인덱스 복제를 확인하고 검색을 시작하는 일만 남았습니다.

CCR을 처음 활성화하면(구성에서 **업데이트** 클릭 후--- 참조 [로컬 팔로워 데이터 센터에서 CCR 구성하기](./configuring-ccr-in-a-local-follower-data-center.md)), 로컬 클러스터 구성의 각 항목이 처리됩니다. 먼저, [원격 클러스터](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/modules-remote-clusters.html) 를 [클러스터 업데이트 설정 API](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/cluster-update-settings.html) 를 통해 등록합니다. 원격 클러스터의 각 인덱스( `로 시작하는 인덱스 제외.` 또는 제외 인덱스 설정에 정의된 인덱스 제외)에 대해 [팔로워 생성 API](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/ccr-put-follow.html) 를 호출하여 원격 인덱스와의 팔로워/리더 관계를 설정합니다.

기존 CCR 구성을 편집하거나 CCR을 비활성화하면 이전에 로컬 클러스터 구성에 저장된 각 항목이 처리됩니다. 각 인덱스에 대해 [팔로잉이 일시 중지됨](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/ccr-post-pause-follow.html) , [인덱스가 닫힘](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/indices-close.html#indices-close) , [리더가 언팔로우됨](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/ccr-post-unfollow.html) , [팔로워 인덱스가 삭제됨](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/indices-delete-index.html) 입니다. 그런 다음 [클러스터 업데이트 설정 API](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/cluster-update-settings.html) 를 통해 원격 클러스터의 등록을 해제합니다. CCR만 비활성화하는 경우 처리가 여기서 종료됩니다. 구성을 편집하는 경우, 기존 로컬 클러스터 구성 항목은 CCR을 처음 활성화하는 것과 마찬가지로 계속 처리됩니다. 각 항목에 대해 [원격 클러스터](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/modules-remote-clusters.html) 가 [클러스터 업데이트 설정 API](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/cluster-update-settings.html) 를 통해 등록됩니다. 각 원격 클러스터의 모든 인덱스( `로 시작하는 인덱스 제외.` 또는 제외 인덱스 설정에 정의된 인덱스 제외)에 대해 [팔로워 생성 API](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/ccr-put-follow.html) 를 호출하여 원격 인덱스와의 팔로워/리더 관계를 설정합니다.

이제 단계를 이해했으니 [기본적이고 구체적인 사용 사례](./configuring-an-example-ccr-installation-replicating-between-data-centers.md) 를 참조하여 로컬 예제 설정을 시작하세요.
