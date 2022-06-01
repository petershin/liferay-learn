# ステージ4：DXPの設定とカスタマイズの移行

データベースとドキュメントライブラリがDXP Cloud環境に適用されたので、次の移行段階では、オンプレミスのLiferayインストールの設定とカスタムコードの移行を行います。 これは、デプロイ前にプロパティファイル、OSGi設定、カスタムモジュール、テーマ、WARファイルを適切なフォルダーに整理することです。

## 設定ファイルの整理

まず、移行したいオンプレミスインストールのLiferayの設定ファイルを整理します。 これには、使用している [ポータルプロパティファイル](../using-the-liferay-dxp-service/configuring-the-liferay-dxp-service.md#portal-properties) が含まれます。

```{tip}
Liferay 固有のコードは `liferay` フォルダに属し、 [Liferay DXP workspace](https://learn.liferay.com/dxp/latest/en/developing-applications/tooling/liferay_workspace.html) のように構成されています。
```

[クローンしたDXP Cloudプロジェクトリポジトリで](./matching-dxp-versions.md#clone-the-dxp-cloud-repository) 、 `liferay/configs/{ENV}/` フォルダ（DXP Cloud環境に相当）に移動してください。 そしてLiferayの [ポータルのプロパティ](../using-the-liferay-dxp-service/configuring-the-liferay-dxp-service.md#portal-properties) ファイルを全て置きます（例.g., `portal-ext.properties`) をそれぞれの環境フォルダに入れます。

[OSGi 設定](../using-the-liferay-dxp-service/configuring-the-liferay-dxp-service.md#osgi-configurations) ファイル (例: `.cfg` または `.config` files) を `osgi /`という適切な環境フォルダ内のサブフォルダに入れてください .

例えば、 `dev` 環境では、ポータルのプロパティファイルを `liferay/configs/dev`に、OSGiの設定ファイルを `liferay/configs/dev/osgi/`に配置するようにします。

```{tip}
liferay/configs/common/` フォルダに置かれたファイルは、デプロイされると全ての環境に適用されます。
```

変更がデプロイされると、 `liferay/configs/` 環境フォルダに置かれたポータルのプロパティファイルは自動的に対応する環境の `$LIFERAY_HOME` サービスコンテナの  `liferay` フォルダにコピーされます。 OSGiのプロパティは、 `$LIFERAY_HOME/osgi/configs/` フォルダに自動的にコピーされます。

## OSGiモジュールの整理

もし、オンプレミスのLiferayインストールに使用するカスタムOSGiモジュールがあるなら、すべての [OSGiモジュールのソースコード](https://learn.liferay.com/dxp/latest/ja/liferay-internals/extending-liferay/overriding-osgi-services.html) を適切な環境の `liferay/modules/{ENV}` フォルダー（同じワークスペースフォルダーの構造で）に置いてください。

変更がデプロイされると、カスタムモジュールのコードは自動的にコンパイルされ、 `liferay` サービスコンテナの `$LIFERAY_HOME/deploy/` フォルダにデプロイされます。

## カスタムテーマの整理

次に、すべての [カスタムテーマ](https://learn.liferay.com/dxp/latest/ja/site-building/site-appearance/themes/theme-development/getting-started/setting-up-an-environment-and-creating-a-theme.html) のソースコードを適切な環境の `liferay/themes/{ENV}/` フォルダに配置します。

変更がデプロイされると、カスタムテーマは自動的にビルドされ、 `liferay` サービスコンテナの `$LIFERAY_HOME/deploy/` フォルダにデプロイされます。

## WARファイルの整理

次に、Liferay インストールの [WAR ファイル](https://learn.liferay.com/dxp/latest/ja/building-applications/reference/deploying-wars-wab-generator.html) をすべて適切な環境の `liferay/wars/{ENV}/` フォルダに配置します。

変更がデプロイされると、WARファイルは適切な環境の `サービスの` 内の `$LIFERAY_HOME/ deploy/` フォルダーに自動的にデプロイされ。

<h2 spaces-before="0">ビルドの作成とデプロイ</h2>

<p spaces-before="0">次に、これらの変更点を含むビルドを作成してデプロイし、DXP Cloud 環境に適用する必要があります。</p>

<h3 spaces-before="0">変更を伴うJenkinsビルドの作成</h3>

<p spaces-before="0">Gitがインストールされている端末でGitコマンドを実行し、変更内容を送信します。</p>

<ol start="1">
<li><p spaces-before="0">変更したファイルをGitに追加します。
<pre><code class="bash">    git add .
`</pre></li>

1. 変更内容とメッセージを添えてコミットしてください。

    ```bash
    git commit -m "DXP Cloud Migration Stage 4"
    ```

1. 変更をGitHubにプッシュします。

    ```bash
    git push origin master
    ```

プロジェクトはGitHubのリポジトリにリンクされているため、変更をプッシュすると自動的にビルドが作成されます。 ビルドが完了するのを待ってから、次に進みます。

### ビルドを選択した環境にデプロイする

最後に、 [DXP Cloud Console](https://console.liferay.cloud/) を使用して、完成したビルドを選択した環境にデプロイします。

1. DXP Cloud Consoleで、Buildsページに移動します（ページ上部のリンクを使用します）。

1. リストの中から前回作成したビルドを探し、[アクション]メニューから **Deploy build to** をクリックします。

    ![ビルドのActionsメニューでデプロイします。](./creating-data-backup-files/images/01.png)

1. ビルドをデプロイする環境を選択します（例： `acme-dev`）。

1. 以下の情報を読み、確認ボックスを選択して、展開結果を確認します。

    ![チェックボックスにチェックを入れ、準備ができたらビルドをデプロイしてください。](./creating-data-backup-files/images/02.png)

1. **Deploy Build** をクリックします。

ビルドは選択した環境にデプロイされ、 `liferay` サービスが再起動すると、選択した環境にLiferayの設定やカスタマイズが適用されます。

## 次のステップ

これで、Liferay の設定とカスタマイズの移行は完了です。 次に、 [Webサーバーの設定](./migrating-web-server-configurations.md)を移行します。
