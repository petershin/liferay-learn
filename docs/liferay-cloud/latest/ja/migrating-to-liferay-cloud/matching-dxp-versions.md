# ステージ1：DXPバージョンのマッチング

移行の第一段階として、Liferay Cloud上で動作するLiferayサービスが、移行したいインストールと同じバージョンで動作するように設定します。

そのためには、Liferay Cloud のリポジトリをクローンし、そこにバージョン変更の設定を行い、ビルドをデプロイすることでLiferay Cloudにその更新を戻す必要があります。

## Liferayのバージョン情報を検索する

まず、移行したい Liferay DXP インストールのバージョン番号とインストールされているパッチを探します。 Liferay Cloud で Liferay サービスを適切に設定するために、これらの値が必要です。

これらの値を求めるには、パッチングツールを使用します。

1. こちらの手順 [](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/maintaining-a-liferay-installation/reference/installing-the-patching-tool.html) に従って、移行したいインストールにパッチングツールをインストールします。

1. 任意のコマンドラインツールでパッチングツールフォルダーに移動します。

    ```bash
    cd $LIFERAY_HOME/patching-tool
    ```

1. パッチツールを使用して、インストールのバージョン情報を取得します。

    ```bash
    ./patching-tool.sh info
    ```

パッチツールは、ビルドバージョン、インストールされているフィックスパックやホットフィックスなど、パッチとバージョン情報を表示します。

![パッチツールには、Liferayサービスを設定するために必要な関連情報が表示されます。](./matching-dxp-versions/images/01.png)

今後のステップのために、この情報をメモしておいてください。

## Liferay Cloud リポジトリのクローンを作成します。

Liferay Cloud は、プロジェクトと一緒に [GitHub](https://github.com/) にリポジトリを提供します。 各サービスの [LCP.json ファイル](../reference/configuration-via-lcp-json.md)など、プロジェクト内のいくつかのファイルに対して設定を行うには、ローカルにリポジトリのクローンを用意する必要があります。

まだリポジトリをクローンしていない場合は、 [Git がインストールされている任意のターミナル](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) を使って、ローカルにクローンします。

```bash
git clone https://github.com/dxpcloud/acme
```

## リポジトリ内の Liferay DXP イメージを更新する

次に、以前 [クローンしたリポジトリにある Liferay DXP イメージを更新します](#clone-the-liferay-cloud-repository)。 このため、Liferayインストールのバージョン情報と互換性のあるDockerイメージを見つける必要があります。

1. Docker Hub の [Liferay DXP images](https://hub.docker.com/r/liferay/dxp/tags) ページにアクセスします。

1. *フィルタタグ* フィールドを使い、メジャーバージョンとフィックスパック番号を用いて画像のリストをフィルタリングします。 [以前に見つけた](#find-liferay-version-information) （例えば `7.2.10-dxp-5`のような形式です）。 このDockerイメージ名をコピーしてください。

    ![Filter Tagsフィールドを使用して、Liferay DXPイメージのリストをお探しのメジャーバージョンに絞り込みます。](./matching-dxp-versions/images/02.png)

    ```{tip}
    複数のDockerイメージが見つかった場合は、最新の一致するものをコピーしてください。 最新順のリストでは、最新の Liferay DXP イメージは、その名前にタイムスタンプが付加されていても、一番上にリストアップされます。
    ```

1. リポジトリで、 `liferay/gradle.properties` ファイルを開いてください。

1. `liferay.workspace.docker.image.liferay` の値を、前回コピーしたDockerイメージ名に設定します。

    例えば、Liferay DXP のイメージ名が `7.2.10-dxp-5`である場合、 `gradle.properties`でこれを設定します。

    ```
    liferay.workspace.docker.image.liferay=liferay/dxp:7.2.10-dxp-5
    ```

これにより、Liferay Cloud 環境で正しいバージョンの Liferay DXP が動作するようになり、データを正常にアップロードできるようになります。

## リポジトリ内のLiferayサービスイメージの更新

次に、リポジトリ内の Liferay サービスの `LCP.json` ファイルにある Liferay サービスのイメージを更新してください。 このため、Liferayのインストールバージョンと互換性のある最新のDockerイメージを見つける必要があります。

1. Liferay Cloud の [Services Changelog](https://help.liferay.com/hc/en-us/sections/360006251311-Services-Changelog) ページにアクセスします。

1. リストの一番上にある最新のサービス更新をクリックします。

    ![最新のサービス更新のリンクをクリックし、お使いの環境が最新のものであることを確認します。](./matching-dxp-versions/images/03.png)

1. ページに記載されている **Liferay** のサービス画像を探してください。 オンプレミスの Liferay インストールの *メジャーバージョン* に一致するイメージ名をコピーしてください。

    ![表示された Liferay サービスイメージの中から、お使いの Liferay インストールのメジャーバージョンに合うものを選びます。](./matching-dxp-versions/images/04.png)

1. リポジトリで、 `liferay/LCP.json` ファイルを開いてください。

1. `image` の項目に、以前コピーしたDockerイメージ名を設定します。

    例えば、Liferay のサービスイメージ名が `liferaycloud/liferay-dxp:7.2-4.0.4`である場合、これを `LCP.json`に設定します。

    ```
    "image": "liferaycloud/liferay-dxp:7.2-4.0.4"
    ```

これにより、Liferay サービスは、Liferay DXP のバージョンと互換性のある最新のバージョンを使用するようになります。

## Hotfixの情報を追加する

また、[オンプレミスでインストールしたパッチ](#find-liferay-version-information)のhotfix情報をCIサービスの `LCP.json` ファイルに追加する必要があります。

1. インストールされているパッチの一覧を確認するには、 `./patching-tool.sh info` コマンドを `$LIFERAY_HOME/patching-tool` フォルダから再度実行してください。
   
   ![現在インストールされているパッチの中から、最新のHotfixでLCP.jsonを更新する必要があります。](./matching-dxp-versions/images/05.png)
   
   現在インストールされているHotfix（または「パッチ」）の名前をコピーしてください。 複数のHotfix名が表示された場合は、利用可能な最新のHotfixの名前をコピーします。

1. リポジトリで、 `ci/LCP.json` ファイルを開いてください。

1. 先にコピーしたHotfix名を`LCP_CI_LIFERAY_DXP_HOTFIXES_COMMON`という新しい[環境変数](../reference/defining-environment-variables.md) で追加します。 

    ```
    "env": {
        "LCP_CI_LIFERAY_DXP_HOTFIXES_COMMON": "dxp-5-7210"
    }
    ```

```{important}
LCP_CI_LIFERAY_DXP_HOTFIXES_COMMON` で定義されたホットフィックスとその依存関係は、Jenkins ビルドプロセスの一部としてダウンロードされ、統合されます。
```

## ビルドの作成とデプロイ

さて、リポジトリのバージョン情報を更新したら、ビルドで環境にデプロイする必要があります。

### 変更した内容でJenkinsビルドを作成する

Gitがインストールされている端末でGitコマンドを実行し、変更内容を送信します。

1. 変更したファイルをGitに追加します。 

    ```bash
    git add .
    ```

1. 変更内容とメッセージを添えてコミットしてください。 

    ```bash
    git commit -m "Liferay Cloud Migration Stage 1"
    ```

1. 変更をGitHubにプッシュします。 

    ```bash
    git push origin master
    ```

プロジェクトはGitHubのリポジトリにリンクされているため、変更をプッシュすると自動的にビルドが作成されます。 ビルドが完了するのを待ってから、次に進みます。

### ビルドを選択した環境にデプロイする

最後に、 [Liferay Cloud Console](https://console.liferay.cloud/) を使って、完成したビルドを選択した環境にデプロイします。

1. Liferay Cloud Console で Builds ページに移動します（ページ上部のリンクを使用します）。

1. リストの中から前回作成したビルドを探し、「Actions」メニューから「 *Deploy build to*」をクリックします。
   
   ![ビルドのActionsメニューでデプロイします。](./matching-dxp-versions/images/06.png)

1. ビルドをデプロイする環境を選択します（例： `acme-dev`）。

1. 以下の情報を読み、確認ボックスを選択して、展開結果を確認してください。
   
   ![チェックボックスにチェックを入れ、準備ができたらビルドをデプロイしてください。](./matching-dxp-versions/images/07.png)

1. *Deploy Build*をクリックします。

ビルドは選択した環境にデプロイされ、サービス起動時に正しいバージョンが適用されます。

```{note}
デプロイメントが完了し、お客様のサービスが利用できるようになるまでには、ある程度の時間がかかります。 その環境に初めて導入する場合は、通常よりも時間がかかる場合があります。
```

## 次のステップ

これで、選択した環境に、正しい Liferay DXP のバージョン情報をすべて含むデプロイができました。 次に、 [インスタンスのデータのバックアップファイル](./creating-data-backup-files.md) を作成し、Liferay Cloud に対応させる準備をします。
