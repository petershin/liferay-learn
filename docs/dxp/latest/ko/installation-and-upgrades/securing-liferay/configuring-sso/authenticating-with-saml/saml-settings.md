# SAML 설정

서비스 공급자와 아이덴티티 공급자 구성 모두에 동일한 필드가 많이 나타납니다. 다음은 참조입니다.

**이름:** SP 또는 IdP의 이름을 지정합니다. 이것은 설명적인 이름일 뿐입니다. 구성에서는 사용되지 않습니다.

**엔터티 ID:** 이 SP 또는 IdP의 공식 이름입니다. 연결을 구성할 때 이 이름과 일치해야 합니다.

**활성화됨:** 이 SAML 공급자를 활성화하려면 이 상자를 선택합니다.

**Clock Skew:** SP와 IdP 간의 시간 차이에 대한 허용 오차를 밀리초 단위로 설정합니다.

**강제 인증:** 서비스 제공자가 사용자를 확인하기 전에 아이덴티티 제공자에게 사용자 재인증을 요청하도록 하려면 이 상자를 선택하십시오.

**알 수 없는 사용자는 낯선 사람입니다:** 낯선 사람 행동은 제어판 -> 인스턴스 설정 -> 플랫폼 -> 사용자 인증 -> 일반에서 정의됩니다.

**메타데이터:** 서비스 제공자 메타데이터 XML 파일에 대한 URL을 제공하거나 서비스 제공자 메타데이터 XML 파일을 수동으로 업로드합니다. URL을 제공하면 XML 파일이 검색되고 업데이트를 위해 주기적으로 폴링됩니다. 업데이트 간격은 초 수를 지정하는 런타임 메타데이터 새로 고침 간격( `구성` 파일을 사용하는 경우`saml.metadata.refresh.interval` ) 속성을 사용하여 시스템 설정에서 구성할 수 있습니다. URL로 메타데이터 XML 파일 가져오기에 실패하면 서비스 공급자 연결을 활성화할 수 없습니다. ID 공급자 서버가 URL을 통해 메타데이터에 액세스할 수 없는 경우 XML 파일을 수동으로 업로드할 수 있습니다. 이 경우 메타데이터 XML 파일은 자동으로 업데이트되지 않습니다.

**이름 식별자:** [SAML 사양](http://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf) 의 섹션 8.3에 있는 사용 가능한 옵션에서 이름 식별자 형식을 선택합니다. 서비스 제공자가 받을 것으로 예상하는 것에 따라 이것을 설정하십시오. Liferay 서비스 공급자의 경우 이메일 주소 이외의 선택 항목은 이름 식별자가 화면 이름을 참조함을 나타냅니다. 형식은 Liferay ID 공급자에게 특별한 의미가 없습니다. `NameID` 값은 이름 식별자 속성에 의해 정의됩니다.

**사용자 해결:** 일치하지 않음, 이름 ID 형식에 따라 동적으로 선택된 사용자 필드 일치 또는 특정 SAML 속성 매핑을 사용하여 일치 중에서 선택합니다. 이 알고리즘은 사용자를 찾거나 프로비저닝하는 방법을 결정합니다. 예를 들어 이름 ID 형식을 기반으로 선택하고 이름 ID 형식이 이메일 주소인 경우 알고리즘은 이메일 주소로 일치합니다.

**속성 매핑:** Liferay에서 필드를 선택하여 SAML 속성과 일치시킵니다. Liferay의 사용자 개체 또는 사용자 개체에 대해 만든 사용자 정의 필드에서 여러 필드를 선택할 수 있습니다. 이러한 속성은 사용자가 시스템에 로그인할 때 SAML 어설션에서 업데이트됩니다. 기본적으로 `NameID` 및 Service Provider는 `emailAddress` 이 적어도 한 번 일치된 후에 사용자에게 바인딩됩니다. 사용자 매칭을 수행하기 전에 Binding이 선호되고 확인되므로 이메일 주소가 변경된 사용자는 로그인 권한을 잃지 않으며 SAML 속성 매핑을 통해 이메일 주소를 수정할 수 있습니다.

**Keep Alive:** 사용자가 Liferay IdP를 통해 여러 Liferay SP 인스턴스에 로그인한 경우 브라우저 창을 열어 두는 한 세션을 활성 상태로 유지할 수 있습니다. SP가 Liferay DXP인 경우에만 구성합니다. URL은 `https://[SP 호스트 이름]/c/portal/saml/keep_alive`입니다.

## OSGi 구성 속성

[OSGi 구성 파일](../../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md) 을 통해 그리고 메타데이터 XML을 업로드하여 UI 외부에서 SAML을 구성하여 연결 협상 방법을 구성할 수 있습니다.

앞서 언급했듯이 SP 연결 구성과 관련된 모든 작업은 구성이 Liferay의 데이터베이스에 저장되는 SAML Admin UI를 통해 수행되어야 합니다.

```{note}
OSGi `.config` 파일 또는 Liferay DXP의 시스템 설정 제어판 응용 프로그램을 사용하여 SAML 공급자(IdP 또는 SP)를 구성하지 마십시오. 시스템 설정 UI는 자동으로 생성되며 고급 관리자용입니다. SAML Admin UI가 수행하는 필드에 대해 향상된 유효성 검사를 수행하지 않으므로 관리자가 잘못된 구성을 생성할 수 있습니다.
```

이는 OSGi 구성 관리자를 통해 관리할 수 있는 포털 인스턴스 범위 구성입니다. 영향을 받는 속성은 `SAMLProviderConfiguration` 메타 유형의 속성입니다.

* `keyStoreCredentialPassword()`
* `keyStoreEncryptionCredentialPassword()`
* `assertionSignatureRequired()`
* `authnRequestSignatureRequired()`
* `clockSkew()`
* `defaultAssertionLifetime()`
* `entityId()`
* `enabled()`
* `ldapImportEnabled`
* `role()`
* `sessionMaximumAge`
* `sessionTimeout()`
* `signAuthnRequest()`
* `signMetadata()`
* `sslRequired()`
* `allowShowingTheLoginPortlet()`

SAML Admin UI는 포털 인스턴스 범위 구성 인스턴스를 생성하기 위한 장소로 남아 있습니다.

`SamlConfiguration` 메타 유형으로 표시되는 시스템 전체 구성도 있습니다.

Liferay 6.2를 사용한 경우 다음 시스템 전체 속성이 제거되었습니다.

* `saml.metadata.paths` (SP 연결 기본값을 제거한 후 아무 소용 없음)
* `saml.runtime.metadata.max.refresh.delay`
* `saml.runtime.metadata.min.refresh.delay`

후자의 두 속성은 단일 속성 `com.liferay.saml.runtime.configuration.SamlConfiguration.getMetadataRefreshInterval()`로 대체되었습니다.

또한 *SAML KeyStoreManager 구현 구성* in *제어판* &rarr; *시스템 설정* &rarr; 보안 &rarr; SSO의 도입에 유의하십시오. 이 구성에 대한 옵션은 위의 [시스템 수준에서 SAML 구성](./configuring-saml-at-the-system-level.md)에 설명되어 있습니다.

최신 버전에서는 `SHA256` 이 구성 및 키 생성에 사용되는 기본 암호화 알고리즘입니다. 기본 구성은 `SHA256`, `SHA384`, `SHA512` 를 시도한 다음 `SHA1`로 폴백합니다. `SHA1` 은 잠재적으로 취약하기 때문에 다음 속성을 사용하여 블랙리스트에 올릴 수 있습니다.

```properties
blacklisted.algorithms=["blacklisted_algorithm_url", "another_blacklisted_algorithm_url"]
```

따라서 `SHA1`을 블랙리스트에 추가하려면 다음과 같은 구성이 필요합니다.

```properties
blacklisted.algorithms=["http://www.w3.org/2000/09/xmldsig#sha1"]
```

다음 이름으로 구성 파일에 배치합니다.

```bash
com.liferay.saml.opensaml.integration.internal.bootstrap.SecurityConfigurationBootstrap.config
```

메타데이터 XML을 구성하면 연결이 협상되는 방식이 훨씬 더 세분화됩니다.

## metadata.xml을 통한 협상 구성

기본 협상 구성이 작동하지 않는 경우 고유한 구성을 만들어 업로드할 수 있습니다. 이 작업을 수행하기 전에 호스트의 메타데이터 URL을 방문하고 나중에 필요할 경우를 대비하여 구성 사본을 저장하십시오.

```
http://[hostname]/c/portal/saml/metadata
```

예를 들어 `SHA1`만 지원하는 레거시 IdP에 연결할 수 없는 경우 다른 알고리즘을 비활성화하는 구성을 업로드할 수 있습니다.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<md:EntityDescriptor xmlns:md="urn:oasis:names:tc:SAML:2.0:metadata" entityID="samlidp">
  <md:IDPSSODescriptor WantAuthnRequestsSigned="true" protocolSupportEnumeration="urn:oasis:names:tc:SAML:2.0:protocol">
    <md:Extensions>
      <alg:SigningMethod xmlns:alg="urn:oasis:names:tc:SAML:metadata:algsupport" Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1"/>
    </md:Extensions>
    <md:KeyDescriptor use="signing">
      <ds:KeyInfo xmlns:ds="http://www.w3.org/2000/09/xmldsig#">
        <ds:X509Data>
          <ds:X509Certificate>... omitted ...</ds:X509Certificate>
        </ds:X509Data>
      </ds:KeyInfo>
    </md:KeyDescriptor>
    <md:SingleLogoutService Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST" Location="http://localhost:8080/c/portal/saml/slo"/>
    <md:SingleLogoutService Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect" Location="http://localhost:8080/c/portal/saml/slo"/>
    <md:SingleSignOnService Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect" Location="http://localhost:8080/c/portal/saml/sso"/>
    <md:SingleSignOnService Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST" Location="http://localhost:8080/c/portal/saml/sso"/>
  </md:IDPSSODescriptor>
</md:EntityDescriptor>
```

위의 구성에서 `<md:Extensions>` 블록에는 하나의 서명 알고리즘( `SHA1`)만 있습니다.

```{note}
기본 구성은 'SHA1'로 대체되므로 레거시 시스템이 대체 메커니즘을 통해 협상할 수 없는 경우가 아니면 이 작업을 수행할 필요가 없습니다. 또한 `SHA1`을 블랙리스트에 올린 경우 작동하지 않습니다. [SHA1의 취약성](https://en.wikipedia.org/wiki/SHA-1) 으로 인해 가능하면 모두 사용하지 않는 것이 좋습니다.
```

메타데이터 구성을 변경한 경우 변경하기 전에 저장했다면 기본 구성으로 돌아갈 수 있습니다. 그렇지 않은 경우 피어의 메타데이터 구성 중 하나에 업로드된 XML 파일 대신 URL을 제공할 수 있습니다.
