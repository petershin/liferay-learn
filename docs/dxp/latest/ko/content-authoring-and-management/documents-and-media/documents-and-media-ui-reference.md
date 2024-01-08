# 문서 및 미디어 UI 참조

문서 및 미디어 애플리케이션은 Liferay DXP 인스턴스의 파일을 저장하고, 보고, 관리하는 데 사용됩니다. 모든 사이트에서 사용할 수 있으며 [자산 라이브러리](../asset-libraries/asset-libraries-overview.md) 에 대해 활성화할 수 있습니다.

사이트의 문서 및 미디어에 액세스하려면 **사이트 메뉴**(![사이트 메뉴](../../images/icon-product-menu.png))를 열고 **콘텐츠 및 데이터** &rarr; **문서로 이동하세요. 및 미디어** .

![Click on Documents and Media under Content & Data in the Site Menu.](./documents-and-media-ui-reference/images/01.png)

자산 라이브러리의 문서 및 미디어에 액세스하려면 활성화된 라이브러리로 이동하여 **문서 및 미디어** 를 클릭하세요.

![Click on Documents and Media in the asset library.](./documents-and-media-ui-reference/images/02.png)

문서 및 미디어 애플리케이션에는 [파일](#files-tab) , [문서 유형](#document-types-tab) 및 [메타데이터 세트](#metadata-sets-tab) 의 세 가지 기본 탭이 있습니다.

[애플리케이션 표시줄](#application-bar-settings) 에서 **작업**(![작업 버튼](../../images/icon-actions.png))을 클릭하여 추가 설정에 액세스할 수 있습니다.

```{note}
문서 및 미디어 UI는 자산 라이브러리와 사이트에서 동일합니다.
```

## 파일 탭

![The Files tab provides access to the application's primary features.](./documents-and-media-ui-reference/images/03.png)

파일 탭에서는 애플리케이션의 주요 기능에 대한 액세스를 제공합니다. 여기에서는 모든 디지털 자산, 폴더 및 연결된 저장소를 보고, 검색하고, 추가하고, 관리할 수 있습니다.

```{note}
홈 폴더는 문서 및 미디어 응용 프로그램의 루트 폴더 역할을 합니다.
```

**추가**(![추가 버튼](../../images/icon-add.png))를 클릭하면 파일 업로드, 여러 파일 업로드, 폴더, 저장소, 바로가기, 외부 비디오 바로가기 등의 작업에 액세스할 수 있습니다. 자세한 내용은 [폴더](./uploading-and-managing/using-folders.md) 및 [사용 파일 업로드](./uploading-and-managing/uploading-files.md) 참조하세요.

![Click Add to create a new folder or digital asset.](./documents-and-media-ui-reference/images/04.png)

사용자 정의 [문서 유형](#document-types-tab) 을 생성한 경우 여기에 사용 가능한 옵션으로 표시됩니다.

파일 또는 폴더의 **작업**(![작업 버튼](../../images/icon-actions.png))을 클릭하여 다운로드, 편집, 이동 또는 제거합니다. 파일을 체크아웃하거나 체크인하여 파일 버전을 생성할 수도 있습니다.

## 문서 유형 탭

![Create custom templates for file uploads in the Document Types tab.](./documents-and-media-ui-reference/images/05.png)

여기서는 문서 및 미디어에 새 파일을 추가하는 데 사용되는 사용자 정의 템플릿을 만들고 관리할 수 있습니다. **문서 유형** 은 메타데이터 필드를 사용하여 생성되며 업로드된 파일에 대해 검색 가능한 추가 정보를 제공합니다.

새 문서 유형을 작성하려면 구성 가능한 메타데이터 필드를 끌어서 놓기 영역에 놓습니다. 설명을 추가하고, 사용자 정의 [메타데이터 세트](#metadata-sets-tab) 을 포함하고, 권한을 관리할 수도 있습니다.

![Create and configure custom document types.](./documents-and-media-ui-reference/images/06.png)

생성된 후에는 템플릿을 사용하여 문서 및 미디어 탭에 새 디지털 자산을 추가할 수 있습니다. 자세한 내용은 [문서 유형 정의](./uploading-and-managing/managing-metadata/defining-document-types.md) 참조하십시오.

## 메타데이터 세트 탭

![Create custom groups of data fields in the Metadata Sets tab.](./documents-and-media-ui-reference/images/07.png)

여기에서 사용자 정의 문서 유형에 추가할 수 있는 재사용 가능한 메타데이터 필드 그룹을 정의할 수 있습니다. **메타데이터 세트** 는 문서 유형과 동일한 방식으로 메타데이터 필드를 지정된 드롭 영역으로 끌어서 놓는 방식으로 구성됩니다.

![Use fields to create reusable metadata sets.](./documents-and-media-ui-reference/images/08.png)

일단 생성되면 메타데이터 세트를 사용자 정의 문서 유형에 추가할 수 있습니다. 자세한 내용은 [메타데이터 세트 정의](./uploading-and-managing/managing-metadata/defining-metadata-sets.md) 참조하세요.

## 응용 프로그램 표시줄 설정

![Access these documents and media settings in the Application Bar.](./documents-and-media-ui-reference/images/09.png)

응용 프로그램 표시줄에서 다음 문서 및 미디어 설정을 사용할 수 있습니다.

* [데스크톱에서 액세스](#access-from-desktop)
* [편집](#edit) (![편집 아이콘](../../images/icon-edit.png))
* [홈 폴더 권한](#home-folder-permissions) (![권한 아이콘](../../images/icon-permissions.png))
* [내보내기/가져오기](#exportimport) (![내보내기/가져오기 아이콘](../../images/icon-sort.png))
* [구성](#configuration) (![구성 아이콘](../../images/icon-cog.png))

### 데스크톱 접근

파일 탐색기에서 문서 및 미디어 리소스에 액세스하기 위한 WebDAV URL을 생성합니다.

![Generate the WebDAV URL.](./documents-and-media-ui-reference/images/10.png)

### 수정

모든 문서 유형에 대해 기본 [워크플로](../../process-automation/workflow/using-workflows/activating-workflow.md) 을 활성화하거나 비활성화합니다. 워크플로에 대해 자세히 알아보려면 [워크플로 소개](../../process-automation/workflow/introduction-to-workflow.md) 을 참조하세요.

![Select a default workflow.](./documents-and-media-ui-reference/images/11.png)

### 홈 폴더 권한

문서 및 미디어 홈 폴더에 대한 권한을 관리합니다. 권한에 대한 자세한 내용은 [역할 및 권한 이해](../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) 참조하십시오.

![Manage permissions for the documents and media home folder.](./documents-and-media-ui-reference/images/12.png)

### 내보내기/가져오기

문서 및 미디어 콘텐츠에 대해 [내보내기 또는 가져오기](../../site-building/sites/exporting-importing-site-pages-and-content.md) 작업을 시작합니다. 콘텐츠는 'LAR'(Liferay 아카이브) 파일로 내보내집니다. 현재 및 이전 내보내기도 볼 수 있습니다.

![Initiate export or import operations for documents and media.](./documents-and-media-ui-reference/images/13.png)

### 설정

문서 및 미디어에 대한 이메일 알림을 구성합니다. 이메일 알림을 구성할 때 정보 구문 분석을 위한 기본 자리 표시자를 사용할 수 있습니다(예: `[$COMPANY_ID$]`, `[$DOCUMENT_TYPE$]`, `[$TO_NAME$]`). 사용 가능한 자리 표시자는 용어 정의 아래의 각 탭에 나타납니다.

```{note}
이메일 알림을 사용하려면 연결된 메일 서버가 필요합니다. 자세한 내용은 [메일 구성](../../installation-and-upgrades/setting-up-liferay/configuring-mail.md) 참조하세요.
```

**이메일 보낸 사람** : 이메일 발신자로 사용할 이름과 이메일 주소를 입력합니다.

![Enter the sender's name and email address.](./documents-and-media-ui-reference/images/14.png)

**문서 추가 이메일** : 문서가 추가될 때 이메일 알림을 활성화/비활성화하고 이메일 제목과 내용 본문을 작성합니다.

![Compose the email sent when a document is added.](./documents-and-media-ui-reference/images/15.png)

**문서 업데이트 이메일** : 기존 문서가 업데이트될 때 이메일 알림을 활성화/비활성화하고 이메일 제목과 내용 본문을 작성합니다.

![Compose the email sent when existing documents are updated.](./documents-and-media-ui-reference/images/16.png)

**문서 검토 이메일 필요** : 기존 문서가 검토를 위해 제출될 때 이메일 알림을 활성화/비활성화하고 이메일 제목과 내용 본문을 작성합니다.

![Compose the email sent when existing documents are submitted for review.](./documents-and-media-ui-reference/images/17.png)

**문서 만료 이메일** : 기존 문서가 만료 날짜에 도달했을 때 이메일 알림을 활성화/비활성화하고 이메일 제목과 내용 본문을 작성합니다.

![Compose the email sent when existing documents have expired.](./documents-and-media-ui-reference/images/18.png)

## 관련 주제

* [문서 및 미디어](../documents-and-media.md) 
* [사이트 페이지 및 콘텐츠 내보내기/가져오기](../../site-building/sites/exporting-importing-site-pages-and-content.md) 
