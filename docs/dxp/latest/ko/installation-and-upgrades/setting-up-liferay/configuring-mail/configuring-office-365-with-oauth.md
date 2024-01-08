# OAuth로 Microsoft Office 365 구성

{bdg-secondary}`liferay DXP 7.4 U79+/liferay 포털 7.4 GA79+`

OAuth 2.0 인증을 사용하여 Microsoft 이메일 서비스를 Liferay에 연결하세요. Microsoft에서는 OAuth2를 요구하며 더 이상 기본 인증(예: 이메일 주소 및 비밀번호로 연결)을 지원하지 않습니다.

## Microsoft에 앱 등록

```{note}
이 단계에 대한 추가 지원이나 문제 해결이 필요하면 Microsoft에 문의하세요.
```

1. [Microsoft Azure에서 새 애플리케이션을 만듭니다.](https://learn.microsoft.com/en-us/azure/active-directory/develop/quickstart-register-app) .

1. [애플리케이션에 대한 클라이언트 비밀번호를 추가하세요.](https://learn.microsoft.com/en-us/azure/active-directory/develop/quickstart-register-app#add-a-client-secret) .

   애플리케이션의 `클라이언트 ID`(`애플리케이션 ID`라고도 함), `클라이언트 비밀` 및 `테넌트 ID`(일명 `애플리케이션 ID`)를 기록해 두세요. '디렉터리 ID'). 이 값은 아래 단계에서 사용됩니다.

1. [애플리케이션에 대한 POP 및 IMAP API 권한을 추가합니다.](https://learn.microsoft.com/en-us/exchange/client-developer/legacy-protocols/how-to-authenticate-an-imap-pop-smtp-application-by-using-oauth#add-the-pop-and-imap-permissions-to-your-aad-application) .

## Liferay의 메일 구성

1. **글로벌 메뉴**(![글로벌 메뉴](../../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **인스턴스 설정** 으로 이동합니다.

1. **이메일** 을 클릭하세요.

1. 왼쪽 탐색 메뉴에서 **메일 설정** 을 클릭하세요. 다음 구성을 설정합니다.

   * POP 서버 알림 활성화: 선택됨
   * 수신 POP 서버: `outlook.office365.com`
   * 수신 포트: `995`
   * 보안 네트워크 연결 사용: 선택됨
   * 사용자 이름: Microsoft 애플리케이션과 연결된 사용자 이름
   * 발신 SMTP 서버: `smtp.office365.com`
   * 나가는 포트: `587`
   * StartTLS 활성화: 선택됨
   * 사용자 이름: Microsoft 애플리케이션과 연결된 사용자 이름

**저장** 을 클릭하세요.

1. 왼쪽 탐색에서 **Outlook 인증 커넥터** 를 클릭합니다. 클라이언트 ID, 클라이언트 암호 및 테넌트 ID를 각 입력 상자에 붙여넣습니다.

   ![Paste in the tenant ID, client ID, and client secret values into each input box.](./configuring-office-365-with-oauth/images/01.png)

1. **POP3 연결 활성화** 및 **SMTP 연결 활성화** 확인란을 선택합니다.

이제 Liferay가 Microsoft 이메일 서비스로 구성되었습니다.
