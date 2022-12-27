# Webサーバーサービス（Nginx）

Nginxウェブサーバーは、オープンインターネットからお客様のLiferayクラウドサービスへのゲートウェイとして機能します。 ユーザーからのすべてのトラフィックを処理し、高性能なウェブサーバーとして機能します。

![Webサーバーは、Liferay Cloudで利用できるいくつかのサービスのうちの1つです。](./web-server-service/images/01.png)

詳細は、 [Web server service limitations](../reference/platform-limitations.md#web-server-service) のセクションを参照してください。

## 設定

Liferay Cloud のサービスはデフォルトでうまく動作するように微調整されていますが、Nginx をさらに設定する必要がある場合があります。 これを行うには、 `configs/{ENV}/conf.d/` フォルダ内に任意の CONF ファイルをインクルードすることができます。 変更をデプロイすると、ファイルが自動的にサービスに挿入され、デフォルトの設定が上書きされます。 このようなファイルを適切なディレクトリに格納した場合のフォルダ構造の例を示します。 

    webserver
    ├── configs
    │   └── common
    │       └── conf.d
    │           └── nginx.conf
    └── LCP.json

`/webserver/configs/{ENV}/` のファイルは、Liferay Cloud の Web サーバコンテナの /etc/nginx/ にオーバーライドとしてコピーされます。 `/webserver/configs/{ENV}/public/`のファイルはオーバーライドとしてvar/www/html/にコピーされます。

```{note}
バージョン3.x.xのサービスを使用している場合は、Nginxの設定は適切な［lcp/webserver/config/{ENV}/］ディレクトリに属しています。 バージョンの確認方法については， [サービススタックのバージョンについて](../reference/understanding-service-stack-versions.md) を参照してください．
```

## 環境変数

これらの環境変数は、Webサーバーサービスで利用できます：

| 名前                                        | デフォルト値 | 説明                                                                                                                                                                                                                          |
|:----------------------------------------- |:------ |:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `LCP_HAPROXY_RESOLVER_HOLD_TIME`          | `10`   | HAProxyロードバランサーの [`ホールド` 構成](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-hold) の設定を行います。 この構成は、 `有効な` ステータス用です。                                                                                     |
| `LCP_HAPROXY_RESOLVER_RETRIES`            | `3`    | HAProxyロードバランサーの [`resolve_retries` の構成](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-resolve_retries) を行います（再試行回数は、セッションがあきらめる前に、サーバーに接続しようとします）。                                                     |
| `LCP_HAPROXY_RESOLVER_TIMEOUT_RESOLVE`    | `1`    | HAProxyロードバランサーの [`タイムアウト` 構成](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-timeout) の設定を行います（イベントタイムアウトの秒数）。 この構成は、 `解決する` イベント用です。                                                                 |
| `LCP_HAPROXY_RESOLVER_TIMEOUT_RETRY`      | `1`    | HAProxyロードバランサーの [`タイムアウト` 構成](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-timeout) の設定を行います（イベントタイムアウトの秒数）。 この構成は、 `再試行` のイベント用です。                                                                 |
| `LCP_HAPROXY_SERVER_TEMPLATE_BACKEND_NUM` | `10`   | 任意のサービスの最大インスタンス数を上書きします。 [オートスケーリング](../manage-and-optimize/auto-scaling.md)を使用する場合は、必要な最大値を設定してください。                                                                                                                      |
| `LCP_WEBSERVER_LOG_FORMAT`                |        | Nginxログの形式をカスタマイズします。 [official Nginx documentation](https://docs.nginx.com/nginx/admin-guide/monitoring/logging/#setting-up-the-access-log) を参照してください。                                                                      |
| `LCP_WEBSERVER_MOD_SECURITY`              | `Off`  | ModSecurityの有効・無効を設定します。 この値を `On` に設定すると、ルールが有効になり処理されます。また、 `DetectionOnly` に設定すると、破壊的なアクションを実行せずにルールが処理されます。 [Webアプリケーションファイアウォール](../infrastructure-and-operations/security/web-application-firewall.md) を参照してください。 |

[のIngress ロードバランサー](../infrastructure-and-operations/networking/load-balancer.md) もWebサーバーサービスで設定されます。 このサービスに環境変数を追加して、ロードバランサーやカスタムドメインを設定することができます。 詳細については、 [the Load Balancer environment variables reference](../infrastructure-and-operations/networking/load-balancer.md#environment-variables-reference) を参照してください。

Nginx の環境変数やその他の設定はすべて [official Nginx documentation](https://docs.nginx.com/) にあります。 サービスの`LCP.json`ファイルで、`configs/{ENV}/`ディレクトリと環境変数を設定することができます。

## スクリプト

スクリプトを使用して、より広範なカスタマイズを行うことができます。 ただし、これを行う際は注意してください。 これは、Webサーバーサービスをカスタマイズする最も強力な方法であり、望ましくない副作用を引き起こす可能性があります。

`configs/{ENV}/scripts/`フォルダーにある `.sh` ファイルは、サービスを開始する前に実行されます。 たとえば、すべてのログファイルを削除するスクリプトを含めるには、次のディレクトリ構造に配置します： 

    webserver
    ├── configs
    │   └── common
    │       └── scripts
    │           └── remove-log-files.sh
    └── LCP.json

```{note}
バージョン3.x.xのサービスを使用している場合、ウェブサースクリプトは適切な［lcp/webserver/script/{ENV}/］ディレクトリに置かれます。 バージョン確認の詳細については、 [サービススタックのバージョンについて](../reference/understanding-service-stack-versions.md) を参照してください。
```
