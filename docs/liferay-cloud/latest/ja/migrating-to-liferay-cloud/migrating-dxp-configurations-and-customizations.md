# ステージ4：DXPの設定とカスタマイズの移行

データベースとドキュメントライブラリがLiferay Cloud環境に適用されたので、移行の次の段階として、オンプレミスのLiferayインストールの設定とカスタムコードを移行する必要があります。 これは、デプロイ前にプロパティファイル、OSGi設定、カスタムモジュール、テーマ、WARファイルを適切なフォルダーに整理することです。

## 設定ファイルの整理

まず、移行したいオンプレミスインストールのLiferayの設定ファイルを整理します。 これには、使用しているポータルのプロパティファイル（ [）](../customizing-liferay-dxp-in-the-cloud/configuring-the-liferay-dxp-service.md#portal-properties) が含まれます。

```{tip}
Liferay 固有のコードは `liferay` フォルダに属し、 [Liferay DXP workspace](https://learn.liferay.com/w/dxp/developing-applications/tooling/liferay_workspace) のように構成されています。
```

[先にクローンした](./matching-dxp-versions.md#clone-the-liferay-cloud-repository) Liferay Cloud プロジェクトリポジトリから`liferay/configs/{ENV}/`フォルダ（Liferay Cloud 環境に対応）に移動し、Liferay [ポータルプロパティ](../customizing-liferay-dxp-in-the-cloud/configuring-the-liferay-dxp-service.md#portal-properties) ファイル（例： `portal-ext.properties`）を各環境フォルダに配置します。

[OSGi 設定](../customizing-liferay-dxp-in-the-cloud/configuring-the-liferay-dxp-service.md#osgi-configurations) ファイル（例： `.cfg` または `.config` ファイル）を、 `osgi/`という適切な環境フォルダの中のサブフォルダに入れます。

例えば、 `dev` の環境では、portal のプロパティファイルを `liferay/configs/dev`に、OSGi の設定ファイルを `liferay/configs/dev/osgi/`に配置します。

```{tip}
`liferay/configs/common/` フォルダに置かれたファイルは、デプロイされると全ての環境に適用されます。
```

変更がデプロイされると、 `liferay/configs/` 環境フォルダーに置かれたポータルのプロパティファイルは、対応する環境の  `liferay` サービスのコンテナ内の `$LIFERAY_HOME` フォルダーに自動的にコピーされます。 OSGi のプロパティは、 `$LIFERAY_HOME/osgi/configs/` フォルダに自動的にコピーされます。

## OSGiモジュールの整理

もし、オンプレミスの Liferay インストールに使用するカスタム OSGi モジュールがあるなら、すべての [OSGiサービスのオーバーライドをする](https://learn.liferay.com/w/dxp/liferay-internals/extending-liferay/overriding-osgi-services) を適切な環境の `liferay/modules/{ENV}/` フォルダ（同じワークスペースフォルダ構造を持つ）に置きます。

変更がデプロイされると、カスタムモジュールのコードは自動的にコンパイルされ、 `liferay` サービスコンテナの `$LIFERAY_HOME/deploy/` フォルダーにデプロイされます。

## カスタムテーマの整理

次に、 [環境の設定とテーマの作成](https://learn.liferay.com/w/dxp/site-building/site-appearance/themes/theme-development/getting-started/setting-up-an-environment-and-creating-a-theme) のすべてのソースコードを、適切な環境の `liferay/themes/{ENV}/` フォルダに置きます。

変更がデプロイされると、カスタムテーマは自動的にビルドされ、 `liferay` サービスコンテナの `$LIFERAY_HOME/deploy/` フォルダにデプロイされます。

## WARファイルの整理

次に、Liferay インストールのすべての WAR ファイル [WARのデプロイ（WABジェネレータ）](https://learn.liferay.com/dxp/latest/ja/building-applications/reference/deploying-wars-wab-generator.html) を適切な環境の `liferay/wars/{ENV}/` フォルダに配置します。

変更がデプロイされると、WAR ファイルは自動的に適切な環境の `liferay` サービスのコンテナ内の `$LIFERAY_HOME/deploy/` フォルダにデプロイされます（複数可）。

## ビルドの作成とデプロイ

次に、これらの変更点を含むビルドを作成し、デプロイして、Liferay Cloud 環境に適用する必要があります。

### 変更を伴うJenkinsビルドの作成

Gitがインストールされている端末でGitコマンドを実行し、変更内容を送信します。

1. 変更したファイルをGitに追加します。 

    ```bash
    git add .
    ```

1. 変更内容とメッセージを添えてコミットしてください。 

    ```bash
    git commit -m "Liferay Cloud Migration Stage 4"
    ```

1. 変更をGitHubにプッシュします。 

    ```bash
    git push origin master
    ```

プロジェクトはGitHubのリポジトリにリンクされているため、変更をプッシュすると自動的にビルドが作成されます。 ビルドが完了するのを待ってから、次に進みます。

### ビルドを選択した環境にデプロイする

最後に、 [Liferay Cloud Console](https://console.liferay.cloud/) を使って、完成したビルドを選択した環境にデプロイします。

1. Liferay Cloud Console で Builds ページに移動します（ページ上部のリンクを使用します）。

1. リストの中から前回作成したビルドを探し、「Actions」メニューから「**Deploy build to**」をクリックします。
   
   ![ビルドのActionsメニューでデプロイします。](./creating-data-backup-files/images/01.png)

1. ビルドをデプロイする環境を選択します（例： `acme-dev`）。

1. 以下の情報を読み、確認ボックスを選択して、展開結果を確認します。
   
   ![チェックボックスにチェックを入れ、準備ができたらビルドをデプロイしてください。](./creating-data-backup-files/images/02.png)

1. **Deploy Build** をクリックします。

ビルドは選択した環境にデプロイされ、 `liferay` サービスが再起動すると、選択した環境にLiferayの設定とカスタマイズが適用されます。

## 次のステップ

これで、Liferay の設定とカスタマイズの移行は完了です。 次に、 [の Web サーバーの設定を移行します。](./migrating-web-server-configurations.md).
