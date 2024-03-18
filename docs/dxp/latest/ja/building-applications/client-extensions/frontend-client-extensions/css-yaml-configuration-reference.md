# CSS YAMLコンフィギュレーションリファレンス

CSS クライアント拡張は、 `client-extension.yaml` ファイルで定義することができます。

## 使用方法詳細

この `client-extension.yaml` ファイルは、CSS クライアント拡張定義を定義します：

```yaml
able-global-css:
    name: Able Global CSS
    type: globalCSS
    url: global.css
```

必須の `url` プロパティは、CSS リソースファイルの場所を定義します。 ここに含まれるCSSは、テーマですでに使用されているスタイリングに追加されます。 競合する場合は、クライアントエクステンションのCSSが、すでにページ上にあるスタイリングを上書きします。

[ワークスペースの例](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-global-css) には、完全な CSS クライアント拡張が含まれています。

## YAML プロパティ

これらのプロパティは、CSSクライアントエクステンションに特有のものです：

| 名前    | データ型 | 説明                                                                         |
|:----- |:---- |:-------------------------------------------------------------------------- |
| `url` | URL  | (必須）ページで有効化したときにページのCSSに追加されるCSSファイルへのパスです。 完全なURIは、 `baseURL` の値が先頭に付きます。 |

すべてのフロントエンドクライアントエクステンションに共通するプロパティについては、 [フロントエンドクライアントエクステンションのプロパティ](../frontend-client-extensions.md#frontend-client-extension-properties) を参照してください。

## 関連トピック

* [フロントエンドクライアント拡張機能](../frontend-client-extensions.md)
* [クライアントエクステンションの操作](../working-with-client-extensions.md)
* [テーマCSS YAML設定リファレンス](./theme-css-yaml-configuration-reference.md)
