# Microsoft Office 365로 문서 생성 및 편집 활성화

Office 365&trade; 을 사용하여 문서 및 미디어 파일을 만들고 편집하려면 먼저 [Azure Portal](https://portal.azure.com)에서 애플리케이션과 연결하도록 DXP를 구성해야 합니다. 다음 단계를 수행하려면 관리자 권한이 있어야 합니다.

## Microsoft ID 플랫폼에 애플리케이션 등록

먼저 Microsoft ID 플랫폼&trade;으로 애플리케이션을 구성합니다. 이렇게 하려면 [Microsoft 설명서](https://docs.microsoft.com/en-gb/graph/auth-register-app-v2)에 설명된 단계를 따르십시오.

*리디렉션 URI* 매개변수에 대한 URL을 구성하려면 다음 패턴을 따릅니다. `https://[hostname]/o/document_library/onedrive/oauth2`

다음은 Office 365&trade; 통합을 사용하는 데 필요한 최소 권한 집합입니다.

* `Files.Read.All`
* `Files.ReadWrite.All`

권한에 대한 자세한 내용은 [Microsoft 설명서](https://docs.microsoft.com/graph/permissions-reference)를 참조하십시오.

## DXP 구성

이제 DXP 설치를 Microsoft ID 플랫폼&trade; 애플리케이션과 연결해야 합니다. 두 가지 범위에서 이 작업을 수행할 수 있습니다.

* DXP 설치의 모든 인스턴스에 대해 전역적으로.
* DXP 설치에 있는 하나 이상의 인스턴스에 대한 인스턴스 범위에서.

해당 인스턴스를 개별적으로 구성하여 하나 이상의 인스턴스에 대한 전역 구성을 재정의할 수 있습니다. 마찬가지로 애플리케이션에 연결하려는 인스턴스만 구성하고 전역 구성은 비워 둘 수 있습니다.

### 전역 수준 구성

1. *제어판* &rarr; *시스템 설정* &rarr; *문서 및 미디어*로 이동합니다.

1. 왼쪽 메뉴에서 *OneDrive* 을 클릭합니다.

    ![클라이언트 ID, 클라이언트 암호 및 테넌트를 입력합니다.](./enabling-document-creation-and-editing-with-microsoft-office-365/images/01.png)

1. *클라이언트 ID* 및 *클라이언트 암호* 필드에 각각 애플리케이션의 OAuth 2 클라이언트 ID 및 클라이언트 암호를 입력합니다.
1. *테넌트* 필드에 테넌트 ID를 입력합니다. 테넌트 ID를 찾으려면 [Microsoft 설명서](https://docs.microsoft.com/onedrive/find-your-office-365-tenant-id)를 참조하십시오.
1. *저장*을 클릭합니다.

전역 수준에서 액세스 권한이 부여되었습니다.

### 인스턴스 수준 구성

1. *제어판* &rarr; *인스턴스 설정* &rarr; *콘텐츠 및 데이터 &rarr; *문서 및 미디어*로 이동합니다.

1. 왼쪽 탐색 메뉴에서 *OneDrive* 을 클릭합니다.

    ![인스턴스 수준에서 해당 필드에 자격 증명을 입력합니다.](./enabling-document-creation-and-editing-with-microsoft-office-365/images/02.png)

1. *클라이언트 ID* 및 *클라이언트 암호* 필드에 각각 애플리케이션의 OAuth 2 클라이언트 ID 및 클라이언트 암호를 입력합니다.
1. *테넌트* 필드에 테넌트 ID를 입력합니다. 테넌트 ID를 찾으려면 [Microsoft 설명서](https://docs.microsoft.com/onedrive/find-your-office-365-tenant-id)를 참조하십시오.
1. *저장*을 클릭합니다.

 **참고:** 활성화되면 양식에서 클라이언트 ID, 클라이언트 암호 및 테넌트 값을 삭제하여 이 기능을 비활성화할 수 있습니다.

## 추가 정보

* [Google 드라이브로 문서 생성 및 편집 활성화](./google-drive-integration/enabling-document-creation-and-editing-with-google-drive.md)
* [Microsoft Office 365로 문서 작성 및 편집](../uploading-and-managing/creating-documents/creating-and-editing-documents-with-microsoft-office-365.md)
