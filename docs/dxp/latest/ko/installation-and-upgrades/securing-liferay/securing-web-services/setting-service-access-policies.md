# 서비스 액세스 정책 설정

*서비스 액세스 정책*은 원격으로 호출할 수 있는 서비스 또는 서비스 방법을 정의합니다. 한 번에 여러 가지를 적용하여 결합된 효과를 낼 수 있습니다. 웹 서비스에 대한 [두 번째 보안 계층](../securing-web-services.md)(IP 권한 다음)입니다. 사용자 지정 서비스 액세스 정책은 포털 관리자가 만들 수 있습니다. 포털의 토큰 인증자(OAuth 2)에 의해 적용됩니다.

서비스 액세스 정책은 웹 서비스 호출을 통해 노출되는 메서드에 대한 화이트리스트를 정의합니다. 와일드카드를 사용하여 화이트리스트에 포함된 클래스 및 메서드를 정의할 수 있습니다. 서비스 액세스 정책은 권한 시스템을 준수합니다. 정책이 사용자에게 원격 서비스에 대한 액세스 권한을 부여하는 경우 해당 사용자는 여전히 해당 서비스를 호출할 수 있는 적절한 권한이 있어야 합니다.

## 기본 서비스 액세스 정책

서비스 액세스 정책을 보고 관리하려면 *제어판* &rarr; *구성* &rarr; *서비스 액세스 정책*로 이동하십시오.

![서비스 액세스 정책 보기](./setting-service-access-policies/images/01.png)

기본적으로 활성화된 12개의 서비스 액세스 정책이 있습니다. 이 중 다섯 가지는 시스템과 관련이 있습니다.

| 서비스 접근 정책                   | 묘사                                                                                                                                                                                                                                                                             | 기본으로 활성됨 |
|:--------------------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |:-------- |
| **ASSET_ENTRY_DEFAULT**   | 자산을 검색할 때 자산에 대한 보기 카운터를 업데이트할 수 있습니다.                                                                                                                                                                                                                                         | &#10004; |
| **AUTHORIZED_OAUTH2_SAP** | OAuth 2에서 승인한 모든 REST 요청을 허용합니다.                                                                                                                                                                                                                                               | &#10004; |
| **캘린더_기본값**                 | 캘린더에서 공개 이벤트를 검색할 수 있습니다.                                                                                                                                                                                                                                                      | &#10004; |
| **시스템_기본값**                 | JavaScript 호출로 국가/지역 서비스에 액세스할 수 있으므로 사용자가 즉시 언어를 전환할 수 있습니다. 인증되지 않은 요청을 포함한 모든 요청에 적용됩니다.                                                                                                                                                                                    | &#10004; |
| **SYSTEM_USER_PASSWORD**  | 모든 메서드를 호출할 수 있습니다. 물론 API 기능에는 권한 확인이 포함되어 있으므로 이 호출은 사용자에게 필요한 권한이 있는 경우에만 작동합니다. `AuthVerifierResult.isPasswordBasedAuthentication` 이 `true`인 요청에 적용됩니다. 즉, 암호를 사용하여 사용자 인증이 발생할 때마다. 특정 API 기능이 호출되는 것을 완전히 금지하려면 `SYSTEM_USER_PASSWORD` 정책을 `*`보다 더 제한적인 정책으로 변경할 수 있습니다. | &#10004; |




```{note}
'SYSTEM_DEFAULT' 및 'Default'가 'Yes'로 구성된 기타 정책은 인증되지 않은 요청을 포함하여 들어오는 모든 요청에 적용됩니다.
```


다른 7가지 정책은 OAuth 및 JSON 웹 서비스와 관련이 있습니다.

| 서비스 접근 정책                              | 묘사                                                                                                                                                                                                                   | 기본으로 활성됨 |
|:-------------------------------------- |:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |:-------- |
| **OAUTH2_analytics.읽기/쓰기**             | [Liferay Analytics Cloud](https://www.liferay.com/products/analytics-cloud)과 통합되어 JSON 웹 서비스에 액세스할 수 있습니다.                                                                                                           | &#10004; |
| **OAUTH2_everything/읽기/문서/사용자 프로필/쓰기** | Everything 정책은 다양한 이유로 모든 JSON 웹 서비스에 대한 액세스 권한을 부여합니다. 모든 것이 전부입니다: 모든 JSON 웹 서비스( `*`일치). 나머지는 해당 설명에 적합한 메서드 서명과 일치합니다. 예를 들어 OAUTH2_everything.read는 `fetch`, `get`, `has`, `is`또는 `search`로 시작하는 모든 메서드와 일치합니다. | &#10004; |


기본 구성은 시스템과 함께 제공되는 모든 웹 서비스에 대한 액세스를 제공하는 해당 범위를 사용할 수 있도록 합니다. 범위는 사용할 수 있게 되기 전에 OAuth 1 또는 2 애플리케이션에 할당되어야 합니다. 관리자는 사용하려는 것을 검토하고 나머지는 비활성화해야 합니다.



## 서비스 액세스 정책 이해

서비스 액세스 정책을 생성하거나 편집할 때 다음 사항에 유의하십시오.

* 서비스 액세스 정책 이름은 포털 인스턴스별로 고유해야 합니다.
* 서비스 액세스 정책 이름에는 허용되는 다음 문자만 포함될 수 있습니다. 
  
  

    ```
    0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz#:@-./_
    ```


* 서비스 액세스 정책 제목은 현지화할 수 있습니다. 서비스 액세스 정책 이름은 현지화할 수 없습니다.

* 허용되는 서비스 서명은 한 줄에 하나씩 입력해야 합니다. 와일드카드(`*`)는 클래스 이름과 메서드 이름 모두에 허용됩니다. 클래스 이름과 메서드 이름을 구분하려면 `#` 기호를 사용해야 합니다.

예를 들어 `com.liferay.portal.kernel.service.UserService` 은 `UserService` 클래스의 모든 메서드를 호출할 수 있도록 합니다. `com.liferay.document.library.kernel.service.DLAppService#get*` 은 `get` 로 시작하는 `DLAppService` 의 모든 메서드가 호출되도록 허용합니다.

다음 예에서는 `UserService` 클래스의 모든 메서드를 호출하고 이름이 `get` 로 시작하는 `DLAppService` 의 모든 메서드를 호출하도록 허용합니다.

```
com.liferay.portal.kernel.service.UserService
com.liferay.document.library.kernel.service.DLAppService#get*
```

## 서비스 액세스 정책 생성

새 서비스 액세스 정책을 생성하려면:

1. 제어판의 *구성* &rarr; *서비스 액세스 정책* 섹션으로 이동합니다.
1. *추가* (![add](../../../images/icon-add.png))을 클릭합니다.
1. 정책에 이름을 지정하십시오.
1. *활성화* 토글을 전환하여 정책을 활성화합니다.
1. 인증되지 않은 요청과 인증된 요청에 정책을 적용하려면 *기본값*토글을 전환합니다.
1. 정책에 현지화된 제목을 지정하십시오.
1. _Allowed Service Signatures_아래에 설치된 서비스 클래스의 완전한 이름을 입력하십시오.
1. 메서드 이름에서 서비스 메서드 호출 입력을 시작합니다. 

    ```{note}
    코드 완성은 `Service Class` 및 `Method Name` 필드 모두에 사용할 수 있습니다.
    ```

1. 다른 서비스나 방법을 지정하려면 더하기 아이콘을 클릭하여 다른 항목을 추가하십시오.

1. 완료되면 *저장*을 클릭합니다.

```{tip}
모든 메서드 서명을 미리 알고 있는 경우 *고급 모드로 전환*을 클릭하고 별도의 줄에 있는 한 필드에 모두 입력할 수 있습니다.
```

<!-- The following two paragraphs feel out of place; not sure where they should go. -->
Liferay 애플리케이션은 자체 기본 정책을 선언할 수 있습니다. 그런 다음 관리자가 이 정책을 변경하거나 비활성화할 수 있습니다. 이 경우 플러그인은 여전히 정책이 존재하는지 확인할 수 있으므로 재정의하거나 업데이트할 필요가 없습니다.

기본적으로 Liferay의 터널링 서블릿은 `SYSTEM_USER_PASSWORD` 서비스 액세스 정책을 사용합니다. 그러나 터널링 서블릿에 대한 자체 정책을 생성하고 속성 `service.access.policy.name` 을 `TunnelingServletAuthVerifier` 에 사용하여 정책을 대신 사용하도록 지정할 수 있습니다.

## 서비스 액세스 정책 모듈 이해

Liferay의 서비스 액세스 정책 기능은 서비스 액세스 정책 모듈에서 제공합니다. 이 모듈에는 다음과 같은 중요한 클래스가 포함되어 있습니다.

* `com.liferay.portal.kernel.security.service.access.policy.ServiceAccessPolicy`: `ServiceAccessPolicy`에 대한 공용 인터페이스를 정의합니다.
* `com.liferay.portal.kernel.security.service.access.policy.ServiceAccessPolicyManager`: `ServiceAccessPolicy`의 인스턴스를 검색하기 위한 공용 인터페이스를 정의합니다.
* `com.liferay.portal.kernel.security.service.access.policy.ServiceAccessPolicyManagerUtil`: 서비스 액세스 정책 기능을 아직 모듈화되지 않은 Liferay 코어 부분에 연결합니다.
* `com.liferay.portal.kernel.security.service.access.policy.ServiceAccessPolicyThreadLocal`: `ServiceAccessPolicy` 인스턴스를 활성화합니다.

Liferay의 서비스 액세스 정책 모듈은 소스 코드의 `module/apps/service-access-policy` 폴더에 있습니다. 실행할 때 이 세 번들은 서비스 액세스 정책 기능을 제공합니다( `[Liferay Home]/osgi/modules` 폴더에 있음).

* `com.liferay.service.access.policy.api.jar`
* `com.liferay.service.access.policy.service.jar`
* `com.liferay.service.access.policy.web.jar`

이러한 모듈은 제어판에서 액세스할 수 있는 서비스 액세스 정책 관리 UI를 제공합니다. 또한 `ServiceAccessPolicy`에 대한 인터페이스 및 기본 구현을 제공합니다.

## 서비스 액세스 정책 모듈 구성

1. _제어판_ &rarr; _시스템 설정_ &rarr; _API 인증_으로 이동합니다.
   
   ![서비스 액세스 정책 모듈 사이트](./setting-service-access-policies/images/02.png)

1. 보안 섹션에서 _서비스 액세스 정책_ 모듈을 클릭합니다. 이름을 클릭하여 편집하십시오.

1. 기본 서비스 액세스 정책 구성을 편집할 수 있습니다. 또한 `AuthVerifier`에 의해 정책이 적용되지 않은 경우에도 기본 정책을 강제로 적용할 수 있습니다.

`AuthenticatedAccessControlPolicy`도 있습니다. 이 정책은 `ServiceAccessPolicyManager` 구현이 있는 경우 아무 작업도 수행하지 않습니다. 그러나 서비스 액세스 정책 모듈이 비활성화된 경우 `AuthenticatedAccessControlPolicy` 은 여전히 웹 서비스에 대해 인증된 액세스가 필요한 폴백을 제공합니다.
