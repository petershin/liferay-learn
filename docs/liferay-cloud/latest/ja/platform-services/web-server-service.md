# Webサーバーサービス（Nginx）

Nginx Webサーバーは、オープンインターネットからLiferay Cloudサービスへのゲートウェイとして機能します。 ユーザーからのすべてのトラフィックを処理し、高性能なWebサーバーとして機能します。

![Webサーバーは、Liferay Cloudで利用できるいくつかのサービスのうちの1つです。](./web-server-service/images/01.png)

詳細は、 [Web server service limitations](../reference/platform-limitations.md#web-server-service) のセクションを参照してください。

## 設定

Liferay Cloudのサービスはデフォルトでうまく機能するように微調整されていますが、さらにNginxを設定する必要がある場合があります。 これを行うには、 `configs/{ENV}/conf.d/` フォルダーの中に、任意のコンフィギュレーション（`.conf`）ファイルを含めることができる。 変更をデプロイすると、ファイルが自動的にサービスに挿入され、デフォルトの設定が上書きされます。 以下は、適切なディレクトリにコンフィギュレーション・ファイルを置いたフォルダ構造の例である： 

    webserver
    ├── configs
    │   └── common
    │       └── conf.d
    │           └── nginx.conf
    └── LCP.json

`/webserver/configs/{ENV}/` のファイルはオーバーライドとして Liferay Cloud の Web サーバーコンテナの `/etc/nginx/` にコピーされます。 `/webserver/configs/{ENV}/public/` にあるファイルは、オーバーライドとして `var/www/html/`にコピーされる。

## 自動ログローテーション

{bdg-secondary}`利用可能なウェブサーバーのバージョン 5.3.0+`

Nginxのアクセスログとエラーログ（デフォルトではNginxコンテナの `/var/log/nginx/` ディレクトリに保存されます）は、個々のファイルが大きくなりすぎて読めなくなるのを防ぐために自動的にローテーションされます。 定期的に（デフォルトではUTCの午前0時ごとに）、現在のアクセスログファイルとエラーログファイルがローテーションされ、新しいファイルに置き換えられます。 また、ファイルが一定の最大サイズのしきい値（デフォルトでは50MB）に達すると、自動ローテーションが行われる。

ローテーション後の最も新しいファイルは、ファイル名に `.0` という接尾辞を付けて作成され、古いファイルから順に接尾辞を付けていく（`.1`、 `.2`など）。 ローテーションはスムーズに処理され、Nginxやあなたのサービスの通常の機能を妨げることはありません。

ウェブサーバーサービスでこれらの環境変数を定義して、回転の動作を調整することができます：

* `LCP_LOGROTATE_SCHEDULE`: 自動ローテーションのスケジュールを定義します（Cronスケジュール構文を使用、単位はUTC±00）。

* `LCP_LOGROTATE_FILE_SIZE`: 自動ローテーションされる前のログ・ファイルの最大サイズを定義します。

* `LCP_LOGROTATE_FILE_COUNT`: コンテナ内に保持するローテーション・ログ・ファイルの最大数を定義します。

## 環境変数

これらの環境変数は、Webサーバーサービスで利用できます：

| 名前                                        | デフォルト値      | 説明                                                                                                                                                                                                                   |
|:----------------------------------------- |:----------- |:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `LCP_HAPROXY_RESOLVER_HOLD_TIME`          | `10`        | HAProxyロードバランサーの [`hold`構成](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-hold) の設定を行います。 この構成は、 `valid` ステータス用です。                                                                             |
| `LCP_HAPROXY_RESOLVER_RETRIES`            | `3`         | HAProxyロードバランサーの [`resolve_retries` の構成](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-resolve_retries) を行います（再試行回数は、セッションがあきらめる前に、サーバーに接続しようとします）。                                              |
| `LCP_HAPROXY_RESOLVER_TIMEOUT_RESOLVE`    | `1`         | HAProxyロードバランサーの [`timeout` 構成](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-timeout) の設定を行います（イベントタイムアウトの秒数）。 この構成は、 `resolve` イベント用です。                                                      |
| `LCP_HAPROXY_RESOLVER_TIMEOUT_RETRY`      | `1`         | HAProxyロードバランサーの [`timeout` 構成](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-timeout) の設定を行います（イベントタイムアウトの秒数）。 この構成は、 `retry` のイベント用です。                                                       |
| `LCP_HAPROXY_SERVER_TEMPLATE_BACKEND_NUM` | `10`        | 任意のサービスの最大インスタンス数を上書きします。 [オートスケーリング](../manage-and-optimize/auto-scaling.md)を使用する場合は、必要な最大値を設定してください。                                                                                                               |
| `LCP_LOGROTATE_FILE_COUNT`                | `52`        | [自動ローテーション](#automatic-log-rotation) の後に保持する Nginx のアクセスログとエラーログの最大数（それぞれ）。 この制限を超えると、最も古いファイルは削除される。                                                                                                                 |
| `LCP_LOGROTATE_FILE_SIZE`                 | `50M`       | [自動ログローテーション](#automatic-log-rotation) を強制する前に Nginx のアクセスログまたはエラーログが到達できる最大サイズ。                                                                                                                                      |
| `LCP_LOGROTATE_SCHEDULE`                  | `0 0 * * *` | [Nginxの自動ログローテーション](#automatic-log-rotation) が発生するときのCronスケジュール。                                                                                                                                                     |
| `LCP_WEBSERVER_LOG_FORMAT`                |             | Nginxログの形式をカスタマイズします。 [official Nginx documentation](https://docs.nginx.com/nginx/admin-guide/monitoring/logging/#setting-up-the-access-log) を参照してください。                                                               |
| `LCP_WEBSERVER_MODSECURITY`               | `Off`       | ModSecurityを有効または無効にします。 この値を`On`に設定すると、ルールが有効になり処理されます。または、`DetectionOnly`に設定すると、破壊的なアクションを実行せずにルールが処理されます。 [Webアプリケーションファイヤーウォール](../infrastructure-and-operations/security/web-application-firewall.md)を参照してください。 |

[Ingressロードバランサー](../infrastructure-and-operations/networking/load-balancer.md) もWebサーバーサービスで設定されます。 このサービスに環境変数を追加して、ロードバランサーやカスタムドメインを設定することができます。 詳細については、 [the Load Balancer environment variables reference](../infrastructure-and-operations/networking/load-balancer.md#environment-variables-reference) を参照してください。

Nginxの環境変数やその他の設定はすべて [公式のNginxドキュメント](https://docs.nginx.com/) にあります。 サービスの`LCP.json`ファイルで、`configs/{ENV}/`ディレクトリと環境変数を設定することができます。

## スクリプト

スクリプトを使用してより広範囲なカスタマイズを行うこともできますが、その際には注意が必要です。 これはウェブサーバー・サービスをカスタマイズする最も強力な方法ですが、望ましくない副作用を引き起こす可能性があります。

`configs/{ENV}/scripts/` フォルダーにある `.sh` ファイルは、サービスを開始する前に実行されます。 例えば、このディレクトリ構造の中に、すべてのログファイルを削除するスクリプトを置くことができる：

    webserver
    ├── configs
    │   └── common
    │       └── scripts
    │           └── remove-log-files.sh
    └── LCP.json
