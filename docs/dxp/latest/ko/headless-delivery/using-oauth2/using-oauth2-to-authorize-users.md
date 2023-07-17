# OAuth2를 사용하여 사용자 인증

OAuth 2.0 인증 프로토콜을 사용하여 Liferay의 헤드리스 REST API에 액세스하는 애플리케이션을 만들 수 있습니다. 제공된 샘플 React 앱은 인증 코드 흐름, 클라이언트 자격 증명 흐름 및 암호 흐름의 세 가지 다른 OAuth2 토큰 기반 인증 흐름을 보여줍니다. OAuth2 관리 패널에 대한 자세한 내용은 [OAuth2 애플리케이션 생성](./creating-oauth2-applications.md)참조하십시오.

## Liferay DXP 설정

```{include} /_snippets/run-liferay-dxp.md
```

1. *전역 메뉴*(![전역 메뉴](../../images/icon-applications-menu.png))를 열고 **제어판** &rarr; **보안** &rarr; **OAuth 2 관리**.

1. **추가**(![아이콘 추가](../../images/icon-add.png))를 클릭하여 새 OAuth2 애플리케이션을 생성합니다.

1. 애플리케이션에 이름을 지정합니다(예: foo). 웹사이트 URL을 `http://localhost:3000`으로 설정하고 콜백 URI를 `http://localhost:3000/grant-type-authorization-code`로 설정합니다. **저장** 을 클릭합니다.

    ![새 OAuth2 애플리케이션을 생성하려면 양식을 작성하세요.](./using-oauth2-to-authorize-users/images/01.png)

1. 클라이언트 ID와 클라이언트 암호를 클립보드에 복사합니다. Client Secret을 얻으려면 **편집** 을 클릭하십시오. 팝업 창에서 값을 복사합니다.

    이 값은 나중에 샘플 React 앱에서 필요합니다.

1. 페이지 상단의 **Scopes** 탭을 클릭합니다. 아래로 스크롤하여 **LIFERAY.HEADLESS.ADMIN.USER** 를 클릭한 다음 **대신 데이터 읽기** 확인란을 선택합니다.

    ![LIFERAY.HEADLESS.ADMIN.USER에 대한 읽기 권한 활성화.](./using-oauth2-to-authorize-users/images/02.png)

    **저장** 을 클릭합니다. 이제 OAuth2 애플리케이션에 관리 사용자 API 카테고리에 대한 읽기 권한이 있습니다.

1. 다음으로 **전역 메뉴**(![전역 메뉴](../../images/icon-applications-menu.png))를 열고 **제어판** 탭을 클릭한 다음 **시스템 설정** 으로 이동합니다. ~ **보안 도구** .

1. **Portal CORS(Cross-Origin Resource Sharing)** 탭으로 이동하고 **Default Portal CORS Configuration** 을 클릭합니다.

1. 값이 `/o/headless-admin-user/*`인 **URL 패턴** 을 추가하고 **저장** 을 클릭합니다. 이렇게 하면 API의 'headless-admin-user' 범주에 대한 CORS가 활성화됩니다.

## 샘플 React 앱 배포

1. [OAuth2 React App](./liferay-c2b6.zip) 을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/headless-delivery/using-oauth2/liferay-c2b6.zip -O
   ```

   ```bash
   unzip liferay-c2b6.zip
   ```

   ```bash
   cd liferay-c2b6
   ```

1. `노드` 및 `얀` 설치되어 있는지 확인합니다. 그렇지 않은 경우 설정 스크립트를 실행하고 프롬프트를 따릅니다.

   ```bash
   ./setup_tutorial.sh
   ```

1. 앱의 루트 디렉터리로 이동하여 React 서버를 시작합니다.

   ```bash
   cd c2b6-custom-element
   ```

   ```bash
   yarn install && yarn start
   ```

### 인증 코드 흐름

권한 부여 코드 흐름에서는 사용자가 자신의 자격 증명으로 로그인하고 앱에 권한이 부여되기 전에 권한 부여를 승인해야 합니다. 다른 흐름에서는 이 추가 단계를 피할 수 있습니다.

1. <http://localhost:3000>에서 실행 중인 React 앱을 연 다음 페이지 상단에서 **인증 코드 흐름** 클릭합니다.

1. Liferay 승인 URL에 `http://localhost:8080/o/oauth2/authorize` 입력합니다. 클립보드에서 클라이언트 ID를 붙여넣습니다. **승인** 클릭합니다.

1. 아직 로그인하지 않은 경우 인증 페이지로 이동하기 전에 Liferay 로그인 페이지로 리디렉션됩니다. 사용자 이름과 암호(예 **test@liferay.com:learn**)를 입력하고 **로그인** 클릭합니다. 승인 페이지에서 **승인** 클릭합니다. 이미 로그인한 경우 인증 페이지로 바로 이동됩니다.

   ![**Authorizez** 를 클릭하여 애플리케이션을 인증합니다.](./using-oauth2-to-authorize-users/images/03.png)

   React 앱으로 다시 리디렉션됩니다. 다음 API 호출을 만드는 데 사용되는 인증 코드가 표시됩니다.

1. Liferay 토큰 URL에 `http://localhost:8080/o/oauth2/token` 을 입력합니다. 클립보드에서 클라이언트 ID와 클라이언트 암호를 붙여넣습니다. **토큰 받기** 클릭합니다. 향후 REST API 호출을 만드는 데 사용할 수 있는 권한 부여 토큰이 나타납니다.

1. Liferay get user URL에 `http://localhost:8080/o/headless-admin-user/v1.0/user-accounts` 입력합니다. **데이터 가져오기** 클릭합니다. React 앱은 토큰 기반 인증을 사용하여 Liferay에 REST API를 호출하고 Liferay 사용자 목록을 반환합니다.

   ![Liferay 사용자 목록이 나타납니다.](./using-oauth2-to-authorize-users/images/04.png)

### 클라이언트 자격 증명 흐름

클라이언트 자격 증명 흐름은 일반적으로 서버 간 상호 작용에 사용되며 사용자를 포함하지 않습니다.

1. <http://localhost:3000>에서 실행 중인 React 앱을 연 다음 페이지 상단에서 **Client Credentials Flow** 클릭합니다.

1. Liferay 토큰 URL에 `http://localhost:8080/o/oauth2/token` 을 입력합니다. 클립보드에서 클라이언트 ID와 클라이언트 암호를 붙여넣습니다. **토큰 받기** 클릭합니다. 향후 REST API 호출을 만드는 데 사용할 수 있는 권한 부여 토큰이 나타납니다.

1. Liferay get user URL에 `http://localhost:8080/o/headless-admin-user/v1.0/user-accounts` 입력합니다. **데이터 가져오기** 클릭합니다. React 앱은 토큰 기반 인증을 사용하여 Liferay에 REST API를 호출하고 Liferay 사용자 목록을 반환합니다.

### 비밀번호 흐름

암호 흐름 인증에서 React 앱은 요청에서 직접 사용자 이름과 암호를 전달합니다.

```{warning}
암호 흐름에서 사용자 이름과 암호는 애플리케이션에 직접 노출됩니다. 따라서 사용자는 애플리케이션을 신뢰해야 합니다. API 요청에 사용자 이름과 비밀번호를 전달하는 것도 위험합니다. 암호 흐름을 사용하는 것은 권장되지 않습니다.
```

1. <http://localhost:3000>에서 실행 중인 React 앱을 연 다음 페이지 상단에서 **Password Flow** 클릭합니다.

1. Liferay 토큰 URL에 `http://localhost:8080/o/oauth2/token` 을 입력합니다.

1. 클립보드에서 클라이언트 ID와 클라이언트 암호를 붙여넣습니다.

1. 사용자 이름과 비밀번호를 입력합니다(예: **test@liferay.com:learn**).

1. **토큰 받기** 클릭합니다. 향후 REST API 호출을 만드는 데 사용할 수 있는 권한 부여 토큰이 나타납니다.

1. Liferay get user URL에 `http://localhost:8080/o/headless-admin-user/v1.0/user-accounts` 입력합니다. **데이터 가져오기** 클릭합니다. React 앱은 토큰 기반 인증을 사용하여 Liferay에 REST API를 호출하고 Liferay 사용자 목록을 반환합니다.

## 코드 검토

React 앱의 `구성 요소` 폴더는 버튼을 클릭하여 발생하는 이벤트를 처리하기 위한 UI 요소와 논리를 정의합니다. 예를 들어 `Authorize.js` 파일은 인증 페이지로 리디렉션되고 `Token.js` 액세스 토큰을 가져오고 `Users.js` 사용자 목록을 가져옵니다. 각 권한 부여 흐름은 이러한 구성 요소 중 일부 또는 전부를 사용합니다.

인증 토큰을 얻기 위한 API 요청과 GET 요청은 `utils` 폴더의 `Requests.js` 파일에 정의되어 있습니다.

```
src
├── components
│   ├── Authorize.js
│   ├── Token.js
│   ├── Users.js
├── routes
│   ├── grant-type-authorization-code
│   |   ├── AuthorizeCode.js
│   ├── grant-type-client-credentials
│   |   ├── ClientCredentials.js
│   ├── grant-type-password
│   |   ├── Password.js
├── utils
│   ├── Requests.js
├── App.js
└── index.js
```

### 권한 부여 유형

`grant-type-authorization-code` 흐름의 `AuthorizeCode.js` 파일은 세 가지 구성 요소(`Authorize.js`, `Token.js`및 `Users.js`)를 모두 사용합니다.

```{literalinclude} ./using-oauth2-to-authorize-users/resources/liferay-c2b6-overlay/src/routes/grant-type-authorization-code/AuthorizationCode.js
:language: javascript
:lines: 16-35
```

코드에서 `Authorize.js` 구성 요소가 첫 번째 단계를 처리합니다. **승인** 버튼을 클릭하면 승인 요청이 이루어집니다.

```{literalinclude} ./using-oauth2-to-authorize-users/resources/liferay-c2b6-overlay/src/components/Authorize.js
:language: javascript
:lines: 3-67
```

리디렉션과 함께 일회성 인증 코드가 URL의 앱으로 다시 전달됩니다(예: `http://localhost:3000/grant-type-authorization-code?code={code}`).

`Token.js` 구성 요소가 다음 단계를 처리합니다. **Get Token** 클릭하면 `Requests.js` 파일에서 `getAuthToken` 함수가 호출됩니다.

```{literalinclude} ./using-oauth2-to-authorize-users/resources/liferay-c2b6-overlay/src/components/Token.js
:language: javascript
:lines: 3-98
```

`Token.js` 구성요소에서 매개변수 `client_id`, `client_secret`, `code`, `grant_type`및 `redirect_uri` 이 이 API 요청에서 전송됩니다. 매개변수가 유효하면 Liferay는 액세스 토큰이 포함된 JSON 응답을 반환합니다.

응답 예시:

```json
{
    "access_token": "2fda85abec524112dae612d35e9f9abd71650d364dee47c645b7574c6bffe91",
    "token_type": "Bearer",
    "expires_in": 600,
    "scope": "Liferay.Headless.Admin.User.everything.read"
}
```

`Users.js` 구성요소는 `access_token`에 대한 응답을 구문 분석합니다.

마지막으로 **Get Data** 클릭하면 `Requests.js` 파일에서 `getUsers` 함수가 호출됩니다.

### 클라이언트 자격 증명 부여 유형

`grant-type-client-credentials` 흐름의 `ClientCredentials.js` 파일은 두 가지 구성 요소(예: `Token.js` 및 `Users.js`)를 사용합니다.

```{literalinclude} ./using-oauth2-to-authorize-users/resources/liferay-c2b6-overlay/src/routes/grant-type-client-credentials/ClientCredentials.js
:language: javascript
:lines: 6-31
```

`Token.js` 구성요소에서 매개변수 `client_id`, `client_secret`및 `grant_type` 이 API 요청으로 전송됩니다. 매개변수가 유효하면 Liferay는 액세스 토큰이 포함된 JSON 응답을 반환합니다.

`Users.js` 구성요소는 `access_token`에 대한 응답을 구문 분석합니다.

마지막으로 **Get Data** 클릭하면 `Requests.js` 파일에서 `getUsers` 함수가 호출됩니다.

### 비밀번호 부여 유형

`grant-type-password` 흐름의 `Password.js` 파일은 두 가지 구성 요소(예: `Token.js` 및 `Users.js`)를 사용합니다.

```{literalinclude} ./using-oauth2-to-authorize-users/resources/liferay-c2b6-overlay/src/routes/grant-type-password/Password.js
:language: javascript
:lines: 6-31
```

`Token.js` 구성요소에서 매개변수 `client_id`, `client_secret`, `grant_type`, `password`및 `username` 은 API 요청의 매개변수로 전송됩니다. 매개변수가 유효하면 Liferay 서버는 액세스 토큰이 포함된 JSON 응답을 반환합니다.

`Users.js` 구성요소는 `access_token`에 대한 응답을 구문 분석합니다.

마지막으로 **Get Data** 클릭하면 `Requests.js` 파일에서 `getUsers` 함수가 호출됩니다.

## 관련 항목

* [OAuth 2.0 사용](../using-oauth2.md)
* [OAuth2 애플리케이션 생성](./creating-oauth2-applications.md)
* [OAuth2로 계정 액세스 권한 부여](./authorizing-account-access-with-oauth2.md)
* [OAuth 2 범위](./oauth2-scopes.md)
