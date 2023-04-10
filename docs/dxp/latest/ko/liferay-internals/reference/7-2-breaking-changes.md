# 7.2 주요 변경 사항

이 문서는 기존 기능, API 또는 제3자 Liferay 개발자 또는 사용자와의 계약을 깨는 변경 사항의 시간순 목록을 제공합니다. 우리는 이러한 중단을 최소화하기 위해 최선을 다하지만 때로는 불가피한 경우도 있습니다.

다음은 이 파일에 기록된 몇 가지 변경 유형입니다.

* 제거되거나 대체되는 기능
* API 비호환성: 공용 Java 또는 JavaScript API에 대한 변경 사항
* 템플릿에 사용할 수 있는 컨텍스트 변수 변경
* Liferay 테마 및 포틀릿에 사용할 수 있는 CSS 클래스의 변경 사항
* 구성 변경: `portal.properties`, `system.properties`등과 같은 구성 파일의 변경
* 실행 요구 사항: Java 버전, Java EE 버전, 브라우저 버전 등
* 사용 중단 또는 지원 종료: 예를 들어 특정 기능 또는 API가 향후 버전에서 삭제될 것이라는 경고입니다.
* 권장 사항: 예를 들어 이전 API가 이전 버전과의 호환성을 위해 Liferay Portal에 유지되고 있음에도 불구하고 이전 API를 대체하는 새로 도입된 API를 사용하도록 권장합니다.

## 주요 변경 사항 목록

### 테마에서 JSP 템플릿에 대한 지원 제거
- **날짜:** 2018-11-14
- **JIRA 티켓:** [LPS-87064](https://issues.liferay.com/browse/LPS-87064)

#### 무엇이 바뀌었나요?

테마는 더 이상 JSP 템플릿을 활용할 수 없습니다. 또한 공개 API `com.liferay.portal.kernel.util.ThemeHelper` 및 `com.liferay.taglib.util.ThemeUtil`에서 관련 논리가 제거되었습니다.

#### 누가 영향을 받습니까?

이는 JSP 템플릿을 사용하는 테마가 있거나 제거된 메서드를 사용하는 모든 사용자에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

JSP 템플릿을 사용하는 테마가 있는 경우 FreeMarker로 마이그레이션하는 것을 고려하십시오.

#### 이렇게 변경된 이유는 무엇입니까?

JSP는 실제 템플릿 엔진이 아니며 거의 사용되지 않습니다. FreeMarker는 앞으로 권장되는 템플릿 엔진입니다.

JSP 템플릿을 제거하면 기존 및 새 템플릿 엔진에 더욱 집중할 수 있습니다.

---------------------------------------

### Lodash는 더 이상 기본적으로 포함되지 않습니다.
- **날짜:** 2018-11-27
- **JIRA 티켓:** [LPS-87677](https://issues.liferay.com/browse/LPS-87677)

#### 무엇이 바뀌었나요?

이전에는 Lodash가 기본적으로 모든 페이지에 포함되었으며 전역 `창을 통해 사용할 수 있었습니다._` 및 범위가 지정된 `AUI._` 변수. Lodash는 더 이상 기본적으로 포함되지 않으며 이러한 변수는 이제 정의되지 않습니다.

#### 누가 영향을 받습니까?

이는 사용자 지정 스크립트에서 `AUI._` 또는 `window._` 변수를 사용한 모든 개발자에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

타사 라이브러리를 추가하기 위해 다음과 같은 가능한 전략을 사용하려면 사용자 지정 개발을 위한 고유한 Lodash 버전을 제공해야 합니다.

임시 조치로 Liferay Portal의 **제어판** &rarr; **구성** &rarr; **시스템 설정** &rarr; **타사** &rarr; **Lodash** 에서 `true`로 **Enable Lodash** 속성을 설정하여 이전 동작을 다시 가져올 수 있습니다.

#### 이렇게 변경된 이유는 무엇입니까?

이 변경은 대부분 사용되지 않고 중복되는 모든 페이지에서 추가 라이브러리 코드를 번들링하고 제공하는 것을 방지하기 위해 이루어졌습니다.

---------------------------------------

### 두 개의 스테이징 포털 속성을 OSGi 구성으로 이동했습니다.
- **날짜:** 2018-Dec-12
- **JIRA 티켓:** [LPS-88018](https://issues.liferay.com/browse/LPS-88018)

#### 무엇이 바뀌었나요?

두 개의 스테이징 속성이 `portal.properties` 에서 `export-import-service` 모듈의 `ExportImportServiceConfiguration.java` 이라는 OSGi 구성으로 이동되었습니다.

#### 누가 영향을 받습니까?

이는 다음 포털 속성을 사용하는 모든 사용자에게 영향을 미칩니다.

- `staging.delete.temp.lar.on.failure`
- `staging.delete.temp.lar.on.success`

#### 내 코드를 어떻게 업데이트해야 합니까?

`portal.properties` 파일을 재정의하는 대신 Portal의 구성 관리자에서 속성을 관리할 수 있습니다. 이것은 Liferay Portal의 **제어판** &rarr; **구성** &rarr; **시스템 설정** &rarr; **인프라** &rarr; **내보내기/가져오기** 으로 이동하여 설정을 편집하여 액세스할 수 있습니다.

응용 프로그램에 새 구성을 포함하려면 [응용 프로그램을 구성 가능하게 만들기](https://dev.liferay.com/develop/tutorials/-/knowledge_base/7-1/making-applications-configurable) 지침을 따르십시오.

#### 이렇게 변경된 이유는 무엇입니까?

이 변경은 포털 구성 변경을 쉽게 하기 위한 모듈화 노력의 일환으로 이루어졌습니다.

---------------------------------------

### 페이지 기능에 대한 애플리케이션 URL 링크 제거
- **날짜:** 2018-Dec-14
- **JIRA 티켓:** [LPS-85948](https://issues.liferay.com/browse/LPS-85948)

#### 무엇이 바뀌었나요?

룩앤필 포틀릿의 **Link Portlet URLs to Page** 옵션은 Liferay Portal 7.1에서 더 이상 사용되지 않는 것으로 표시되어 사용자가 구성 속성을 통해 옵션을 표시하거나 숨길 수 있습니다. Liferay Portal 7.2에서는 제거되었으며 더 이상 구성할 수 없습니다.

#### 누가 영향을 받습니까?

이는 UI에서 옵션을 사용한 관리자와 포틀릿에서 옵션을 활용한 개발자에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

속성에 대한 사전 구성된 참조가 포털에서 무시되므로 이 기능을 활용하는 모든 포틀릿을 업데이트해야 합니다.

#### 이렇게 변경된 이유는 무엇입니까?

제한된 수의 포틀릿이 이 특성을 사용합니다. 동일한 결과를 얻을 수 있는 더 나은 방법이 있습니다.

---------------------------------------

### TermOfUseContentProvider를 kernel.util에서 이동했습니다.
- **날짜:** 2019-Jan-07
- **JIRA 티켓:** [LPS-88869](https://issues.liferay.com/browse/LPS-88869)

#### 무엇이 바뀌었나요?

`TermsOfUseContentProvider` 인터페이스의 패키지가 변경되었습니다.

`com.liferay.portal.kernel.util` &rarr; `com.liferay.portal.kernel.term.of.use`

`TermsOfUseContentProviderRegistryUtil` 클래스의 이름과 패키지가 변경되었습니다.

`TermsOfUseContentProviderRegistryUtil` &rarr; `TermsOfUseContentProviderUtil`

그리고

`com.liferay.portal.kernel.util` &rarr; `com.liferay.portal.internal.terms.of.use`

</code> `가져오는 논리도 변경되었습니다. 등록된 첫 번째 서비스를 항상 반환하는 대신 등록된 서비스의 순서에 따라 달라지며 <code>TermsOfUseContentProvider` 서비스가 추적되고 `com.liferay.portal.kernel.util.ServiceProxyFactory`으로 업데이트됩니다. 결과적으로 `TermsOfUseContentProvider` 은 이제 서비스 순위를 따릅니다.

#### 누가 영향을 받습니까?

이는 `com.liferay.portal.kernel.util.TermsOfUseContentProviderRegistryUtil` 을 사용하여 `com.liferay.portal.kernel.util.TermsOfUseContentProvider` 서비스를 조회한 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

`com.liferay.portal.kernel.util.TermsOfUseContentProvider` 이 사용되는 경우 가져오기 패키지 이름을 업데이트합니다. `portal-web`에 사용량이 있는 경우 `com.liferay.portal.kernel.util.TermsOfUseContentProviderRegistryUtil` 을 `com.liferay.portal.kernel.term.of.use.TermsOfUseContentProviderUtil`로 업데이트합니다. 모듈에서 `com.liferay.portal.kernel.util.TermsOfUseContentProviderRegistryUtil` 의 사용을 제거하고 대신 `@Reference` 주석을 사용하여 `com.liferay.portal.kernel.term.of.use.TermsOfUseContentProvider` 서비스를 가져옵니다.

#### 이렇게 변경된 이유는 무엇입니까?

이는 패키지 버전이 잠길 가능성을 줄이기 위해 커널 제공자 인터페이스를 정리하는 여러 단계 중 하나입니다.

---------------------------------------

### HibernateConfigurationConverter 및 변환기 제거됨
- **날짜:** 2019-Jan-07
- **JIRA 티켓:** [LPS-88870](https://issues.liferay.com/browse/LPS-88870)

#### 무엇이 바뀌었나요?

인터페이스 `com.liferay.portal.kernel.util.Converter` 및 해당 구현 `com.liferay.portal.spring.hibernate.HibernateConfigurationConverter` 이 제거되었습니다.

#### 누가 영향을 받습니까?

이는 `HibernateConfigurationConverter`에 의해 구현된 맞춤형 `portlet-hbm.xml` 파일 생성 지원을 제거합니다. 자세한 내용은 [LPS-5363](https://issues.liferay.com/browse/LPS-5363) 을 참조하십시오.

#### 내 코드를 어떻게 업데이트해야 합니까?

`HibernateConfigurationConverter`사용을 제거해야 합니다. 생성된 `portlet-hbm.xml` 이 정확한지 확인하십시오.

#### 이렇게 변경된 이유는 무엇입니까?

이는 패키지 버전이 잠길 가능성을 줄이기 위해 커널 제공자 인터페이스를 정리하는 여러 단계 중 하나입니다.

---------------------------------------

### JDK 기능 및 공급업체 사용으로 전환
- **날짜:** 2019년 1월 08일
- **JIRA 티켓:** [LPS-88911](https://issues.liferay.com/browse/LPS-88911)

#### 무엇이 바뀌었나요?

패키지 `com.liferay.portal.kernel.util` 의 `Function` 및 `Supplier` 인터페이스가 제거되었습니다. 해당 사용법은 `java.util.function.Function` 및 `java.util.function.Supplier`으로 대체되었습니다.

#### 누가 영향을 받습니까?

이는 패키지 `com.liferay.portal.kernel.util`에서 `기능` 및 `공급업체` 인터페이스를 구현한 모든 사용자에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

`com.liferay.portal.kernel.util.Function` 및 `com.liferay.portal.kernel.util.Supplier` 의 사용을 `java.util.function.Function` 및 `java.util.function으로 바꿔야 합니다. 공급업체`, 각각.

#### 이렇게 변경된 이유는 무엇입니까?

이는 패키지 버전이 잠길 가능성을 줄이기 위해 커널 제공자 인터페이스를 정리하는 여러 단계 중 하나입니다.

---------------------------------------

### com.liferay.portal.service.InvokableService 인터페이스가 더 이상 사용되지 않음
- **날짜:** 2019년 1월 08일
- **JIRA 티켓:** [LPS-88912](https://issues.liferay.com/browse/LPS-88912)

#### 무엇이 바뀌었나요?

패키지 `com.liferay.portal.kernel.service` 의 `InvokableService` 및 `InvokableLocalService` 인터페이스가 제거되었습니다.

#### 누가 영향을 받습니까?

이는 `com.liferay.portal.kernel.service` 패키지에서 `InvokableService` 및 `InvokableLocalService`를 사용한 모든 사용자에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

`InvokableService` 및 `InvokableLocalService`사용을 제거해야 합니다. 제거 후 컴파일 오류가 있는 경우 최신 버전의 Service Builder를 사용하여 서비스 구현을 생성해야 합니다.

#### 이렇게 변경된 이유는 무엇입니까?

이는 패키지 버전이 잠길 가능성을 줄이기 위해 커널 제공자 인터페이스를 정리하는 여러 단계 중 하나입니다.

---------------------------------------

### ServiceLoaderCondition 지원 중단
- **날짜:** 2019년 1월 08일
- **JIRA 티켓:** [LPS-88913](https://issues.liferay.com/browse/LPS-88913)

#### 무엇이 바뀌었나요?

패키지 `com.liferay.portal.kernel.util` 의 인터페이스 `ServiceLoaderCondition` 및 해당 구현 `DefaultServiceLoaderCondition` 이 제거되었습니다.

#### 누가 영향을 받습니까?

이는 `ServiceLoaderCondition` 및 `DefaultServiceLoaderCondition`을 사용하는 모든 사용자에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

`ServiceLoaderCondition`사용을 제거해야 합니다. 업데이트된 메서드 서명에 따라 `com.liferay.portal.kernel.util.ServiceLoader` 에서 `로드` 메서드의 사용을 업데이트합니다.

#### 이렇게 변경된 이유는 무엇입니까?

이는 패키지 버전이 잠길 가능성을 줄이기 위해 커널 제공자 인터페이스를 정리하는 여러 단계 중 하나입니다.

---------------------------------------

### JDK 술어 사용으로 전환됨
- **날짜:** 2019년 1월 14일
- **JIRA 티켓:** [LPS-89139](https://issues.liferay.com/browse/LPS-89139)

#### 무엇이 바뀌었나요?

인터페이스 `com.liferay.portal.kernel.util.PredicateFilter` 이 제거되고 `java.util.function.Predicate`으로 대체되었습니다. 그 결과 다음 구현이 제거되었습니다.

- `com.liferay.portal.kernel.util.AggregatePredicateFilter`
- `com.liferay.portal.kernel.util.PrefixPredicateFilter`
- `com.liferay.portal.kernel.portlet.JavaScriptPortletResourcePredicateFilter`
- `com.liferay.dynamic.data.mapping.form.values.query.internal.model.DDMFormFieldValuePredicateFilter`

`com.liferay.portal.kernel.util.ArrayUtil_IW` 클래스가 재생성되었습니다.

#### 누가 영향을 받습니까?

이것은 `PredicateFilter`, `AggregatePredicateFilter`, `PrefixPredicateFilter`, `JavaScriptPortletResourcePredicateFilter`및 `DDMFormFieldValuePredicateFilter`를 사용한 모든 사용자에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

`com.liferay.portal.kernel.util.PredicateFilter` 의 사용을 `java.util.function.Predicate`으로 바꿔야 합니다. 또한 `AggregatePredicateFilter`, `PrefixPredicateFilter`, `JavaScriptPortletResourcePredicateFilter`및 `DDMFormFieldValuePredicateFilter`의 사용을 제거합니다.

#### 이렇게 변경된 이유는 무엇입니까?

이는 패키지 버전이 잠길 가능성을 줄이기 위해 커널 제공자 인터페이스를 정리하는 여러 단계 중 하나입니다.

---------------------------------------

### com.liferay.portal.kernel.util 패키지에서 안전하지 않은 기능 인터페이스 제거
- **날짜:** 2019년 1월 15일
- **JIRA 티켓:** [LPS-89223](https://issues.liferay.com/browse/LPS-89223)

#### 무엇이 바뀌었나요?

`com.liferay.portal.osgi.util.test.OSGiServiceUtil` 클래스가 제거되었습니다. 또한 다음 인터페이스가 `com.liferay.portal.kernel.util` 패키지에서 제거되었습니다.

- `UnsafeConsumer`
- `UnsafeFunction`
- `UnsafeRunnable`

#### 누가 영향을 받습니까?

이것은 위에서 언급한 클래스/인터페이스를 사용하는 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

`com.liferay.portal.osgi.util.test.OSGiServiceUtil` 클래스는 Liferay Portal 7.1부터 사용되지 않습니다. 이 클래스에 대한 사용이 여전히 존재하는 경우 직접 대체 항목으로 바꾸십시오: `com.liferay.osgi.util.service.OSGiServiceUtil`. `UnsafeConsumer`, `UnsafeFunction` 및 `UnsafeRunnable` 의 사용을 패키지 `com.liferay.petra.function`의 해당 인터페이스로 바꿉니다.

#### 이렇게 변경된 이유는 무엇입니까?

이는 패키지 버전이 잠길 가능성을 줄이기 위해 커널 제공자 인터페이스를 정리하는 여러 단계 중 하나입니다.

---------------------------------------

### 포털 배포에서 더 이상 사용되지 않는 NTLM
- **날짜:** 2019년 1월 21일
- **JIRA 티켓:** [LPS-88300](https://issues.liferay.com/browse/LPS-88300)

#### 무엇이 바뀌었나요?

NTLM 모듈이 `Portal-security-sso` 프로젝트에서 `Portal-security-sso-ntlm`이라는 새 프로젝트로 이동되었습니다. 이 새 프로젝트는 더 이상 사용되지 않으며 Liferay Marketplace에서 다운로드할 수 있습니다.

#### 누가 영향을 받습니까?

이는 NTLM을 인증 시스템으로 사용하는 모든 사용자에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

NTLM을 인증 시스템으로 계속 사용하려면 Liferay Marketplace에서 해당 모듈을 다운로드해야 합니다. 또는 변경할 필요가 없고 Liferay Portal 7.0 이상과 호환되는 Kerberos(권장)로 마이그레이션할 수 있습니다.

#### 이렇게 변경된 이유는 무엇입니까?

이 변경은 이전 독점 솔루션(NTLM)을 사용하지 않도록 하기 위한 것입니다. 표준 프로토콜이자 NTLM에 비해 더 안전한 인증 방법인 Kerberos가 이제 권장됩니다.

---------------------------------------

### 포털 배포에서 더 이상 사용되지 않는 OpenID
- **날짜:** 2019년 1월 21일
- **JIRA 티켓:** [LPS-88906](https://issues.liferay.com/browse/LPS-88906)

#### 무엇이 바뀌었나요?

OpenID 모듈이 `Portal-security-sso-openid`이라는 새 프로젝트로 이동되었습니다. 이 새 프로젝트는 더 이상 사용되지 않으며 Liferay Marketplace에서 다운로드할 수 있습니다.

#### 누가 영향을 받습니까?

이것은 OpenID를 인증 시스템으로 사용하는 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

OpenID를 인증 시스템으로 계속 사용하려면 Liferay Marketplace에서 해당 모듈을 다운로드해야 합니다. 또는 Liferay Portal Distribution에서 사용할 수 있는 OpenID Connect로 마이그레이션해야 합니다.

#### 이렇게 변경된 이유는 무엇입니까?

이 변경은 더 이상 사용되지 않는 솔루션(OpenID)을 사용하지 않도록 하기 위한 것입니다. OpenID Connect는 이제 OAuth 위에서 실행되기 때문에 더 안전한 인증 방법인 OpenID Connect를 권장합니다.

---------------------------------------

### 포털 배포에서 더 이상 사용되지 않는 Google SSO
- **날짜:** 2019년 1월 21일
- **JIRA 티켓:** [LPS-88905](https://issues.liferay.com/browse/LPS-88905)

#### 무엇이 바뀌었나요?

Google SSO 모듈이 `Portal-security-sso` 프로젝트에서 `Portal-security-sso-google`이라는 새 프로젝트로 이동되었습니다. 이 새 프로젝트는 더 이상 사용되지 않으며 Liferay Marketplace에서 다운로드할 수 있습니다.

#### 누가 영향을 받습니까?

이는 Google SSO를 인증 시스템으로 사용하는 모든 사용자에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

Google SSO를 인증 시스템으로 계속 사용하려면 Liferay Marketplace에서 해당 모듈을 다운로드해야 합니다. 또는 OpenID Connect를 사용할 수 있습니다.

#### 이렇게 변경된 이유는 무엇입니까?

이 변경은 인증에 이전 솔루션(Google SSO)을 사용하지 않도록 하기 위한 것입니다. OpenID Connect는 인증을 위해 Google 구현을 사용하는 데 권장되는 사양입니다.

---------------------------------------

### liferay-amd-loader에서 Liferay.Loader.addModules를 제거했습니다.
- **날짜:** 2019-2-01
- **JIRA 티켓:** [LPS-83949](https://issues.liferay.com/browse/LPS-83949)

#### 무엇이 바뀌었나요?

addModules 함수는 liferay-amd-loader 버전 4.x 이상에서 제거되었습니다.

#### 누가 영향을 받습니까?

이는 liferay-amd-loader를 직접 사용하여 모듈을 정의하는 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

Liferay.Loader.addModules를 직접 대체할 수 없습니다.

한 가지 대안은 JS Toolkit 프로젝트를 만들어 모듈을 게시하는 것입니다. https://github.com/liferay/liferay-frontend-projects/tree/master/maintenance/projects/js-toolkit/docs

#### 이렇게 변경된 이유는 무엇입니까?

서버 측에서 모든 모듈 해상도를 수행하면 속도와 네트워크 성능이 향상됩니다.

---------------------------------------

### 업데이트된 AlloyEditor v2.0에는 React의 새로운 주요 버전이 포함되어 있습니다.
- **날짜:** 2019-2-04
- **JIRA 티켓:** [LPS-90079](https://issues.liferay.com/browse/LPS-90079)

#### 무엇이 바뀌었나요?

AlloyEditor는 React v15에서 v16으로의 주요 업그레이드를 포함하는 버전 2.0.0으로 업그레이드되었습니다.

`React.createClass` 은 React v15.5.0 [(2017년 [](https://reactjs.org/blog/2017/09/26/react-v16.0.html) React v16.0.0](https://reactjs.org/blog/2017/04/07/react-v15.5.0.html) (2017년 9월)에서 제거되었습니다. AlloyEditor와 함께 번들로 제공되는 모든 버튼은 `React.createClass`대신 ES6 클래스 구문을 사용하도록 업데이트되었습니다.

#### 누가 영향을 받습니까?

이것은 `React.createClass`을 사용하여 자신만의 버튼을 만든 모든 사람에게 영향을 미칩니다. `createClass` 함수는 더 이상 사용할 수 없으며 런타임에 액세스하려고 하면 오류가 발생합니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

다음 두 가지 방법 중 하나로 코드를 업데이트해야 합니다.

- [React 문서](https://reactjs.org/docs/react-component.html) 에 설명된 대로 `React.createClass` API에서 ES6 `class` API를 사용하도록 사용자 지정 버튼을 포팅합니다. 예를 들어 [ES6 클래스 기반 버튼](https://github.com/liferay/alloy-editor/blob/b082c312179ae6626cb2ddcc04ad3ebc5b355e1b/src/components/buttons/button-ol.jsx) 으로 이동하면서 변경된 사항을 확인하세요. [이전 `createClass` 기반 구현](https://github.com/liferay/alloy-editor/blob/2826ab9ceabe17c6ba0d38985baf8a787c23db43/src/ui/react/src/components/buttons/button-ol.jsx) .

- 호환 어댑터를 제공하십시오. [create-react-class 패키지](https://www.npmjs.com/package/create-react-class) ( [여기](https://reactjs.org/docs/react-without-es6. html) )을 페이지에 삽입하여 `createClass` API를 복원할 수 있습니다.

#### 이렇게 변경된 이유는 무엇입니까?

이 변경은 더 이상 사용되지 않는 API를 제거하여 성능 및 호환성을 개선하고 번들 크기를 줄이는 최신 주 버전의 React를 사용하기 위해 만들어졌습니다.

---------------------------------------

### dl.tabs.visible Portal 속성이 더 이상 사용되지 않음

- **날짜:** 2019-4월-10
- **JIRA 티켓:** [LPS-93948](https://issues.liferay.com/browse/LPS-93948)

#### 무엇이 바뀌었나요?

`dl.tabs.visible` 속성을 사용하면 사용자가 위젯 페이지에 있을 때 문서 및 미디어 위젯의 탐색 탭의 가시성을 전환할 수 있습니다. 이 구성 옵션은 제거되었으므로 탐색 탭은 위젯 페이지에 표시되지 않습니다.

#### 누가 영향을 받습니까?

이는 `dl.tabs.visible` 속성을 `true`으로 설정한 모든 사용자에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

코드 변경이 필요하지 않습니다.

#### 이렇게 변경된 이유는 무엇입니까?

문서 & 미디어는 UX 관점에서 검토되었으며 위젯 페이지에서 탐색 탭을 제거하는 것은 UI 정리 프로세스의 일부였습니다.

---------------------------------------

### 제품 메뉴에서 사용자 메뉴 이동

- **날짜:** 2019-4월-19
- **JIRA 티켓:** [LPS-87868](https://issues.liferay.com/browse/LPS-87868)

#### 무엇이 바뀌었나요?

사용자 메뉴가 제품 메뉴에서 제거되었고 사용자 메뉴 항목이 사용자 아바타에 의해 트리거되는 드롭다운 메뉴인 새로운 개인 메뉴로 이동되었습니다.

#### 누가 영향을 받습니까?

이는 제품 메뉴의 사용자 메뉴 섹션을 사용자 정의한 모든 사용자에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

사용자 정의 사용자 메뉴 항목을 유지하고 개인 메뉴에서 사용할 수 있게 하려면 `PersonalMenuEntry` 인터페이스를 구현해야 합니다. `PanelCategoryKeys.USER`, `PanelCategoryKeys.USER_MY_ACCOUNT`및 `PanelCategoryKeys.USER_SIGN_OUT` 패널 카테고리 키에 등록된 모든 패널 앱은 `PersonalMenuEntry`로 변환되어야 합니다.

#### 이렇게 변경된 이유는 무엇입니까?

상품 내비게이션은 UX 관점에서 검토되었으며 상품 메뉴에서 사용자 메뉴를 제거하고 자체 메뉴로 분할하여 더 나은 사용자 경험을 제공합니다.

---------------------------------------

### 국가 목록에서 홍콩 및 마카오 제거

- **날짜:** 2019-4-26
- **JIRA 티켓:** [LPS-82203](https://issues.liferay.com/browse/LPS-82203)

#### 무엇이 바뀌었나요?

홍콩과 마카오는 국가 목록에서 제외되었으며 각각 Xianggang(지역 코드: CN-91) 및 Aomen(지역 코드: CN-92)으로 중국의 지역으로 나열되었습니다.

#### 누가 영향을 받습니까?

이는 주소에 홍콩 또는 마카오를 사용한 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

코드 변경이 필요하지 않습니다. 그러나 홍콩과 마카오의 `countryId` 을 코드에 하드코딩한 경우 중국의 `countryId`으로 업데이트해야 합니다. 홍콩 및 마카오에 대한 참조는 해당 `regionId`로 수행해야 합니다.

#### 이렇게 변경된 이유는 무엇입니까?

1997년 홍콩 반환, 1999년 마카오 반환 이후 홍콩과 마카오는 중국의 특별행정구가 됐다.

---------------------------------------

### JGroups가 3.6.16에서 4.1.1로 업그레이드되었습니다.

- **날짜:** 2019-8-15
- **JIRA 티켓:** [LPS-97897](https://issues.liferay.com/browse/LPS-97897)

#### 무엇이 바뀌었나요?

JGroups는 버전 3.6.16에서 4.1.1로 업그레이드되었습니다.

#### 누가 영향을 받습니까?

이것은 Cluster Link를 사용하는 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

`portal.properties` 의 `cluster.link.channel.properties.*` 속성은 더 이상 연결 문자열을 값으로 허용하지 않습니다. 이제 구성 XML 파일에 대한 파일 경로가 필요합니다. 3.6.16의 일부 프로토콜 속성이 제거되어 더 이상 4.1.1에서 구문 분석되지 않습니다. 그에 따라 프로토콜 속성을 업데이트해야 합니다.

#### 이렇게 변경된 이유는 무엇입니까?

이 업그레이드는 보안 문제를 해결하기 위해 이루어졌습니다.

---------------------------------------

### Liferay AssetEntries_AssetCategories는 더 이상 사용되지 않습니다.

- **날짜:** 2019-9-11
- **JIRA 티켓:** [LPS-99973](https://issues.liferay.com/browse/LPS-99973) , [LPS-76488](https://issues.liferay.com/browse/LPS-76488)

#### 무엇이 바뀌었나요?

이전에 Liferay는 `AssetEntryLocalService` 및 `AssetCategoryLocalService`에서 `AssetEntry` 및 `AssetCategory` 간의 관계에 대해 매핑 테이블 및 해당 인터페이스를 사용했습니다. 이 매핑 테이블과 해당 인터페이스는 `AssetEntryAssetCategoryRel` 테이블과 `AssetEntryAssetCategoryRelLocalService` 서비스로 대체되었습니다.

#### 누가 영향을 받습니까?

이는 `AssetEntryLocalService` 및 `AssetCategoryLocalService`를 통해 `AssetEntries_AssetCategories` 관계에 대한 이전 인터페이스 호출에 의존하는 모든 콘텐츠 또는 코드에 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

`AssetEntryAssetCategoryRelLocalService` 의 새 메서드를 사용하여 이전과 동일한 데이터를 검색합니다. 메서드 서명은 변경되지 않았습니다. 그들은 방금 다른 서비스로 재배치되었습니다.

**예**

옛날 방식:

```java
목록<AssetEntry> 항목 =
AssetEntryLocalServiceUtil.getAssetCategoryAssetEntries(categoryId);

for (AssetEntry 항목: 항목) {
...
}
```

새로운 방식:

```java
long[] assetEntryPKs =
_assetEntryAssetCategoryRelLocalService.getAssetEntryPrimaryKeys(assetCategoryId);

for (long assetEntryPK: assetEntryPKs) {
  AssetEntry = _assetEntryLocalService.getEntry(assetEntryPK);
  ...
}

...

@Reference
private AssetEntryAssetCategoryRelLocalService _assetEntryAssetCategoryRelLocalService;

@Reference
private AssetEntryLocalService _assetEntryLocalService;
```

#### 이렇게 변경된 이유는 무엇입니까?

이 변경은 [LPS-76488](https://issues.liferay.com/browse/LPS-76488) 로 인해 개발자가 지정된 범주에 대한 자산 목록의 순서를 제어할 수 있도록 하는 변경 사항으로 인해 이루어졌습니다.

---------------------------------------

### 자동 태그 추가는 수동으로 재구성해야 함

- **날짜:** 2019-Oct-02
- **JIRA 티켓:** [LPS-97123](https://issues.liferay.com/browse/LPS-97123)

#### 무엇이 바뀌었나요?

자동 태그 지정 구성의 이름이 바뀌고 재구성되었습니다. 더 이상 자동 업그레이드 프로세스가 없으므로 자동 태그 지정을 수동으로 재구성해야 합니다.

#### 누가 영향을 받습니까?

이는 SP1로 업그레이드되고 자동 태깅이 구성 및 활성화된 DXP 7.2 설치에 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

시스템 설정을 통해 자동 태그 지정을 다시 구성해야 합니다(자세한 내용은 [공식 문서](https://help.liferay.com/hc/ko/articles/360029041551-Configuring-Asset-Auto-Tagging) 참조). 이전 구성 인터페이스를 참조하는 모든 코드는 새 구성 인터페이스를 사용하도록 업데이트해야 합니다.

#### 이렇게 변경된 이유는 무엇입니까?

이 변경 사항은 이전에 분할된 구성 인터페이스를 통합하여 사용자 경험을 개선합니다.

---------------------------------------

### 블로그 이미지 포털 속성을 시스템 설정으로 이동했습니다.

- **날짜:** 2019-Oct-02
- **JIRA 티켓:** [LPS-95298](https://issues.liferay.com/browse/LPS-95298)

#### 무엇이 바뀌었나요?

블로그 이미지 구성이 `portal.properties` 에서 시스템 설정으로 이동되었습니다. 자동 업그레이드 프로세스가 없으므로 사용자 지정 블로그 이미지 속성을 수동으로 재구성해야 합니다.

#### 누가 영향을 받습니까?

이는 SP1로 업그레이드되고 `blogs.image.max.size` 및 `blogs.image.extensions` 속성에 대한 사용자 정의 값이 있는 DXP 7.2 설치에 영향을 줍니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

사용자 지정 블로그 이미지 속성 값을 유지하려면 **구성** &rarr; **블로그** &rarr; **파일 업로드** 아래의 시스템 설정을 통해 다시 구성해야 합니다. 새 구성 인터페이스를 사용하려면 이전 속성을 참조하는 모든 코드를 업데이트해야 합니다.

#### 이렇게 변경된 이유는 무엇입니까?

다시 시작하지 않고 블로그 이미지 속성을 구성할 수 있도록 이 변경이 이루어졌습니다.

---------------------------------------

### 캐시 부트스트랩 기능 제거

- **날짜:** 2020년 1월 8일
- **JIRA 티켓:** [LPS-96563](https://issues.liferay.com/browse/LPS-96563)

#### 무엇이 바뀌었나요?

캐시 부트스트랩 기능이 제거되었습니다. 이러한 속성은 더 이상 캐시 부트스트랩을 활성화/구성하는 데 사용할 수 없습니다.

`ehcache.bootstrap.cache.loader.enabled`, `ehcache.bootstrap.cache.loader.properties.default`, `ehcache.bootstrap.cache.loader.properties.${specific.cache.name}`.

#### 누가 영향을 받습니까?

이것은 위에 나열된 속성을 사용하는 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

제거된 기능을 직접 대체할 수 없습니다. 이에 의존하는 코드가 있는 경우 직접 구현해야 합니다.

#### 이렇게 변경된 이유는 무엇입니까?

이 변경은 보안 문제를 피하기 위해 이루어졌습니다.

---------------------------------------

### 기본적으로 비활성화된 ContentTransformerListener

- **날짜:** 2020-5-25
- **JIRA 티켓:** [LPS-114239](https://issues.liferay.com/browse/LPS-114239)

#### 무엇이 바뀌었나요?

`ContentTransformerListener` 은 이제 기본적으로 비활성화됩니다.

#### 누가 영향을 받습니까?

이는 `ContentTransformerListener`에서 제공하는 레거시 웹 콘텐츠 기능을 사용하는 Liferay Portal 설치에 영향을 미칩니다(예: 다른 웹 콘텐츠 내에 웹 콘텐츠 포함, 레거시 현장 편집, 토큰 교체(`@article_group_id@`, `@articleId;elementName@`) 등

#### 내 코드를 어떻게 업데이트해야 합니까?

코드를 업데이트할 필요가 없습니다. 여전히 `ContentTransformerListener`을 사용하려면 시스템 설정에서 활성화할 수 있습니다.

#### 이렇게 변경된 이유는 무엇입니까?

`ContentTransformerListener` 은 기사 요소에서 많은 문자열 프로세스를 실행합니다(기사 필드에서 `HtmlUtil.stripComments` 및 `HtmlUtil.stripHtml` 호출). 성능 향상을 위해 비활성화되었습니다.

---------------------------------------

### DDMDataProvider에서 대체된 메소드

- **날짜:** 2020-7-14
- **JIRA 티켓:** [LPS-81563](https://issues.liferay.com/browse/LPS-81563)

#### 무엇이 바뀌었나요?

`ddmDataProviderContext` 매개변수( 유형 `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderContext`) `com.liferay.dynamic.data.mapping.data.provider.DataProvider`의 `getData` 메서드 `ddmDataProviderRequest` ( 유형 `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderRequest`)로 대체되었습니다.

#### 누가 영향을 받습니까?

이것은 교체된 방법을 사용하는 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

유형 `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderContext` 의 매개변수를 유형 `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderRequest`의 다른 매개변수로 바꿉니다.

#### 이렇게 변경된 이유는 무엇입니까?

이 변경 사항은 [LPS-81563](https://issues.liferay.com/browse/LPS-81563) 의 데이터 공급자 API 리팩토링의 일부입니다.

---------------------------------------

### DDMDataProviderRequest에서 제거된 생성자

- **날짜:** 2020-7-14
- **JIRA 티켓:** [LPS-81563](https://issues.liferay.com/browse/LPS-81563)

#### 무엇이 바뀌었나요?

생성자 메서드는 `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderRequest`에서 제거되었습니다.

#### 누가 영향을 받습니까?

이는 제거된 생성자를 사용하는 모든 사용자에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderRequest.Builder` 을 사용하여 생성자 대신 원하는 모든 매개변수를 사용하여 새로운 `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderRequest` 을 생성합니다.

#### 이렇게 변경된 이유는 무엇입니까?

이 변경은 [LPS-81563](https://issues.liferay.com/browse/LPS-81563) 의 데이터 제공자 API 리팩토링의 일부입니다.

---------------------------------------

### DDMDataProviderRequest에서 제거된 메서드

- **날짜:** 2020-7-14
- **JIRA 티켓:** [LPS-81563](https://issues.liferay.com/browse/LPS-81563)

#### 무엇이 바뀌었나요?

이러한 메서드는 `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderRequest`에서 제거되었습니다.

- `getDDMDataProviderContext`
- `setDDMDataProviderContext`
- `getHttpServletRequest`
- `getParameter`
- `queryString`

#### 누가 영향을 받습니까?

이는 제거된 메서드를 사용한 모든 사용자에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderRequest` 및 `com.liferay.dynamic.data.mapping.data.provider.internal.DDMDataProviderInstanceSettingsImpl` 을 사용하여 `com.liferay.dynamic에서 제공하는 데이터를 가져옵니다. .data.mapping.data.provider.DDMDataProviderContext`.

또한 메서드 `withParameter` 를 사용하여 `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderRequest.Builder` 을 통해 `javax.servlet.http.HttpServletRequest` 객체를 추가하고 메서드 `getParameterOptional`을 사용하여 검색합니다. .

`getParameter` 대신 기존 메소드 `getParameterOptional`을 사용하십시오. 필요한 모든 매개변수를 추가하려면 `queryString`의 사용법을 `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderRequest.Builder`의 `withParameter` 메서드로 바꿉니다.

#### 왜 이렇게 변경되었나요?

이 변경 사항은 [LPS-81563](https://issues.liferay.com/browse/LPS-81563) 의 데이터 공급자 API 리팩토링의 일부입니다.

---------------------------------------

### DDMDataProviderRequest에서 대체된 메소드
- **날짜:** 2020년 7월 14일
- **JIRA 티켓:** [LPS-81563](https://issues.liferay.com/browse/LPS-81563)

#### 무엇이 바뀌었나요?

`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderRequest`의 `getDDMDataProviderInstanceId` 메소드가 `getDDMDataProviderId`로 대체되었습니다.

#### 누가 영향을 받습니까?

이것은 교체된 방법을 사용한 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

`getDDMDataProviderInstanceId` 의 사용법을 `getDDMDataProviderId`으로 바꿉니다.

#### 이렇게 변경된 이유는 무엇입니까?

이 변경 사항은 [LPS-81563](https://issues.liferay.com/browse/LPS-81563) 의 데이터 공급자 API 리팩토링의 일부입니다.

---------------------------------------

### DDMDataProviderResponse에서 제거된 메소드

- **날짜:** 2020-7-14
- **JIRA 티켓:** [LPS-81563](https://issues.liferay.com/browse/LPS-81563)

#### 무엇이 바뀌었나요?

메소드 `error`, `of`및 `getDataMap` 가 클래스 `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponse`에서 제거되었습니다.

#### 누가 영향을 받습니까?

이는 제거된 메서드를 사용한 모든 사용자에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

코드에서 다음과 같이 업데이트된 메서드를 사용하세요.

- `error` 메서드를 호출하는 대신 `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponse.Builder`의 `withStatus` 메서드를 사용합니다.
- `of` 메소드를 `Builder`의 `withStatus` 및 `withOutput` 메소드로 대체합니다.
- `Builder`의 `withOutput` 메서드를 사용하여 `getDataMap` 호출을 출력 추가로 교체하고 `getOutputOptional` 메서드를 통해 가져옵니다.

`withOutput` 메서드는 필요한 만큼 여러 번 호출할 수 있습니다.

#### 이렇게 변경된 이유는 무엇입니까?

이 변경 사항은 [LPS-81563](https://issues.liferay.com/browse/LPS-81563) 의 데이터 공급자 API 리팩토링의 일부입니다.

---------------------------------------

### DDMDataProviderResponse에서 메소드 대체

- **날짜:** 2020-7-14
- **JIRA 티켓:** [LPS-81563](https://issues.liferay.com/browse/LPS-81563)

#### 무엇이 바뀌었나요?

`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponse`의 `get` 메소드가 `getOutputOptional`로 대체되었습니다.

#### 누가 영향을 받습니까?

이것은 교체된 방법을 사용한 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

`get`대신 `getOutputOptional` 을 사용하십시오.

#### 이렇게 변경된 이유는 무엇입니까?

이 변경 사항은 [LPS-81563](https://issues.liferay.com/browse/LPS-81563) 의 데이터 공급자 API 리팩토링의 일부입니다.

---------------------------------------

### DDMDataProviderResponse에서 Enum을 교체했습니다.

- **날짜:** 2020-7-14
- **JIRA 티켓:** [LPS-81563](https://issues.liferay.com/browse/LPS-81563)

#### 무엇이 바뀌었나요?

`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponse`의 로컬 열거형 `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponse.Status`이 `com.liferay로 이동되었습니다. dynamic.data.mapping.data.provider.DDMDataProviderResponseStatus`. 결과적으로 `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponse`의 `getStatus`데이터 유형이 `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponse.Status에서 변경되었습니다.` ~ `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponseStatus`.

#### 누가 영향을 받습니까?

이는 교체된 열거형을 사용한 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponse.Status` 의 사용을 `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponseStatus`으로 바꿉니다.

#### 이렇게 변경된 이유는 무엇입니까?

이 변경 사항은 [LPS-81563](https://issues.liferay.com/browse/LPS-81563) 의 데이터 공급자 API 리팩토링의 일부입니다.

---------------------------------------

### 삭제된 DDMDataProviderResponseOutput

- **날짜:** 2020-7-14
- **JIRA 티켓:** [LPS-81563](https://issues.liferay.com/browse/LPS-81563)

#### 무엇이 바뀌었나요?

`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponseOutput` 이 삭제되었습니다.

#### 누가 영향을 받습니까?

이는 제거된 클래스를 사용한 모든 사용자에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

제거된 클래스를 직접 대체할 수 없습니다. 이에 의존하는 코드가 있는 경우 직접 구현해야 합니다.

#### 이렇게 변경된 이유는 무엇입니까?

클래스 `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponseOutput` 은 [LPS-81563](https://issues.liferay.com/browse/LPS-81563) 의 데이터 공급자 코드에 개선 사항이 구현된 후 사용되지 않기 때문에 사용 중단 경고 없이 삭제되었습니다.

---------------------------------------

### DDMDataProviderTracker에서 메소드 제거

- **날짜:** 2020-7-14
- **JIRA 티켓:** [LPS-81563](https://issues.liferay.com/browse/LPS-81563)

#### 무엇이 바뀌었나요?

`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderTracker`의 `getDDMDataProviderContextContributors` 메서드가 제거되었습니다.

#### 누가 영향을 받습니까?

이는 제거된 메서드를 사용한 모든 사용자에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

필요한 데이터를 얻으려면 `getDDMDataProviderContextContributors` 대신 `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderRequest` 및 `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderInstanceSettings` 을 사용하십시오.

#### 이렇게 변경된 이유는 무엇입니까?

`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderContext` 클래스에서 제공하는 모든 데이터는 클래스 `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderRequest` 및 `com에서 찾을 수 있습니다. liferay.dynamic.data.mapping.data.provider.DDMDataProviderInstanceSettings`. 따라서 클래스 `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderContext` 및 `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderContextContributor` 은 더 이상 필요하지 않습니다. `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderContextContributor` 이 Liferay Portal 7.2에서 제거되었습니다.

---------------------------------------

### DDMFormInstanceRecordLocalService에서 메소드 교체

- **날짜:** 2020-7-14
- **JIRA 티켓:** [LPS-81564](https://issues.liferay.com/browse/LPS-81564)

#### 무엇이 바뀌었나요?

이 변경은 `com.liferay.dynamic.data.mapping.service.DDMFormInstanceRecordLocalService`, `com.liferay.dynamic.data.mapping.service.DDMFormInstanceRecordLocalServiceUtil` 및 `com.liferay.dynamic.data.mapping.service에 적용되었습니다. DDMFormInstanceRecordLocalServiceWrapper`:

`getDDMFormValues` 메서드에는 `ddmStorageId` (유형 `long`)라는 단일 매개변수가 있으며 이제 `storageId` ( `ddmStorageId`대체됨) 및 `ddmForm` (유형 `com.liferay.dynamic .data.mapping.model.DDMForm`).

#### 누가 영향을 받습니까?

이것은 대체된 방법을 사용한 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

메소드에서 유형 `com.liferay.dynamic.data.mapping.model.DDMForm` 의 새 매개변수를 전달하십시오.

#### 이렇게 변경된 이유는 무엇입니까?

이 변경 사항은 [LPS-81564](https://issues.liferay.com/browse/LPS-81564) 의 스토리지 어댑터 API 리팩토링의 일부입니다.

---------------------------------------

### DDMStructureService에서 제거된 메서드

- **날짜:** 2020-7-14
- **JIRA 티켓:** [LPS-91760](https://issues.liferay.com/browse/LPS-91760)

#### 무엇이 바뀌었나요?

아래 나열된 메서드는 이러한 클래스 `com.liferay.dynamic.data.mapping.service.DDMStructureService`, `com.liferay.dynamic.data.mapping.service.DDMStructureServiceUtil`및 `com.liferay.dynamic.data에서 제거되었습니다. .mapping.service.DDMStructureServiceWrapper`:

- `addStructure` (매개변수 포함 `long userId`, `long groupId`, `long classNameId`, `Map<Locale, String> nameMap`, `Map<Locale, String> descriptionMap`, `com.liferay.dynamic.data.mapping.model.DDMForm ddmForm`, `com.liferay.dynamic.data.mapping.model.DDMFormLayout ddmFormLayout`, `String storageType`, `com.liferay.portal.kernel.service.ServiceContext serviceContext`)

- `addStructure` (매개변수 포함 `long userId`, `long groupId`, `long classNameId`, `Map<Locale, String> nameMap`, `Map<Locale, String> descriptionMap`, `String xsd`, `com.liferay.portal.kernel.service. 서비스 컨텍스트 서비스 컨텍스트`)

- `addStructure` (매개변수 포함 `long userId`, `long groupId`, `String parentStructureKey`, `long classNameId`, `String structureKey`, `Map<Locale, String> nameMap`, `Map<Locale, String> descriptionMap`, `String xsd`, `문자열 storageType`, `int 유형`, `com.liferay.portal.kernel.service.ServiceContext serviceContext`)

- `addStructure` (매개변수 포함 `long groupId`, `long parentStructureId`, `long classNameId`, `String structureKey`, `Map<Locale, String> nameMap`, `Map<Locale, String> descriptionMap`, `String xsd`, `String storageType`, `정수 유형`, `com.liferay.portal.kernel.service.ServiceContext serviceContext`)

- `addStructure` (매개변수 포함 `long userId`, `long groupId`, `String parentStructureKey`, `long classNameId`, `String structureKey`, `Map<Locale, String> nameMap`, `Map<Locale, String> descriptionMap`, `com.liferay.dynamic .data.mapping.model.DDMForm ddmForm`, `com.liferay.dynamic.data.mapping.model.DDMFormLayout ddmFormLayout`, `문자열 storageType`, `int 유형`, `com.liferay.portal.kernel.service.ServiceContext 서비스 컨텍스트`)

- `updateStructure` (매개변수 포함 `long groupId`, `long parentStructureId`, `long classNameId`, `String structureKey`, `Map<Locale, String> nameMap`, `Map<Locale, String> descriptionMap`, `문자열 정의`, `com.liferay.portal .kernel.service.ServiceContext 서비스 컨텍스트`)

- `updateStructure` (매개변수 `long structureId`, `long parentStructureId`, `Map<Locale, String> nameMap`, `Map<Locale, String> descriptionMap`, `문자열 정의`, `com.liferay.portal.kernel.service.ServiceContext serviceContext`포함)

#### 누가 영향을 받습니까?

이는 제거된 메서드를 사용한 모든 사용자에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

제거된 메서드를 나머지 `개 addStructure` 및 `updateStructure` 메서드 중 하나로 교체합니다.

#### 이렇게 변경된 이유는 무엇입니까?

이러한 방법은 Liferay Portal 7.0에서 더 이상 사용되지 않습니다.

---------------------------------------

### 동적 데이터 매핑 지속성 클래스에서 제거된 메서드

- **날짜:** 2020-7-14
- **JIRA 티켓:** [LPS-91760](https://issues.liferay.com/browse/LPS-91760)

#### 무엇이 바뀌었나요?

메소드 `fetchByPrimaryKeys` 및 `getBadColumnNames` 이 다음 클래스에서 제거되었습니다.

- `com.liferay.dynamic.data.mapping.service.persistence.DDMContentPersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMDataProviderInstancePersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMFormInstancePersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMFormInstanceRecordPersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMFormInstanceVersionPersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMStorageLinkPersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMStructureLayoutPersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMStructurePersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMStructureVersionPersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMTemplatePersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMDataProviderInstanceLinkPersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMFormInstanceRecordVersionPersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMStructureLinkPersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMTemplateLinkPersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMTemplateVersionPersistence`

#### 누가 영향을 받습니까?

이는 제거된 메서드를 사용한 모든 사용자에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

제거된 메서드를 기본 클래스 `com.liferay.portal.kernel.service.persistence.impl.BasePersistenceImpl`에 제공된 해당 메서드로 바꿉니다.

#### 이렇게 변경된 이유는 무엇입니까?

기본 클래스 `com.liferay.portal.kernel.service.persistence.impl.BasePersistenceImpl`에서 제공되는 기본 구현이 있으므로 `fetchByPrimaryKeys` 에 대한 사용자 정의 구현은 필요하지 않습니다.

`getBadColumnNames` 은 인터페이스(예: `com.liferay.dynamic.data.mapping.service.persistence.DDMContentPersistence`)에서 자동으로 제거되고 구현 클래스(예: `com.liferay.dynamic.data.mapping.service)에 보관되었습니다. persistence.impl.DDMContentPersistenceImpl`) Service Builder에서 클래스를 생성한 경우.

---------------------------------------

### 동적 데이터 매핑 유틸리티 클래스에서 제거된 메서드

- **날짜:** 2020-7-14
- **JIRA 티켓:** [LPS-91760](https://issues.liferay.com/browse/LPS-91760)

#### 무엇이 바뀌었나요?

메서드 `getBadColumnNames` 이 다음 클래스에서 제거되었습니다.

- `com.liferay.dynamic.data.mapping.service.persistence.DDMContentUtil`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMDataProviderInstanceUtil`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMFormInstanceRecordUtil`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMFormInstanceUtil`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMFormInstanceVersionUtil`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMStorageLinkUtil`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMStructureLayoutUtil`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMStructureUtil`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMStructureVersionUtil`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMTemplateUtil`

#### 누가 영향을 받습니까?

이는 제거된 메서드를 사용한 모든 사용자에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

제거된 메서드를 기본 클래스 `com.liferay.portal.kernel.service.persistence.impl.BasePersistenceImpl`에 제공된 해당 메서드로 바꿉니다.

#### 이렇게 변경된 이유는 무엇입니까?

`getBadColumnNames` 은 지속성 유틸리티(예: `com.liferay.dynamic.data.mapping.service.persistence.DDMContentUtil`)에서 자동으로 제거되었으며 지속성 구현(예: `com.liferay.dynamic.data.mapping.service)에 보관되었습니다. .persistence.impl.DDMContentPersistenceImpl`) Service Builder에서 클래스를 생성한 경우.

---------------------------------------

### module.framework.properties.felix.fileinstall.\ **포털 속성의 이름을 module.framework.properties.file.install.\** 으로 변경했습니다.

- **날짜:** 2020-Aug-08
- **JIRA 티켓:** [LPS-115016](https://issues.liferay.com/browse/LPS-115016)

#### 무엇이 바뀌었나요?

`module.framework.properties.felix.fileinstall로 시작하는 포털 특성.` 은 `module.framework.properties.file.install로 시작하도록 이름이 변경되었습니다.`.

#### 누가 영향을 받습니까?

이는 `module.framework.properties.felix.fileinstall로 시작하는 포털 속성이 있는 모든 사용자에게 영향을 미칩니다.`.

#### 내 코드를 어떻게 업데이트해야 합니까?

`module.framework.properties.felix.fileinstall로 시작하는 포털 속성의 이름을 바꿉니다.` 은 `module.framework.properties.file.install로 시작합니다.`.

#### 이렇게 변경된 이유는 무엇입니까?

이 변경 사항은 Apache Felix Fileinstall 인라인을 반영합니다. Liferay는 이제 이 기능을 관리하고 유지하므로 속성의 이름이 적절하게 바뀝니다.

---------------------------------------

### buffered.increment.enabled 포털 속성을 대체했습니다.

- **날짜:** 2020-10-21
- **JIRA 티켓:** [LPS-122159](https://issues.liferay.com/browse/LPS-122159)

#### 무엇이 바뀌었나요?

`buffered.increment.enabled` 포털 속성을 사용하여 조회수 관리 활성화 및 비활성화가 `view.count.enabled` 포털 속성을 사용하여 대체되었습니다.

조회수를 전체적으로 활성화 및 비활성화하는 것은 이제 `view.count.enabled` 포털 속성을 사용하여 수행됩니다.

예를 들어 `view.count.enabled[SomeEntity]=false`를 설정하면 특정 엔티티에 대한 조회수 비활성화가 완료됩니다.

#### 누가 영향을 받습니까?

이는 `buffered.increment.enabled=false` 포털 속성 설정이 있는 모든 사용자에게 영향을 미칩니다.

이는 `buffered.increment.enabled[SomeEntity]=false` 포털 속성 설정을 사용하여 일부 엔티티(예: `SomeEntity`)에 대한 조회수를 비활성화한 모든 사람에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

`buffered.increment.enabled=false` 을 `view.count.enabled=false`으로 바꿉니다.

`buffered.increment.enabled[SomeEntity]=false`를 바꿉니다. 여기서 `SomeEntity` 는 조회수를 비활성화하려는 엔티티이고 `view.count.enabled[SomeEntity]=false`입니다.

#### 이렇게 변경된 이유는 무엇입니까?

이렇게 하면 조회수 동작을 쉽게 관리할 수 있습니다.

---------------------------------------

### module.framework.properties.file.install.optionalImportRefreshScope 포털 속성을 제거했습니다.

- **날짜: 2021년 2월 3일** 일
- **JIRA 티켓:** [LPS-122008](https://issues.liferay.com/browse/LPS-122008)

#### 무엇이 바뀌었나요?

`module.framework.properties.file.install.optionalImportRefreshScope` 포털 특성이 제거되었습니다. 이제 파일 설치는 새로 고쳐야 하는 선택적 패키지가 있는 번들을 스캔할 때 항상 관리되는 번들만 확인합니다.

#### 누가 영향을 받습니까?

이는 `module.framework.properties.file.install.optionalImportRefreshScope` 포털 속성을 지정하는 모든 사용자에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

`module.framework.properties.file.install.optionalImportRefreshScope` 특성을 제거하십시오. 다른 동작을 사용하도록 파일 설치를 구성할 수 없습니다.

#### 이렇게 변경된 이유는 무엇입니까?

대체 동작이 바람직한 경우는 거의 없었습니다. 파일 설치는 번들이 Liferay에 설치되는 기본 방법이므로 기본적으로 모든 번들이 관리됩니다. 이 기능을 지원하는 분기 논리를 제거하면 코드 유지 관리 및 가독성이 향상됩니다.

---------------------------------------

### .cfg 파일에 .cfg 형식 사용

- **날짜: 2021년 2월** 일-21일
- **JIRA 티켓:** [LPS-128031](https://issues.liferay.com/browse/LPS-128031)

#### 무엇이 바뀌었나요?

이 변경 전에는 `.cfg` 파일이 `.cfg` 또는 `.config` 형식을 사용할 수 있었습니다. 이제 `.cfg` 구성 파일은 [여기](https://sling.apache.org/documentation/bundles/configuration-installer-factory.html#property-files-cfg) 에 정의된 대로 `.cfg` 형식을 사용해야 합니다.

#### 누가 영향을 받습니까?

이는 `.config` 형식을 사용하는 `.cfg` 파일이 있는 모든 사용자에게 영향을 미칩니다.

#### 내 코드를 어떻게 업데이트해야 합니까?

`.cfg` 파일의 이름을 `.config` 으로 바꾸고 `.config` 형식을 사용하는지 확인하거나 `.cfg` 파일을 `.cfg` 형식을 사용하도록 수정하십시오(위 링크 참조).

#### 이렇게 변경된 이유는 무엇입니까?

Apache의 파일 설치 구현은 `.cfg` 파일이 `.config` 형식을 사용하도록 허용했습니다. 자체 파일 설치 구현을 사용하도록 전환했을 때 유지 관리를 용이하게 하기 위해 보다 엄격한 형식 처리를 하기로 결정했습니다.

---------------------------------------