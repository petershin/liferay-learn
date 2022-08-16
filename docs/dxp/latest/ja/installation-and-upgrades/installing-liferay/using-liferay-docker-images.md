---
toc:
- ./using-liferay-docker-images/container-lifecycle-and-api.md
- ./using-liferay-docker-images/configuring-containers.md
- ./using-liferay-docker-images/installing-apps-and-other-artifacts-to-containers.md
- ./using-liferay-docker-images/licensing-dxp-in-docker.md
- ./using-liferay-docker-images/patching-dxp-in-docker.md
- ./using-liferay-docker-images/running-scripts-in-containers.md
- ./using-liferay-docker-images/providing-files-to-the-container.md
- ./using-liferay-docker-images/upgrading-to-a-new-docker-image.md
---

# Liferay Dockerイメージの使用

```{toctree}
:maxdepth: 3

using-liferay-docker-images/container-lifecycle-and-api.md
using-liferay-docker-images/configuring-containers.md
using-liferay-docker-images/installing-apps-and-other-artifacts-to-containers.md
using-liferay-docker-images/licensing-dxp-in-docker.md
using-liferay-docker-images/patching-dxp-in-docker.md
using-liferay-docker-images/running-scripts-in-containers.md
using-liferay-docker-images/providing-files-to-the-container.md
using-liferay-docker-images/upgrading-to-a-new-docker-image.md
```

Docker Hubは、Linux上のTomcatにバンドルされた [Liferay DXP](https://hub.docker.com/r/liferay/dxp) と [Liferay Portal](https://hub.docker.com/r/liferay/portal) Docker イメージをホストしています。 Liferay Docker Hubページには、さまざまなリリースのイメージの詳細とタグが表示されます。

* [Liferay DXPイメージ](https://hub.docker.com/r/liferay/dxp)
* [Liferay Portalイメージ](https://hub.docker.com/r/liferay/portal)

これらのコンテナは、標準のDockerコンテナであり、そのまま起動および停止できます。 次の例では、 [Docker CLI（`docker`）](https://docs.docker.com/engine/reference/commandline/docker/) を使用していますが、任意のDockerコンテナツールを使用できます。

## コンテナを初めて起動する

コンテナはポート `8080`でリッスンし、すべてのDockerコンテナと同様に開始します。

1. [ホストポート（例： `8080`）をコンテナの `8080` ポートにマップするコンテナ](https://docs.docker.com/engine/reference/commandline/run/) を実行します。

    ```bash
    docker run -it -m 8g -p 8080:8080 [$LIFERAY_LEARN_PORTAL_DOCKER_IMAGE$]
    ```

    コンテナが実行され、次のTomcat起動完了メッセージを含むログメッセージが出力されます。

    ```
    INFO [main] org.apache.catalina.startup.Catalina.start Server startup in [xx,xxx] milliseconds
    ```

    ```{note}
    メモリ、CPU、およびその他のDockerコンテナリソースは構成可能です。 上記の `-m 8g`コマンド引数は、コンテナのメモリ制限を8ギガバイトに設定します。 詳細については、 [Dockerランタイムオプション](https://docs.docker.com/config/containers/resource_constraints/) を参照してください。
    ```

1. メールアドレス（**test@liferay.com**）とパスワード（**test**）を使って、`<http://localhost:8080>`でLiferayにサインインします。 プロンプトが表示されたら、パスワードを変更します。

    ![こちらはLiferayのランディングページです。](./using-liferay-docker-images/images/01.png)

Liferayを使用する準備が整いました。

```{note}
`docker container ls`は、IDと名前を含む、実行中の各コンテナを一覧表示します。 `docker container ls -a`は、実行されていないコンテナを含む、すべてのコンテナを一覧表示します。
```

## ログの表示

Liferayログメッセージとログファイルは、ライブで表示したり、ホストにコピーしたりできます。

### `Dockerログ` コマンド

[`docker logs`](https://docs.docker.com/engine/reference/commandline/logs/) コマンドは、コンテナログメッセージを出力します。

| コマンド                         | 結果                                         |
|:---------------------------- |:------------------------------------------ |
| `docker logs [container]`    | 現在のすべてのログメッセージを出力します                       |
| `docker logs -f [container]` | `tail -f ［file］` のように、新しいログメッセージをストリーミングする |
| `docker logs -t [container]` | 各ログメッセージにタイムスタンプを追加します                     |

### `docker cp` コマンド

以下のような [`docker cp`](https://docs.docker.com/engine/reference/commandline/cp/) コマンドを使用して、ホストマシンにログファイルをコピーできます。

```bash
docker cp [container]:/opt/liferay/logs/liferay.[timestamp].log .
```

## コンテナの停止

コンテナを停止するには、2つの方法があります。

| メソッド                                                                                                                                                                                                      | 長所                                                                                                                                                                        | 短所                                                                                                                                                                                                  |
|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `docker exec [container] /opt/liferay/tomcat/bin/shutdown.sh`                                                                                                                                             | Liferay、Tomcat、およびその他のアプリがリソースを解放できるようにします。 コンテナエントリポイントは、 [シャットダウン後のスクリプト](./using-liferay-docker-images/container-lifecycle-and-api.md#post-shutdown-phase-api) を実行します。 |                                                                                                                                                                                                     |
| `i `引数を指定して実行しているターミナルセッションで `Ctrl-C` を実行します。<br><br>注意：これは SIGINT または [`SIGKILL` シグナルをアタッチされたコンテナに送信します。](https://docs.docker.com/engine/reference/commandline/attach/#extended-description) | コンテナを停止する最速の方法。                                                                                                                                                           | Liferay、Tomcat、およびコンテナエントリポイントは、リソースを解放せずにすぐに停止します。 エントリポイントの [シャットダウン後フェーズ](./using-liferay-docker-images/container-lifecycle-and-api.md#post-shutdown-phase-api) はスキップされます。 本番環境ではこの方法を使用しないでください |

## コンテナの再起動

コンテナは、すべてのDockerコンテナと同様に再起動できます。

```bash
docker start [container]
```

```{warning}
コンテナが再起動すると、そのエントリーポイントが再度実行されます [Container Lifecycle and API](./using-liferay-docker-images/container-lifecycle-and-api.md#lifecycle) を参照してください）。 エントリーポイントを介して[実行しているスクリプト](./using-liferay-docker-images/running-scripts-in-containers.md)が安全に再実行できることを確認してください。
```

```{tip}
`docker container ls -a`を実行して、コンテナの名前またはIDを検索します。
```

これで、Liferayコンテナの開始、停止、監視の基本を理解できました。

## 次のステップ

コンテナのエントリーポイントが何をするのか知りたい、コンテナのAPIを知りたい場合は、 [コンテナのライフサイクルとAPI](./using-liferay-docker-images/container-lifecycle-and-api.md) を参照してください。 コンテナの使用を開始する場合は、次のいずれかの使用例を実行してください。

* [コンテナの設定](./using-liferay-docker-images/configuring-containers.md)
* [コンテナへのアプリやその他のアーティファクトのインストール](./using-liferay-docker-images/installing-apps-and-other-artifacts-to-containers.md)
* [DockerでDXPにパッチを適用する](./using-liferay-docker-images/patching-dxp-in-docker.md)
* [コンテナへのファイルの提供](./using-liferay-docker-images/providing-files-to-the-container.md)
* [新しいDockerイメージへのアップグレード](./using-liferay-docker-images/upgrading-to-a-new-docker-image.md)