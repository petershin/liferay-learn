---
toc:
- ./upgrade-basics/upgrading-via-docker.md
- ./upgrade-basics/using-the-database-upgrade-tool.md
- ./upgrade-basics/post-upgrade-considerations.md
---

# 업그레이드 기본 사항

```{toctree}
:maxdepth: 2

upgrade-basics/upgrading-via-docker.md
upgrade-basics/using-the-database-upgrade-tool.md
upgrade-basics/post-upgrade-considerations.md
```

Liferay의 도구 및 지침은 DXP 및 포털 환경을 안전하고 신속하게 업그레이드할 수 있도록 합니다. 예를 들어 작은 데이터 세트가 있는 클러스터되지 않은 환경은 [Docker 이미지](./upgrade-basics/upgrading-via-docker.md)을 사용하여 업그레이드할 수 있습니다. 복잡하거나 더 큰 데이터 세트가 있거나 많은 사용자 정의가 있는 DXP 환경 및 포털 환경은 [Database Upgrade Tool](./upgrade-basics/using-the-database-upgrade-tool.md)을 사용하여 업그레이드됩니다.

```{warning}
**항상** 업그레이드하기 전에 데이터베이스와 설치를 [백업](../maintaining-a-liferay-installation/backing-up.md)하십시오. 백업 복사본에서 업그레이드 프로세스를 테스트하는 것이 좋습니다.
```

```{note}
[Docker를 통한 업그레이드](./upgrade-basics/upgrading-via-docker.md)는 소규모 포털 환경에서 데이터베이스를 업그레이드하는 가장 쉬운 방법입니다.
```

업그레이드를 시작하기 전에 관련된 사항을 고려하십시오. 업그레이드 항목은 다음 범주로 분류됩니다.

* [준비 및 계획](#preparation-and-planning)
* [맞춤형 개발 업그레이드](#upgrading-custom-development)
* [구성 및 인프라 마이그레이션](#migrating-and-updating-configurations-and-infrastructure)
* [업그레이드 성능 향상](#improving-upgrade-performance)
* [데이터베이스 업그레이드 실행](#executing-the-database-upgrade)

## 준비 및 계획

소규모 임시 설치에는 준비 및 계획이 거의 중요하지 않을 수 있지만 대기업 수준 설치에는 **필수** 입니다.

### 사용 가능한 업그레이드 경로 검토

이 표에서 현재 Liferay DXP/Portal 버전을 찾아 설치 업그레이드 경로를 확인하십시오.

| 업그레이드 경로                                                            | 묘사                                              |
|:------------------------------------------------------------------- |:----------------------------------------------- |
| 라이프레이 DXP/포털 6.2+ &rarr; DXP 7.4                                    |                                                 |
| 라이프레이 포털 6.1.x &rarr; DXP/포털 7.1 &rarr; DXP 7.4                     | Liferay Portal 6.1에 대한 지원 수명 종료                 |
| Liferay 포털 5.x 및 6.0.x &rarr; Liferay 포털 6.2 &rarr; Liferay DXP 7.4 | Liferay Portal 5.0, 5.1, 5.2 및 6.0에 대한 지원 수명 종료 |

Liferay Portal을 동일한 부 버전의 새 GA로 업그레이드(예: 7.3 GA1에서 GA2로 업그레이드)하고 데이터 스키마 변경 사항이 없는 경우 새 GA를 즉시 사용할 수 있습니다. 스키마가 변경된 경우 시작 메시지는 [데이터베이스를 업그레이드](#executing-the-database-upgrade) -- [Docker 이미지](./upgrade-basics로 업그레이드를 호출해야 하는) 새 데이터 스키마 버전을 보고합니다. /upgrading-via-docker.md)가 가장 쉽습니다.

경로에 Liferay Portal 6.2로의 업그레이드가 포함된 경우 먼저 [Liferay Portal 6.2 업그레이드 지침](https://help.liferay.com/hc/ko/articles/360017903232-Upgrading-Liferay) 을 따르십시오.

경로에 Liferay Portal 6.2로의 업그레이드가 포함된 경우 먼저 [Liferay Portal 6.2 업그레이드 지침](https://help.liferay.com/hc/ko/articles/360017903232-Upgrading-Liferay) 을 따르십시오.

```{note}
일부 새로운 Liferay 버전은 테이블 열의 이름을 바꿉니다. 이러한 열과 연결된 모든 [가상 열](https://en.wikipedia.org/wiki/Virtual_column) 은 데이터베이스 업그레이드를 금지하며 업그레이드 전에 제거해야 합니다. 업그레이드 후 동등한 가상 열을 추가할 수 있습니다. 자세한 내용은 [업그레이드 문제 해결](./reference/troubleshooting-upgrades.md)을 참조하세요.
```

### 사용 중단 및 기본 설정 변경 사항 검토

새 버전의 Liferay에서는 기능 및 구성 기본값이 변경될 수 있습니다. 기능 및 설정에 대한 가장 최근의 사용 중단 및 변경 사항은 참조 섹션 또는 다음 문서를 참조하십시오.

* [유지 관리 모드 및 지원 중단](./reference/maintenance-mode-and-deprecations-in-7-3.md)
* [기본 설정 변경](./reference/default-setting-changes-in-7-3.md)

### 업그레이드 패치 요청(구독)

> 기부금

Liferay DXP 구독이 있는 경우 최신 수정 팩으로 업데이트하거나 업그레이드 패치를 요청하여 데이터베이스 업그레이드를 준비하십시오. 이 프로세스를 시작하려면 [도움말 센터](https://help.liferay.com/hc/requests/new) 에 티켓을 제출하세요.

### 출판 준비

인스턴스에 대해 [발행물](../../site-building/publishing-tools/publications.md) 이 활성화된 경우 업그레이드하기 전에 모든 활성 발행물을 발행했는지 확인하십시오. 업그레이드 후 활성 게시는 오래된 것으로 표시되며 게시하거나 변경할 수 없습니다.

```{note}
업그레이드 전에 게시한 발행물은 업그레이드 프로세스 후에 되돌릴 수 없습니다. *되돌리기* 옵션은 이전 Liferay 버전에서 만든 모든 간행물에 대해 제거됩니다.
```

### 상거래 업그레이드 준비

[커머스](https://learn.liferay.com/commerce/latest/ko/index.html) 사용하는 경우 Liferay 데이터베이스를 업그레이드하기 전에 업그레이드를 준비하십시오. 자세한 내용은 [Liferay Commerce 업그레이드](https://learn.liferay.com/commerce/latest/ko/installation-and-upgrades/upgrading-liferay-commerce.html) 업그레이드를 참조하십시오.

### Marketplace 앱 업데이트

Liferay 데이터베이스를 업그레이드하기 전에 현재 사용 중인 Liferay 버전의 Marketplace 앱을 업데이트하고 업데이트된 앱을 테스트하십시오. 앱 업데이트를 건너뛰면 문제가 발생할 수 있으며 앱이 새 Liferay 버전에서 활성화되지 않을 수 있습니다.

```{important}
데이터베이스 업그레이드 전에 현재 설치에서 이 작업을 수행하십시오.
```

새 Liferay 버전에 대한 앱의 최신 버전에는 데이터 업그레이드가 필요한 데이터베이스 스키마 변경이 있을 수 있습니다. Liferay 데이터베이스 업그레이드 **중** 또는 **후** 에 앱 데이터를 업그레이드할 수 있습니다.

**옵션 1:** 데이터베이스 업그레이드 **전에** 최신 앱을 설치하고 데이터베이스 업그레이드의 일부로 앱 데이터를 자동으로 업그레이드합니다. 각 데이터베이스 업그레이드 경로는 앱 설정 세부 정보를 설명합니다.

**옵션 2:** 데이터베이스 업그레이드 **후** 최신 앱을 설치한 다음 [Gogo 셸 명령](./upgrade-stability-and-performance/upgrading-modules-using-gogo-shell.md)을 사용하여 업그레이드합니다. 앱 데이터. [업그레이드 후 고려 사항](./upgrade-basics/post-upgrade-considerations.md)에 앱 설정 세부 정보가 설명되어 있습니다.

## 맞춤형 개발 업그레이드

개발한 플러그인(예: 테마, 앱 및 사용자 정의)은 새로운 Liferay 버전에 맞게 조정되어야 합니다. 이는 종속성 업데이트만큼 간단하거나 API 변경에 대한 코드 업데이트를 포함할 수 있습니다. 사용자 지정 플러그인을 업데이트하지 않으면 새 Liferay 버전에서 비활성화될 수 있습니다. [사용자 정의 개발 업그레이드](./upgrading-custom-development.md) 코드 업그레이드 프로세스를 안내합니다.

## 구성 및 인프라 마이그레이션 및 업데이트

구성 및 지원 인프라를 이전 설치에서 새 설치로 마이그레이션하고 업데이트해야 합니다.

```{important}
6.2 이하에서 업그레이드하는 경우 파일 저장소 구성을 업데이트하십시오. 자세한 내용은 [파일 저장소 업데이트](./reference/file-store-updates.md)를 참조하세요.
```

```{important}
`로케일` [포털 속성](../../installation-and-upgrades/reference/portal-properties.md)을 재정의한 경우 업그레이드하기 전에 새 설치에서 재정의합니다. 이렇게 하면 모든 로케일에 대한 데이터 업그레이드가 보장됩니다.
```

데이터베이스 업그레이드가 완료될 때까지 기다렸다가 다른 설정을 업데이트할 수 있습니다. 자세한 내용은 이 [구성 및 속성 마이그레이션](./migrating-configurations-and-properties.md) 참조하십시오.

## 업그레이드 성능 향상

불필요한 데이터를 그대로 두거나 성능 튜닝을 포기하면 대규모 데이터 세트를 업그레이드하는 데 엄청나게 오랜 시간이 걸릴 수 있습니다. 데이터베이스 업그레이드를 빠르게 하는 방법에는 여러 가지가 있습니다.

### 데이터 정리

Liferay 서버에 불필요한 인스턴스, 사이트, 페이지 또는 버전 콘텐츠 항목(예: 웹 콘텐츠 기사, 문서 및 미디어 파일 등)이 있는 경우 이를 제거하면 업그레이드 시간을 상당히 줄일 수 있습니다. 데이터베이스에서 불필요한 데이터를 정리하는 방법은 [빠른 업그레이드를 위한 데이터베이스 정리](./upgrade-stability-and-performance/database-pruning-for-faster-upgrades.md) 참조하십시오.

### 데이터베이스 성능 조정

업그레이드 작업을 위해 데이터베이스를 조정하면(프로덕션보다 더 많은 데이터 쓰기) 데이터베이스 업그레이드 성능이 향상됩니다. 자세한 내용은 [업그레이드를 위한 데이터베이스 튜닝](./upgrade-stability-and-performance/database-tuning-for-upgrades.md) 참조하십시오.

### 일괄 삽입 활성화

[더 빠른 실행을 위해 일괄 삽입](./upgrade-basics/using-the-database-upgrade-tool.md#batch-insert-property) 을 활성화합니다.

## 데이터베이스 업그레이드 실행

다음은 Liferay 데이터베이스를 업그레이드하는 두 가지 방법입니다.

* [Docker](./upgrade-basics/upgrading-via-docker.md) 통한 업그레이드에는 Docker 이미지를 시작하기 위한 명령에 자동 업그레이드 매개변수를 전달하는 작업이 포함됩니다. 이미지는 데이터베이스를 업데이트한 다음 업그레이드된 데이터베이스를 사용하여 시작합니다.

* [데이터베이스 업그레이드 도구 사용](./upgrade-basics/using-the-database-upgrade-tool.md). 업그레이드 도구는 Liferay 인스턴스에서 분리된 상태에서 Liferay 데이터베이스를 업데이트하기 위한 클라이언트 프로그램입니다. 업그레이드 프로세스, 업그레이드 작업을 위한 [데이터베이스 조정](./upgrade-stability-and-performance/database-tuning-for-upgrades.md) 및 [불필요한 데이터 제거](./upgrade-stability -and-performance/database-pruning-for-faster-upgrades.md)를 사용하여 데이터베이스 업그레이드 속도를 높일 수 있습니다.
 
```{note}
[데이터베이스 업그레이드 옵션](./reference/database-upgrade-options.md)은 다양한 DXP/포털 설치 유형으로 위의 방법으로 데이터베이스를 업그레이드(및 Gogo Shell을 사용하여 모듈을 업그레이드)하는 방법을 설명합니다.
```

## 결론

위에서 설명한 작업을 완료하면 업그레이드가 완료됩니다. 그러나 Liferay를 사용하기 전에 원하는 런타임 설정을 다시 설정하고 업그레이드별 조정을 실행 취소해야 합니다. 또한 새로운 Liferay 프로덕션 인스턴스에 권장되는 이전 Liferay 버전에서는 사용할 수 없었던 애플리케이션이 있을 수 있습니다. 자세한 내용은 [업그레이드 후 고려 사항](./upgrade-basics/post-upgrade-considerations.md) 참조하십시오.

이제 업그레이드 구성 요소에 익숙해졌으므로 Liferay 인스턴스를 업그레이드할 수 있습니다. 데이터베이스를 업그레이드하기 전에 현재 설치에서 예비 작업을 수행해야 합니다. 사용자 지정 플러그인 코드를 업그레이드하고 데이터베이스 업그레이드를 병렬로 실행하는 것이 일반적입니다. 데이터베이스 업그레이드는 가장 먼저 시작해야 하는 인기 있는 작업이므로 두 가지 방법에 대한 링크는 다음과 같습니다.

* [Docker를 통한 업그레이드](./upgrade-basics/upgrading-via-docker.md)
* [데이터베이스 업그레이드 도구 사용](./upgrade-basics/using-the-database-upgrade-tool.md)

또한 업그레이드와 관련된 다른 업그레이드 시나리오를 참조하십시오.

* [샤딩된 환경 업그레이드](./other-upgrade-scenarios/upgrading-a-sharded-environment.md)
* [클러스터된 설치 유지](../maintaining-a-liferay-installation/maintaining-clustered-installations.md)
