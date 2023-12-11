# ページテンプレートのエクスポートとインポート

コードエディタでテンプレートを編集する方が簡単な場合があります。 [ページテンプレート](./creating-a-page-template.md) を作成したら、 [](../../sites/exporting-importing-site-pages-and-content.md) をエクスポートし、ローカルで好きなエディタで編集し、テンプレートをLiferayにインポートし直すことができます。 テンプレートはシステム上のどのサイトにもインポートできる。

エクスポート／インポート・フレームワークの一般的な情報については、 [サイト・ページとコンテンツのエクスポート／インポート](../../sites/exporting-importing-site-pages-and-content.md) を参照。

```{note}
Liferay DXP 7.4+では、ページテンプレートコレクションはLiferay UIではページテンプレートセットと呼ばれています。
```

## ページテンプレートのエクスポート

1. [サイトメニュー](../../../images/icon-product-menu.png))を開き、_デザイン_ &rarr; _ページテンプレート_に移動します。

1.  *ページテンプレート*タブを選択します。

1. 必要なテンプレートを含むページテンプレートセットを選択します。

1. 目的のコンテンツページテンプレートの_Actions_ (![Actionsボタン](../../../images/icon-actions.png))をクリックし、_Export_を選択します。

   ![Click Export to export your page template as a ZIP file](./exporting-and-importing-page-templates/images/01.png)

コンテンツページのテンプレートは、ZIPファイルとしてローカルマシンにダウンロードされます。

```{tip}
一度に複数のコンテンツページテンプレートをエクスポートできます。
```

ページテンプレートの最後に公開されたバージョンは常にエクスポートされる。 ページテンプレートが一度も公開されていない場合は、エクスポートできません。

エクスポートされたZIPファイルには次のファイルが含まれています。

* `page-template-collection.json`：ページテンプレートが保存されているセットの名前とその他のメタデータを含む。
* オプションのサムネイルファイル
* `page-template.json`：ページテンプレート名とその他のメタデータを含む。
* `page-definition.json`: ページテンプレートの構造と内容を指定する。

ZIPファイルには、`display-page-template.json`、`master-page.json`、`page-template-collection.json`、`page-template.json`のような、異なるタイプのページテンプレートも含まれているかもしれません。

## ページテンプレートのインポート

1. [サイトメニュー](../../../images/icon-product-menu.png))を開き、_デザイン_ &rarr; _ページテンプレート_に移動します。

1. アプリケーションバーの_オプション_ (![オプションアイコン](../../../images/icon-options.png))をクリックし、_インポート_を選択します。

   ![The import function is located in the options menu in the Application Bar.](./exporting-and-importing-page-templates/images/02.png)

1. 必要なページテンプレートファイルを選択します。

   変更したい場合は、_ファイルを置き換える_をクリックしてください。

1. *インポート*をクリックします。

   既存のページテンプレートをインポートする場合は、 [既存のページテンプレートをインポートする](#importing-an-existing-page-template) を参照してください。

   操作をキャンセルしてページテンプレートのページに戻るには、_Cancel_をクリックします。

   ![Page templates are imported as ZIP files.](./exporting-and-importing-page-templates/images/03.png)

1. インポート処理が完了すると、 [インポート結果ページ](#import-outcome-page) にリダイレクトされます。

1. 別のファイルをインポートするには、_Upload Another File_をクリックするか、ページテンプレートのページに戻るには、_Done_をクリックしてください。

```{Important}
DXP環境間でページテンプレートを転送するには、LARエクスポートとインポートを使用します。
```

### 既存のページテンプレートのインポート

ページテンプレートをインポートし、ZIPファイルのアイテムがすでに存在する場合、3つのオプションのいずれかを選択できます：

**既存のアイテムをインポートしないでください**：新しいアイテムのみインポートされます。

**Overwrite Existing Items**：重複した既存項目は上書きされます。

**両方キープ**：既存のアイテムの番号付きコピーがインポートされます。

インポート処理が完了すると、 [インポート結果ページ](#import-outcome-page) にリダイレクトされます。

![Choose one of three options when you import a duplicated page template](./exporting-and-importing-page-templates/images/04.png)

### インポート結果ページ

ユーザーがファイルをインポートすると、インポート処理に関する詳細が記載された新しいページにリダイレクトされます。

インポートの結果ページでは、インポートに成功したエントリー、警告（インポートに成功したものの誤動作を引き起こす可能性があるもの）、エラー（インポートされなかったエントリー）を確認することができます。

![The import outcome page shows warnings and errors related to the importing process](./exporting-and-importing-page-templates/images/05.png)

## 関連トピック

* [ページテンプレートの作成](./creating-a-page-template.md) 
* [サイトページとコンテンツのエクスポート/インポート](../../sites/exporting-importing-site-pages-and-content.md) 
* [コレクションの作成](../../../site-building/displaying-content/collections-and-collection-pages/creating-collections.md)
