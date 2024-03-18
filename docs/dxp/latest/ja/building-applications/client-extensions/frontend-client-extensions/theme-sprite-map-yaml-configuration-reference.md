# テーマのスプライトマップYAML設定リファレンス

`client-extension.yaml`ファイルで、テーマのスプライトマップクライアント拡張を定義することができます。

## 使用法の詳細

この `client-extension.yaml` は、テーマのスプライトマップクライアント拡張を定義しています。

```yaml
able-theme-spritemap:
    name: Able Theme Spritemap
    type: themeSpritemap
    url: spritemap.svg
```

必須の `url` プロパティは、`.svg`スプライトマップファイルの場所を定義します。

[サンプルワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-theme-spritemap-1) には、完全なテーマスプライトマップクライアント拡張が含まれています。

## YAML プロパティ

これらのプロパティは、テーマのスプライトマップクライアント拡張に固有のものです。

| 名前    | データ型 | 説明                                                                                  |
|:----- |:---- |:----------------------------------------------------------------------------------- |
| `url` | URL  | (必須) 既存のLiferayテーマのスプライトマップを置き換える`.svg`スプライトマップへのパスです。 完全なURIは、`baseURL`の値が先頭に付きます。 |

すべてのフロントエンドクライアント拡張に共通するプロパティについては、 [フロントエンドのクライアント拡張プロパティ](../frontend-client-extensions.md#frontend-client-extension-properties) を参照してください。

## 関連トピック

* [フロントエンドのクライアント拡張](../frontend-client-extensions.md)
* [クライアント拡張との連携](../working-with-client-extensions.md)
