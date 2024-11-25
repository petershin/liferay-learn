# サイトページとコンテンツのエクスポート/インポート

Liferayサイトには、サイトデータをLiferay Archive (LAR)ファイルとして抽出・転送するためのエクスポート/インポートアプリケーションが含まれています。 これらのツールにはサイトレベルでアクセスできる。

```{note}
また、個々のサイトアプリケーションと[ページウィジェット](../creating-pages/page-fragments-and-widgets/using-widgets/configuring-widgets/exporting-importing-widget-data.md)のエクスポートとインポート機能にもアクセスできます。
```

## サイトLARのプロパティと要件

LARにはこのようなプロパティと要件があります。

* LARはバージョンによって異なります。 各サーバーのLiferayのバージョンが同じであれば、別のLiferayサーバーのサイトにインポートすることができます。

* 名前の衝突は自動的に処理されるものもある。 例えば、インポートするLARとサイトが同じフレンドリURLのページを持つ場合、フレンドリURLに数字が付加され、コンフリクトが発生しなくなるまで増加する。 カテゴリー名についても同様だ。

* LARを使用してサイトを復元することはできますが、サイトを完全に削除してから、LARをインポートするために同じ名前で新しいサイトを作成する必要があります。 これにより、LARとサイトの両方に存在するコンテンツ間の潜在的なデータの衝突を避けることができる。

```{important}
LARを定期的にエクスポートすることは、バックアップ・ソリューションではありません。 Liferayインストールのバックアップについては、[Liferay Portalインストールのバックアップ](../../installation-and-upgrades/maintaining-a-liferay-installation/backing-up.md) を参照してください。
```

## サイトページとコンテンツのエクスポート

以下の手順に従って、サイトのページとコンテンツをエクスポートしてください：

1. **Product Menu**(![Product Menu](../../images/icon-product-menu.png)) を開き、 **Publishing** を展開し、 **Export** をクリックします。

1. **Add**(![Add Button](../../images/icon-add.png)) をクリックして、新しいエクスポート・プロセスを作成します。

   エクスポートテンプレートが開きます。

   ![エクスポート・テンプレートに名前を付け、設定する。](./exporting-importing-site-pages-and-content/images/01.png)

1. エクスポートプロセスのタイトルを入力します。

1. エクスポートしたいサイトページとコンテンツを選択して、エクスポートプロセスを設定します。

   **Pages** で、エクスポートに含めるページとページセットを選択できます。 また、テーマ設定、ロゴ、サイトページ設定、サイトテンプレート設定を含めるかどうかを決定することもできます。

   **コンテンツ** で、エクスポートに含めるアプリケーションを選択できます。 また、選択したアプリケーションのすべてのデータをエクスポートするか、含まれるアプリケーションデータを日付または時間でフィルタリングするかを決定することもできます。

   **Permissions** で、エクスポートにページとコンテンツのパーミッションを含めるかどうかを決定します。

1. ［**Export**］ をクリックし、エクスポートプロセスを開始します。

終了後、 **ダウンロード** ボタン (![Download Button](../../images/icon-download.png))をクリックし、生成されたLARファイルをダウンロードします。 これでLARを別のLiferayサイトにインポートできます。

![LARファイルをダウンロードする。](./exporting-importing-site-pages-and-content/images/02.png)

```{note}
生成されるLARには、エクスポート設定中に選択されたすべてのデータが含まれます。 個人情報や機密情報が含まれる場合は、LARファイルが安全な場所に保管されていることを確認してください。
```

## サイトページとコンテンツのインポート

```{important}
エクスポートされたサイトがテンプレートを使用している場合、サイトをインポートする前にまずサイトテンプレートをエクスポートし、Liferayインストールにインポートする必要があります。 詳細は[サイトテンプレートのエクスポートとインポート](./site-templates/exporting-importing-site-templates.md)を参照してください。
```

以下の手順に従って、サイトのページとコンテンツをインポートしてください：

1. **Product Menu**(![Product Menu](../../images/icon-product-menu.png)) を開き、 **Publishing** を展開し、 **Import** をクリックします。

1. **追加** ボタン（![Add Button](../../images/icon-add.png)）をクリックし、新規インポートプロセスを作成します。

1. 希望のLARファイルを追加し、 ［**Continue**］ をクリックします。

   ![LARファイルを追加し、 ［Continue］をクリックします。](./exporting-importing-site-pages-and-content/images/03.png)

1. インポートプロセスを確認し、設定します。

1. ［**Import**］ をクリックし、インポートを開始します。

   ![インポートプロセスを設定し、開始します。](./exporting-importing-site-pages-and-content/images/04.png)

## テンプレートのエクスポートの作成

サイトページのコンテンツをエクスポートするたびに手動でエクスポートプロセスを作成する代わりに、エクスポートテンプレートを作成してエクスポート設定を保存し、再利用することができます。 エクスポート・テンプレートを作成するには、以下の手順に従ってください：

1. **Product Menu**(![Product Menu](../../images/icon-product-menu.png)) を開き、 **Publishing** を展開し、 **Export** をクリックします。

1. アプリケーション・バーの **オプション** ![Options Icon](../../images/icon-options.png) をクリックし、 **エクスポート・テンプレート** を選択する。

   ![アプリケーションバーのActionsボタンをクリックし、Export Templatesを選択する。](./exporting-importing-site-pages-and-content/images/05.png)

1. **追加**（![Add Button](../../images/icon-add.png)） をクリックします。

1. エクスポート・テンプレートに名前を付け、設定する。

1. ［**保存**］ をクリックします。

[エクスポート・プロセスの新規作成](#exporting-site-pages-and-content) の際に、テンプレートを選択できるようになりました。

## エクスポート/インポート・プロセスの設定

Liferayは、エクスポート/インポート処理とステージング固有の機能を構成するための設定を提供します。 これらの設定は、ステージングとサイトテンプレートの伝播に影響します。

| 設定                   | Description                                                                                                                                                   |
|:-------------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| すべてのアセットリンクを含める      | チェックした場合、指定した日付範囲内のサイトからすべての資産リンクが含まれます。 チェックを外すと、コンテンツに関連するアセットリンクのみが含まれます。                                                                                  |
| 個々の削除をデフォルトで反映する     | チェックした場合、コンテンツ タイプに対して実行された削除操作は、デフォルトで常にターゲット サイトに複製されます。                                                                                                    |
| デフォルトで権限を公開する        | チェックした場合、エクスポートされたページと個々のポートレットウィンドウに割り当てられたパーミッションは、デフォルトで常に含まれます。                                                                                           |
| ファイルエントリの検証          | チェックが入っている場合、テキストを含むコンテンツタイプをパブリッシュまたはインポートすると、Liferayはコンテンツにドキュメントへのリンクがあるかどうかをチェックし、それらが有効なドキュメントを指していることを確認します。                                            |
| Journal Feedの参照を検証する | チェックが入っている場合、テキストを含むコンテンツタイプをパブリッシュまたはインポートすると、LiferayはコンテンツのWebコンテンツフィードへの参照をチェックし、それらが有効なフィードを指していることを確認します。                                                |
| レイアウトの参照を検証します。      | チェックが入っている場合、テキストを含むコンテンツタイプをパブリッシュまたはインポートすると、Liferayはポータルのバーチャルホストの1つへのリンクがあるかどうかをチェックし、有効なLiferayページを指すことを確認します。 バーチャルホストにLiferay以外のページがある場合はチェックを外してください。 |
| 欠落している参照を検証します。      | チェックした場合、パブリッシングとインポート処理でLiferayが参照漏れをチェックします。 チェックをはずすと、欠落参照の検証はスキップされる。 その結果、既存のターゲットがないリファレンスも、ターゲットサイトにパブリッシュまたはインポートすることができる。                            |

## 関連トピック

* [サイトの追加](./adding-a-site.md)
* [サイトテンプレート](./site-templates.md)
* [サイトテンプレートのエクスポート/インポート](./site-templates/exporting-importing-site-templates.md)
