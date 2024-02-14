# クラウドコンソールでのマイクロサービスのトラブルシューティング

前回は、 [マイクロサービスのクライアント拡張](https://learn.liferay.com/w/dxp/building-applications/client-extensions/microservice-client-extensions#object-action-client-extensions) を使って、Liferay でフィードバックエントリが送信されたときのログをテストしました。 さて、KyleはSpring Bootアプリケーションに単純なカウンター変数を追加して、エントリーの総数を記録したいと考えている。

ここでは、 [以前にデプロイしたサンプルクライアント拡張プロジェクト](./deploying-and-managing-a-microservice-client-extension-project.md)を修正し、クラウド コンソールで問題が発生した場合のトラブルシューティングを行い、問題を解決します。

## オブジェクトアクション REST コントローラにカウンタを追加する

[サンプル Spring Boot クライアント拡張](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-etc-spring-boot) は `ObjectAction1RestController.java` ファイルを使用して、Liferay から受け取ったオブジェクトデータをログに記録します。 Kyleは、それぞれの新しいフィードバックエントリをカウントし、新しいログメッセージのための既存のエントリ数に追加する単純な変数を追加したいと考えています。

この動作を実装するためのコードを追加する。

1. `liferay-sample-etc-spring-boot` フォルダで、 [Spring Boot プロジェクトをデプロイした](./deploying-and-managing-a-microservice-client-extension-project.md#download-the-sample-workspace) 、 `src/main/java/com/liferay/sample/ObjectAction1RestController.java` ファイルを開きます。

1. `count` 変数をクラスのフィールドとして追加する：

   ```java
   public class ObjectAction1RestController extends BaseRestController {

   private int count = 0;

   ...
   ```

1. 既存のエントリーの値を注入するために、別のフィールドを追加する：

   ```java
   @Value("${EXISTING_FEEDBACK}")
   protected int existingFeedback;
   ```

1. このバリュー・インジェクションが機能するように、 `import`：

   ```java
   import org.springframework.beans.factory.annotation.Value;
   ```

1. ロギングを追加するには、これらの新しい変数を使用します。 `post` メソッドの `return` ステートメントの前に以下の行を追加する：

   ```java
   count++;

   int total = count + existingFeedback;

   _log.info("Total feedback so far: " + total);
   ```

これで、最小限のカウンターを実装するのに十分なコードができた。

## 更新されたプロジェクトをデプロイする

`liferay-sample-etc-spring-boot/` フォルダでコマンドラインを開き、プロジェクトを再構築してデプロイしてください。

1. プロジェクトを新しいデプロイ可能なLUFFAにビルドする：

   ```bash
   ../../gradlew clean build
   ```

1. CLIツールを使用して、ビルドされたLUFFAをデプロイします：

   ```bash
   lcp deploy --extension dist/liferay-sample-etc-spring-boot.zip
   ```

   プロンプトが表示されたら、UATクライアントの拡張環境に対応する番号を選択します。

クライアント拡張プロジェクトがデプロイされ、遅れてクラウドコンソールに表示されます。

## マイクロサービスをチェックする

`liferaysampleetcspringboot` サービスがクラウドコンソールに表示されるが、しばらく待っても「Ready」ステータスが表示されないようだ。

![liferaysampleetcspringbootサービスは存在するが、Readyになるまでかなり時間がかかる。](./troubleshooting-a-microservice-in-the-cloud-console/images/01.png)

以前と同じように、オブジェクトのアクションをトリガーしてみてください。

1. UATのLiferayインスタンスにログインします。

1. フォームの **Submit** をクリックして、新しいオブジェクトエントリーを作成し、アクションをトリガーする。

1. クラウド・コンソールに戻り、 `liferaysampleetcspringboot` サービスをクリックする。

分待っても、ログには追加した新しいメッセージは表示されないし、新しいエントリーのログも表示されない。 上にエラーメッセージが表示されているのもわかるだろう。

![サービスのログに、期待した新しいログが表示されない。](./troubleshooting-a-microservice-in-the-cloud-console/images/02.png)

しばらく待つと、これらのエラーのためにサービスが継続的に再起動していることがわかる。 新しいコードは何かを壊しているようだ。

## アプリケーションログの検索

Liferay Cloud のコンソールで、アプリケーションのログを検索し、マイクロサービスで何がうまくいかなかったかの兆候を探します。 ログページを使用すると、フィルタリングや検索ツールを使って関連情報を見つけることができます。

1. 左側のメニューから **Logs** を選択する。

1. Logs ページで、画面上部のドロップダウンメニューから **Application logs** が選択されていることを確認する。

   クライアント・エクステンション・サービスは1つしか実行されていないので、サービス別にフィルタリングする必要はない。

1. "feedback "で検索して、追加した新しい変数に関連するヒントを探してください。

   ![エラーメッセージやスタックトレース全体を検索するには、 "feedback"。](./troubleshooting-a-microservice-in-the-cloud-console/images/03.png)

ログは完全なスタック・トレースまでフィルタリングされ、 `Exception` のルートが、インジェクションによって追加された変数と明らかに関連している。

```
Caused by: java.lang.IllegalArgumentException: Could not resolve placeholder 'EXISTING_FEEDBACK' in value "${EXISTING_FEEDBACK}"
```

Spring Bootは `EXISTING_FEEDBACK` の値をどこにも見つけられないのだ！

## 不足している環境変数を追加する

Spring Bootはコンテナ内の同名の環境変数から値を注入できる。 サービスの環境変数として `EXISTING_FEEDBACK` の値を追加してみてください。

1. 左側メニューの **Services** をクリックすると、 `liferaysampleetcspringboot` サービスが表示される場所に戻ります。

1. `liferaysampleetcspringboot` サービスをクリックする。

1. ［**環境変数**］ タブをクリックします。

1. レギュラー変数リストに新しい環境変数を追加する。 `EXISTING_FEEDBACK` をキーに、 `2` を値として追加する（これまでに作成した2つのエントリーについて）。

   ![Spring Bootが値のインジェクションに使用できるEXISTING_FEEDBACK環境変数を追加します。](./troubleshooting-a-microservice-in-the-cloud-console/images/04.png)

1. **Save Changes** をクリックします。

1. 画面上部の **Actions** メニュー( ![Actions menu](../../images/icon-actions.png) )をクリックし、 **Restart Service** をクリックして、新しい変数が適切に初期化されるようにします。

サービスは、新しい環境変数で遅延後に再スタートする。

## 環境変数が存在することを確認する

シェルを使って、変数がSpring Bootが検出できる環境にあることを確認する。 コンソールでシェルにアクセスすると、マイクロサービスが実行されているコンテナに直接入ることができる。

1. サービスのページで、 **Shell** タブをクリックします。

1. `printenv` コマンドを使って、新しい環境変数が存在するかどうかをチェックする：

```bash
printenv | grep "EXISTING"
```

![printenvを使って、新しい環境変数が正しく初期化されたかどうかをチェックする。](./troubleshooting-a-microservice-in-the-cloud-console/images/05.png)

環境変数は、Spring Bootが使用できる場所に存在する。

## 新しいログをもう一度テストする

新しい変更をもう一度テストしてみてください。

1. UATのLiferayインスタンスに戻ってください（ログインしていることを確認してください）。

1. 入力オブジェクトのフォームで **Submit** をクリックします。

1. 再びクラウド・コンソールに戻り、 `liferaysampleetcspringboot` サービス・ページに移動してログを見る。

![オブジェクトアクションクライアントエクステンションが機能し、新しいロギングが期待通りに表示されました。](./troubleshooting-a-microservice-in-the-cloud-console/images/06.png)

これで、オブジェクトアクションクライアントエクステンションが再び機能し、新しいログメッセージが既存のログと一緒に表示されるのがわかります。 Liferayインスタンスでより多くの値を送信すると、カウンタの値はその都度増分します。

　 Liferay Experience Cloud の最終モジュールが完了しました。 コースの残りは、Liferay Experience Cloud Self-Managedに焦点を当てます。

次へ [クラウド構成](../cloud-configuration.md).

## 関連コンセプト

* [マイクロサービスのクライアント拡張](https://learn.liferay.com/w/dxp/building-applications/client-extensions/microservice-client-extensions#object-action-client-extensions)
* [Liferay Cloud Service Logsを読む](https://learn.liferay.com/w/liferay-cloud/troubleshooting/reading-liferay-cloud-service-logs)
* [シェルアクセス](https://learn.liferay.com/w/liferay-cloud/troubleshooting/shell-access)
* [トラブルシューティングサービス](https://learn.liferay.com/w/liferay-cloud/troubleshooting/troubleshooting-services)
* [セルフヒーリング](https://learn.liferay.com/w/liferay-cloud/troubleshooting/self-healing)
* [環境変数の定義](https://learn.liferay.com/w/liferay-cloud/reference/defining-environment-variables#defining-environment-variables-via-the-liferay-cloud-console)
