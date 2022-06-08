# スリムバンドルの使用

> サブスクライバー

Liferay DXP 7.2フィックスパックおよびサービスパックは、Tomcatアプリケーションサーバーにバンドルされて提供されています。 従来のバンドルと _スリムバンドル_として利用できます。 従来のDXP 7.2バンドルには、_パッチファイル_（パッチングツールが特定のパッチをインストールするために必要なすべてのソースコードとバックアップファイル）が含まれています。 スリムバンドルにはパッチファイルが含まれていないため、従来のバンドルの約3分の1のサイズです。 スリムバンドルは、ディスク容量が限られている、またはコストがかかるデモまたはインストールを目的としています。 クラウドやコンテナ環境に最適です。

```{important}
スリムバンドルは、Liferay DXP 7.2以前でのみ使用されます。 DXP 7.3以降では必要ありません。
```

```{warning}
ほとんどのパッチツールコマンド（ `install`など）は、フィックスパックまたはサービスパックのパッチファイルがスリムバンドルにインストールされるまで、スリムバンドルで実行できません。
```

スリムバンドルのそれぞれのフィックスパック/サービスパックのパッチファイルがない場合、スリムバンドルは次のパッチングツールコマンドに限定されます。

* [`auto-discovery`](../../reference/configuring-the-patching-tool.md)
* [`info`](../../reference/getting-patch-information.md)
* `setup`

スリムバンドルにはパッチを適用できますが、パッチファイルを復元する追加の手順が必要です。 各パッチのパッチファイルは、 [ヘルプセンター](https://customer.liferay.com/downloads)で入手できます。

## スリムバンドルのパッチ適用

スリムバンドルにパッチをインストールしようとすると、パッチツールはパッチファイルが必要であると報告します。 メッセージは次のとおりです。

```
This installation does not include data for patching. Please copy the
liferay-patching-files-[separation-name].zip file into the 'patches'
directory and run patching-tool setup.
```

パッチファイルを復元する方法は次のとおりです。

1. [ヘルプセンター](https://customer.liferay.com/downloads)からパッチファイルをダウンロードします。 フィックスパックまたはサービスパックに移動し、ドロップダウンから_［Patching Files］_を選択し、_［ダウンロード］_をクリックして、パッチファイルをダウンロードします。

1. パッチファイルをスリムバンドルの `patching-tool/patches` フォルダに抽出します。

1. `patching-tool` フォルダへのコマンドラインを開きます。

1. パッチングツールを使用して、パッチファイルを設定します。

    ```bash
    ./patching-tool.sh setup
    ```

    スリムバンドルにパッチファイルがあり、パッチを適用する準備ができています。

1. [Installing Patches](../installing-patches-for-dxp-7-3-and-earlier.md) の手順に従って、スリムバンドルにパッチを適用します。

スリムバンドルを使用するメリットを学び、パッチを適用する方法を理解しました。

## 追加情報

* [Installing Patches](../installing-patches-for-dxp-7-3-and-earlier.md)
* [Slimming Down Patched Installations](./slimming-down-patched-installations.md)
