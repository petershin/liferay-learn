# WebDAVでドキュメントにアクセスする

デスクトップファイルマネージャーから [WebDAV](https://en.wikipedia.org/wiki/WebDAV) を介してドキュメントライブラリにアクセスできます。  WebDAVは、Webサーバーに保存されているファイルを管理するためのHTTPに基づくプロトコルです。 WebDAVは、Linux、macOS、Windowsなど、ほとんどの主要なオペレーティングシステムとデスクトップ環境でサポートされています。

ファイルブラウザからドキュメントライブラリフォルダにアクセスするには、ログイン認証情報とアクセスするフォルダのWebDAV URLを使用する必要があります。 次の手順を実行します：

1. 目的のサイトまたはアセットライブラリで、Documents and Mediaアプリケーションを開きます。

1. 目的のフォルダー(![Actions Button](../../../images/icon-actions.png))の **アクション** ボタンをクリックし、 **デスクトップからのアクセス** を選択します。

   ![［デスクトップからアクセスする］を選択して、フォルダのWebDAV URLを取得します。](./accessing-documents-with-webdav/images/01.png)

1. フォルダーの一意の **WebDAV URL** をコピーします。

   ![フォルダのWebDAV URLをコピーします。](./accessing-documents-with-webdav/images/02.png)

1. お使いのOSの説明書に従ってください。

   * **Windowsの場合。** ネットワークドライブをWebDAVのURLにマッピングします。 プロンプトが表示されたら、認証情報を入力します。 認証されると、「ドキュメントライブラリ」フォルダーがネットワークドライブとして表示されます。

   * **macOSの場合。** Finder を開き、 **Go** &rarr; **Connect to Server** を選択します。 ［Server Address］フィールドに、アクセスするフォルダのWebDAV URLを入力し、 ［**Connect**］ をクリックして、プロンプトが表示されたら認証情報を入力します。

   * **Linuxの場合** Linuxの場合、フォルダーのWebDAV URLを若干修正する必要があります。 KDE Dolphinの場合は、URLのプロトコルを`http://`ではなく`webdav://`に変更してください。 GNOMEファイルの場合は、URLのプロトコルを`http://`ではなく`dav://`に変更してください。 変更したURLをファイルマネージャに貼り付け、 **Enter** を押し、プロンプトが表示されたら認証情報を入力してください。

一度設定すれば、OSのファイルブラウザーで、接続されたDocuments and Mediaフォルダー内のファイルを追加、編集、削除することが可能です。 ファイルシステム上のこのフォルダーにあるファイルを編集すると、すべての変更がLiferayに表示され、ファイルのマイナーバージョンが増えます。

## 追加情報

* [Enabling and Configuring Document Sharing](./managing-document-access/enabling-and-configuring-sharing.md)
* [他のユーザーとのドキュメントの共有](./managing-document-access/sharing-documents-with-other-users.md)
* [フォルダーの使用](../uploading-and-managing/using-folders.md)
* [ドキュメントとメディアUIリファレンス](../documents-and-media-ui-reference.md)
