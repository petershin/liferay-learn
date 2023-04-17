# カスタムエレメントYAML設定リファレンス

`client-extension.yaml` ファイルでカスタムエレメントクライアント拡張を定義することができます。

## 使用方法詳細

`client-extension.yaml` ファイルは、カスタム要素のクライアント拡張を定義します：

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

必須の `urls` プロパティは、JavaScript リソースへのパスを 1 つ以上指定します。 これらのJavaScriptリソースのうち1つは、カスタム要素の初期化コードを含んでいなければなりません。

[ワークスペースの例](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-custom-element-1) には、完全なカスタムエレメントクライアントエクステンションが含まれています。

## YAML プロパティ

これらのプロパティは、カスタムエレメントクライアントエクステンションに固有のものです：

| 名前                    | データ型             | デフォルト値                       | 説明                                                                                                                                                       |
|:--------------------- |:---------------- |:---------------------------- |:-------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `cssURLs`             | String[](URLの一部） | `[]`                         | カスタム要素がページで使用されたときに、HTMLの頭に追加されるCSSパスのリスト。                                                                                                               |
| `friendlyURLMapping`  | 文字列              |                              | 特定のカスタム要素ウィジェットにフレンドリーなURLプレフィックスをマッピングします。                                                                                                              |
| `htmlElementName`     | 文字列              |                              | カスタム要素を参照するHTML要素名で、ページマークアップでレンダリングされる。                                                                                                                 |
| `instanceable`        | 真／偽              | `false`                      | カスタム要素ウィジェットがページ上に複数回表示されるかどうか。                                                                                                                          |
| `portletCategoryName` | 文字列              | `category.client-extensions` | カスタム要素ウィジェットのメニューカテゴリを指定します。                                                                                                                             |
| `properties`          | 文字列[]            | `[]`                         | カスタム HTML 要素の属性として追加するプロパティです。 改行を区切り文字として使用し、Javaのプロパティとして処理されます。                                                                                       |
| `urls`                | String[](URLの一部） |                              | (必須）ウィジェットがページ上で使用される際に、HTMLヘッドに追加されるJavaScriptリソースへのパスのリストです。 これらのリソースのうち1つには、カスタム要素の初期化コードが含まれている必要があります。 これが `baseURL` と組み合わさって、完全なURLを形成する。          |
| `useSM`               | 真／偽              | `false`                      | JavaScript コードが [ESM](https://nodejs.org/api/esm.html#modules-ecmascript-modules) 形式を使用しているかどうか。 `true`の場合、JavaScriptは `type="module"` プロパティでページに追加されます。 |

すべてのフロントエンドクライアントエクステンションに共通するプロパティについては、 [フロントエンドクライアントエクステンションのプロパティ](../front-end-client-extensions.md#front-end-client-extension-properties) を参照してください。

## 追加情報

* [フロントエンドクライアント拡張機能](../front-end-client-extensions.md)
* [クライアントエクステンションの操作](../working-with-client-extensions.md)
* [IFrame YAML 設定リファレンス](./iframe-yaml-configuration-reference.md)
