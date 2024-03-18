# テーマファビコンYAML設定リファレンス

`client-extension.yaml` ファイルで、テーマのファビコンクライアント拡張を定義することができます。

## 使用方法詳細

この `client-extension.yaml` ファイルは、テーマ favicon クライアント拡張を定義します：

```yaml
able-theme-favicon:
    name: Able Theme Favicon
    type: themeFavicon
    url: favicon.ico
```

必須の `url` プロパティは、ファビコンアイコン画像の位置を定義します。 この画像は、クライアントエクステンションが展開されると、各ページの新しいファビコンオプションになります。

[ワークスペースの例](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-theme-favicon) には、完全なテーマのファビコンクライアント拡張が含まれています。

## YAML プロパティ

これらのプロパティは、テーマのファビコンクライアント拡張に固有のものです：

| 名前    | データ型 | 説明                                                  |
|:----- |:---- |:--------------------------------------------------- |
| `url` | URL  | (必須) アイコン画像ファイルへのパス。 完全なURIは、 `baseURL` の値が先頭に付きます。 |

すべてのフロントエンドクライアントエクステンションに共通するプロパティについては、 [フロントエンドクライアントエクステンションのプロパティ](../frontend-client-extensions.md#frontend-client-extension-properties) を参照してください。

## 関連トピック

* [フロントエンドクライアント拡張機能](../frontend-client-extensions.md)
* [クライアントエクステンションの操作](../working-with-client-extensions.md)
