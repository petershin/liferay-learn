# Cronジョブによるチケット管理

Cronジョブを使用してチケット管理を自動化します。 例えば、解決タイプが `duplicate` または `done` であるチケットを削除するジョブを定期的に実行するようにします。

手順に従って、cronジョブを有効にし、デプロイしてください：

1. チケット発券システムのサイトページに戻る。 解決タイプが `duplicate` または `done` であるチケットが少なくとも 1 つできるまで、_Generate a New Ticket_ を数回クリックします。

   ![Verify that you have a ticket that has a duplicate or done resolution type.](./ticket-management-with-cron-jobs/images/01.png)

1. コマンドラインを開き、以下のコマンドを実行する：

   ```bash
   ./gradlew :client-extensions:liferay-ticket-etc-cron:deploy
   ```

   配備が成功したことを確認するためにログをチェックしてください。

1. 次に、以下のコマンドを実行して、スプリングブート・アプリケーションを起動する：

   ```bash
   ./gradlew :client-extensions:liferay-ticket-etc-cron:bootRun
   ```

   cronジョブが実行されました。 ログを確認するか、_ticketing system_ サイトページを更新して、チケットが削除されたことを確認してください。

   ![チケットシステムのサイトページを更新してください。 チケットが削除されたことを確認する](./ticket-management-with-cron-jobs/images/02.png)

## クーロンジョブコードを調べる

このcronジョブは [マイクロサービス](../../../building-applications/client-extensions/microservice-client-extensions.md) タイプのクライアント拡張です。 具体的には、前回の文書紹介システムクライアント拡張と同様に、Spring Bootアプリケーションである。 したがって、`client-extension.yaml` ファイルには、以前のように `oAuthApplicationUserAgent` セクションと同じ `assemble` ブロックセクションが含まれます。

アプリケーションに関連するSpring Bootファイルは、`/src`フォルダに含まれている。 Javaコードの完全な説明はこのチュートリアルの範囲を超えているが、注意すべき点がいくつかある：

* `TicketSpringBootApplication.java` ファイルが OAuth 認証を行います。

* メインロジックは `TicketCommandLineRunner.java` ファイルにある。 チケットの解決が `duplicate` または `done` に等しい場合、チケットは削除されます。

カスタムチケットシステムの構築に関するこのソリューションチュートリアルの完了、おめでとうございます。

## 関連コンセプト

* [Java Webアプリケーションの開発](../../../building-applications/developing-a-java-web-application.md) 
* [マイクロサービス・クライアント拡張](../../../building-applications/client-extensions/microservice-client-extensions.md) 
