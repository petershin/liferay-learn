# Liferayのパフォーマンスの問題をGlowrootでトラブルシューティングする

{bdg-secondary}`liferay DXP 2023.Q4+/Portal 7.4 GA100+`.

Glowroot を使用して、Liferay インストールのパフォーマンス問題を特定し、診断します。 以下のトピックは、診断するための一般的な問題です。

## 高価なSQLクエリ

高価なSQLクエリはレスポンスタイムを低下させ、データベースに過度の負荷をかける可能性があります。 Transactions_タブをクリックし、システムが処理している様々なクエリを監視します。 Transactions "パネルで"_Queries_"をクリックする。 テーブルで、_合計時間（ms）_をクリックして、最も時間がかかるクエリを特定します。

![Identify the queries that take the most time.](./troubleshooting-liferay-performance-issues-with-glowroot/images/01.png)

高価なSQLクエリーは、接続を待つ他のスレッドのバックアップを引き起こすかもしれない。 ゲージダッシュボードに光接続プールを追加するには、_設定_ &rarr; _ゲージ_に移動します。 新規追加_をクリックし、「com.zaxxer.hikari:type=Pool (HikariPool-1)`」を検索します。 全てのMbean属性を選択し、_Add_をクリックする。

JVM_タブをクリックし、左メニューの_Gauges_をクリックします。 光接続プールがゲージダッシュボードで監視できるようになりました。

## キャッシュサイズの問題

Liferay は [Ehcache](https://www.ehcache.org/) を使ってエンティティのほとんどをキャッシュしています。 Mbeanツリーを使用して、特定のエンティティの構成と利用を検査する。 例えば、`UserImpl`のエンティティキャッシュを調べてみよう。

1. JVM_タブをクリックする。 左ナビゲーションの_Mbean tree_をクリックします。

1. スクロールダウン（またはテキスト検索）して、`CacheConfiguration`セクションの下にある`UserImpl`を見つける。 そのエンティティの現在のキャッシュ構成を参照する。

   ![See the current configuration for the entity.](./troubleshooting-liferay-performance-issues-with-glowroot/images/02.png)

1. 下にスクロールして（またはテキスト検索して）、`CacheStatistics` セクションの下にある `UserImpl` を見つける。 エンティティの現在のキャッシュ使用率を参照してください。

   ![See the current utilization for the entity.](./troubleshooting-liferay-performance-issues-with-glowroot/images/03.png)

エンティティの検査に基づいて、 [キャッシュ構成に必要な変更を加える](../../building-applications/data-frameworks/cache.md) 。

キャッシュをクリアすることも可能だ。 Liferay で、_Control Panel_ &rarr; _Server Administration_ に移動します。 キャッシュのクリアは「リソース」タブで可能です。

## カスタムSQLクエリ

カスタムクエリはキャッシュされないため、長いトランザクション時間を必要とすることがあります。 [expensive SQL queries](#expensive-sql-queries) を参照して、カスタムクエリがシステムに与える影響を確認してください。

## 大型テーブル

時間とともに、Liferayデータベースのテーブルは大きくなります。 これはまた、トランザクションのスローダウンを引き起こす可能性がある。 いくつかの例を挙げよう。

- `Audit_AuditEvent` - ログインなどの監査イベントに関連するテーブル。
- `OAuth2Authorization` - 認証に関連するテーブル
- `SamlSpAuthRequest`、`SamlSpMessage`、`SamlSpSession` - SAML 認証に関連するテーブル。
- `UserNotificationEvent` - 通知に関連するテーブル

パフォーマンスを向上させるために、 [データベースのプルーニング](../../installation-and-upgrades/upgrading-liferay/upgrade-stability-and-performance/database-pruning-for-faster-upgrades.md) を検討してください。

## 並行処理の問題

CPU使用率が低いにもかかわらず、一部のトランザクションが遅いようであれば、同期リソースの同時実行の問題かもしれない。 Glowrootの_Transactions_タブに移動します。 左のメニューから特定の取引を選択します。 ダッシュボードをJVMスレッドセクションまでスクロールダウンして、トランザクションを検査する。

![Scroll down the dashboard to the JVM thread section.](./troubleshooting-liferay-performance-issues-with-glowroot/images/04.png)

**CPU時間**：演算に費やされる時間。

**ブロック時間**：スレッドがブロックされている時間であり、同期メカニズムを待っている可能性がある。

**Waited time**: スレッドがトランザクションの完了を待った時間。

取引がブロックされていないか、長時間待たされていないかを確認する。

## バックエンド・サービスの遅さ

トランザクションが遅いのは、外部のバックエンド・サービスが遅いか応答しないことが原因かもしれない。 上記の [同時実行の問題](#concurrency-issues) のように、トランザクションダッシュボードを使用してバックエンドのサービストランザクションを検査する。 サービスの設定を変更する必要があるかもしれません。

## 長いゴミ収集時間

ガベージコレクションを監視し、異常に長い時間をチェックするには、グロールートゲージを使用する。 JVM_タブに移動し、左メニューの_Gauges_をクリックします。 下にスクロールして、表示するガベージコレクタの `CollectionTime` 属性を選択する。

![View the CollectionTime garbage collector attribute in the gauge dashboard.](./troubleshooting-liferay-performance-issues-with-glowroot/images/05.png)

## Metaspaceのメモリ不足エラー

メタスペースのサイズは、アプリケーション・サーバーを設定するときに設定します。 JVMが設定されている以上のメモリーを要求しようとすると、クラッシュが発生する可能性がある。 Glowrootゲージを使用して、メタスペースの使用状況を検査する。 JVM_タブに移動し、左メニューの_Gauges_をクリックします。 下にスクロールして、ガベージコレクタの `CollectionTime` 属性を選択する。 下にスクロールして、表示させたいjavaの `Metaspace` 属性を選択する。

## 遅い、または高いコード

Glowrootを使用して、コードの特定のセクションにパフォーマンスの問題があるかどうかを分析する。 取引」タブに移動します。 検査する特定のトランザクションを選択し、トランザクションパネルの_Thread profile_をクリックする。 スレッドプロファイルは、トランザクションのスレッドスタックを示す。

このパネルから炎のグラフを表示することもできる。 炎のグラフを見る」をクリックする。

![Click view flame graph to render a flame graph.](./troubleshooting-liferay-performance-issues-with-glowroot/images/06.png)

炎のグラフは、スタック・トレースを視覚化したものである。 要素にマウスオーバーすると、各メソッドの詳細が表示されます。

## 計装の設定

インスツルメンテーションを設定することで、メソッド呼び出しを個別のトランザクションとして捕捉する。 新しいインストルメンテーションを作成する、

1. Configuration_ &rarr; _Instrumentation_に移動します。 新規追加_をクリックする。

1. クラス名とメソッド名を入力する。 何をキャプチャするかを選択し、特定のニーズに基づいて詳細を記入します。

1. 追加」をクリックする。 新しい取引は_Transactions_タブの下に表示されます。

詳細は [Glowroot instrumentation](https://glowroot.org/instrumentation.html) を参照。

## 誤報

遅いトランザクションは、潜在的なシステム・エラーの兆候かもしれない。 しかし、それが予想されるシナリオもある。 例えば、Liferayが最初に起動したとき、大きなSQLクエリが表示され、長い時間がかかることがあります。 遅いトランザクションは、キャッシュが空である長いアイドル期間の後にも起こるかもしれない。 JSPリクエストも遅いトランザクションとして表示されるかもしれない。 JSPは実行時にコンパイルされるため、大量のJSPリクエストがあると動作が遅くなる可能性がある。
