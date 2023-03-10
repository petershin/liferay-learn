# 빠른 업그레이드를 위한 데이터베이스 정리

데이터가 많을수록 데이터 업그레이드에 더 오래 걸립니다. 불필요한 사이트 데이터는 흔히 발생합니다. 불필요한 데이터의 데이터베이스를 정리하면 업그레이드 프로세스 성능이 향상됩니다.

예를 들어 사이트는 웹 콘텐츠 기사 또는 문서 및 미디어 파일의 사용하지 않는 버전을 많이 저장할 수 있습니다. 수정을 마쳤고 중간 수정이 필요하지 않은 경우 안전하게 제거할 수 있습니다. 이렇게 하면 공간과 업그레이드 시간이 절약됩니다.

다음은 데이터베이스 정리 주제입니다.

* 중복 웹 콘텐츠 구조 필드 이름 제거
* 사용하지 않는 개체 찾기 및 제거
* 정리된 데이터베이스 복사본으로 테스트

## 사용되지 않는 데이터 제거

데이터베이스에 사용되지 않는 데이터 또는 사용되지 않는 기능에서 남은 데이터가 있을 수 있습니다. 둘 다 청소하기 쉽습니다.

{bdg-secondary}`데이터 정리 도구 사용 가능 7.3+. Data Removal tool available 7.4+`

1. [데이터 정리](../reference/data-cleanup.md) 도구를 사용하여 오래된 모듈에서 데이터를 제거하십시오.

1. [데이터 제거](../reference/data-removal.md) 도구를 사용하여 사용 가능한 모듈에서 오래된 데이터를 제거하십시오.

## 중복 웹 콘텐츠 구조 필드 이름 제거

Web Content Management를 광범위하게 사용한 경우 고유한 필드 이름이 없는 구조가 있을 수 있습니다. 업그레이드하기 전에 중복 필드 이름을 찾아서 제거하십시오. 이전에 Liferay Portal 6.2로 업그레이드하고 이 작업을 건너뛴 경우 다음 오류가 발생합니다.

```
19:29:35,298 ERROR [main][VerifyProcessTrackerOSGiCommands:221] com.liferay.portal.verify.VerifyException: com.liferay.dynamic.data.mapping.validator.DDMFormValidationException$MustNotDuplicateFieldName: The field name page cannot be defined more than once
com.liferay.portal.verify.VerifyException: com.liferay.dynamic.data.mapping.validator.DDMFormValidationException$MustNotDuplicateFieldName: The field name page cannot be defined more than once
```

이 오류가 발생하면 Liferay Portal 6.2의 이전 백업으로 롤백하고 중복 필드 이름을 찾아서 제거하십시오.

## 사용하지 않는 개체 제거

데이터베이스에 사용되지 않은 개체에서 남은 데이터가 있을 수 있습니다.

1. UI에서 또는 데이터베이스에서 `SELECT` 쿼리를 사용하여 사용하지 않는 다른 개체를 식별하고 UI, [스크립트 콘솔](../../../system-administration/using-the-script-engine/running-scripts-from-the-script-console.md)을 통한 API 또는 생성한 포틀릿을 통해 개체를 제거합니다.

```{warning}
Liferay의 UI 또는 API는 Liferay DXP의 개체 간의 관계를 설명하므로 데이터를 조작하는 데에만 사용해야 합니다. 데이터베이스에서 직접 SQL을 사용하여 레코드를 제거하지 마십시오. SQL에서 개체 관계가 누락되어 개체가 분리되고 성능 문제가 발생할 수 있습니다.
```

다음은 사용하지 않는 개체를 확인하는 몇 가지 일반적인 사이트입니다.

### 대형/채워진 테이블의 개체

테이블 행은 Liferay DXP의 개체에 매핑됩니다. 레코드가 많은 큰 테이블에는 사용되지 않는 개체가 많이 포함될 수 있습니다. 테이블 크기와 테이블당 레코드 수가 클수록 업그레이드 시간이 길어집니다.

이러한 테이블과 관련된 사용되지 않는 개체를 찾아서 제거하면 업그레이드 시간이 단축됩니다. Liferay 백업에서 데이터를 가져오면 귀중한 테이블 정보를 제공할 수 있습니다. 데이터베이스 엔진은 이 정보를 다양한 방식으로 표시합니다. 예를 들어 데이터베이스 가져오기 로그는 다음과 같을 수 있습니다.

```
Processing object type SCHEMA\_EXPORT/TABLE/TABLE\_DATA

imported "LIFERAY"."JOURNALARTICLE" 13.33 GB 126687 rows

imported "LIFERAY"."RESOURCEPERMISSION" 160.9 MB 1907698 rows

imported "LIFERAY"."PORTLETPREFERENCES" 78.13 MB 432285 rows

imported "LIFERAY"."LAYOUT" 52.05 MB 124507 rows

imported "LIFERAY"."ASSETENTRY" 29.11 MB 198809 rows

imported "LIFERAY"."MBMESSAGE" 24.80 MB 126185 rows

imported "LIFERAY"."PORTALPREFERENCES" 4.091 MB 62202 rows

imported "LIFERAY"."USER\_" 17.32 MB 62214 rows

...
```

예제 데이터베이스 가져오기에서 몇 가지 항목이 두드러집니다.

* `JOURNALARTICLE` 테이블은 데이터베이스 크기의 98%를 차지합니다.
* `RESOURCEPERMISSION` 레코드가 많이 있습니다.
* 많은 `PORTLETPREFERENCES` 레코드가 있습니다.

눈에 띄는 테이블과 관련된 미사용 개체를 검색하고 Liferay의 API(예: [스크립트 콘솔](../../../system-administration/using-the-script-engine/running-scripts-from-the-script-console.md)사용)를 사용하여 불필요한 개체를 삭제합니다.

### 확인할 가치가 있는 일반적인 개체 유형

사용하지 않는 개체에 대해 일부 특정 개체 유형을 확인해야 합니다. 이를 확인하는 몇 가지 이유는 다음과 같습니다.

* 그것들을 제거하면 관련 사용하지 않는 개체를 제거할 수 있습니다.
* 보관할 가치가 없는 버전 개체일 수 있습니다.

다음 객체 유형을 확인하십시오.

* **사이트** : 필요하지 않은 사이트를 제거합니다. 사이트를 제거하면 다음과 같은 관련 개체가 제거됩니다.
  * 배치
  * 포틀릿 환경 설정
  * 파일 항목(문서 라이브러리 개체)
  * 자산
  * 꼬리표
  * 어휘 및 범주
  * Expando 필드 및 해당 값
  * `ResourcePermission` 객체
  * 부지에 고유한 다른 모든 객체

* **인스턴스** : 사용하지 않는 인스턴스는 드물지만 계층 구조에서 가장 높은 개체이므로 해당 개체를 제거하면 업그레이드를 상당히 최적화할 수 있습니다. 인스턴스를 제거하면 인스턴스와 연결된 다음 개체가 제거됩니다.
  * 사이트(및 모든 관련 콘텐츠)
  * 사용자
  * 역할
  * 조직
  * 전역 `ResourcePermission` 개체

* **중간 웹 콘텐츠 버전:** Liferay DXP는 수정(번역 포함) 후 새로운 웹 콘텐츠 버전을 생성합니다. 필요하지 않은 버전을 제거하는 것이 좋습니다. 이렇게 하면 특히 제거된 버전에 해당 버전에 특정한 이미지 파일과 같은 개체가 있는 경우 상당한 공간을 확보할 수 있습니다. 자세한 내용은 [예: 중간 저널 기사 버전 제거](./example-removing-intermediate-journal-article-versions.md)을 참조하십시오.

* **문서 버전** : 저널 기사와 마찬가지로 중간 문서 버전이 필요하지 않으면 삭제합니다. 이렇게 하면 데이터베이스와 파일 시스템 모두에서 공간이 절약됩니다.

* **레이아웃:** 레이아웃은 사이트 페이지이며 포틀릿 기본 설정, 권한, 자산, 등급 등과 같은 다른 엔터티와 관련되기 때문에 업그레이드 성능에 영향을 미칩니다. 불필요한 레이아웃을 제거하십시오.

* **역할** : 필요하지 않은 모든 역할을 제거합니다. 이를 삭제하면 관련된 `ResourceBlockPermission` 개체와 `ResourcePermission` 개체도 삭제됩니다.

* **사용자:** 비활성 상태이고 더 이상 필요하지 않은 사용자를 제거합니다.

* **어휘** : 사용하지 않는 어휘를 제거합니다. 어휘를 제거하면 해당 범주도 제거됩니다.

* **고아 데이터** : 연결되지 않은 미사용 개체를 확인합니다. 여기 예시들이 있습니다 :
  * `파일 시스템 데이터가 없는 DLFileEntries`.
  * `ResourcePermission` 더 이상 존재하지 않는 역할, 레이아웃, 사용자, 포틀릿 인스턴스 등과 연관된 개체.
  * `PortletPreference` 더 이상 존재하지 않는 포틀릿 또는 레이아웃과 연관된 개체. 이것은 포틀릿이 많이 포함된 환경에서 일반적입니다. 이러한 포틀릿 인스턴스는 수명 주기가 다르며 포틀릿이 템플릿에서 제거될 때 삭제되지 않습니다.

중간 객체 버전을 제거하는 예를 보려면 [예: 중간 저널 기사 버전 제거](./example-removing-intermediate-journal-article-versions.md)을 읽으십시오.

다음으로 정리된 데이터베이스로 인스턴스를 테스트합니다.

## 정리된 데이터베이스 복사본으로 테스트

제거한 개체와 관련된 모든 문제를 찾아 해결합니다. 개체가 실수로 제거되었거나 다른 콘텐츠에 영향을 미치는 경우 중요한 단계입니다. 문제를 해결할 수 없는 경우 프로덕션 데이터베이스의 새 복사본 정리를 언제든지 다시 시작할 수 있습니다.

## 추가 정보

* [예: 중간 저널 기사 버전 제거](./example-removing-intermediate-journal-article-versions.md)