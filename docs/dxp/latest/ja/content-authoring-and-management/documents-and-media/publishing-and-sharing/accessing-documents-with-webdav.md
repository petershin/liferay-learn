# WebDAVでドキュメントにアクセスする

デスクトップファイルマネージャーから [WebDAV](https://en.wikipedia.org/wiki/WebDAV) を介してドキュメントライブラリにアクセスできます。  WebDAVは、Webサーバーに保存されているファイルを管理するためのHTTPに基づくプロトコルです。 WebDAVは、Linux、macOS、Windowsなど、ほとんどの主要なオペレーティングシステムとデスクトップ環境でサポートされています。

ファイルブラウザからドキュメントライブラリフォルダにアクセスするには、ログイン認証情報とアクセスするフォルダのWebDAV URLを使用する必要があります。

## WebDAVパスワードの生成

{bdg-secondary}`liferay DXP 2023.Q4+/Portal 7.4 GA98+`.

Liferayの最新バージョンでは、WebDAVクライアントで使用するために、アカウント設定からWebDAVパスワードを生成する必要があります。 これは、WebDAVのダイジェスト認証で使用される弱いハッシュの保存を避けるためです。 ダイジェスト認証は安全ではなく、Liferayでは非推奨です。 初めてWebDAV経由でドキュメントにアクセスしようとすると、WebDAVパスワードを生成するよう促されます。

![You must generate a WebDAV password before using it for the first time.](./accessing-documents-with-webdav/images/03.png)

WebDAVパスワードを生成するには

1. サイトのホームページからユーザーアイコンをクリックし、 **アカウント設定** を選択します。

2. 左のメニューから **パスワード** を選択します。

3. **WEBDAV PASSWORD** セクションまでスクロールダウンし、 **Generate WebDAV Password** をクリックします。

   ![Generate a WebDAV password to use with your client.](./accessing-documents-with-webdav/images/04.png)

   WebDAVのユーザー名と自動生成されたパスワードが表示されます。 これは読み取り専用のフィールドなので、将来使用するためにコピーしておく必要がある。 WebDAVパスワードをもう一度生成するボタンをクリックすると、新しいパスワードが生成され、既存のパスワードは使えなくなります。

では、 [以下の指示に従ってください。](#using-the-webdav-client-to-access-documents) プロンプトが表示されたら、WebDAVのユーザー名とパスワードを使用してください。

## WebDAVクライアントを使ってドキュメントにアクセスする

1. 目的のサイトまたはアセットライブラリで、［Documents and Media］アプリケーションを開きます。

1. 目的のフォルダの **Actions** ボタン(![Actions Button](../../../images/icon-actions.png)) をクリックし、 **Access from Desktop** を選択します。

   ![Select Access from Desktop to get the folder's WebDAV URL.](./accessing-documents-with-webdav/images/01.png)

1. フォルダ固有の **WebDAV URL** をコピーする。

   ![Copy the folder's WebDAV URL.](./accessing-documents-with-webdav/images/02.png)

1. お使いのオペレーティングシステムの指示に従ってください。

   * **Windows** : WebDAV URLにネットワークドライブをマップします。 プロンプトが表示されたら、認証情報を入力します。 認証されると、ドキュメント・ライブラリー・フォルダーがネットワーク・ドライブとして表示されます。

   * **macOS** :Finderを開き、 **Go** &rarr; **Connect to Server** を選択します。 Server Addressフィールドに、アクセスしたいフォルダのWebDAV URLを入力し、 **Connect** をクリックし、プロンプトが表示されたら認証情報を入力します。

   * **Linux** : Linuxの場合、フォルダーのWebDAV URLを少し変更する必要があります。 KDE Dolphinの場合は、URLのプロトコルを `http://` ではなく `webdav://` に変更してください。 GNOME Filesの場合は、URLのプロトコルを`http://`の代わりに`dav://`に変更してください。 変更したURLをファイルマネージャに貼り付け、 **Enter** キーを押し、プロンプトが表示されたら認証情報を入力する。

一度セットアップすれば、オペレーティングシステムのファイルブラウザを使用して、接続されたDocuments and Mediaフォルダ内のファイルを追加、編集、削除することができます。 ファイルシステム上のこのフォルダにあるファイルを編集すると、すべての変更がLiferayに表示され、ファイルのマイナーバージョンがインクリメントされます。

## 関連トピック

* [ドキュメント共有の有効化と設定](./managing-document-access/enabling-and-configuring-sharing.md)
* [他のユーザーとドキュメントを共有する](./managing-document-access/sharing-documents-with-other-users.md)
* [フォルダの使用](../uploading-and-managing/using-folders.md)
* [ドキュメントとメディア UIリファレンス](../documents-and-media-ui-reference.md)
