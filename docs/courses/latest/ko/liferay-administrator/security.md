---
toc:
  - ./tuning-security-settings/authentication.md
  - ./tuning-security-settings/securing-web-services.md
  - ./tuning-security-settings/authorizing-and-single-sign-on.md
  - ./tuning-security-settings/managing-antisamy.md
---
# 보안

Liferay의 철학은 "기본적으로 안전하다"입니다. 이는 기본 설치 구성이 즉시 안전하다는 것을 의미합니다. 그러나 보안을 요구 사항에 더 가깝게 조정하는 방법에는 여러 가지가 있습니다. 이러한 방법은 여러 범주로 나뉩니다.

- 인증
- 웹 서비스 보안
- 싱글 사인온(SSO)
- 안티사미

기본값을 고수하는 대신 조직의 디자인에 더 잘 맞도록 이러한 각 범주를 조정할 수 있습니다. 여기에서는 Clarity Vision Solutions의 요구 사항에 맞게 Liferay 설치를 구성합니다.

먼저 사용자가 시스템에 로그온하는 방법을 구성합니다. 그런 다음 기본적으로 구성된 인증 확인자를 조정합니다. 그런 다음 다단계 인증을 활성화합니다.

인증을 구성한 후에는 웹 서비스 보안으로 이동합니다. 제품과 함께 제공되는 서비스 액세스 정책을 조정하고 문서 및 미디어의 이미지에 대해 CORS(교차 원본 리소스 공유)를 활성화합니다.

그런 다음 Single Sign-On을 살펴보고 사용자가 Liferay를 사용하여 여러 시스템에 로그인할 수 있도록 SAML(보안 주장 마크업 언어)을 구성합니다. 마지막으로 OAuth 2를 사용하여 앱 승인을 구성합니다.

구성할 마지막 기능은 HTML 또는 CSS만 허용되는 사이트에 JavaScript 코드를 삽입하려는 사용자로부터 설치를 보호하기 위한 [AntiSamy](https://owasp.org/www-project-antisamy) 살균제입니다.

이 주제에서는 Liferay의 다양한 보안 기능을 둘러볼 수 있습니다. 자세히 알아보려면 Liferay Learn에서 [라이프레이 확보](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay) 를 검토하세요.

준비가 된?

[가자!](./tuning-security-settings/authentication.md)
