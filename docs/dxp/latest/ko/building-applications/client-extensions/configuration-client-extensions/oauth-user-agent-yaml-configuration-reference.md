---
uuid: 4801c0d5-123d-471e-a8c6-d080342488c8
---

# OAuth 사용자 에이전트 YAML 구성 참조

`client-extension.yaml` 파일로 OAuth 사용자 에이전트 클라이언트 확장을 정의할 수 있습니다.

## 사용내역

이 `client-extension.yaml` 파일은 OAuth 사용자 에이전트 클라이언트 확장을 정의합니다.

```yaml
xray-oauth-user-agent:
    type: oAuthApplicationUserAgent
```

[예시 작업공간](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-etc) OAuth 사용자 에이전트 클라이언트 확장이 있는 프로젝트가 포함되어 있습니다.

## YAML 속성

이러한 속성은 OAuth 사용자 에이전트 클라이언트 확장에 따라 다릅니다.

| 이름            | 데이터 유형      | 기정값                                              | 묘사                                                                                           |
|:------------- |:----------- |:------------------------------------------------ |:-------------------------------------------------------------------------------------------- |
| `description` | 끈           |                                                  | 클라이언트 확장 프로그램의 설명입니다.                                                                        |
| `homePageURL` | 문자열(부분 URL) | `https://$[conf:ext.lxc.liferay.com.mainDomain]` | OAuth2 애플리케이션 프로필 리소스 서버의 기본 주소입니다.                                                          |
| `name`        | 끈           | (OAuth2 애플리케이션 프로필에서 파생됨)                        | OAuth2 애플리케이션 프로필의 이름입니다. | `프라이버시 정책URL` | URL | | OAuth2 애플리케이션 프로필의 개인정보 보호정책에 대한 URL입니다. |
| `scopes`      | 끈[]         | []                                               | OAuth2 애플리케이션 프로필과 연결된 범위의 배열입니다.                                                            |

## 추가 정보

* [마이크로서비스 클라이언트 확장](../microservice-client-extensions.md)
* [클라이언트 확장 작업](../working-with-client-extensions.md)
* [OAuth 헤드리스 서버 YAML 구성 참조](./oauth-headless-server-yaml-configuration-reference.md)
