---
toc:
  - ./configuration-client-extensions/oauth-user-agent-yaml-configuration-reference.md
  - ./configuration-client-extensions/oauth-headless-server-yaml-configuration-reference.md
---
# 클라이언트 확장 구성

```{toctree}
:maxdepth: 3

configuration-client-extensions/oauth-user-agent-yaml-configuration-reference.md
configuration-client-extensions/oauth-headless-server-yaml-configuration-reference.md
```

{bdg-secondary}`Liferay Experience Cloud 및 Liferay DXP 7.4+(온프레미스)`

Liferay 인스턴스 구성은 클라이언트 확장과 함께 배포할 수 있습니다. 예를 들어 OAuth2 인증 프로필을 구성 클라이언트 확장으로 배포하여 인증이 필요한 다른 클라이언트 확장을 활성화할 수 있습니다.

## OAuth 헤드리스 서버 클라이언트 확장

클라이언트 확장을 사용하여 `헤드리스 서버` 클라이언트 프로필로 사전 구성된 Liferay OAuth2 애플리케이션을 구성할 수 있습니다. 이러한 종류의 인증 프로필은 특정 사용자에게 권한이 부여되지 않은 API 호출에 필요합니다.

`client-extension.yaml` 파일에서 OAuth 헤드리스 서버 클라이언트 확장자를 지정합니다:

```yaml
type: oAuthApplicationHeadlessServer
```

## OAuth 사용자 에이전트 클라이언트 확장

클라이언트 확장을 사용하여 `사용자 에이전트 애플리케이션` 클라이언트 프로필로 사전 구성된 Liferay OAuth2 애플리케이션을 구성할 수 있습니다. 이러한 종류의 인증 프로필은 특정 사용자가 승인한 API 호출에 필요합니다(예: 다른 [마이크로서비스 클라이언트 확장(](./microservice-client-extensions.md))을 사용하여 Liferay API에 REST 호출하는 경우).

`client-extension.yaml` 파일에서 OAuth 사용자 에이전트 클라이언트 확장자를 지정합니다:

```yaml
type: oAuthApplicationUserAgent
```

## 관련 주제

* [클라이언트 확장 프로그램 소개](../client-extensions.md)
* [`client-extension.yaml`에서 클라이언트 확장 구성하기](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)