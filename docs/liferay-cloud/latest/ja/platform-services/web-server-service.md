# Webサーバーサービス（Nginx）

Nginx Webサーバーは、オープンインターネットからLiferay Cloudサービスへのゲートウェイとして機能します。 ユーザーからのすべてのトラフィックを処理し、高性能なWebサーバーとして機能します。

![The web server is one of several services available in Liferay Cloud.](./web-server-service/images/01.png)

詳細については、 [Webサーバーサービスの制限](../reference/platform-limitations.md#web-server-service) セクションを参照してください。

## 設定

Liferay Cloudのサービスはデフォルトでうまく機能するように微調整されていますが、さらにNginxを設定する必要がある場合があります。 これを行うには、`configs/{ENV}/conf.d/`フォルダーの中に任意のコンフィギュレーション（`.conf`）ファイルを含めることができる。 変更をデプロイすると、ファイルが自動的にサービスに挿入され、デフォルトの設定が上書きされます。 以下は、適切なディレクトリにコンフィギュレーション・ファイルを置いたフォルダ構造の例である：

```
webserver
├── configs
│   └── common
│       └── conf.d
│           └── nginx.conf
└── LCP.json
```

`webserver/configs/{ENV}/`にあるファイルは Liferay Cloud の Web サーバーコンテナの`/etc/nginx/` にオーバーライドとしてコピーされます。 `webserver/configs/{ENV}/public/` にあるファイルはオーバーライドとして `var/www/html/` にコピーされる。

## 自動ログローテーション

{bdg-secondary}`ウェブサーバー・バージョン5.3.0以上。`

Nginxのアクセスログとエラーログ（デフォルトではNginxコンテナの `/var/log/nginx/` ディレクトリに保存されます）は、個々のファイルが大きくなりすぎて読めなくなるのを防ぐために自動的にローテーションされます。 定期的に（デフォルトではUTCの午前0時ごとに）、現在のアクセスログファイルとエラーログファイルがローテーションされ、新しいファイルに置き換えられます。 自動ローテーションは、ファイルが特定の最大サイズのしきい値（デフォルトでは50 MB）に達した場合にも行われます。

ローテーション後の最も新しいファイルは、ファイル名に`.0`の接尾辞を付けて作成され、古いファイルから順に接尾辞を付けていく（`.1`、`.2`など）。 ローテーションはスムーズに処理され、Nginxやあなたのサービスの通常の機能を妨げることはありません。

ウェブサーバーサービスでこれらの環境変数を定義して、回転の動作を調整することができます：

* `lcp_logrotate_schedule`：自動ローテーションのスケジュールを定義する（Cronのスケジュール構文を使用、単位はUTC±00）。

* `lcp_logrotate_file_size`：ログファイルが自動的にローテーションされるまでの最大サイズを定義する。

* `lcp_logrotate_file_count`：コンテナ内に保持するローテートされたログファイルの最大数を定義する。

## 環境変数

これらの環境変数は、Webサーバーサービスで利用できます：

| 名前                                        | デフォルト値      | 説明                                                                                                                                                                                                                       |
| :---------------------------------------- | :---------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `LCP_HAPROXY_RESOLVER_HOLD_TIME`          | `10`        | HAProxy ロードバランサーの [`hold` 設定](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-hold) を設定します。 この設定は `valid` ステータス用である。                                                                      |
| `LCP_HAPROXY_RESOLVER_RETRIES`            | `3`         | HAProxy ロードバランサーの [`resolve_retries` 設定](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-resolve_retries) を設定します (セッションがサーバへの接続をあきらめるまでの再試行回数)。                        |
| `LCP_HAPROXY_RESOLVER_TIMEOUT_RESOLVE`    | `1`         | HAProxy ロードバランサーの [`timeout` 設定](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-timeout) を設定します (イベントのタイムアウトの秒数)。 この設定は `resolve` イベント用である。                           |
| `LCP_HAPROXY_RESOLVER_TIMEOUT_RETRY`      | `1`         | HAProxy ロードバランサーの [`timeout` 設定](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-timeout) を設定します (イベントのタイムアウトの秒数)。 この設定は `retry` イベント用である。                             |
| `LCP_HAPROXY_SERVER_TEMPLATE_BACKEND_NUM` | `10`        | 任意のサービスの最大インスタンス数を上書きします。 [オートスケーリング](../manage-and-optimize/auto-scaling.md) を使用する場合は、必要な最高値に設定してください。                                                                                                        |
| `LCP_LOGROTATE_FILE_COUNT`                | `52`        | [自動ローテーション](#automatic-log-rotation) の後に保持する Nginx のアクセスログとエラーログの最大数（それぞれ）。 この制限を超えると、最も古いファイルは削除される。                                                                                                          |
| `LCP_LOGROTATE_FILE_SIZE`                 | `50M`       | [自動ログローテーション](#automatic-log-rotation) を強制する前に Nginx のアクセスログまたはエラーログが到達できる最大サイズ。                                                                                                                               |
| `LCP_LOGROTATE_SCHEDULE`                  | `0 0 * * *` | [Nginxの自動ログローテーション](#automatic-log-rotation) が発生するときのCronスケジュール。                                                                                                                                              |
| `LCP_WEBSERVER_LOG_FORMAT`                |             | Nginxログの形式をカスタマイズします。 [Nginx公式ドキュメント](https://docs.nginx.com/nginx/admin-guide/monitoring/logging/#setting-up-the-access-log) を参照してください。                                                                       |
| `LCP_WEBSERVER_MODSECURITY`               | `Off`       | ModSecurityを有効または無効にします。 この値を `On` に設定するとルールが有効になって処理され、`DetectionOnly` に設定すると破壊的なアクションを実行せずにルールが処理される。 [Webアプリケーションファイアウォール](..//tuning-security-settings/web-application-firewall.md) を参照。 |

[Ingress Load Balancer](../infrastructure-and-operations/networking/load-balancer.md) もウェブサーバーサービスで設定します。 このサービスに環境変数を追加して、ロードバランサーやカスタムドメインを設定することができます。 詳しくは [ロードバランサ環境変数リファレンス](../infrastructure-and-operations/networking/load-balancer.md#environment-variables-reference) を参照してください。

Nginxのすべての環境変数とその他のコンフィギュレーションは、 [Nginx公式ドキュメント](https://docs.nginx.com/) にあります。 このような設定は `configs/{ENV}/` ディレクトリで、環境変数はサービスの `LCP.json` ファイルで設定できる。

## スクリプト

スクリプトを使用してより広範囲なカスタマイズを行うこともできますが、その際には注意が必要です。 これはウェブサーバー・サービスをカスタマイズする最も強力な方法ですが、望ましくない副作用を引き起こす可能性があります。

`configs/{ENV}/scripts/`フォルダにある`.sh` ファイルは、サービスを開始する前に実行されます。 例えば、このディレクトリ構造の中に、すべてのログファイルを削除するスクリプトを置くことができる：

```
webserver
├── configs
│   └── common
│       └── scripts
│           └── remove-log-files.sh
└── LCP.json
```
