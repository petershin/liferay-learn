---
toc:
  - ./using-custom-object-apis/object-api-basics.md
  - ./using-custom-object-apis/using-batch-apis.md
  - ./using-custom-object-apis/using-relationship-rest-apis.md
  - ./using-custom-object-apis/using-nestedfields-to-query-related-entries.md
  - ./using-custom-object-apis/using-nestedfields-to-audit-entry-history.md
  - ./using-custom-object-apis/using-aggregation-terms-with-rest-apis.md
---
# カスタムオブジェクトAPIの使用

{bdg-secondary}`liferay 7.4+`

カスタムオブジェクトの定義をパブリッシュすると、Liferay はオブジェクトとそのデータをやり取りするためのデフォルトの [REST API](../../../headless-delivery/consuming-apis/consuming-rest-services.md) を生成します。 これらのAPIは、オブジェクトのスコープ（会社やサイトなど）に応じて異なります。 定義にリレーションシップやスタンドアロンアクションが含まれている場合、Liferayはそれらを呼び出すためのエンドポイントも生成します。

これらのヘッドレスサービスのパスは、`c/[pluralobjectlabel]`の命名パターンに従う（例：`/o/c/timeoffrequests`）。 利用可能なオブジェクトAPIは、Liferay API Explorerの `[server]:[port]/o/api` (例えば、`localhost:8080/o/api`) から表示し、テストすることができます。 **RESTアプリケーション** をクリックすると、APIのドロップダウンリストが表示されます。

![Each object appears under REST Applications.](./using-custom-object-apis/images/01.png)

オブジェクトがアクティブな間は、これらのAPIを使用して、基本的なCRUD操作の実行、 [集約項](./using-custom-object-apis/using-aggregation-terms-with-rest-apis.md) と [ネストされたフィールド](./using-custom-object-apis/using-nestedfields-to-query-related-entries.md) を使用した複雑なクエリの実行、スタンドアロン・アクションのトリガー、エントリーのリレーションシップの管理などを行うことができます。

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} オブジェクトAPIの基本
:link: ./using-custom-object-apis/object-api-basics.md
:::

:::{grid-item-card} バッチAPIの使用
:link: ./using-custom-object-apis/using-batch-apis.md
:::

:::{grid-item-card} 関連REST APIの利用
:link: ./using-custom-object-apis/using-relationship-rest-apis.md
:::

:::{grid-item-card} nestedFields を使用した関連エントリーのクエリー
:link: ./using-custom-object-apis/using-nestedfields-to-query-related-entries.md
:::

:::{grid-item-card} nestedFieldsを使った入力履歴の監査
:link: ./using-custom-object-apis/using-nestedfields-to-audit-entry-history.md
:::

:::{grid-item-card} REST APIでの集計用語の使用
:link: ./using-custom-object-apis/using-aggregation-terms-with-rest-apis.md
:::
::::

## デフォルトの会社スコープのREST API

デフォルトのREST APIは、すべての会社に範囲指定されているオブジェクトで使用できます。 Javaのメソッドでは、`ObjectName`をオブジェクトの名前に置き換える。

| HTTP メソッド | HTTPエンドポイント                         | Javaメソッド                        | 説明                                                            |
| :-------- | :---------------------------------- | :------------------------------ | :------------------------------------------------------------ |
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
バッチ操作は、カンパニー・スコープのオブジェクトに対してのみ有効です。
```

## デフォルトのサイトスコープのREST API

デフォルトのREST APIは、すべてのサイトに範囲指定されているオブジェクトで使用できます。 Javaのメソッドでは、`ObjectName`をオブジェクトの名前に置き換える。

| HTTP メソッド | HTTPエンドポイント                                           | Javaメソッド                                     | 説明                                                        |
| :-------- | :---------------------------------------------------- | :------------------------------------------- | :-------------------------------------------------------- |
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
scopeKey`には、希望するデータスコープの適切な識別子（サイトIDやユーザーロールなど）を使用する。
```

## リレーションシップREST API

{bdg-secondary}`liferay 7.4 U70+/GA70+`.

オブジェクト間に1対多、多対多のリレーションシップを定義すると、Liferayはエントリーリレーションシップを照会、管理するためのエンドポイントを生成します。 これには、関連するオブジェクトのエントリーを返すためのGETエンドポイント、エントリーを関連付けるためのPUTエンドポイント、関連するエントリーの関連付けを解除するためのDELETEエンドポイントが含まれます。 詳しくは [Using Relationship API](./using-custom-object-apis/using-relationship-rest-apis.md) を参照。

HTTPエンドポイントでは、`relationshipName`をリレーションシップ名（例：`userToTicket`）に置き換える。 各リレーションシップAPIのJavaメソッドは、メソッド + 現在のオブジェクト + リレーションシップ名 + 関連オブジェクト（例：`getTicketUserToTicketUserPage`、`deleteTicketUserToTicketUser`）という命名パターンに従う。

| HTTP メソッド | HTTPエンドポイント                                                       | 説明                                           |
| :-------- | :---------------------------------------------------------------- | :------------------------------------------- |
| GET       | `/{entryId}/relationshipName`                                     | 指定されたエントリーに関連するすべてのエントリーを、リレーションシップを通じて返します。 |
| PUT       | `/{entryId}/relationshipName/{relatedEntryId}`                    | 指定されたオブジェクトエントリーを関連付けるために、リレーションシップを使用します。   |
| PUT       | `/by-external-reference-code/{erc}/relationshipName/{relatedERC}` | 指定されたオブジェクトエントリーを関連付けるために、リレーションシップを使用します。   |
| DELETE    | `/{entryId}/relationshipName/{relatedEntryId}`                    | 指定されたオブジェクトエントリーの関連付けを解除します                  |

サイトにスコープされたオブジェクトの場合、ERCエンドポイントは `/scope/{scopeKey}` 接頭辞を含む（例えば、`/scope/{scopeKey}/by-external-reference-code/{erc}/relationshipName/{relatedERC}`）。 システムオブジェクトでは、外部参照コードのエンドポイントは利用できません。

```{tip}
専用のリレーションシップAPIに加えて、`nestedFields`クエリパラメータをオブジェクトの他のGET APIと組み合わせて使用すると、エントリーとその関連エントリーを返すことができます。 このパラメータを使用する場合、出力に含めたいリレーションシップの名前を指定する必要があります（例：`nestedFields=ticketAssignee`など）。 [nestedFields を使用した関連エントリーのクエリー](./using-custom-object-apis/using-nestedfields-to-query-related-entries.md) を参照してください。
```
## スタンドアロンアクションREST API

{bdg-secondary}`liferay 7.4 U60+/GA60+`.

公開オブジェクトにスタンドアロンアクションを定義すると、Liferayはエントリーでアクションをトリガーするための2つのエンドポイントを生成します。 一つはエントリーのIDを使用し、もう一つはエントリーの外部参照コード（ERC）を使用します。 詳しくは [手動アクションの使用](../creating-and-managing-objects/actions/using-manual-actions.md) を参照。

| HTTP メソッド | HTTPエンドポイント                                                   | Javaメソッド                  |
| :-------- | :------------------------------------------------------------ | :------------------------ |
| PUT       | `/by-external-reference-code/{erc}/object-actions/actionName` | `putObjectNameActionName` |
| PUT       | `/{entryId}/object-actions/actionName`                        | `putObjectNameActionName` |

サイトがスコープされたオブジェクトの場合、ERCエンドポイントは `/scope/{scopeKey}` 接頭辞を含む（例：`/scope/{scopeKey}/by-external-reference-code/{erc}/object-actions/actionName` ）。

<!--TASK: uncomment when GraphQL APIs are better supported, 
## GraphQL APIs

With the GraphQL APIs, you can both query and mutate object data. All APIs for custom objects are listed under `c` in Liferay's GraphQL schema. You can use Liferay's integrated Graph*i*QL IDE to search object schemas, draft queries, run requests, and more. To access it, go to Liferay's API Explorer at `[server]:[port]/o/api` (e.g., `localhost:8080/o/api`) and click *GraphQL*.

![Use Liferay's GraphiQL explorer to search object schemas and run your requests.](./using-custom-object-apis/images/02.png)

See [Consuming GraphQL APIs](../../../headless-delivery/consuming-apis/consuming-graphql-apis.md) for more information.
-->

## 関連トピック

* [RESTサービスの消費](../../../headless-delivery/consuming-apis/consuming-rest-services.md)
<!--TASK: * [Consuming GraphQL APIs](../../../headless-delivery/consuming-apis/consuming-graphql-apis.md) -->
