---
toc:
- ./documents-and-media/uploading-and-managing.md
- ./documents-and-media/publishing-and-sharing.md
- ./documents-and-media/videos.md
- ./documents-and-media/developer-guide.md
- ./documents-and-media/devops.md
- ./documents-and-media/documents-and-media-ui-reference.md
---
# 문서 및 미디어

문서 및 미디어 애플리케이션은 Liferay 인스턴스에서 파일을 저장하고 관리합니다. 여기에는 문서 및 미디어에 직접 업로드된 파일과 첨부 파일을 지원하는 애플리케이션에서 업로드된 파일이 포함됩니다.

업로드된 모든 파일은 지정된 [파일 저장소](../system-administration/file-storage.md)에 저장됩니다. 기본적으로 문서 및 미디어는 [단순 파일 시스템 저장소](../system-administration/file-storage/other-file-store-types/simple-file-system-store.md)사용하지만 대체 파일 저장소(예: [디비스토어](../system-administration/file-storage/other-file-store-types/dbstore.md) , [Google Cloud Store](../system-administration/file-storage/other-file-store-types/google-cloud-storage.md)또는 [Amazon S3 Store](../system-administration/file-storage/other-file-store-types/amazon-s3-store.md))를 사용하도록 인스턴스를 구성할 수 있습니다.

![문서 및 미디어를 사용하여 Liferay 인스턴스에 대한 파일을 저장, 보기 및 관리합니다.](./documents-and-media/images/01.png)

업로드되면 Liferay UI를 통해 디지털 자산을 검색, 필터링 및 구성하거나 [WebDAV](./documents-and-media/publishing-and-sharing/accessing-documents-with-webdav.md) 을 사용하여 시스템의 파일 관리자를 통해 문서에 액세스할 수 있습니다. 문서 및 미디어를 [Microsoft Office 365](./documents-and-media/devops/enabling-document-creation-and-editing-with-microsoft-office-365.md), [OpenOffice](./documents-and-media/devops/enabling-openoffice-libreoffice-integration.md), [Google Drive](./documents-and-media/devops/google-drive-integration/enabling-links-to-google-drive-documents.md)및 기타 애플리케이션과 통합하여 Liferay UI에서 추가 기능을 제공할 수도 있습니다.

자산 게시 및 버전 업데이트를 관리하는 데 도움이 되도록 문서 및 미디어용 Liferay [워크플로](../process-automation/workflow/using-workflows/activating-workflow.md#activating-workflow-for-specific-applications) 활성화합니다. 활성화되면 문서를 게시하기 전에 검토해야 합니다.

업로드하거나 업데이트할 때 파일에 대해 [미리보기를 자동으로 생성](./documents-and-media/devops/configuring-documents-and-media-previews.md)하도록 문서 및 미디어 통합을 구성할 수 있습니다.

문서 및 미디어에 추가된 파일은 첨부 파일(예: 웹 콘텐츠, 게시판)과 페이지 조각 및 위젯(예: [미디어 갤러리](./documents-and-media/publishing-and-sharing/publishing-documents.md#using-the-media-gallery-widget) )을 지원하는 애플리케이션에 표시될 수 있습니다.

원하는 경우 [문서 및 미디어 자산](../site-building/sites/exporting-importing-site-pages-and-content.md) Liferay 아카이브(`LAR`) 파일로 내보낼 수 있습니다. 이러한 파일은 백업으로 사용하거나 자산을 다른 사이트 또는 자산 라이브러리로 가져오는 데 사용할 수 있습니다.

```{tip}
문서 및 미디어는 모든 사이트에서 사용할 수 있으며 [자산 라이브러리](./asset-libraries/asset-libraries-overview.md)에서 활성화할 수 있습니다. 사이트에 업로드된 파일은 해당 사이트로 범위가 지정되며 DXP 인스턴스의 다른 사이트에서 쉽게 액세스할 수 없습니다. 자산 라이브러리에 업로드된 파일은 전역적으로 사용할 수 있으며 즉시 액세스할 수 있도록 여러 사이트에 연결할 수 있습니다.
```
