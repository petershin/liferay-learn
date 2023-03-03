---
uuid: 1d5da6cd-cdeb-4c72-836e-63462e4a86ad
---

# Elasticsearch 인덱스 참조

Liferay 7.3 및 7.4에는 각각 Elasticsearch에서 생성된 인덱스 세트가 있습니다. 이러한 인덱스와 인덱스가 수행하는 작업을 이해하면 Liferay의 Elasticsearch 설치를 더 잘 구성하고 관리하는 데 도움이 될 수 있습니다.

```{important}
Liferay 7.2 인덱스 이름은 패치가 인덱스 명명 패턴에 변경 사항을 도입했기 때문에 더 복잡합니다. 자세한 내용은 [다중 테넌트 인덱스 이름](../getting-started/whats-new-in-search-for-73.md#multi-tenant-index-names) 을 참조하세요.
```

## Liferay 7.4의 Elasticsearch 인덱스

다음 목록은 Liferay DXP 7.4의 기본 Elasticsearch 색인과 비슷합니다(변경될 수 있음). 기본 글로벌 *인덱스 이름 접두사* `liferay-`이며 Elasticsearch 7 커넥터 구성에서 변경할 수 있습니다. `20097` 데이터베이스에서 주어진 회사의 생성된 `companyId` 입니다. UI에 인스턴스 ID로 표시되며 [가상 인스턴스](../../system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.md)나타냅니다.

| 인덱스 이름                                                    | 인덱스 유형 | 색인 목적                                                   |
|:--------------------------------------------------------- |:------ |:------------------------------------------------------- |
| 생명선-0                                                     | 시스템 색인 | 시스템 설정 애플리케이션에서 검색합니다.                                  |
| 라이프레이-20097                                               | 회사 인덱스 | Liferay DXP 가상 인스턴스의 인덱싱된 콘텐츠를 검색합니다.                   |
| liferay-20097-상거래-ml-예측                                   | 앱 인덱스  | Liferay Commerce의 기계 학습 기능을 색인화합니다.                     |
| liferay-20097-frequent-pattern-commerce-ml-recommendation | 앱 인덱스  | Index Liferay Commerce의 추천 서비스.                         |
| liferay-20097-제품-콘텐츠-상거래-ml-추천                            | 앱 인덱스  | Index Liferay Commerce의 추천 서비스.                         |
| liferay-20097-product-interaction-commerce-ml-권장 사항       | 앱 인덱스  | Index Liferay Commerce의 추천 서비스.                         |
| liferay-20097-검색-조정-순위                                    | 앱 인덱스  | Result Rankings 애플리케이션 데이터를 인덱싱합니다.                     |
| liferay-20097-검색-튜닝-동의어                                   | 앱 인덱스  | 동의어 집합 애플리케이션 데이터를 인덱싱합니다.                              |
| liferay-20097-사용자-상거래-ml-추천                               | 앱 인덱스  | Index Liferay Commerce의 추천 서비스.                         |
| liferay-20097-workflow-metrics-instances                  | 앱 인덱스  | Workflow Metrics 애플리케이션에 대한 워크플로우 인스턴스를 인덱싱합니다.         |
| liferay-20097-workflow-metrics-nodes                      | 앱 인덱스  | Workflow Metrics 애플리케이션에 대한 색인 워크플로우 노드입니다.             |
| liferay-20097-workflow-metrics-processes                  | 앱 인덱스  | Workflow Metrics 애플리케이션에 대한 워크플로우 프로세스를 인덱싱합니다.         |
| liferay-20097-workflow-metrics-sla-instance-results       | 앱 인덱스  | Workflow Metrics 애플리케이션에 대한 워크플로우 인스턴스당 SLA 결과를 인덱싱합니다. |
| liferay-20097-workflow-metrics-sla-task-results           | 앱 인덱스  | Workflow Metrics 애플리케이션에 대한 워크플로 작업당 SLA 결과를 인덱싱합니다.    |
| liferay-20097-workflow-metrics-tasks                      | 앱 인덱스  | Workflow Metrics 애플리케이션에 대한 워크플로 작업을 인덱싱합니다.            |
| liferay-20097-workflow-metrics-transitions                | 앱 인덱스  | Workflow Metrics 애플리케이션의 워크플로 전환을 인덱싱합니다.               |

## Liferay 7.3의 Elasticsearch 색인

다음 목록은 Liferay DXP 7.3의 기본 Elasticsearch 색인과 비슷합니다(변경될 수 있음). 기본 글로벌 *인덱스 이름 접두사* `liferay-`이며 Elasticsearch 7 커넥터 구성에서 변경할 수 있습니다. `20101` 데이터베이스에서 주어진 회사의 생성된 `companyId` 입니다. UI에 인스턴스 ID로 표시되며 [가상 인스턴스](../../system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.md)나타냅니다.

| 인덱스 이름                                              | 인덱스 유형 | 색인 목적                                                   |
|:--------------------------------------------------- |:------ |:------------------------------------------------------- |
| 생명선-0                                               | 시스템 색인 | 시스템 설정 애플리케이션에서 색인 검색.                                  |
| 라이프레이-20101                                         | 회사 인덱스 | Liferay DXP 가상 인스턴스의 인덱싱된 콘텐츠를 검색하는 인덱스.                |
| liferay-20101-검색-조정-순위                              | 앱 인덱스  | 결과 순위 애플리케이션을 인덱싱합니다.                                   |
| liferay-20101-검색-튜닝-동의어                             | 앱 인덱스  | 동의어 집합 애플리케이션을 인덱싱합니다.                                  |
| liferay-20101-workflow-metrics-instances            | 앱 인덱스  | Workflow Metrics 애플리케이션에 대한 워크플로우 인스턴스를 인덱싱합니다.         |
| liferay-20101-workflow-metrics-nodes                | 앱 인덱스  | Workflow Metrics 애플리케이션에 대한 색인 워크플로우 노드입니다.             |
| liferay-20101-workflow-metrics-processes            | 앱 인덱스  | Workflow Metrics 애플리케이션에 대한 워크플로우 프로세스를 인덱싱합니다.         |
| liferay-20101-workflow-metrics-sla-instance-results | 앱 인덱스  | Workflow Metrics 애플리케이션에 대한 워크플로우 인스턴스당 SLA 결과를 인덱싱합니다. |
| liferay-20101-workflow-metrics-sla-task-results     | 앱 인덱스  | Workflow Metrics 애플리케이션에 대한 워크플로 작업당 SLA 결과를 인덱싱합니다.    |
| liferay-20101-workflow-metrics-tokens               | 앱 인덱스  | Workflow Metrics 애플리케이션에 대한 색인 워크플로우 토큰입니다.             |
| liferay-20101-workflow-metrics-transitions          | 앱 인덱스  | Workflow Metrics 애플리케이션의 워크플로 전환을 인덱싱합니다.               |

[Liferay Commerce](https://www.liferay.com/products/commerce) 구독이 있고 설치에서 활성화된 경우 다음 색인도 있습니다.

| 인덱스 이름                                              | 인덱스 유형 | 색인 목적                               |
|:--------------------------------------------------- |:------ |:----------------------------------- |
| liferay-20101-상거래-ml-예측                             | 앱 인덱스  | Liferay Commerce의 기계 학습 기능을 색인화합니다. |
| liferay-20101-제품-콘텐츠-상거래-ml-추천                      | 앱 인덱스  | Index Liferay Commerce의 추천 서비스.     |
| liferay-20101-product-interaction-commerce-ml-권장 사항 | 앱 인덱스  | Index Liferay Commerce의 추천 서비스.     |

## 관련 정보

- [다중 테넌트 색인 이름](../getting-started/whats-new-in-search-for-73.md#multi-tenant-index-names)
