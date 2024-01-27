# GlowrootによるJVMの問題のトラブルシューティング

{bdg-secondary}`liferay DXP 2023.Q4+/Portal 7.4 GA100+`.

Glowrootは、システムの問題を素早く特定するためのダッシュボードを表示する。 Errors_タブをクリックすると、追跡されたエラーのリストが表示されます。 以下のトピックは、Java環境でよく遭遇する問題と、トラブルシューティングに役立つGlowrootの使い方のヒントです。

## Javaデッドロック

デッドロックは、他のスレッドがリソースを使用しているために、複数のスレッドが処理できない場合に発生する。 アプリケーションの動作が遅くなったり、応答しなくなったりすることがあります。

デッドロックが疑われる場合は、Glowrootの_JVM_タブをクリックする。 左ナビゲーションメニューの_Thread dump_をクリックする。 出力を分析してデッドロックを見つける。

![Click the JVM tab and select thread dump.](./troubleshooting-jvm-issues-with-glowroot/images/01.png)

## 糸漏れ

スレッド漏れは、多くの新しいスレッドが作成されたにもかかわらず、そのスレッドが適切に管理されず、不要になったときにクローズされない場合に発生する。 時間の経過とともに、これらのスレッドは多くのシステムリソースを消費し、パフォーマンスに影響を与える可能性がある。

スレッドリークが疑われる場合、`java.lang.OutOfMemory`エラーが指標となる可能性がある。 Glowroot の _Errors_ タブをクリックし、エラーがないか確認する。 実行中のすべてのスレッドのリストを見るにはMBeanツリーを使う。 JVM_タブをクリックし、左ナビゲーションで_Mbean tree_をクリックする。 `java.lang`セクションまでスクロールダウンし、_Threading_をクリックします。

![Click the JVM tab and select the Mbean tree.](./troubleshooting-jvm-issues-with-glowroot/images/02.png)

## データベースのデッドロック

データベースのデッドロックは、2つ以上のプロセス（トランザクション）が互いにリソースの解放を待っているときに発生する。

Glowrootでトランザクションのトレースをチェックし、遅いトランザクションがないか確認する。 取引」タブをクリックします。 トランザクションパネルで、_Slow traces_をクリックする。 デッドロックの可能性を特定するために、時間がかかりすぎているトランザクションを見つけるためにチャートを使用する。

![Click slow traces to see transactions that take a long time.](./troubleshooting-jvm-issues-with-glowroot/images/03.png)

## データベース接続プールの問題

データベース接続の漏れは、プログラムやアプリケーションが、データベース接続が不要になった後、その接続を適切に解放またはクローズしなかった場合に発生する。 これは、利用可能なデータベース接続を枯渇させ、システムのスローダウンを引き起こす可能性がある。

Glowrootの_Errors_タブをクリックし、コネクションプールのタイムアウトエラーやデータベース接続のステータスを確認する。 JVM_タブをクリックし、左ナビゲーションで_Mbean tree_をクリックする。 `com.zaxxer.hikari`セクションまでスクロールダウンし、`プール（HikariPool-1）`をクリックします。 アクティブな接続数と接続待ちのスレッド数を見る。 ユースケースによっては、プールサイズを大きくする必要があるかもしれない。

ゲージダッシュボードに光接続プールを追加するには、_設定_ &rarr; _ゲージ_に移動します。 新規追加_をクリックし、「com.zaxxer.hikari:type=Pool (HikariPool-1)`」を検索します。 全てのMbean属性を選択し、_Add_をクリックする。

![Add the Hikari connection pool to the gauges dashboard.](./troubleshooting-jvm-issues-with-glowroot/images/04.png)

_JVM_タブをクリックし、左メニューの_Gauges_をクリックします。 ゲージダッシュボードで光接続プールを監視できるようになりました。
