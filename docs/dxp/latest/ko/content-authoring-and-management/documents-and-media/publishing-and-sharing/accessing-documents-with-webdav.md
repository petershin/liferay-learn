# WebDAV를 사용하여 문서에 액세스

[WebDAV](https://en.wikipedia.org/wiki/WebDAV) 을 통해 데스크탑 파일 관리자에서 문서 라이브러리에 액세스할 수 있습니다. WebDAV는 웹 서버에 저장된 파일을 관리하기 위한 HTTP 기반 프로토콜입니다. WebDAV는 Linux, macOS, Windows를 포함한 대부분의 주요 운영 체제와 데스크탑 환경에서 지원됩니다.

파일 브라우저에서 문서 라이브러리 폴더에 액세스하려면 로그인 자격 증명과 액세스하려는 폴더의 WebDAV URL을 사용해야 합니다.

## WebDAV 비밀번호 생성 중

{bdg-secondary}`liferay DXP 2023.Q4+/포탈 7.4 GA98+`

최신 Liferay 버전에서는 WebDAV 클라이언트에서 사용하려면 계정 설정에서 WebDAV 비밀번호를 생성해야 합니다. 이는 WebDAV의 다이제스트 인증에 사용되는 약한 해시를 저장하지 않기 위한 것입니다. 다이제스트 인증은 안전하지 않으며 Liferay에서는 더 이상 사용되지 않습니다. WebDAV를 통해 처음으로 문서에 액세스하려고 하면 WebDAV 비밀번호를 생성하라는 메시지가 표시됩니다.

![You must generate a WebDAV password before using it for the first time.](./accessing-documents-with-webdav/images/03.png)

WebDAV 비밀번호를 생성하려면,

1. 사이트 홈 페이지에서 사용자 아이콘을 클릭하고 **계정 설정** 을 선택하세요.

1. 왼쪽 메뉴에서 **비밀번호** 를 선택하세요.

1. **WEBDAV 비밀번호** 섹션까지 아래로 스크롤하고 **WebDAV 비밀번호 생성** 을 클릭합니다.

   ![Generate a WebDAV password to use with your client.](./accessing-documents-with-webdav/images/04.png)

   그러면 WebDAV 사용자 이름과 자동 생성된 비밀번호가 표시됩니다. 이 필드는 읽기 전용 필드이므로 나중에 사용하려면 복사해야 합니다. WebDAV 비밀번호를 다시 생성하기 위해 버튼을 클릭하면 새로운 비밀번호가 생성되어 기존 비밀번호는 쓸모 없게 됩니다.

이제 [아래 지침](#using-the-webdav-client-to-access-documents) 따르고 메시지가 표시되면 WebDAV 사용자 이름과 비밀번호를 사용하십시오.

## WebDAV 클라이언트를 사용하여 문서에 액세스

1. 원하는 사이트 또는 자산 라이브러리에서 문서 및 미디어 애플리케이션을 엽니다.

1. 원하는 폴더에 대한 **작업** 버튼(![작업 버튼](../../../images/icon-actions.png))을 클릭하고 **데스크톱에서 액세스** 를 선택합니다.

   ![Select Access from Desktop to get the folder's WebDAV URL.](./accessing-documents-with-webdav/images/01.png)

1. 폴더의 고유한 **WebDAV URL** 을 복사합니다.

   ![Copy the folder's WebDAV URL.](./accessing-documents-with-webdav/images/02.png)

1. 운영 체제에 대한 지침을 따르십시오.

   * **Windows:** 네트워크 드라이브를 WebDAV URL에 매핑합니다. 메시지가 나타나면 자격 증명을 입력하세요. 인증되면 문서 라이브러리 폴더가 네트워크 드라이브로 나타납니다.

   * **macOS:** Finder를 열고 **이동** &rarr; **서버에 연결** 을 선택합니다. 서버 주소 필드에 액세스하려는 폴더의 WebDAV URL을 입력한 다음 **연결** 을 클릭하고 메시지가 나타나면 자격 증명을 입력합니다.

   * **Linux:** Linux의 경우 폴더의 WebDAV URL을 약간 수정해야 합니다. KDE Dolphin의 경우 URL 프로토콜을 `http://` 대신 `webdav://`로 변경하세요. 그놈 파일의 경우 URL 프로토콜을 `http://` 대신 `dav://`로 변경하세요. 파일 관리자에 수정된 URL을 붙여넣고 **Enter** 를 누른 다음 메시지가 나타나면 자격 증명을 입력하세요.

일단 설정되면 운영 체제의 파일 브라우저를 사용하여 연결된 문서 및 미디어 폴더에 있는 파일을 추가, 편집 및 삭제할 수 있습니다. 파일 시스템의 이 폴더에 있는 파일을 편집하면 모든 변경 사항이 Liferay에 나타나고 파일의 부 버전이 증가합니다.

## 관련 주제

* [문서 공유 활성화 및 구성](./managing-document-access/enabling-and-configuring-sharing.md)
* [다른 사용자와 문서 공유](./managing-document-access/sharing-documents-with-other-users.md)
* [폴더 사용하기](../uploading-and-managing/using-folders.md)
* [문서 및 미디어 UI 참조](../documents-and-media-ui-reference.md)
