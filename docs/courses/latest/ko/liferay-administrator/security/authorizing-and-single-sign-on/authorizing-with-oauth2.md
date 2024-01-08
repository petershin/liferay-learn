# OAuth2로 승인

Liferay의 OAuth2 도구를 사용하여 타사 애플리케이션에 데이터 액세스 권한을 부여하세요. 예를 들어, Clarity Vision Solutions의 파트너는 최신 가격으로 안경 제품을 판매하려고 합니다. 그들은 가격표 API에 대한 액세스를 제공하기 위해 Clarity Vision Solutions를 요청합니다. 실제로 작동하는 모습을 보려면 아래 단계를 따르세요.

## OAuth2 설정

1. **글로벌 메뉴*(![글로벌 메뉴](../../../images/icon-applications-menu.png))를 열고** 제어판 **&rarr;** 보안 **&rarr;** OAuth 2 관리_로 이동합니다.

1. **추가**(![아이콘 추가](../../../images/icon-add.png))를 클릭하여 새 OAuth2 애플리케이션을 만듭니다.

1. 애플리케이션에 이름(예: foo)을 지정합니다. 웹사이트 URL을 `http://localhost:3000`으로 설정하고 콜백 URI를 `http://localhost:3000/grant-type-authorization-code`로 설정합니다. **저장** 을 클릭하세요.

1. 클라이언트 ID와 클라이언트 비밀번호를 클립보드에 복사하세요. 클라이언트 비밀번호를 얻으려면 **편집** 을 클릭하세요. 팝업 창에서 값을 복사합니다. 이러한 값은 나중에 샘플 React 앱에서 필요합니다.

1. 페이지 상단의 **범위** 탭을 클릭하세요. 아래로 스크롤하여 **LIFERAY.HEADLESS.COMMERCE.ADMIN.PRICING** 을 클릭한 다음 **사용자를 대신하여 데이터 읽기** 확인란을 선택합니다.

   ![Enable read privileges for LIFERAY.HEADLESS.COMMERCE.ADMIN.PRICING.](./authorizing-with-oauth2/images/01.png)

**저장** 을 클릭하세요. 이제 귀하의 OAuth2 애플리케이션에는 상거래 가격 책정 API 카테고리에 대한 읽기 권한이 있습니다.

1. 그런 다음 **전역 메뉴**(![전역 메뉴](../../../images/icon-applications-menu.png))를 열고 **제어판** 탭을 클릭한 후 **시스템 설정으로 이동합니다.** &rarr; **보안 도구** .

1. **포털 CORS(Cross-Origin Resource Sharing**) 탭으로 이동하여 **기본 포털 CORS 구성** 을 클릭합니다.

1. '/o/headless-commerce-admin-pricing/ **' 값으로***URL 패턴***을 추가하고***저장** 을 클릭하세요. 이를 통해 'headless-commerce-admin-pricing' API 카테고리에 대한 CORS가 활성화됩니다.

## 샘플 React 앱 배포

1. [OAuth2 React 앱](https://resources.learn.liferay.com/dxp/latest/en/headless-delivery/using-oauth2/liferay-c2b6.zip) 을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/headless-delivery/using-oauth2/liferay-c2b6.zip -O
   ```

   ```bash
   unzip liferay-c2b6.zip
   ```

   ```bash
   cd liferay-c2b6
   ```

1. `node`와 `yarn`이 설치되어 있는지 확인하세요. 그렇지 않은 경우 설정 스크립트를 실행하고 프롬프트를 따르십시오.

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

1. `http://localhost:3000`에서 실행 중인 React 앱을 엽니다. **인증 코드 흐름** 을 클릭하세요.

1. Liferay 인증 URL에 `http://localhost:8080/o/oauth2/authorize`를 입력합니다. 클립보드에서 클라이언트 ID를 붙여넣습니다. **승인** 을 클릭하세요.

1. 아직 로그인하지 않은 경우 인증 페이지로 전송되기 전에 Liferay 로그인 페이지로 리디렉션됩니다. 사용자 이름과 비밀번호(예: **test@liferay.com:learn**)를 입력하고 **로그인** 을 클릭하세요. 승인 페이지에서 **승인** 을 클릭하세요. 이미 로그인한 경우에는 인증 페이지로 바로 이동됩니다.

1. Liferay 토큰 URL로 `http://localhost:8080/o/oauth2/token`을 입력합니다. 클립보드에서 클라이언트 ID와 클라이언트 비밀번호를 붙여넣습니다. **토큰 받기** 를 클릭하세요.

1. 요청 URL에 `http://localhost:8080/o/headless-commerce-admin-pricing/v1.0/priceLists`를 입력합니다. **데이터 가져오기** 를 클릭하세요.

   ![The price list is displayed in the React app.](./authorizing-with-oauth2/images/02.png)

다음: [AntiSamy 관리](../managing-antisamy.md)

## 관련 개념

* [OAuth2 사용](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2)
* [OAuth2 애플리케이션 생성](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2/creating-oauth2-applications)
