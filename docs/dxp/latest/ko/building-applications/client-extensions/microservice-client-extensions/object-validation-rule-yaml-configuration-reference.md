# 객체 유효성 검사 규칙 YAML 구성 참조

객체 유효성 검사 규칙 클라이언트 확장을 정의하려면 `client-extension.yaml` 파일에 `objectValidationRule` 유형을 추가하세요.

## 이용내역

이 `client-extension.yaml` 예시는 유효성 검사 규칙과 OAuth 사용자 에이전트를 정의합니다.

```yaml
easy-object-validation-rule-1:
    name: Easy Object Validation Rule 1
    oAuth2ApplicationExternalReferenceCode: easy-oauth-application-user-agent
    resourcePath: /object/validation/rule/1
    type: objectValidationRule

easy-oauth-application-user-agent:
    type: oAuthApplicationUserAgent
```

필수 `resourcePath` 속성은 객체 유효성 검사 규칙 핸들러의 사이트
를 정의합니다. 외부 애플리케이션(예: Java Spring Boot 애플리케이션)으로 액세스할 수 있는 객체 유효성 검사 규칙 핸들러의 구현을 가리킵니다. 이 값은 연결된 OAuth2 애플리케이션 프로필의 `homePageURL` 값과 결합되어 전체 URL을 형성합니다.

객체 유효성 검사 규칙 클라이언트 확장에는 Liferay에서 트리거하는 요청을 보호하기 위해 OAuth2 애플리케이션 프로필이 필요합니다. `client-extension.yaml`은 이 프로필에 대해 추가 [OAuth 사용자 에이전트 클라이언트 확장](../configuration-client-extensions/oauth-user-agent-yaml-configuration-reference.md) 을 정의하고 `oAuth2ApplicationExternalReferenceCode` 속성은 해당 클라이언트 확장의 `key` 값을 참조합니다.

[샘플 작업공간](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-etc-spring-boot) Spring Boot 애플리케이션에서 객체 유효성 검사 규칙 클라이언트 확장을 사용하는 방법을 보여줍니다.

## 클라이언트 확장 범위 제한

기본적으로 개체 유효성 검사 규칙 클라이언트 확장은 모든 Liferay 인스턴스의 모든 개체 정의에 사용할 수 있습니다.

객체 정의에 따라 액세스를 제한하려면 유효성 검사를 사용할 수 있는 객체 목록과 함께 `allowedObjectDefinitionNames` 속성을 추가하세요.

```yaml
easy-object-validation-rule-1:
    allowedObjectDefinitionNames:
        - C_EasyObject
        - User
```

이 예에서 'easy-object-validation-rule-1'은 'C_EasyObject' 및 'User' 개체에 대한 유효성 검사 [정의하는 경우](../../objects/creating-and-managing-objects/validations.md) 옵션으로 나타납니다.

인스턴스별로 액세스를 제한하려면 원하는 가상 인스턴스 ID와 함께 `dxp.lxc.liferay.com.virtualInstanceId` 속성을 추가하세요.

```yaml
easy-object-validation-rule-1:
    allowedObjectDefinitionNames:
        - C_EasyObject
        - User
    dxp.lxc.liferay.com.virtualInstanceId: easy-virtual-host-1.com
```

이 예에서 `easy-object-validation-rule-1`은 `easy-virtual-host-1.com` 인스턴스의 `C_EasyObject` 및 `User` 개체에 대한 옵션으로만 나타납니다.

## YAML 속성

이러한 속성은 개체 유효성 검사 규칙 클라이언트 확장에만 해당됩니다.

| 이름                                       | 데이터 유형                         | 묘사                                                                                                              |
| :--------------------------------------- | :----------------------------- | :-------------------------------------------------------------------------------------------------------------- |
| `allowedObjectDefinitionNames`           | 명부                             | 지정된 개체 정의(예: `C_EasyObject`, `User`)로 클라이언트 확장 범위를 지정합니다.                                    |
| `dxp.lxc.liferay.com.virtualInstanceId`  | 끈                              | ID(예: `easy-virtual-host-1.com`)를 사용하여 지정된 가상 인스턴스로 클라이언트 확장 범위를 지정합니다.                      |
| `resourcePath`                           | 문자열(일부 URL) | (필수) 객체 유효성 검사 규칙 처리기에 대한 경로입니다. 이 값은 전체 URL을 위해 OAauth2 애플리케이션 프로필의 `homePageURL` 값과 결합됩니다. |
| `oAuth2ApplicationExternalReferenceCode` | 끈                              | (필수) 요청 보안에 필요한 OAuth2 애플리케이션 프로필의 외부 참조 코드입니다.                                              |

## 관련 주제

* [마이크로서비스 클라이언트 확장](../microservice-client-extensions.md) 
* [클라이언트 확장 작업](../working-with-client-extensions.md) 
* [검증](./workflow-action-yaml-configuration-reference.md) 
