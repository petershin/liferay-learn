# フラグメントの自動デプロイ

{bdg-secondary}`利用可能な Liferay Portal 7.3 GA1+ または Liferay DXP 7.3+`

もしあなたが [独自のツールでページフラグメントを開発しているなら、](./using-the-fragments-toolkit.md#fragment-set-structure) 、Liferay UI経由でインポートするためにそれらをZIPファイルにパッケージすることでデプロイすることができます。 ただし、UI の使用に限定されません。 コマンドラインからフラグメントZIPファイルをデプロイすることも可能です。 ここでは、フラグメントプロジェクトを扱う方法と、Liferayの自動デプロイメント機構を使ってコマンドラインから好きなサイトにフラグメントをインポートする方法を学びます。

```{note}
Liferay DXP 7.4+ では、フラグメントコレクションは Liferay UI ではフラグメントセットと呼ばれます。
```

## 自動デプロイ可能なフラグメントセットをデプロイする

```{include} /_snippets/run-liferay-portal.md
```

次に、以下の手順に従って、サンプルのフラグメントセットを自動デプロイします。

1. [Example auto-deployable fragment set](https://learn.liferay.com/dxp/latest/ja/site-building/developer-guide/developing-page-fragments/liferay-a2f8.zip) をダウンロードし、解凍する。

    ```bash
    curl https://learn.liferay.com/dxp/latest/ja/site-building/developer-guide/developing-page-fragments/liferay-a2f8.zip -O
    ```

    ```bash
    unzip liferay-a2f8.zip
    ```

1. フラグメントプロジェクトのセットとそのデプロイメントディスクリプタをZIPファイルに圧縮します。

    ```bash
    cd liferay-a2f8
    ```

    ```bash
    zip -r  a2f8-fragments.zip a2f8-set/ liferay-deploy-fragments.json
    ```

1. 新しい `.zip` ファイルを Liferay の Docker コンテナの auto-deploy フォルダにコピーして、フラグメントセットをディスクリプタで指定したサイトにインポートします。

    ```bash
    docker cp a2f8-fragments.zip $(docker ps -lq):/opt/liferay/deploy
    ```

1. Docker コンソールで次のログメッセージを確認します。

    ```bash
    INFO  [com.liferay.portal.kernel.deploy.auto.AutoDeployScanner][AutoDeployDir:263] Processing a2f8-fragments.zip
    ```

1. フラグメントセットが利用可能であることを確認する。 **サイトメニュー**(![Site Menu](../../../images/icon-product-menu.png)) を開き、 ［**デザイン**］ &rarr; ［**フラグメント**］ に移動します。 セットがリストに表示されるはずです。

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

この例では、仮想インスタンス（liferay.com）内の「Guest」というサイト（グループ）にデプロイする設定になっています。

```json
{
    "companyWebId": "liferay.com",
    "groupKey": "Guest"
}
```

このJSONファイルのキーはどちらもオプションです。 `liferay-deploy-fragments.json` ファイルで、空のJSON要素を指定するか、この設定を追加すれば、フラグメントをシステム全体で（すべてのインスタンスで）利用できるようにすることができます。

```json
{
    "companyWebId": "*"
}
```

```{warning}
フラグメントをシステムレベルで利用可能にする場合、[リソース付き](./including-default-resources-in-fragments.md) のインポートはサポートされていません。
```

```{note}
フラグメントツールキットの [`npm run compress` コマンド](./using-the-fragments-toolkit.md) はフラグメント ZIP ファイルとその配備記述子の作成を容易にします。
```

## フラグメントセットを変更して再デプロイする

以下の手順でフラグメントセットを修正し、再展開します。

1. プロジェクトの `a2f8-jumbotron` fragment フォルダーを `a2f8-set/` フォルダーに移動して、サンプルセットに新しいフラグメントを追加してください。

1. 上記と同様にフラグメントセットをZIPファイルに圧縮してください。

    ```bash
    zip -r  a2f8-fragments.zip a2f8-set/ liferay-deploy-fragments.json
    ```

1. 前回と同様にZIPファイルをDockerコンテナにコピーして、変更したフラグメントセットをインポートします。

   ```bash
   docker cp a2f8-fragments.zip $(docker ps -lq):/opt/liferay/deploy
   ```

1. 新しいフラグメントをチェックする。 ［**サイトメニュー**］(![Site Menu](../../../images/icon-product-menu.png)) を開き、 ［**デザイン**］ &rarr; ［**フラグメント**］ に移動し、 ［**A2F8セット**］ をクリックします。 A2F8ジャンボトロンの断片が含まれているはずです。

    ![新しいフラグメントは、自動展開されたセットに含まれます。](./auto-deploying-fragments/images/02.png)

フラグメントセットをローカルで操作する方法、フラグメントセットのサイトを指定する方法、自動配置を使用してインポートする方法はお分かりいただけたと思います。

## 追加情報

* [Including Default Resources with Fragments](./including-default-resources-with-fragments.md)
* [フラグメントへの構成オプションの追加](./adding-configuration-options-to-fragments.md)
