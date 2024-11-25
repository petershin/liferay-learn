# Liferay 클라우드 서비스 로그 읽기

환경 로그는 프로젝트의 기술 문제를 진단하고 해결하는 데 중요합니다. Liferay Cloud는 사용자가 Liferay Cloud 콘솔 또는 OS 터미널을 통해 액세스하고 다운로드할 수 있는 다양한 환경 로그를 제공합니다.

## 로그 유형

Liferay Cloud는 환경 서비스에 대해 세 가지 유형의 로그를 제공합니다.

* **빌드 로그** : 이 로그는 애플리케이션이 부팅될 때 생성된 빌드 정보를 나열합니다. 빌드 정보의 예에는 레지스트리에서 Docker 이미지를 가져오는 경우, 배포가 진행 중인 경우 및 빌드가 성공한 경우가 포함됩니다.

* **상태 로그** : 이 로그는 Kubernetes 클러스터의 오케스트레이션 계층 정보를 나열합니다. 상태 정보의 예에는 이미지를 성공적으로 가져오는 경우, 컨테이너가 생성 및 시작되는 경우, 준비 또는 활성 프로브가 실패하는 경우가 포함됩니다.

* **애플리케이션 로그** : 이 로그는 애플리케이션이 실행되고 사용자가 액세스한 후에 생성된 런타임 정보를 나열합니다.

## 로그 구조

Liferay Cloud의 로그는 추가 컨텍스트 정보를 제공하는 특정 구조를 따릅니다. 이 로그 메시지를 예로 참조하십시오.

```log
Jun 29 10:07:46.585 build-214 [webserver-699bf65bfb-4w8pl] [WARNING] 179/170746 (13) : api/backend2 changed its IP from 10.0.17.186 to 10.0.26.120 by DNS cache.
```

Liferay Cloud의 많은 로그에는 이 메시지가 서비스 출력에서 직접 나온 것이 아니라 Liferay Cloud 인프라에서 온 것임을 나타내는 레이블(이 예에서는 `[WARNING]`)이 있습니다. 로그에는 Liferay Cloud 인프라에서 제공되지만 `[LIFERAY]`와 같이 서비스와 관련된 레이블이 있을 수도 있습니다. 서비스 출력에서 직접 가져온 로그에는 레이블이 없습니다.

또한 이러한 구성 요소는 Liferay Cloud의 모든 로그 메시지에 항상 존재합니다.

* **타임스탬프** : 이 예에서는 `Jun 29 10:07:46.585`.

* **빌드 ID** : 이 예에서는 `build-214`입니다. 이는 현재 배포된 서비스 버전이 해당하는 빌드에 해당합니다. 이 빌드 ID를 프로젝트의 **빌드** 페이지에 표시된 빌드 목록과 일치시킬 수 있습니다.

* **인스턴스 ID** : 이 예에서는 `[webserver-699bf65bfb-4w8pl]`입니다. 이것은 메시지가 관련된 서비스의 인스턴스를 식별하는 데 사용됩니다.

로그 메시지와 연결된 인스턴스 ID는 서비스 인스턴스 중 하나에 해당합니다. 로그 위의 인스턴스 드롭다운 메뉴를 클릭하여 로그 페이지에서 서비스의 모든 활성 인스턴스를 보고 필터링할 수 있습니다.

![모든 인스턴스를 보려면 인스턴스 드롭다운 메뉴를 클릭하십시오.](./reading-liferay-cloud-service-logs/images/01.png)

인스턴스 ID의 형식은 서비스가 구성된 배포 유형(배포 또는 상태 저장 세트)에 따라 다릅니다. 자세한 내용은 [배포 유형 이해](../updating-services-in-liferay-paas/understanding-deployment-types.md) 참조하십시오.

### 배포 유형 로그의 인스턴스 ID

배포 유형 로그에는 여러 부분으로 구성된 인스턴스 ID가 있습니다. 배포 유형 서비스의 다음 로그 메시지 예를 참조하세요.

```log
Jun 29 10:07:57.102 build-214 [liferay-7485669bdd-7ktfl] [LIFERAY] Executing 010_liferay_cloud_customizable_files_override.sh.
```

이 메시지의 인스턴스 ID(이 예에서는 `[liferay-7485669bdd-7ktfl]`)에는 다음 구성 요소가 포함됩니다.

* **서비스 이름** : 이 예에서는 `liferay`.

* 임의로 생성된 **버전 ID** : 이 예에서는 `7485669bdd`. 이는 변경 가능성이 있는 배포된 서비스 버전에 해당합니다. 새 배포, 환경 변수 변경 및 수동으로 서비스를 다시 시작하는 경우에도 모두 새 버전 ID가 생성됩니다(구성에서 새 변경이 수행되었을 수 있기 때문).

* 임의로 생성된 **컨테이너 ID** : 이 예에서는 `7ktfl`. 새 컨테이너가 생성될 때마다(예: 새 빌드를 배포하고 서비스를 다시 시작한 후) 서비스가 시작될 때마다 새 컨테이너가 생성되기 때문에 새 컨테이너 ID가 생성됩니다. 다시 시작하면 버전 ID가 변경되지 않는 경우에도 새 컨테이너 ID가 생성됩니다(예: [또는 준비 프로브 실패](../support-and-troubleshooting/troubleshooting/self-healing.md) 이 다시 시작을 트리거하는 경우).

### 상태 저장 세트 유형 로그의 인스턴스 ID

상태 저장 세트 유형 로그에는 더 작고 더 일관된 인스턴스 ID가 있습니다. Stateful 세트 유형 서비스의 로그 메시지 예를 참조하십시오.

```log
Jun 29 07:44:44.676 build-214 [search-0] #  - Creating and Starting rollup jobs will no longer be allowed.
```

상태 저장 집합 유형 서비스에 대한 `인스턴스 ID` 의 유일한 구성 요소는 다음과 같습니다.

* **서비스 이름** : 이 예에서는 `검색`.

* 반복(무작위)**노드 ID** : 이 예에서는 `0`입니다. 이 ID는 새 버전의 서비스를 배포한 후에도 동일하게 유지됩니다.

상태 저장 세트 유형 서비스의 전체 인스턴스 ID는 서비스의 각 노드에서 항상 동일하게 유지됩니다. 이렇게 하면 서비스가 재배포된 후에도 동일한 인스턴스 ID를 안정적으로 사용하여 동일한 [볼륨](../updating-services-in-liferay-paas/configuring-persistent-file-storage-volumes.md)을 가진 클러스터의 노드를 식별할 수 있습니다.

## Liferay Cloud Console을 통해 로그에 액세스

Liferay Cloud 콘솔을 통해 환경 서비스 로그에 액세스하려면 다음 단계를 따르십시오.

1. 프로젝트 환경으로 이동합니다.

1. 환경 메뉴에서 **로그** 클릭합니다.

드롭다운 메뉴를 사용하여 모든 환경 서비스 또는 [필터 결과](#searching-and-filtering-logs) 에서 애플리케이션, 상태 및 빌드 로그를 봅니다.

로그를 다운로드하려면 **로그 다운로드** 버튼을 클릭합니다.

![로그 페이지에서 환경 로그를 봅니다.](./reading-liferay-cloud-service-logs/images/02.png)

개별 서비스 로그는 각 서비스의 전용 페이지에 있는 로그 탭에서도 사용할 수 있습니다.

![각 서비스의 전용 페이지에 있는 로그 탭에서 개별 서비스 로그에 액세스하고 다운로드하십시오.](./reading-liferay-cloud-service-logs/images/03.png)

### 로그 검색 및 필터링

로그 페이지에서 [유형](#log-types) 또는 서비스별로 필터링할 수 있습니다. 서비스별로 로그를 필터링하면 특정 노드별로 필터링할 수 있는 또 다른 드롭다운 메뉴가 나타납니다.

![드롭다운 메뉴를 사용하여 유형, 서비스 및 서비스 인스턴스별로 필터링합니다.](./reading-liferay-cloud-service-logs/images/04.png)

날짜 범위로 필터링하려면 오른쪽 상단 모서리에 있는 날짜 선택기를 사용하십시오. [더 이상 유효한 로그](../reference/platform-limitations.md#all-services) 없는 날짜를 선택할 수 없습니다.

![특정 날짜 범위의 로그를 보려면 날짜 선택기를 사용하십시오.](./reading-liferay-cloud-service-logs/images/05.png)

특정 용어 또는 정규 표현식에 대한 로그를 검색할 수 있습니다. 드롭다운 메뉴에서 **Term** 또는 **Regex** 선택한 다음 검색어 또는 정규식을 입력합니다. 검색 제안은 이전 검색을 기반으로 나타납니다. 정규 표현식은 [RE2 구문](https://github.com/google/re2/wiki/Syntax) 사용합니다.

![특정 용어나 형식의 로그를 찾으려면 검색을 사용하십시오.](./reading-liferay-cloud-service-logs/images/06.png)

서비스 페이지에서는 유형 또는 인스턴스별로만 로그를 필터링할 수 있습니다.

## 터미널을 통해 로그에 액세스

관리자와 개발자는 OS 터미널을 통해 로그를 볼 수도 있습니다.

다음 명령을 실행하여 모든 서비스에 대한 로그를 나열합니다.

```shell
lcp log
```

특정 환경에서 서비스 로그에 액세스하려면 `lcp log` 명령을 실행한 후 환경의 ID를 입력하거나 환경 ID로 `lcp log` 명령을 실행하십시오.

```shell
lcp log -p <environment-id>
```

사용자는 `lcp log` 명령의 일부로 서비스를 지정할 수도 있습니다.

```shell
lcp log -p <environment-id> -s <service-id>
```

## 관련 주제

* [셸 액세스](./shell-access.md)
* [재해 복구 개요](./disaster-recovery-overview.md)
* [지역 간 재해 복구 구성](./configuring-cross-region-disaster-recovery.md)
