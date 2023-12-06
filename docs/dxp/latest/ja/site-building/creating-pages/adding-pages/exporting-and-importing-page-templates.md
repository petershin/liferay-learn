# ページテンプレートのエクスポートとインポート

コードエディタでテンプレートを編集する方が簡単な場合があります。 [ページテンプレート](./creating-a-page-template.md)を作成したら、 [](../../sites/exporting-importing-site-pages-and-content.md) をエクスポートし、ローカルで好きなエディタで編集し、テンプレートをLiferayにインポートし直すことができます。 テンプレートはシステム上のどのサイトにもインポートできる。

エクスポート／インポート・フレームワークの一般的な情報については、 [サイト・ページとコンテンツのエクスポート／インポート](../../sites/exporting-importing-site-pages-and-content.md)を参照。

```{note}
Liferay DXP 7.4以降の場合、ページテンプレートコレクションは、Liferay UIではページテンプレートセットと呼ばれます。
```

## ページテンプレートのエクスポート

1. **Site Menu**( ![Site Menu](../../../images/icon-product-menu.png) ) を開き、 **Design** &rarr; **Page Templates** にアクセスしてください。

1. ［**Page Templates**］ タブを選択します。

1. 目的のテンプレートを含むページテンプレートセットを選択します。

1. **アクション**( ![Actions Button](../../../images/icon-actions.png) ) をクリックし、 **エクスポート** を選択する。

   ![ページテンプレートをZIPファイルとしてエクスポートするには、エクスポートをクリックします。](./exporting-and-importing-page-templates/images/01.png)

コンテンツページのテンプレートは、ZIPファイルとしてローカルマシンにダウンロードされます。

```{tip}
一度に複数のコンテンツページテンプレートをエクスポートできます。
```

ページテンプレートの最後に公開されたバージョンは常にエクスポートされる。 ページテンプレートが一度も公開されていない場合は、エクスポートできません。

エクスポートされたZIPファイルには次のファイルが含まれています。

* `page-template-collection.json`: ページテンプレートが保存されているセットの名前と、その他のメタデータを含みます。
* オプションのサムネイルファイル
* `page-template.json`: ページテンプレート名とその他のメタデータが含まれます。
* `page-definition.json`：ページテンプレートのストラクチャーとコンテンツを指定します。

ZIPファイルには、 `display-page-template.json`, `master-page.json`, `page-template-collection.json` , `page-template.json`というように異なるタイプのページテンプレートも含まれる場合があります。

## ページテンプレートのインポート

1. **Site Menu**( ![Site Menu](../../../images/icon-product-menu.png) ) を開き、 **Design** &rarr; **Page Templates** にアクセスしてください。

1. アプリケーションバーの **オプション**( ![Options icon](../../../images/icon-options.png) ) をクリックし、 **インポート** を選択します。

   ![インポート機能はアプリケーションバーのオプションメニューにあります。](./exporting-and-importing-page-templates/images/02.png)

1. 必要なページテンプレートファイルを選択します。

1. ［**Import**］ をクリックします。

   ![ページテンプレートはZIPファイルとしてインポートされます。](./exporting-and-importing-page-templates/images/03.png)

1. ［**インポート**］ ウィンドウを閉じます。

ページテンプレートがサイトにインポートされました。

## 関連トピック

* [ページテンプレートの作成](./creating-a-page-template.md)
* [サイトページとコンテンツのエクスポート/インポート](../../sites/exporting-importing-site-pages-and-content.md)
* [コレクションの作成](../../../content-authoring-and-management/collections-and-collection-pages/creating-collections.md)
