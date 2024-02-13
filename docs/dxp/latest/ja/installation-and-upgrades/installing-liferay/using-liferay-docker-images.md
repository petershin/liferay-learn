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
  - ./using-liferay-docker-images/docker-image-versions.md
---
# Liferay Dockerイメージの使用

Docker Hubは、Linux上のTomcatにバンドルされた [Liferay DXP](https://hub.docker.com/r/liferay/dxp) と [Liferay Portal](https://hub.docker.com/r/liferay/portal) Docker イメージをホストしています。 Liferay Docker Hubページには、さまざまなリリースのイメージの詳細とタグが表示されます。

* [Liferay DXP Images](https://hub.docker.com/r/liferay/dxp) 
* [Liferay ポータル画像](https://hub.docker.com/r/liferay/portal) 

これらのコンテナは、標準のDockerコンテナであり、そのまま起動および停止できます。 以下の例では、 [Docker CLI (`docker`)](https://docs.docker.com/engine/reference/commandline/docker/) を使用しているが、好きなDockerコンテナ・ツールを使用することができる。

## コンテナを初めて起動する

コンテナはポート`8080`をリッスンし、他のDockerコンテナと同様に起動する。

1. [ホストのポート（例えば、`8080`）をコンテナの `8080` ポートにマップするコンテナ](https://docs.docker.com/engine/reference/commandline/run/) を実行する。

   ```bash
   docker run -it -m 8g -p 8080:8080 [$LIFERAY_LEARN_PORTAL_DOCKER_IMAGE$]
   ```

   コンテナが実行され、次のTomcat起動完了メッセージを含むログメッセージが出力されます。

   ```
   INFO [main] org.apache.catalina.startup.Catalina.start Server startup in [xx,xxx] milliseconds
   ```

    ```{note}
    メモリ、CPU、およびその他のDockerコンテナリソースは構成可能です。 上記の `-m 8g`コマンド引数は、コンテナのメモリ制限を8ギガバイトに設定します。 詳細は [Dockerランタイム・オプション](https://docs.docker.com/config/containers/resource_constraints/) を参照。
    ```

1. **test@liferay.com** というメールアドレスと **test** というパスワードを使って、`<http://localhost:8080>` から Liferay にサインインしてください。

1. プロンプトが表示されたら、パスワードを変更し（**learn** など）、 **Save** をクリックします。

   ![Change your password upon first login.](./using-liferay-docker-images/images/01.png)

```{warning}
本番環境では、デフォルトの管理者アカウントを使うべきではありません。 その代わりに、 [、あなたのビジネスに特化した管理者アカウント](../../getting-started/introduction-to-the-admin-account.md#creating-a-new-admin-user) 。 
```

Liferayを使用する準備が整いました。

```{note}
`docker container ls`は、IDと名前を含む、実行中の各コンテナを一覧表示します。 `docker container ls -a`は、実行されていないコンテナを含む、すべてのコンテナを一覧表示します。
```

## ログの表示

Liferayログメッセージとログファイルは、ライブで表示したり、ホストにコピーしたりできます。

### dockerログ`コマンド

[`docker logs`](https://docs.docker.com/engine/reference/commandline/logs/) コマンドはコンテナのログメッセージを表示する。

| コマンド                         | 結果                                           |
| :--------------------------- | :------------------------------------------- |
| `docker logs [container]`    | 現在のすべてのログメッセージを出力します                         |
| `docker logs -f [container]` | `tail -f [file]` が行うように、新しいログメッセージをストリームする。 |
| `docker logs -t [container]` | 各ログメッセージにタイムスタンプを追加します                       |

### docker cp` コマンド

[`docker cp`](https://docs.docker.com/engine/reference/commandline/cp/) 以下のようなコマンドを使って、ログファイルをホストマシンにコピーすることができる。

```bash
docker cp [container]:/opt/liferay/logs/liferay.[timestamp].log .
```

## コンテナの停止

コンテナを停止するには、2つの方法があります。

| メソッド                                                                                                                                                                                         | メリット                                                                                   | デメリット                                                                                                                                                                                                          |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `docker exec [container] /opt/liferay/tomcat/bin/shutdown.sh`                                  | Liferay、Tomcat、およびその他のアプリがリソースを解放できるようにします。 コンテナのエントリーポイントは、 [シャットダウン後のスクリプト](./using-liferay-docker-images/container-lifecycle-and-api.md#post-shutdown-phase-api) を実行する。 |                                                                                                                                                                                                                |
| `i`引数を指定して実行しているターミナルセッションで`Ctrl-C` を押す。<br><br> [`SIGINT`または`SIGKILL` シグナルをアタッチされているコンテナ](https://docs.docker.com/engine/reference/commandline/attach/#extended-description) に送る。 | コンテナを停止する最速の方法。                                                                        | Liferay、Tomcat、およびコンテナエントリポイントは、リソースを解放せずにすぐに停止します。 エントリポイントの [シャットダウン後フェーズ](./using-liferay-docker-images/container-lifecycle-and-api.md#post-shutdown-phase-api) はスキップされます。 本番環境ではこの方法を使用しないでください |

## コンテナの再起動

コンテナは、すべてのDockerコンテナと同様に再起動できます。

```bash
docker start [container]
```

```{warning}
コンテナが再起動されると、そのエントリーポイントが再び実行されます（ [コンテナのライフサイクルと API](./using-liferay-docker-images/container-lifecycle-and-api.md#lifecycle) を参照してください）。エントリーポイント経由で [実行しているスクリプト](./using-liferay-docker-images/running-scripts-in-containers.md) が安全に再実行できることを確認してください。
```

```{tip}
`docker container ls -a` を実行して、コンテナの名前または ID を調べる。
```

これで、Liferayコンテナの開始、停止、監視の基本を理解できました。

## 次のステップ

コンテナのエントリーポイントが何をするのか知りたい、コンテナのAPIを知りたい場合は、 [コンテナのライフサイクルとAPI](./using-liferay-docker-images/container-lifecycle-and-api.md) を参照してください。 コンテナの使用を開始する場合は、次のいずれかの使用例を実行してください。

* [コンテナの設定](./using-liferay-docker-images/configuring-containers.md)
* [コンテナへのアプリやその他のアーティファクトのインストール](./using-liferay-docker-images/installing-apps-and-other-artifacts-to-containers.md)
* [DockerでDXPにパッチを当てる](./using-liferay-docker-images/patching-dxp-in-docker.md)
* [コンテナへのファイルの提供](./using-liferay-docker-images/providing-files-to-the-container.md)
* [新しいDockerイメージへのアップグレード](./using-liferay-docker-images/upgrading-to-a-new-docker-image.md)
* [Dockerイメージ・バージョン](./using-liferay-docker-images/docker-image-versions.md)
