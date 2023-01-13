# 문서 및 미디어에 SharePoint 저장소 만들기

[SharePoint OAuth2 구성](./enabling-liferays-rest-connector-to-sharepoint.md#adding-a-sharepoint-oauth2-configuration)을 추가하면 이를 사용하여 SharePoint 라이브러리에 탑재된 문서 및 미디어에 리포지토리를 만들 수 있습니다.

다음과 같이하세요:

1. 사이트 또는 자산 라이브러리에서 문서 및 미디어 응용 프로그램을 엽니다.

1. *추가* (![Add Button](../../../../images/icon-add.png))을 클릭하고 *저장소*를 선택합니다.

1. 리포지토리의 이름과 설명을 입력합니다.

1. 양식의 필드를 작성하십시오(아래 참조).

1. 새 문서 및 미디어 SharePoint 리포지토리에 대한 권한을 정의합니다.

1. 완료되면 *저장* 을 클릭합니다.

**리포지토리 유형**: 원하는 SharePoint 리포지토리 구성을 선택합니다.

**사이트 절대 URL**: 절대 URL을 입력하여 상대 URL을 확인합니다(예: SharePoint Online의 경우 `https://[your-site-name].sharepoint.com`).

**라이브러리 경로**: Documents and Media에 마운트하려는 SharePoint 문서 라이브러리를 가리키는 사이트 절대 URL의 상대 경로를 입력합니다.

적절한 권한이 있는 사용자는 SharePoint 문서 및 폴더를 읽고 쓰고, 문서 체크인/체크아웃을 수행하고, 문서를 다운로드하는 등의 작업을 수행할 수 있습니다. 한 컨텍스트에서 수행된 각 작업은 다른 컨텍스트에서 전파됩니다.

## 추가 정보

* [SharePoint에 대한 Liferay의 REST 커넥터 활성화](./enabling-liferays-rest-connector-to-sharepoint.md)
