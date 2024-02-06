# Liferayサービスへのデプロイ

他のサービスと同様に、カスタム追加のデプロイには、設定やファイルをGitリポジトリの適切な場所に追加する必要があります。 しかし、Liferayサービスのデプロイは、他のサービスのデプロイとは若干異なります。

Liferayサービスは、 [Liferay Workspaceの概要](https://learn.liferay.com/dxp/latest/ja/building-applications/tooling/liferay-workspace/what-is-liferay-workspace.html) を利用し、 [配置可能なファイル](#deploying-themes-portlets-and-osgi-modules) 、 [ソースコード](#building-and-deploying-source-code) などを追加するオプションを提供します。 これらは [CIビルド](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md) に簡単に含まれますが、 [CLIツール](../reference/command-line-tool.md) を使っている場合は、Liferayサービス専用の [追加ステップ](#cli-tool-deployment) がいくつか必要になります。

## Liferay DXP Dockerイメージの定義

Liferayサービスイメージ（他のサービスと同様に`LCP.json`ファイルで定義）はLiferay DXP Dockerイメージとは異なります。 Liferay DXP Dockerイメージは、Liferayサービスで動作するLiferayの正確なバージョン（フィックスパックを含む）を決めます。 これはリポジトリの`liferay/gradle.properties`ファイルの`liferay.workspace.docker.image.liferay`プロパティで定義します。

[Liferay DXP Docker tags](https://hub.docker.com/r/liferay/dxp/tags) をチェックして、お使いのDXPのバージョンに合ったイメージを見つけてください。

```{important}
Liferay サービスの `LCP.json` ファイルの `image` プロパティで定義されている DXP のメジャーバージョン番号は、`liferay/gradle.properties` の `liferay.workspace.docker.image.liferay` プロパティで定義されているメジャーバージョンと **一致** する必要があります。この2つが異なる場合、デプロイ後に Liferay サービスが起動しないことがあります。
```

## CLIツールの展開

[デプロイ可能なファイル](#deploying-themes-portlets-and-osgi-modules) 、 [ビルドされたソースコード](#building-and-deploying-source-code) 、 [ホットフィックス](#deploying-hotfixes) 、 [ライセンス](#deploying-licenses) を [CLIツール](../reference/command-line-tool.md) を使って追加するには、デプロイ前に生成される特別な `Dockerfile` イメージに含める必要があります。 [CIサービス](../platform-services/continuous-integration.md) を介してビルドをデプロイする場合、これらの余分な手順は必要ない。

CLI を使って普通に Liferay サービスをデプロイした場合（すべてのサービスを一度にデプロイした場合、または `liferay/` ディレクトリからデプロイした場合）、あなたのカスタマイズを含まない **デフォルトバージョン** の Liferay DXP イメージ（`LCP.json` で定義されたメジャーバージョンを使用）がデプロイされます。 これは、カスタマイゼーションしたものをサービスに含めるためには、そのサービスを具体的に構築してデプロイする必要があるからです。

以下の手順で、カスタマイゼーションを含んだLiferayサービスをデプロイします：

1. `liferay/`ディレクトリのコマンドラインから実行する：

   ```bash
   ./gradlew clean createDockerfile deploy
   ```

   これですべてのカスタマイズがビルドされ、`build/liferay/` サブフォルダに配置されます。 また、DXPのカスタマイズバージョン専用の`Dockerfile`も追加されている。

1. `LCP.json`ファイルを新しく生成した`build/docker/`サブフォルダにコピーする。

1. このサブフォルダから通常通り `lcp deploy` コマンドを実行する。

これにより、デフォルトバージョンではなく、カスタマイズされたサービスがデプロイされます。

## テーマ、ポートレット、およびOSGiモジュールのデプロイ

テーマ、ポートレット、OSGi モジュールをインストールするには、Liferay DXP サービスディレクトリの `configs/{ENV}/deploy/` フォルダに WAR または JAR ファイルを含めます。

例えば、カスタムJARファイルを開発環境にデプロイする場合（`dev/`環境フォルダを使用）、Liferay DXPサービスディレクトリは次のようになります：

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

デプロイされると、`configs/{ENV}/deploy/`ディレクトリ内のファイルはLiferayサービスのコンテナ内の`$LIFERAY_HOME/deploy/`フォルダにコピーされます。

```{note}
イメージのデプロイ時には、特定のファイルや設定が強制的に存在するため、追加したファイルが上書きされることがあります。 サービスのログで `DXPCloud Liferay Overrides` というメッセージを探し、ファイルが上書きされたことを特定します。
```

## ソースコードのビルドとデプロイ

新しい追加のソースコードをCIビルドに含めることもできます。 ビルドが開始されると、ソースコードが自動的にコンパイルされる。

CIビルドは、これらのフォルダ内のソースコードをコンパイルする：

* 新しいモジュールのための `liferay/modules` フォルダ
* カスタムテーマ用の `liferay/themes` フォルダ
* 分解された WAR のための `liferay/wars` フォルダ

デプロイされると、デプロイ可能な `.jar` または `.war` ファイルは Liferay サービスのコンテナ内の `$LIFERAY_HOME/deploy/` フォルダにコピーされます。 これは、CIのビルドがコードをコンパイルする場合と、デプロイ前に利用可能な [Gradleコマンド](#cli-tool-deployment) を使用して自分でコードを生成する場合のどちらでも発生します。

## Hotfixのデプロイについて

Hotfixを適用するには、Liferay DXPサービスディレクトリ内の`configs/{ENV}/patching/`フォルダにHotfix ZIPファイルを追加します。 この変更を展開すると、ホットフィックスがLiferay DXPインスタンスに適用されます。

```{note}
 [DXP インスタンスを新しいマイナーバージョンにアップデートする](./updating-your-dxp-instance-to-a-new-minor-version.md) を参照して、Liferay DXP の新しいマイナーバージョンにアップデートしてください（新しい [パッチタイプについて](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier/understanding-patch-types-for-dxp-7-3-and-earlier.html#service-packs) など）。
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

なお、ホットフィックスはサーバーを起動するたびに再適用する必要があります。 このため、長期的にはこのフォルダにHotfixを追加するよりも、`LCP.json`ファイルにあるLiferay DXP Dockerイメージの最新のFix PackやService Packに更新する方が良いでしょう。このファイル（`liferay/`ディレクトリ）の`image`環境変数を置き換えることで、Dockerのバージョンを更新することができます。

### 環境変数によるパッチ適用

ホットフィックスをGitリポジトリに直接コミットするのではなく、CIのビルドプロセスの一部としてインストールすることもできます。 この方法は、リポジトリに大きなファイルを残さないようにできるため、大規模なホットフィックスの場合に最適です。

環境変数 `LCP_CI_LIFERAY_DXP_HOTFIXES_{ENV}` にホットフィックスを追加し（Liferay Cloud コンソールの `Environment Variables` タブ、または `ci` サービスの `LCP.json` ファイル）、CI サービスがビルドプロセス中に自動的に適用するようにします。 複数のバグ修正が必要な場合は、1つのHotfixにまとめるようサポートに依頼してください。

```{note}
この環境変数を `ci` サービスの `LCP.json` に追加すると、`ci` サービスを **infra 環境** にデプロイしてアップデートを完了する必要があります。
```

`LCP.json`ファイルにホットフィックスを定義する例を以下に示す：

```
"env": {
    "LCP_CI_LIFERAY_DXP_HOTFIXES_COMMON": "liferay-hotfix-17-7210",
    "LCP_CI_LIFERAY_DXP_HOTFIXES_DEV": "liferay-hotfix-33-7210"
}
```

```{note}
この環境変数は、少なくともバージョン4.x.xのサービスにアップグレードしている場合にのみ利用できます。 バージョンの確認方法については、 [サービススタックのバージョンについて](../reference/understanding-service-stack-versions.md) 。
```

## ライセンスのデプロイ

Liferay DXP サービスディレクトリ内の `configs/{ENV}/deploy/` フォルダにライセンスを追加することができます。

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

舞台裏では、XMLライセンスは`$LIFERAY_HOME/deploy`にコピーされ、AATFライセンスは`$LIFERAY_HOME/data`にコピーされる。

## 関連トピック

* [Liferay DXP Service の使用](../customizing-liferay-dxp-in-the-cloud.md)
* [Liferay DXPサービスの設定](./configuring-the-liferay-dxp-service.md)
* [Liferay クラウド展開ワークフローの概要](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md)
* [CLIツール](../reference/command-line-tool.md)
