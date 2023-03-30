---
uuid: f3bb512e-5954-47b2-bf3d-bccaee642919
---
# フラグメントの自動デプロイ

{bdg-secondary}`利用可能 Liferay Portal 7.3 GA1+ または Liferay DXP 7.3+`

[独自のツールでページフラグメントを開発している場合](./using-the-fragments-toolkit.md#fragment-set-structure) 、Liferay UIでインポートするためにZIPファイルにパッケージすることでデプロイすることができます。 ただし、UI の使用に限定されません。 コマンドラインからフラグメントZIPファイルを展開することも可能です。 ここでは、フラグメントプロジェクトを扱う方法と、Liferayの自動展開の仕組みを使ってコマンドラインから好きなサイトにフラグメントをインポートする方法を学びます。

```{note}
Liferay DXP 7.4+では、フラグメントコレクションはLiferay UIではフラグメントセットと呼ばれています。
```

## 自動デプロイ可能なフラグメントセットをデプロイする

```{include} /_snippets/run-liferay-portal.md
```

次に、以下の手順に従って、例のフラグメントセットを自動配備します。

1. [自動展開可能なフラグメントセットの例](https://learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-a2f8.zip) をダウンロードし、解凍する。

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-a2f8.zip -O
    ```

    ```bash
    unzip liferay-a2f8.zip
    ```

1. フラグメントプロジェクトのセットとそのデプロイメントディスクリプターをZIPファイルに圧縮する。

    ```bash
    cd liferay-a2f8
    ```

    ```bash
    zip -r  a2f8-fragments.zip a2f8-set/ liferay-deploy-fragments.json
    ```

1. 新しい `.zip` ファイルを Liferay の Docker コンテナの auto-deploy フォルダにコピーして、フラグメントセットを記述子指定のサイトにインポートします。

    ```bash
    docker cp a2f8-fragments.zip $(docker ps -lq):/opt/liferay/deploy
    ```

1. Docker コンソールで次のログメッセージを確認します。

    ```bash
    INFO  [com.liferay.portal.kernel.deploy.auto.AutoDeployScanner][AutoDeployDir:263] Processing a2f8-fragments.zip
    ```

1. フラグメントセットが利用可能であることを確認します。 **サイトメニュー**(![Site Menu](../../../images/icon-product-menu.png)) を開き、 ［**デザイン**］ &rarr; ［**フラグメント**］ に移動します。 セットがリストに表示されるはずです。

```{note}
インポートしたフラグメントに無効なルールがある場合、自動的にドラフトとして保存されます。
```

![セットでご利用いただけます。](./auto-deploying-fragments/images/01.png)

## フラグメントプロジェクトのストラクチャー

自動展開可能なフラグメントプロジェクトは、このような構造になっています。

```bash
[project ZIP]
├── [fragment-set]
│   ├── collection.json
│   └── [fragment]
│       └── fragment files ...
└── liferay-deploy-fragments.json
```

`liferay-deploy-fragments.json` ファイルは、フラグメントをデプロイするスコープを指定します。

* システム全体 (すべてのインスタンス)
* 仮想インスタンス（会社）
* あるサイト（グループ）。

この例では、仮想インスタンス（liferay.com）内の「Guest」というサイト（グループ）にデプロイする設定にしています。

```json
{
    "companyWebId": "liferay.com",
    "groupKey": "Guest"
}
```

このJSONファイルのキーはどちらもオプションです。 `liferay-deploy-fragments.json` ファイルで、空の JSON 要素を指定するか、この設定を追加することで、フラグメントをシステム全体（すべてのインスタンス）で利用可能にすることができます。

```json
{
    "companyWebId": "*"
}
```

```{warning}
フラグメント[リソース付き](./including-default-resources-with-fragments.md)をシステムレベルで利用可能にする場合、インポートはサポートされていません。
```

```{note}
フラグメントツールキットの [`npm run compress` コマンド](./using-the-fragments-toolkit.md) は、フラグメント ZIP ファイルとその配置記述子の作成を容易にします。
```

## フラグメントセットを変更して再デプロイする

以下の手順で、フラグメントセットを修正し、再展開してください。

1. プロジェクトの `a2f8-jumbotron` fragment フォルダーを `a2f8-set/` フォルダーに移動して、サンプルセットに新しいフラグメントを追加します。

1. 上記と同様に、フラグメントセットをZIPファイルに圧縮する。

    ```bash
    zip -r  a2f8-fragments.zip a2f8-set/ liferay-deploy-fragments.json
    ```

1. 前回と同様にZIPファイルをDockerコンテナにコピーして、修正したフラグメントセットをインポートします。

   ```bash
   docker cp a2f8-fragments.zip $(docker ps -lq):/opt/liferay/deploy
   ```

1. 新しいフラグメントの有無を確認する。 ［**サイトメニュー**］(![Site Menu](../../../images/icon-product-menu.png)) を開き、 ［**デザイン**］ &rarr; ［**フラグメント**］ に移動し、 ［**A2F8セット**］ をクリックします。 A2F8ジャンボトロンの断片が含まれているはずです。

    ![新しいフラグメントは、自動展開されたSetに含まれます。](./auto-deploying-fragments/images/02.png)

これで、フラグメントセットをローカルで操作する方法、フラグメントセットのサイトを指定する方法、自動配置を使用してインポートする方法がわかりました。

## 追加情報

* [フラグメントにデフォルトのリソースを含める](./including-default-resources-with-fragments.md)
* [フラグメントへの構成オプションの追加](./adding-configuration-options-to-fragments.md)
