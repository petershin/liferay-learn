---
toc:
- ./troubleshooting-elasticsearch-installation/troubleshooting-the-elasticsearch-connection.md
- ./troubleshooting-elasticsearch-installation/troubleshooting-elasticsearch-common-issues.md
---
# Elasticsearchインストールのトラブルシューティング

```{toctree}
:maxdepth: 1

troubleshooting-elasticsearch-installation/troubleshooting-the-elasticsearch-connection.md
troubleshooting-elasticsearch-installation/troubleshooting-elasticsearch-common-issues.md
```

LiferayとElasticsearchは、設定に満ちた複雑なシステムです。 [それらをつなぐと](./getting-started-with-elasticsearch.md)、途中で困難にぶつかることがあります。 以下に、トラブルシューティングのテクニックを紹介します。

よくある問題とその解決方法については、以下をご覧ください。

- [Elasticsearch接続のトラブルシューティング](./troubleshooting-elasticsearch-installation/troubleshooting-the-elasticsearch-connection.md)
- [Elasticsearchのトラブルシューティング。よくある問題](./troubleshooting-elasticsearch-installation/troubleshooting-elasticsearch-common-issues.md)

Liferayにバンドルされているsidecar Elasticsearchサーバーのトラブルシューティングは、 [Troubleshooting the Sidecar/Embedded Elasticsearch](./using-the-sidecar-or-embedded-elasticsearch.md#troubleshooting-the-sidecar-embedded-elasticsearch)をご覧ください。

## 検索バーのElasticsearchクエリを検査する

Liferayの検索インフラは、ユーザーがSearch Barウィジェットから検索するたびに、大きなElasticsearchのリクエストを生成します。 Elasticsearchに送信されたクエリを検査するには、Search Insightsウィジェットを使用します。 詳しくは、 [Search Insights](../../search-pages-and-widgets/search-insights.md)をご覧ください。

## Liferayが生成したElasticsearchクエリを検査する

Liferay によって生成された Elasticsearch クエリを検査するには、 `com.liferay.portal.search.elasticsearch7.internal.ElasticsearchIndexSearcher` のログレベルを `INFO` レベルに [Server Administration Log Levels UI](../../../system-administration/using-the-server-administration-panel/configuring-logging.md)を使って設定します。

```{tip}
Liferay 7.1-7.2 で、デフォルトでバンドルされている Elasticsearch 6 への Connector を使用している場合、パッケージ名のバージョン番号を `7` から `6` に変更します。
```

## 詳細なSSLログを有効にする

暗号化関連のトラブルシューティングを行うには、冗長なSSLロギングを有効にしてください。

Liferayの場合、アプリケーションサーバーのJVMで `-Djavax.net.debug=ssl:handshake:verbose` を設定してください。 Tomcat では、 `setenv.sh`の `CATALINA_OPTS` にオプションが追加されています。

```properties
CATALINA_OPTS="$CATALINA_OPTS -Djavax.net.debug=ssl:handshake:verbose"
```

Elasticsearchの場合、 `[Elasticsearch Home/]config/jvm.options`の末尾に `-Djavax.net.debug=ssl:handshake:verbose` を追加してください。
