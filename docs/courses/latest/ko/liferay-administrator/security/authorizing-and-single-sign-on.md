---
toc:
  - ./authorizing-and-single-sign-on/authenticating-with-saml.md
  - ./authorizing-and-single-sign-on/authorizing-with-oauth2.md
---
# 승인 및 Single Sign-On

인증과 승인은 동전의 양면과 같습니다. 인증은 제공된 자격 증명이 시스템에 저장된 자격 증명과 일치하는지 확인합니다. 승인은 이미 발생한 인증에 따라 리소스에 대한 액세스 권한을 부여합니다. 여기에서는 Liferay가 다른 시스템에서 오는 자격 증명을 통해 사용자를 인증하는 방법에 대해 알아보고 Liferay가 [OAuth 2](https://oauth.net/2/) 를 사용하여 리소스에 대한 액세스 권한을 부여하는 방법에 대해 알아봅니다. 사용자를 대신하여.

Liferay는 레거시 시스템용 구식 토큰 기반, Open AM, CAS, OpenID Connect, Kerberos 및 SAML(Security Assertion Markup Language)과 같은 Single Sign-On을 위한 다양한 엔터프라이즈 옵션을 제공합니다. 대부분의 조직과 마찬가지로 Clarity Vision Solutions는 이를 모두 사용하지 않으므로 여기서는 SAML에 중점을 둡니다. [싱글 사인온 구성](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/configuring-sso) 에서 다른 모든 옵션에 대해 알아볼 수 있습니다.

Liferay는 업계 표준 OAuth 2.0에서 제공하는 토큰 교환 프로토콜을 통해 리소스에 대한 액세스 권한을 부여할 수도 있습니다. 여기에서는 웹 클라이언트, 모바일 앱 또는 헤드리스 마이크로서비스를 사용하는 사용자에게 Liferay에 저장된 리소스에 대한 액세스 권한을 부여하도록 OAuth 2 프로필을 구성하는 방법을 알아봅니다.

[SAML로 인증](./authorizing-and-single-sign-on/authenticating-with-saml.md)으로 시작하세요.
