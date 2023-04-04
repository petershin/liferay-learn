---
uuid: a266c23a-5c23-4de6-a818-21e83f79cb1e
---

# 문서 URL 구성

{bdg-secondary}`사용 가능한 Liferay 7.4 U27+/GA27+`

파일이 업로드되면 Liferay는 파일에 액세스할 수 있는 친숙한 URL을 자동으로 생성합니다. 이 URL은 `[server-address]/documents/d/[사이트의 친숙한 URL]/[file-friendly-URL]`구조를 사용합니다. 업로드 중에 지정하지 않는 한 Liferay는 친숙한 URL에 파일 이름을 사용하지만 언제든지 이 값을 변경할 수 있습니다. 일단 설정되면 친숙한 URL에서 파일의 최신 버전에 액세스할 수 있습니다.

```{note}
7.4 U26/GA26 및 이전 버전의 경우 Liferay는 `[server-address]/documents/[site-id]/[folder-id]/[file-name]/[UUID]` 구조를 사용하여 파일 URL을 생성합니다. U27+/GA27+로 업데이트하는 경우 기존 파일은 이 패턴을 기반으로 이전 URL을 계속 사용합니다. 그러나 사용자가 기존 파일을 업데이트하면 Liferay는 새 구조를 사용하도록 해당 URL을 변환합니다. 업데이트될 때까지 이전 URL을 사용하여 파일에 계속 액세스할 수 있습니다. 
```

## 문서에 친숙한 URL 설정

[파일 업로드](./uploading-files.md) 동안 또는 파일을 편집할 때마다 파일의 친숙한 URL을 수동으로 구성할 수 있습니다.

```{note}
여러 파일을 업로드할 때 각 파일의 친숙한 URL은 해당 이름을 사용하여 자동으로 생성됩니다. 
```

파일의 친숙한 URL을 설정하려면 다음 단계를 따르십시오.

1. *사이트 메뉴* ( ![Site Menu](../../../images/icon-product-menu.png) )을 열고 *콘텐츠 & 데이터*확장한 다음 *문서 및 미디어*로 이동합니다.

1. 원하는 파일 업로드 또는 편집을 시작합니다.

1. *친숙한 URL* 필드를 편집합니다.

   각 URL 값은 사이트마다 고유해야 합니다. 값이 이미 사용 중인 경우 Liferay는 URL 끝에 숫자 값을 추가하여 충돌을 자동으로 해결합니다(예: `my-file`, `my-file-1`, `my-file-2`).

   ![파일을 업로드하거나 편집할 때 친숙한 URL을 변경할 수 있습니다.](./configuring-document-urls/images/01.png)

1. *게시*클릭합니다.

저장되면 지정된 URL(예: `http://[server-address]/documents/d/[site-friendly-url]/[file-friendly-URL]`)에서 파일에 액세스할 수 있습니다.

## 친숙한 URL 기록

파일의 친숙한 URL을 변경하면 Liferay는 자동으로 이전 URL의 기록을 유지합니다. 이 저장된 URL을 계속 사용하여 파일의 최신 버전에 액세스할 수 있습니다. 원하는 경우 오래된 친근한 URL 항목을 제거할 수 있습니다.

```{note}
친숙한 URL 기록에 저장되는 동안 이전 파일 URL은 동일한 사이트의 다른 파일에 사용할 수 없습니다. 다른 파일의 URL을 다시 사용하려면 먼저 파일의 친숙한 URL 기록에서 해당 URL을 제거해야 합니다.
```

파일에 대해 유지된 URL을 보고 관리하려면 다음 단계를 따르십시오.

1. *사이트 메뉴* ( ![Site Menu](../../../images/icon-product-menu.png) )을 열고 *콘텐츠 & 데이터*확장한 다음 *문서 및 미디어*로 이동합니다.

1. 원하는 파일에 대해 *동작* 버튼( ![Actions Button](../../../images/icon-actions.png) )을 클릭하고 *편집*선택합니다.

1. 친숙한 URL 필드에서 *기록* 버튼( ![History Button](../../../images/icon-history.png) )을 클릭합니다.

   ![친숙한 URL 필드의 기록 버튼을 클릭합니다.](./configuring-document-urls/images/02.png)

1. *복원* 버튼( ![Restore Button](../../../images/icon-restore2.png) )을 클릭하여 현재 친숙한 URL을 선택한 URL로 바꿉니다.

1. *URL 잊어버리기* 버튼( ![Forget URL Button](../../../images/icon-delete.png) )을 클릭하여 파일 기록에서 선택한 URL을 제거합니다. 제거되면 더 이상 URL을 사용하여 파일에 액세스할 수 없습니다.

   ![복원 또는 URL 잊어버리기 버튼을 클릭합니다.](./configuring-document-urls/images/03.png)

친숙한 URL 기록에 대한 변경 사항은 자동으로 저장됩니다.

```{note}
Liferay 7.4 U34/GA34부터 표시 페이지 템플릿 프레임워크는 각 파일의 친숙한 URL 기록을 고려합니다. 즉, 해당 URL이 파일의 친숙한 URL 기록에 남아 있는 경우 사용자는 이전의 친숙한 URL을 사용하여 파일의 표시 페이지에 계속 액세스할 수 있습니다. 파일의 친숙한 URL 기록에 있는 모든 URL은 자동으로 파일의 현재 URL로 리디렉션됩니다.

파일이 표시 페이지 템플릿과 동일한 사이트에 있는 경우 파일의 친숙한 URL이 표시 페이지 URL(예: `display-page-url/file-friendly-url`)에 추가됩니다. 그러나 파일이 템플릿과 다른 사이트 또는 자산 라이브러리에 있는 경우 URL 패턴에는 파일 사이트 또는 자산 라이브러리의 친숙한 URL(예: `display-page-url/site-friendly-url/document-friendly-url`). 이는 중복 URL을 피하기 위한 것입니다.
```

## 문서 버전 URL

파일에 친숙한 모든 URL은 파일의 최신 버전으로 연결됩니다. 이전 버전의 URL에 액세스하려면 파일의 버전 기록으로 이동하여 원하는 버전의 *다운로드* URL을 복사합니다.

![원하는 버전의 다운로드 URL을 복사합니다.](./configuring-document-urls/images/04.png)

## 추가 정보

* [문서 및 미디어](../../documents-and-media.md)
* [파일 업로드](./uploading-files.md)
* [사이트의 친숙한 URL 구성](../../../site-building/site-settings/managing-site-urls/configuring-your-sites-friendly-url.md)
* [페이지의 친숙한 URL 구성](../../../site-building/creating-pages/page-settings/configuring-your-pages-friendly-url.md)
