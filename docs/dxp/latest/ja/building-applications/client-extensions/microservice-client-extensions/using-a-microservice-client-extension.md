# マイクロサービスクライアント拡張機能の使用

マイクロサービスクライアントエクステンションは、Liferayとの通信をOAuth 2に依存するスタンドアロンのサーバープロセスです。 マイクロサービスはリソースサーバーであり、Liferayは認可サーバーである。 詳しくは [Using OAuth 2](../../../headless-delivery/using-oauth2.md) をご覧ください。 このデモのサンプルプロジェクトは、リソースサーバー（マイクロサービス）の保護されたルートからペイロードを取り込み、 [カスタム要素](../frontend-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) クライアント拡張に基づくフロントエンドウィジェットに表示します。 スタンドアロン [Spring Bootアプリケーション](https://docs.spring.io/spring-boot/docs/current/reference/html/getting-started.html#getting-started) と連携するために、この例では2つのクライアント拡張タイプが使われている：

| デプロイ可能または実行可能なコード                            | 種類                                                                                                                                   | 説明                                                             | ワークスペース・サンプル                 |
|:-------------------------------------------- |:------------------------------------------------------------------------------------------------------------------------------------ |:-------------------------------------------------------------- |:---------------------------- |
| Liferay サンプル OAuth アプリケーションユーザーエージェントをデプロイする | Client extension: [`oAuthApplicationUserAgent`](../configuration-client-extensions/oauth-user-agent-yaml-configuration-reference.md) | ログインしたユーザーがカスタムエレメント内のマイクロサービスのペイロードを見ることができるように、認可チャネルを設定します。 | liferay-サンプル-etc-spring-boot |
| Spring Bootマイクロサービスアプリケーションを実行する             | 保護されたエンドポイント `/dad/joke`                                                                                                             | リソース・サーバーへの保護されたエンドポイント。 JWTトークンを受け取り、ペイロードを返す。                | liferay サンプル-etc-spring-boot |
| Liferayサンプルカスタム要素2をデプロイする                    | クライアント・エクステンション: [`カスタムエレメント`](../frontend-client-extensions/custom-element-yaml-configuration-reference.md)                        | カスタム要素を定義し、OAuth 2 クライアントコードを通してリソースサーバーにペイロードを要求します。          | ライフレイ・サンプル・カスタム要素-2          |

```{note}
便宜上、このチュートリアルでは、サンプル・ワークスペースにあるすぐにデプロイできるカスタム要素を使用します。 しかし、ここではカスタム・エレメント・クライアントの拡張が焦点ではない。 認可サーバーを呼び出し、リソースサーバーからのペイロードを表示できるフロントエンド技術であれば、カスタム要素の代わりに使用することができます。
```

リソースサーバーは保護されたルート `/dad/joke`を持っている。 ログインしたユーザーに代わって、クライアント(つまりウィジェット)は認可サーバー(Liferay)に認可コードを要求する。 トークンが付与されると、クライアントはリソースサーバー（Spring Bootアプリケーション）と通信する。

`oAuthApplicationUserAgent` タイプの拡張は、クライアントプロファイルUser Agent Applicationを持つものとして登録される。

## 前提条件

クライアント拡張の開発を開始するには、

1. Java（JDK8またはJDK11）をインストールします。

   ```{note}
   対応するJDK、データベース、環境については、 [互換性マトリックス](https://help.liferay.com/hc/ja/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) を確認してください。 推奨されるJVM設定については、[JVM Configuration](../../../installation-and-upgrades/reference/jvm-configuration.md)を参照のこと。
   ```

1. サンプルワークスペースをダウンロードし、解凍します。

   ```bash
   curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip
   ```

   ```bash
   unzip -d liferay-sample-workspace com.liferay.sample.workspace-latest.zip
   ```

これでマイクロサービスを起動し、クライアント拡張機能をLiferayにデプロイするためのツールが揃いました。

```{include} /_snippets/run-liferay-portal.md
```

## マイクロサービスプロジェクトのクライアント拡張を調べる

`client-extensions/liferay-sample-etc-spring-boot/client-extension.yaml` ファイルはサンプルワークスペースのマイクロサービスクライアント拡張プロジェクトを定義している。定義されているクライアント拡張のほとんど (`type: *Action` を持つものなど) はこの例では必要ない。`client-extension.yaml`の必要な行をまとめると、次のようになる。

```yaml
assemble:
    - fromTask: bootJar
liferay-sample-etc-spring-boot-oauth-application-user-agent:
    .serviceAddress: localhost:58081
    .serviceScheme: http
    name: Liferay Sample Etc Spring Boot Spring Boot OAuth Application User Agent
    scopes:
        - Liferay.Headless.Admin.Workflow.everything
    type: oAuthApplicationUserAgent
```

外部アプリケーション/マイクロサービスは、 [Spring Boot Gradle Plugin](https://docs.spring.io/spring-boot/docs/current/gradle-plugin/reference/htmlsingle/) から利用できる `bootJar` コマンドで作成します。 LXCでデプロイするためには、アプリケーションJARをLUFFAに含める必要がある。

`client-extension.yaml` の最も重要な部分は `liferay-sample-etc-spring-boot-oauth-application-user-agent` の定義です。 これはLiferayを認可サーバーとしてセットアップし、次にデプロイするフロントエンドクライアントエクステンションがリソースサーバーのセキュアエンドポイントを呼び出し、そのペイロードを表示できるようにします。

## カスタム・エレメント・プロジェクトのクライアント・エクステンションを調べる

`client-extensions/liferay-sample-custom-element-2/client-extension.yaml` ファイルは、サンプルワークスペースのカスタム要素クライアント拡張プロジェクトを定義します：

```yaml
assemble:
    - from: build/static
      into: static
liferay-sample-custom-element-2:
    cssURLs:
        - css/main.*.css
    friendlyURLMapping: liferay-sample-custom-element-2
    htmlElementName: liferay-sample-custom-element-2
    instanceable: false
    name: Liferay Sample Custom Element 2
    portletCategoryName: category.client-extensions
    type: customElement
    urls:
        - js/main.*.js
    useESM: true
```

詳しくは、[カスタム要素とIFrameクライアント拡張機能を理解する](../frontend-client-extensions/understanding-custom-element-and-iframe-client-extensions.md)をご参照ください。

## OAuth Application User Agent Client Extensionのデプロイ

1. サンプルワークスペースの `client-extensions/liferay-sample-etc-spring-boot` フォルダに移動します。

1. 実行

   ```bash
   ../../gradlew clean deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

1. Liferay のログで、クライアントエクステンションがデプロイされ、起動したことを確認します：

   ```log
   STARTED liferay-sample-etc-spring-boot_1.0.0 [1588]
   2023-06-07 14:24:56.245 INFO  [fileinstall-directory-watcher][BundleStartStopLogger:77] STARTED liferay-sample-etc-spring-boot_1.0.0 [1702]
   2023-06-07 14:24:56.315 INFO  [CM Event Dispatcher (Fire ConfigurationEvent: pid=com.liferay.oauth2.provider.configuration.OAuth2ProviderApplicationUserAgentConfiguration~liferay-sample-etc-spring-boot-oauth-application-user-agent)][InterpolationConfigurationPlugin:135] Replaced value of configuration property 'homePageURL' for PID com.liferay.oauth2.provider.configuration.OAuth2ProviderApplicationUserAgentConfiguration~liferay-sample-etc-spring-boot-oauth-application-user-agent
   2023-06-07 14:24:56.365 INFO  [CM Event Dispatcher (Fire ConfigurationEvent: pid=com.liferay.oauth2.provider.configuration.OAuth2ProviderApplicationUserAgentConfiguration~liferay-sample-etc-spring-boot-oauth-application-user-agent)][OAuth2ProviderApplicationUserAgentConfigurationFactory:179] OAuth 2 application with external reference code liferay-sample-etc-spring-boot-oauth-application-user-agent and company ID 20096 has client ID id-df5840e5-a91c-dcae-9bd8-873508a699
   ```

   さらに、OAuthユーザーエージェントに関するメッセージも記録される。

1. OAuth Application User Agent が Liferay に追加されていることを確認します。 **コントロールパネル** &rarr; **OAuth2 管理** にアクセスする。

   ![Liferay Sample OAuth Application User Agent は、クライアントエクステンションをデプロイするときに追加されます。](./using-a-microservice-client-extension/images/01.png)

Liferay Sample OAuth Application User Agentは、Liferayが保護されたエンドポイントを通してSpring Bootアプリケーションのデータにアクセスできるように、必要な [OAuth 2認可](../../../headless-delivery/using-oauth2.md)。 この場合、Liferayがアプリケーションを認可するために必要なのは、 `application-default.properties`で外部参照コードを宣言することだけです：

```properties
liferay.oauth.application.external.reference.codes=liferay-sample-etc-spring-boot-oauth-application-user-agent
```

## マイクロサービスを開始する

`client-extensions/liferay-etc-spring-boot/` フォルダから、以下を実行する。

```sh
../../gradlew bootRun
```

Spring Bootアプリケーションが起動し、ログにメッセージが表示される：

```log
...
2023-06-07 10:33:44.514  INFO 2897671 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 58081 (http) with context path ''
2023-06-07 10:33:44.519  INFO 2897671 --- [           main] c.l.sample.SampleSpringBootApplication   : Started SampleSpringBootApplication in 1.094 seconds (JVM running for 1.262)
<==========---> 80% EXECUTING [1h 43m 56s]
> :client-extensions:liferay-sample-etc-spring-boot:bootRun
```

## カスタム要素クライアント拡張機能の展開

マイクロサービスが実行され、OAuth2 アプリケーション通信チャネルが DXP でプロビジョニングされ、利用可能になりました。 この例では、マイクロサービスによって生成されたデータを表示するために、 [カスタム要素クライアント拡張](../frontend-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) を使用しています。 それを配備する、

1. `client-extensions/liferay-sample-custom-element-2` フォルダに移動します。

1. 実行

   ```bash
   ../../gradlew clean deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

## パパ・ジョークをページに表示する

Liferayサンプルカスタムエレメント2ウィジェットを実行中のLiferayのページに追加します。 ページを公開すると、ウィジェットにパパ・ジョークが表示される：

![カスタム・エレメント2は、ページが読み込まれるたびに悪いジョークを表示する。](./using-a-microservice-client-extension/images/02.png)

## OAuth2によるリクエストの認証方法

認証されたユーザがクライアントアプリケーションを載せたページ（カスタムエレメント）をロードすると、ユーザエージェントエクステンション（つまり、Liferayが認証サーバ）によって設定された通信チャネルのために利用可能な認証コードを要求します。 Liferayはコードを返し、クライアントはアクセストークンを要求します。 トークンがあれば、クライアントはマイクロサービス内のエンドポイントにアクセスできる。 リソースサーバーはJWKS URIエンドポイントを使用してLiferayでJWTトークンを検証します。 これはバックグラウンドで自動的に行われる。

`liferay-sample-custom-element-2` クライアントエクステンションの `DadJoke.js` ファイルに、認可パイプラインを開始する重要な呼び出しがあります：

```js
try {
    oAuth2Client = Liferay.OAuth2Client.FromUserAgentApplication(
        'liferay-sample-etc-spring-boot-oauth-application-user-agent'
    );
}
```

この呼び出しはクライアントにトークンを提供する。このトークンは、リソースサーバーの `/dad/joke` ルートからリソースをリクエストするときに、クライアントがベアラートークンとして使用できる。 この情報はOAuth 2アプリケーションにカプセル化されているので、クライアントコードはリクエストするサーバーの場所を気にする必要はない。 セルフホスト環境では、OAuthアプリケーションのユーザーエージェントの `client-extension.yaml` プロパティで、 `.serviceAddress` と `.serviceScheme`として宣言されます。 LXC環境では、リソースサーバーはLiferayによって制御されるので、その場所を宣言する必要はありません。 これにより、クライアントとリソース・サーバーの通信のための認可コード・フローが設定されるので、あとはクライアントがリソース・サーバーのエンドポイントを呼び出すだけです。 `DadJoke.js` `/dad/joke` ルートからこのようにフェッチする：

```js
React.useEffect(() => {
   oAuth2Client
      ?.fetch('/dad/joke')
      .then((response) => response.text())
      .then((joke) => {
         setJoke(joke);
      })
      .catch((error) => console.log(error));
}, []);
```

<!-- Greg 
I think it would be good I think to show the request coming into the RestController and explain a bit about the JWT that is available there (representing the user)
     Russ
I'm leaving this comment because Greg hasn't validated the below text.
-->

OAuth クライアントは、認証されたユーザーを表す `Jwt` トークンをマイクロサービスに送信します。 認証コード、許可された権限、その他多くの詳細が含まれる。 このサンプルは、便宜上これらの詳細をログに出力する：

```log
2023-06-08 16:01:42.617  INFO 3851009 --- [io-58081-exec-5] c.liferay.sample.DadJokeRestController   : JWT Claims: {sub=20123, grant_type=authorization_code, authorization_code=404dd760ffcaa322fd38387319941990e5e10bb2d97ab360e63271f613eb33f1, scope=Liferay.Headless.Admin.Workflow.everything, iss=localhost, exp=2023-06-08T20:10:51Z, iat=2023-06-08T20:00:51Z, jti=8ffd31c001c54b1331d484731ff1e43b341dd4cb7232b98da96a4aaec6b6a6d, client_id=id-60ac3dc8-f5e8-484e-25b3-23d435e838c6, code_verifier=~zACCmEV6ZuhZHAZ0Q.RaEvGo5YUMF6x2QimtgT4lgXjWB6_Jc0QtVDNrtnxeOTfondPxH4pwxY0aAI-Op0oz1vajQTTqhrNegJnSZ4vLEBZGgE9m5Jgmi3ORDy1Bg7Q, username=test@liferay.com}
2023-06-08 16:01:42.618  INFO 3851009 --- [io-58081-exec-5] c.liferay.sample.DadJokeRestController   : JWT ID: 8ffd31c001c54b1331d484731ff1e43b341dd4cb7232b98da96a4aaec6b6a6d
2023-06-08 16:01:42.618  INFO 3851009 --- [io-58081-exec-5] c.liferay.sample.DadJokeRestController   : JWT Subject: 20123
```