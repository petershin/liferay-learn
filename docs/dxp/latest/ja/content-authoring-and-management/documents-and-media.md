---
toc:
- ./documents-and-media/uploading-and-managing.md
- ./documents-and-media/publishing-and-sharing.md
- ./documents-and-media/videos.md
- ./documents-and-media/developer-guide.md
- ./documents-and-media/devops.md
- ./documents-and-media/documents-and-media-ui-reference.md
---
# ドキュメントとメディア

ドキュメントとメディアアプリケーションは、Liferayインスタンス内のファイルを保存および管理します。 これには、ドキュメントとメディアに直接アップロードされたファイルだけでなく、添付ファイルをサポートしているアプリケーションにアップロードされたファイルも含まれます。

アップロードされたすべてのファイルは、指定された[ファイルストア](../system-administration/file-storage.md)に保存されます。 デフォルトでは、Documents and Media は [簡易ファイルシステムストア](../system-administration/file-storage/other-file-store-types/simple-file-system-store.md) を使用しますが、別のファイルストア（例： [DBStore](../system-administration/file-storage/other-file-store-types/dbstore.md) , [Google Cloud Store](../system-administration/file-storage/other-file-store-types/google-cloud-storage.md), または [Amazon S3 Store](../system-administration/file-storage/other-file-store-types/amazon-s3-store.md)）を使用するようにインスタンスを構成することができま す。

![ドキュメントとメディアを使用して、Liferayインスタンスのファイルを保存、表示、および管理します。](./documents-and-media/images/01.png)

アップロード後は、Liferay UIでデジタル資産を検索、フィルタリング、整理したり、 [WebDAV](./documents-and-media/publishing-and-sharing/accessing-documents-with-webdav.md) 、システムのファイルマネージャーからドキュメントにアクセスすることが可能です。 また、ドキュメントとメディアを [Microsoft Office 365](./documents-and-media/devops/enabling-document-creation-and-editing-with-microsoft-office-365.md)、 [OpenOffice](./documents-and-media/devops/enabling-openoffice-libreoffice-integration.md)、 [Google Drive](./documents-and-media/devops/google-drive-integration/enabling-links-to-google-drive-documents.md)、その他のアプリケーションと統合し、Liferay UIに追加機能を提供することができます。

Liferay [Workflow](../process-automation/workflow/using-workflows/activating-workflow.md#activating-workflow-for-specific-applications) for Documents and Media を有効にして、アセットのパブリッシングとバージョンアップを管理できるようにします。 有効にすると、ドキュメントを公開する前にレビューする必要があります。

[ドキュメントとメディアの統合を設定すると、アップロードまたは更新時にファイルのプレビュー](./documents-and-media/devops/configuring-documents-and-media-previews.md) を自動的に生成することができます。

ドキュメントやメディアに追加されたファイルは、添付ファイルをサポートするアプリケーション（Webコンテンツ、メッセージボードなど）のほか、ページフラグメントやウィジェット（ [Media Gallery](./documents-and-media/publishing-and-sharing/publishing-documents.md#using-the-media-gallery-widget) など）でも表示することが可能です。

必要であれば、 [エクスポート](../site-building/sites/exporting-importing-site-pages-and-content.md) Documents と Media assets を Liferay Archive (`LAR`) ファイルとしてエクスポートすることが可能です。 これらのファイルは、バックアップとして使用したり、アセットを別のサイトまたはアセットライブラリにインポートするために使用できます。

```{tip}
ドキュメントとメディアはすべてのサイトで利用でき、[アセットライブラリ](./asset-libraries/asset-libraries-overview.md)で有効にすることが可能です。 サイトにアップロードされたファイルはそのサイトにスコープされており、DXPインスタンス内の他のサイトから容易にアクセスすることはできません。 アセットライブラリにアップロードされたファイルはグローバルに利用可能であり、複数のサイトにリンクしてすぐにアクセスできます。
```

```{raw} html
:file: ../landingpage_template.html
```

```{raw} html
:file: documents-and-media/landing.html
```
