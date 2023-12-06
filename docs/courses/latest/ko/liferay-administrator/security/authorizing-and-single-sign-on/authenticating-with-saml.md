# SAML로 인증

SAML로 인증할 때 Liferay는 서비스 공급자(SP) 또는 ID 공급자(IdP) 역할을 할 수 있습니다. 자세한 내용은 [SAML로 인증](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/configuring-sso/authenticating-with-saml)을 참조하세요.

Clarity Vision Solutions는 Fabulous Frames를 인수하여 성장했습니다. 다른 회사를 인수할 가능성을 고려하면서 IT 팀은 SAML을 활용하여 사용자 자격 증명의 저장 및 관리를 중앙 집중화하기로 결정했습니다. 실제로 작동하는 모습을 보려면 아래 단계를 따르세요.

## ID 공급자 설정

1. Liferay 컨테이너를 시작하여 ID 공급자가 됩니다.

   ```bash
   docker run -it -m 8g -p 7080:8080
      --env LIFERAY_SETUP_PERIOD_WIZARD_PERIOD_ENABLED=true
      --name liferayidp liferay/dxp:latest
   ```

1. 관리자 계정을 설정하세요.

   * `localhost:7080`으로 이동합니다.
   * 이름으로 '지원'을 입력하세요.
   * 성에는 'Support'를 입력하세요.
   * 이메일로 `support@clarityvisionsolutions.com`을 입력하세요.
   * '구성 완료'를 클릭하세요.
   * 다음 페이지에서 비밀번호를 `learn`으로 설정하세요.
   * '저장'을 클릭하세요.

1. 새 ID 공급자를 구성합니다.

   * **글로벌 메뉴**(![글로벌 메뉴](../../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **SAML Admin** 으로 이동합니다.
   * 일반 탭에서 SAML 역할로 **Identity Provider** 를 선택합니다.
   * 엔터티 ID를 `liferayidp`로 입력합니다.
   * **저장** 을 클릭하세요.
   * 인증서 및 개인 키 섹션에서 **인증서 만들기** 를 클릭하세요.
   * 일반 이름을 `foo`로 입력합니다.
   * 아래로 스크롤하십시오. 키 비밀번호를 `learn`으로 입력하세요.
   * **저장** 을 클릭하세요.
   * 마지막으로 일반 탭에서 **Enabled** 확인란을 선택하고 **Save** 를 클릭하세요.

## 서비스 제공자 설정

1. Liferay 컨테이너를 시작하여 서비스 제공자가 됩니다.

   ```bash
   docker run -it -m 8g -p 8080:8080 --name liferaysp liferay/dxp:latest
   ```

1. `localhost:8080`으로 이동하여 관리자(예: `test@liferay.com:test`)로 로그인합니다. 참고로, 다른 브라우저에서 각 컨테이너에 액세스해야 할 수도 있습니다.

1. **글로벌 메뉴**(![글로벌 메뉴](../../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **SAML Admin** 으로 이동합니다.

1. 새로운 서비스 제공자를 구성합니다.

   * 일반 탭에서 SAML 역할로 **Service Provider** 를 선택합니다.
   * 엔터티 ID를 `liferaysp`로 입력합니다.
   * **저장** 을 클릭하세요.
   * 인증서 및 개인 키 섹션에서 **인증서 만들기** 를 클릭하세요.
   * 일반 이름을 `foo`로 입력합니다.
   * 아래로 스크롤하십시오. 키 비밀번호를 `learn`으로 입력하세요.
   * **저장** 을 클릭하세요.
   * 마지막으로 일반 탭에서 **Enabled** 확인란을 선택하고 저장을 클릭하세요.

## SP와 IdP 연결

`liferaysp` 컨테이너(`localhost:8080`)에서 **Global Menu**(![Global Menu](../../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **SAML로 이동합니다. 관리자** . **ID 공급자 연결** 탭을 클릭합니다.

1. IdP 연결을 만듭니다.

   * **ID 공급자 추가** 를 클릭하세요.
   * 이름을 `liferayidp`로 입력합니다.
   * 엔터티 ID를 `liferayidp`로 입력합니다.
   * **활성화** 확인란을 선택합니다.
   * 메타데이터 URL을 `http://[IP 주소]:7080/c/portal/saml/metadata`로 입력합니다. `[IP 주소]`를 컴퓨터의 로컬 IP 주소로 바꾸세요.
   * 속성 매핑에서 드롭다운 목록을 사용하여 `emailAddress`를 선택합니다. SAML 속성을 `emailAddress`로 설정합니다.
   * 다른 항목을 보려면 (![아이콘 추가](../../../images/icon-add.png))를 클릭하세요. 드롭다운 목록을 사용하여 'firstName'을 선택하세요. SAML 속성을 `firstName`으로 설정합니다.
   * 다른 항목을 보려면 (![아이콘 추가](../../../images/icon-add.png))를 클릭하세요. 드롭다운 목록을 사용하여 'lastName'을 선택하세요. SAML 속성을 `lastName`으로 설정합니다.
   * 다른 항목을 보려면 (![아이콘 추가](../../../images/icon-add.png))를 클릭하세요. 드롭다운 목록을 사용하여 'screenName'을 선택하세요. SAML 속성을 `screenName`으로 설정합니다.
   * 다른 항목을 보려면 (![아이콘 추가](../../../images/icon-add.png))를 클릭하세요. 드롭다운 목록을 사용하여 'UUID'를 선택하세요. SAML 속성을 `UUID`로 설정합니다.
   * 페이지 하단의 **저장** 을 클릭하세요.

1. 다음으로 `liferayidp` 컨테이너(`localhost:7080`)에서 **Global Menu**(![Global Menu](../../../images/icon-applications-menu.png)) &rarr; **Control Panel** 로 이동합니다. &rarr; **SAML 관리자** . **서비스 공급자 연결** 탭을 클릭하세요.

   * **서비스 제공자 추가** 를 클릭하세요.

   * 이름을 'liferaysp'로 입력하세요.

   * 엔터티 ID를 `liferaysp`로 입력합니다.

   * **활성화** 확인란을 선택합니다.

   * 메타데이터 URL을 `http://[IP 주소]:8080/c/portal/saml/metadata`로 입력합니다. `[IP 주소]`를 컴퓨터의 로컬 IP 주소로 바꾸세요.

   * 이름 식별자 속성 이름을 `emailAddress`로 입력합니다.

   * **속성 활성화** 확인란을 선택합니다.

   * 속성 텍스트 상자에 다음 속성을 입력합니다.

     ```
     firstName
     lastName
     emailAddress
     screenName
     uuid
     ```

   - 페이지 하단의 **저장** 을 클릭하세요.

## SAML 연결 테스트

1. `liferaysp` 컨테이너(예: `localhost:8080`)에서 **Global Menu**(![Global Menu](../../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; 로 이동합니다. **사용자 및 조직** . 테스트 테스트 관리자가 나열된 유일한 사용자라는 점에 유의하십시오.

1. 오른쪽 상단의 사용자 프로필 이미지를 클릭한 후 **로그아웃** 을 클릭하세요. 'support@clarityvisionsolutions.com:learn' 자격 증명으로 로그인하세요. 'liferayidp' 컨테이너가 사용자를 확인하고 성공적인 로그인을 제공했습니다.

```{warning}
나머지 과정을 더 쉽게 진행하려면 이 연습을 완료한 후 SAML을 비활성화하세요.
```

다음: [OAuth2로 승인](./authorizing-with-oauth2.md)

## 관련 개념

* [SAML로 인증](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/configuring-sso/authenticating-with-saml)
* [SAML 인증 프로세스 개요](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/configuring-sso/authenticating-with-saml/saml-authentication-process-overview)
* [SAML 관리자](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/configuring-sso/authenticating-with-saml/saml-admin)
