# ヘッドレスフレームワークの統合

{bdg-secondary}`Liferay DXP/Portal 7.4以降で利用可能`

カスタムオブジェクトの定義をパブリッシュすると、Liferay はオブジェクトとそのデータをやり取りするためのデフォルトの [REST API](../../../headless-delivery/consuming-apis/consuming-rest-services.md) を生成します。 これらのAPIは、オブジェクトのスコープ（企業やサイトなど）によって異なる。 定義にリレーションシップやスタンドアロンアクションが含まれている場合、Liferayはそれらを呼び出すためのエンドポイントも生成します。

これらのヘッドレス・サービスのパスは、 `c/[pluralobjectlabel]` の命名パターンに従う（例えば、 `/o/c/timeoffrequests`）。 `[server]:[port]/o/api` (例: `localhost:8080/o/api`) にある Liferay API Explorer から利用可能なオブジェクト API を表示し、テストすることができます。 **REST Applications** をクリックすると、APIのドロップダウンリストが表示されます。

![各オブジェクトはREST Applicationsの下に表示される。](./headless-framework-integration/images/01.png)

オブジェクトがアクティブな間は、これらのAPIを使用して、基本的なCRUD操作の実行、 [集約項](../objects-tutorials/using-apis/using-aggregation-terms-with-rest-apis.md) と [ネストされたフィールド](../objects-tutorials/using-apis/using-nestedfields-to-query-related-entries.md)を使用した複雑なクエリの実行、スタンドアロン・アクションのトリガー、エントリーのリレーションシップの管理などを行うことができます。 オブジェクトAPIのチュートリアルについては、 [APIの使用](../objects-tutorials/using-apis.md) を参照してください。

## デフォルトの企業向けREST API

デフォルトのREST APIは、すべてのcompany-scopedオブジェクトで利用可能です。 Javaのメソッドでは、 `ObjectName` をオブジェクト名に置き換えてください。

| HTTP メソッド | HTTPエンドポイント                         | Javaメソッド                        | 説明                                                                |
|:--------- |:----------------------------------- |:------------------------------- |:----------------------------------------------------------------- |
| DELETE    | `/by-external-reference-code/{erc}` | `deleteByExternalReferenceCode` | 指定されたエントリーを削除し、成功した場合は204を返します。                                   |
| GET       | `/by-external-reference-code/{erc}` | `getByExternalReferenceCode`    | 指定されたエントリーの詳細を返します。                                               |
| PATCH     | `/by-external-reference-code/{erc}` | `patchByExternalReferenceCode`  | APIコールに含まれるフィールドのみが変更されます。                                        |
| PUT       | `/by-external-reference-code/{erc}` | `putByExternalReferenceCode`    | 指定されたエントリーの詳細を、APIコールで提供されたものに置き換える。                              |
| GET       | `/`                                 | `getObjectNamePage`             | Liferay インスタンス内のエントリーの完全なリストを返します; 結果をページ分割、フィルター、検索、ソートすることができます |
| POST      | `/`                                 | `postObjectName`                | APIコールで提供された詳細を使用して新しいエントリーを作成する。                                 |
| DELETE    | `/batch`                            | `deleteObjectNameBatch`         | 複数のエントリーを削除し、成功すれば204を返す。                                         |
| POST      | `/batch`                            | `postObjectNameBatch`           | APIコールで提供された詳細を使用して、複数のエントリーを作成する。                                |
| PUT       | `/batch`                            | `putObjectNameBatch`            | APIコールで提供された詳細を使用して、複数のエントリを置き換える。                                |
| DELETE    | `/{entryId}`                        | `deleteObjectName`              | 指定されたエントリーを削除し、成功した場合は204を返します。                                   |
| GET       | `/{entryId}`                        | `getObjectName`                 | 指定されたエントリーの詳細を返します。                                               |
| PATCH     | `/{entryId}`                        | `patchObjectName`               | APIコールに含まれるフィールドのみが変更されます。                                        |
| PUT       | `/{entryId}`                        | `putObjectName`                 | 指定されたエントリーの詳細を、APIコールで提供されたものに置き換える。                              |

```{note}
バッチ操作は、カンパニー・スコープのオブジェクトに対してのみ有効です。
```

## デフォルトのサイトスコープREST API

デフォルトのREST APIは、すべてのサイト・スコープのオブジェクトで利用可能です。 Javaのメソッドでは、 `ObjectName` をオブジェクト名に置き換えてください。

| HTTP メソッド | HTTPエンドポイント                                           | Javaメソッド                                     | 説明                                           |
|:--------- |:----------------------------------------------------- |:-------------------------------------------- |:-------------------------------------------- |
| DELETE    | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | `deleteScopeScopeKeyByExternalReferenceCode` | 指定されたエントリーを削除し、成功した場合は204を返します。              |
| GET       | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | `getScopeScopeKeyByExternalReferenceCode`    | 指定されたエントリーの詳細を返します。                          |
| PATCH     | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | `patchScopeScopeKeyByExternalReferenceCode`  | APIコールに含まれるフィールドのみが変更されます。                   |
| PUT       | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | `putScopeScopeKeyByExternalReferenceCode`    | 指定されたエントリーの詳細を、APIコールで提供されたものに置き換える。         |
| GET       | `/scopes/{scopeKey}`                                  | `getScopeScopeKeyPage`                       | 指定したスコープ内のエントリーの完全なリストを返します。                 |
| POST      | `/scopes/{scopeKey}`                                  | `postScopeScopeKey`                          | APIコールで提供された詳細を使用して、指定されたスコープに新しいエントリを作成します。 |
| DELETE    | `/{entryId}`                                          | `deleteObjectName`                           | 指定されたエントリーを削除し、成功した場合は204を返します。              |
| GET       | `/{entryId}`                                          | `getObjectName`                              | 指定されたエントリーの詳細を返します。                          |
| PATCH     | `/{entryId}`                                          | `patchObjectName`                            | APIコールに含まれるフィールドのみが変更されます。                   |
| PUT       | `/{entryId}`                                          | `putObjectName`                              | 指定されたエントリーの詳細を、APIコールで提供されたものに置き換える。         |

```{note}
scopeKey`には、希望するデータスコープの適切な識別子（サイトIDやユーザーロールなど）を使用する。
```

## リレーションシップREST API

{bdg-secondary}`Liferay 7.4 U70+/GA70+で利用可能`

オブジェクト間に1対多、多対多のリレーションシップを定義すると、Liferayはエントリーのリレーションシップを照会、管理するためのエンドポイントを生成します。 これには、関連するオブジェクトエントリを返すためのGETエンドポイント、エントリを関連付けるためのPUTエンドポイント、および関連するエントリを関連付け解除するためのDELETEエンドポイントが含まれる。 詳しくは [Using Relationship API](../objects-tutorials/using-apis/using-relationship-rest-apis.md) を参照。

HTTP エンドポイントでは、 `relationshipName` をリレーションシップ名（例： `userToTicket`）に置き換えてください。 各リレーションシップAPIのJavaメソッドは、メソッド＋カレントオブジェクト＋リレーションシップ名＋関連オブジェクトという命名パターンに従っている（例えば、 `getTicketUserToTicketUserPage`、 `deleteTicketUserToTicketUser`）。

| HTTP メソッド | HTTPエンドポイント                                                       | 説明                                     |
|:--------- |:----------------------------------------------------------------- |:-------------------------------------- |
| GET       | `/{entryId}/relationshipName`                                     | 指定されたエントリーに関連するすべてのエントリーを返します。         |
| PUT       | `/{entryId}/relationshipName/{relatedEntryId}`                    | リレーションシップを使用して、指定されたオブジェクトエントリを関連付けます。 |
| PUT       | `/by-external-reference-code/{erc}/relationshipName/{relatedERC}` | リレーションシップを使用して、指定されたオブジェクトエントリを関連付けます。 |
| DELETE    | `/{entryId}/relationshipName/{relatedEntryId}`                    | 指定されたオブジェクトエントリの関連付けを解除する              |

サイトスコープのオブジェクトの場合、ERCエンドポイントは `/scope/{scopeKey}` 接頭辞を含む（例えば、 `/scope/{scopeKey}/by-external-reference-code/{erc}/relationshipName/{relatedERC}`）。 外部参照コードのエンドポイントは、システム・オブジェクトでは利用できない。

```{tip}
専用のリレーションシップ API に加えて、オブジェクトの他の GET API で `nestedFields` クエリパラメータを使用すると、関連するエントリを含むエントリを返すことができます。 このパラメータを使用する場合、出力に含めたいリレーションシップの名前を指定する必要があります（例：`nestedFields=ticketAssignee`）。 詳細と入門チュートリアルについては [`nestedFields` を使って関連するエントリーをクエリーする。](../objects-tutorials/using-apis/using-nestedfields-to-query-related-entries.md) を参照してください。
```

## スタンドアロン・アクションREST API

{bdg-secondary}`Liferay 7.4 U60+/GA60+で利用可能`

公開オブジェクトにスタンドアロンアクションを定義すると、Liferayはエントリーのアクションをトリガーするための2つのエンドポイントを生成します。 ひとつはエントリーのIDを使い、もうひとつはエントリーの外部参照コード（ERC）を使う。 詳しくは、 [マニュアルアクションの使用](../creating-and-managing-objects/actions/using-manual-actions.md) をご覧ください。

| HTTP メソッド | HTTPエンドポイント                                                   | Javaメソッド                  |
|:--------- |:------------------------------------------------------------- |:------------------------- |
| PUT       | `/by-external-reference-code/{erc}/object-actions/actionName` | `putObjectNameActionName` |
| PUT       | `/{entryId}/object-actions/actionName`                        | `putObjectNameActionName` |

サイトスコープのオブジェクトの場合、ERCエンドポイントは `/scope/{scopeKey}` 接頭辞を含む（例えば、 `/scopes/{scopeKey}/by-external-reference-code/{erc}/object-actions/actionName`）。 外部参照コードのエンドポイントは、システム・オブジェクトでは利用できない。

<!--TASK: uncomment when GraphQL APIs are better supported, 
## GraphQL APIs

With the GraphQL APIs, you can both query and mutate object data. All APIs for custom objects are listed under `c` in Liferay's GraphQL schema. You can use Liferay's integrated Graph*i*QL IDE to search object schemas, draft queries, run requests, and more. To access it, go to Liferay's API Explorer at `[server]:[port]/o/api` (e.g., `localhost:8080/o/api`) and click *GraphQL*.

![Use Liferay's GraphiQL explorer to search object schemas and run your requests.](./headless-framework-integration/images/02.png)

See [Consuming GraphQL APIs](../../../headless-delivery/consuming-apis/consuming-graphql-apis.md) for more information.
-->

## 関連トピック

* [RESTサービスの使用](../../../headless-delivery/consuming-apis/consuming-rest-services.md)
* [APIの使用](../objects-tutorials/using-apis.md)
<!--TASK: * [Consuming GraphQL APIs](../../../headless-delivery/consuming-apis/consuming-graphql-apis.md) -->
