# パッチを適用したインストールのスリム化

> サブスクライバー

Liferay DXP 7.2では、DXPパッチ情報は、デフォルトでインストールのパッチファイルに保持されます。 これにより、DXPを以前のパッチレベルに簡単に復元できます。 ただし、パッチファイルは多くの領域を占有する可能性があります。 ここでは、パッチファイルをインストールから分離してインストールをスリム化する方法と、パッチアクティビティにパッチファイルが必要な場合にパッチファイルをインストールに復元する方法を学びます。

パッチファイル（メタデータ、検証、および検証に使用されるファイル）はデフォルトでWebアプリケーションの `WEB-INF` フォルダ内に格納されるため、パッチを適用したインストールは大きくなります。 パッチングツールでは、新しいパッチをインストールし、以前のパッチレベルを復元するためにこれらのファイルが必要です。そのため、これらのファイルは保持しておく必要があります。 ただし、パッチファイルをインストールから抽出することにより、DXPインストールサイズを縮小できます。 新しいパッチをインストールするか、以前のパッチレベルを復元する準備ができたら、パッチファイルを安全に復元できます。

```{important}
これらのパッチファイルは、Liferay DXP 7.2以前でのみ使用されます。 DXP 7.3以降では、パッチファイルの分離は必要ありません。
```

ここでは、インストールのサイズ縮小に関するトピックを示します。

* [インストールからパッチファイルを分離する](#separating-patch-files-from-the-installation)
* [個別のパッチファイルの復元](#restoring-separated-patch-files)

## インストールからパッチファイルを分離する

パッチングツールの `separate` コマンドは、デフォルトの場所（Webアプリケーションの `WEB-INF` フォルダ）からパッチファイルを抽出し、ZIPファイルにパッケージ化します。 コマンドは次のとおりです。

```bash
./patching-tool.sh separate [separation_name]
```

このコマンドは、パッチファイルをパッチファイルのデフォルトの場所から、パッチングツールの `patch` フォルダ内の `liferay-patching-files-[separation-name].zip` ファイルに移動します。 インストールのサイズを小さくするには、ZIPファイルを別の場所に保存します。

**注意：** この方法でDXPがパッチから分離されている場合は、次のパッチングツールコマンドのみを使用できます。

* `auto-discovery`
* `info`
* `setup`

他のすべてのコマンドでは以下が返されます。

```
This installation does not include data for patching. Please copy the
liferay-patching-files-[separation-name].zip file into the 'patches' directory
and run patching-tool setup.
```

## 個別のパッチファイルの復元

DXPに再度パッチを適用する必要がある場合は、分離されたパッチファイルを復元する必要があります。

1. `liferay-patching-files-[separation-name].zip` をパッチングツールの `patches` フォルダにコピーします。

1. 次のコマンドを実行します。

    ```bash
    ./patching-tool.sh setup
    ```

パッチファイルは、インストールパッチファイルのデフォルトの場所に復元されます。 パッチングツールのコマンドはすべて使用できます。

DXPのインストールが不要なスペースを占有しないように、パッチファイルを保存する方法をマスターしました。 また、新しいパッチをインストールできるようにパッチファイルを復元する方法も理解しました。

## 追加情報

* [パッチのインストール](../installing-patches-for-dxp-7-3-and-earlier.md)
* [パッチングツールのインストール](../../reference/installing-the-patching-tool.md)
* [パッチングツールの構成](../../reference/configuring-the-patching-tool.md)
* [スリムバンドルの使用](./using-slim-bundles.md)
