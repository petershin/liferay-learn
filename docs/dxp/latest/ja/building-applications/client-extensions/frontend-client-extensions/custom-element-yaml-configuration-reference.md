# カスタム要素のYAML設定リファレンス

`client-extension.yaml`ファイルでカスタム要素のクライアント拡張を定義できる。

## 使用法の詳細

この `client-extension.yaml` ファイルはカスタム要素のクライアント拡張を定義する：

```yaml
able-custom-element:
    cssURLs:
        - style.css
    friendlyURLMapping: vanilla-counter
    htmlElementName: vanilla-counter
    instanceable: false
    name: Able Custom Element
    portletCategoryName: category.client-extensions
    type: customElement
    urls:
        - index.js
    useESM: false
```

必須の `urls` プロパティは、JavaScript リソースへのパスを 1 つ以上指定する。 これらのJavaScriptリソースのうち1つは、カスタム要素の初期化コードを含んでいなければなりません。

[ワークスペースの例](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-custom-element-1) には、完全なカスタム要素クライアント拡張が含まれています。

## YAML プロパティ

これらのプロパティは、カスタム要素クライアント拡張に特有のものです。

| 名前                    | データ型              | デフォルト値                       | 説明                                                                                                                                                               |
| :-------------------- | :---------------- | :--------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `cssURLs`             | String[]（URLの一部） | `[]`                         | カスタム要素がページで使用されたときに、HTMLの頭に追加されるCSSパスのリスト。                                                                                                                       |
| `friendlyURLMapping`  | 文字列               |                              | 特定のカスタム要素ウィジェットにフレンドリURLプリフィックスをマッピングします。                                                                                                                        |
| `htmlElementName`     | 文字列               |                              | ページマークアップでレンダリングされるカスタム要素を参照するHTML要素名。                                                                                                                           |
| `instanceable`        | 真偽値               | `false`                      | カスタム要素ウィジェットがページ上に複数回表示されるかどうか。                                                                                                                                  |
| `portletCategoryName` | 文字列               | `category.client-extensions` | カスタム要素ウィジェットのメニューカテゴリ。                                                                                                                                           |
| `properties`          | 文字列[]            | `[]`                         | カスタム HTML 要素の属性として追加するプロパティ。 改行をセパレーター（区切り文字)として使用し、Javaのプロパティとして処理されます。                                                                                         |
| `urls`                | String[]（URLの一部） |                              | (必須）ウィジェットがページ上で使用される際に、HTMLヘッドに追加されるJavaScriptリソースへのパスのリスト。 これらのリソースのうち1つは、カスタム要素の初期化コードを含んでいなければなりません。 これは`baseURL`と組み合わさって完全なURLとなる。                          |
| `useESM`              | 真偽値               | `false`                      | JavaScript コードが [ESM](https://nodejs.org/api/esm.html#modules-ecmascript-modules) 形式を使用しているかどうか。 `true`の場合、JavaScriptは`type="module"`プロパティでページに追加される。 |

すべてのフロントエンドクライアント拡張に共通するプロパティについては、 [フロントエンドのクライアント拡張プロパティ](../frontend-client-extensions.md#frontend-client-extension-properties) を参照してください。

## 関連トピック

* [フロントエンド・クライアント拡張](../frontend-client-extensions.md) 
* [クライアント・エクステンションの操作](../working-with-client-extensions.md) 
* [IFrame YAML 設定リファレンス](./iframe-yaml-configuration-reference.md) 
