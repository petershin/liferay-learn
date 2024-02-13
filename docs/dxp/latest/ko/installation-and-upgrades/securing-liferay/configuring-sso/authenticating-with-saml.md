---
toc:
  - ./authenticating-with-saml/saml-authentication-process-overview.md
  - ./authenticating-with-saml/configuring-saml-at-the-system-level.md
  - ./authenticating-with-saml/saml-admin.md
  - ./authenticating-with-saml/importing-user-groups-memberships-from-an-external-idp-through-saml.md
  - ./authenticating-with-saml/configuring-saml-at-the-instance-level.md
  - ./authenticating-with-saml/saml-settings.md
---
# SAML로 인증

SAML(Security Assertion Markup Language) 어댑터는 배포에서 SSO(Single Sign On) 및 SLO(Single Log Off)를 제공합니다. SAML은 ID 공급자(IdP) 및 서비스 공급자(SP)를 사용하여 작동합니다.

**ID 공급자:** 사용자가 다른 웹사이트에 액세스할 수 있도록 싱글 사인온을 제공하는 신뢰할 수 있는 시스템입니다.

**서비스 공급자:** 응용 프로그램을 호스팅하고 적절한 자격 증명을 가진 식별된 사용자에게만 액세스 권한을 부여하는 웹 사이트입니다.

Liferay DXP 인스턴스는 서비스 공급자(SP) 또는 ID 공급자(IdP) 역할을 할 수 있습니다.

```{note}
단일 Liferay DXP 인스턴스는 SSO 설정에서 SP 또는 IdP *하나*입니다. 둘 다일 수는 없습니다. 그러나 두 가지 용도로 별도의 인스턴스를 사용할 수 있습니다(예: 한 인스턴스는 SP이고 다른 인스턴스는 IdP임).
```

SAML 구성으로 바로 이동하거나 작동 방식을 알아볼 수 있습니다.

* [SAML 인증 프로세스 개요](./authenticating-with-saml/saml-authentication-process-overview.md)
* [시스템 수준에서 SAML 구성](./authenticating-with-saml/configuring-saml-at-the-system-level.md)
* [SAML 관리자](./authenticating-with-saml/saml-admin.md)
* [SAML을 통해 외부 IdP에서 사용자 그룹의 구성원 자격 가져오기](./authenticating-with-saml/importing-user-groups-memberships-from-an-external-idp-through-saml.md)
* [인스턴스 수준에서 SAML 구성](./authenticating-with-saml/configuring-saml-at-the-instance-level.md)
* [SAML 구성 참조](./authenticating-with-saml/saml-settings.md)
