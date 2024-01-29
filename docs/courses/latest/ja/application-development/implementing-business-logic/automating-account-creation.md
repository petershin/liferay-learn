# アカウント作成の自動化

オンボーディングフローを完成させるために、Delectable Bonsaiは、マネージャーが承認されたアプリケーションのビジネスアカウントを簡単に作成できるようにしたいと考えている。 各アカウントは、アプリケーションの名前（ `businessName` ）にちなんで命名され、申請者は、アカウント管理者の役割を持つアカウントに自動的に割り当てられる必要があります。 ここでは、オブジェクトアクション [クライアント拡張](https://learn.liferay.com/web/guest/w/dxp/building-applications/client-extensions) を使ってこれを実現する。

![Distributor ApplicationオブジェクトにSet Up Accountアクションを追加します。](./automating-account-creation/images/01.png)

## クライアント・エクステンションの設定

<!--FINISH: Fix commands and client extension names once BChan merges code!!! -->

ワークフローに `liferay-course-etc-spring-boot` プロジェクトを [デプロイ](./adding-an-approval-workflow.md#deploying-the-client-extensions) したときに、カスタムオブジェクトアクションもデプロイしました。

先に進む前に、Spring Bootアプリケーションが実行されていることを確認する。 そうでない場合は、 `liferay-course-etc-spring-boot` プロジェクトフォルダに移動し、次のコマンドを実行してください：

```bash
./../../gradlew bootRun
```

その後、 `http://localhost:58081/ready` にアクセスし、アプリケーションが正常に起動したことを確認する。

## コードを調べる

提供されているObject Actionクライアント拡張機能は、これらの操作を実行する：

1. 承認されたアプリケーションから `businessName` を使用してビジネスアカウントを作成します。

1. `applicantEmail` フィールドを使用して、申請者をアカウントに関連付けます。

1. 申請者にアカウント管理者の役割を割り当てる

### リクエストボディの受信と変数の設定

```java
   @PostMapping
   public ResponseEntity<String> post(
      @AuthenticationPrincipal Jwt jwt, @RequestBody String json) {

      log(jwt, _log, json);

      JSONObject payload = new JSONObject(json);

      JSONObject jsonApplicationDTO = payload.getJSONObject("objectEntryDTODistributorApplication");

      JSONObject jsonProperties = jsonApplicationDTO.getJSONObject("properties");

      String accountName = jsonProperties.getString("businessName");

      String accountERC = "ACCOUNT_".+ accountName.toUpperCase().replace(" ", "_");

      String email = jsonProperties.getString("applicantEmail");
   ...
   }
```

`ObjectAction1RestController` の post メソッドには 2 つのパラメータがあります。HTTP 呼び出しの認証に使用する JSON Web トークン (JWT) と、JSON 形式の文字列として受け取るリクエスト本文です。

リクエストボディをロギングした後、JSONリクエストペイロードを解析し、最終的に `businessName` と `applicantEmail` の値を抽出する。 これらの値は、 `accountName` と `email` 変数に格納され、 `accountName` は、 `accountERC` 変数の設定に使われる。

### POSTリクエストの実行

```java
      try {
         WebClient.Builder builder = WebClient.builder();

         WebClient webClient = builder.baseUrl(
            ...
         ).defaultHeader(
            ...
         ).defaultHeader(
            ...
         ).build();

         createBusinessAccount(
            webClient, jwt, accountERC, accountName
         ).doOnSuccess(
            responseEntity -> logResponse(responseEntity, "Account Created")
         ).then(
            associateUserWithAccount(webClient, jwt, accountERC, email)
         ).doOnSuccess(
            responseEntity -> logResponse(responseEntity, "User Assigned")
         ).then(
            getRoleId(webClient, jwt, accountERC)
         ).flatMap(
            accountRoleId -> {
               return assignAccountRoleToUser(
                  webClient, jwt, accountERC, accountRoleId, email
               ).doOnSuccess(
                  responseEntity -> logResponse(responseEntity, "Role Assigned")
               );
            }
         ).subscribe();
      }
```

リクエストボディ(`json`)を使って変数を定義した後、コードは `WebClient` を初期化し、そのベースURLとヘッダーを決定して設定する。 そして、 `createBusinessAccount`、 `associateUserWithAccount`、 `getRoleId`、 `assignAccountRoleToUser` メソッドを連鎖させる。 これらのメソッドにより、ビジネスアカウントが作成され、申請者が関連付けられ、アカウント管理者 ID が取得され、申請者にロールが割り当てられます。

### アカウントの作成

```java
   private Mono<ResponseEntity<String>> createBusinessAccount(
      WebClient webClient, Jwt jwt, String accountERC, String accountName) {

      return webClient.post(
      ).uri(
         "o/headless-admin-user/v1.0/accounts"
      ).bodyValue(
         "{"externalReferenceCode"：\""+ accountERC + "￤", ￤"name"：\""+ accountName + "￤", ￤"type"：\"ビジネス"}"
      ).header(
         HttpHeaders.AUTHORIZATION, "Bearer " + jwt.getTokenValue()
      )
      ...
   }
```

このメソッドは、初期化された `WebClient` を使用して `headless-admin-user` エンドポイントへの非同期 POST リクエストを実行し、 `accountERC` および `accountName` 変数を使用してビジネスアカウントを作成し、それぞれ `externalReferenceCode` および `name` フィールドに入力します。 最後に、レスポンス・エンティティを返し、HTTPステータスを記録する。

### 申請者とアカウントの関連付け

```java
   private Mono<ResponseEntity<String>> associateUserWithAccount(
      WebClient webClient, Jwt jwt, String accountERC, String email) {

      return webClient.post(
      ).uri(
         "o/headless-admin-user/v1.0/accounts/by-external-reference-code/{externalReferenceCode}/user-accounts/by-email-address/{emailAddress}", accountERC, email
      ).header(
         HttpHeaders.AUTHORIZATION, "Bearer " + jwt.getTokenValue()
      )
      ...
   }
```

このメソッドは、初期化された `WebClient` を使用して `headless-admin-user` エンドポイントへの非同期 POST リクエストを実行し、 `accountERC` と `email` 変数を使用してユーザーをアカウントに関連付けます。 最後に、レスポンス・エンティティを返し、HTTPステータスを記録する。

### アカウント管理者の役割の割り当て

```java
   private Mono<ResponseEntity<String>> assignAccountRoleToUser(
      WebClient webClient, Jwt jwt, String accountERC, Integer accountRoleId, String email) {

      return webClient.post(
      ).uri(
         "o/headless-admin-user/v1.0/accounts/by-external-reference-code/{externalReferenceCode}/account-roles/{accountRoleId}/user-accounts/by-email-address/{emailAddress}", accountERC, accountRoleId, email
      ).header(
         HttpHeaders.AUTHORIZATION, "Bearer " + jwt.getTokenValue()
      )
      ...
   }
```

このメソッドは、初期化された `WebClient` を使用して `headless-admin-user` エンドポイントへの非同期 POST リクエストを実行し、 `accountERC`, `accountRoleId` および `email` 変数を使用してユーザーにアカウント・ロールを割り当てます。 ロールIDは、 `getRoleId` メソッドを使用して抽出されます。 最後に、レスポンス・エンティティを返し、HTTPステータスを記録する。

### 役割IDの取得

```java
   private Mono<Integer> getRoleId(WebClient webClient, Jwt jwt, String accountERC) {
      return webClient.get(
      ).uri(
         uriBuilder -> uriBuilder.path(
            "o/headless-admin-user/v1.0/accounts/by-external-reference-code/{externalReferenceCode}/account-roles"
         ).queryParam(
            "filter", "name eq 'Account Administrator'"
         ).build(
            accountERC
         )
      ).header(
         HttpHeaders.AUTHORIZATION, "Bearer " + jwt.getTokenValue()
      ).retrieve(
      ).bodyToMono(
         String.class
      ).map(
         json -> new JSONObject(
            json
         ).getJSONArray(
            "items"
         ).getJSONObject(
            0
         ).getInt(
            "id"
         )
      );
   }
```

このメソッドは `headless-admin-user` エンドポイントに GET リクエストを行い、整数を返します。 URIを構築するとき、リクエストは応答がアカウント管理者ロールだけを含むようにフィルターする。 そして、ロールの `id`を抽出して返す。

## オブジェクトアクションの追加

1. **Distributor Application** オブジェクトの編集を開始します。

1. **Actions** タブを開き、 **Add**( ![Add Button](../../images/icon-add.png) ) をクリックする。

1. 基本情報タブにこれらの値を入力する：

   | 項目        | 値                                      |
   |:--------- |:-------------------------------------- |
   | アクションのラベル | アカウント設定                                |
   | アクション名    | セットアップアカウント                            |
   | 説明        | スタンドアロン、承認されたアプリケーションのビジネスアカウントを作成します。 |
   | 有効        | True                                   |

   ![Set Up Accountアクションを作成します。](./automating-account-creation/images/02.png)
   
   1. **アクションビルダー** タブに行き、これらの値を設定する：


   | 項目       | 値                                                                                 |
   |:-------- |:--------------------------------------------------------------------------------- |
   | トリガー     | 単体                                                                                |
   | 操作       | `object-action-executor[function#liferay-course-etc-spring-boot-object-action-1]` |
   | エラーメッセージ | ビジネスアカウントの作成に失敗しました。                                                              |

   ![カスタムアクションを選択します。](./automating-account-creation/images/03.png)
   
   1. ［**保存**］ をクリックします。

保存すると、Liferayは各アプリケーションのアクションメニューにオプションとしてアクションを追加するので、Distributor Applicationsページから手動でトリガーすることができます。

![Liferayは各アプリケーションのアクションメニューにオプションとしてアクションを追加します。](./automating-account-creation/images/04.png)

Liferayはまた、スタンドアロンアクションをトリガーするための2つのヘッドレスAPIを生成します。

![Liferayはスタンドアロンアクションをトリガーするために2つのヘッドレスAPIを生成します。](./automating-account-creation/images/05.png)

最後に、Liferayはどのユーザーがアクションをトリガーできるかをコントロールするパーミッションを追加します。 次に、この権限をビジネス開発マネージャ・ロールに割り当てます。

## アカウント設定権限の割り当て

1. **グローバルメニュー**（![Global Menu](../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブに移動して、 ［**ロール**］ をクリックします。

1. **Business Development Manager** 役割を編集します。

1. **Define Permissions** タブに行く。

1. `ディストリビューター・アプリケーションを追加： action.setUpAccount` permission.
   
   ![Set Up Account権限を追加します。](./automating-account-creation/images/06.png)

1. ［**保存**］ をクリックします。

ビジネス・マネージャーは、ディストリビューター・アプリケーション・ページから、またはヘッドレスAPIを使用してアクションをトリガーできるようになりました。

## アカウント設定アクションのトリガー

1. ディストリビューター募集のページへ

1. **Actions**( ![Actions Button](../../images/icon-actions.png) ) をクリックし、 **Set Up Account** を選択します。

1. **Accounts** アプリケーションを開き、アカウントが作成されたことを確認する。
   
   ![アカウントが作成されたことを確認する。](./automating-account-creation/images/07.png)

1. **Users** タブを開き、申請者がアカウントに関連付けられ、アカウント管理者ロールが割り当てられていることを確認します。
   
   ![申請者がアカウントに関連付けられ、アカウント管理者の役割が割り当てられていることを確認する。](./automating-account-creation/images/08.png)

## まとめ

　 これで、Distributor Applicationオブジェクトに必要なビジネスロジックが追加されました。 Liferayのページビルダー機能を使ってユーザーインターフェイスをデザインできるようになりました。

モジュール 3： [ユーザーインターフェースのデザイン](../designing-user-interfaces.md)

## 関連コンセプト
