# コンテナのライフサイクルとAPI

高レベルでは、コンテナはLiferayがデプロイされた状態でTomcatを開始します。 ただし、さらに、コンテナエントリーポイントは、以下のユースケースを実行するためのAPIを提供します。

* スクリプトの呼び出し
* TomcatおよびLiferayの設定
* アーティファクトのデプロイ
* パッチのインストール
* パッチツールの更新

コンテナは、これらのユースケースをトリガーおよび構成するためのAPIを提供します。 ライフサイクルのさまざまなフェーズでユースケースを実行します。

## ライフサイクル

環境でコンテナを作成した後、コンテナエントリーポイントはその環境で次のライフサイクルフェーズを実行します。

1. **事前設定：** TomcatおよびLiferayを設定する前に、[ユーザー提供のスクリプトを実行します](./running-scripts-in-containers.md)。
1. **設定：** TomcatでDXPを実行する準備をします。
    1. [TomcatのJavaランタイム環境の設定](./configuring-containers.md#jvm-options) 。
    1. [ユーザが提供したファイル](./configuring-containers.md) を [Liferay Home](../../reference/liferay-home.md) にコピー。
    1. [ユーザー提供のスクリプトの実行](./running-scripts-in-containers.md)。
    1. [ユーザー提供のアーティファクトのデプロイ](./installing-apps-and-other-artifacts-to-containers.md)。
    1. [パッチツール](./patching-dxp-in-docker.md#updating-the-patching-tool) をユーザー指定のバージョンで更新。
    1. [ユーザー提供のパッチをインストール](./patching-dxp-in-docker.md)。
1. **起動前：** Tomcatを起動する前に、[ユーザー提供のスクリプトを実行します](./running-scripts-in-containers.md)。
1. **Tomcat起動：** Catalinaスクリプトを使用してTomcatを起動します。
1. **シャットダウン後：** Tomcatの停止後に[ユーザー提供のスクリプトを実行します](./running-scripts-in-containers.md)。

## API

コンテナエントリポイントは、次のコンテナフォルダでファイルをスキャンし、それらのファイルを使用して、コンテナ、Tomcat、Liferayを設定し、Liferayで動作します。

* `/mnt/liferay`
* `/user/local/liferay/scripts`

```{note}
[バインドマウント](https://docs.docker.com/storage/bind-mounts/) 、 [volumes](https://docs.docker.com/storage/volumes/) 、`docker cp`など、さまざまな方法でこれらのコンテナフォルダにファイルを渡すことができます。 詳しくは [コンテナへのファイルの提供](./providing-files-to-the-container.md) をご覧ください。
```

上記の主要なフォルダには、特定のアクション用に指定されたサブフォルダがあります。 次のセクションでは、サブフォルダ、それらのファイルで実行されるアクション、および関連するユースケースをライフサイクルの段階順に記述します。

次のライフサイクルの段階は、ユーザーが提供したファイルに作用します。

* [事前設定段階のAPI](#pre-configure-phase-api)
* [設定段階のAPI](#configure-phase-api)
* [起動前段階のAPI](#pre-startup-phase-api)
* [シャットダウン後段階のAPI](#post-shutdown-phase-api)

### 事前設定段階のAPI

| ファイルのロケーション                                | 操作                  | ユースケース                                               |
|:------------------------------------------ |:------------------- |:---------------------------------------------------- |
| `/usr/local/liferay/scripts/pre-configure` | スクリプトをアルファベット順に実行する | 設定段階前の[スクリプトの実行](./running-scripts-in-containers.md) |

### 設定段階のAPI

| ファイルのロケーション             | 操作                                                                                                                                                                                                                                                                                                | ユースケース                                                                                                         |
|:----------------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |:-------------------------------------------------------------------------------------------------------------- |
| `/mnt/liferay/files`    | Liferay Home (`/opt/liferay` ) の下にあるフォルダにファイルをコピーする                                                                                                                                                                                                                                               | [コンテナの設定](./configuring-containers.md)<br><br> [Tomcatの設定](./configuring-containers.md#jvm-options) |
| `/mnt/liferay/scripts`  | スクリプトをアルファベット順に実行する                                                                                                                                                                                                                                                                               | 構成中に[スクリプトを実行](./running-scripts-in-containers.md)                                                             |
| `/mnt/liferay/deploy`   | Liferay起動時にアーティファクトを自動展開するために、 `/mnt/liferay/deploy` を `/opt/ liferay/deploy` にシンボリックリンクします。<br><br>実行時、`/mnt/liferay/deploy`、 `/opt/liferay/deploy`、またはいずれかのフォルダに取り付けられたフォルダにコピーされたアーティファクトを自動デプロイします。<br><br>注：自動デプロイされたアーティファクトは、 `/opt/liferay/osgi`下の適切なフォルダに移動されます。 | [アプリやその他のアーティファクトをコンテナにインストールする](./installing-apps-and-other-artifacts-to-containers.md)                       |
| `/mnt/liferay/patching` | パッチツールが提供されている場合は、それをインストールします。 提供されているパッチをインストールします。                                                                                                                                                                                                                                             | [DockerでDXPにパッチを適用する](./patching-dxp-in-docker.md)                                                             |

### 起動前段階のAPI

| ファイルのロケーション                              | 操作                  | ユースケース                                                      |
|:---------------------------------------- |:------------------- |:----------------------------------------------------------- |
| `/usr/local/liferay/scripts/pre-startup` | スクリプトをアルファベット順に実行する | Tomcatを開始する前に[スクリプトを実行](./running-scripts-in-containers.md) |

### シャットダウン後段階のAPI

| ファイルのロケーション                                | 操作                  | ユースケース                                                           |
|:------------------------------------------ |:------------------- |:---------------------------------------------------------------- |
| `/usr/local/liferay/scripts/post-shutdown` | スクリプトをアルファベット順に実行する | Tomcatをシャットダウンした後の[スクリプトの実行](./running-scripts-in-containers.md) |

## 次のステップ

コンテナのライフサイクルとAPIについて学習できました。これで、[コンテナにファイルを提供する](./providing-files-to-the-container.md)最良の方法を決定できます。 また、上記の表に記載されているユースケースの実行を開始することもできます。 ここに記載されているユースケースは参考用です。

* [コンテナの設定](./configuring-containers.md)
* [コンテナへのアプリやその他のアーティファクトのインストール](./installing-apps-and-other-artifacts-to-containers.md)
* [DockerでDXPにパッチを適用する](./patching-dxp-in-docker.md)