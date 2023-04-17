# テーマJSのYAML設定リファレンス

テーマJSのクライアント拡張は、 `client-extension.yaml` ファイルで定義することができます。

## 使用方法詳細

この `client-extension.yaml` ファイルは、テーマ JS クライアント拡張を定義します：

```yaml
able-theme-js:
    name: Able Theme JS
    type: themeJS
    url: main.js
```

必須の `url` プロパティは、JavaScript ファイルの場所を定義します。 ページで有効にすると、ページがロードされるたびに、そのURLのすべてのJavaScriptリソースが実行されます。

<!--TODO: are any additional resources available for theme JS as opposed to normal JS? Is there any functional difference in how it runs? -->

## YAML プロパティ

これらのプロパティは、テーマJSクライアントエクステンションに固有のものです：

| 名前    | データ型 | 説明                                                                     |
|:----- |:---- |:---------------------------------------------------------------------- |
| `url` | URL  | (必須）ページのHEADに追加されるJavaScriptファイルへのパスです。 完全なURIは、 `baseURL` の値が先頭に付きます。 |


すべてのフロントエンドクライアントエクステンションに共通するプロパティについては、 [フロントエンドクライアントエクステンションのプロパティ](../front-end-client-extension-properties) を参照してください。

## 追加情報

* [フロントエンドクライアント拡張機能](../front-end-client-extensions.md)
* [クライアントエクステンションの操作](../working-with-client-extensions.md)
* [JavaScript YAMLコンフィギュレーションリファレンス](./javascript-yaml-configuration-reference.md)
