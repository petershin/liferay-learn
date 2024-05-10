# MuleSoft 커넥터 구성

MuleSoft에 대한 Liferay의 커넥터는 Liferay의 API를 설명하는 OpenAPI 3.0 문서를 사용합니다. 각 OpenAPI 문서는 다음 스키마에 따라 Liferay 인스턴스에 동적으로 배포됩니다.

```bash
http://[host]:[port]/o/[headless-api-app-name]/[version]/openapi.json
```

이러한 문서는 배포된 RESTful 웹 서비스를 기반으로 하므로 API에 대한 가장 정확한 설명입니다. Liferay API [API 사용](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis) 에 대해 자세히 알아볼 수 있습니다.

OpenAPI 문서 엔드포인트를 지정하면 커넥터가 OpenAPI 문서에 정의된 경로, 경로/쿼리 매개변수 및 엔티티 메타데이터를 자동으로 구성합니다. 커넥터는 Liferay 표준을 따르고 모든 Liferay API를 지원하는 모든 OpenAPI 3.0 문서와 함께 작동합니다.

## Mule 프로젝트에 커넥터 추가

커넥터를 구성하기 전에 Mule 프로젝트에 커넥터를 추가해야 합니다.

1. Mule Palette에서 **Exchange** 검색을 클릭합니다.

1. **Liferay** 을 검색합니다.

1. 커넥터를 선택하고 **추가** 클릭합니다.

1. **마침** 클릭합니다.

이제 커넥터가 Mule 프로젝트에 나타납니다.

![OAuth2 구성에서 클라이언트 프로필을 헤드리스 서버로 설정합니다.](./configuring-the-mulesoft-connector/images/01.gif)

## 커넥터 구성

1. 인증 방법을 선택하고 필요한 매개변수를 입력합니다.

1. OpenAPI 문서 끝점을 지정합니다.

### 인증

**기본** 및 **OAuth2** 인증 방법 중에서 선택합니다.

**기본 인증** : 사용자 이름과 암호를 입력합니다.

**OAuth2** : 클라이언트 키와 클라이언트 시크릿을 입력합니다.

프로덕션의 경우 [OAuth 2.0 사용](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2) 을 통해 사용자를 인증해야 합니다. 기본 인증은 기본 테스트 및 데모용으로만 제공됩니다.

Liferay에서 OAuth2를 설정할 때 Client Profile에 대해 **Headless Server** 선택합니다. Liferay는 커넥터에서 사용할 클라이언트 ID(소비자 키) 및 클라이언트 비밀(소비자 비밀)을 생성합니다.

![OAuth2 구성에서 클라이언트 프로필을 헤드리스 서버로 설정합니다.](./configuring-the-mulesoft-connector/images/02.png)

OAuth2 인증으로 엔드포인트를 사용하려면 필요한 인증 옵션으로 [OAuth 2 범위](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2/oauth2-scopes) 도 정의해야 합니다(예: `every`, `everything.write`또는 `every.read`).

자세한 설정 지침은 [OAuth2 애플리케이션 생성](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2/creating-oauth2-applications) 참조하고, OAuth2를 사용하는 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2/using-oauth2-to-authorize-users) 참조하세요.

### OpenAPI 문서 엔드포인트 지정

권한이 부여되면 사용하려는 Liferay API를 지정하도록 OpenAPI 문서 엔드포인트를 설정합니다. 예를 들어 이 문서는 Commerce Admin Catalog API용입니다.

```bash
http://[host]:[port]/o/headless-commerce-admin-catalog/v1.0/openapi.json
```

이 값을 설정하려면 `Liferay_Config` 전역 요소를 편집하고 **OpenAPI 사양 URL** 필드에 문서 엔드포인트를 입력합니다.

![Open API 사양 URL 필드에 OpenAPI 문서 엔드포인트를 입력합니다.](./configuring-the-mulesoft-connector/images/03.png)

XML 구성을 사용하여 이 작업을 수행할 수도 있습니다. `Liferay_Config` 전역 요소를 마우스 오른쪽 버튼으로 클릭하고 **Go to XML** 선택합니다. 그런 다음 인증 방법에 적합한 형식을 사용하여 자격 증명을 입력합니다.

* 기본 인증 예:

   ```xml
    <liferay:config name="Liferay_Config_Catalog">
    <liferay:basic-connection username=${username} password=${password} openApiSpecPath="http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/openapi.json" />
    </liferay:config>
   ```

* OAuth 2.0 예:

   ```xml
    <liferay:config name="Liferay_Config_Catalog">
    <liferay:oauth2-connection consumerKey="${consumerKey}" consumerSecret=${consumerSecret} openApiSpecPath="http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/openapi.json" />
    </liferay:config>
   ```

**연결 테스트** 클릭합니다. 성공하면 커넥터를 사용하여 흐름 작성을 시작할 수 있습니다. 그렇지 않으면 구성을 검토하십시오.

## 관련 주제

* [노새 흐름 설계](./designing-mule-flows.md)
* [API 사용](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis)
* [OAuth 2.0 사용](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2)
