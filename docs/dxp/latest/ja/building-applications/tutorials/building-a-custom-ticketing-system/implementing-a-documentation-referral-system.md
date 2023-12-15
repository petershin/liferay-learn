# 文書紹介システムの導入

発券システムは、書類紹介システムによってさらに強化することができる。 システムは、チケットの内容と説明に基づいて関連ドキュメントを自動的に検索し、カスタマーサポートのワークフローを強化します。

手順に従って、紹介システムを有効化し、導入してください：

1. 以前の `liferay-ticket-batch-object-definition` クライアント拡張の `/batch/object-defintion.batch-engine-data.json` ファイルに移動します。 36行目の `objectActions` セクションで、`active` の値を `false` から `true` に変更する。

1. 以下のコマンドで `liferay-ticket-batch-object-definition` クライアントエクステンションを再デプロイします：

   ```bash
   ./gradlew :client-extensions:liferay-ticket-batch-object-definition:deploy
   ```

   なお、 [オブジェクトアクション](../../../building-applications/objects/creating-and-managing-objects/actions.md) は、UIからも有効にできる。 Liferayで **Control Panel** &rarr; **Objects** に移動します。 Ticket **オブジェクトをクリックし、** Actions_タブをクリックします。 アクションが`active`であることを確認する。

   ![Object action is active.](./implementing-a-documentation-referral-system/images/01.png)

1. 次に、以下のコマンドを実行する：

   ```bash
   ./gradlew :client-extensions:liferay-ticket-etc-spring-boot:deploy
   ```

   配備が成功したことを確認するためにログをチェックしてください。

1. 次に、以下のコマンドを実行して、スプリングブート・アプリケーションを起動する：

   ```bash
   ./gradlew :client-extensions:liferay-ticket-etc-spring-boot:bootRun
   ```

   文書紹介システムは現在稼働している。

1. チケットシステムのサイトページに戻ります。 新しいチケットを作成する」をクリックします。 新しいチケットが生成されます。

1. **グローバルメニュー**&rarr;** コントロールパネル*&rarr; **J3Y7 チケット**に移動します。 チケットリストの右側にスクロールしてください。 生成されたチケットの **オプション** (![オプションアイコン](../../../images/icon-options.png))をクリックし、**表示**をクリックします。

   提案欄までスクロールダウンする。 紹介システムに関連文書へのリンクが含まれていることを確認する。

   ![See that the referral system has included links to relevant documentation.](./implementing-a-documentation-referral-system/images/02.png)

## リフェラル・システム・コードの検証

文書紹介システムは、 [マイクロサービス](../../../building-applications/client-extensions/microservice-client-extensions.md) タイプのクライアント拡張である。 具体的には、このサンプルは `BootJar` でビルドされた Spring Boot アプリケーションである。 client-extension.yaml`の`assemble`ブロックセクションは、これを以下のように特定している：

assemble:
* fromTask: bootJar

詳しくは [Assembling Client Extensions](../../../building-applications/client-extensions/working-with-client-extensions#assembling-client-extensions) を参照してください。

マイクロサービスクライアント拡張は、LiferayとやりとりするためにOAuth2ユーザーエージェント設定を必要とします。 そのため、`client-extension.yaml` ファイルには `oAuthApplicationUserAgent` タイプのクライアント拡張と `objectAction` タイプのクライアント拡張の両方が含まれている。

`liferay-ticket-etc-spring-boot-oauth-application-user-agent`クライアントエクステンションは、紹介システムアプリケーションが認証に使用するOAuth2アプリケーションをLiferay内に作成します。 これは次のように定義されている：

```yaml
liferay-ticket-etc-spring-boot-oauth-application-user-agent:
    .serviceAddress: localhost:58081
    .serviceScheme: http
    name: Liferay Ticket Etc Spring Boot OAuth Application User Agent
    scopes:
        - C_J3Y7Ticket.everything
    type: oAuthApplicationUserAgent
```

`C_J3Y7Ticket.everything`ヘッドレスAPIがどのようにアクセス権を与えられているかに注目してほしい。 serviceAddress`パラメータは、サービスがローカルで実行される場所を定義する。

次に、`liferay-ticket-etc-spring-boot-object-action-ticket` クライアント拡張は `objectAction` タイプのクライアント拡張で、オブジェクトアクションが発生したときにマイクロサービスのコードをトリガーします。 これは次のように定義されている：

```yaml
liferay-ticket-etc-spring-boot-object-action-ticket:
    name: Liferay Ticket Etc Spring Boot Object Action Ticket
    oAuth2ApplicationExternalReferenceCode: liferay-ticket-etc-spring-boot-oauth-application-user-agent
    resourcePath: /object/action/ticket
    type: objectAction
```

`resourcePath`パラメータはマイクロサービスが実行されるエンドポイントを定義する。 oAuth2ApplicationExternalReferenceCode` パラメータは以前の OAuth2 アプリケーションの設定を参照する。

各プロパティの説明については、 [Object Action Yaml Configuration](../../../building-applications/client-extensions/microservice-client-extensions/object-action-yaml-configuration-reference.md) を参照してください。

アプリケーションに関連するSpring Bootファイルは、`/src`フォルダに含まれている。 Javaコードの完全な説明はこのチュートリアルの範囲を超えているが、注意すべき点がいくつかある：

* `ObjectActionTicketRestController.java`ファイルの`@PostMapping` アノテーションは上の YAML ファイルで参照されているリソースパスにマッチします。 新しいチケットオブジェクトが作成されると、オブジェクトアクションはこのパスでマイクロサービスをトリガーし、参照結果が Liferay に返されます。

* 参照検索ロジックもこの `ObjectActionTicketRestController.java` ファイルにある。 ロジックの中で、 [learn.liferay.com](https://learn.liferay.com) から関連する記事が見つかり、チケットオブジェクトエントリーに追加されます。

次へ [Cronジョブによるチケット管理](./ticket-management-with-cron-jobs.md).

## 関連コンセプト

* [Java Webアプリケーションの開発](../../../building-applications/developing-a-java-web-application.md) 
* [マイクロサービス・クライアント拡張](../../../building-applications/client-extensions/microservice-client-extensions.md) 
