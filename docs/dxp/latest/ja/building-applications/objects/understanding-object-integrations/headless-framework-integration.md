# ヘッドレスフレームワークの統合

{bdg-secondary}`Liferay DXP/Portal 7.4以降で利用可能`

カスタムオブジェクトの定義を公開すると、Liferayはオブジェクトとそのデータと対話するためのデフォルトの [REST APIs](../../../headless-delivery/consuming-apis/consuming-rest-services.md) を生成します。 これらのAPIは、オブジェクトのスコープ(会社やサイトなど）に応じて異なります。 定義にリレーションシップやスタンドアロンアクションが含まれている場合、Liferayはそれらを呼び出すためのエンドポイントも生成します。

これらのヘッドレスサービスのパスは、 `c/[pluralobjectlabel]` の命名パターン(例： `/o/c/timeoffrequests`）に従います。 利用可能なオブジェクトAPIは、Liferay API Explorerの `[server]:[port]/o/api` (例： `localhost:8080/o/api`）で確認・テストできます。 **REST Applications** をクリックすると、API のドロップダウン・リストが表示されます。

![各オブジェクトは、「REST Applications」の下に表示されます。](./headless-framework-integration/images/01.png)

オブジェクトがアクティブな間は、これらのAPIを使用して、基本的なCRUD操作、 [集約項](../objects-tutorials/using-apis/using-aggregation-terms-with-rest-apis.md) と [入れ子フィールド](../objects-tutorials/using-apis/using-nested-fields-with-rest-apis.md)を使用した複雑なクエリの実行、スタンドアロンアクションのトリガー、エントリ関係の管理などを実行できます。 オブジェクトAPIのチュートリアルについては、 [APIの使用](../objects-tutorials/using-apis.md) を参照してください。

## デフォルトのカンパニースコープ付きREST API

デフォルトのREST APIは、すべてのcompany-scopedオブジェクトで利用可能です。 Javaのメソッドについては、 `ObjectName` をオブジェクトの名前に置き換えてください。

| HTTP メソッド | HTTPエンドポイント                         | Javaメソッド                        | 説明                                                             |
|:--------- |:----------------------------------- |:------------------------------- |:-------------------------------------------------------------- |
| DELETE    | `/by-external-reference-code/{erc}` | `deleteByExternalReferenceCode` | 指定されたエントリーを削除し、成功した場合は 204 を返す。                                |
| GET       | `/by-external-reference-code/{erc}` | `getByExternalReferenceCode`    | 指定されたエントリーの詳細を返します。                                            |
| PATCH     | `/by-external-reference-code/{erc}` | `patchByExternalReferenceCode`  | 指定されたエントリーを更新します。APIコールに含まれるフィールドのみが変更されます。                    |
| PUT       | `/by-external-reference-code/{erc}` | `putByExternalReferenceCode`    | 指定されたエントリーの詳細をAPIコールで提供されたものに置き換える。                            |
| GET       | `/`                                 | `getObjectNamePage`             | Liferayインスタンスのエントリーの完全なリストを返します。結果をページ分割、フィルター、検索、ソートすることができます |
| POST      | `/`                                 | `postObjectName`                | APIコールで提供された詳細を使用して、新しいエントリーを作成します。                            |
| DELETE    | `/batch`                            | `deleteObjectNameBatch`         | 複数のエントリーを削除し、操作に成功した場合は204を返す                                  |
| POST      | `/batch`                            | `postObjectNameBatch`           | APIコールで提供された詳細を使用して、複数のエントリーを作成します。                            |
| PUT       | `/batch`                            | `putObjectNameBatch`            | APIコールで提供された詳細を使用して、複数のエントリーを置き換える                             |
| DELETE    | `/{entryId}`                        | `deleteObjectName`              | 指定されたエントリーを削除し、成功した場合は 204 を返す。                                |
| GET       | `/{entryId}`                        | `getObjectName`                 | 指定されたエントリーの詳細を返します。                                            |
| PATCH     | `/{entryId}`                        | `patchObjectName`               | 指定されたエントリーを更新します。APIコールに含まれるフィールドのみが変更されます。                    |
| PUT       | `/{entryId}`                        | `putObjectName`                 | 指定されたエントリーの詳細をAPIコールで提供されたものに置き換える。                            |

```{note}
バッチオペレーションは、カンパニースコープのオブジェクトに対してのみ利用可能です。
```

## デフォルトのサイトスコープ型REST APIs

デフォルトのREST APIは、すべてのサイトスコピックオブジェクトで利用可能です。 Javaのメソッドについては、 `ObjectName` をオブジェクトの名前に置き換えてください。

| HTTP メソッド | HTTPエンドポイント                                           | Javaメソッド                                     | 説明                                                       |
|:--------- |:----------------------------------------------------- |:-------------------------------------------- |:-------------------------------------------------------- |
| DELETE    | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | `deleteScopeScopeKeyByExternalReferenceCode` | 指定されたエントリーを削除し、成功した場合は 204 を返す。                          |
| GET       | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | `getScopeScopeKeyByExternalReferenceCode`    | 指定されたエントリーの詳細を返します。                                      |
| PATCH     | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | `patchScopeScopeKeyByExternalReferenceCode`  | 指定されたエントリーを更新します。APIコールに含まれるフィールドのみが変更されます。              |
| PUT       | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | `putScopeScopeKeyByExternalReferenceCode`    | 指定されたエントリーの詳細をAPIコールで提供されたものに置き換える。                      |
| GET       | `/scopes/{scopeKey}`                                  | `getScopeScopeKeyPage`                       | 指定されたスコープ内のエントリーの完全なリストを返します。結果のページ分割、フィルター、検索、ソートが可能です。 |
| POST      | `/scopes/{scopeKey}`                                  | `postScopeScopeKey`                          | APIコールで提供された詳細を使用して、指定されたスコープに新しいエントリーを作成します。            |
| DELETE    | `/{entryId}`                                          | `deleteObjectName`                           | 指定されたエントリーを削除し、成功した場合は 204 を返す。                          |
| GET       | `/{entryId}`                                          | `getObjectName`                              | 指定されたエントリーの詳細を返します。                                      |
| PATCH     | `/{entryId}`                                          | `patchObjectName`                            | 指定されたエントリーを更新します。APIコールに含まれるフィールドのみが変更されます。              |
| PUT       | `/{entryId}`                                          | `putObjectName`                              | 指定されたエントリーの詳細をAPIコールで提供されたものに置き換える。                      |

```{note}
scopeKey`には、希望するデータスコープの適切な識別子(例：サイトIDやユーザーロール）を使用します。
```

## リレーションシップREST APIs

{bdg-secondary}`利用可能 Liferay 7.4 U70+/GA70+`

オブジェクト間に1対多、多対多の関係を定義すると、Liferayはエントリ関係を照会、管理するためのエンドポイントを生成します。 これには、関連するオブジェクトのエントリーを返すためのGETエンドポイント、エントリーを関連付けるためのPUTエンドポイント、関連するエントリーの関連付けを解除するためのDELETEエンドポイントが含まれます。 [Relationship APIの使用](../objects-tutorials/using-apis/using-relationship-rest-apis.md) をご参照ください。

HTTPエンドポイントでは、 `relationshipName` をリレーションシップの名前(例： `userToTicket`）に置き換えてください。 各リレーションシップAPIのJavaメソッドは、メソッド＋カレントオブジェクト＋リレーションシップ名＋関連オブジェクトという命名パターンに従っています(例： `getTicketUserToTicketUserPage`、 `deleteTicketUserToTicketUser`)。

| HTTP メソッド | HTTPエンドポイント                                                       | 説明                                           |
|:--------- |:----------------------------------------------------------------- |:-------------------------------------------- |
| GET       | `/{entryId}/relationshipName`                                     | 指定されたエントリーに関連するすべてのエントリーを、リレーションシップを通じて返します。 |
| PUT       | `/{entryId}/relationshipName/{relatedEntryId}`                    | 指定されたオブジェクトのエントリーを関連付けるために、リレーションシップを使用します。  |
| PUT       | `/by-external-reference-code/{erc}/relationshipName/{relatedERC}` | 指定されたオブジェクトのエントリーを関連付けるために、リレーションシップを使用します。  |
| DELETE    | `/{entryId}/relationshipName/{relatedEntryId}`                    | 指定されたオブジェクトのエントリーの関連付けを解除する                  |

サイトスコープ付きオブジェクトの場合、ERC エンドポイントには `/scope/{scopeKey}` のプレフィックスが含まれる(例： `/scope/{scopeKey}/by-external-reference-code/{erc}/relationshipName/{relatedERC}`）。 システムオブジェクトでは、外部参照コードのエンドポイントは利用できません。

```{tip}
専用のリレーションシップAPIに加えて、`nestedFields`クエリパラメータをオブジェクトの他のGET APIと組み合わせて使用すると、エントリとその関連エントリを返すことができます。 このパラメータを使用する場合、出力に含めたいリレーションシップの名前を指定する必要があります(例：`nestedFields=ticketAssignee`など）。 詳細と入門チュートリアルについては、 [REST APIでネストしたフィールドの使用](../objects-tutorials/using-apis/using-nested-fields-with-rest-apis.md) を参照してください。
```

## スタンドアロンアクションREST API

{bdg-secondary}`利用可能 Liferay 7.4 U60+/GA60+`

公開オブジェクトにスタンドアロンアクションを定義すると、Liferayはエントリでアクションをトリガーするための2つのエンドポイントを生成します。 一つはエントリーのIDを使用し、もう一つはエントリーの外部参照コード(ERC）を使用します。 詳しくは、 [「マニュアルアクションを使う」](../creating-and-managing-objects/actions/using-manual-actions.md) をご覧ください。

| HTTP メソッド | HTTPエンドポイント                                                   | Javaメソッド                  |
|:--------- |:------------------------------------------------------------- |:------------------------- |
| PUT       | `/by-external-reference-code/{erc}/object-actions/actionName` | `putObjectNameActionName` |
| PUT       | `/{entryId}/object-actions/actionName`                        | `putObjectNameActionName` |

サイトスコープ付きオブジェクトの場合、ERC エンドポイントには `/scope/{scopeKey}` のプレフィックスが含まれる(例： `/scopes/{scopeKey}/by-external-reference-code/{erc}/object-actions/actionName`)。 システムオブジェクトでは、外部参照コードのエンドポイントは利用できません。

<!--TASK: uncomment when GraphQL APIs are better supported, 
## GraphQL APIs

With the GraphQL APIs, you can both query and mutate object data. All APIs for custom objects are listed under `c` in Liferay's GraphQL schema. You can use Liferay's integrated Graph*i*QL IDE to search object schemas, draft queries, run requests, and more. To access it, go to Liferay's API Explorer at `[server]:[port]/o/api` (e.g., `localhost:8080/o/api`) and click *GraphQL*.

![Use Liferay's GraphiQL explorer to search object schemas and run your requests.](./headless-framework-integration/images/02.png)

See [Consuming GraphQL APIs](../../../headless-delivery/consuming-apis/consuming-graphql-apis.md) for more information.
-->

## 追加情報

* [RESTサービスの使用](../../../headless-delivery/consuming-apis/consuming-rest-services.md)
* [APIを使う](../objects-tutorials/using-apis.md)<!--TASK: * [Consuming GraphQL APIs](../../../headless-delivery/consuming-apis/consuming-graphql-apis.md) -->
