# Liferay 클라우드와 함께 SSO 사용

고객은 SAML 2.0 호환 싱글 사인온 ID 공급자를 사용하여 Liferay 클라우드 플랫폼에 대해 사용자를 인증할 수 있습니다. 이 문서는 이 통합을 가능하게 하는 프로세스를 자세히 설명합니다.

SAML을 사용하여 SSO를 실행하려면 클라이언트, 서비스 공급자(SP) 및 ID 공급자(IdP)의 세 가지 에이전트가 필요합니다. 클라이언트가 서비스 공급자에 연결을 시도하면 서비스 공급자는 클라이언트를 아이덴티티 공급자로 리디렉션합니다. 아이덴티티 공급자가 클라이언트를 인증한 후 아이덴티티 공급자는 클라이언트 자격 증명에 대한 액세스 권한을 서비스 공급자에게 부여합니다.

이 시나리오에서 Liferay Cloud는 서비스 공급자로 작동하고 Liferay Cloud에 로그인하려는 고객은 클라이언트이며 ID 공급자는 고객이 관리하는 엔터프라이즈 디렉토리 솔루션입니다.

## Liferay 클라우드 프로젝트에 대해 SSO 활성화

Liferay Cloud 프로젝트에 대해 SSO를 활성화하려면 다음 단계를 수행해야 합니다.

1. [Liferay Cloud 팀에 IdP 메타데이터 제공](#provide-identity-provider-metadata-to-the-liferay-cloud-team)
1. [Liferay Cloud 팀은 제공된 IdP 데이터를 가져오고 서비스 공급자(SP) 메타데이터를 제공합니다.](#liferay-cloud-team-imports-provided-idp-data-and-provides-service-provider-metadata)
1. [Liferay Cloud 팀에서 제공하는 SP 메타데이터 가져오기](#import-sp-metadata-provided-by-the-liferay-cloud-team)

### Liferay Cloud 팀에 ID 제공자 메타데이터 제공

Liferay Cloud 프로젝트에 SSO를 활성화하려는 고객은 다음 정보를 포함해야 하는 **IdP** 시스템의 메타데이터를 제공해야 합니다.

| 분야                                  | 묘사                                                                                                                               |
|:----------------------------------- |:-------------------------------------------------------------------------------------------------------------------------------- |
| IdP 발급자                             | ID 발급자의 이름 일반적으로 `EntityDescriptor` 메타데이터의 `EntityID` 속성                                                                         |
| IdP 싱글 사인온 URL                      | SAML 인증 요청을 수신할 요청 엔드포인트(예: `<http://adfs.customer.com/saml/sso)>`                                                         |
| IdP 서명 인증서                          | SAML 메시지 및 어설션 서명에 대한 IdP의 공개 키 인증서                                                                                              |
| IdP Single Sign-On HTTP 메서드(요청 바인딩) | 인증 요청을 수신하기 위해 고객의 ID 공급자가 지원하는 HTTP 메서드입니다. 유일한 유효한 답변은 `POST` (기본값) 및 `GET`입니다.                                                |
| 서명 요청                               | 고객의 ID 공급자에게 보낸 SAML 요청에 서명해야 하는 경우 `으로 설정하고 참` 로 설정합니다. 그렇지 않으면 `로 설정 FALSE`                                                    |
| 요청 서명 알고리즘(RSA)                     | `Sign Requests` 이 `TRUE`으로 설정된 경우 요청 서명에 사용되는 알고리즘을 제공하십시오. 현재 SHA-1(권장하지 않음) 및 SHA-256을 지원합니다. 요청 서명이 비활성화된 경우 이 구성은 필요하지 않습니다. |

#### ADFS 관련 정보

Microsoft ADFS를 사용하는 클라이언트는 SAML을 사용하여 SSO를 설정하는 데 필요한 다음 설정에 주의해야 합니다.

| 분야             | 묘사                                                                               |
|:-------------- |:-------------------------------------------------------------------------------- |
| IdP 발급자 URI    | 일반 탭의 **페더레이션 서비스 식별자** 에 있으며 기본값은 `<http://domain/adfs/services/trust>`입니다. |
| IdP 싱글 사인온 URL | 기본 설정은 `/adfs/ls`입니다. 예: `<http://adfs.example.com/adfs/ls/>`              |
| IdP 서명 인증서     | DER로 인코딩된 바이너리 X.509 인증서 파일                                                      |

IdP 메타데이터가 생성되면 [Liferay Cloud 팀과 티켓을 엽니다](https://help.liferay.com/hc/) . IdP 메타데이터는 XML 파일 또는 URL 엔드포인트(`<https://localhost:8080/c/saml/metadata>` 가 기본 예임)의 형태로 전송될 수 있습니다.

### Liferay Cloud 팀은 제공된 IdP 데이터를 가져오고 서비스 공급자 메타데이터를 제공합니다.

Liferay Cloud 팀은 클라이언트에게 다음 SP 메타데이터 값을 제공합니다.

| 분야                   | 묘사                                                                            |
|:-------------------- |:----------------------------------------------------------------------------- |
| 어설션 소비자 서비스(ACS) URL | Liferay Cloud에서 받은 SAML 응답입니다. 이것은 항상 <https://auth.liferay.cloud>의 주소 서버입니다. |
| 잠재고객 URL             | 고객의 ID 공급자에 액세스하는 데 사용되는 URL Liferay Cloud                                    |

### Liferay Cloud 팀에서 제공하는 SP 메타데이터 가져오기

SP 메타데이터가 Liferay Cloud 팀으로부터 수신되면 IdP에 SP 메타데이터 값을 입력합니다.

## SSO 사용

SSO가 활성화되면 적절한 ID 공급자가 있는 사용자는 이를 사용하여 인증할 수 있습니다.

```{warning}
사용자가 처음으로 SSO로 인증하면 해당 사용자 계정이 변경되며 이후부터 SSO를 사용하여 인증해야 합니다.
```

SSO를 사용하여 Liferay Cloud에 로그인하려면:

1. <https://console.liferay.cloud/login>로 이동합니다.
1. **SSO를 통한 로그인** 을 클릭합니다.

   ![로그인 페이지](./using-sso-with-liferay-cloud/images/01.png)

1. **조직 ID** 필드에 **회사 이름** 을 입력합니다.
1. **계속** 을 클릭합니다.

    ```{note}
    조직의 SSO에서 이미 인증한 경우 다음 단계를 진행할 필요가 없습니다.
    ```

1. **이메일 주소** 필드에 **이메일 주소** 을 입력합니다. 이것은 회사의 데이터베이스 또는 디렉토리 서비스(예: LDAP 또는 ADFS)에 저장된 동일한 이메일 주소여야 합니다.
1. **비밀번호** 필드에 **비밀번호** 을 입력합니다. 이것은 회사의 데이터베이스 또는 디렉터리 서비스에 저장된 이메일 주소와 연결된 동일한 암호여야 합니다.
1. **로그인** 을 클릭합니다.

로그인하면 사용자는 자신의 모든 프로젝트와 환경을 볼 수 있습니다.

![프로젝트 페이지](./using-sso-with-liferay-cloud/images/02.png)
