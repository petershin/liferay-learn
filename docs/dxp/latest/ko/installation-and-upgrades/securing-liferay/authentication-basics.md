# 인증 기본 사항

기본적으로 Liferay DXP는 **로그인** 위젯을 사용하여 사용자를 인증합니다.

```{note}
로그인 위젯은 `http[s]://[server-name:port]/web/guest/home`의 기본 홈 페이지에 나타납니다. 페이지에서 로그인 위젯을 사용할 수 없는 경우 URL `http[s]://[server-name:port]/c/portal/login`을 통해 직접 액세스할 수 있습니다.
```

![기본 Liferay 홈페이지](./authentication-basics/images/01.png)

사용자 및/또는 애플리케이션을 인증하는 다른 방법을 구성할 수 있습니다.

* [LDAP](../../users-and-permissions/connecting-to-a-user-directory/connecting-to-an-ldap-directory.md)
* [SAML](./configuring-sso/authenticating-with-saml/saml-authentication-process-overview.md)
* [Kerberos](./configuring-sso/authenticating-with-kerberos.md)
* [OpenId Connect](./configuring-sso/using-openid-connect.md)
* [토큰 기반 솔루션](./configuring-sso/token-based-authentication.md)
* [OAuth 2.0](../../headless-delivery/using-oauth2.md)

[인증 확인자](./securing-web-services/using-authentication-verifiers.md) 원격 애플리케이션에 대한 인증을 관리할 수 있고 [인증 파이프라인](../../building-applications.md) 하나 이상의 시스템에서 사용자를 검증하는 방법을 정의합니다.

## 인증 유형

다음 세 가지 인증 유형 중 하나를 사용하여 로그인하도록 사용자를 구성할 수 있습니다.

| 입증 유형         | 묘사                     | 기본적으로 사용됩니까? |
|:------------- |:---------------------- |:------------ |
| 사용자 이름        | 계정 생성 시 관리자 또는 사용자가 결정 | 부정           |
| Email.address | 계정 생성 시 관리자 또는 사용자가 결정 | 그렇다          |
| 사용자 아이디       | 계정 생성 시 자동 생성          | 부정           |

```{note}
한 번에 하나의 인증 유형만 사용할 수 있습니다.
```

인증 유형에 관계없이 사용자는 항상 암호를 입력해야 합니다. [암호 정책](../../users-and-permissions/roles-and-permissions/configuring-a-password-policy.md) 생성하여 암호 길이, 암호 형식, 만료 기간 등을 정의할 수 있습니다.

**인증 유형** 은 제어판 또는 속성 파일을 통해 구성할 수 있습니다.

### 제어판을 통한 인증 유형 구성

1. 제어판으로 이동
1. 클릭 **구성** &rarr; **인스턴스 설정** &rarr; **플랫폼** &rarr; **사용자 인증**
1. **사용자는 어떻게 인증합니까? 아래에서 옵션을 선택하십시오.** 선택자.

    ![세 가지 유형의 인증 중에서 선택할 수 있습니다.](./authentication-basics/images/03.png)

### 속성을 사용하여 인증 유형 구성

[문맥 재산](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/reference/portal-properties.html) 파일을 사용하려면 아래 속성을 붙여넣고 원하는 인증 유형의 주석을 제거하십시오.

```properties
company.security.auth.type=emailAddress
#company.security.auth.type=screenName
#company.security.auth.type=userId
```

## 로그인 위젯 사용 및 구성

로그인 위젯은 사용자를 인증하는 다양한 메커니즘(포털 데이터베이스, LDAP 서버, SAML ID 공급자 또는 사용자가 인증할 수 있는 모든 방법)을 호출합니다. 여러 가지 방법으로 동작을 구성하고 사용자 정의할 수 있습니다.

### 게스트 계정 생성 비활성화

게스트 사용자가 새 사용자 계정을 생성하지 못하도록 하려면:

1. 제어판으로 이동 &rarr; **구성** &rarr; **인스턴스 설정** &rarr; **플랫폼** &rarr; **사용자 인증** .
1. 체크 해제 **낯선 사람이 계정을 만들 수 있도록 허용하시겠습니까?** .
1. **저장** 클릭합니다.

    ![이 상자를 선택하지 않으면 게스트는 계정을 만들 수 없습니다.](./authentication-basics/images/04.png)

### 암호 재설정 방지

사용자가 자신의 암호를 재설정할 수 없도록 해야 하는 경우 동일한 화면에서 이를 구성할 수 있습니다.

1. 제어판으로 이동 &rarr; **구성** &rarr; **인스턴스 설정** &rarr; **플랫폼** &rarr; **사용자 인증** .
1. **사용자가 비밀번호 재설정 링크를 요청하도록 허용하시겠습니까?** .
1. **저장** 클릭합니다.

### CAPTCHA 또는 reCAPTCHA 구성

CAPTCHA 또는 reCAPTCHA를 활성화하여 봇이 계정을 생성하고 로그인하지 못하도록 방지합니다.

1. 제어판으로 이동 &rarr; **구성** &rarr; **시스템 설정** &rarr; **보안 도구** &rarr; **CAPTCHA** .

    ![CAPTCHA는 기본적으로 활성화되어 있습니다.](./authentication-basics/images/02.png)

    ```{note}
    기본적으로 *계정 CAPTCHA 만들기* 및 *암호 CAPTCHA 보내기*가 활성화되어 있습니다. 필요한 경우 메시지 보드 CAPTCHA를 활성화합니다.
    ```

1. CAPTCHA 엔진을 선택합니다. 기본적으로 단순 CAPTCHA는 활성화되어 있습니다. 외부 서비스를 별도로 구성해야 하는 Google의 reCAPTCHA를 선택할 수도 있습니다. reCAPTCHA를 선택한 경우 Google의 공개 및 비공개 키를 제공하세요.
1. 다른 옵션을 사용하면 개발자가 Simple CAPTCHA 엔진을 사용자 정의할 수 있습니다.
1. 완료되면 **저장** 클릭합니다.

## 관련 주제

* [라이프레이 확보](../securing-liferay.md)
* [보안 웹 서비스 소개](./securing-web-services.md)
* [비밀번호 정책 구성](../../users-and-permissions/roles-and-permissions/configuring-a-password-policy.md)
