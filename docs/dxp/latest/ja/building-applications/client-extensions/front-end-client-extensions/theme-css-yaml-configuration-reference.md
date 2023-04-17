# テーマCSS YAML設定リファレンス

テーマCSSクライアント拡張は、 `client-extension.yaml` ファイルで定義することができます。

## 使用方法詳細

この `client-extension.yaml` ファイルは、テーマ CSS クライアント拡張を定義します：

```yaml
able-theme-css:
    clayURL: css/clay.css
    mainURL: css/main.css
    name: Able Theme CSS
    type: themeCSS
```

`mainURL` と `clayURL` のプロパティは、2つのCSSリソースファイル(`main.css` と `clay.css`、それぞれ）へのパスを設定するものです。 これらのCSSファイルは、テーマモジュールのプロジェクトで配置されるものに相当します。

これらのファイルのCSSは、あなたのテーマですでに使われているスタイルに追加されます。 競合する場合は、クライアントエクステンションのCSSが、すでにページ上にあるスタイリングを上書きします。

[ワークスペースの例](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-theme-css) には、完全なテーマCSSクライアント拡張が含まれています。

## YAML プロパティ

これらのプロパティは、テーマCSSクライアントエクステンションに固有のものです：

| 名前        | データ型 | 説明                                                                              |
|:--------- |:---- |:------------------------------------------------------------------------------- |
| `clayURL` | URL  | (必須）Liferayテーマの `clay.css` ファイルを表すCSSファイルへのパスです。 完全なURIは、 `baseURL` の値が先頭に付きます。 |
| `mainURL` | URL  | (必須）Liferayテーマの `main.css` ファイルを表すCSSファイルへのパスです。 完全なURIは、 `baseURL` の値が先頭に付きます。 |

すべてのフロントエンドクライアントエクステンションに共通するプロパティについては、 [フロントエンドクライアントエクステンションのプロパティ](../front-end-client-extensions.md#front-end-client-extension-properties) を参照してください。

## 追加情報

* [フロントエンドクライアント拡張機能](../front-end-client-extensions.md)
* [クライアントエクステンションの操作](../working-with-client-extensions.md)
* [CSS YAMLコンフィギュレーションリファレンス](./css-yaml-configuration-reference.md)
