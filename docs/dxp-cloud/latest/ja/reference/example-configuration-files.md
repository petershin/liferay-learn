# コンフィギュレーションファイルの例

DXP Cloudの異なるサービス（ [検索](../platform-services/search-service.md) や [Webサーバー](../platform-services/web-server-service.md) サービスなど）は、オンプレミス環境では異なる扱いに慣れているかもしれませんが、設定ファイルを使用して実行されます。 DXP Cloudを使い始める際に、これらのファイルがどのようなものかを確認する出発点として使用できるサンプルリソースを紹介します。

## ウェブサーバサービスの設定 (nginx.conf)

Webサーバーサービスでは、 [Nginx](link) サーバーを使用して、Webトラフィックを管理します。 以下は、 `nginx.conf` ファイルの例です。

```{literalinclude} ./example-configuration-files/resources/nginx.conf
:lines: 1-81
:language: nginx
```

`nginx.conf` ファイルはプロジェクトリポジトリの `webserver/configs/{ENV}/conf.d/` ディレクトリに所属している。

## 検索サービスの設定(elasticsearch.yml)

検索サービスは、 [Elasticsearch](https://www.elastic.co/guide/index.html) サーバーを使用して、Liferayインスタンスで検索クエリーを処理します。 以下は、 `elasticsearch.yml` のファイルの例です。

```{literalinclude} ./example-configuration-files/resources/elasticsearch.yml
:lines: 1-27
:language: yaml
```

`elasticsearch.yml` ファイルは、プロジェクトリポジトリの `search/configs/{ENV}/config/` ディレクトリに属します。
