# コンフィギュレーションファイルの例

Liferay Cloud の異なるサービス（ [search](../platform-services/search-service.md) や [Web server](../platform-services/web-server-service.md) サービスなど）は、オンプレミス環境では異なる扱いに慣れているかもしれないことを、設定ファイルを使って実行します。 Liferay Cloud を使い始める際に、これらのファイルがどのようなものかを確認する出発点として使用できるリソースの例をいくつか紹介します。

## ウェブサーバサービスの設定 (nginx.conf)

ウェブサーバーサービスは、 [Nginx](https://docs.nginx.com/) サーバーを使用して、ウェブのトラフィックを管理します。 以下は、 `nginx.conf` ファイルの例です。

```{literalinclude} ./example-configuration-files/resources/nginx.conf
:lines: 1-81
:language: nginx
```

`nginx.conf` ファイルは、プロジェクトリポジトリの `webserver/configs/{ENV}/conf.d/` ディレクトリに属します。

## 検索サービスの設定(elasticsearch.yml)

検索サービスは、 [Elasticsearch](https://www.elastic.co/guide/index.html) サーバーを使用して、Liferay インスタンスで検索クエリを処理します。 以下は、 `elasticsearch.yml` ファイルの例です。

```{literalinclude} ./example-configuration-files/resources/elasticsearch.yml
:lines: 1-27
:language: yaml
```

`elasticsearch.yml` ファイルは、プロジェクトリポジトリの `search/configs/{ENV}/config/` ディレクトリに属します。
