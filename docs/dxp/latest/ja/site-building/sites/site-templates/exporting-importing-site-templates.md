# サイトテンプレートのエクスポート/インポート

サイトテンプレートのエクスポートとインポートにより、Liferayのインストール間で共有することができます。

## 個別サイトテンプレートのエクスポート

サイトテンプレートをエクスポートするには、以下の手順に従います。

1. *グローバルメニュー* (![Global Menu](../../../images/icon-applications-menu.png)) を開き、 *コントロールパネル*を開き、 *サイトテンプレート*をクリックします。

1. エクスポートするサイトテンプレートをクリックします。

1. *サイトメニュー* (![Site Menu](../../../images/icon-product-menu.png)) を開き、 *パブリッシング*を展開し、 *エクスポート*をクリックします。

1. *追加* ボタン (![Add Button](../../../images/icon-add.png)) をクリックし、新しいエクスポートプロセスを作成します。

   エクスポートテンプレートを開きます。

   ![テンプレートのエクスポート処理に名前を付けて設定します。](./exporting-importing-site-templates/images/01.png)

1. エクスポートプロセスのタイトルを入力します。

1. エクスポートしたいテンプレートページとコンテンツを選択し、エクスポートプロセスを設定します。

1. *Export* をクリックすると、エクスポート処理が開始されます。

終了後、 *Download* ボタン(![Download Button](../../../images/icon-download.png))をクリックし、生成された LAR ファイルをダウンロードします。

![生成されたLARファイルをダウンロードする。](./exporting-importing-site-templates/images/02.png)

## 個別サイトテンプレートのインポート

以下の手順で、サイトテンプレートをインポートします。

1. *グローバルメニュー* (![Global Menu](../../../images/icon-applications-menu.png)) を開き、 *コントロールパネル*を開き、 *サイトテンプレート*をクリックします。

1. [](./creating-site-templates.md) サイトテンプレートを作成します。

1. 新しい「サイトテンプレート」をクリックします。

1. *サイトメニュー* (![Site Menu](../../../images/icon-product-menu.png)) を開き、 *パブリッシング*を展開し、 *インポート*をクリックします。

1. *追加* ボタン (![Add Button](../../../images/icon-add.png)) をクリックし、新しいインポートプロセスを作成します。

1. 希望のLARファイルを追加して、 *Continue*をクリックします。

   ![LARファイルを追加し、[続ける]をクリックします。](./exporting-importing-site-templates/images/03.png)

1. インポートプロセスを確認し、設定する。

1. *インポート* をクリックすると、インポートが開始されます。

   ![設定し、インポート処理を開始します。](./exporting-importing-site-templates/images/04.png)

完了したら、インポートした Site Template を使って、 [Sites](../creating-sites.md)を作成することができます。

## バルクエクスポート/インポート

必要に応じて、以下の手順でサイトテンプレートの一括エクスポート/インポート操作を実行します。

1. *グローバルメニュー* (![Global Menu](../../../images/icon-applications-menu.png)) を開き、 *コントロールパネル*を開き、 *サイトテンプレート*をクリックします。

1. アプリケーションバーの *アクション* ボタン (![Actions Button](../../../images/icon-actions.png)) をクリックし、 *エクスポート/インポート*を選択します。

   ![アプリケーションバーの「アクション」ボタンをクリックし、「エクスポート/インポート」を選択します。](./exporting-importing-site-templates/images/05.png)

1. *エクスポート* または *インポート* のタブに移動し、目的の処理を開始します。

   一括エクスポートの設定オプションは、 [個々のサイトテンプレートをエクスポートする場合とほとんど同じです。](#exporting-individual-site-templates). ただし、各テンプレートに含まれるページやコンテンツは設定できません。 また、個別のエクスポートとは異なり、ページテンプレートがエクスポートに含まれるかどうかを決定することができます。

   ![エクスポート]タブに移動して、インスタンス内のすべてのサイトテンプレートをエクスポートします。](./exporting-importing-site-templates/images/06.png)

   バルクインポートの設定オプションは、 [個別のサイトテンプレートをインポートする場合とほぼ同じです。](#importing-individual-site-templates). ただし、LARファイルに含まれるPage TemplatesがSite Templatesと一緒にインポートされるかどうかを判断することは可能です。

   ![複数のサイトテンプレートを含むLARファイルをインポートするには、「インポート」タブをクリックします。](./exporting-importing-site-templates/images/07.png)

## 追加情報

* [サイトテンプレート](../site-templates.md)
* [サイトテンプレートの作成](./creating-site-templates.md)
* [サイトページとコンテンツのエクスポートとインポート](../exporting-importing-site-pages-and-content.md)
