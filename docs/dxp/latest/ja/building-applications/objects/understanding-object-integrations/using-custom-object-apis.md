# ヘッドレスフレームワークの統合

{bdg-secondary}`Liferay 7.4+`

カスタムオブジェクトの定義を公開すると、Liferayはオブジェクトとそのデータと連携するためのデフォルトの [REST APIs](../../../headless-delivery/consuming-apis/consuming-rest-services.md) を生成します。 これらのAPIは、オブジェクトのスコープ（会社やサイトなど）に応じて異なります。 定義にリレーションシップやスタンドアロンアクションが含まれている場合、Liferayはそれらを呼び出すためのエンドポイントも生成します。

これらのヘッドレスサービスのパスは、 `c/[pluralobjectlabel]` の命名パターン（例： `/o/c/timeoffrequests`）に従います。 利用可能なオブジェクトのAPIは、LiferayAPIエクスプローラーを介して`[server]:[port]/o/api`（例：`localhost:8080/o/api`）で表示およびテストできます。 ［**REST Applications**］ をクリックすると、APIのドロップダウンリストが表示されます。

![各オブジェクトは［REST Applications］の下に表示されます。](./using-custom-object-apis/images/01.png)

オブジェクトが有効である間は、これらのAPIを使用して、基本的なCRUD操作、 [集計用語](../objects-tutorials/using-apis/using-aggregation-terms-with-rest-apis.md)と[入れ子フィールド](../objects-tutorials/using-apis/using-nestedfields-to-query-related-entries.md)を使用した複雑なクエリの実行、スタンドアロンアクションのトリガー、エントリーリレーションシップの管理などを実行できます。 オブジェクトAPIのチュートリアルについては、 [APIの使用](../objects-tutorials/using-apis.md) を参照してください。

## デフォルトの会社スコープのREST API

デフォルトのREST APIは、すべての会社に範囲指定されているオブジェクトで使用できます。 Javaのメソッドについては、 `ObjectName`をオブジェクトの名前に置き換えます。

| HTTP メソッド | HTTPエンドポイント                         | Javaメソッド                        | 説明                                                            |
|:--------- |:----------------------------------- |:------------------------------- |:------------------------------------------------------------- |
| DELETE    | `/by-external-reference-code/{erc}` | `deleteByExternalReferenceCode` | 指定されたエントリーを削除し、操作が成功した場合は204を返します                             |
| GET       | `/by-external-reference-code/{erc}` | `getByExternalReferenceCode`    | 指定されたエントリーの詳細を返します                                            |
| PATCH     | `/by-external-reference-code/{erc}` | `patchByExternalReferenceCode`  | 指定されたエントリーを更新します。API呼び出しに含まれるフィールドのみが変更されます                   |
| PUT       | `/by-external-reference-code/{erc}` | `putByExternalReferenceCode`    | 指定されたエントリーの詳細をAPI呼び出しで提供されたものに置き換えます                          |
| GET       | `/`                                 | `getObjectNamePage`             | Liferayインスタンスのエントリーの完全なリストを返します。結果は、ページ分割、絞り込み、検索、およびソートが可能です |
| POST      | `/`                                 | `postObjectName`                | API呼び出しで提供された詳細を使用して、新しいエントリーを作成します                           |
| DELETE    | `/batch`                            | `deleteObjectNameBatch`         | 複数のエントリーを削除し、操作が成功した場合は204を返します                               |
| POST      | `/batch`                            | `postObjectNameBatch`           | API呼び出しで提供された詳細を使用して複数のエントリーを作成します                            |
| PUT       | `/batch`                            | `putObjectNameBatch`            | API呼び出しで提供された詳細を使用して複数のエントリーを置き換えます                           |
| DELETE    | `/{entryId}`                        | `deleteObjectName`              | 指定されたエントリーを削除し、操作が成功した場合は204を返します                             |
| GET       | `/{entryId}`                        | `getObjectName`                 | 指定されたエントリーの詳細を返します                                            |
| PATCH     | `/{entryId}`                        | `patchObjectName`               | 指定されたエントリーを更新します。API呼び出しに含まれるフィールドのみが変更されます                   |
| PUT       | `/{entryId}`                        | `putObjectName`                 | 指定されたエントリーの詳細をAPI呼び出しで提供されたものに置き換えます                          |

```{note}
バッチ操作は、会社スコープのオブジェクトに対してのみ利用可能です。
```

## デフォルトのサイトスコープのREST API

デフォルトのREST APIは、すべてのサイトに範囲指定されているオブジェクトで使用できます。 Javaのメソッドについては、 `ObjectName`をオブジェクトの名前に置き換えます。

| HTTP メソッド | HTTPエンドポイント                                           | Javaメソッド                                     | 説明                                                        |
|:--------- |:----------------------------------------------------- |:-------------------------------------------- |:--------------------------------------------------------- |
| DELETE    | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | `deleteScopeScopeKeyByExternalReferenceCode` | 指定されたエントリーを削除し、操作が成功した場合は204を返します                         |
| GET       | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | `getScopeScopeKeyByExternalReferenceCode`    | 指定されたエントリーの詳細を返します                                        |
| PATCH     | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | `patchScopeScopeKeyByExternalReferenceCode`  | 指定されたエントリーを更新します。API呼び出しに含まれるフィールドのみが変更されます               |
| PUT       | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | `putScopeScopeKeyByExternalReferenceCode`    | 指定されたエントリーの詳細をAPI呼び出しで提供されたものに置き換えます                      |
| GET       | `/scopes/{scopeKey}`                                  | `getScopeScopeKeyPage`                       | 指定されたスコープのエントリーの完全なリストを返します。結果は、ページ分割、絞り込み、検索、およびソートが可能です |
| POST      | `/scopes/{scopeKey}`                                  | `postScopeScopeKey`                          | API呼び出しで提供された詳細を使用して、指定された範囲に新しいエントリーを作成します               |
| DELETE    | `/{entryId}`                                          | `deleteObjectName`                           | 指定されたエントリーを削除し、操作が成功した場合は204を返します                         |
| GET       | `/{entryId}`                                          | `getObjectName`                              | 指定されたエントリーの詳細を返します                                        |
| PATCH     | `/{entryId}`                                          | `patchObjectName`                            | 指定されたエントリーを更新します。API呼び出しに含まれるフィールドのみが変更されます               |
| PUT       | `/{entryId}`                                          | `putObjectName`                              | 指定されたエントリーの詳細をAPI呼び出しで提供されたものに置き換えます                      |

```{note}
`scopesKey`には、目的のデータスコープの適切な識別子（サイトID、ユーザーロールなど）を使用します。
```

## リレーションシップREST API

{bdg-secondary}`Liferay 7.4 U70+/GA70+`

オブジェクト間に1対多、多対多のリレーションシップを定義すると、Liferayはエントリーリレーションシップを照会、管理するためのエンドポイントを生成します。 これには、関連するオブジェクトのエントリーを返すためのGETエンドポイント、エントリーを関連付けるためのPUTエンドポイント、関連するエントリーの関連付けを解除するためのDELETEエンドポイントが含まれます。 [Using Relationship APIs](../objects-tutorials/using-apis/using-relationship-rest-apis.md) をご参照ください。

HTTPエンドポイントでは、 `relationshipName` をリレーションシップの名前（例： `userToTicket`）に置き換えます。 各リレーションシップAPIのJavaメソッドは、メソッド＋カレントオブジェクト＋リレーションシップ名＋関連オブジェクトという命名パターンに従っています（例： `getTicketUserToTicketUserPage`、 `deleteTicketUserToTicketUser`)。

| HTTP メソッド | HTTPエンドポイント                                                       | 説明                                           |
|:--------- |:----------------------------------------------------------------- |:-------------------------------------------- |
| GET       | `/{entryId}/relationshipName`                                     | 指定されたエントリーに関連するすべてのエントリーを、リレーションシップを通じて返します。 |
| PUT       | `/{entryId}/relationshipName/{relatedEntryId}`                    | 指定されたオブジェクトエントリーを関連付けるために、リレーションシップを使用します。   |
| PUT       | `/by-external-reference-code/{erc}/relationshipName/{relatedERC}` | 指定されたオブジェクトエントリーを関連付けるために、リレーションシップを使用します。   |
| DELETE    | `/{entryId}/relationshipName/{relatedEntryId}`                    | 指定されたオブジェクトエントリーの関連付けを解除します                  |

サイトに範囲指定されたオブジェクトの場合、ERC エンドポイントには `/scope/{scopeKey}` のプレフィックス（例： `/scope/{scopeKey}/by-external-reference-code/{erc}/relationshipName/{relatedERC}`）が含まれます。 システムオブジェクトでは、外部参照コードのエンドポイントは利用できません。

```{tip}
専用のリレーションシップAPIに加えて、`nestedFields`クエリパラメータをオブジェクトの他のGET APIと組み合わせて使用すると、エントリーとその関連エントリーを返すことができます。 このパラメータを使用する場合、出力に含めたいリレーションシップの名前を指定する必要があります（例：`nestedFields=ticketAssignee`など）。 詳細と入門チュートリアルについては [`nestedFields` を使って関連するエントリーをクエリーする。](../objects-tutorials/using-apis/using-nestedfields-to-query-related-entries.md) を参照してください。
```

## スタンドアロンアクションREST API

{bdg-secondary}`Liferay 7.4 U60+/GA60+`

公開オブジェクトにスタンドアロンアクションを定義すると、Liferayはエントリーでアクションをトリガーするための2つのエンドポイントを生成します。 一つはエントリーのIDを使用し、もう一つはエントリーの外部参照コード（ERC）を使用します。 詳しくは、 [手動アクションの使用](../creating-and-managing-objects/actions/using-manual-actions.md) をご覧ください。

| HTTP メソッド | HTTPエンドポイント                                                   | Javaメソッド                  |
|:--------- |:------------------------------------------------------------- |:------------------------- |
| PUT       | `/by-external-reference-code/{erc}/object-actions/actionName` | `putObjectNameActionName` |
| PUT       | `/{entryId}/object-actions/actionName`                        | `putObjectNameActionName` |

サイトに範囲指定されたオブジェクトの場合、ERC エンドポイントには `/scope/{scopeKey}` のプレフィックス（例： `/scopes/{scopeKey}/by-external-reference-code/{erc}/object-actions/actionName`)が含まれます。

<!--TASK: uncomment when GraphQL APIs are better supported, 
## GraphQL APIs

With the GraphQL APIs, you can both query and mutate object data. All APIs for custom objects are listed under `c` in Liferay's GraphQL schema. You can use Liferay's integrated Graph*i*QL IDE to search object schemas, draft queries, run requests, and more. To access it, go to Liferay's API Explorer at `[server]:[port]/o/api` (e.g., `localhost:8080/o/api`) and click *GraphQL*.

![Use Liferay's GraphiQL explorer to search object schemas and run your requests.](./using-custom-object-apis/images/02.png)

See [Consuming GraphQL APIs](../../../headless-delivery/consuming-apis/consuming-graphql-apis.md) for more information.
-->

## 関連トピック

* [RESTサービスの使用](../../../headless-delivery/consuming-apis/consuming-rest-services.md)
* [APIの使用](../objects-tutorials/using-apis.md)
<!--TASK: * \[Consuming GraphQL APIs\](../../../headless-delivery/consuming-apis/consuming-graphql-apis.md) -->
