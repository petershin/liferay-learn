# ドキュメントURLの構成

{bdg-secondary}`liferay 7.4 U27+/GA27+`.

ファイルがアップロードされると、LiferayはそのファイルにアクセスするためのフレンドリURLを自動的に生成します。 このURLは次の構造を使用します： `[server-address]/documents/d/[site's friendly url]/[file-friendly-URL]`. アップロード時に指定しない限り、LiferayはフレンドリURLにファイル名を使用しますが、この値はいつでも変更することができます。 設定が完了すると、そのフレンドリーURLで最新版のファイルにアクセスできるようになります。

```{note}
7.4 U26/GA26 以前のバージョンでは、Liferayは次の構造でファイルURLを生成します： `[server-address]/documents/[site-id]/[folder-id]/[file-name]/[UUID]`。 U27+/GA27+にアップデートする場合、既存のファイルはこのパターンに基づいて古いURLを引き続き使用します。 しかし、ユーザーが既存のファイルを更新した場合、Liferayは新しいストラクチャーを使用するようにそのURLを変換します。 アップデートされるまでは、以前のURLでファイルにアクセスすることができます。
```

## ドキュメントのフレンドリURLの設定

ファイルのフレンドリーURLは、 [ファイルアップロード中（](./uploading-files.md) ）、またはファイルを編集するときに手動で設定できます。

```{note}
複数のファイルをアップロードする場合、各ファイルのフレンドリーURLはファイル名を使って自動的に生成されます。
```

以下の手順で、ファイルのフレンドリURLを設定します。

1. サイトメニュー](../../../images/icon-product-menu.png)を開き、[コンテンツとデータ]を展開し、[ドキュメントとメディア]に進みます。

1. 目的のファイルのアップロードまたは編集を開始します。

1. *フレンドリーURL*フィールドを編集する。

   各URLの値は、サイトごとに一意である必要があります。 値がすでに使用されている場合、Liferayは自動的にURLの末尾に数値を追加することで競合を解決します（例：`my-file`、`my-file-1`、`my-file-2`）。

   ![When uploading or editing a file, you can change its friendly URL.](./configuring-document-urls/images/01.png)

1. *［公開］*をクリックします。

一旦保存されると、指定されたURL（例えば、`http://[server-address]/documents/d/[site-friendly-url]/[file-friendly-URL]`）でファイルにアクセスすることができます。

## フレンドリURLの履歴

ファイルのフレンドリURLを変更した場合、Liferayは以前のURLの履歴を自動的に保持します。 この保存されたURLを引き続き使用することで、ファイルの最新バージョンにアクセスできます。 必要であれば、古いフレンドリURLのエントリーを削除できます。

```{note}
フレンドリURLの履歴に保存されている間は、古いファイルのURLは同じサイト内の他のファイルには使用できません。 別のファイルでURLを再利用するには、まずそのファイルのフレンドリURLの履歴から対象のURLを削除する必要があります。
```

以下の手順で、ファイルの保持URLを表示・管理します。

1. ![サイトメニュー](../../../images/icon-product-menu.png)を開き、[コンテンツとデータ]を展開し、[ドキュメントとメディア]に進みます。

1. 目的のファイルの_Actions_ボタン( ![Actions Button](../../../images/icon-actions.png) )をクリックし、_Edit_を選択します。

1. Friendly URLフィールドの_History_ボタン( ![History Button](../../../images/icon-history.png) )をクリックします。

   ![Click the History button for the Friendly URL field.](./configuring-document-urls/images/02.png)

1. *復元*ボタン( ![復元ボタン](../../../images/icon-restore2.png))をクリックして、現在のフレンドリーURLを選択したURLに置き換えます。

1. 選択したURLをファイルの履歴から削除するには、_Forget URL_ ボタン ( ![Forget URL Button](../../../images/icon-delete.png) ) をクリックします。 削除すると、そのURLではファイルにアクセスできなくなります。

   ![Click the Restore or Forget URL buttons.](./configuring-document-urls/images/03.png)

フレンドリURLの履歴の変更内容は、自動的に保存されます。

```{note}
Liferay 7.4 U34/GA34から、表示ページテンプレートのフレームワークは、各ファイルのフレンドリURLの履歴を考慮します。 つまり、ファイルのフレンドリURLの履歴に残っていれば、ユーザーは古いフレンドリURLでファイルの表示ページに引き続きアクセスできます。 ファイルのフレンドリURLの履歴にあるすべてのURLは、ファイルの現在のURLに自動的にリダイレクトされます。

ファイルが表示ページテンプレートと同じサイトにある場合、表示ページURLにファイルのフレンドリURLが追加されます（すなわち、`display-page-url/file-friendly-url`です）。 ただし、ファイルがテンプレートとは異なるサイトやアセットライブラリにある場合、URLパターンにはファイルのサイトやアセットライブラリのフレンドリURL（すなわち、`display-page-url/site-friendly-url/document-friendly-url`）も含まれます。 これは、URLの複製を避けるためです。
```

## ドキュメントのバージョンURL

すべてのファイルフレンドリURLは、ファイルの最新バージョンにつながります。 以前のバージョンのURLにアクセスしたい場合は、ファイルのバージョン履歴に移動し、目的のバージョンの_ダウンロード_ URLをコピーします。

![Copy the download URL for the desired version.](./configuring-document-urls/images/04.png)

## 関連トピック

* [ドキュメントとメディア](../../documents-and-media.md)
* [ファイルのアップロード](./uploading-files.md)
* [フレンドリーURLの設定](../../../site-building/site-settings/managing-site-urls/configuring-your-sites-friendly-url.md)
* [ページのフレンドリーURLの設定](../../../site-building/creating-pages/page-settings/configuring-your-pages-friendly-url.md)
