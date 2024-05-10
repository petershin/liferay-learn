# MuleSoftコネクタの設定

Liferay の MuleSoft へのコネクタは、Liferay の API を記述した OpenAPI 3.0 ドキュメントを使用しています。 各OpenAPIドキュメントは、以下のスキーマでLiferayインスタンスに動的にデプロイされます。

```bash
http://[host]:[port]/o/[headless-api-app-name]/[version]/openapi.json
```

これらのドキュメントは、デプロイされたRESTful Webサービスに基づいているため、APIを最も正確に記述することができます。 Liferay API の詳細については [APIの使用](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis) .

OpenAPI ドキュメントのエンドポイントを指定すると、OpenAPI ドキュメントで定義されたパス、パス/クエリー パラメーター、およびエンティティ メタデータがコネクタに自動的に設定されます。 このコネクタは、Liferayの標準に従ったOpenAPI 3.0のドキュメントで動作し、すべてのLiferay APIをサポートします。

## Muleプロジェクトにコネクタを追加する

コネクタを設定する前に、Muleプロジェクトにコネクタを追加する必要があります。

1. Mule Palette の **Search in Exchange** をクリックします。

1. **Liferay** を検索してください。

1. コネクタを選択し、 **Add** をクリックします。

1. ［**Finish**］ をクリックします。

これで、Muleプロジェクトにコネクタが表示されるようになりました。

![OAuth2の設定で、Client ProfileをHeadless Serverとして設定します。](./configuring-the-mulesoft-connector/images/01.gif)

## コネクタの構成

1. 認証方式を選択し、必要なパラメータを入力します。

1. OpenAPIドキュメントエンドポイントを指定する。

### 認証

認証方法は、 **Basic** と **OAuth2** からお選びください。

**Basic Authentication** : ユーザー名とパスワードを入力します。

**OAuth2** : クライアントキーとクライアントシークレットを入力します。

本番環境では、 [OAuth 2.0を使用する](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2) によってユーザーを認証する必要があります。 基本認証は、基本的なテストとデモンストレーションのためにのみ提供されます。

Liferay で OAuth2 を設定する際、Client Profile で **Headless Server** を選択します。 Liferay は、コネクタで使用するためのクライアント ID（コンシューマーキー）とクライアントシークレット（コンシューマーシークレット）を生成します。

![OAuth2の設定で、Client ProfileをHeadless Serverとして設定します。](./configuring-the-mulesoft-connector/images/02.png)

OAuth2 認証でエンドポイントを使うには、 [OAuth 2のスコープ](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2/oauth2-scopes) を必要な認証オプションで定義する必要もあります (例: `everything`, `everything.write`, or `everything.read`) 。

詳しい設定方法は [OAuth2アプリケーションの作成](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2/creating-oauth2-applications) を、OAuth2 を使った React アプリケーションのサンプルは [OAuth2によるユーザーの認証](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2/using-oauth2-to-authorize-users) をご覧ください。

### OpenAPIドキュメントエンドポイントの指定

認証されたら、OpenAPI文書のエンドポイントを設定し、使用するLiferay APIを指定します。 例えば、本書はCommerce Admin Catalog APIを対象としています。

```bash
http://[host]:[port]/o/headless-commerce-admin-catalog/v1.0/openapi.json
```

この値を設定するには、 `Liferay_Config` グローバル要素を編集し、 **OpenAPI Spec URL** フィールドにドキュメントエンドポイントを入力します。

![Open API Spec URL 欄に OpenAPI ドキュメントエンドポイントを入力します。](./configuring-the-mulesoft-connector/images/03.png)

また、XMLコンフィギュレーションを使用しても可能です。 `Liferay_Config` グローバル要素を右クリックし、 **Go to XML** を選択します。 次に、認証方法に応じた適切なフォーマットで認証情報を入力します。

* 基本認証の例です。

   ```xml
    <liferay:config name="Liferay_Config_Catalog">
    <liferay:basic-connection username=${username} password=${password} openApiSpecPath="http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/openapi.json" />
    </liferay:config>
   ```

* OAuth 2.0の例。

   ```xml
    <liferay:config name="Liferay_Config_Catalog">
    <liferay:oauth2-connection consumerKey="${consumerKey}" consumerSecret=${consumerSecret} openApiSpecPath="http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/openapi.json" />
    </liferay:config>
   ```

**接続テスト** をクリックします。 成功すると、コネクタを使用したフローの構築を開始できます。 そうでない場合は、設定を見直してください。

## 関連トピック

* [Muleのフローをデザインする](./designing-mule-flows.md)
* [APIの使用](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis)
* [OAuth 2.0を使用する](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2)
