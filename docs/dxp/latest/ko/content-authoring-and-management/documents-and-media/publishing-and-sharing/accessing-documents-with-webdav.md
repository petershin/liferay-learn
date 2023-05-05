# WebDAV로 문서 액세스

[WebDAV](https://en.wikipedia.org/wiki/WebDAV) 을 통해 데스크톱 파일 관리자에서 문서 라이브러리에 액세스할 수 있습니다. WebDAV는 웹 서버에 저장된 파일을 관리하기 위한 HTTP 기반 프로토콜입니다. WebDAV는 Linux, macOS 및 Windows를 포함한 대부분의 주요 운영 체제 및 데스크탑 환경에서 지원됩니다.

파일 브라우저에서 문서 라이브러리 폴더에 액세스하려면 로그인 자격 증명과 액세스하려는 폴더의 WebDAV URL을 사용해야 합니다. 다음과 같이하세요:

1. 원하는 사이트 또는 자산 라이브러리에서 문서 및 미디어 응용 프로그램을 엽니다.

1. 원하는 폴더의 **동작** 버튼(![동작 버튼](../../../images/icon-actions.png))을 클릭하고 **데스크톱에서 액세스** 를 선택합니다.

   ![데스크톱에서 액세스를 선택하여 폴더의 WebDAV URL을 가져옵니다.](./accessing-documents-with-webdav/images/01.png)

1. 폴더의 고유한 **WebDAV URL** 을 복사합니다.

   ![폴더의 WebDAV URL을 복사합니다.](./accessing-documents-with-webdav/images/02.png)

1. 운영 체제에 대한 지침을 따르십시오.

   * **Windows:** 네트워크 드라이브를 WebDAV URL에 매핑합니다. 메시지가 표시되면 자격 증명을 입력합니다. 인증되면 문서 라이브러리 폴더가 네트워크 드라이브로 나타납니다.

   * **macOS:** Finder를 열고 **이동** &rarr; **서버에 연결** 을 선택합니다. 서버 주소 필드에 액세스하려는 폴더의 WebDAV URL을 입력한 다음 **연결** 을 클릭하고 메시지가 표시되면 자격 증명을 입력합니다.

   * **Linux:** Linux의 경우 폴더의 WebDAV URL을 약간 수정해야 합니다. KDE Dolphin의 경우 URL의 프로토콜을 `http://`대신 `webdav://` 로 변경하십시오. GNOME 파일의 경우 URL의 프로토콜을 `http://`대신 `dav://` 로 변경하십시오. 수정된 URL을 파일 관리자에 붙여넣고 **Enter** 을 누른 다음 메시지가 표시되면 자격 증명을 입력합니다.

일단 설정되면 운영 체제의 파일 브라우저를 사용하여 연결된 문서 및 미디어 폴더에서 파일을 추가, 편집 및 삭제할 수 있습니다. 파일 시스템의 이 폴더에 있는 파일을 편집하면 모든 변경 사항이 Liferay에 나타나고 파일의 부 버전이 증가합니다.

## 추가 정보

* [문서 공유 활성화 및 구성](./managing-document-access/enabling-and-configuring-sharing.md)
* [다른 사용자와 문서 공유](./managing-document-access/sharing-documents-with-other-users.md)
* [폴더 사용](../uploading-and-managing/using-folders.md)
* [문서 및 미디어 UI 참조](../documents-and-media-ui-reference.md)
