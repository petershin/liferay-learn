# カスタムコードとパッチの互換性

> サブスクライバー

DXP 7.2をカスタマイズまたはパッチするコードを展開する場合、使用しているすべてのパッチとの互換性を維持する必要があります。 次のトピックでは、この方法について説明します。

* [カスタムパッチのパッチレベル情報の保存](#storing-patch-level-information-for-custom-patches)
* [パッチレベルの違いの比較](#comparing-patch-level-differences)
* [パッチとカスタムプラグイン間の衝突の処理](#handling-collisions-between-patches-and-custom-plugins)

```{important}
これらのカスタマイズとパッチ適用の手順は、Liferay DXP 7.2にのみ適用されます。 DXP 7.3以降には適用されません。
```

## カスタムパッチのパッチレベル情報の保存

パッチングツールの `store` および `diff` コマンドは、Liferay DXPパッチとカスタムDXPパッチを含む、パッチ間の違いを処理します。 `store` コマンドは、パッチソースコードのパッチレベルファイルを書き込みます。 `diff` コマンドは、パッチ間の違いを出力します。

`./patching-tool.sh store` コマンドは、 `diff` コマンドで使用されるパッチレベル情報を管理します。 パッチには、パッチレベルを格納し、 `diff` コマンドの使用可能な情報を準備するためのソースコードが含まれている必要があります。 `store` コマンドオプションは次のとおりです。

* `add`：パッチレベルを `patches` フォルダに保存します。
* `info`：保存されているパッチレベルを構成するパッチのリストを出力します。
* `rm`：以前に保存されたパッチレベル情報を削除します。
* `update`：パッチレベル情報を追加または更新します。

詳しい使用方法については、`./patching-tool.sh help store`を実行してください。

## パッチレベルの違いの比較

`./patching-tool.sh diff` コマンドは、2つのパッチレベルの違いを出力します。 少なくとも1つの保存されたパッチレベルが使用可能である必要があります。 このコマンドは、出力をフィルタリングするための次のオプションを受け入れます。

* `collisions`：デプロイされたプラグインと衝突する変更されたファイルを一覧表示します。
* `files`：変更されたファイルを一覧表示します。
* `fixed-issues`：パッチが修正する（問題追跡システムからの）LPS/LPE問題を一覧表示します。
* `html`：フィルタリングオプション（`source`、`files`、または`fixed-issues`）のいずれかと一緒にHTMLを指定し、パッチレベルの後に、差分を`diffs`フォルダのHTMLファイル（`<stored-name-1>-<stored-name-2>-[type]-diff.html`）に書き込みます。 追加は緑色で、削除は赤色で表示されます。
* `source`：2つのパッチレベル間のソースコードの違いを示します。

詳しい使用方法については、`./patching-tool.sh help diff`を実行してください。

## パッチとカスタムプラグイン間の衝突の処理

一部のパッチは、プラグインを介してカスタマイズされたファイルを更新します。 `list-collisions` コマンドは、OSGiフラグメントバンドルのJSPファイルの違い（衝突）を返します。

```bash
./patching-tool.sh list-collisions
```

これは、次のdiffコマンドのエイリアスです。

```bash
./patching-tool.sh diff collisions files _base
```

`_base` 引数は、リテラルパッチレベル名です。 衝突は、ソースコードファイルを含むインストール済みパッチに対してのみ表示されます。

特定のパッチを削除した場合、または何らかの衝突が発生した場合は、`-force` 引数を使用して、パッチングツールに現在使用可能なパッチを強制的にインストールさせます。

例:

```bash
./patching-tool.sh profile_name install -force
```

カスタムコードとカスタムパッチを他のDXPパッチと統合する方法をマスターしました。

## 追加情報

* [Installing Patches](../installing-patches-for-dxp-7-3-and-earlier.md)
* [Installing the Patching Tool](../../reference/installing-the-patching-tool.md)
* [Configuring the Patching Tool](../../reference/configuring-the-patching-tool.md)
