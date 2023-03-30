---
uuid: a266c23a-5c23-4de6-a818-21e83f79cb1e
---
# ドキュメントURLの設定

{bdg-secondary}`Liferay 7.4 U27以降／GA27以降で利用可能`

ファイルがアップロードされると、LiferayはそのファイルにアクセスするためのフレンドリーなURLを自動的に生成します。 このURLは次のような構造になっています。 `[server-address]/documents/d/[site's friendly url]/[file-friendly-URL]`. アップロード時に指定しない限り、LiferayはフレンドリーURLにファイル名を使用しますが、この値はいつでも変更することができます。 一度設定すると、そのフレンドリーなURLで最新版のファイルにアクセスできるようになります。

```{note}
7.4 U26/GA26 以前のバージョンでは、Liferay は次の構造でファイル URL を生成します： `[server-address]/documents/[site-id]/[folder-id]/[file-name]/[UUID]`. U27+/GA27+にアップデートする場合、既存のファイルはこのパターンに基づいて古いURLを使い続けます。 しかし、ユーザーが既存のファイルを更新した場合、LiferayはそのURLを新しい構造を使用するように変換します。 アップデートされるまでは、以前のURLでファイルにアクセスすることができます。 
```

## ドキュメントのフレンドリーなURLの設定

ファイルのフレンドリーURLは、 [ファイルアップロード時](./uploading-files.md) またはファイル編集時に手動で設定することができます。

```{note}
複数のファイルをアップロードする場合、各ファイルのフレンドリーURLはファイル名を用いて自動的に生成されます。 
```

以下の手順で、ファイルのフレンドリーURLを設定します。

1. **サイトメニュー**( ![Site Menu](../../../images/icon-product-menu.png) ) を開き、 **コンテンツ & データ** を展開し、 **ドキュメントとメディア** へと進みます。

1. ファイルのアップロードまたは編集を開始します。

1. **Friendly URL** フィールドを編集します。

   各URLの値は、サイトごとにユニークである必要があります。 値がすでに使用されている場合、LiferayはURLの末尾に数値を追加することで自動的に競合を解決します（例： `my-file`, `my-file-1`, `my-file-2`)。

   ![ファイルのアップロードや編集時に、そのファイルのフレンドリーURLを変更することができます。](./configuring-document-urls/images/01.png)

1. ［**Publish**］ をクリックします。

一度保存すると、指定されたURLでファイルにアクセスできます（例： `http://[server-address]/documents/d/[site-friendly-url]/[file-friendly-URL]`）。

## フレンドリーなURLの履歴

ファイルのフレンドリーURLを変更した場合、Liferayは自動的に以前のURLの履歴を保持します。 これらの保存されたURLを使用して、引き続き最新バージョンのファイルにアクセスすることができます。 必要であれば、古いフレンドリーURLのエントリーを削除することができます。

```{note}
フレンドリーURL履歴に保存されている間は、古いファイルのURLは同じサイト内の他のファイルには使用できません。 別のファイルで再利用する場合は、まずそのファイルのフレンドリーURLの履歴から削除する必要があります。
```

以下の手順で、ファイルの保持URLを表示・管理します。

1. **サイトメニュー**( ![Site Menu](../../../images/icon-product-menu.png) ) を開き、 **コンテンツ & データ** を展開し、 **ドキュメントとメディア** へと進みます。

1. 目的のファイルの **アクション** ボタン ( ![Actions Button](../../../images/icon-actions.png) ) をクリックし、 **編集** を選択します。

1. フレンドリーURL欄の「**履歴**」 ボタン( ![History Button](../../../images/icon-history.png) )をクリックします。

   ![Friendly URL］フィールドの［History］ボタンをクリックします。](./configuring-document-urls/images/02.png)

1. **復元** ボタン ( ![Restore Button](../../../images/icon-restore2.png) ) をクリックすると、現在のフレンドリー URL が選択した URL に置き換えられます。

1. **URLを忘れる** ボタン（ ![Forget URL Button](../../../images/icon-delete.png) ）をクリックすると、選択した URL をファイルの履歴から削除します。 一度削除されると、そのURLを使ってファイルにアクセスすることはできなくなります。

   ![復元］または［URLを忘れる］ボタンをクリックします。](./configuring-document-urls/images/03.png)

フレンドリーURL履歴の変更内容は、自動的に保存されます。

```{note}
Liferay 7.4 U34/GA34から、表示ページのテンプレートフレームワークは、各ファイルのフレンドリーURL履歴を考慮するようになりました。 つまり、ファイルのフレンドリーURLの履歴に残っていれば、ユーザーは古いフレンドリーURLを使って、ファイルの表示ページにアクセスし続けることができます。 ファイルのフレンドリーURL履歴にあるすべてのURLは、ファイルの現在のURLに自動的にリダイレクトされます。

ファイルが表示ページのテンプレートと同じサイトにある場合、表示ページのURLにファイルのフレンドリーURLが付加されます（すなわち、`display-page-url/file-friendly-url`です）。 ただし、ファイルがテンプレートとは異なるサイトやアセットライブラリにある場合、URLパターンにはファイルのサイトやアセットライブラリのフレンドリーURL（すなわち、`display-page-url/site-friendly-url/document-friendly-url`）も含まれます。 これは、URLの重複を避けるためです。
```

## ドキュメントバージョンURL

すべてのファイルフレンドリーなURLは、ファイルの最新バージョンにつながります。 以前のバージョンのURLにアクセスしたい場合は、ファイルのバージョン履歴に移動し、目的のバージョンの **ダウンロード** の URL をコピーします。

![ご希望のバージョンのダウンロードURLをコピーしてください。](./configuring-document-urls/images/04.png)

## 追加情報

* [ドキュメントとメディア](../../documents-and-media.md)
* [ファイルのアップロード](./uploading-files.md)
* [サイトのフレンドリURLを設定する](../../../site-building/site-settings/managing-site-urls/configuring-your-sites-friendly-url.md)
* [ページのフレンドリURLの設定](../../../site-building/creating-pages/page-settings/configuring-your-pages-friendly-url.md)
