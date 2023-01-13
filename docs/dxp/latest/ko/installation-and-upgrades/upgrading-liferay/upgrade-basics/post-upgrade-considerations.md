# 업그레이드 후 고려 사항

데이터베이스를 업그레이드한 후 프로덕션용으로 Liferay를 다시 구성하고 Liferay 인스턴스에 영향을 줄 수 있는 기능 변경 사항을 확인해야 합니다.

## 프로덕션 설정 다시 활성화

이제 데이터베이스 업그레이드를 완료했으므로 프로덕션 설정을 다시 활성화하십시오.

### 검색 인덱싱

7.2로 업그레이드하기 위해 검색 인덱싱을 비활성화한 경우 비활성화하는 데 사용한 `.config` 파일을 제거하거나 `.config` 파일에서 `indexReadOnly="false"` 을 설정하여 검색 인덱싱을 다시 활성화합니다. 예를 들어,

```bash
rm osgi/configs/com.liferay.portal.search.configuration.IndexStatusManagerConfiguration.config
```

주요 버전 업그레이드에는 검색 색인 재인덱싱이 필요합니다. 새 업데이트로 이동하거나, 서비스 팩을 적용하거나, 동일한 Liferay 버전 내에서 새 GA(롤링 릴리스)로 업그레이드할 때 버전의 릴리스 하이라이트를 참조하여 재색인이 필요한지 확인하십시오. 색인을 다시 생성하는 방법은 다음과 같습니다.

1. *글로벌 메뉴* (![Global Menu icon](./post-upgrade-considerations/images/01.png))을 클릭하고 *제어판* 탭을 선택합니다. 제어판이 나타납니다.

1. 구성 섹션에서 *검색* 을 클릭하고 *인덱스 작업* 탭을 선택한 다음 *실행* for *모든 검색 인덱스 재인덱싱을 클릭합니다.* 재색인이 실행되고 완료되면 성공 메시지가 표시됩니다.

![제어판에서 검색 인덱스를 다시 인덱싱할 수 있습니다.](./post-upgrade-considerations/images/02.png)

```{note}
이전 버전(7.1 이하)에서 업그레이드한 경우 [Elasticsearch 설치](../../../using-search/installing-and-upgrading-a-search-engine/installing-a-search-engine 설치를 고려하십시오. .md) 검색 인덱싱을 처리합니다.
```

### 데이터베이스 구성

데이터베이스를 업그레이드하기 전에 업그레이드를 위해 조정했을 수 있습니다( [업그레이드를 위한 데이터베이스 조정](../upgrade-stability-and-performance/database-tuning-for-upgrades.md)참조). 업그레이드가 완료되었으므로 프로덕션 데이터베이스 설정을 복원하십시오.

```{note}
데이터 업그레이드 중에 분할된 환경에서 마이그레이션한 경우 가상 인스턴스로의 전환을 완료하려면 구성을 더 많이 조정해야 합니다. 자세한 내용은 [업그레이드 및 업데이트 속성](../other-upgrade-scenarios/upgrading-a-sharded-environment.md#Upgrade-and-Update-Properties) 섹션을 참조하십시오.
```

## 최신 Marketplace 앱 설치

새 Liferay 버전용 [Marketplace 앱](../../../system-administration/installing-and-managing-apps/installing-apps/downloading-apps.md) 최신 버전을 아직 설치하지 않은 경우 이를 설치하고 [Gogo 셸 명령](../upgrade-stability-and-performance/upgrading-modules-using-gogo-shell.md) 을 사용하여 필요한 데이터베이스 업그레이드를 확인하고 실행하십시오.

## 기능 변경 설명

기능 및 동작은 새로운 Liferay 버전으로 변경됩니다. 다음 변경 사항을 검토하십시오.

### 웹 콘텐츠 보기 권한 활성화

7.1 이전에는 모든 사용자가 기본적으로 웹 콘텐츠 기사를 볼 수 있었습니다. 이제 기본적으로 보기 권한이 대신 선택됩니다. 보기 권한을 여는 주요 옵션은 다음과 같습니다.

**옵션 1:** _제어판_ → _구성_ → _시스템 설정_ → _웹 콘텐츠_ → _가상 인스턴스 범위_ → _웹 콘텐츠_ 및 선택 취소 _로 이동하여 모든 웹 콘텐츠 기사에 대한 보기 권한 열기 기사 보기 권한 확인 활성화_.

![시스템 설정의 웹 콘텐츠 메뉴에서 아래로 스크롤하여 웹 콘텐츠를 보기 위한 권한 확인을 비활성화합니다.](./post-upgrade-considerations/images/03.png)

**옵션 2:** 웹 콘텐츠 기사가 거의 없는 경우 역할별로 웹 콘텐츠 기사별로 보기 권한을 편집합니다.

### 웹 콘텐츠 이미지 확인

7.2로 업그레이드하면 웹 콘텐츠 이미지가 [파일 저장소](../../../system-administration/file-storage.md) (문서 라이브러리라고도 함)로 이동된 다음 이전 테이블인 `JournalArticleImage`이 삭제됩니다. 이미지를 마이그레이션할 수 없는 경우 Liferay는 실패를 보고합니다.

```
Unable to add the journal article image {filename} into the file repository
```

그러한 메시지가 없다면 이제 모든 이미지가 파일 저장소에 있을 것입니다. 웹 콘텐츠 기사를 미리 보고 이미지를 확인할 수 있습니다.

## 유지 관리 모드에서 사용 중단 및 기능 설명

아직 수행하지 않은 경우 유지 관리 모드</a> 의

사용 중단 및 기능을 검토하고 Liferay 인스턴스에 미치는 영향을 처리할 계획을 세우십시오.</p> 



## 사용되지 않는 데이터 제거

불필요하고 쓸모없는 데이터를 다 사용했다면 제거할 수 있습니다. 다음은 데이터를 제거하기 위한 두 가지 일반적인 사용되지 않는 데이터 상황 및 도구입니다.

* 더 이상 사용되지 않는 Liferay 앱 또는 모듈의 데이터. [데이터 정리](../reference/data-cleanup.md) 도구는 이를 제거합니다.

* 사용 가능한 Liferay 앱 및 모듈에서 더 이상 사용되지 않는 데이터. [데이터 제거](../reference/data-removal.md) 도구는 이를 제거합니다.



## 결론

필요한 모든 업그레이드 후 작업을 완료하면 Liferay 서버가 이전과 같이 정상 작동할 준비가 된 것입니다. 축하합니다!
