# ドキュメントとメディアUIリファレンス

ドキュメントとメディアアプリケーションは、Liferay DXPインスタンスのファイルを保存、表示、および管理するために使用されます。 これはすべてのサイトで利用可能で、 [アセット・ライブラリ](../asset-libraries/asset-libraries-overview.md) で有効にできます。

サイト内のドキュメントとメディアにアクセスするには、_サイトメニュー_ (![サイトメニュー](../../images/icon-product-menu.png))を開き、_コンテンツとデータ_ &rarr; _ドキュメントとメディア_に進みます。

![Click on Documents and Media under Content & Data in the Site Menu.](./documents-and-media-ui-reference/images/01.png)

アセット・ライブラリ内のドキュメントとメディアにアクセスするには、それが有効になっているライブラリに移動し、_ドキュメントとメディア_をクリックします。

![Click on Documents and Media in the asset library.](./documents-and-media-ui-reference/images/02.png)

Documents and Mediaアプリケーションには3つのメインタブがあります： [ファイル](#files-tab) 、 [ドキュメントタイプ](#document-types-tab) 、 [メタデータセット](#metadata-sets-tab) 。

[アプリケーションバー](#application-bar-settings) の_Actions_ (![Actionsボタン](../../images/icon-actions.png))をクリックすることで、追加設定にアクセスできます。

```{note}
ドキュメントとメディアのUIは、アセット・ライブラリでもサイトでも同じです。
```

## ファイルタブ

![The Files tab provides access to the application's primary features.](./documents-and-media-ui-reference/images/03.png)

Filesタブでは、アプリケーションの主な機能にアクセスできます。 ここでは、すべてのデジタルアセット、フォルダ、および接続されたリポジトリを表示、検索、追加、および管理できます。

```{note}
ホームフォルダは、ドキュメントとメディアアプリケーションのルートフォルダとして機能します。
```

*追加* (![追加ボタン](../../images/icon-add.png))をクリックすると、以下のアクションにアクセスできます：ファイルアップロード、複数ファイルアップロード、フォルダ、リポジトリ、ショートカット、外部ビデオショートカット。 詳しくは [フォルダの使用](./uploading-and-managing/using-folders.md) および [ファイルのアップロード](./uploading-and-managing/uploading-files.md) を参照してください。

![Click Add to create a new folder or digital asset.](./documents-and-media-ui-reference/images/04.png)

カスタム [ドキュメントタイプ](#document-types-tab) を作成した場合、利用可能なオプションとしてここに表示されます。

ファイルやフォルダの_アクション_ (![アクションボタン](../../images/icon-actions.png))をクリックすると、ダウンロード、編集、移動、削除ができます。 また、ファイルをチェックアウトまたはチェックインして、ファイルのバージョンを作成することもできます。

## ［ドキュメントタイプ］タブ

![Create custom templates for file uploads in the Document Types tab.](./documents-and-media-ui-reference/images/05.png)

ここでは、ドキュメントとメディアに新しいファイルを追加するために使用されるカスタムテンプレートを作成および管理できます。 _ドキュメント・タイプ_は、メタデータ・フィールドを使用して作成され、アップロードされたファイルに検索可能な追加情報を提供します。

新しいドキュメントタイプを作成するには、設定可能なメタデータフィールドをドロップゾーンにドラッグ＆ドロップします。 また、説明を追加したり、カスタム [メタデータセット](#metadata-sets-tab) を含めたり、権限を管理することもできる。

![Create and configure custom document types.](./documents-and-media-ui-reference/images/06.png)

作成したら、テンプレートを使用して、［ドキュメントとメディア］タブで新しいデジタルアセットを追加できます。 詳細は、 [Defining Document Types](./uploading-and-managing/managing-metadata/defining-document-types.md) を参照してください。

## ［メタデータセット］タブ

![Create custom groups of data fields in the Metadata Sets tab.](./documents-and-media-ui-reference/images/07.png)

ここでは、カスタム・ドキュメント・タイプに追加できる、再利用可能なメタデータ・フィールドのグループを定義できます。 _メタデータ・セット_は、文書タイプと同じように、メタデータ・フィールドを指定のドロップ・ゾーンにドラッグ・アンド・ドロップすることで構成される。

![Use fields to create reusable metadata sets.](./documents-and-media-ui-reference/images/08.png)

一度作成されたメタデータ・セットは、カスタム・ドキュメント・タイプに追加することができる。 詳細は、 [Defining Metadata Sets](./uploading-and-managing/managing-metadata/defining-metadata-sets.md) を参照してください。

## アプリケーションバーの設定

![Access these documents and media settings in the Application Bar.](./documents-and-media-ui-reference/images/09.png)

アプリケーションバーでは、以下の「ドキュメントとメディア」設定を使用できます：

* [デスクトップからのアクセス](#access-from-desktop) 
* [編集](#edit) (![編集アイコン](../../images/icon-edit.png))
* [ホームフォルダ権限](#home-folder-permissions) (![権限アイコン](../../images/icon-permissions.png))
* [輸出/輸入](#exportimport) (![輸出/輸入アイコン](../../images/icon-sort.png))
* [コンフィギュレーション](#configuration) (![コンフィギュレーション・アイコン](../../images/icon-cog.png))

### デスクトップからアクセスする

ファイルエクスプローラーでドキュメントとメディアリソースにアクセスするためのWebDAV URLを生成します。

![Generate the WebDAV URL.](./documents-and-media-ui-reference/images/10.png)

### 編集する

すべての文書タイプのデフォルト [ワークフロー](../../process-automation/workflow/using-workflows/activating-workflow.md) を有効または無効にします。 ワークフローの詳細については、 [ワークフロー入門](../../process-automation/workflow/introduction-to-workflow.md) を参照してください。

![Select a default workflow.](./documents-and-media-ui-reference/images/11.png)

### ホームフォルダー権限

Documents and Mediaホームフォルダの権限を管理します。 パーミッションの詳細については、 [Understanding Roles and Permissions](../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) を参照してください。

![Manage permissions for the documents and media home folder.](./documents-and-media-ui-reference/images/12.png)

### エクスポート / インポート

ドキュメントやメディアコンテンツの [エクスポートまたはインポート](../../site-building/sites/exporting-importing-site-pages-and-content.md) 操作を開始します。 コンテンツは `LAR` (Liferay archive) ファイルとしてエクスポートされます。 現在および以前のエクスポートを表示することもできます。

![Initiate export or import operations for documents and media.](./documents-and-media-ui-reference/images/13.png)

### 設定

文書やメディアに対する電子メール通知を設定します。 電子メール通知を設定する際、情報の解析にデフォルトのプレースホルダーを使用することができます（例：`[$COMPANY_ID$]`、`[$DOCUMENT_TYPE$]`、`[$TO_NAME$]`）。 利用可能なプレースホルダは、各タブの「用語の定義」に表示されます。

```{note}
メール通知を使用するには、接続されたメールサーバーが必要です。 詳しくは [メール](../../installation-and-upgrades/setting-up-liferay/configuring-mail.md) の設定を参照してください。
```

**電子メールの差出人**: 電子メールの送信者として使用する名前と電子メール アドレスを入力します。

![Enter the sender's name and email address.](./documents-and-media-ui-reference/images/14.png)

**文書追加メール**：文書が追加されたときのメール通知を有効/無効にし、メールの件名と本文を作成します。

![Compose the email sent when a document is added.](./documents-and-media-ui-reference/images/15.png)

**Document Updated Email**：既存の文書が更新されたときのメール通知を有効/無効にし、メールの件名と本文を作成します。

![Compose the email sent when existing documents are updated.](./documents-and-media-ui-reference/images/16.png)

**Document Needs Review Email**：既存の文書がレビューのために提出された際のEメール通知を有効/無効にし、Eメールの件名と本文を作成します。

![Compose the email sent when existing documents are submitted for review.](./documents-and-media-ui-reference/images/17.png)

**文書期限切れメール**：既存の文書が有効期限に達した場合のメール通知を有効/無効にし、メールの件名と本文を作成します。

![Compose the email sent when existing documents have expired.](./documents-and-media-ui-reference/images/18.png)

## 関連トピック

* [ドキュメントとメディア](../documents-and-media.md)
* [サイトページとコンテンツのエクスポート/インポート](../../site-building/sites/exporting-importing-site-pages-and-content.md)
