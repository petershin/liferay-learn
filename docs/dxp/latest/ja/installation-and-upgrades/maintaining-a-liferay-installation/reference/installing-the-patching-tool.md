# パッチングツールのインストール

> サブスクライバー

パッチングツールのインストールと更新は簡単です。

## インストール

1. [カスタマーポータル](https://customer.liferay.com/downloads) からパッチツールをダウンロードします。

    ***DXP 7.3以降の場合、** 最新のパッチツールをダウンロードします。
    ***DXP 7.2の場合、** 最新バージョンのパッチツール2.xをダウンロードします。

1. パッチングツールを [Liferay Home](../../reference/liferay-home.md) フォルダ（推奨）または別のフォルダに解凍します。

パッチングツールフォルダ `patching-tool` には、`patching-tool.sh` スクリプトが含まれています。

パッチングツールのヘルプメッセージを出力するには、`patching-tool` フォルダで次のコマンドを実行します。

```bash
cd patching-tool
./patching-tool.sh help
```

## パッチングツールの更新

パッチングツールは、インストールするパッチに新しいパッチングツールバージョンが必要な場合に報告します。 パッチングツールを更新する方法は次のとおりです。

1. [カスタマーポータル](https://customer.liferay.com/downloads) からパッチツールをダウンロードします。

    ***DXP 7.3以降の場合、** 最新のパッチツールをダウンロードします。
    ***DXP 7.2の場合、** パッチツールの最新の2.xバージョンをダウンロードします。

1. 既存のパッチングツールの `.properties` ファイルをバックアップします。

1. 新しいパッチングツールを `patching-tool` フォルダの親フォルダ（通常はLiferay Home）に解凍して、既存のパッチングツールを上書きします。

パッチングツールをDXPインストールで構成する準備ができました。

## 追加情報

* [パッチングツールの構成](./configuring-the-patching-tool.md)
* [パッチのインストール](../patching-dxp-7-3-and-earlier/installing-patches-for-dxp-7-3-and-earlier.md)
* [カスタムコードとパッチの互換性](../patching-dxp-7-3-and-earlier/advanced-patching-for-dxp-7-2/custom-code-and-patch-compatibility.md)