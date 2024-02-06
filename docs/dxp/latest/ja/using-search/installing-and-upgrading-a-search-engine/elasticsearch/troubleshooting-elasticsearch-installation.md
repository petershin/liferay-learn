---
toc:
  - ./troubleshooting-elasticsearch-installation/troubleshooting-the-elasticsearch-connection.md
  - ./troubleshooting-elasticsearch-installation/troubleshooting-elasticsearch-common-issues.md
---
# Elasticsearchインストールのトラブルシューティング

LiferayとElasticsearchは、多くの設定を伴う複雑なシステムです。 [この2つを接続する](./getting-started-with-elasticsearch.md)際、途中で困難にぶつかることがあります。 以下に、トラブルシューティングのテクニックを紹介します。

よくある問題とその解決方法については、以下をご覧ください。

- [Elasticsearch接続のトラブルシューティング](./troubleshooting-elasticsearch-installation/troubleshooting-the-elasticsearch-connection.md)
- [Elasticsearchのトラブルシューティング：よくある問題](./troubleshooting-elasticsearch-installation/troubleshooting-elasticsearch-common-issues.md)

Liferayにバンドルされているsidecar Elasticsearchサーバーのトラブルシューティングは、 [Troubleshooting the Sidecar/Embedded Elasticsearch](./using-the-sidecar-or-embedded-elasticsearch.md#troubleshooting-the-sidecar-embedded-elasticsearch) をご覧ください。

## 検索バーのElasticsearchクエリを検査する

Liferayの検索インフラストラクチャーは、ユーザーが検索バーウィジェットから検索するたびに、大きなElasticsearchのリクエストを生成します。 Elasticsearchに送信されたクエリを検査するには、検索インサイトウィジェットを使用します。 詳しくは、 [検索インサイト](../../search-pages-and-widgets/search-insights.md)をご覧ください。

## Liferayが生成したElasticsearchクエリを検査する

Liferay によって生成された Elasticsearch クエリを検査するには、 `com.liferay.portal.search.elasticsearch7.internal.ElasticsearchIndexSearcher` のログレベルを [Server Administration Log Levels UI](../../../system-administration/using-the-server-administration-panel/configuring-logging.md)を使って、`INFO` レベルに設定します。

```{tip}
Liferay 7.1-7.2で、デフォルトでバンドルされているElasticsearch 6へのコネクターを使用している場合、パッケージ名のバージョン番号を`7`から`6`に変更します。
```

## 冗長SSLロギングを有効にする

暗号化関連の問題をトラブルシューティングするには、冗長SSLロギングを有効にします。

Liferayの場合、アプリケーションサーバーのJVMで `-Djavax.net.debug=ssl:handshake:verbose` を設定します。 Tomcat では、`setenv.sh`の`CATALINA_OPTS` にオプションが追加されています。

```properties
CATALINA_OPTS="$CATALINA_OPTS -Djavax.net.debug=ssl:handshake:verbose"
```

Elasticsearch の場合は、 `[Elasticsearch Home]/config/jvm.options`の最後に `-Djavax.net.debug=ssl:handshake:verbose` を追加してください。
