# 업그레이드 후 고려 사항

데이터베이스를 업그레이드한 후에는 Liferay를 프로덕션용으로 다시 구성하고 Liferay 인스턴스에 영향을 미칠 수 있는 기능 변경 사항을 확인해야 합니다.

## 프로덕션 설정을 다시 활성화합니다.

데이터베이스를 업그레이드한 후 프로덕션 설정을 다시 활성화하십시오.

### 검색 인덱싱

7.2로 업그레이드하기 위해 검색 인덱싱을 비활성화한 경우 비활성화하는 데 사용한 `.config` 파일을 제거하거나 `.config` 파일에서 `indexReadOnly="false"`를 설정하여 다시 활성화하세요. 예를 들어,

```bash
rm osgi/configs/com.liferay.portal.search.configuration.IndexStatusManagerConfiguration.config
```

모든 Liferay 업그레이드 후에는 검색 인덱스를 다시 인덱싱해야 합니다. 다시 색인을 생성하려면,

1. **전역 메뉴**(![전역 메뉴 아이콘](./post-upgrade-considerations/images/01.png))를 클릭하고 **제어판** 탭을 엽니다.

1. 구성 섹션에서 **검색** 을 클릭하고 **인덱스 작업** 탭을 선택합니다.

1. [동시 또는 전체 재인덱싱 모드](../../../using-search/search-administration-and-tuning/reindexing-modes.md) 선택한 다음 **모든 검색 인덱스** 에 대해 **재인덱싱** 을 클릭합니다. 재인덱싱이 실행되고 완료되면 성공 메시지가 표시됩니다.

![You can reindex your search indexes in the Control Panel.](./post-upgrade-considerations/images/01.png)

```{note}
이전 버전(7.1 이하)에서 업그레이드한 경우 [검색 인덱싱을 처리하기 위해 Elasticsearch](../../../using-search/installing-and-upgrading-a-search-engine/installing-a-search-engine.md) 설치를 고려하십시오.
```

### 데이터베이스 구성

업그레이드하기 전에 업그레이드를 위해 데이터베이스를 조정한 경우( [업그레이드를 위한 데이터베이스 조정](../upgrade-stability-and-performance/database-tuning-for-upgrades.md) 참조) 프로덕션 데이터베이스 설정을 복원하십시오.

```{note}
데이터 업그레이드 중에 샤딩된 환경에서 마이그레이션한 경우 가상 인스턴스로의 전환을 완료하려면 구성을 추가로 조정해야 합니다. 자세한 내용은 [업그레이드 및 업데이트 속성](../other-upgrade-scenarios/upgrading-a-sharded-environment.md#Upgrade-and-Update-Properties) 섹션을 참조하세요.
```

## 최신 Marketplace 앱 설치

새로운 Liferay 버전에 대해 [Marketplace 앱](../../../system-administration/installing-and-managing-apps/installing-apps/downloading-apps.md) 의 최신 버전을 설치하고 [Gogo 셸 명령](../upgrade-stability-and-performance/upgrading-modules-using-gogo-shell.md) 사용하여 필요한 데이터베이스 업그레이드를 확인하고 실행합니다.

## 기능 변경 사항 고려

새로운 Liferay 버전에서는 기능과 동작이 변경됩니다. 다음 기능과 동작이 어떻게 변경되는지 검토하세요.

### 웹 콘텐츠 보기 권한 활성화

7.1 이전에는 모든 사용자가 기본적으로 웹 콘텐츠 기사를 볼 수 있었습니다. 이제 보기 권한이 기본적으로 선택됩니다. 역할별로 각 웹 콘텐츠 기사에 대한 보기 권한을 편집할 수 있습니다.

```{note}
7.4 이전에는 *제어판* &rarr; *구성* &rarr; *시스템 설정* &rarr; *웹 콘텐츠* &rarr; *가상 인스턴스 범위* &rarr; *웹 콘텐츠* 및 de-로 이동하여 모든 웹 콘텐츠 기사에 대한 보기 권한을 열 수 있었습니다. *기사 보기 권한 확인 활성화*를 선택합니다.
```

![Disable the permissions check for viewing web content by scrolling down in the Web Content menu in the System Settings.](./post-upgrade-considerations/images/02.png)

### 웹 콘텐츠 이미지 확인

7.2로 업그레이드하면 웹 콘텐츠 이미지가 [파일 저장소](../../../system-administration/file-storage.md) (문서 라이브러리라고도 함)로 이동한 다음 이전 테이블 `JournalArticleImage`가 삭제됩니다. 이미지를 마이그레이션할 수 없는 경우 Liferay는 실패를 보고합니다.

```
저널 기사 이미지 {filename} 을 파일 저장소에 추가할 수 없습니다.
```

메시지가 없으면 이제 이미지가 파일 저장소에 있을 것입니다. 웹 콘텐츠 기사를 미리 보고 이미지를 확인하세요.

## 유지 관리 모드의 지원 중단 및 기능 설명

유지 관리 모드 [의 지원 중단 및 기능](../reference/maintenance-mode-and-deprecations-in-7-3.md) 개를 검토하고 Liferay 인스턴스에 미치는 영향을 처리할 계획을 세우세요.

## 사용되지 않는 데이터 제거

불필요하고 쓸모없는 데이터가 있으면 제거할 수 있습니다. 다음은 두 가지 일반적인 오래된 데이터 상황과 이를 제거하는 도구입니다.

* 더 이상 사용되지 않는 Liferay 앱 또는 모듈의 데이터. [데이터 정리](../reference/data-cleanup.md) 도구가 이를 제거합니다.

* 사용 가능한 Liferay 앱 및 모듈의 오래된 데이터입니다. [데이터 제거](../reference/data-removal.md) 도구가 이를 제거합니다.

## 결론

필요한 모든 업그레이드 후 작업이 완료되면 Liferay 서버는 이전과 같이 정상적으로 작동할 준비가 됩니다. 축하해요!
