# 문서 및 미디어 UI 참조

문서 및 미디어 애플리케이션은 Liferay DXP 인스턴스의 파일을 저장, 보기 및 관리하는 데 사용됩니다. 모든 사이트에서 사용할 수 있으며 [자산 라이브러리](../asset-libraries/asset-libraries-overview.md)에 대해 활성화할 수 있습니다.

사이트의 문서 및 미디어에 액세스하려면 *사이트 메뉴* (![Site Menu](../../images/icon-product-menu.png))을 열고 *콘텐츠 & 데이터* &rarr; *문서 및 미디어*로 이동합니다.

![사이트 메뉴의 콘텐츠 & 데이터에서 문서 및 미디어를 클릭합니다.](./documents-and-media-ui-reference/images/01.png)

자산 라이브러리의 문서 및 미디어에 액세스하려면 활성화된 라이브러리로 이동하고 *문서 및 미디어*을 클릭합니다.

![자산 라이브러리에서 문서 및 미디어를 클릭합니다.](./documents-and-media-ui-reference/images/02.png)

문서 및 미디어 응용 프로그램에는 [*문서 및 미디어*](#documents-and-media-tab) , [*문서 유형*](#document-types-tab) 및 [*메타데이터 세트*](#metadata-sets-tab) 의 세 가지 기본 탭이 있습니다.

[응용 프로그램 표시줄](#application-bar-settings) 에서 *작업* 버튼(![Actions Button](../../images/icon-actions.png))을 클릭하여 추가 설정에 액세스할 수 있습니다.

```{note}
문서 및 미디어 UI는 자산 라이브러리 및 사이트에서 동일합니다.
```

## 문서 및 미디어 탭

![문서 및 미디어 탭은 애플리케이션의 주요 기능에 대한 액세스를 제공합니다.](./documents-and-media-ui-reference/images/03.png)

*문서 및 미디어* 탭은 애플리케이션의 주요 기능에 대한 액세스를 제공합니다. 여기에서 모든 디지털 자산, 폴더 및 연결된 저장소를 보고, 검색하고, 추가하고, 관리할 수 있습니다.

```{note}
홈 폴더는 문서 및 미디어 응용 프로그램의 루트 폴더 역할을 합니다.
```

*추가* 버튼(![Add Button](../../images/icon-add.png))을 클릭하여 파일 업로드, 여러 파일 업로드, 폴더, 리포지토리, 바로 가기, 외부 비디오 바로 가기와 같은 작업에 액세스합니다. 자세한 내용은 [폴더 사용](./uploading-and-managing/using-folders.md) 및 [파일 업로드](./uploading-and-managing/uploading-files.md) 을 참조하십시오.

![추가 버튼을 클릭하여 새 폴더 또는 디지털 자산을 만듭니다.](./documents-and-media-ui-reference/images/04.png)

사용자 지정 [문서 유형](#document-types-tab) 을 만든 경우 여기에 사용 가능한 옵션으로 나열됩니다.

파일 또는 폴더를 다운로드, 편집, 이동 또는 제거하려면 *작업* 버튼(![Actions Button](../../images/icon-actions.png))을 클릭하십시오. *체크아웃* 또는 *체크인* 파일을 사용하여 파일 버전을 생성할 수도 있습니다.

## 문서 유형 탭

![문서 유형 탭에서 파일 업로드를 위한 사용자 지정 템플릿을 만듭니다.](./documents-and-media-ui-reference/images/05.png)

여기에서 문서 및 미디어에 새 파일을 추가하는 데 사용되는 사용자 지정 템플릿을 만들고 관리할 수 있습니다. 이러한 템플릿은 메타데이터 필드를 사용하여 생성되며 업로드된 파일에 대해 검색 가능한 추가 정보를 제공합니다.

새 문서 유형을 작성하려면 구성 가능한 메타데이터 필드를 놓기 영역으로 끌어다 놓습니다. 설명을 추가하고 사용자 정의 [메타데이터 세트](#metadata-sets-tab) 을 포함하고 권한을 관리할 수도 있습니다.

![사용자 지정 문서 유형을 만들고 구성합니다.](./documents-and-media-ui-reference/images/06.png)

일단 생성되면 템플릿을 사용하여 문서 및 미디어 탭에서 새 디지털 자산을 추가할 수 있습니다. 자세한 내용은 [문서 유형 정의](./uploading-and-managing/managing-metadata/defining-document-types.md) 을 참조하십시오.

## 메타데이터 세트 탭

![메타데이터 세트 탭에서 사용자 지정 데이터 필드 그룹을 생성합니다.](./documents-and-media-ui-reference/images/07.png)

여기에서 사용자 정의 문서 유형에 추가할 수 있는 재사용 가능한 메타데이터 필드 그룹을 정의할 수 있습니다. 이러한 메타데이터 세트는 메타데이터 필드를 지정된 놓기 영역으로 드래그 앤 드롭하여 문서 유형과 동일한 방식으로 구성됩니다.

![필드를 사용하여 재사용 가능한 메타데이터 세트를 생성합니다.](./documents-and-media-ui-reference/images/08.png)

메타데이터 세트가 생성되면 사용자 정의 문서 유형에 추가할 수 있습니다. 자세한 내용은 [메타데이터 세트 정의](./uploading-and-managing/managing-metadata/defining-metadata-sets.md) 을 참조하십시오.

## 애플리케이션 표시줄 설정

![애플리케이션 표시줄에서 이러한 문서 및 미디어 설정에 액세스합니다.](./documents-and-media-ui-reference/images/09.png)

애플리케이션 표시줄에서 다음 문서 및 미디어 설정에 액세스할 수 있습니다.

### 데스크톱 접근

파일 탐색기에서 *문서 및 미디어* 리소스에 액세스하기 위한 WebDAV URL을 생성합니다.

![WebDAV URL을 생성합니다.](./documents-and-media-ui-reference/images/10.png)

### 수정

모든 문서 유형에 대해 [워크플로](../../process-automation/workflow/using-workflows/activating-workflow.md) 을 활성화하거나 비활성화합니다. 일반적으로 워크플로우에 대해 자세히 알아보려면 [워크플로우 소개](../../process-automation/workflow/introduction-to-workflow.md)을 참조하십시오.

![워크플로 정의를 선택합니다.](./documents-and-media-ui-reference/images/11.png)

### 홈 폴더 권한

문서 및 미디어 *홈 폴더*에 대한 권한을 관리합니다. 일반적인 권한에 대해 자세히 알아보려면 [역할 및 권한 이해](../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md)을 참조하십시오.

![문서 및 미디어 홈 폴더에 대한 권한을 관리합니다.](./documents-and-media-ui-reference/images/12.png)

### 내보내기/가져오기

문서 및 미디어 콘텐츠에 대해 [내보내기 또는 가져오기](../../site-building/sites/exporting-importing-site-pages-and-content.md) 작업을 시작합니다. 콘텐츠는 `LAR` (Liferay 아카이브) 파일로 내보내집니다. 현재 및 이전 내보내기를 볼 수도 있습니다.

![문서 및 미디어에 대한 내보내기 또는 가져오기 작업을 시작합니다.](./documents-and-media-ui-reference/images/13.png)

### 설정

문서 및 미디어에 대한 이메일 알림을 구성합니다. 이메일 알림을 구성할 때 구문 분석 정보에 기본 자리 표시자를 사용할 수 있습니다(예: `[$COMPANY_ID$]`, `[$DOCUMENT_TYPE$]`, `[$TO_NAME$]`). 사용 가능한 자리 표시자는 *용어 정의*아래의 각 탭에 나타납니다.

```{note}
이메일 알림을 사용하려면 연결된 메일 서버가 필요합니다. 자세한 내용은 `메일 구성 <../../installation-and-upgrades/setting-up-liferay/configuring-mail.md>을 참조하십시오.
```

**Email From 탭**: 이메일 발신인으로 사용할 이름과 이메일 주소를 입력합니다.

![보낸 사람의 이름과 이메일 주소를 입력합니다.](./documents-and-media-ui-reference/images/14.png)

**문서 추가 이메일**: 문서가 추가될 때 이메일 알림을 활성화/비활성화하고 사용할 이메일을 작성합니다.

![문서 추가 시 발송되는 이메일을 작성합니다.](./documents-and-media-ui-reference/images/15.png)

**문서 업데이트 이메일**: 기존 문서가 업데이트될 때 이메일 알림을 활성화/비활성화하고 사용할 이메일을 작성합니다.

![기존 문서가 업데이트될 때 전송되는 이메일을 작성합니다.](./documents-and-media-ui-reference/images/16.png)

## 추가 정보

* [문서 및 미디어](../documents-and-media.md)
* [사이트 페이지 및 콘텐츠 내보내기/가져오기](../../site-building/sites/exporting-importing-site-pages-and-content.md)
