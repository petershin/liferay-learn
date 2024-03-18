# JavaScript YAML設定リファレンス

JavaScriptクライアント拡張は`client-extension.yaml`ファイルで定義できる。

## 使用法の詳細

この `client-extension.yaml` ファイルはJavaScriptクライアント拡張を定義する：

```yaml
able-global-js:
    name: Able Global JS
    type: globalJS
    url: global.js
```

必須の `url` プロパティはJavaScriptリソースファイルの場所を定義する。 ページで有効にすると、このパスにあるJavaScriptが各ページの読み込み時に実行されます。

[ワークスペースの例](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-global-js) には、完全な JavaScript クライアント拡張が含まれています。

## YAML プロパティ

これらのプロパティは、JavaScriptクライアント拡張に特有のものです。

| 名前    | データ型 | 説明                                                                             |
| :---- | :--- | :----------------------------------------------------------------------------- |
| `url` | URL  | (必須）クライアント拡張が有効な場合に、ページのHEADに追加されるJavaScriptファイルへのパス。 完全なURIは `baseURL` 値で始まる。 |

すべてのフロントエンドクライアント拡張に共通するプロパティについては、 [フロントエンドのクライアント拡張プロパティ](../frontend-client-extensions.md#frontend-client-extension-properties) を参照してください。

## 関連トピック

* [フロントエンド・クライアント拡張](../frontend-client-extensions.md) 
* [クライアント・エクステンションの操作](../working-with-client-extensions.md) 
