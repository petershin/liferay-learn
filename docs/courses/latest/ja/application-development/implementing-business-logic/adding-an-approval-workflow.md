# 承認ワークフローの追加

`applicationState` フィールドを追加した後、Delectable Bonsai はアプリケーションに加えられた変更をレビューし、承認するためのワークフローを実装したい。 現在、アプリケーションのすべての更新は、選択された状態に関係なく、自動的に承認される。 Delectable Bonsai は、 `承認された` と `拒否された` の状態に追加のビジネスロジックを関連付けるので、ワークフローは `applicationState` フィールドをチェックし、これらの値のいずれかが選択された場合、マネージャのレビューを要求しなければなりません。 ここでは、Liferay [クライアントエクステンション](https://learn.liferay.com/web/guest/w/dxp/building-applications/client-extensions) を使って、このワークフロープロセスをデプロイし、セットアップします。

## クライアント拡張機能の展開

<!--FINISH: Fix commands and client extension names once BChan merges code!!! -->

1. サンプルワークスペースをダウンロードし、解凍します。

   ```bash
   curl -o https://learn.liferay.com/courses/latest/en/application-development/implementing-business-logic/liferay-c6s3.zip
   ```

   ```bash
   unzip liferay-c6s3.zip
   ```

1. `liferay-c6s3/liferay-course-workspace/client-extensions`に移動します：

   ```bash
   cd liferay-c6s3/liferay-course-workspace/client-extensions
   ```

   `liferay-course-batch` と `liferay-course-etc-spring-boot`の2つのクライアント拡張プロジェクトが含まれます。

1. このコマンドを実行してクライアントエクステンションをデプロイし、Liferayインスタンスのコンソールでデプロイを確認します：

   ```bash
   ../gradlew clean deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   ```log
   2023-07-20 21:03:07.142 INFO  [Refresh Thread: Equinox Container: 8b6a806c-654e-44f8-8210-75b61d29063c][BundleStartStopLogger:77] STARTED liferaycoursebatch_1.0.0 [1721]
   2023-07-20 21:03:12.408 INFO  [Refresh Thread: Equinox Container: 8b6a806c-654e-44f8-8210-75b61d29063c][BundleStartStopLogger:77] STARTED liferaycourseetcspringboot_1.0.0 [1722]
   ```

1. `liferay-course-etc-spring-boot` プロジェクトに移動し、Spring Boot アプリケーションを起動します：

   ```bash
   cd liferay-course-etc-spring-boot
   ```

   ```bash
   ./../../gradlew bootRun
   ```

1. アプリケーションが起動したら、 `http://localhost:58081/ready`にアクセスしてください。 アプリケーションが使用可能であれば、ページには "READY "と表示されます。

これで、Distributor Application オブジェクトのワークフローを有効にすることができます。

## コードを調べる

提供される Workflow Action クライアント拡張機能は、これらの操作を実行します：

1. アプリケーションの状態値を取得し、ワークフローの遷移を決定するために使用する。

1. トランジションに対する非同期HTTP POSTリクエストを行う。

### ワークフロー移行の決定

```java
   @PostMapping
   public ResponseEntity<String> post(
      @AuthenticationPrincipal Jwt jwt, @RequestBody String json) {

      log(jwt, _log, json);

      String transition = "auto-approve";

      JSONObject payload = new JSONObject(json);

      JSONObject entryDTO = payload.getJSONObject("entryDTO");

      JSONObject applicationState = entryDTO.getJSONObject("applicationState");

      String applicationStateKey = applicationState.getString("key");

      if (Objects.equals("approved", applicationStateKey) || Objects.equals("denied", applicationStateKey)) {
         transition = "review";
      }.
      ...
   }
```

`WorkflowAction1RestController` の post メソッドには、JSON Web トークン（JWT）とリクエストボディの 2 つのパラメータがあります。 トークンはHTTPコールを認証し、リクエスト・ボディはJSON形式の文字列としてデータを含む。

リクエストボディをログに記録した後、コードは `transition` 変数を初期化し、その値を `auto-approve`に設定する。

`次に、 <code>JSONObject()` コンストラクタと `.getJSONObject()` メソッドを使用して、 `applicationState` フィールドのキー</code> 値を抽出し、そのキーを `applicationStateKey` 変数に格納する。

最後に、状態キーが `approved` または `denied`に等しい場合、 `transition` 変数を `review` に更新する条件ブロックを定義する。

### POSTリクエストの作成

```java
      try {
         WebClient.Builder builder = WebClient.builder();

         WebClient webClient = builder.baseUrl(
            lxcDXPServerProtocol + "://" + lxcDXPMainDomain
         ).defaultHeader(
            HttpHeaders.ACCEPT, MediaType.APPLICATION_JSON_VALUE
         ).defaultHeader(
            HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE
         ).build();

         webClient.post(
         ).uri(
            payload.getString("transitionURL")
         ).bodyValue(
            "{\"transitionName\": \"" + transition + "\"}"
         ).header(
            HttpHeaders.AUTHORIZATION, "Bearer " + jwt.getTokenValue()
         ).exchangeToMono(
            clientResponse -> {
               HttpStatus httpStatus = clientResponse.statusCode();

               if (httpStatus.is2xxSuccessful()) {
                  return clientResponse.bodyToMono(String.class);
               }
               else if (httpStatus.is4xxClientError()) {
                  return Mono.just(httpStatus.getReasonPhrase());
               }

               Mono<WebClientResponseException> mono =
                  clientResponse.createException();

               return mono.flatMap(Mono::error);
            }
         ).doOnNext(
            output -> {
               if (_log.isInfoEnabled()) {
                  _log.info("Output: " + output);
               }
            }
         ).subscribe();
      }
```

ワークフロー遷移を決定した後、コードは非同期HTTP POSTリクエストに進む。 まず、 `WebClient`の初期化と設定を行い、ベースURLとヘッダーを決定し、 `WebClient`の `post()` メソッドを呼び出します。

このPOSTリクエストは、その `uri()`のために、オリジナルのレスポンスボディから `transitionURL` の値を使用する。 次に、 `bodyValue()` を使用して、ワークフロー・タスクの `transitionName` を `transition` 変数の値で更新する。 リクエストはJWTを使って認証され、レスポンスのHTTPステータスコードに従ってログに記録される。

## ディストリビューター・アプリケーションのワークフローを有効にする

1. **グローバルメニュー**（![Global Menu](../../images/icon-applications-menu.png)）を開き、 ［**アプリケーション**］ タブをクリックして、 ［**Process Builder**］ をクリックします。

1. 機械承認のプロセスが表示されることを確認する

   ![機械承認のプロセスが表示されることを確認する](./adding-an-approval-workflow/images/01.png)

   このプロセスはバッチクライアント拡張によって追加され、5つのノードを定義する：Start、Machine Review、Manager Review、Update、および Approved である。

   Machine Reviewノードは、ワークフローアクションクライアント拡張機能を使用して、各アプリケーションの状態フィールドをチェックする。 値が `approved` または `denied`に等しい場合、アプリケーションはビジネス開発マネジャーによる承認のためにマネジャー・レビュー・ノードに導かれます。 そうでない場合は、Machine Reviewノードが自動的にApprovedノードにアプリケーションを誘導する。

   ![このプロセスには5つのノードがある：Start、Machine Review、Manager Review、Update、Approved。](./adding-an-approval-workflow/images/02.png)

1. **Configuration** タブにアクセスする。

1. **Edit** for Distributor Application をクリックし、 **Machine Approver** を選択し、 **Save** をクリックします。

## ワークフローのテスト

1. Distributor Applicationsを開き、エントリーの編集を開始します。

1. 状態を「**Review（レビュー**）」 に設定し、「**Save（保存**）」 をクリックする。

1. エントリーのステータスを確認する。 承認されるべきだ。

   ![エントリーのステータスは「承認」になっているはずです。](./adding-an-approval-workflow/images/03.png)

1. エントリーの状態を **Approved** に変更する。

1. エントリーのステータスを確認する。 **Pending** であるべきだ。

   ![エントリーのステータスは「保留」となっているはずだ。](./adding-an-approval-workflow/images/04.png)

1. **Personal Menu** を開き、 **Notifications** に進み、新しい **ワークフロー通知** をクリックします。

   ![ワークフロー通知を見る](./adding-an-approval-workflow/images/05.png)

1. レビュータスクを自分に割り当て、承認する。

   ![変更を承認する。](./adding-an-approval-workflow/images/06.png)

1. エントリーのステータスを確認する。 承認されるべきだ。

   ![エントリーのステータスは「承認」になっているはずです。](./adding-an-approval-workflow/images/07.png)

承認ワークフローを設定し、申請にはマネージャーのレビューが必要です。

今、Delectable Bonsaiは申請、承認、却下の通知を自動化しなければならない。

次へ [通知テンプレートの追加](./adding-notification-templates.md)

## 関連コンセプト

* [ワークフローデザイナー](https://learn.liferay.com/web/guest/w/dxp/process-automation/workflow/designing-and-managing-workflows/workflow-designer/workflow-designer-overview)
* [オブジェクトのワークフローを有効にする](https://learn.liferay.com/web/guest/w/dxp/building-applications/objects/enabling-workflows-for-objects)
* [マイクロサービスのクライアント拡張](https://learn.liferay.com/web/guest/w/dxp/building-applications/client-extensions/microservice-client-extensions)
* [バッチクライアント拡張機能](https://learn.liferay.com/web/guest/w/dxp/building-applications/client-extensions/batch-client-extensions)
