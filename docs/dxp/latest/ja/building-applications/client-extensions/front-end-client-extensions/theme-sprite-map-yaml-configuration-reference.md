# テーマスプライトマップYAML設定リファレンス

`client-extension.yaml` ファイルで、テーマ・スプライト・マップ・クライアント拡張を定義することができます。

## 使用方法詳細

この `client-extension.yaml` は、テーマ・スプライト・マップ・クライアント拡張を定義しています：

```yaml
able-theme-spritemap:
    name: Able Theme Spritemap
    type: themeSpritemap
    url: spritemap.svg
```

必須の `url` プロパティは、 `.svg` スプライトマップファイルの場所を定義します。

[サンプルワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-theme-spritemap) には、完全なテーマスプライトマップクライアント拡張が含まれています。

## YAML プロパティ

これらのプロパティは、テーマスプライトマップクライアントエクステンションに固有のものです：

| 名前    | データ型 | 説明                                                                                  |
|:----- |:---- |:----------------------------------------------------------------------------------- |
| `url` | URL  | (必須) 既存の Liferay テーマのものを置き換える `.svg` スプライトマップへのパスです。 完全なURIは、 `baseURL` の値が先頭に付きます。 |

すべてのフロントエンドクライアントエクステンションに共通するプロパティについては、 [フロントエンドクライアントエクステンションのプロパティ](../front-end-client-extensions.md#front-end-client-extension-properties) を参照してください。

## 追加情報

* [フロントエンドクライアント拡張機能](../front-end-client-extensions.md)
* [クライアントエクステンションの操作](../working-with-client-extensions.md)
