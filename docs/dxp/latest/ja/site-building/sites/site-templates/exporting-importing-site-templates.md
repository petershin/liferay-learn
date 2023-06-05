# サイトテンプレートのエクスポート/インポート

サイトテンプレートをエクスポート、インポートして、Liferayのインストール間で共有することができます。

## 個別サイトテンプレートの書き出し

以下の手順で、サイトテンプレートをエクスポートします。

1. **グローバルメニュー**(![Global Menu](../../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** を開き、 **サイトテンプレート** をクリックします。

1. エクスポートする［サイトテンプレート］をクリックします。

1. **サイトメニュー**(![Site Menu](../../../images/icon-product-menu.png)) を開き、 **パブリッシング** を展開し、 **エクスポート** をクリックします。

1. **Add** ボタン (![Add Button](../../../images/icon-add.png)) をクリックして、新しいエクスポートプロセスを作成します。

   エクスポートテンプレートを開きます。

   ![テンプレートのエクスポート処理に名前を付けて設定する。](./exporting-importing-site-templates/images/01.png)

1. エクスポートプロセスのタイトルを入力します。

1. エクスポートしたいテンプレートPagesとコンテンツを選択し、エクスポートプロセスを設定します。

1. **Export** をクリックし、エクスポート処理を開始します。

終了後、 **Download** ボタン (![Download Button](../../../images/icon-download.png)) をクリックし、生成された LAR ファイルをダウンロードします。

![生成されたLARファイルをダウンロードします。](./exporting-importing-site-templates/images/02.png)

## 個別サイトテンプレートのインポート

以下の手順で、サイトテンプレートをインポートします。

1. **グローバルメニュー**(![Global Menu](../../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** を開き、 **サイトテンプレート** をクリックします。

1. [作成](./creating-site-templates.md) サイトテンプレートを作成します。

1. 新しい［サイトテンプレート］をクリックします。

1. **サイトメニュー**(![Site Menu](../../../images/icon-product-menu.png)) を開き、 **出版** を展開し、 **輸入** をクリックします。

1. **Add** ボタン（![Add Button](../../../images/icon-add.png)）をクリックし、新しいインポートプロセスを作成します。

1. 希望のLARファイルを追加し、 **Continue** をクリックします。

   ![LARファイルを追加し、［続ける］をクリックします。](./exporting-importing-site-templates/images/03.png)

1. インポートプロセスを確認し、設定する。

1. **インポート** をクリックすると、インポートが開始されます。

   ![設定し、インポート処理を開始します。](./exporting-importing-site-templates/images/04.png)

完了したら、インポートした Site Template を使って、 [Sites](../adding-a-site.md)を作成することができます。

## バルクエクスポート/インポート

必要に応じて、以下の手順でサイトテンプレートの一括エクスポート/インポート操作を実行します。

1. **グローバルメニュー**(![Global Menu](../../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** を開き、 **サイトテンプレート** をクリックします。

1. アプリケーションバーの **アクション** ボタン (![Actions Button](../../../images/icon-actions.png)) をクリックし、 **エクスポート/インポート** を選択します。

   ![アプリケーションバーの「アクション」ボタンをクリックし、「エクスポート/インポート」を選択します。](./exporting-importing-site-templates/images/05.png)

1. **Export** または **Import** タブにアクセスし、目的の処理を開始します。

   バルクエクスポートの設定オプションは、 [個々のサイトテンプレートをエクスポートするときとほとんど同じです。](#exporting-individual-site-templates) . ただし、各テンプレートに含まれるページやコンテンツは設定できません。 また、個別エクスポートとは異なり、ページテンプレートをエクスポートに含めるかどうかを決定することができます。

   ![エクスポート]タブに移動して、インスタンス内のすべてのサイトテンプレートをエクスポートします。](./exporting-importing-site-templates/images/06.png)

   バルクインポートの設定オプションは、 [個々のサイトテンプレートをインポートするときとほとんど同じです。](#importing-individual-site-templates) . ただし、LARファイルに含まれるページテンプレートが、サイトテンプレートと一緒にインポートされるかどうかは、判断できます。

   ![インポートタブに移動して、複数のサイトテンプレートを含むLARファイルをインポートします。](./exporting-importing-site-templates/images/07.png)

## 関連トピック

* [サイトテンプレート](../site-templates.md)
* [サイトテンプレートの作成](./creating-site-templates.md)
* [サイトページとコンテンツのエクスポートとインポート](../exporting-importing-site-pages-and-content.md)
