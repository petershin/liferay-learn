# サイトテンプレートのエクスポート/インポート

サイトテンプレートをエクスポート、インポートして、Liferayインストール間で共有することができます。

## 個別サイトテンプレートのエクスポート

サイトテンプレートをエクスポートするには、以下の手順に従ってください：

1. **グローバルメニュー**(![Global Menu](../../../images/icon-applications-menu.png)) を開き、 ［**コントロールパネル**］ に移動し、 ［**サイトテンプレート**］ をクリックします。

1. エクスポートしたいサイトテンプレートをクリックします。

1. **Product Menu**(![Product Menu](../../../images/icon-product-menu.png)) を開き、 **Publishing** を展開し、 **Export** をクリックします。

1. **Add**(![Add Button](../../../images/icon-add.png)) をクリックして、新しいエクスポート・プロセスを作成します。

   エクスポートテンプレートが開きます。

   ![テンプレートのエクスポートプロセスに名前を付けて設定します。](./exporting-importing-site-templates/images/01.png)

1. エクスポートプロセスのタイトルを入力します。

1. エクスポートしたいテンプレートページとコンテンツを選択して、エクスポートプロセスを設定します。

1. ［**Export**］ をクリックし、エクスポートプロセスを開始します。

終了後、 **ダウンロード** ボタン (![Download Button](../../../images/icon-download.png))をクリックし、生成されたLARファイルをダウンロードします。

![生成されたLARファイルをダウンロードします。](./exporting-importing-site-templates/images/02.png)

## 個別サイトテンプレートのインポート

以下の手順に従って、サイトテンプレートをインポートしてください：

1. **グローバルメニュー**(![Global Menu](../../../images/icon-applications-menu.png)) を開き、 ［**コントロールパネル**］ に移動し、 ［**サイトテンプレート**］ をクリックします。

1. [](./creating-site-templates.md) サイトテンプレートを作成する。

1. 新しいサイトテンプレートをクリックします。

1. **Product Menu**(![Product Menu](../../../images/icon-product-menu.png)) を開き、 **Publishing** を展開し、 **Import** をクリックします。

1. **Add**(![Add Button](../../../images/icon-add.png)) をクリックして、新しいインポートプロセスを作成する。

1. 希望のLARファイルを追加し、 ［**Continue**］ をクリックします。

   ![LARファイルを追加し、 ［Continue］をクリックします。](./exporting-importing-site-templates/images/03.png)

1. インポートプロセスを確認し、設定します。

1. ［**Import**］ をクリックし、インポートを開始します。

   ![インポートプロセスを設定し、開始します。](./exporting-importing-site-templates/images/04.png)

完了したら、インポートしたサイトテンプレートを使って [サイトを作成することができます](../adding-a-site.md)。

## 一括エクスポート／インポート

必要に応じて、以下の手順に従って、サイト テンプレートの一括エクスポート/インポート操作を実行してください：

1. **グローバルメニュー**(![Global Menu](../../../images/icon-applications-menu.png)) を開き、 ［**コントロールパネル**］ に移動し、 ［**サイトテンプレート**］ をクリックします。

1. アプリケーションバーの **Options**(![Options Icon](../../../images/icon-options.png)) をクリックし、 **Export/Import** を選択する。

   ![アプリケーションバーの **オプション** アイコンをクリックし、 **エクスポート/インポート** を選択します。](./exporting-importing-site-templates/images/05.png)

1. ［**Export**］ または ［**Import**］ タブにアクセスし、目的のプロセスを開始します。

   一括エクスポートの設定オプションは、 [個々のサイトテンプレートをエクスポートする場合とほとんど同じです](#exporting-individual-site-templates) 。 ただし、テンプレートごとに含まれるページやコンテンツを設定することはできません。 また、個別のエクスポートとは異なり、ページテンプレートをエクスポートに含めるかどうかを決定することができます。

   ![インスタンス内のすべてのサイトテンプレートをエクスポートするには、 [**エクスポート**]タブに移動します。](./exporting-importing-site-templates/images/06.png)

   一括インポートの設定オプションは、 [個々のサイト・テンプレートをインポートする場合](#importing-individual-site-templates) とほとんど同じです。 ただし、LARファイルに含まれるページ・テンプレートがサイト・テンプレートと一緒にインポートされるかどうかを判断することはできます。

   ![複数のサイトテンプレートを含むLARファイルをインポートするには、 **インポート** タブに移動します。](./exporting-importing-site-templates/images/07.png)

## 関連トピック

* [サイトテンプレート](../site-templates.md)
* [サイトテンプレートの作成](./creating-site-templates.md)
* [サイトページとコンテンツのエクスポートとインポート](../exporting-importing-site-pages-and-content.md)
