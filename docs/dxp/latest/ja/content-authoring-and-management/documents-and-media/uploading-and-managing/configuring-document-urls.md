# ドキュメントのURLを設定する

{bdg-secondary}`利用可能な Liferay 7.4 U27+/GA27+`

ファイルがアップロードされると、LiferayはそのファイルにアクセスするためのフレンドリーなURLを自動的に生成します。 このURLは次のような構造になっています。 `[server-address]/documents/d/[site's friendly url]/[file-friendly-URL]`. アップロード時に指定しない限り、LiferayはフレンドリーURLにファイル名を使用しますが、この値はいつでも変更することができます。 一度設定すると、そのフレンドリーなURLから最新版のファイルにアクセスできるようになります。

```{note}
7.4 U26/GA26以前のバージョンでは、Liferayは以下の構造を持つファイルURLを生成します: `[server-address]/documents/[site-id]/[folder-id]/[file-name]/[UUID]`. U27+/GA27+ にアップデートする場合、既存のファイルはこのパターンに基づいて古い URL を使い続けます。 しかし、ユーザーが既存のファイルを更新した場合、LiferayはそのURLを新しい構造を使用するように変換します。 更新されるまでは、古いURLでファイルにアクセスすることができます。 
```

## ドキュメントのフレンドリURLの設定

ファイルのフレンドリーURLは、 [ファイルアップロード時](./uploading-files.md) またはファイル編集時に手動で設定することができます。

```{note}
複数のファイルをアップロードする場合、各ファイルのフレンドリーURLはファイル名を用いて自動的に生成されます。 
```

ファイルのフレンドリURLを設定するには、次の手順に従います。

1. **サイトメニュー**( ![Site Menu](../../../images/icon-product-menu.png) ) を開き、 **コンテンツ & データ** を展開し、 **ドキュメントとメディア** に進みます。

1. ファイルのアップロードまたは編集を開始します。

1. **Friendly URL** 欄を編集します。

   各URLの値は、サイトごとにユニークである必要があります。 もし値が既に使用されている場合、Liferayは自動的にURLの末尾に数値を追加して競合を解決します（例： `my-file`, `my-file-1`, `my-file-2`).

   ![ファイルのアップロード時や編集時に、そのファイルのフレンドリーURLを変更することができます。](./configuring-document-urls/images/01.png)

1. ［**Publish**］ をクリックします。

一度保存すると、指定したURLでファイルにアクセスできます（例： `http://[server-address]/documents/d/[site-friendly-url]/[file-friendly-URL]`）。

## フレンドリURL履歴

ファイルのフレンドリーURLを変更すると、Liferayは自動的に以前のURLの履歴を保持します。 この保存されたURLは、引き続き最新版のファイルにアクセスするために使用することができます。 必要であれば、古いフレンドリーURLのエントリーを削除することができます。

```{note}
フレンドリーURLの履歴に保存されている間、古いファイルのURLは同じサイト内の他のファイルには使用できません。 URLを別のファイルに再利用するには、まずそのファイルのフレンドリURLの履歴から削除する必要があります。
```

ファイルの保持するURLを表示・管理するには、次の手順に従います。

1. **サイトメニュー**( ![Site Menu](../../../images/icon-product-menu.png) ) を開き、 **コンテンツ & データ** を展開し、 **ドキュメントとメディア** に進みます。

1. 目的のファイルの **Actions** ボタン ( ![Actions Button](../../../images/icon-actions.png) ) をクリックし、 **Edit** を選択します。

1. Friendly URL 欄の **History** ボタン ( ![History Button](../../../images/icon-history.png) ) をクリックします。

   ![Friendly URL]フィールドの [History]ボタンをクリックします。](./configuring-document-urls/images/02.png)

1. **Restore** ボタン( ![Restore Button](../../../images/icon-restore2.png) )をクリックすると、現在のフレンドリ ーURLを選択したURLで置き換えることができます。

1. **Forget URL** ボタン ( ![Forget URL Button](../../../images/icon-delete.png) ) をクリックすると、選択した URL をファイルの履歴から削除することができます。 一度削除されると、そのURLを使ってファイルにアクセスすることはできなくなります。

   ![リストア］または［URLを忘れる］ボタンをクリックします。](./configuring-document-urls/images/03.png)

フレンドリーURLの履歴の変更は、自動的に保存されます。

```{note}
Liferay 7.4 U34/GA34から、表示ページテンプレートのフレームワークに各ファイルのフレンドリーURLの履歴が考慮されるようになりました。 つまり、ファイルの表示ページに旧フレンドリーURLでアクセスしても、そのURLがファイルのフレンドリーURLの履歴に残っていれば、ユーザーは引き続きアクセスすることができます。 ファイルのフレンドリーURLの履歴にあるすべてのURLは、ファイルの現在のURLに自動的にリダイレクトされます。

ファイルがその表示ページテンプレートと同じサイトにある場合、ファイルのフレンドリーURLが表示ページのURLに追加されます（つまり、`display-page-url/file-friendly-url`です）。 ただし、ファイルがテンプレートと異なるサイトやアセットライブラリにある場合は、URLパターンにファイルのサイトやアセットライブラリのフレンドリーURL（つまり、`display-page-url/site-friendly-url/document-friendly-url`）も含まれます。 これは、URLの重複を避けるためです。
```

## ドキュメントバージョンURL

すべてのファイルフレンドリーなURLは、ファイルの最新バージョンにつながります。 以前のバージョンのURLにアクセスしたい場合は、ファイルのバージョン履歴に移動し、希望のバージョンの **download** URLをコピーしてください。

![ご希望のバージョンのダウンロードURLをコピーしてください。](./configuring-document-urls/images/04.png)

## 追加情報

* [ドキュメントとメディアの概要](../../documents-and-media.md)
* [ファイルのアップロード](./uploading-files.md)
* [サイトのフレンドリURLを設定する](../../../site-building/site-settings/managing-site-urls/configuring-your-sites-friendly-url.md)
* [ページのフレンドリURLの設定](../creating-pages/page-settings/configuring-your-pages-friendly-url.md)
