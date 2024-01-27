# フラグメントの自動デプロイ

{bdg-secondary}`liferay Portal 7.3 GA1+ または Liferay DXP 7.3+`.

もしあなたが [独自のツールでページフラグメントを開発しているなら](./using-the-fragments-toolkit.md#fragment-set-structure) 、Liferay UI経由でインポートできるようにZIPファイルにパッケージ化することでデプロイできます。 ただし、UI の使用に限定されません。 コマンドラインからフラグメントZIPファイルをデプロイすることも可能です。 ここでは、フラグメントプロジェクトを操作し、Liferay の自動デプロイメカニズムを使用してコマンドラインからフラグメントを必要なサイトにインポートする方法を学びます。

```{note}
Liferay DXP 7.4+では、フラグメントコレクションはLiferay UIではフラグメントセットと呼ばれます。
```

## 自動デプロイ可能なフラグメントセットをデプロイする

```{include} /_snippets/run-liferay-portal.md
```

次に、以下の手順に従って、サンプルのフラグメントセットを自動デプロイします：

1. [サンプル自動展開可能フラグメントセット](https://resources.learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-a2f8.zip) をダウンロードし、解凍します：

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-a2f8.zip -O
   ```

   ```bash
   unzip liferay-a2f8.zip
   ```

1. フラグメントプロジェクトのセットとそのデプロイメント記述子をZIPファイルに圧縮します。

   ```bash
   cd liferay-a2f8
   ```

   ```bash
   zip -r  a2f8-fragments.zip a2f8-set/ liferay-deploy-fragments.json
   ```

1. 新しい `.zip` ファイルを Liferay の Docker コンテナの auto-deploy フォルダにコピーして、フラグメントセットを記述子が指定したサイトにインポートします：

   ```bash
   docker cp a2f8-fragments.zip $(docker ps -lq):/opt/liferay/deploy
   ```

1. Docker コンソールで次のログメッセージを確認します。

   ```bash
   INFO  [com.liferay.portal.kernel.deploy.auto.AutoDeployScanner][AutoDeployDir:263] Processing a2f8-fragments.zip
   ```

1. フラグメントセットが利用可能であることを確認します。 サイトメニュー* (![サイトメニュー](../../../images/icon-product-menu.png))を開き、_デザイン_ &rarr; _フラグメント_に移動します。 セットがリストに表示されます。

```{note}
インポートされたフラグメントに無効なルールがある場合、自動的にドラフトとして保存される。
```
![The set is available.](./auto-deploying-fragments/images/01.png)

## フラグメントプロジェクトのストラクチャー

自動デプロイ可能なフラグメントプロジェクトの構造は次のとおりです。

```bash
[project ZIP]
├── [fragment-set]
│   ├── collection.json
│   └── [fragment]
│       └── fragment files ...
└── liferay-deploy-fragments.json
```

`liferay-deploy-fragments.json` ファイルはフラグメントを配置するスコープを指定します：

* システム全体 (すべてのインスタンス)
* 仮想インスタンス（会社）
* サイト (グループ)

以下のサンプルの構成では、仮想インスタンス（liferay.com）内の「Guest」というサイト（グループ）にデプロイするよう指定されています。

```json
{
    "companyWebId": "liferay.com",
    "groupKey": "Guest"
}
```

このJSONファイルのキーはどちらもオプションです。 `liferay-deploy-fragments.json`ファイルでは、空のJSON要素を指定するか、この設定を追加することで、フラグメントをシステム全体で(すべてのインスタンスで)利用できるようにすることができます：

```json
{
    "companyWebId": "*"
}
```

```{warning}
システムレベルで利用できるようにする場合、リソース を使用したフラグメント <a href="./including-default-resources-with-fragments.md">のインポートはサポートされていません。
```

```{note}
フラグメント・ツールキットの [`npm run compress` コマンド](./using-the-fragments-toolkit.md) は、フラグメント ZIP ファイルとそのデプロイメント記述子の作成を容易にする。
```

## フラグメントセットを変更して再デプロイする

以下の手順で、フラグメントセットを変更して再デプロイします。

1. プロジェクトの `a2f8-jumbotron` フラグメントフォルダを `a2f8-set/` フォルダに移動して、サンプルセットに新しいフラグメントを追加する。

1. 前述のように、フラグメントセットを ZIP ファイルに圧縮します。

   ```bash
   zip -r  a2f8-fragments.zip a2f8-set/ liferay-deploy-fragments.json
   ```

1. 上記で行ったように、ZIP ファイルを Docker コンテナにコピーして、変更されたフラグメントセットをインポートします。

   ```bash
   docker cp a2f8-fragments.zip $(docker ps -lq):/opt/liferay/deploy
   ```

1. 新しいフラグメントを確認します。 サイトメニュー(![サイトメニュー](../../../images/icon-product-menu.png))を開き、_デザイン_ &rarr; _フラグメント_に移動し、_A2F8セット_をクリックします。 A2F8ジャンボトロンフラグメントが含まれているはずです。

   ![The new fragment is included in the auto-deployed Set.](./auto-deploying-fragments/images/02.png)

これで、ローカルでフラグメントセットを操作する方法、フラグメントセットにサイトを指定する方法、自動デプロイメントを使ってフラグメントセットをインポートする方法がわかりました。

## 関連トピック

* [フラグメントでデフォルトのリソースを含める](./including-default-resources-with-fragments.md)
* [フラグメントへの設定オプションの追加](./adding-configuration-options-to-fragments.md)
