# 7.3 주요 변경 사항

이 문서는 기존 기능, API 또는 타사 Liferay 개발자 또는 사용자와의 계약을 위반하는 변경 사항을 시간순으로 나열합니다. 우리는 이러한 중단을 최소화하기 위해 최선을 다하지만 때로는 피할 수 없는 경우도 있습니다.

이 파일에 문서화된 몇 가지 변경 사항 유형은 다음과 같습니다.

* 제거되거나 교체된 기능
* API 비호환성: 공개 Java 또는 JavaScript API 변경
* 템플릿에 사용할 수 있는 컨텍스트 변수에 대한 변경 사항
* Liferay 테마 및 포틀릿에 사용할 수 있는 CSS 클래스의 변경 사항
* 구성 변경: `portal.properties`, `system.properties` 등과 같은 구성 파일의 변경 사항입니다.
* 실행 요구 사항: Java 버전, Java EE 버전, 브라우저 버전 등
* 지원 중단 또는 지원 종료: 예를 들어 특정 기능이나 API가 향후 버전에서 삭제될 것이라고 경고합니다.

## 주요 변경 사항 목록

### Liferay FontAwesome은 더 이상 기본적으로 포함되지 않습니다.

- **날짜:** 2019년 8월 21일
- **JIRA 티켓:** [LPS-100021](https://issues.liferay.com/browse/LPS-100021)

#### 무엇이 바뀌었나요?

Font Awesome, Glyphicon 및 사용자 정의 Liferay 아이콘용 아이콘 글꼴이 포함된 Liferay FontAwesome은 더 이상 기본적으로 포함되지 않습니다.

#### 누가 영향을 받나요?

이는 이러한 아이콘 글꼴 자체를 포함하지 않는 테마가 적용된 페이지나 사이트에 영향을 미칩니다. 이러한 아이콘 글꼴을 사용하는 페이지나 사이트의 모든 콘텐츠나 코드는 더 이상 작동하지 않습니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

아이콘 글꼴을 사용하는 방법에 따라 취할 수 있는 몇 가지 접근 방식이 있습니다.

##### liferay-ui:icon 사용의 경우

`<liferay-ui:icon iconCssClass="icon-user">`를 `<liferay-ui:icon icon="user" markupView="lexicon" />`로 바꿉니다.

##### JavaScript로 생성된 아이콘의 경우

FontAwesome 아이콘 html을 수동으로 생성하는 경우 `Liferay.Util.getLexiconIconTpl(`user`)` API를 사용할 수 있습니다. 예를 들어, 이전 호출은 사용자 svg 아이콘에 대한 html 코드를 반환합니다.

##### JSP 내 직접 HTML의 경우

jsp에서 아이콘을 직접 사용하는 개발자는 위에서 설명한 대로 `liferay-ui:icon` 태그를 사용하거나 대신 svg 기반 아이콘을 생성하기 위해 `clay:icon` 태그를 사용할 수 있습니다.

##### 비제어 코드의 경우

아이콘 글꼴을 사용하는 콘텐츠에 액세스할 수 없거나 코드나 콘텐츠를 업데이트하고 싶지 않은 경우 테마에 글꼴을 포함할 수 있습니다.

7.2 업그레이드 프로세스 중에 테마 업그레이드 도우미는 개발자에게 FontAwesome을 테마의 일부로 유지하라는 메시지를 표시합니다. 아이콘 글꼴이 이미 포함된 테마는 영향을 받지 않으며 7.3에서도 계속 작동합니다.

#### 왜 이렇게 변경되었나요?

불필요한 파일을 제공하지 않음으로써 대역폭을 절약하고 사이트 성능을 높이기 위해 이러한 변경이 이루어졌습니다.

---------------------------------------

### liferay.frontend.ProgressBar가 제거되었습니다.

- **날짜:** 2019년 8월 28일
- **JIRA 티켓:** [LPS-100122](https://issues.liferay.com/browse/LPS-100122)

#### 무엇이 바뀌었나요?

레거시 동작에 대한 임시 브리지로 사용되는 레거시 metal+soy `liferay.frontend.ProgressBar` 구성 요소가 제거되었습니다.

#### 누가 영향을 받나요?

이는 `liferay.frontend.ProgressBar`를 사용하는 모든 코드에 영향을 미칩니다. 이는 일반적으로 `{call liferay.frontend.ProgressBar /}`와 같은 `soy`를 통해 수행됩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

`liferay.frontend.ProgressBar` 구성 요소를 직접 대체할 수는 없습니다. 이에 의존하는 구성 요소가 있는 경우 이전 구현의 복사본을 같은 사이트
에 두고 이를 모듈 내에서 로컬로 사용할 수 있습니다.

#### 왜 이렇게 변경되었나요?

`liferay.frontend.ProgressBar` 구성 요소는 7.2에서 더 이상 사용되지 않으며 더 이상 사용되지 않습니다.

---------------------------------------

### AssetCategory의 트리 경로가 왼쪽/오른쪽 범주 ID를 대체합니다.

- **날짜:** 2019년 10월 8일
- **JIRA 티켓:** [LPS-102671](https://issues.liferay.com/browse/LPS-102671)

#### 무엇이 바뀌었나요?

`AssetCategory`의 왼쪽 및 오른쪽 카테고리 ID가 제거되고 단일 트리 경로로 대체되었습니다.

#### 누가 영향을 받나요?

이는 `AssetCategory` 및 관련 API에서 왼쪽 및 오른쪽 카테고리 ID를 사용하는 모든 사람에게 영향을 미칩니다.

왼쪽 및 오른쪽 카테고리 ID는 주로 `AssetCategory`의 내부 계층 트리에 사용되었습니다.

기존 `AssetCategory` 서비스 API는 제거된 `AssetCategoryLocalService::rebuildTree(long groupId, boolean force)`를 제외하고 동일하게 유지됩니다.

이 메소드는 `AssetCategoryUtil`에서 제거되었습니다.

- `countAncestors`
- `countDescendants`
- `getAncestors`
- `getDescendants`

`AssetEntryQuery`에서 왼쪽 및 오른쪽 카테고리 ID와 관련된 메소드가 제거되었습니다.

`G_P_N_V`로 끝나는 Finder 메소드가 `P_N_V`로 끝나는 메소드로 대체되었습니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

##### 왼쪽 및 오른쪽 카테고리 ID의 경우

왼쪽 및 오른쪽 카테고리 ID를 사용하는 경우 다음 옵션을 고려하세요.

- 새 트리 경로를 사용하도록 코드를 조정하세요.
- 동일한 목표를 달성하기 위해 서비스 API를 사용할 수 있는지 탐색

예를 들어 `category.getLeftCategoryId()` 및 `category.getRightCategoryId()`를 통해 카테고리 ID로 작업하는 대신 `category.getTreePath()`를 통해 트리 경로를 가져올 수 있습니다. 그런 다음 트리 경로를 사용하십시오.

참고로 이 스니펫 `AssetCategoryLocalService`는 카테고리를 추가할 때 트리 경로를 설정합니다.

```
if (parentCategory == null){
    category.setTreePath("/" + categoryId + "/");
}
else {
    category.setTreePath(
        parentCategory.getTreePath()+ categoryId + "/");
}
```

[7.3.0-ga1 - AssetCategoryLocalServiceImpl.java#L122-L128](https://github.com/liferay/liferay-portal/blob/7.3.0-ga1/portal-impl/src/com/liferay/portlet/asset/service/impl/AssetCategoryLocalServiceImpl.java#L122-L128) 참조하세요.

##### AssetCategoryLocalService#rebuildTree(long, boolean)의 경우

`AssetCategoryLocalService#rebuildTree(long, boolean)`에 대한 호출은 불필요할 수 있습니다. 이 방법은 현재 대체된 내부 계층 트리 구현을 유지하는 데 주로 사용되었습니다.

`rebuildTree` 메서드 호출이 여전히 필요한지 확인하려면 기존 코드를 재평가하는 것이 좋습니다.

##### AssetCategoryUtil 및 AssetEntryQuery의 경우

`AssetCategoryUtil` 및 `AssetEntryQuery`에서 제거된 메서드를 사용하는 경우 다음 제안 사항을 고려하세요.

- 기존 코드를 재평가하세요.
- 기존 서비스 API가 동일한 목표를 달성할 수 있는지 탐색

##### G_P_N_V와 관련된 파인더 메소드의 경우

`G_P_N_V`로 끝나는 `AssetCategory` 찾기 메서드를 사용하는 경우 대신 `P_N_V`로 끝나는 메서드를 사용하세요.

#### 왜 이렇게 변경되었나요?

이 변경은 AssetCategory의 계층적 트리 구현을 개선하기 위해 이루어졌습니다.

---------------------------------------

### liferay.frontend.Slider가 제거되었습니다.

- **날짜:** 2019년 10월 10일
- **JIRA 티켓:** [LPS-100124](https://issues.liferay.com/browse/LPS-100124)

#### 무엇이 바뀌었나요?

레거시 동작에 대한 임시 브리지로 사용되는 레거시 metal+soy `liferay.frontend.Slider` 구성 요소가 제거되었습니다.

#### 누가 영향을 받나요?

이는 `liferay.frontend.Slider`를 사용하는 모든 코드에 영향을 미칩니다. 이는 일반적으로 `{call liferay.frontend.Slider /}`와 같은 `soy`를 통해 수행됩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

`liferay.frontend.Slider` 구성 요소를 직접 대체할 수는 없습니다. 이에 의존하는 구성 요소가 있는 경우 이전 구현의 복사본을 같은 사이트
에 두고 이를 모듈 내에서 로컬로 사용할 수 있습니다.

#### 왜 이렇게 변경되었나요?

`liferay.frontend.Slider` 구성 요소는 7.2에서 더 이상 사용되지 않으며 더 이상 사용되지 않습니다.

---------------------------------------

### com.liferay.asset.taglib.servlet.taglib.soy.AssetTagsSelectorTag가 제거되었습니다.

- **날짜:** 2019년 10월 15일
- **JIRA 티켓:** [LPS-100144](https://issues.liferay.com/browse/LPS-100144)

#### 무엇이 바뀌었나요?

Java 클래스 `com.liferay.asset.taglib.servlet.taglib.soy.AssetTagsSelectorTag`가 제거되었습니다.

#### 누가 영향을 받나요?

이는 이 클래스를 직접 인스턴스화하거나 확장하는 모든 코드에 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

제거된 클래스를 직접 대체할 수는 없습니다. 이에 의존하는 코드가 있는 경우 이전 구현을 자신의 프로젝트에 복사하고 로컬 버전에 의존하도록 종속성을 변경해야 합니다.

#### 왜 이렇게 변경되었나요?

`asset:asset-tags-selector`와 해당 구성 요소가 React로 마이그레이션되어 이전 태그와 해당 인프라가 불필요해졌습니다.

---------------------------------------

### 제거된 포털 속성 user.groups.copy.layouts.to.user.personal.site

- **날짜:** 2019년 12월 26일
- **JIRA 티켓:** [LPS-106339](https://issues.liferay.com/browse/LPS-106339)

#### 무엇이 바뀌었나요?

포털 속성 `user.groups.copy.layouts.to.user.personal.site` 및 이와 관련된 동작이 제거되었습니다.

#### 누가 영향을 받나요?

이는 사용자 그룹 페이지를 사용자 개인 사이트에 복사하기 위해 `user.groups.copy.layouts.to.user.personal.site` 속성을 `true`로 설정한 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

이 속성을 직접 대체할 수 있는 방법은 없습니다. 동작에 의존하는 경우 `UserGroupLocalServiceImpl#copyUserGroupLayouts`의 이전 구현을 자신의 프로젝트에 복사할 수 있습니다.

#### 왜 이렇게 변경되었나요?

이 속성과 관련된 동작은 6.2부터 더 이상 사용되지 않습니다.

---------------------------------------

### EXT 플러그인 자동 배포에 대한 지원이 제거되었습니다.

- **날짜:** 2019년 12월 31일
- **JIRA 티켓:** [LPS-106008](https://issues.liferay.com/browse/LPS-106008)

#### 무엇이 바뀌었나요?

Auto Deployer(`liferay-home/deploy 폴더`를 통해)를 사용하여 EXT 플러그인 배포에 대한 지원이 제거되었습니다. 배포 폴더에 복사된 EXT 플러그인은 더 이상 인식되지 않습니다.

#### 누가 영향을 받나요?

이는 Auto Deployer를 통해 EXT 플러그인을 배포하는 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

제거된 기능을 직접 대체할 수는 없습니다. EXT 플러그인이 있는 경우 수동으로 배포하거나 [`ant direct-deploy`](https://github.com/liferay/liferay-plugins/blob/7.0.x/ext/build-common-ext.xml#L211) 사용해야 합니다.

#### 왜 이렇게 변경되었나요?

이 기능은 7.1부터 더 이상 사용되지 않습니다.

---------------------------------------

### 대체된 OSGi 구성 속성 자동 업그레이드

- **날짜:** 2020년 1월 3일
- **JIRA 티켓:** [LPS-102842](https://issues.liferay.com/browse/LPS-102842)

#### 무엇이 바뀌었나요?

`com.liferay.portal.upgrade.internal.configuration.ReleaseManagerConfiguration.config`에 정의된 OSGi 속성 `autoUpgrade`가 포털 속성 `upgrade.database.auto.run`으로 대체되었습니다.

모듈의 업그레이드 프로세스만 제어했던 이전 속성과 달리 새 속성은 코어 업그레이드 프로세스에도 영향을 미칩니다. 기본값은 `false`이므로 시작 또는 모듈 배포 시 업그레이드 프로세스가 실행되지 않습니다. Gogo Shell 콘솔을 통해 또는 서버가 다운되었을 때 데이터베이스 업그레이드 도구를 통해 언제든지 모듈 업그레이드 프로세스를 실행할 수 있습니다.

이 속성은 `portal-developer.properties`에서 `true`로 설정되어 있습니다.

#### 누가 영향을 받나요?

이 변경 사항은 서버 시작 또는 모듈 배포 시 자동으로 업그레이드를 실행하려는 모든 환경에 영향을 미칩니다. 프로덕션 환경에서는 `upgrade.database.auto.run`을 `true`로 설정하는 것이 권장되지 않습니다. 그러나 서버 시작 시 업그레이드해야 하는 경우 먼저 Liferay 데이터베이스와 파일 저장소(문서 라이브러리)를 백업하십시오.

`upgrade.database.auto.run`을 `false`(기본값)로 설정했지만 데이터베이스 업그레이드가 필요한 경우 Liferay는 필요한 업그레이드에 대한 정보를 인쇄하고 시작을 중단합니다. 데이터베이스 업그레이드는 일반적으로 주요/부 Liferay 릴리스에 필요하며 초기 CE Portal GA 릴리스 및 특정 서비스 팩(예외적인 경우)에 필요할 수 있습니다. 수정 팩에는 데이터베이스 업그레이드가 필요하지 않습니다. 시작 시 Liferay는 보류 중인 미세 변경 사항에 대한 정보를 인쇄합니다. 언제든지 Gogo Shell 콘솔과 릴리스 노트를 사용하여 이러한 변경 사항을 확인한 다음 실행 여부를 결정할 수 있습니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

이 변경 사항은 코드에 영향을 미치지 않습니다.

#### 왜 이렇게 변경되었나요?

이 변경은 코어와 모듈 간의 자동 업그레이드 기능을 통합하기 위해 이루어졌습니다. 프로덕션 환경에서 시작 시 새로운 업그레이드 프로세스가 실행되지 않도록 기본값도 변경되었습니다.

---------------------------------------

### SingleVMPoolUtil 및 MultiVMPoolUtil 클래스가 제거되었습니다.

- **날짜:** 2020년 1월 7일
- **JIRA 티켓:** [LPS-106315](https://issues.liferay.com/browse/LPS-106315)

#### 무엇이 바뀌었나요?

`SingleVMPoolUtil` 및 `MultiVMPoolUtil` 클래스가 제거되었습니다.

#### 누가 영향을 받나요?

이는 제거된 클래스를 사용하는 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

`SingleVMPoolUtil` 또는 `MultiVMPoolUtil` 대신 `PortalCacheHelperUtil`을 사용하세요. 예를 들어 [SQLQueryTableNamesUtil](https://github.com/liferay/liferay-portal/blob/7.3.x/portal-impl/src/com/liferay/portal/dao/orm/hibernate/SQLQueryTableNamesUtil.java#L113-L116) 참조하세요.

#### 왜 이렇게 변경되었나요?

`SingleVMPoolUtil` 및 `MultiVMPoolUtil` 클래스는 원래 [LPS-84138](https://issues.liferay.com/browse/LPS-84138) 에서 더 이상 사용되지 않습니다. 해당 클래스는 더 이상 사용되지 않습니다.

---------------------------------------

### 제거된 캐시 부트스트랩 기능

- **날짜:** 2020년 1월 8일
- **JIRA 티켓:** [LPS-96563](https://issues.liferay.com/browse/LPS-96563)

#### 무엇이 바뀌었나요?

캐시 부트스트랩 기능이 제거되었습니다. 이러한 속성은 더 이상 캐시 부트스트랩을 활성화/구성하는 데 사용할 수 없습니다.

- `ehcache.bootstrap.cache.loader.enabled`
- `ehcache.bootstrap.cache.loader.properties.default`
- `ehcache.bootstrap.cache.loader.properties.${specific.cache.name}`

#### 누가 영향을 받나요?

이는 위에 나열된 속성을 사용하는 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

제거된 기능을 직접 대체할 수는 없습니다. 이에 의존하는 코드가 있는 경우 직접 구현해야 합니다.

#### 왜 이렇게 변경되었나요?

보안 문제를 방지하기 위해 이러한 변경이 이루어졌습니다.

---------------------------------------

### liferay-frontend:cards-treeview 태그가 제거되었습니다.

- **날짜:** 2020년 1월 10일
- **JIRA 티켓:** [LPS-106899](https://issues.liferay.com/browse/LPS-106899)

#### 무엇이 바뀌었나요?

`liferay-frontend:cards-treeview` 태그가 제거되었습니다.

#### 누가 영향을 받나요?

이는 jsp의 태그나 SOY(Closure Templates)템플릿 내의 일부 구성 요소를 사용하는 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

제거된 기능을 직접 대체할 수는 없습니다. 이에 의존하는 코드가 있는 경우 직접 구현해야 합니다.

#### 왜 이렇게 변경되었나요?

태그가 주로 내부적으로 사용되었기 때문에 이러한 변경이 이루어졌습니다.

---------------------------------------

### liferay-frontend:contextual-sidebar 태그가 제거되었습니다.

- **날짜:** 2020년 1월 10일
- **JIRA 티켓:** [LPS-100146](https://issues.liferay.com/browse/LPS-100146)

#### 무엇이 바뀌었나요?

`liferay-frontend:contextual-sidebar` 태그가 제거되었습니다.

#### 누가 영향을 받나요?

이는 jsp의 태그나 SOY(Closure Templates)템플릿 내부의 일부 구성 요소를 사용하는 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

제거된 기능을 직접 대체할 수는 없습니다. 이에 의존하는 코드가 있는 경우 직접 구현해야 합니다.

#### 왜 이렇게 변경되었나요?

태그가 주로 내부적으로 사용되었기 때문에 이러한 변경이 이루어졌습니다.

---------------------------------------

### Portal Vulcan API에서 작업 추가 메서드가 제거되었습니다.

- **날짜:** 2020년 1월 22일
- **JIRA 티켓:** [LPS-98387](https://issues.liferay.com/browse/LPS-98387)

#### 무엇이 바뀌었나요?

`String, Class, GroupedModel, String, UriInfo` 및 `String, Class, Long, String, String, Long, UriInfo` 시그니처가 있는 `addAction` 메서드가 제거되었습니다.

#### 누가 영향을 받나요?

이는 제거된 `addAction` 메소드를 사용하는 모든 사람이나 `compileOnly 그룹: "com.liferay", 이름: "com.liferay.portal.vulcan.api", 버전: "[1.0.0, 2.0. 0)"`.

#### 내 코드를 어떻게 업데이트해야 합니까?

`String, Class, GroupedModel, String, Object, UriInfo` 또는 `String, Class, Long, String, String, Object, Long, UriInfo` 시그니처와 함께 `addAction` 메서드를 사용하세요.

#### 왜 이렇게 변경되었나요?

이러한 메서드는 정리 리팩터링의 일부로 제거되었습니다.

---------------------------------------

### 컨트롤 메뉴 및 제품 메뉴 사이트
 변경

- **날짜:** 2020년 2월 4일
- **JIRA 티켓:** [LPS-107487](https://issues.liferay.com/browse/LPS-107487)

#### 무엇이 바뀌었나요?

여러 가지 접근성 문제와 일반적인 시각적 결함을 해결하기 위해 컨트롤 및 제품 메뉴의 배치와 구조가 변경되었습니다.

이러한 변경 사항은 제어 및 제품 메뉴에 적용되었습니다.

- 제품 메뉴가 컨트롤 메뉴 밖으로 이동되었습니다.
- 제어 메뉴는 이제 `position:sticky`를 사용하여 동작을 제어합니다.
- 새로운 고정 동작을 설명하기 위해 컨트롤 메뉴 내부의 메뉴 스타일이 업데이트되었습니다.

#### 누가 영향을 받나요?

이는 사용자 정의된 `portlet.ftl` 템플릿이 포함된 사용자 정의 제어판 테마를 가진 개발자 또는 고정 막대로 작동하고 `*ControlMenuEntry` API를 사용하여 포함된 사용자 정의 메뉴를 개발한 개발자에게 영향을 미칠 수 있습니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

##### 제어판 테마

사용자 정의 제어판 테마를 사용하는 개발자는 `portlet.ftl`의 포틀릿 섹션 위에 있는 `@liferay.control_menu` 매크로에 대한 호출(있는 경우)을 이동해야 합니다.

**전에:**

```html
<section class="portlet" id="portlet_${htmlUtil.escapeAttribute(portletDisplay.getId())}">
	${portletDisplay.writeContent(writer)}
</section>

<#if portletDisplay.isStateMax()>
	<@liferay.control_menu />
</#if>
```

**후에:**

```html
<#if portletDisplay.isStateMax()>
	<@liferay.control_menu />
</#if>

<section class="portlet" id="portlet_${htmlUtil.escapeAttribute(portletDisplay.getId())}">
	${portletDisplay.writeContent(writer)}
</section>
```

##### 맞춤형 스티커 바

`ControlMenuEntry` API를 사용하여 포함된 사용자 정의 고정 막대가 있는 개발자는 컨트롤 메뉴에 새로 포함된 확장 포인트를 사용하여 구성 요소를 삽입할 수 있습니다.

메뉴를 삽입하는 코드를 `DynamicInclude` 구성 요소로 이동하고 적절한 사이트
에 등록합니다.

- 컨트롤 메뉴 전: `com.liferay.product.navigation.taglib#/page.jsp#pre`를 사용하세요.
- 컨트롤 메뉴 뒤: `com.liferay.product.navigation.taglib#/page.jsp#post`를 사용하세요.

#### 왜 이렇게 변경되었나요?

이러한 변경은 접근성을 향상시키고 상단 메뉴 사이트
 지정 및 제어에 필요한 로직을 단순화하기 위해 이루어졌습니다. 이는 일반적인 시각적 결함을 방지하는 보다 정확하고 예상되는 마크업을 제공합니다.

---------------------------------------

### jQuery는 더 이상 기본적으로 포함되지 않습니다.

- **날짜:** 2020년 2월 4일
- **JIRA 티켓:** [LPS-95726](https://issues.liferay.com/browse/LPS-95726)

#### 무엇이 바뀌었나요?

이전에는 `jQuery`가 기본적으로 모든 페이지에 포함되었으며 전역 `window.$` 및 범위가 지정된 `AUI.$` 변수를 통해 사용할 수 있었습니다. 이 변경 후에는 `jQuery`가 더 이상 기본적으로 포함되지 않으며 해당 변수는 `정의되지 않음`입니다.

#### 누가 영향을 받나요?

이는 사용자 정의 스크립트에서 `AUI.$` 또는 `window.$`를 사용한 모든 개발자에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

타사 라이브러리를 추가하여 코드에서 사용할 고유한 JQuery 버전을 제공하는 전략을 사용하세요.

또한 임시 조치로 **시스템 설정** &rarr; **제3자** &rarr; **jQuery** 에서 `jQuery 활성화` 속성을 `true`로 설정하여 이전 동작을 되돌릴 수 있습니다.

#### 왜 이렇게 변경되었나요?

이러한 변경은 대부분 사용되지 않고 중복되는 모든 페이지에 추가 라이브러리 코드를 묶어서 제공하는 것을 피하기 위해 이루어졌습니다.

---------------------------------------

### 서버 측 병렬 렌더링은 더 이상 지원되지 않습니다.

- **날짜:** 2020년 3월 16일
- **JIRA 티켓:** [LPS-110359](https://issues.liferay.com/browse/LPS-110359)

#### 무엇이 바뀌었나요?

`layout.parallel.render` 접두사가 있는 속성이 제거되었습니다. 이는 AJAX 렌더링이 활성화된 경우에만 병렬 렌더링이 지원된다는 의미입니다.

#### 누가 영향을 받나요?

이는 제거된 속성을 사용하는 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

속성 파일에서 `layout.parallel.render` 접두사가 붙은 속성을 모두 제거하세요.

#### 왜 이렇게 변경되었나요?

이 기능은 더 이상 사용되지 않습니다.

---------------------------------------

### ContentField 값 속성 이름이 contentFieldValue로 변경되었습니다.

- **날짜:** 2020년 3월 18일
- **JIRA 티켓:** [LPS-106886](https://issues.liferay.com/browse/LPS-106886)

#### 무엇이 바뀌었나요?

Headless Delivery API에서 ContentField 스키마 내부의 속성 이름 `value`가 `contentFieldValue`로 변경되었습니다.

#### 누가 영향을 받나요?

이는 ContentField `value` 속성 이름에 따라 REST 클라이언트에 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

REST 클라이언트에서 속성 이름을 `contentFieldValue`로 변경합니다.

#### 왜 이렇게 변경되었나요?

이 변경으로 Headless API의 `{schemaName}+Value`라는 모든 값 속성 이름과의 일관성이 복원되었습니다.

---------------------------------------

### liferay-editor-image-uploader 플러그인 제거됨

- **날짜:** 2020년 3월 27일
- **JIRA 티켓:** [LPS-110734](https://issues.liferay.com/browse/LPS-110734)

### 무엇이 바뀌었나요?

`liferay-editor-image-uploader` AUI 플러그인이 제거되었습니다. 해당 코드는 Alloy Editor 및 CKEditor에서 사용되는 `addimages` CKEditor 플러그인에 병합되었습니다.

### 영향을 받는 사람

이는 플러그인을 직접 사용하는 사용자 정의 솔루션에 영향을 미칩니다.

### 내 코드를 어떻게 업데이트해야 합니까?

`liferay-editor-image-uploader` 플러그인을 직접 대체할 수는 없습니다. 이에 의존하는 구성 요소가 있는 경우 이전 구현의 복사본을 같은 사이트
에 두고 이를 모듈 내에서 로컬로 사용할 수 있습니다.

#### 왜 이렇게 변경되었나요?

이 변경으로 인해 CKEditor에서 이미지 드래그 앤 드롭 처리가 가능해지며 Alloy Editor와 CKEditor 모두에 공통 이미지 업로더가 제공됩니다.

---------------------------------------

### TinyMCE 편집기는 더 이상 기본적으로 번들로 제공되지 않습니다.

- **날짜:** 2020년 3월 27일
- **JIRA 티켓:** [LPS-110733](https://issues.liferay.com/browse/LPS-110733)

### 무엇이 바뀌었나요?

7.3부터 CKEditor가 기본이며 WYSIWYG 편집기만 지원됩니다.

### 영향을 받는 사람

이는 TinyMCE를 사용하는 모든 사람에게 영향을 미칩니다.

### 내 코드를 어떻게 업데이트해야 합니까?

TinyMCE를 사용하도록 Liferay Portal을 구성한 경우 이러한 구성을 제거할 수 있습니다. TinyMCE를 계속 사용하려면 다음 단계를 수행해야 합니다.

- 구성을 유지하세요.
- 브라우저에서 https://repository.liferay.com/nexus/index.html을 엽니다.
- `com.liferay.frontend.editor.tinymce.web`을 검색하세요.
- `com.liferay.frontend.editor.tinymce.web` 모듈용 .jar 파일을 다운로드합니다.
- liferay-portal 설치에서 다운로드한 .jar 파일을 배포합니다.

#### 왜 이렇게 변경되었나요?

이러한 변경은 단일 편집기를 중심으로 서식 있는 텍스트 콘텐츠를 작성하기 위한 모든 UX를 통합하여 보다 응집력 있고 포괄적인 경험을 제공하기 위해 이루어졌습니다.

---------------------------------------

### Simple Editor는 더 이상 기본적으로 번들로 제공되지 않습니다.

- **날짜:** 2020년 3월 27일
- **JIRA 티켓:** [LPS-110734](https://issues.liferay.com/browse/LPS-110734)

### 무엇이 바뀌었나요?

7.3부터 CKEditor가 기본이며 WYSIWYG 편집기만 지원됩니다.

### 영향을 받는 사람

이는 Liferay Frontend Editor Simple Web 모듈을 사용하는 모든 사람에게 영향을 미칩니다.

### 내 코드를 어떻게 업데이트해야 합니까?

Simple Editor를 사용하도록 Liferay Portal을 구성한 경우 이러한 구성을 제거할 수 있습니다. 여전히 단순 편집기를 사용하려면 다음 단계를 수행해야 합니다.

- 구성을 유지하세요.
- 브라우저에서 https://repository.liferay.com/nexus/index.html을 엽니다.
- `com.liferay.frontend.editor.simple.web`을 검색하세요.
- `com.liferay.frontend.editor.simple.web` 모듈용 .jar 파일을 다운로드합니다.
- liferay-portal 설치에서 다운로드한 .jar 파일을 배포합니다.

#### 왜 이렇게 변경되었나요?

이러한 변경은 단일 편집기를 중심으로 서식 있는 텍스트 콘텐츠를 작성하기 위한 모든 UX를 통합하여 보다 응집력 있고 포괄적인 경험을 제공하기 위해 이루어졌습니다.

---------------------------------------

### Asset.vocabulary.default는 이제 언어 키를 보유합니다.

- **날짜:** 2020년 4월 28일
- **JIRA 티켓:** [LPS-112334](https://issues.liferay.com/browse/LPS-112334)

### 무엇이 바뀌었나요?

`asset.vocabulary.default`는 이제 언어 키이며 더 이상 `Topic`이라는 고정 값을 갖지 않습니다.

### 영향을 받는 사람

이는 속성을 덮어쓰는 모든 사람에게 영향을 미칩니다.

### 내 코드를 어떻게 업데이트해야 합니까?

속성을 덮어쓰지 않으면 코드를 변경할 필요가 없습니다. 속성을 덮어썼는데 지정된 키를 찾을 수 없으면 제공된 텍스트가 기본 어휘의 이름으로 사용됩니다.

#### 왜 이렇게 변경되었나요?

사용자가 모든 언어의 기본 어휘 이름을 변경할 필요가 없도록 변경되었습니다.

---------------------------------------

### Liferay.Poller는 더 이상 기본적으로 초기화되지 않습니다.

- **날짜:** 2020년 5월 19일
- **JIRA 티켓:** [LPS-112942](https://issues.liferay.com/browse/LPS-112942)

#### 무엇이 바뀌었나요?

전역 AUI `Liferay.Poller` 유틸리티는 이제 더 이상 사용되지 않으며 기본적으로 더 이상 초기화되지 않습니다.

#### 누가 영향을 받나요?

이는 `Liferay.Poller`를 사용하는 모든 코드에 영향을 미칩니다. 이는 일반적으로 JSP에서 `Liferay.Poller.init()` 호출을 통해 수행됩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

`Liferay.Poller` 유틸리티를 직접 대체할 수는 없습니다. `Liferay.Poller`를 초기화해야 하는 경우 아래 코드를 사용하도록 JSP를 업데이트하세요.

```html
<%@ page import="com.liferay.petra.encryptor.Encryptor" %>

<%-- For access to `company` and `themeDisplay`. --%>
<liferay-theme:defineObjects>

<aui:script use="liferay-poller">
	<c:if test="<%= themeDisplay.isSignedIn()%>">
		Liferay.Poller.init({
			encryptedUserId:
				`<%= Encryptor.encrypt(company.getKeyObj(), String.valueOf(themeDisplay.getUserId()))%>`,
		});
	</c:if>
</aui:script>
```

#### 왜 이렇게 변경되었나요?

`Liferay.Poller` 구성요소는 보관된 Chat 애플리케이션에서만 사용되었습니다. 기본적으로 초기화를 건너뛰면 일반적인 경우에 대한 페이지 로드가 간소화됩니다.

---------------------------------------

### ContentTransformerListener는 기본적으로 비활성화되어 있습니다.

- **날짜:** 2020년 5월 25일
- **JIRA 티켓:** [LPS-114239](https://issues.liferay.com/browse/LPS-114239)

#### 무엇이 바뀌었나요?

이제 `ContentTransformerListener`는 기본적으로 비활성화됩니다.

#### 누가 영향을 받나요?

이는 다른 웹 콘텐츠 내에 웹 콘텐츠 삽입, 레거시 편집 인프라, 토큰 교체(`@article_group_id@`, `@articleId;elementName@` 등 `ContentTransformerListener`에서 제공하는 레거시 웹 콘텐츠 기능을 사용하는 Liferay Portal 설치에 영향을 미칩니다. ), 등.

#### 내 코드를 어떻게 업데이트해야 합니까?

코드를 업데이트할 필요가 없습니다. 그래도 `ContentTransformerListener`를 사용하려면 시스템 설정에서 **Content & Data** &rarr; **Web Content** &rarr; **Virtual Instance Scope** &rarr; **Web Content** 아래의 **Enable ContentTransformerListener** 속성을 통해 이를 활성화할 수 있습니다.

#### 왜 이렇게 변경되었나요?

기사 요소에 대한 비용이 많이 드는 문자열 처리(기사 필드에서 `HtmlUtil.stripComments` 및 `HtmlUtil.stripHtml` 호출)로 인해 성능 개선을 위해 `ContentTransformerListener`가 비활성화되었습니다.

---------------------------------------

### Liferay.BrowserSelectors.run이 더 이상 호출되지 않습니다.

- **날짜:** 2020년 5월 26일
- **JIRA 티켓:** [LPS-112983](https://issues.liferay.com/browse/LPS-112983)

#### 무엇이 바뀌었나요?

`Liferay.BrowserSelectors.run()` 함수는 더 이상 페이지에서 호출되지 않으며 결과적으로 여는 `<html>` 태그에서 일부 CSS 클래스가 제거됩니다. 이들 중 다수는 이제 `<body>` 요소에 대신 추가됩니다.

#### 누가 영향을 받나요?

이는 `<html>` 요소에서 이러한 CSS 클래스를 사용하는 모든 코드에 영향을 미칩니다.

- `aol`
- `camino`
- `edgeHTML` or `edge`
- `firefox`
- `flock`
- `gecko`
- `icab`
- `ie`, `ie6`, `ie7`, `ie9`, or `ie11`
- `js`
- `konqueror`
- `mac`
- `mozilla`
- `netscape`
- `opera`
- `presto`
- `safari`
- `secure`
- `touch`
- `trident`
- `webkit`
- `win`

#### 내 코드를 어떻게 업데이트해야 합니까?

`Liferay.BrowserSelectors.run()` 함수를 직접 대체할 수는 없지만 대신 CSS와 JavaScript를 조정하여 `<body>` 요소의 새 클래스를 대상으로 할 수 있습니다. 이러한 클래스는 현재 사용 중인 브라우저를 반영하기 위해 `<body>` 요소에 추가됩니다.

- `chrome`
- `edge`
- `firefox`
- `ie`
- `mobile`
- `other`

또는 `Liferay.BrowserSelectors.run()`을 호출하여 아래 코드를 사용하여 이전 클래스를 `<html>` 요소에 적용할 수 있습니다.

```
<aui:script use="liferay-browser-selectors">
	Liferay.BrowserSelectors.run();
</aui:script>
```

#### 왜 이렇게 변경되었나요?

일부 오래된 브라우저를 참조하는 클래스는 Alloy UI에 의존하는 레거시 JavaScript를 통해 상위 `<html>` 요소에 추가되었습니다. 오래된 브라우저 참조를 제거하는 이 변경은 이제 서버 측에서 수행되어 페이지 로딩 시간이 향상됩니다.

---------------------------------------

### 캐시 차단 지원 제거

- **날짜:** 2020년 6월 17일
- **JIRA 티켓:** [LPS-115687](https://issues.liferay.com/browse/LPS-115687)

#### 무엇이 바뀌었나요?

차단 캐시 지원이 제거되었습니다. 이러한 속성은 더 이상 캐시 차단을 활성화하는 데 사용할 수 없습니다.

- `ehcache.blocking.cache.allowed`
- `permissions.object.blocking.cache`
- `value.object.entity.blocking.cache`

#### 누가 영향을 받나요?

이는 위에 나열된 속성을 사용하는 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

제거된 기능을 직접 대체할 수는 없습니다. 이에 의존하는 코드가 있는 경우 직접 구현해야 합니다.

#### 왜 이렇게 변경되었나요?

캐시 차단은 활성화하면 안 되기 때문에 성능을 향상하기 위해 이렇게 변경했습니다.

---------------------------------------

### 각 엔터티 모델에 대한 캐시 속성 설정에 대한 지원 제거

- **날짜:** 2020년 6월 24일
- **JIRA 티켓:** [LPS-116049](https://issues.liferay.com/browse/LPS-116049)

#### 무엇이 바뀌었나요?

엔터티에 대한 다음 캐시 속성 설정에 대한 지원이 제거되었습니다.

- `value.object.entity.cache.enabled*`
- `value.object.finder.cache.enabled*`
- `value.object.column.bitmask.enabled*`

예를 들어 다음 속성은 `com.liferay.portal.kernel.model.User` 엔터티에 대한 것입니다.

- `value.object.entity.cache.enabled.com.liferay.portal.kernel.model.User`
- `value.object.finder.cache.enabled.com.liferay.portal.kernel.model.User`
- `value.object.column.bitmask.enabled.com.liferay.portal.kernel.model.User`

#### 누가 영향을 받나요?

이는 엔터티에 대해 위에 나열된 속성을 사용하는 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

제거된 기능을 직접 대체할 수는 없습니다. 엔터티에서 이러한 속성을 제거해야 합니다.

#### 왜 이렇게 변경되었나요?

이러한 속성은 엔터티에 유용하지 않기 때문에 이렇게 변경되었습니다.

---------------------------------------

### 포털 속성 이름이 "module.framework.properties.felix.fileinstall.\*" 에서 "module.framework.properties.file.install.\*" 로 변경되었습니다.

- **날짜:** 2020년 7월 13일
- **JIRA 티켓:** [LPS-115016](https://issues.liferay.com/browse/LPS-115016)

#### 무엇이 바뀌었나요?

"module.framework.properties.felix.fileinstall"로 시작하는 포털 속성의 이름이 "module.framework.properties.file.install"로 시작하도록 변경되었습니다.

#### 누가 영향을 받나요?

이는 `module.framework.properties.felix.fileinstall.*` 포털 속성 설정을 재정의한 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

`module.framework.properties.felix.fileinstall.*`로 시작하는 속성의 이름을 `module.framework.properties.file.install.*`로 시작하도록 바꿉니다.

#### 왜 이렇게 변경되었나요?

이 변경은 Apache Felix 파일 설치의 인라인을 반영하기 위해 이루어졌습니다. Liferay는 현재 이 기능을 관리하고 유지하고 있습니다.

---------------------------------------

### Elasticsearch의 동적 데이터 매핑 필드가 중첩 문서로 변경되었습니다.

- **날짜:** 2020년 7월 27일
- **JIRA 티켓:** [LPS-103224](https://issues.liferay.com/browse/LPS-103224)

#### 무엇이 바뀌었나요?

`ddm__keyword__` 및 `ddm__text__`로 시작하는 Elasticsearch의 동적 데이터 매핑 필드가 새로운 중첩 문서 `ddmFieldArray`로 이동되었습니다.

`ddmFieldArray`에는 다음 필드가 포함된 여러 항목이 있습니다.

- `ddmFieldName`: 동적 데이터 매핑 구조 필드 이름을 포함합니다. 이 이름은 `DDMIndexer.encodeName` 메소드를 사용하여 생성됩니다.
- `ddmFieldValue*`: 색인화된 데이터를 포함합니다. 이 필드의 이름은 `DDMIndexer.getValueFieldName`을 사용하여 생성되며 필드의 데이터 유형 및 언어에 따라 달라집니다.
- `ddmValueFieldName`: 색인화된 데이터가 저장되는 색인 필드 이름을 포함합니다.

Solr 검색 엔진을 사용하는 경우에는 이 변경 사항이 적용되지 않습니다.

#### 누가 영향을 받나요?

이는 `ddm__keyword__*` 및 `ddm__text__*` 필드를 사용하여 Elasticsearch 인덱스에서 쿼리를 실행하는 사용자 지정 개발을 사용하는 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

Elasticsearch 쿼리에 새로운 중첩 문서 `ddmFieldArray`를 사용해야 합니다.

Liferay 코드에는 몇 가지 예가 있습니다. 예를 들어 [DDMIndexerImpl](https://github.com/liferay/liferay-portal/blob/7.3.x/modules/apps/dynamic-data-mapping/dynamic-data-mapping-service/src/main/java/com/liferay/dynamic/data/mapping/internal/util/DDMIndexerImpl.java) 및 [AssetHelperImpl](https://github.com/liferay/liferay-portal/blob/master/modules/apps/asset/asset-service/src/main/java/com/liferay/asset/internal/util/AssetHelperImpl.java) `DDM_FIELD_ARRAY` 상수를 사용합니다.

시스템 설정에서 레거시 동작을 복원하고 `ddm__keyword__*` 및 `ddm__text__*` 필드를 계속 사용할 수도 있습니다.

1. **시스템 설정** &rarr; **동적 데이터 매핑** &rarr; **동적 데이터 매핑 인덱서** 로 이동합니다.
1. **레거시 동적 데이터 매핑 색인 필드 활성화** 를 선택합니다.
1. 전체 재색인을 실행합니다.

#### 왜 이렇게 변경되었나요?

이 변경은 동적 데이터 매핑 구조가 너무 많은 경우 발생하는 **전체 필드 제한이 초과되었습니다** Elasticsearch 오류를 방지하기 위해 이루어졌습니다.

---------------------------------------

### 어휘집 아이콘 경로 이동

- **날짜:** 2020년 8월 17일
- **JIRA 티켓:** [LPS-115812](https://issues.liferay.com/browse/LPS-115812)

### 무엇이 바뀌었나요?

Lexicon 아이콘의 경로가 `themeDisplay.getPathThemeImages()+ "/lexicon/icons.svg`에서 `themeDisplay.getPathThemeImages()+ "/clay/icons.svg`로 변경되었습니다.

### 영향을 받는 사람

이는 Lexicon 아이콘 경로를 직접 사용하는 사용자 정의 솔루션에 영향을 미칩니다. `어휘` 경로에 아이콘을 작성하기 위한 Gradle 작업이 제거됩니다.

### 내 코드를 어떻게 업데이트해야 합니까?

`lexicon` 대신 `clay`를 참조하도록 경로를 업데이트하세요.

#### 왜 이렇게 변경되었나요?

아이콘 스프라이트 맵에 대한 참조를 통합하기 위해 이러한 변경이 이루어졌습니다.

---------------------------------------

### DDM 지속성 클래스에서 classNameId 관련 메소드를 제거했습니다.

- **날짜:** 2020년 8월 18일
- **JIRA 티켓:** [LPS-108525](https://issues.liferay.com/browse/LPS-108525)

### 무엇이 바뀌었나요?

`countByClassNameId`, `findByClassNameId` 및 `removeByClassNameId` 메서드가 다음 클래스에서 제거되었습니다.

- `com.liferay.dynamic.data.mapping.service.persistence.DDMStructureLinkPersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMStructureLinkUtil`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMStructurePersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMStructureUtil`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMTemplateLinkPersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMTemplateLinkUtil`

### 영향을 받는 사람

이는 이러한 방법을 사용하는 모든 사람에게 영향을 미칩니다.

### 내 코드를 어떻게 업데이트해야 합니까?

다른 파인더 및 카운터 방법을 사용할 수 있습니다.

#### 왜 이렇게 변경되었나요?

이러한 방법은 [LPS-108525](https://issues.liferay.com/browse/LPS-108525) 솔루션의 일부로 제거되었습니다.

---------------------------------------

### com.liferay.dynamic.data.mapping.util.BaseDDMDisplay 메서드가 제거되었습니다.

- **날짜:** 2020년 8월 18일
- **JIRA 티켓:** [LPS-103549](https://issues.liferay.com/browse/LPS-103549)

### 무엇이 바뀌었나요?

`isShowAddStructureButton` 메소드가 제거되었습니다.

### 영향을 받는 사람

이는 이 방법을 사용하는 모든 사람에게 영향을 미칩니다.

### 내 코드를 어떻게 업데이트해야 합니까?

이 메소드 대신 `isShowAddButton(GroupscopeGroup)` 메소드를 사용할 수 있습니다.

#### 왜 이렇게 변경되었나요?

이 메서드는 정리 리팩터링의 일부로 제거되었습니다.

---------------------------------------

### 대체된 포털 속성: view\.count.enabled 및 buffered.increment.enabled

- **날짜:** 2020년 10월 1일
- **JIRA 티켓:** [LPS-120626](https://issues.liferay.com/browse/LPS-120626) 및 [LPS-121145](https://issues.liferay.com/browse/LPS-121145)

#### 무엇이 바뀌었나요?

전역적으로, 구체적으로 엔터티에 대한 보기 수를 활성화 및 비활성화하는 기능이 포털 속성에서 제거되었으며 이제 시스템 설정으로 구성되었습니다. 조회수는 UI의 **시스템 설정** &rarr; **인프라** &rarr; **조회수** 에서 구성하거나 `com.liferay.view.count.configuration.ViewCountConfiguration.config`라는 구성 파일을 사용하여 구성할 수 있습니다.

포털 속성 변경 사항은 다음과 같습니다.

`buffered.increment.enabled` 포털 속성이 제거되었습니다. 이제 조회수 페이지의 `enabled` 속성을 사용하여 조회수를 전역적으로 활성화 및 비활성화할 수 있습니다.

예를 들어 7.3에서 `view.count.enabled[SomeEntity]=false`를 설정하거나 7.2에서 `buffered.increment.enabled[SomeEntity]=false`를 설정하여 특정 엔터티에 대한 보기 수 동작을 비활성화하는 작업이 더 이상 포털 속성에서 수행되지 않습니다. , 그러나 이제 조회 수 페이지의 `비활성화된 클래스 이름` 값 목록에 엔터티 클래스 이름을 추가하면 됩니다.

#### 누가 영향을 받나요?

이는 포털 속성 설정이 `view.count.enabled=false` 또는 `buffered.increment.enabled=false`인 모든 사람에게 영향을 미칩니다.

이는 초기 7.3 버전에서 포털 속성 설정 `view.count.enabled[SomeEntity]=false` 또는 `buffered.increment.enabled[SomeEntity]=false를 사용하여 일부 엔터티(예: `SomeEntity`)에 대한 보기 횟수를 비활성화한 모든 사람에게 영향을 미칩니다. ` 7.2 포털에서.

#### 내 코드를 어떻게 업데이트해야 합니까?

`view.count.enabled` 또는 `buffered.increment.enabled` 포털 속성과 `view.count.enabled[SomeEntity]=false` 또는 `buffered.increment.enabled[SomeEntity]=false`와 같은 엔터티별 속성을 제거합니다.

시스템 설정에서 또는 구성 파일을 사용하여 조회수 동작을 구성합니다.

**시스템 설정** &rarr; **인프라** &rarr; **보기 수** 에서 `enabled`를 `false`로 설정하여 보기 횟수를 전역적으로 비활성화하거나 `enabled`를 `true`로 설정하여 전역적으로 보기 횟수를 활성화하고 특정 엔터티에 대한 보기 횟수를 비활성화합니다. `Disabled Class Name` 값 목록에 엔터티 클래스 이름을 추가합니다.

구성 파일을 사용하려면 시스템 설정에서 보기 수를 구성하고 설정을 저장한 후 `com.liferay.view.count.configuration.ViewCountConfiguration.config` 파일로 내보냅니다. 그런 다음 `[Liferay Home]/osgi/configs` 폴더에 파일을 배치하여 구성을 배포합니다.

#### 왜 이렇게 변경되었나요?

이러한 변경은 조회수 동작 관리를 용이하게 하기 위해 이루어졌습니다.

---------------------------------------

### 포털 속성 "module.framework.properties.file.install.ionalImportRefreshScope"가 제거되었습니다.

- **날짜:** 2020년 10월 11일
- **JIRA 티켓:** [LPS-122008](https://issues.liferay.com/browse/LPS-122008)

#### 무엇이 바뀌었나요?

포털 속성 `module.framework.properties.file.install.ionalImportRefreshScope`가 제거되었습니다. 파일 설치는 이제 새로 고쳐야 하는 선택적 패키지가 포함된 번들을 검색할 때 관리되는 번들만 확인합니다.

#### 누가 영향을 받나요?

이는 포털 속성 설정 `module.framework.properties.file.install.ionalImportRefreshScope`가 있는 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

`module.framework.properties.file.install.ionalImportRefreshScope` 속성을 제거합니다. 다른 동작을 사용하도록 파일 설치를 구성할 수 없습니다.

#### 왜 이렇게 변경되었나요?

대체 동작이 바람직한 경우는 거의 없습니다. 파일 설치는 번들이 Liferay에 설치되는 기본 방법이므로 이제 번들 관리 기본값입니다. 이전 기능과 해당 분기 논리를 제거하면 코드 유지 관리성과 가독성이 향상됩니다.

---------------------------------------
