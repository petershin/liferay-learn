---
toc:
  - ./configuration-client-extensions/instance-settings-yaml-configuration-reference.md
  - ./configuration-client-extensions/oauth-user-agent-yaml-configuration-reference.md
  - ./configuration-client-extensions/oauth-headless-server-yaml-configuration-reference.md
---
# 구성 클라이언트 확장

{bdg-primary}`Liferay 자체 호스팅`
{bdg-primary}`Liferay SaaS`
{bdg-warning}`Liferay Cloud: 자체 관리`

{bdg-secondary}`Liferay 7.4+`

Liferay 인스턴스 구성은 클라이언트 확장을 통해 배포 가능합니다. 예를 들어 OAuth2 인증 프로필을 구성 클라이언트 확장으로 배포하여 인증이 필요한 다른 클라이언트 확장을 활성화할 수 있습니다.

## 인스턴스 설정 클라이언트 확장

{bdg-secondary}`사용 가능한 Liferay DXP 7.4(자체 호스팅)`   {bdg-secondary} `사용 가능한 Liferay Experience Cloud(SaaS)`

인스턴스 설정 클라이언트 확장을 사용하여 다양한 Liferay 구성을 구성할 수 있습니다. 각 구성은 PID(영구 ID)로 참조됩니다.

`client-extension.yaml` 파일에 인스턴스 설정 클라이언트 확장을 지정합니다.

```yaml
type: instanceSettings
```

## OAuth 헤드리스 서버 클라이언트 확장

클라이언트 확장을 사용하여 '헤드리스 서버' 클라이언트 프로필로 사전 구성된 Liferay OAuth2 애플리케이션을 구성할 수 있습니다. 특정 사용자가 승인하지 않은 API 호출에는 이러한 종류의 인증 프로필이 필요합니다.

`client-extension.yaml` 파일에 OAuth 헤드리스 서버 클라이언트 확장을 지정합니다.

```yaml
type: oAuthApplicationHeadlessServer
```

### `oAuthApplicationHeadlessServer`의 특수 동작

OAuth 헤드리스 서버 클라이언트 확장은 Liferay가 _경로_로 제공하는 메타데이터에 따라 달라집니다( [상황에 맞는 정보](working-with-client-extensions.md#context-sensitive-information) 참조). 이 클라이언트 확장으로 배포된 모든 실행 가능한 워크로드는 실행되기 전에 이 경로를 기다려야 합니다.

다음은 프로젝트에 'oAuthApplicationHeadlessServer' 클라이언트 확장이 정의된 경우 환경 변수 'LIFERAY_ROUTES_CLIENT_EXTENSION'에 의해 정의된 경로의 예입니다.

```bash
.
# The authorization URI of the DXP virtual instance (no protocol, domain or port)
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.authorization.uri
# The audience of the OAuth headless server application
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.headless.server.audience
# The client ID of the OAuth headless server application
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.headless.server.client.id
# The client secret of the OAuth headless server application
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.headless.server.client.secret
# The scopes of the OAuth headless server application
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.headless.server.scopes
# The introspection URI of the DXP virtual instance (no protocol, domain or port)
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.introspection.uri
# The JWKS (JSON Web Keys Set) URI of the DXP virtual instance (no protocol, domain or port)
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.jwks.uri
# The token URI of the DXP virtual instance (no protocol, domain or port)
└── <oAuth2ApplicationExternalReferenceCode>.oauth2.token.uri
```

'oAuthApplicationHeadlessServer' 클라이언트 확장을 사용하여 Liferay DXP와 통신하는 애플리케이션 로직은 전송된 데이터를 보호하기 위해 이 경로 메타데이터에서 제공하는 정보를 사용해야 합니다. 필요한 모든 OAuth 2 메타데이터는 이러한 방식으로 제공되므로 하드 코딩할 필요가 없습니다.

## OAuth 사용자 에이전트 클라이언트 확장

클라이언트 확장을 사용하여 '사용자 에이전트 애플리케이션' 클라이언트 프로필로 사전 구성된 Liferay OAuth2 애플리케이션을 구성할 수 있습니다. 이러한 종류의 인증 프로필은 특정 사용자가 승인한 API 호출에 필요합니다(예: 다른 [서비스 클라이언트 확장을 사용하여 Liferay API에 대한 REST 호출](./microservice-client-extensions.md) ).

`client-extension.yaml` 파일에 OAuth 사용자 에이전트 클라이언트 확장을 지정합니다.

```yaml
type: oAuthApplicationUserAgent
```

### `oAuthApplicationUserAgent`의 특수 동작

OAuth 헤드리스 사용자 에이전트 클라이언트 확장은 Liferay가 _경로_로 제공하는 메타데이터에 따라 달라집니다( [상황에 맞는 정보](working-with-client-extensions.md#context-sensitive-information) 참조). 이 클라이언트 확장으로 배포된 모든 실행 가능한 워크로드는 실행되기 전에 이 경로를 기다려야 합니다.

다음은 프로젝트에 'oAuthApplicationUserAgent' 클라이언트 확장이 정의된 경우 환경 변수 'LIFERAY_ROUTES_CLIENT_EXTENSION'으로 정의된 경로의 예입니다.

```bash
.
# The authorization URI of the DXP virtual instance (no protocol, domain or port)
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.authorization.uri
# The introspection URI of the DXP virtual instance (no protocol, domain or port)
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.introspection.uri
# The JWKS (JSON Web Keys Set) URI of the DXP virtual instance (no protocol, domain or port)
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.jwks.uri
# Newline separated redirect URIs of the DXP virtual instance
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.redirect.uris
# The token URI of the DXP virtual instance
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.token.uri (no protocol, domain or port)
# The audience of the OAuth user agent application
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.user.agent.audience
# The client ID of the OAuth user agent application
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.user.agent.client.id
# The scopes of the OAuth user agent application
└── <oAuth2ApplicationExternalReferenceCode>.oauth2.user.agent.scopes
```

'oAuthApplicationUserAgent' 클라이언트 확장을 사용하여 Liferay DXP와 통신하는 애플리케이션 로직은 전송된 데이터를 보호하기 위해 이 경로 메타데이터에서 제공하는 정보를 사용해야 합니다. 필요한 모든 OAuth 2 메타데이터는 이러한 방식으로 제공되므로 하드 코딩할 필요가 없습니다.

## 관련 주제

* [클라이언트 확장 소개](../client-extensions.md) 
* [`client-extension.yaml`에서 클라이언트 확장 구성](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml) 
