# Elasticsearch 인덱스 참조

설치 시 기본 Liferay DXP 7.3 색인은 아래 목록과 비슷합니다(변경될 수 있음). 기본 글로벌 *인덱스 이름 접두사* 은 `liferay-`이며 Elasticsearch 7 커넥터 구성에서 변경할 수 있습니다. `20101` 은 데이터베이스에서 주어진 회사의 생성된 `companyId` 입니다. UI에 인스턴스 ID로 표시되며 [가상 인스턴스](../../system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.md)을 나타냅니다.

| 색인 ID                                               | 인덱스 유형 | 색인 목적                                                    |
|:--------------------------------------------------- |:------ |:-------------------------------------------------------- |
| 생명선-0                                               | 시스템 색인 | 시스템 설정 애플리케이션에서 검색                                       |
| 라이프레이-20101                                         | 회사 인덱스 | Liferay DXP 가상 인스턴스의 인덱싱된 자산 검색                          |
| liferay-20101-검색-조정-순위                              | 앱 인덱스  | 결과 순위 애플리케이션의 기본 데이터 저장소                                 |
| liferay-20101-검색-튜닝-동의어                             | 앱 인덱스  | 지정된 가상 인스턴스에 대한 동의어 집합 애플리케이션의 기본 데이터 스토리지               |
| liferay-20101-workflow-metrics-instances            | 앱 인덱스  | Workflow Metrics 애플리케이션의 Workflow 인스턴스에 대한 데이터 저장        |
| liferay-20101-workflow-metrics-nodes                | 앱 인덱스  | 워크플로 메트릭 애플리케이션의 워크플로 노드에 대한 데이터 저장                      |
| liferay-20101-workflow-metrics-processes            | 앱 인덱스  | 워크플로 메트릭 애플리케이션의 워크플로 프로세스에 대한 데이터 저장                    |
| liferay-20101-workflow-metrics-sla-instance-results | 앱 인덱스  | Workflow Metrics 애플리케이션의 Workflow Instance당 SLA 결과 저장    |
| liferay-20101-workflow-metrics-sla-task-results     | 앱 인덱스  | Workflow Metrics 애플리케이션에 대한 Workflow Task당 SLA 결과 저장     |
| liferay-20101-workflow-metrics-tokens               | 앱 인덱스  | 워크플로 메트릭 애플리케이션용 워크플로 토큰에 대한 데이터 저장                      |
| liferay-20101-workflow-metrics-transitions          | 앱 인덱스  | Workflow Metrics 애플리케이션의 Workflow Transitions에 대한 데이터 저장 |

```{important}
Liferay 7.2 인덱스 이름은 패치가 인덱스 명명 패턴에 변경 사항을 도입했기 때문에 더 복잡합니다. 자세한 내용은 [다중 테넌트 인덱스 이름](../getting-started/whats-new-in-search-for-73.md#multi-tenant-index-names)을 참조하세요.
```

```{note}
Liferay DXP는 사용자가 완전히 제어할 수 있는 사용자 지정 Elasticsearch 색인을 만들고 사용(작성 및 읽기)하기 위한 API를 제공합니다. 이러한 API 사용에 대한 정보는 [개발자 가이드](../developer-guide.html)를 참조하세요.
```

[Liferay Commerce](https://www.liferay.com/products/commerce) 구독이 있고 설치에서 활성화된 경우 다음 색인도 있습니다.

| 색인 ID                                               | 인덱스 유형 | 색인 목적    |
|:--------------------------------------------------- |:------ |:-------- |
| liferay-20101-상거래-ml-예측                             | 앱 인덱스  | 기계 학습 기능 |
| liferay-20101-제품-콘텐츠-상거래-ml-추천                      | 앱 인덱스  | 추천 서비스   |
| liferay-20101-product-interaction-commerce-ml-권장 사항 | 앱 인덱스  | 추천 서비스   |

## 관련 정보

- [다중 테넌트 색인 이름](../getting-started/whats-new-in-search-for-73.md#multi-tenant-index-names)
