# ステージ1：DXPバージョンのマッチング

移行の第一段階として、DXP Cloud上で動作するLiferayサービスが、移行したいインストールと同じバージョンで動作するように設定します。

そのため、DXP Cloudのリポジトリをクローンし、バージョン変更の設定を行い、ビルドを展開することでDXP Cloudにその更新を戻す必要があります。

## Liferayのバージョン情報を検索する

まず、移行したい Liferay DXP インストールのバージョン番号とインストールされているパッチを探します。 DXP Cloud で Liferay サービスを適切に設定するために、これらの値が必要です。

これらの値を求めるには、パッチングツールを使用します。

1. こちらの [の指示に従い、](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/maintaining-a-liferay-installation/reference/installing-the-patching-tool.html) パッチツールを移行したいインストール先にインストールします。

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

## DXPクラウドリポジトリのクローン

DXPクラウドでは、プロジェクトと一緒に [GitHub](https://github.com/) にリポジトリを提供しています。 各サービスの [LCP.json ファイル](../reference/configuration-via-lcp-json.html) など、プロジェクト内のいくつかのファイルに設定を行うには、リポジトリのクローンをローカルに用意する必要があります。

まだリポジトリをクローンしていない場合は、 [Git がインストールされているターミナルで](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) ローカルにリポジトリをクローンしてください。

```bash
git clone https://github.com/dxpcloud/acme
```

## リポジトリ内の Liferay DXP イメージを更新する

次に、以前 [クローンした](#clone-the-dxp-cloud-repository) リポジトリ内のLiferay DXPイメージを更新します。 このため、Liferayインストールのバージョン情報と互換性のあるDockerイメージを見つける必要があります。

1. Docker Hub の [Liferay DXP images](https://hub.docker.com/r/liferay/dxp/tags) ページに移動します。

1. **フィルタータグ** フィールドを使用して、以前に見つけたメジャーバージョンとフィックスパック番号 [を使用してイメージのリストをフィルター処理し](#find-liferay-version-information) （たとえば、フォーム `7.2.10-dxp-5`）。 このDockerイメージ名をコピーしてください。

    ![Filter Tagsフィールドを使用して、Liferay DXPイメージのリストをお探しのメジャーバージョンに絞り込みます。](./matching-dxp-versions/images/02.png)

    ```{tip}
    複数のDockerイメージが見つかった場合は、最新の一致するものをコピーしてください。 最新順のリストでは、最新の Liferay DXP イメージは、その名前にタイムスタンプが付加されていても、一番上にリストアップされます。
    ```

1. リポジトリで、 `liferay/gradle.properties` ファイルを開いてください。

1. `liferay.workspace.docker.image.liferay` の値を、以前コピーしたDockerイメージ名に設定します。

    例えば、Liferay DXPのイメージ名が `7.2.10-dxp-5`である場合、これを `gradle.properties`で設定してください。

    ```
    liferay.workspace.docker.image.liferay=liferay/dxp:7.2.10-dxp-5
    ```

これにより、DXPクラウド環境で正しいバージョンのLiferay DXPが動作し、データを正常にアップロードできるようになります。

## リポジトリ内のLiferayサービスイメージの更新

次に、リポジトリ内のLiferayサービスの `LCP.json` ファイルにあるLiferayサービスのイメージを更新します。 このため、Liferayのインストールバージョンと互換性のある最新のDockerイメージを見つける必要があります。

1. DXP Cloudの [Services Changelog](https://help.liferay.com/hc/ja/sections/360006251311-Services-Changelog) のページに移動します。

1. リストの一番上にある最新のサービス更新をクリックします。

    ![最新のサービス更新のリンクをクリックし、環境が最新であることを確認します。](./matching-dxp-versions/images/03.png)

1. ページに記載されている **Liferay** サービス画像を探します。 オンプレミスのLiferayインストールの **メジャーバージョン** に一致するイメージ名をコピーしてください。

    ![表示された Liferay サービスイメージの中から、お使いの Liferay インストールのメジャーバージョンに合うものを選びます。](./matching-dxp-versions/images/04.png)

1. リポジトリで、 `liferay/LCP.json` ファイルを開いてください。

1. `image` フィールドの値を、以前コピーしたDockerイメージ名に設定します。

    たとえば、Liferayサービスイメージ名が `liferaycloud / liferay-`：7.2-4.0.4</code>の場合、これを `に設定します。
<pre><code>    "image": "liferaycloud/liferay-dxp:7.2-4.0.4"
`</pre>

これにより、あなたのLiferayサービスは、あなたのLiferay DXPのバージョンと互換性のある最新のバージョンを使用することが保証されます。

## Hotfixの情報を追加する

また、オンプレミスでインストールした [パッチのホットフィックス情報](#find-liferay-version-information) をCIサービスの `LCP.json` ファイルへ追加する必要があります。

1. インストールされているパッチのリストを確認するには、 `$LIFERAY_HOME/patching`</code> フォルダーから `コマンドを再度実行します。</p>

<p spaces-before="4"><img src="./matching-dxp-versions/images/05.png" alt="現在インストールされているパッチの中から、最新のHotfixでLCP.jsonを更新する必要があります。" /></p>

<p spaces-before="4">現在インストールされているHotfix（または「パッチ」）の名前をコピーしてください。 複数のHotfix名が表示された場合は、利用可能な最新のHotfixの名前をコピーします。</p></li>
<li><p spaces-before="0">リポジトリで、 <code>ci/LCP.json` ファイルを開いてください。

1. 先にコピーしたHotfix名を新しい [環境変数として追加します](../reference/defining-environment-variables.md) 名前 `LCP_CI_LIFERAY_DXP_HOTFIXES_COMMON`:

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
    git commit -m "DXP Cloud Migration Stage 1"
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

    ![ビルドのActionsメニューでデプロイします。](./matching-dxp-versions/images/06.png)

1. ビルドをデプロイする環境を選択します（例： `acme-dev`）。

1. 以下の情報を読み、確認ボックスを選択して、展開結果を確認します。

    ![チェックボックスにチェックを入れ、準備ができたらビルドをデプロイしてください。](./matching-dxp-versions/images/07.png)

1. **Deploy Build** をクリックします。

ビルドは選択した環境にデプロイされ、サービス起動時に正しいバージョンが適用されます。

```{note}
デプロイメントが完了し、お客様のサービスが利用できるようになるまでには、ある程度の時間がかかります。 その環境に初めて導入する場合は、通常よりも時間がかかる場合があります。
```

## 次のステップ

これで、選択した環境に、正しい Liferay DXP のバージョン情報をすべて含むデプロイができました。 次に、 [インスタンスのデータのバックアップファイル](./creating-data-backup-files.md) を作成し、DXP Cloud に対応させる準備をします。