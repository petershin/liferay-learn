# 재인덱싱 모드

{bdg-secondary}`liferay 2023.Q4+/GA102+`

**재인덱싱** 은 검색에 사용되는 검색 색인 전체 또는 일부를 새로 고치는 것이며 경우에 따라 Liferay의 콘텐츠를 표시하는 것입니다. [검색 관리 패널](./search-administration.md) 글로벌 메뉴 &rarr; 제어판 &rarr; 검색 &rarr; 색인 작업에서 재색인을 실행합니다. 2023년 4분기/GA102 릴리스에는 새로운 색인 재지정 모드인 **Concurrent** 및 **Sync** 가 포함되었습니다. 이는 고가용성 재인덱싱을 제공하므로 사용자가 사이트 콘텐츠를 계속 검색하는 동안 재인덱싱 프로세스를 실행하여 가동 중지 시간을 없앨 수 있습니다. 사용 가능한 3가지 재인덱싱 모드 중에서 선택하세요.

| 재인덱싱 모드                                         | 묘사                                                                                                                              | 고가용성 | 지원되는 작업                                           |
| :---------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------ | :--- | :------------------------------------------------ |
| ![전체](../../images/icon-globe-meridians.png) 전체 | 먼저 인덱스를 삭제한 다음 다시 생성합니다.                                                                                                        | ✘    | ✔ 글로벌: 모든 인덱스<br>✔ 글로벌: 맞춤법 검사 사전<br>✔ 단일 모델 재인덱싱 |
| ![동시](../../images/icon-concurrent.png) 동시      | ![베타](../../images/icon-beta-feature.png)<br>새 인덱스가 준비될 때까지 이전 인덱스를 그대로 두고(즉, 파란색/녹색 다시 인덱스) 새 인덱스를 생성합니다. | ✔    | ✔ 글로벌: 모든 인덱스<br>✘ 글로벌: 맞춤법 검사 사전<br>✘ 단일 모델 재인덱싱 |
| ![동기화](../../images/icon-restore2.png) 동기화      | ![베타](../../images/icon-beta-feature.png)<br>기존 검색 색인 문서를 업데이트하고 완료되면 오래된 문서를 삭제합니다.                                            | ✔    | ✔ 글로벌: 모든 인덱스<br>✘ 글로벌: 맞춤법 검사 사전<br>✔ 단일 모델 재인덱싱 |

```{note}
동시 및 동기화 모드는 [Elasticsearch를 통해](../installing-and-upgrading-a-search-engine/solr/solr-limitations.md)만 사용할 수 있습니다.
```

## 재인덱싱 모드 선택

전체 재인덱싱은 모든 콘텐츠와 인덱스 또는 단일 모델 등 모든 시나리오에서 작동합니다. 그러나 항상 최선의 선택은 아닙니다. 장기간 실행되는 전체 재인덱싱 프로세스로 인한 가동 중지 시간을 방지하려면 가능하면 동시 또는 동기화 모드를 사용하십시오.

| 다음과 같은 경우 재인덱싱:                                                                                                                                        | 충분히 | 동시(![베타](../../images/icon-beta-feature.png)) | 동기화(![베타](../../images/icon-beta-feature.png)) |
| :----------------------------------------------------------------------------------------------------------------------------------------------------- | :-- | :--------------------------------------------------------------- | :---------------------------------------------------------------- |
| [새로운 Elasticsearch 클러스터 설치](../installing-and-upgrading-a-search-engine/elasticsearch/installing-elasticsearch.md)                          | ✔   | -                                                                | *                                                                 |
| [필드 매핑 업데이트 중](../installing-and-upgrading-a-search-engine/elasticsearch/advanced-configuration-of-the-liferay-elasticsearch-connector.md)  | ✓   | ✔                                                                | -                                                                 |
| [인덱스 설정 업데이트 중](../installing-and-upgrading-a-search-engine/elasticsearch/advanced-configuration-of-the-liferay-elasticsearch-connector.md) | ✓   | ✔                                                                | *                                                                 |
| [liferay 업그레이드](../../installation-and-upgrades/upgrading-liferay.md)                                                                         | ✓   | ✔                                                                | ✓                                                                 |
| [Elasticsearch 업그레이드](../installing-and-upgrading-a-search-engine/elasticsearch/upgrading-elasticsearch.md)                                 | ✓   | ✔                                                                | ✓                                                                 |
| 연결 중단 후 재인덱싱                                                                                                                                           | ✓   | ✔                                                                | ✓                                                                 |
| 단일 모델 다시 색인화[^1]                                                                                   | ✓   | -                                                                | ✔                                                                 |

✔ 시나리오에 권장되는 모드

✓ 시나리오에 사용할 수 있는 모드

\- 해당 모드는 시나리오에 사용할 수 없습니다.

[^1]: 단일 모델을 다시 인덱싱해야 하는 경우가 있으며 이러한 경우에는 동기화 모드가 권장됩니다. 예를 들어, 검색 청사진 [검색 청사진 만들기](../liferay-enterprise-search/search-experiences/search-blueprints/creating-and-managing-search-blueprints.md#adding-elements-to-the-blueprint) 생성하는 동안 특정 요소를 사용하고 [의미론적 검색](../liferay-enterprise-search/search-experiences/semantic-search.md) 활성화하려면 개별 모델 유형을 다시 인덱싱해야 합니다.

이전 Liferay 버전에서는 재인덱싱은 항상 전체 모드를 사용하여 재생성하기 전에 라이브 프로덕션 인덱스에서 콘텐츠를 삭제합니다. 이로 인해 상당한 검색 색인 가동 중지 시간이 발생할 수 있습니다. 동시 및 동기화 재인덱싱 모드를 사용하면 인덱스를 먼저 삭제하지 않고도 재인덱싱이 수행됩니다. 동기화 모드는 인덱스를 제자리에서 업데이트하는 반면, 동시 모드는 백그라운드에서 새 인덱스를 작성하여 준비될 때까지 이전 인덱스를 유지합니다. 검색 색인의 고가용성은 가동 중지 시간을 최소화한다는 의미입니다. 즉, 사이트 콘텐츠를 다시 색인화하는 동안 사이트 사용자가 사이트를 찾아보고 검색할 수 있습니다.

![Choose from Full, Concurrent, or Sync reindex modes, depending on your needs.](./reindexing-modes/images/01.png)

가능할 때마다 동시 또는 동기화 모드를 선택하여 재인덱싱 중 가동 중지 시간을 방지하세요. 그러나 상황에 적합한 모드를 결정할 때 고려해야 할 사항이 있습니다.

## ![전체](../../images/icon-globe-meridians.png) 전체 재인덱싱 모드

새로운 빈 Elasticsearch 클러스터에 연결할 때 모든 콘텐츠를 인덱싱하려면 **full** 모드를 사용해야 합니다. 이 시나리오에서는 고가용성을 고려하지 않습니다. 동기화 모드가 충분하지 않은 경우 단일 모델 재인덱싱을 위해 전체 모드를 사용할 수도 있지만 동기화 모드가 권장됩니다. 모든 인덱스의 고가용성 재인덱싱을 위해서는 대신 동시 모드를 사용하세요.

전체 재색인은 다음과 같이 진행됩니다.

1. 원본 인덱스가 삭제됩니다.
1. 최신 인덱스 설정 및 필드 매핑을 사용하여 새 인덱스가 생성됩니다.
1. 문서는 인덱스에서 재생성됩니다.

## ![동시](../../images/icon-concurrent.png) 동시 재색인 모드

블루/그린 재인덱싱 전략을 사용하여 모든 콘텐츠의 고가용성을 재인덱싱하려면 **concurrent** 모드를 사용하세요. 단일 모델 재인덱싱에는 동시 모드를 사용할 수 없습니다. 대신 동기화 모드를 사용하세요. 동시 모드는 모든 콘텐츠를 다시 인덱싱할 때 전체 다시 인덱싱 모드를 대체하는 역할을 합니다.

동시 재색인은 다음과 같이 진행됩니다.

1. 최신 인덱스 설정 및 필드 매핑을 사용하여 새 인덱스가 생성됩니다.
1. 문서는 인덱스에서 다시 생성됩니다.
1. 원본 인덱스가 삭제됩니다.

동시 재인덱싱은 이전 인덱스와 함께 새 인덱스를 생성하기 때문에 다른 모드보다 Elasticsearch 시스템 인프라에 더 많은 디스크 공간이 필요합니다. 디스크 공간 부족으로 인한 오류를 방지하기 위해 Liferay는 사용 가능한 공간이 충분한지 추정하고 그렇지 않은 경우 경고합니다.

![You're warned if Liferay estimates insufficient disk space for a concurrent reindex.](./reindexing-modes/images/03.png)

## ![동기화](../../images/icon-restore2.png) 동기화 재색인 모드

Elasticsearch의 기본 디스크 공간이 중요하거나 모든 고가용성 단일 모델 재인덱싱이 필요한 경우 고가용성 재인덱싱을 위해 **sync** 모드를 사용하세요. 동기화 모드가 시스템 변경 사항을 제대로 설명할 수 없어 다른 모드 중 하나를 사용해야 하는 시나리오가 있습니다.

동기화 재색인은 다음과 같이 진행됩니다.

1. 인덱스 문서는 업데이트되지만 삭제되지는 않습니다.
1. 오래된 문서는 삭제됩니다.

동기화 재인덱싱은 업데이트된 인덱스 설정이나 매핑을 고려하지 않으므로 동시 재인덱싱보다 제한적입니다.

## 기본 재인덱싱 모드 설정

전체 재인덱싱 모드가 기본값입니다. 그것을 바꾸려면,

1. **글로벌 메뉴** &rarr; **제어판** &rarr; **시스템 설정** 으로 이동하세요.

1. 플랫폼 &rarr; 검색에서 **Reindex** 항목을 엽니다.

1. **기본 재색인 실행 모드** 를 설정하고 **업데이트** 를 클릭하세요.

![The default reindexing mode is configurable.](./reindexing-modes/images/02.png)
