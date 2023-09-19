# Liferayサービスへのデプロイ

他のサービスと同様に、カスタム追加のデプロイには、設定やファイルをGitリポジトリの適切な場所に追加する必要があります。 しかし、Liferayサービスのデプロイは、他のサービスのデプロイとは若干異なります。

Liferayサービスは、 [Liferayワークスペース](https://learn.liferay.com/dxp/latest/en/building-applications/tooling/liferay-workspace/what-is-liferay-workspace.html) を利用し、 [配置可能なファイル](#deploying-themes-portlets-and-osgi-modules)、 [ソースコード](#building-and-deploying-source-code)などを追加するオプションを提供します。 これらは [CI ビルド](../build-and-deploy/overview-of-the-liferay-cloud-deployment-workflow.md)に簡単に含められますが、 [CLI ツール](../reference/command-line-tool.md)を使っている場合は、Liferay サービス専用の [追加ステップ](#cli-tool-deployment) がいくつか必要です。

## Liferay DXP Dockerイメージの定義

Liferayサービスイメージ（他のサービスと同様に `LCP.json` ファイルで定義されています）は、Liferay DXP Dockerイメージと同じではありません。 Liferay DXP Dockerイメージは、Liferayサービスで動作するLiferayの正確なバージョン（フィックスパックを含む）を決めます。 これは、`liferay.workspace.docker.image.liferay` プロパティと一緒にリポジトリの `liferay/gradle.properties` ファイルで定義されています。

[Liferay DXP Docker tags](https://hub.docker.com/r/liferay/dxp/tags) をチェックして、お使いのDXPのバージョンに合ったイメージを見つけてください。

```{important}
Liferayサービスの`LCP.json`ファイルの`image`プロパティで定義されたDXPのメジャーバージョン番号は、`liferay/gradle.properties`の`liferay.workspace.docker.image.liferay`プロパティのメジャーバージョンに**一致していなければなりません**。 2つが異なる場合、Liferayサービスはデプロイ後に起動に失敗する可能性があります。
```

## CLIツールの展開

[CLIツール](../reference/command-line-tool.md) を使用してデプロイする場合、カスタマイズや設定を考慮してデプロイするために追加の手順が必要です。 これらは、デプロイする前に生成される特別な `Dockerfile` イメージに含まれている必要があります。

[デプロイ可能なファイル](#deploying-themes-portlets-and-osgi-modules)、 [ビルドされたソースコード](#building-and-deploying-source-code)、 [ホットフィックス](#deploying-hotfixes)、および [ライセンス](#deploying-licenses) は、CLIツールを使用している場合、デプロイに含めるための追加手順が必要です。 これらの追加手順は、 [CIサービス](../platform-services/continuous-integration.md) を使用してリポジトリからビルドを生成する場合には必要ありません。

通常通りCLIでLiferayサービスをデプロイした場合（全てのサービスを一度にデプロイした場合や、 `liferay/` ディレクトリからデプロイした場合）、Liferay DXPイメージの **デフォルトバージョン** （ `LCP.json`で定義されているメジャーバージョンを使用）がデプロイされますが、その中にはお客様のカスタマイゼーションは含まれていません。 これは、カスタマイゼーションしたものをサービスに含めるためには、そのサービスを具体的に構築してデプロイする必要があるからです。

以下の手順で、カスタマイゼーションを含んだLiferayサービスをデプロイします：

1. `liferay/` ディレクトリのコマンドラインから、以下を実行します：

   ```bash
   gw clean createDockerfile deploy
   ```

  これにより、カスタマイズしたものをすべてビルドし、 `build/liferay/` サブフォルダに配置します。 また、DXPのカスタマイズバージョン専用の `Dockerfile` を追加します。

1. 新しく生成した`build/docker/`サブフォルダに`LCP.json`ファイルをコピーします。

1. このサブフォルダから通常通り `lcp deploy` コマンドを実行します。

これにより、デフォルトバージョンではなく、カスタマイズされたサービスがデプロイされます。

## テーマ、ポートレット、およびOSGiモジュールのデプロイ

テーマ、ポートレット、またはOSGiモジュールをインストールするには、Liferay DXPサービスディレクトリ内の `configs/{ENV}/deploy/` フォルダにWARまたはJARファイルを含めます。

例えば、カスタムJARファイルを開発環境（ `dev/` 環境フォルダを使用）にデプロイする場合、Liferay DXPのサービスディレクトリは以下のようになります：

```
liferay
  ├── LCP.json
  └── configs
      └── dev
          ├── deploy
          │   └── com.liferay.apio.samples.portlet-1.0.0.jar
          ├── osgi
          ├── patching
          ├── scripts
          └── portal-ext.properties
```

デプロイされると、 `configs/{ENV}/deploy/` ディレクトリ内のファイルは、Liferayサービスのコンテナ内の `$LIFERAY_HOME/deploy/` フォルダにコピーされます。

```{note}
イメージのデプロイ時には、特定のファイルや設定が強制的に存在するため、追加したファイルが上書きされることがあります。 サービスのログで `DXPCloud Liferay Overrides` というメッセージを探し、ファイルが上書きされたことを特定します。
```

## ソースコードのビルドとデプロイ

新しい追加のソースコードをCIビルドに含めることもできます。 ビルドが開始されると、ソースコードが自動的にコンパイルされます。

CIビルドは、これらのフォルダー内のソースコードをコンパイルします：

* 新モジュール用の `liferay/modules` フォルダ
* カスタムテーマ用の `liferay/themes` フォルダ
* デプロイされたWARの `liferay/wars` フォルダ

デプロイしたら、デプロイ可能な `.jar` または `.war` ファイルはLiferayサービスのコンテナ内の`$LIFERAY_HOME/デプロイ/`フォルダにコピーされます。 これは、CIのビルドがコードをコンパイルする場合と、デプロイ前に利用可能な [Gradleコマンド](#cli-tool-deployment) を使用して自分でコードを生成する場合のどちらでも発生します。

## Hotfixのデプロイについて

ホットフィックスを適用するには、ホットフィックスのZIPファイルをLiferay DXPサービスディレクトリ内の `configs/{ENV}/patching/` フォルダに追加します。 この変更を展開すると、ホットフィックスがLiferay DXPインスタンスに適用されます。

```{note}
[これらの指示](./updating-your-dxp-instance-to-a-new-minor-version.md)を参照して、代わりにLiferay DXPの新しいマイナーバージョンにアップデートしてください（新しい[サービスパック](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier/understanding-patch-types-for-dxp-7-3-and-earlier.html#service-packs)など）。
```

たとえば、次のような構造を持つホットフィックスを開発環境にデプロイできます：

```
liferay
  ├── LCP.json
  └── configs
      └── dev
          ├── deploy
          ├── osgi
          ├── patching
          │   └── liferay-hotfix-2-7110.zip
          └── scripts
```

なお、ホットフィックスはサーバーを起動するたびに再適用する必要があります。 このため、 `LCP.json` ファイルにある Liferay DXP Dockerイメージの最新のフィックスパックまたはサービスパックに更新する方が、長期的にはこのフォルダにホットフィックスを追加するより良いでしょう。このファイルの `image` 環境変数を置き換えることでDockerバージョンを更新できます ( `liferay/` ディレクトリにあります) 。

### 環境変数によるパッチ適用

ホットフィックスをGitリポジトリに直接コミットするのではなく、CIのビルドプロセスの一部としてインストールすることもできます。 この方法は、リポジトリに大きなファイルを残さないようにできるため、大規模なホットフィックスの場合に最適です。

`LCP_CI_LIFERAY_DXP_HOTFIXES_{ENV}` 環境変数（Liferay Cloud コンソールの `環境変数` タブ、または `ci` サービスの `LCP.json` ファイル）にカンマ区切りでホットフィックスのリストを追加し、CI サービスがビルドプロセス中に自動的にそれを適用できるようにします。

```{note}
この環境変数を`ci` サービスの `LCP.json` に追加した場合、アップデートを完了するには `ci` サービスを **infra 環境** にデプロイする必要があります。
```

次の例では、 `LCP.json` ファイルに通してホットフィックスを定義しています：

```
"env": {
    "LCP_CI_LIFERAY_DXP_HOTFIXES_COMMON": "liferay-hotfix-10-7210,liferay-hotfix-17-7210",
    "LCP_CI_LIFERAY_DXP_HOTFIXES_DEV": "liferay-hotfix-15-7210,liferay-hotfix-33-7210",
}
```

```{note}
この環境変数は、少なくともバージョン4.x.xのサービスにアップグレードしている場合にのみ利用できます。 バージョン確認の詳細については、[サービススタックのバージョンについて](../reference/understanding-service-stack-versions.md) を参照してください。
```

## ライセンスのデプロイ

独自のライセンスは、Liferay DXPサービスディレクトリ内の `configs/{ENV}/deploy/` フォルダに入れることで追加できます。

例えば、Liferay DXPサービスディレクトリに次のような構造でライセンスを開発環境に追加できます：

```
liferay
  ├── LCP.json
  └── configs
      └── dev
          ├── deploy
          │   ├── license.xml
          │   └── license.aatf
          ├── osgi
          ├── patching
          └── scripts
```

バックグラウンドで、XMLライセンスは `$LIFERAY_HOME/ deploy`にコピーされ、AATFライセンスは `$LIFERAY_HOME/ data`コピーされます。

## 関連トピック

* [Liferay DXPサービスの使用](../using-the-liferay-dxp-service.md)
* [Liferay DXPサービスの設定　](./configuring-the-liferay-dxp-service.md)
* [Liferay Cloud 導入ワークフローの概要](../build-and-deploy/overview-of-the-liferay-cloud-deployment-workflow.md)
* [CLIツール](../reference/command-line-tool.md)
