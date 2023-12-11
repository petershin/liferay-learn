# カスタム・データ・スキーマの定義

チケッティング・アプリケーションには、カスタム・データ・フィールドとセレクションが必要です。 Liferay [オブジェクト](../../../building-applications/objects.md) と [ピックリスト](../../../building-applications/objects/picklists.md) を使ってカスタムデータスキーマを定義します。

## カスタム・ピックリストの作成

ピックリストは、ユーザーが選択できる値のあらかじめ決められたリストです。 ピックリストは、チケットステータス、チケットタイプ、チケットプライオリティなどのカスタムフィールドに必要です。

### カスタムピックリストを配置する

以下のコマンドで `liferay-ticket-batch-list-type-definition` クライアント拡張をデプロイする：

```bash
./gradlew :client-extensions:liferay-ticket-batch-list-type-definition:deploy
```

コントロールパネル_ &rarr; _Picklists_に移動します。 5つの新しいピックリストが作成されたことを確認してください。

![Five new picklists have been created.](./defining-a-custom-data-schema/images/01.png)

### カスタム・ピックリストのコードを調べる

各クライアント拡張プロジェクトは `client-extension.yaml` ファイルによって定義される。 最初のセクションでは、デプロイ可能な `.zip` ファイルに含まれるファイルを指定する `assemble` ブロックを定義する。 このクライアント・エクステンションの `assemble` ブロックは次のようになる：

```yaml
assemble:
    - from: batch
      into: batch
```

詳しくは [Assembling Client Extensions](../../../building-applications/client-extensions/working-with-client-extensions.md#assembling-client-extensions) を参照してください。

この `list-type-batch` クライアント拡張は [バッチタイプ](../../../building-applications/client-extensions/batch-client-extensions.md) クライアント拡張である。 これは次のように定義されている：

```yaml
liferay-ticket-batch-list-type-definition:
    name: Liferay Ticket Batch List Type Definition
    oAuthApplicationHeadlessServer: liferay-ticket-batch-list-type-definition-oauth-application-headless-server
    type: batch
```

各プロパティの説明は [Batch YAML Configuration Reference](../../../building-applications/client-extensions/batch-client-extensions/batch-yaml-configuration-reference.md) を参照。

クライアント拡張は、 [バッチエンジンヘッドレスAPI](../../../headless-delivery/consuming-apis/batch-engine-api-basics-importing-data.md) と、 [ピックリストヘッドレスAPI](../../../building-applications/objects/picklists/picklists-api-basics.md) を利用します。 セキュアなAPIリクエストを行うために、クライアント・エクステンションはOAuth2認証を使用するように設定されている。 これは次のように定義されている：

```yaml
liferay-ticket-batch-list-type-definition-oauth-application-headless-server:
    .serviceAddress: localhost:8080
    .serviceScheme: http
    name: Liferay Ticket Batch List Type Definition OAuth Application Headless Server
    scopes:
        - Liferay.Headless.Admin.List.Type.everything
        - Liferay.Headless.Batch.Engine.everything
    type: oAuthApplicationHeadlessServer
```

`Liferay.Headless.Admin.List.Type`リソースと `Liferay.Headless.Batch.Engine`リソースには完全なCRUDアクセスが与えられていることに注意してください。

完全な定義については [`client-extension.yaml`](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-ticket-workspace/client-extensions/liferay-ticket-batch-list-type-definition/client-extension.yaml) を参照のこと。

5つのピックリストとその選択項目は、クライアントエクステンションの `/batch/` フォルダにあるJSONファイルに定義されています。 完全な定義については、 [`list-type-definition.batch-engine-data.json`](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-ticket-workspace/client-extensions/liferay-ticket-batch-list-type-definition/batch/list-type-definition.batch-engine-data.json) ファイルを参照のこと。

## カスタムオブジェクトの作成

ピックリストが定義されると、アプリケーションのカスタムオブジェクトを作成することができます。

### カスタムオブジェクトのデプロイ

以下のコマンドで `liferay-ticket-batch-object-definition` クライアント拡張をデプロイする：

```bash
./gradlew :client-extensions:liferay-ticket-batch-object-definition:deploy
```

Liferayで_Control Panel_ &rarr; _Objects_に移動します。 新しいチケットオブジェクトが作成されたことを確認します。

![A new ticket object has been created.](./defining-a-custom-data-schema/images/02.png)

### カスタム・オブジェクト・コードを調べる

この `liferay-ticket-batch-object-definition` クライアント拡張は [バッチタイプ](../../../building-applications/client-extensions/batch-client-extensions.md) クライアント拡張でもある。 クライアント拡張のYAMLファイルは
`liferay-ticket-batch-list-type-definition` クライアント拡張と同じように定義されます。 各プロパティの説明は [バッチ YAML コンフィギュレーション・リファレンス](../../../building-applications/client-extensions/batch-client-extensions/batch-yaml-configuration-reference.md) を参照。

完全な定義は [client-extension.yaml](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-ticket-workspace/client-extensions/liferay-ticket-batch-object-definition/client-extension.yaml) を参照のこと。

カスタムチケットオブジェクトは、クライアントエクステンションの `/batch/` フォルダにある JSON ファイルで定義されます。 完全な定義については、 [`object-definition.batch-engine-data.json`](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-ticket-workspace/client-extensions/liferay-ticket-batch-object-definition/batch/object-definition.batch-engine-data.json) ファイルを参照のこと。

## APIによるチケットデータの生成

カスタムチケットオブジェクトが完成すると、Liferay内で新しいチケットエントリを作成することができます。 また、オブジェクトのREST APIを使ってインポートすることもできる。

以下のコマンドを実行して、チケットエントリーを生成してください：

```bash
./gradlew :client-extensions:liferay-ticket-batch-object-entry:deploy
```

Liferay の _Control Panel_ &rarr; _Tickets_ に移動します。 新しいチケットエントリーが作成されたことを確認してください。

![A new ticket entry has been created.](./defining-a-custom-data-schema/images/03.png)

次へ [カスタムテーマ](./applying-a-custom-theme.md) をチケットシステムに適用します。

## 関連コンセプト

* [オブジェクトの作成と管理](../../../building-applications/objects/creating-and-managing-objects.md) 
* [ピックリストの作成](../../../building-applications/objects/picklists/creating-picklists.md) 
* [バッチクライアント拡張](../../../building-applications/client-extensions/batch-client-extensions.md) 
