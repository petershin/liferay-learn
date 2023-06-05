# JavaScript YAMLコンフィギュレーションリファレンス

JavaScript クライアント拡張は、 `client-extension.yaml` ファイルで定義することができます。

## 使用方法詳細

`client-extension.yaml` ファイルは、JavaScript クライアント拡張を定義します：

```yaml
able-global-js:
    name: Able Global JS
    type: globalJS
    url: global.js
```

必須の `url` プロパティは、JavaScript リソースファイルの場所を定義します。 ページで有効にすると、このパスにあるJavaScriptが各ページの読み込み時に実行されます。

[ワークスペースの例](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-global-js) には、完全な JavaScript クライアント拡張が含まれています。

## YAML プロパティ

これらのプロパティは、JavaScriptクライアントエクステンションに特有のものです：

| 名前    | データ型 | 説明                                                                                     |
|:----- |:---- |:-------------------------------------------------------------------------------------- |
| `url` | URL  | (必須）クライアント拡張機能が有効な場合に、ページのHEADに追加されるJavaScriptファイルへのパス。 完全なURIは、 `baseURL` の値が先頭に付きます。 |

すべてのフロントエンドクライアントエクステンションに共通するプロパティについては、 [フロントエンドクライアントエクステンションのプロパティ](../front-end-client-extensions.md#front-end-client-extension-properties) を参照してください。

## 関連トピック

* [フロントエンドクライアント拡張機能](../front-end-client-extensions.md)
* [クライアントエクステンションの操作](../working-with-client-extensions.md)
* [テーマJSのYAML設定リファレンス](./theme-js-yaml-configuration-reference.md)
