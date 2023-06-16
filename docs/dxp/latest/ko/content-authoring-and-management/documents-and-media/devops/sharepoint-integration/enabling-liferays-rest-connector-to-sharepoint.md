# SharePoint에 대한 Liferay의 REST 커넥터 활성화

> DXP 구독이 필요합니다. SharePoint 2016 및 SharePoint Online과 호환 가능

Liferay의 REST Connector to SharePoint는 SharePoint 라이브러리와 문서 및 미디어 통합을 제공합니다. 이를 통해 SharePoint 라이브러리를 탑재하기 위한 문서 및 미디어 리포지토리를 만들 수 있습니다. 그런 다음 SharePoint 문서 및 폴더를 읽고 쓰고, 문서 체크인/체크아웃을 수행하고, 문서를 다운로드하는 등의 작업을 수행할 수 있습니다. 한 컨텍스트에서 수행된 각 작업은 다른 컨텍스트에서 전파됩니다.

## 통합 제한 사항

이 응용 프로그램은 SharePoint의 API를 사용하며 다음과 같은 제한 사항이 있습니다.

* 파일을 먼저 확인하지 않고 파일을 이동하거나 이름을 바꾸면 버전 기록이 손실됩니다.
* 파일 확장자는 변경할 수 없습니다. 파일 이름만 변경할 수 있습니다.
* 파일의 현재 이름은 모든 이전 버전에 전파됩니다.
* 파일을 체크아웃하는 사용자만 해당 파일의 작업 복사본 버전 번호를 볼 수 있습니다.
* 접미사 또는 중간 와일드카드에 대한 쿼리는 포함에 대한 쿼리로 변환됩니다.
* 댓글, 평가 및 SharePoint 폴더를 문서 및 미디어 루트 폴더로 사용하는 것은 지원되지 않습니다.

REST 커넥터 작동 방식에 대한 자세한 내용은 [javadocs API 참조](https://docs.liferay.com/dxp/apps/sharepoint-rest/latest/javadocs/) 을 참조하십시오.

## REST 커넥터 설치

Liferay REST Connector를 SharePoint에 설치하려면 다음 단계를 따르십시오.

1. Liferay Marketplace를 통해 [Liferay REST Connector를 SharePoint](https://web.liferay.com/marketplace/-/mp/application/105406871) 에 LPKG 파일로 다운로드합니다.

1. 파일을 인스턴스의 [`[LIFERAY_HOME]/deploy`](../../../../installation-and-upgrades/reference/liferay-home.md) 폴더에 [deploy](../../../../system-administration/installing-and-managing-apps/installing-apps.md) it으로 복사합니다.

   성공하면 콘솔 로그에 다음 메시지가 표시됩니다.

   ```
   Processing Liferay REST Connector to SharePoint.lpkg
   The portal instance needs to be restarted to complete the installation of file:/opt/liferay/osgi/marketplace/Liferay%20REST%20Connector%20to%20SharePoint%20-%20API.lpkg
   ```

1. 설치를 완료하려면 서버를 다시 시작하십시오.

커넥터가 성공적으로 배포되고 설치되면 SharePoint OAuth2 구성 항목을 추가하여 설정을 완료할 수 있습니다. 원하는 경우 사용자 지정 검색 소스를 정의하여 SharePoint 검색 결과를 제한하고 미세 조정할 수도 있습니다.

```{important}
REST 커넥터는 SharePoint 서버 인증을 위해 OAuth2와 함께 Azure ACS를 사용하므로 서버에서 HTTPS 지원이 활성화되어 있는지 확인하십시오.
```

## 최신 버전으로 업데이트

이전에는 Liferay REST Connector to SharePoint의 이름이 Liferay Connector for SharePoint였습니다. 이전 버전의 응용 프로그램이 Liferay 서버에 설치된 경우 다음 단계에 따라 최신 버전을 설치하십시오.

1. Liferay Marketplace를 통해 [Liferay REST Connector를 SharePoint](https://web.liferay.com/marketplace/-/mp/application/105406871) 에 LPKG 파일로 다운로드합니다.

1. Liferay DXP 서버를 중지합니다.

1. [`[LIFERAY_HOME]/osgi/marketplace`](../../../../installation-and-upgrades/reference/liferay-home.md) 폴더로 이동하여 이전 LPKG 파일을 새 파일로 바꿉니다.

1. Liferay DXP 서버를 다시 시작하십시오.

서버가 다시 시작되면 애플리케이션을 사용할 준비가 된 것입니다.

## SharePoint OAuth2 구성 추가

Liferay 제어판을 통해 새 SharePoint OAuth2 구성을 추가하려면 다음 단계를 따르십시오.

1. **글로벌 메뉴**(![Global Menu](../../../../images/icon-applications-menu.png))을 열고 **제어판** 탭을 클릭한 다음 **시스템 설정** &rarr; **문서 & 미디어** &rarr; **SharePoint OAuth 2** 으로 이동합니다.

   ![제어판에서 시스템 설정 > 문서 & 미디어 > SharePoint OAuth 2로 이동합니다.](./enabling-liferays-rest-connector-to-sharepoint/images/01.png)

1. **추가** 클릭하여 새 SharePoint OAuth2 구성 항목을 만듭니다.

1. 양식을 작성하십시오(아래 참조).

1. 완료되면 **저장** 클릭합니다.

**이름** : 구성의 이름

**권한 부여 끝점** : OAuth2 권한 부여를 요청하는 데 사용되는 URL(예: SharePoint Online의 경우 `https://[your-site-name].sharepoint.com/_layouts/oauthauthorize.aspx`)

**인증 토큰 엔드포인트** : ACS URL(예: SharePoint Online의 경우 `https://accounts.accesscontrol.windows.net/[App ID]/tokens/OAuth/2`)

**클라이언트 ID** : 클라이언트 ID

**Client Secret** : 클라이언트 시크릿

**범위** : 토큰에 필요한 권한 집합입니다. 유효한 범위는 REST 커넥터 등록 중에 구성됩니다.

**테넌트 ID** : 테넌트 ID

**사이트 도메인** : 애플리케이션에 등록된 사이트 도메인

**리소스** : 이 값은 사용하는 ACS 서비스에 따라 다릅니다(예: SharePoint Online의 경우 `00000003-0000-0ff1-ce00-000000000000/[your-site-name].sharepoint.com@[tenant ID]`).

일단 저장되면 SharePoint 구성을 사용하여 SharePoint 라이브러리에 탑재된 문서 및 미디어에 리포지토리를 만들 수 있습니다.

## SharePoint 검색 구성 추가

SharePoint를 사용하면 사용자 지정 소스 ID를 정의하여 검색 결과를 제한하고 미세 조정할 수 있습니다. 기본적으로 커넥터는 문서 소스 ID를 사용합니다.

다른 소스 ID로 SharePoint 검색 구성을 만들려면 다음 단계를 따르세요.

1. **글로벌 메뉴**(![Global Menu](../../../../images/icon-applications-menu.png))을 열고 **제어판** 탭을 클릭한 다음 **시스템 설정** &rarr; **문서 & 미디어** &rarr; **SharePoint 검색** 으로 이동합니다.

   ![제어판에서 시스템 설정 > 문서 & 미디어 > SharePoint OAuth 2로 이동합니다.](./enabling-liferays-rest-connector-to-sharepoint/images/02.png)

1. **추가** 클릭하여 새 SharePoint 검색 구성 항목을 만듭니다.

   ![추가를 클릭하여 새 SharePoint 검색 구성 항목을 만듭니다.](./enabling-liferays-rest-connector-to-sharepoint/images/03.png)

1. 새 항목에 대한 사용자 지정 SharePoint 결과 SourceID를 입력합니다.

1. 완료되면 **저장** 클릭합니다.

## 관련 주제

* [앱 설치](../../../../system-administration/installing-and-managing-apps/installing-apps.md)
* [문서 및 미디어에 SharePoint 저장소 만들기](./creating-sharepoint-repositories-in-documents-and-media.md)
