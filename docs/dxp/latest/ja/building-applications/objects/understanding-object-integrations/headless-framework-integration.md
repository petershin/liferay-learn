# ヘッドレスフレームワークの統合

> 対応可能：Liferay DXP/Portal 7.4以降

オブジェクトを公開すると、Liferayは自動的にそのためのREST APIを生成します。 これにより、カスタムオブジェクトにヘッドレスでアクセスできるようになり、CRUD操作を実行できるようになります。 オブジェクト用に生成されたAPIは、その範囲（つまり、CompanyまたはSite）によって異なります。 <!--TASK: replace first sentence when GraphQL APIs are supported, "When you publish an Object, Liferay automatically generates both REST and \[GraphQL\](https://graphql.org) APIs for it."--> すべてのオブジェクトは、`c/[pluralobjectlabel]`命名パターン（`c/timeoffrequests`など）を使用します。 各オブジェクトエントリースキーマには、オブジェクトのすべてのフィールドとリレーションシップが含まれています。

オブジェクトのAPIは、Liferay API Explorerを介して`[server]:[port]/o/api`（例：`localhost:8080/o/api`）で表示およびテストできます。 REST APIは、 ［**REST Applications**］ の下にリストされています。 <!--TASK: uncomment when GraphQL APIs are supported, "Click on **GraphQL** to access Liferay's \[Graph **i** QL\](https://github.com/graphql/graphiql) browser."--> 関連するオブジェクトのチュートリアルについては、 [APIの使用](../objects-tutorials/using-apis.md) を参照してください。

## オブジェクトREST APIs

[REST API](../../../headless-delivery/consuming-apis/consuming-rest-services.md)を使用すると、オブジェクトエントリーに対して単一およびバッチの両方のCRUD操作を実行できます。 [集約用語](../objects-tutorials/using-apis/using-aggregation-terms-with-rest-apis.md)と[ネストされたフィールド](../objects-tutorials/using-apis/using-nested-fields-with-rest-apis.md)を使って、複雑なクエリを実行することもできます。

![各オブジェクトは［REST Applications］の下に表示されます。](./headless-framework-integration/images/01.png)

すべてのエンドポイントとJavaメソッドは、オブジェクトの名前を使用します。 以下の例では、`ObjectName`と`objectName`をオブジェクトの名前に置き換えてください。

```{important}
Liferay DXP 7.4 GA1では、選択リストフィールドの値は、オブジェクトAPIコールで以下のフォーマットを使用する必要があります。`"samplePicklist":"string"`です。 Liferay DXP 7.4 U1では、フォーマットが変更され、値はこのフォーマットを使用する必要があります。`"samplePicklist":{"key":"string"}`.
```

### 会社に範囲指定されているオブジェクト

次のREST APIは、すべての会社に範囲指定されているオブジェクトで使用できます。

| HTTP メソッド | HTTPエンドポイント                                           | Javaメソッド                        | 説明                                                                  |
|:--------- |:----------------------------------------------------- |:------------------------------- |:------------------------------------------------------------------- |
| DELETE    | `/by-external-reference-code/{externalReferenceCode}` | `deleteByExternalReferenceCode` | 外部参照コードを使用して、指定されたオブジェクトエントリーを削除します                                 |
| GET       | `/by-external-reference-code/{externalReferenceCode}` | `getByExternalReferenceCode`    | 外部参照コードを使用して、指定されたオブジェクトエントリーの詳細を返します                               |
| PUT       | `/by-external-reference-code/{externalReferenceCode}` | `putByExternalReferenceCode`    | 指定されたオブジェクトエントリーの詳細を、外部参照コードを使用してAPI呼び出しで提供されたものに置き換えます             |
| GET       | `/`                                                   | `getObjectNamePage`             | Liferayインスタンスのオブジェクトエントリーの完全なリストを返します。結果は、ページ分割、絞り込み、検索、およびソートが可能です |
| POST      | `/`                                                   | `postObjectName`                | APIコールで提供された詳細を使用して、新しいオブジェクトエントリーを作成します                            |
| DELETE    | `/batch`                                              | `deleteObjectNameBatch`         | 複数のオブジェクトエントリーを削除します                                                |
| POST      | `/batch`                                              | `postObjectNameBatch`           | API呼び出しで提供された詳細を使用して複数のオブジェクトエントリーを作成します                            |
| PUT       | `/batch`                                              | `putObjectNameBatch`            | API呼び出しで提供された詳細を使用して、複数のオブジェクトエントリーを置き換えます                          |
| DELETE    | `/{objectNameId}`                                     | `deleteObjectName`              | 指定されたオブジェクトエントリーを削除し、操作が成功した場合は204を返します                             |
| GET       | `/{objectNameId}`                                     | `getObjectName`                 | 指定されたオブジェクトエントリーの詳細を返します                                            |
| PATCH     | `/{objectNameId}`                                     | `patchObjectName`               | 指定されたオブジェクトエントリーのAPI呼び出しで指定されたフィールドを更新します。他のフィールドは変更されません           |
| PUT       | `/{objectNameId}`                                     | `putObjectName`                 | 指定されたオブジェクトエントリーの詳細を、API呼び出しで提供されたものに置き換えます                         |

### サイトに範囲指定されたオブジェクト

次のREST APIは、すべてのサイトに範囲指定されているオブジェクトで使用できます。

| HTTP メソッド | HTTPエンドポイント                                                             | Javaメソッド                                     | 説明                                                               |
|:--------- |:----------------------------------------------------------------------- |:-------------------------------------------- |:---------------------------------------------------------------- |
| DELETE    | `/scopes/{scopeKey}/by-external-reference-code/{externalReferenceCode}` | `deleteScopeScopeKeyByExternalReferenceCode` | スコープキーと外部参照コードを使用して、指定されたオブジェクトエントリーを削除します                       |
| GET       | `/scopes/{scopeKey}/by-external-reference-code/{externalReferenceCode}` | `getScopeScopeKeyByExternalReferenceCode`    | スコープキーと外部参照コードを使用して、指定されたオブジェクトエントリーの詳細を返します                     |
| PUT       | `/scopes/{scopeKey}/by-external-reference-code/{externalReferenceCode}` | `putScopeScopeKeyByExternalReferenceCode`    | 指定されたオブジェクトエントリーの詳細を、そのスコープキーと外部参照コードを使用してAPI呼び出しで提供されたものに置き換えます |
| GET       | `/scopes/{scopesKey}`                                                   | `getScopeScopeKeyPage`                       | サイトのオブジェクトエントリーの完全なリストを返します。結果は、ページ分割、絞り込み、検索、およびソートが可能です        |
| POST      | `/scopes/{scopesKey}`                                                   | `postScopeScopeKey`                          | API呼び出しで提供された詳細を使用して、指定されたサイトに新しいオブジェクトエントリーを作成します               |
| DELETE    | `/{objectNameId}`                                                       | `deleteObjectName`                           | 指定されたオブジェクトエントリーを削除します                                           |
| GET       | `/{objectNameId}`                                                       | `getObjectName`                              | 指定されたオブジェクトエントリーの詳細を返します                                         |
| PATCH     | `/{objectNameId}`                                                       | `patchObjectName`                            | 指定されたオブジェクトエントリーのAPI呼び出しで指定されたフィールドを更新します。他のフィールドは変更されません        |
| PUT       | `/{objectNameId}`                                                       | `putObjectName`                              | 指定されたオブジェクトエントリーの詳細を、API呼び出しで提供されたものに置き換えます                      |

```{note}
APIの `scopesKey`パラメーターには、目的のデータスコープの適切な識別子（サイトID、ユーザーロールなど）を使用します。
```

<!--TASK: uncomment when GraphQL APIs are supported, 
## Object GraphQL APIs

With the GraphQL APIs, you can both query and mutate Object data. All APIs for custom Objects are listed under `c` in Liferay's GraphQL schema. You can use Liferay's integrated Graph **i** QL IDE to search Object schemas, draft queries, run requests, and more. To access it, go to Liferay's API Explorer at `[server]:[port]/o/api` (e.g., `localhost:8080/o/api`) and click **GraphQL** .

![Use Liferay's GraphiQL explorer to search Object schemas and run your requests.](./headless-framework-integration/images/02.png)

See [Consuming GraphQL APIs](../../../headless-delivery/consuming-apis/consuming-graphql-apis.md) for more information.
-->

## 追加情報

* [RESTサービスの使用](../../../headless-delivery/consuming-apis/consuming-rest-services.md)
* [Using APIs](../objects-tutorials/using-apis.md) <!--TASK: * \[Consuming GraphQL APIs\](../../../headless-delivery/consuming-apis/consuming-graphql-apis.md) -->
