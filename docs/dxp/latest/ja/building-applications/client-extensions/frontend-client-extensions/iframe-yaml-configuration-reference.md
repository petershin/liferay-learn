# IFrame YAML 設定リファレンス

IFrame クライアント拡張は、 `client-extension.yaml` ファイルで定義することができます。

## データ使用量

この `client-extension.yaml` ファイルは、IFrame クライアント拡張を定義します：

```yaml
able-iframe:
    name: Able IFrame
    type: iframe
    url: https://arnab-datta.github.io/counter-app
```

必須の `url` プロパティは、IFrame ウィジェット内に埋め込む HTML ページを指します。

[ワークスペースの例](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-iframe-1) には、完全な IFrame クライアント拡張が含まれています。

## YAML プロパティ

これらのプロパティは、IFrameクライアントエクステンションに特有のものです：

| 名前                    | データ型 | デフォルト値  | 説明                                         |
|:--------------------- |:---- |:------- |:------------------------------------------ |
| `friendlyURLMapping`  | 文字列  |         | フレンドリーなURLプレフィックスと特定のIFrameウィジェットの対応付けを行う。 |
| `portletCategoryName` | 文字列  |         | IFrameウィジェットのメニューカテゴリを指定します。               |
| `url`                 | URL  |         | (必須）IFrameウィジェット内に埋め込むHTMLページへの完全なURLです。   |
| `instanceable`        | 真／偽  | `false` | IFrameウィジェットが1ページに複数回表示されるかどうか。            |

すべてのフロントエンドクライアントエクステンションに共通するプロパティについては、 [フロントエンドクライアントエクステンションのプロパティ](../frontend-client-extensions.md#frontend-client-extension-properties) を参照してください。

## 関連トピック

* [フロントエンドクライアント拡張機能](../frontend-client-extensions.md)
* [クライアントエクステンションの操作](../working-with-client-extensions.md)
* [カスタムエレメントYAML設定リファレンス](./custom-element-yaml-configuration-reference.md)
