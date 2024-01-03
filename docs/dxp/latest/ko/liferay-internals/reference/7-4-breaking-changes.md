# 7.4 주요 변경 사항

주요 변경 사항은 기존 기능이나 코드 구조를 손상시키거나 크게 변경합니다. 다음은 첫 번째 분기별 릴리스(2023년 3분기)부터 시작하는 Liferay 7.4의 모든 주요 변경 사항입니다. 제품이 변경되고 개선됨에 따라 이러한 중단을 최소화하기 위해 최선을 다하지만 때로는 피할 수 없는 경우도 있습니다.

[Liferay 소스 코드](https://github.com/liferay/liferay-portal/blob/master/readme/BREAKING_CHANGES.markdown) 에서 2023년 3분기 이전의 7.4 주요 변경 사항을 읽어보세요.

## 2023년 4분기 출시

### Liferay DXP의 변경 사항

다음은 Liferay 내의 기존 기능을 손상시키거나 크게 변경하는 변경 사항 목록입니다.

| **획기적인 변화**                      | **설명**                                                                                                                                       | **참고자료**                                                                                                                    |
| :------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------- |
| **호환 가능한 최소 Elasticsearch 버전**   | Elasticsearch는 최소 **7.17** 버전으로 업데이트되어야 합니다. Liferay DXP는 더 이상 이전 버전으로 시작되지 않습니다(콘솔 오류가 표시됨).                             | [호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/360016511651#Liferay-DXP-Quarterly-Releases-Elasticsearch) |
| **AB 테스트**                       | AB 테스트는 **하나의 변형**(대조군 외에)만 지원합니다. 이렇게 하면 테스트를 완료하는 데 기하급수적으로 오랜 시간이 걸리는 것을 방지할 수 있습니다.                                   | [LRAC-14353](https://liferay.atlassian.net/browse/LRAC-14353)                                                    |
| **페이지 템플릿의 기본 메뉴 표시 구성**         | 기본적으로 페이지 템플릿에서 상속된 메뉴 표시 위젯에는 개인 페이지가 활성화된 경우에도 _페이지 계층 구조_ 구성이 있습니다. 사이트에 페이지가 없는 경우에는 적용되지 않습니다.                                          | [LPS-194075](https://liferay.atlassian.net/browse/LPS-194075)                                                    |
| **DM 파일 다운로드에 대한 캐시 옵션 없음**      | 기본적으로 게스트 사용자에 대한 권한이 없는 DM 파일 다운로드에는 새로운 _캐시 없음_ 옵션이 사용됩니다.                                                                                 | [LPS-174415](https://liferay.atlassian.net/browse/LPS-174415)                                                    |
| **WebSphere를 사용한 Liferay 배포 지원** | IBM WebSphere 애플리케이션 서버를 사용한 Liferay 배포는 더 이상 사용되지 않습니다. 이 기능에 대한 지원은 _1년 후(2024년 4분기 릴리스 포함) 종료됩니다. | 추후 공지                                                                                                                       |
| **지원되는 Java 버전**                 | JDK 8은 더 이상 사용되지 않으며 이에 대한 지원은 _1년 후(2024년 4분기 릴리스 포함)_ 종료됩니다. Liferay DXP 7.4는 JDK 11을 사용해야 합니다.                         | 추후 공지                                                                                                                       |

### 모듈 소스 코드의 변경 사항

**ExtRepository.java** [`modules/apps/document-library/document-library-repository-external-api/src/main/java/com/liferay/document/library/repository/external/ExtRepository.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-repository-external-api/src/main/java/com/liferay/document/library/repository/external/ExtRepository.java) 

-   **날짜**: 2023년 9월 29일
-   **티켓**: [LPS-197315](https://liferay.atlassian.net/browse/LPS-197315) 
-   **변경 사항**: 새로운 `String` 매개변수(`fileName`)가 `addExtRepositoryFileEntry(String, String, String, String, String, InputStream)` 메소드에 추가되었습니다. 따라서 이제 6개의 `String` 매개변수와 'InputStream').
-   **이유**: Sharepoint 외부 저장소를 사용하여 파일을 생성하려면 파일 이름이 필요합니다.

**liferay-chart.tld**
`모듈/앱/frontend-taglib/frontend-taglib-chart/src/main/resources/META-INF/liferay-chart.tld`

-   **날짜**: 2023년 10월 6일
-   **티켓**: [LPS-198114](https://liferay.atlassian.net/browse/LPS-198114) 
-   **변경 사항**: Liferay 차트 모듈의 taglib가 제거되었습니다.
-   **이유**: 이러한 taglib는 더 이상 Liferay에서 사용되지 않으며 Liferay는 soy에 대한 지원을 제거했습니다.

**CommerceShipmentItemLocalService.java** [`모듈/앱/상거래/상거래-api/src/main/java/com/liferay/commerce/service/CommerceShipmentItemLocalService.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/service/CommerceShipmentItemLocalService.java) 

-   **날짜**: 2023년 10월 6일
-   **티켓**: [COMMERCE-12534](https://liferay.atlassian.net/browse/COMMERCE-12534) 
-   **변경된 사항**: `getCommerceShipmentOrderItemsQuantity` 메소드는 `int` 값 대신 `BigDecimal`을 반환합니다.
-   **이유**: 새로운 측정 단위 기능에는 'BigDecimal' 값이 필요합니다.

**CommerceShipmentItemService.java** [모듈/앱/상거래/Commerce-api/src/main/java/com/liferay/commerce/service/CommerceShipmentItemService.java](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/service/CommerceShipmentItemService.java) 

-   **날짜**: 2023년 10월 6일
-   **티켓**: [COMMERCE-12534](https://liferay.atlassian.net/browse/COMMERCE-12534) 
-   **변경된 사항**: `getCommerceShipmentOrderItemsQuantity` 메소드는 `int` 값 대신 `BigDecimal`을 반환합니다.
-   **이유**: 새로운 측정 단위 기능에는 'BigDecimal' 값이 필요합니다.

**BaseClayTag.java**
`모듈/앱/frontend-taglib/frontend-taglib-clay/src/main/java/com/liferay/frontend/taglib/clay/servlet/taglib/base/BaseClayTag.java`

-   **날짜**: 2023년 10월 10일
-   **티켓**: [LPS-198462](https://liferay.atlassian.net/browse/LPS-198462) 
-   **변경사항** `BaseClayTag` 클래스가 제거되었습니다.
-   **이유**: 클래스가 더 이상 사용되지 않습니다.

**ModelSearchRegistrarHelper.java**
`모듈/앱/portal-search/portal-search-spi/src/main/java/com/liferay/portal/search/spi/model/registrar/ModelSearchRegistrarHelper.java`

-   **날짜**: 2023년 10월 11일
-   **티켓**: [LPS-198809](https://liferay.atlassian.net/browse/LPS-198809) 
-   **변경사항**: 'ModelSearchRegistrarHelper' 클래스가 제거되었습니다.
-   **이유**: 검색 등록자 부트스트래핑 스타일이 변경되었으며 이 클래스는 더 이상 사용되지 않습니다.

**ModelSearchDefinitionContributor.java**
`모듈/앱/portal-search/portal-search-spi/src/main/java/com/liferay/portal/search/spi/model/registrar/contributor/ModelSearchDefinitionContributor.java`

-   **날짜**: 2023년 10월 11일
-   **티켓**: [LPS-198809](https://liferay.atlassian.net/browse/LPS-198809) 
-   **변경사항**: `ModelSearchDefinitionContributor` 클래스가 제거되었습니다.
-   **이유**: 검색 등록자 부트스트래핑 스타일이 변경되었으며 이 클래스는 더 이상 사용되지 않습니다.

**AccountRoleLocalService.java** [`modules/apps/account/account-api/src/main/java/com/liferay/account/service/AccountRoleLocalService.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/account/account-api/src/main/java/com/liferay/account/service/AccountRoleLocalService.java) 

-   **날짜**: 2023년 10월 17일
-   **티켓**: [LPS-173628](https://liferay.atlassian.net/browse/LPS-173628) 
-   **변경사항**: 'checkCompanyAccountRoles' 메서드가 제거되었습니다.
-   **이유**: `AddDefaultAccountRolesPortalInstanceLifecycleListener` 및 `AddDefaultAccountRolesPortletPermissionsPortalInstanceLifecycleListener` 클래스는 대신 기본 계정 역할을 초기화하고 확인합니다.

**CommerceCheckoutStepHttpHelper.java** [`모듈/앱/상거래/상거래-api/src/main/java/com/liferay/commerce/checkout/helper/CommerceCheckoutStepHttpHelper.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/checkout/helper/CommerceCheckoutStepHttpHelper.java) 

-   **날짜**: 2023년 10월 25일
-   **티켓**: [COMMERCE-12230](https://liferay.atlassian.net/browse/COMMERCE-12230) 
-   **변경 사항**: 이제 'isActiveShippingMethodCommerceCheckoutStep' 메서드가 추가 'CommerceOrder' 값을 사용합니다.
-   **이유**: 결제 성능을 돕기 위해 'CommerceOrder' 값이 매개변수로 전달됩니다.

**PaymentProcessCheckoutStepDisplayContext.java** [`modules/apps/commerce/Commerce-checkout-web/src/main/java/com/liferay/commerce/checkout/web/internal/display/context/PaymentProcessCheckoutStepDisplayContext.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-checkout-web/src/main/java/com/liferay/commerce/checkout/web/internal/display/context/PaymentProcessCheckoutStepDisplayContext.java) 

-   **날짜**: 2023년 10월 25일
-   **티켓**: [COMMERCE-12230](https://liferay.atlassian.net/browse/COMMERCE-12230) 
-   **변경된 사항**: `PaymentProcessCheckoutStepDisplayContext` 메서드는 추가 `CommerceOrder` 값을 사용합니다.
-   **이유**: 결제 성능을 돕기 위해 'CommerceOrder' 값이 매개변수로 전달됩니다.

**AssetEntryItemSelectorCriterion.java** [`모듈/앱/item-selector/item-selector-criteria-api/src/main/java/com/liferay/item/selector/criteria/asset/criterion/AssetEntryItemSelectorCriterion.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/item-selector/item-selector-criteria-api/src/main/java/com/liferay/item/selector/criteria/asset/criterion/AssetEntryItemSelectorCriterion.java) 

-   **날짜**: 2023년 10월 30일
-   **티켓**: [LPS-197840](https://liferay.atlassian.net/browse/LPS-197840) 
-   **변경 사항**: 'scopeGroupType' 메서드가 제거되었습니다.
-   **이유**: 'scopeGroupType' 메서드는 더 이상 사용되지 않습니다.

**BasePreviewBackgroundTaskExecutor.java** [`modules/apps/document-library/document-library-preview-api/src/main/java/com/liferay/document/library/preview/Background/task/BasePreviewBackgroundTaskExecutor.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-preview-api/src/main/java/com/liferay/document/library/preview/background/task/BasePreviewBackgroundTaskExecutor.java) 

-   **날짜**: 2023년 10월 31일
-   **티켓**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032) 
-   **변경된 사항**: 클래스는 `DLFileEntryConfiguration`에 직접 액세스하는 대신 새로운 `DLFileEntryConfigurationProvider`에 액세스합니다.
-   **이유**: `DLFileEntryConfigurationProvider` 클래스가 추가되었습니다.

**ExtendedObjectClassDefinition.java** [`modules/apps/static/portal-configuration/portal-configuration-metatype-api/src/main/java/com/liferay/portal/configuration/metatype/annotations/ExtendedObjectClassDefinition.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/static/portal-configuration/portal-configuration-metatype-api/src/main/java/com/liferay/portal/configuration/metatype/annotations/ExtendedObjectClassDefinition.java) 

-   **날짜**: 2023년 10월 31일
-   **티켓**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032) 
-   **변경 사항**: 클래스에는 새로운 정적 메소드 `getScope(String)`가 있습니다.
-   **이유**: 새로운 방법을 사용하면 문자열 범위 값을 사용하여 'Scope' 개체를 검색할 수 있습니다.

**DLFileEntryConfiguration.java** [`modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/configuration/DLFileEntryConfiguration.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/configuration/DLFileEntryConfiguration.java) 

-   **날짜**: 2023년 10월 31일
-   **티켓**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032) 
-   **변경 사항**: 클래스는 'maxNumberOfPages'라는 새로운 속성을 사용합니다. 이는 이전에는 `PDFPreviewConfiguration`의 일부였습니다.
-   **이유**: `PDFPreviewConfiguration`은 더 이상 사용되지 않습니다.

**DLFileEntryConfigurationProvider.java** [`modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/configuration/DLFileEntryConfigurationProvider.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/configuration/DLFileEntryConfigurationProvider.java) 

-   **날짜**: 2023년 10월 31일
-   **티켓**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032) 
-   **변경된 사항**: 이 클래스는 `DLFileEntryConfiguration`에 대한 새로운 구성 공급자입니다.
-   **이유**: 이 구성 공급자는 `DLFileEntryConfiguration`에 대한 여러 구성 수준(시스템, 인스턴스 및 사이트)에 더 쉽게 액세스할 수 있도록 합니다.

**DLFileEntryConfigurationConstants.java** [`modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/constants/DLFileEntryConfigurationConstants.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/constants/DLFileEntryConfigurationConstants.java) 

-   **날짜**: 2023년 10월 31일
-   **티켓**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032) 
-   **변경사항**: 새로 추가된 클래스입니다.
-   **이유**: 이 클래스는 `DLFileEntryConfiguration` 속성을 처리하기 위한 공통 값을 정의합니다.

**DLFileEntryConfigurationException.java** [`modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/Exception/DLFileEntryConfigurationException.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/exception/DLFileEntryConfigurationException.java) 

-   **날짜**: 2023년 10월 31일
-   **티켓**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032) 
-   **변경된 사항**: 이것은 새로운 유형의 예외입니다.
-   **이유**: 이제 'DLFileEntryConfiguration' 속성에 잘못된 값이 설정된 경우 이 예외가 사용됩니다.

**CPContentHelper.java** [`모듈/앱/상거래/Commerce-product-content-api/src/main/java/com/liferay/commerce/product/content/helper/CPContentHelper.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-product-content-api/src/main/java/com/liferay/commerce/product/content/helper/CPContentHelper.java) 

-   **날짜**: 2023년 11월 4일
-   **티켓**: [COMMERCE-12579](https://liferay.atlassian.net/browse/COMMERCE-12579) 
-   **변경 사항**: 'hasDirectReplacement' 메소드의 이름이 'isDirectReplacement'로 변경되었습니다.
-   **이유**: 이제 이 방법은 SKU에 교체품이 있는지 확인하는 대신 SKU가 다른 제품의 교체품인지 확인합니다.

### `portal-impl` 클래스의 변경 사항

**UserImpl.java** [`portal-impl/src/com/liferay/portal/model/impl/UserImpl.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/model/impl/UserImpl.java) 

-   **날짜**: 2023년 10월 4일
-   **티켓**: [LPS-196035](https://liferay.atlassian.net/browse/LPS-196035) 
-   **변경된 사항**: WebDAV 클라이언트는 Digest Auth를 통해 인증하려면 사용자의 화면 이름, 이메일 주소 또는 일반 비밀번호 대신 'userId'를 사용해야 합니다.
-   **이유**: 이제 WebDAV에서는 각 사용자가 액세스를 위해 별도의 비밀번호를 생성해야 하며, 사용자는 자신의 계정 설정을 변경하기 위한 조치를 취해야 합니다. 예상치 못한 WebDAV 액세스 거부를 방지하기 위해 'userId'를 사용하여 보완하도록 사용자 경험이 단순화되었습니다.

**portal.properties** [`portal-impl/src/portal.properties`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/portal.properties) 

-   **날짜**: 2023년 10월 8일
-   **티켓**: [LPS-189621](https://liferay.atlassian.net/browse/LPS-189621) 
-   **변경사항**: `sql.data.max.parameters` 속성이 제거되었습니다.
-   **이유**: 데이터베이스별 `database.max.parameters` 속성을 대신 사용해야 합니다.

**OpenIdUtil.java**
`portal-impl/src/com/liferay/portal/util/OpenIdUtil.java`

-   **날짜**: 2023년 10월 19일
-   **티켓**: [LPS-198877](https://liferay.atlassian.net/browse/LPS-198877) 
-   **변경사항**: `OpenIdUtil` 클래스가 제거되었습니다. 대신 `OpenIdConnect`를 사용하세요.
-   **이유**: OpenID는 더 이상 사용되지 않으며 Liferay는 더 이상 내부적으로 사용하지 않습니다.

**PersistedModelLocalServiceRegistryUtil.java** [`portal-impl/src/com/liferay/portal/service/PersistedModelLocalServiceRegistryUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/service/PersistedModelLocalServiceRegistryUtil.java) 

-   **날짜**: 2023년 10월 20일
-   **티켓**: [LPS-199563](https://liferay.atlassian.net/browse/LPS-199563) 
-   **변경 사항**: 'PersistedModelLocalServiceRegistryUtil' 클래스가 'portal-kernel'에서 'portal-impl'로 리팩터링되었습니다. 계속 사용하려면 빌드 종속성에 `portal-impl`을 추가하세요.
-   **이유**: 코드 구조를 단순화하기 위해 클래스가 'portal-impl'로 이동되었습니다.

**HttpAuthManagerUtil.java** [`portal-impl/src/com/liferay/portal/security/auth/http.HttpAuthManagerUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/security/auth/http/HttpAuthManagerUtil.java) 

-   **날짜**: 2023년 10월 21일
-   **티켓**: [LPS-197376](https://liferay.atlassian.net/browse/LPS-197376) 
-   **변경 사항**: `HttpAuthManagerUtil` 클래스가 `portal-kernel`에서 `portal-impl`로 리팩터링되었습니다. 계속 사용하려면 빌드 종속성에 `portal-impl`을 추가하세요.
-   **이유**: 코드 구조를 단순화하기 위해 클래스가 'portal-impl'로 이동되었습니다.

**ImageToolUtil.java** [`portal-impl/src/com/liferay/portal/image/ImageToolUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/image/ImageToolUtil.java) \*\*

-   **날짜**: 2023년 10월 21일
-   **티켓**: [LPS-198319](https://liferay.atlassian.net/browse/LPS-198319) 
-   **변경 사항**: `ImageToolUtil` 클래스가 `portal-kernel`에서 `portal-impl`로 리팩터링되었습니다. 계속 사용하려면 빌드 종속성에 `portal-impl`을 추가하세요.
-   **이유**: 코드 구조를 단순화하기 위해 클래스가 'portal-impl'로 이동되었습니다.

**DLPreviewableProcessor.java**
`portal-impl/src/com/liferay/document/library/kernel/util/DLPreviewableProcessor.java`

-   **날짜**: 2023년 10월 21일
-   **티켓**: [LPS-198319](https://liferay.atlassian.net/browse/LPS-198319) 
-   **변경 사항**: `DLPreviewableProcessor` 클래스가 `portal-kernel`에서 `portal-impl`로 리팩터링되었습니다. 계속 사용하려면 빌드 종속성에 `portal-impl`을 추가하세요.
-   **이유**: 코드 구조를 단순화하기 위해 클래스가 'portal-impl'로 이동되었습니다.

**RoleMembershipPolicyFactoryUtil.java** [`portal-kernel/src/com/liferay/portal/kernel/security.membershippolicy.RoleMembershipPolicyFactoryUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/security/membershippolicy/RoleMembershipPolicyFactoryUtil.java) 

-   **날짜**: 2023년 10월 23일
-   **티켓**: [LPS-199389](https://liferay.atlassian.net/browse/LPS-199389) 
-   **변경 사항**: `RoleMembershipPolicyFactoryUtil` 클래스가 `portal-kernel`에서 `portal-impl`로 리팩터링되었습니다. 계속 사용하려면 빌드 종속성에 `portal-impl`을 추가하세요.
-   **이유**: 코드 구조를 단순화하기 위해 클래스가 'portal-impl'로 이동되었습니다.

**RoleMembershipPolicyUtil.java** [`https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/security/membershippolicy/RoleMembershipPolicyUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/security/membershippolicy/RoleMembershipPolicyUtil.java) 

-   **날짜**: 2023년 10월 23일
-   **티켓**: [LPS-199389](https://liferay.atlassian.net/browse/LPS-199389) 
-   **변경 사항**: `RoleMembershipPolicyUtil` 클래스가 `portal-kernel`에서 `portal-impl`으로 리팩터링되었습니다. 계속 사용하려면 빌드 종속성에 `portal-impl`을 추가하세요.
-   **이유**: 코드 구조를 단순화하기 위해 클래스가 'portal-impl'로 이동되었습니다.

**AuthenticatedSessionManagerUtil.java** [`portal-impl/src/com/liferay/portal/security/auth/session/AuthenticatedSessionManagerUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/security/auth/session/AuthenticatedSessionManagerUtil.java) 

-   **날짜**: 2023년 10월 23일
-   **티켓**: [LPS-199165](https://liferay.atlassian.net/browse/LPS-199165) 
-   **변경 사항**: `AuthenticatedSessionManagerUtil` 클래스가 `portal-kernel`에서 `portal-impl`로 리팩터링되었습니다. 계속 사용하려면 빌드 종속성에 `portal-impl`을 추가하세요.
-   **이유**: 코드 구조를 단순화하기 위해 클래스가 'portal-impl'로 이동되었습니다.

**Success.java** [`portal-impl/src/com/liferay/portal/xmlrpc/Success.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/xmlrpc/Success.java) 

-   **날짜**: 2023년 10월 23일
-   **티켓**: [LPS-199164](https://liferay.atlassian.net/browse/LPS-199164) 
-   **변경 사항**: `Success` 클래스가 `portal-kernel`에서 `portal-impl`로 리팩터링되었습니다. 계속 사용하려면 빌드 종속성에 `portal-impl`을 추가하세요.
-   **이유**: 코드 구조를 단순화하기 위해 클래스가 'portal-impl'로 이동되었습니다.

**Fault.java** [`portal-impl/src/com/liferay/portal/xmlrpc/Fault.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/xmlrpc/Fault.java) 

-   **날짜**: 2023년 10월 23일
-   **티켓**: [LPS-199164](https://liferay.atlassian.net/browse/LPS-199164) 
-   **변경 사항**: `Fault` 클래스가 `portal-kernel`에서 `portal-impl`로 리팩터링되었습니다. 계속 사용하려면 빌드 종속성에 `portal-impl`을 추가하세요.
-   **이유**: 코드 구조를 단순화하기 위해 클래스가 'portal-impl'로 이동되었습니다.

**XmlRpcUtil.java** [`portal-impl/src/com/liferay/portal/xmlrpc/XmlRpcUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/xmlrpc/XmlRpcUtil.java) 

-   **날짜**: 2023년 10월 23일
-   **티켓**: [LPS-199164](https://liferay.atlassian.net/browse/LPS-199164) 
-   **변경 사항**: `XmlRpcUtil` 클래스가 `portal-kernel`에서 `portal-impl`로 리팩터링되었습니다. 계속 사용하려면 빌드 종속성에 `portal-impl`을 추가하세요.
-   **이유**: 코드 구조를 단순화하기 위해 클래스가 'portal-impl'로 이동되었습니다.

**StartupHelperUtil.java** [`portal-impl/src/com/liferay/portal/events/StartupHelperUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/events/StartupHelperUtil.java) 

-   **날짜**: 2023년 11월 2일
-   **티켓**: [LPS-200501](https://liferay.atlassian.net/browse/LPS-200501) 
-   **변경사항**: `isStartupFinished` 및 `setStartupFinished(boolean)` 메소드가 제거되었습니다.
-   **이유**: 플래그가 시작 상태를 정확하게 반영하지 않으므로 잘못된 사용을 방지하기 위해 메서드가 제거되었습니다.

**ModelAdapterUtil.java** [`portal-impl/src/com/liferay/portal/model/adapter/ModelAdapterUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/model/adapter/util/ModelAdapterUtil.java) 

-   **날짜**: 2023년 11월 3일
-   **티켓**: [LPS-199825](https://liferay.atlassian.net/browse/LPS-199825) 
-   **변경 사항**: `ModelAdapterUtil` 클래스가 `portal-kernel`에서 `portal-impl`로 리팩터링되었습니다. 계속 사용하려면 빌드 종속성에 `portal-impl`을 추가하세요.
-   **이유**: 코드 구조를 단순화하기 위해 클래스가 'portal-impl'로 이동되었습니다.

### `portal-kernel` 클래스의 변경 사항

**DLProcessorRegistry.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/DLProcessorRegistry.java`

-   **날짜**: 2023년 9월 27일
-   **티켓**: [LPS-196698](https://liferay.atlassian.net/browse/LPS-196698) 
-   **변경사항**: 'getPreviewableProcessorMaxSize' 메서드가 추가되었습니다.
-   **이유**: 구성 값을 검색하려면 메서드가 필요합니다.

**FormNavigatorEntryUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/servlet/taglib/ui/FormNavigatorEntryUtil.java`

-   **날짜**: 2023년 10월 12일
-   **티켓**: [LPS-198653](https://liferay.atlassian.net/browse/LPS-198653) 
-   **변경사항**: `FormNavigatorEntryUtil` 클래스가 제거되었습니다. 대신 `FormNavigatorEntryProvider`에 제공되는 OSGi 서비스를 사용하세요.
-   **이유**: 클래스가 더 이상 사용되지 않습니다.

**OpenId.java**
`portal-kernel/src/com/liferay/portal/kernel/openid/OpenId.java`

-   **날짜**: 2023년 10월 19일
-   **티켓**: [LPS-198877](https://liferay.atlassian.net/browse/LPS-198877) 
-   **변경사항**: 'OpenId' 클래스가 제거되었습니다. 대신 `OpenIdConnect`를 사용하세요.
-   **이유**: OpenID는 더 이상 사용되지 않으며 Liferay는 더 이상 내부적으로 사용하지 않습니다.

**PersistedModelLocalServiceRegistry.java**
`portal-kernel/src/com/liferay/portal/kernel/service/PersistedModelLocalServiceRegistry.java`

-   **날짜**: 2023년 10월 20일
-   **티켓**: [LPS-199563](https://liferay.atlassian.net/browse/LPS-199563) 
-   **변경 사항**: `PersistedModelLocalServiceRegistry` 클래스가 제거되었습니다. 대신 `PersistedModelLocalServiceRegistryUtil`(`portal-impl`로 리팩터링됨)을 사용하세요.
-   **이유**: 서비스 수집 및 조회 논리가 'PersistedModelLocalServiceRegistryUtil'로 리팩터링되었습니다.

**ImageTool.java**
`portal-kernel/src/com/liferay/portal/kernel/image/ImageTool.java`

-   **날짜**: 2023년 10월 21일
-   **티켓**: [LPS-198319](https://liferay.atlassian.net/browse/LPS-198319) 
-   **변경사항**: `ImageTool` 클래스가 제거되었습니다. 해당 상수 필드는 삭제된 이미지 방향과 관련된 상수를 제외하고 'ImageConstants'로 리팩토링됩니다. 대신 `ImageToolUtil`의 정적 메서드나 `ImageConstants`의 상수를 사용하세요.
-   **이유**: 클래스가 더 이상 사용되지 않습니다.

**PortletPermission.java**
`portal-kernel/src/com/liferay/portal/kernel/service/permission/PortletPermission.java`

-   **날짜**: 2023년 10월 21일
-   **티켓**: [LPS-196101](https://liferay.atlassian.net/browse/LPS-196101) 
-   **변경사항**: `PortletPermission` 클래스가 제거되었습니다. 대신 `PortletPermissionUtil`을 사용하세요.
-   **이유**: 클래스가 더 이상 사용되지 않습니다.

**RoleMembershipPolicyFactory.java**
`portal-kernel/src/com/liferay/portal/kernel/security/membershippolicy/RoleMembershipPolicyFactory.java`

-   **날짜**: 2023년 10월 23일
-   **티켓**: [LPS-199389](https://liferay.atlassian.net/browse/LPS-199389) 
-   **변경사항**: `RoleMembershipPolicyFactory` 클래스가 제거되었습니다. 대신 `RoleMembershipPolicyFactoryUtil`(`portal-impl`으로 이동됨)을 사용하세요.
-   **이유**: 클래스가 더 이상 사용되지 않습니다.

**ThreadLocalDistributor.java**
`portal-kernel/src/com/liferay/portal/kernel/util/ThreadLocalDistributor.java`

-   **날짜**: 2023년 10월 23일
-   **티켓**: [LPS-198859](https://liferay.atlassian.net/browse/LPS-198859) 
-   **변경 사항**: `ThreadLocalDistributor` 클래스가 제거되었습니다.
-   **이유**: 클래스가 더 이상 사용되지 않습니다.

**ThreadLocalDistributorRegistry.java**
`portal-kernel/src/com/liferay/portal/kernel/util/ThreadLocalDistributorRegistry.java`

-   **날짜**: 2023년 10월 23일
-   **티켓**: [LPS-198859](https://liferay.atlassian.net/browse/LPS-198859) 
-   **변경 사항**: `ThreadLocalDistributorRegistry` 클래스가 제거되었습니다.
-   **이유**: 클래스가 더 이상 사용되지 않습니다.

**HttpAuthManager.java**
`portal-kernel/src/com/liferay/portal/kernel/security/auth/http/HttpAuthManager.java`

-   **날짜**: 2023년 10월 23일
-   **티켓**: [LPS-197376](https://liferay.atlassian.net/browse/LPS-197376) 
-   **변경사항**: `HttpAuthManger` 클래스가 제거되었습니다. 대신 `HttpAuthManagerUtil`을 사용하세요.
-   **이유**: 클래스가 더 이상 사용되지 않습니다.

**XmlRpcParser.java**
`portal-kernel/src/com/liferay/portal/kernel.xmlrpc.XmlRpcParser.java`

-   **날짜**: 2023년 10월 23일
-   **티켓**: [LPS-199164](https://liferay.atlassian.net/browse/LPS-199164) 
-   **변경 사항**: `XmlRpcParser` 클래스는 `XmlRpcUtil` 클래스(현재 `portal-impl`에도 있음)로 리팩터링되었습니다.
-   **이유**: `XmlRpcParser`와 `XmlRpcUtil` 클래스는 밀접하게 관련되어 있고 서로 종속되어 있으므로 두 클래스를 결합했습니다.

**AuthenticatedSessionManager.java**
`portal-kernel/src/com/liferay/portal/kernel/security/auth/session/AuthenticatedSessionManager.java`

-   **날짜**: 2023년 10월 23일
-   **티켓**: [LPS-199165](https://liferay.atlassian.net/browse/LPS-199165) 
-   **변경사항**: `AuthenticatedSessionManager` 클래스가 제거되었습니다. 대신 `AuthenticatedSessionManagerUtil`을 사용하세요.
-   **이유**: 클래스가 더 이상 사용되지 않습니다.

**TemplateManagerUtil.java** [`portal-kernel/src/com/liferay/portal/kernel/template/TemplateManagerUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/template/TemplateManagerUtil.java) 

-   **날짜**: 2023년 10월 26일
-   **티켓**: [LPS-200072](https://liferay.atlassian.net/browse/LPS-200072) 
-   **변경사항**: `destroy` 및 `getTemplateManagers` 메소드가 제거되었습니다.
-   **이유** 이 방법은 더 이상 사용되지 않습니다.

**TemplateManager.java** [`portal-kernel/src/com/liferay/portal/kernel/template/TemplateManager.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/template/TemplateManager.java) 

-   **날짜**: 2023년 10월 26일
-   **티켓**: [LPS-200072](https://liferay.atlassian.net/browse/LPS-200072) 
-   **변경사항**: `init` 및 `destroy` 메소드가 제거되었습니다.
-   **이유**: 수명주기 관리가 내부 서비스 로직으로 이동되었습니다. 서비스 소비자는 서비스 수명 주기를 직접 제어해서는 안 됩니다.

**ModelAdapterBuilderLocator.java**
`portal-kernel/src/com/liferay/portal/kernel/model/adapter/builder/ModelAdapterBuilderLocator.java`

-   **날짜**: 2023년 11월 3일
-   **티켓**: [LPS-199825](https://liferay.atlassian.net/browse/LPS-199825) 
-   **변경 사항**: `ModelAdapterBuilderLocator` 클래스가 제거되었습니다. 대신 `ModelAdapterUtil`을 직접 사용하세요.
-   **이유**: 클래스가 더 이상 사용되지 않습니다.

**AssetEntriesFacet.java**
`portal-kernel/src/com/liferay/portal/kernel/search/facet/AssetEntriesFacet.java`

-   **날짜**: 2023년 11월 3일
-   **티켓**: [LPS-200073](https://liferay.atlassian.net/browse/LPS-200073) 
-   **변경 사항**: `FacetImpl`의 로직을 위해 `AssetEntriesFacet` 클래스가 제거되었습니다.
-   **이유**: 클래스가 더 이상 사용되지 않습니다.

**AuditMessageFactory.java** [`portal-kernel/src/com/liferay/portal/kernel/audit/AuditMessageFactory.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/audit/AuditMessageFactory.java) 

-   **날짜**: 2023년 11월 7일
-   **티켓**: [LPS-201086](https://liferay.atlassian.net/browse/LPS-201086) 
-   **변경 사항**: `AuditMessageFactoryUtil` 및 `AuditMessageFactoryImpl`의 로직이 `AuditMessageFactory`로 리팩터링되었습니다.
-   **이유**: 로직이 클래스 간에 불필요하게 분할되었으므로 이제 코드 구조를 단순화하기 위해 'AuditMessageFactory' 클래스로 결합되었습니다.

**AuditMessageFactoryUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/audit/AuditMessageFactoryUtil.java`

-   **날짜**: 2023년 11월 7일
-   **티켓**: [LPS-201086](https://liferay.atlassian.net/browse/LPS-201086) 
-   **변경 사항**: `AuditMessageFactoryUtil` 클래스가 제거되었습니다. 로직이 `AuditMessageFactory`로 리팩터링되었습니다.
-   **이유**: 로직이 클래스 간에 불필요하게 분할되었으므로 이제 코드 구조를 단순화하기 위해 'AuditMessageFactory' 클래스로 결합되었습니다.

**PortletToolbar.java** [`portal-kernel/src/com/liferay/portal/kernel/portlet/toolbar/PortletToolbar.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/portlet/toolbar/PortletToolbar.java) 

-   **날짜**: 2023년 11월 21일
-   **티켓**: [LPS-200453](https://liferay.atlassian.net/browse/LPS-200453) 
-   **변경사항**: `PortletToolbar` 클래스의 생성자는 이제 비공개입니다. 대신 `PortletToolbar.INSTANCE`를 사용하여 `PortletToolbar` 인스턴스를 가져오세요.
-   **이유**: `PortletToolbar`는 더 이상 `util-spring`에 없으므로 대신 정적 인스턴스가 필요합니다.

### Taglib의 변경 사항

**`liferay-Commerce` 태그 라이브러리**

-   **날짜**: 2023년 10월 16일
-   **티켓**: [LPS-199170](https://liferay.atlassian.net/browse/LPS-199170) 
-   **변경 사항**: 'SearchInputTag' 및 'UserManagementBarTag' 태그 라이브러리가 제거되었습니다.
-   **이유**: 내부 태그 라이브러리였으며 더 이상 사용되지 않습니다. 그들은 또한 쓸모없는 마크업과 논리를 사용했습니다.

**`liferay-export-import-changeset` 태그 라이브러리**

-   **날짜**: 2023년 10월 16일
-   **티켓**: [LPS-199170](https://liferay.atlassian.net/browse/LPS-199170) 
-   **변경 사항**: `AddEntitiesTag`, `AddEntityTag`, `CreateTag`, `CreateTei`, `ExportEntityTag`, `ExportImportEntityManagementBarButtonTag`, `ExportImportEntitySearchContainerMappingTag`, `ImportEntityTag`, `PublishChangesetTag` 및 `와 같은 taglib가 제거되었습니다. PublishModelMenuItemTag`.
-   **이유**: 내부 태그 라이브러리였으며 더 이상 사용되지 않습니다. 그들은 또한 쓸모없는 마크업과 논리를 사용했습니다.

## 2023년 3분기 출시

### Liferay DXP의 변경 사항

다음은 Liferay 내의 기존 기능을 손상시키거나 크게 변경하는 변경 사항 목록입니다.

| **획기적인 변화**                  | **설명**                                                                                                                                                                                                       | **참고자료**                                                                 |
| :--------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----------------------------------------------------------------------- |
| **조각에 대한 캐시 가능으로 표시 옵션의 사이트
** | 편집기 대신 조각 메뉴(조각의 작업 메뉴 내)에서 조각을 캐시 가능으로 표시(또는 표시 해제)합니다. 이제 이 변경 사항을 조각에 대한 다른 편집 내용과 별도로 수행할 수 있으므로 사용 중인 조각에 전파하는 데 드는 성능 비용이 줄어듭니다. 이번 주요 변경 사항에는 구현 변경이 필요하지 않습니다. | [LPS-183735](https://liferay.atlassian.net/browse/LPS-183735) |

### 모듈 소스 코드의 변경 사항

**SolrClientManager.java** [`모듈/앱/portal-search-solr8/portal-search-solr8-impl/src/main/java/com/liferay/portal/search/solr8/internal/connection/SolrClientManager. 자바`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/portal-search-solr8/portal-search-solr8-impl/src/main/java/com/liferay/portal/search/solr8/internal/connection/SolrClientManager.java) 

-   **날짜**: 2023년 7월 4일
-   **티켓**: [LPS-180691](https://liferay.atlassian.net/browse/LPS-180691) 
-   **변경사항**: 'SolrClientManager' 클래스의 확장 지점이 제거되었습니다.
-   **이유**: Liferay는 더 이상 이 클래스 확장을 지원하지 않습니다.

**SolrClientFactory.java** [`모듈/apps/portal-search-solr8/portal-search-solr8-impl/src/main/java/com/liferay/portal/search/solr8/internal/connection/SolrClientFactory. 자바`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/portal-search-solr8/portal-search-solr8-impl/src/main/java/com/liferay/portal/search/solr8/internal/connection/SolrClientFactory.java) 

-   **날짜**: 2023년 7월 4일
-   **티켓**: [LPS-180691](https://liferay.atlassian.net/browse/LPS-180691) 
-   **변경사항**: 'CLOUD' 및 'REPLICATED' 확장 지점이 제거되었습니다.
-   **이유**: Liferay는 더 이상 이러한 확장 포인트를 지원하지 않습니다.

**HttpClientFactory.java** [`모듈/apps/portal-search-solr8/portal-search-solr8-impl/src/main/java/com/liferay/portal/search/solr8/internal/http/HttpClientFactory. 자바`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/portal-search-solr8/portal-search-solr8-impl/src/main/java/com/liferay/portal/search/solr8/internal/http/HttpClientFactory.java) 

-   **날짜**: 2023년 7월 4일
-   **티켓**: [LPS-180691](https://liferay.atlassian.net/browse/LPS-180691) 
-   **변경 사항**: 'BASIC' 및 'CERT' 확장 포인트가 제거되었습니다.
-   **이유**: Liferay는 더 이상 이러한 확장 포인트를 지원하지 않습니다.

### `portal-impl` 클래스의 변경 사항

**MessagingHotDeployListener.java**
`portal-impl/src/com/liferay/portal/deploy/hot/MessagingHotDeployListener.java`

-   **날짜**: 2023년 8월 4일
-   **티켓**: [LPS-192680](https://liferay.atlassian.net/browse/LPS-192680) 
-   **변경사항**: `MessagingHotDeployListener` 클래스가 제거되었습니다. 함께 제공되는 'liferay/hot_deploy' 메시지 버스 대상도 제거됩니다. 대신 'HotDeployListener'를 등록하여 핫 배포 이벤트를 수신하세요.
-   **이유**: 제거된 메시지 버스 대상은 더 이상 사용되지 않습니다.

**HookHotDeployListener.java** [`portal-impl/src/com/liferay/portal/deploy/hot/HookHotDeployListener.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/deploy/hot/HookHotDeployListener.java) 

-   **날짜**: 2023년 8월 17일
-   **티켓**: [LPS-193926](https://liferay.atlassian.net/browse/LPS-193926) 
-   **변경 사항**: `HookHotDeployListener` 클래스는 더 이상 후크를 통한 [`DLProcessor`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/document/library/kernel/processor/DLProcessor.java) 배포를 지원하지 않습니다. 대신 `DLProcessor`를 OSGi 구현으로 변환하세요.
-   **이유**: 이는 `DLProcessorRegistryImpl`과 `HookHotDeployListener` 사이에 `DLProcessor` 구현을 등록하는 중복된 논리를 방지합니다.

**portal.properties** [`portal-impl/src/portal.properties`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/portal.properties) 

-   **날짜**: 2023년 9월 4일
-   **티켓**: [LPS-194379](https://liferay.atlassian.net/browse/LPS-194379) 
-   **변경사항**: 포털 속성 `discussion.subscribe`가 제거되었습니다. 대신 UI의 인스턴스 설정에서 동일한 구성을 설정하세요.
-   **이유**: 인스턴스 설정은 Liferay가 실행되는 동안 인스턴스별로 구체적으로 설정할 수 있으므로 인스턴스 설정으로 구성하는 것이 더 유연합니다.

**HookHotDeployListener.java** [`portal-impl/src/com/liferay/portal/deploy/hot/HookHotDeployListener.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/deploy/hot/HookHotDeployListener.java) 

-   **날짜**: 2023년 9월 4일
-   **티켓**: [LPS-194350](https://liferay.atlassian.net/browse/LPS-194350) 
-   **변경 사항**: 'HookHotDeployListener' 클래스는 더 이상 후크를 통한 외부 저장소 배포를 지원하지 않습니다. 대신, 자체 외부 저장소 구현을 OSGi 서비스로 변환하십시오.
-   **이유**: OSGi 서비스는 후크를 통해 외부 저장소를 배포하는 것보다 더 많은 기능을 지원합니다.

**portal.properties** [`portal-impl/src/portal.properties`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/portal.properties) 

-   **날짜**: 2023년 9월 13일
-   **티켓**: [LPS-195006](https://liferay.atlassian.net/browse/LPS-195006) 
-   **변경 사항**: 포털 속성 `discussion.comments.always.editable.by.owner`가 제거되었습니다. 대신 UI의 인스턴스 설정에서 동일한 설정을 구성하세요.
-   **이유**: 인스턴스 설정은 Liferay가 실행되는 동안 인스턴스별로 구체적으로 설정할 수 있으므로 인스턴스 설정으로 구성하는 것이 더 유연합니다.

### `portal-kernel` 클래스의 변경 사항

**Document.java** [`portal-kernel/src/com/liferay/portal/kernel/search/Document.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/search/Document.java) 

-   **날짜**: 2023년 7월 7일
-   **티켓**: [LPS-188914](https://liferay.atlassian.net/browse/LPS-188914) 
-   **변경 사항**: 이 `addFile` 메서드는 이제 더 이상 사용되지 않습니다: `addFile(String, byte [], String)`, `addFile(String, File, String)`, `addFile(String, InputStream, String)` 및`addFile(String, InputStream, String, int)`. 파일 데이터와 함께 `InputStream`을 사용하고 [`TextExtractor`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/util/TextExtractor.java) 클래스의 `extractText` 메서드를 호출하여 구현을 업데이트하세요. 그런 다음 `extractText` 호출의 반환 값을 사용하여 `addFile(String, String)`을 호출하세요.
-   **이유**: 더 이상 사용되지 않는 `addFile` 구현은 더 이상 사용되지 않습니다.

**BaseModelPermissionChecker.java**
`com.liferay.portal.kernel.security.permission.BaseModelPermissionChecker`

-   **날짜**: 2023년 8월 11일
-   **티켓**: [LPS-182671](https://liferay.atlassian.net/browse/LPS-182671) 
-   **변경사항**: `BaseModelPermissionChecker` 인터페이스가 제거되었습니다. 대신 [`ModelResourcePermission`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/security/permission/resource/ModelResourcePermission.java) 구현하세요.
-   **이유**: 인터페이스는 7.1에서 더 이상 사용되지 않으며 더 이상 사용되지 않습니다.

**SchedulerEngine.java** [`portal-kernel/src/com/liferay/portal/kernel/scheduler/SchedulerEngine.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/scheduler/SchedulerEngine.java) 

-   **날짜**: 2023년 8월 24일
-   **티켓**: [LPS-194314](https://liferay.atlassian.net/browse/LPS-194314) 
-   **변경사항**: `unschedule` 방법이 제거되었습니다. 대신 `delete` 메소드를 호출하세요.
-   **이유**: 예약되지 않은 작업을 동시에 삭제해야 하기 때문에 이 방법은 필요하지 않습니다.

**SchedulerEngineHelper.java** [`portal-kernel/src/com/liferay/portal/kernel/scheduler/SchedulerEngineHelper.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/scheduler/SchedulerEngineHelper.java) 

-   **날짜**: 2023년 8월 24일
-   **티켓**: [LPS-194314](https://liferay.atlassian.net/browse/LPS-194314) 
-   **변경사항**: `unschedule` 방법이 제거되었습니다. 대신 `delete` 메소드를 호출하세요.
-   **이유**: 예약되지 않은 작업을 동시에 삭제해야 하기 때문에 이 방법은 필요하지 않습니다.

**SchedulerEngineHelperUtil.java** [`portal-kernel/src/com/liferay/portal/kernel/scheduler/SchedulerEngineHelperUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/scheduler/SchedulerEngineHelperUtil.java) 

-   **날짜**: 2023년 8월 24일
-   **티켓**: [LPS-194314](https://liferay.atlassian.net/browse/LPS-194314) 
-   **변경사항**: `unschedule` 방법이 제거되었습니다. 대신 `delete` 메소드를 호출하세요.
-   **이유**: 예약되지 않은 작업을 동시에 삭제해야 하기 때문에 이 방법은 필요하지 않습니다.

**DestinationEventListener.java**
`portal-kernel/src/com/liferay/portal/kernel/messaging/DestinationEventListener.java`

-   **날짜**: 2023년 9월 1일
-   **티켓**: [LPS-195116](https://liferay.atlassian.net/browse/LPS-195116) 
-   **변경사항**: `DestinationEventListener` 인터페이스가 제거되었습니다. 'Destination' 등록 및 등록 취소 이벤트 수신이 더 이상 지원되지 않습니다.
-   **이유**: 이 리스너는 더 이상 사용되지 않습니다.

**MessageBusEventListener.java**
`portal-kernel/src/com/liferay/portal/kernel/messaging/MessageBusEventListener.java`

-   **날짜**: 2023년 9월 1일
-   **티켓**: [LPS-195116](https://liferay.atlassian.net/browse/LPS-195116) 
-   **변경사항**: `MessageBusEventListener` 인터페이스가 제거되었습니다. 'MessageListener' 등록 및 등록 취소 이벤트 수신이 더 이상 지원되지 않습니다.
-   **이유**: 이 리스너는 더 이상 사용되지 않습니다.

**Destination.java** [`portal-kernel/src/com/liferay/portal/kernel/messaging/Destination.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/messaging/Destination.java) 

-   **날짜**: 2023년 9월 1일
-   **티켓**: [LPS-194337](https://liferay.atlassian.net/browse/LPS-194337) 
-   **변경 사항**: `copyMessageListeners`, `getMessageListenerCount`, `isRegistered`, `register`, `unregister` 메소드가 제거되었습니다. 제공된 대상 이름과 연관된 메시지 수신기를 가져오기 위해 [`MessageListenerRegistry`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/messaging/MessageListenerRegistry.java) 인터페이스가 추가되었습니다. `destination.name` 속성을 사용하여 `MessageListener`를 OSGi 서비스로 등록하여 코드를 업데이트하세요.
-   **이유**: 이 변경으로 인해 메시지 버스 코드 구조가 단순화되었습니다.

**TriggerConfiguration.java** [`portal-kernel/src/com/liferay/portal/kernel/scheduler/TriggerConfiguration.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/scheduler/TriggerConfiguration.java) 

-   **날짜**: 2023년 9월 11일
-   **티켓**: [LPS-190994](https://liferay.atlassian.net/browse/LPS-190994) 
-   **변경 사항**: 스케줄러 프레임워크는 작업을 비활성화하기 위해 더 이상 빈 크론 표현식(또는 '0' 간격)을 사용하는 것을 지원하지 않습니다. 대신 구성요소 블랙리스트를 사용하여 특정 스케줄러 구성요소를 비활성화하십시오. 빈 cron 표현식을 사용할 때 표시되는 오류 메시지에서 필수 클래스 이름을 확인하세요.
-   **이유**: 작업을 부트스트랩하지 않아야 하는 경우 스케줄러 프레임워크에 등록하면 안 됩니다.
