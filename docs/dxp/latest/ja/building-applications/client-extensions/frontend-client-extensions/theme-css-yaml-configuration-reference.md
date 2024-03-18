# テーマのCSS YAML設定リファレンス

`client-extension.yaml`ファイルにテーマのCSSクライアント拡張を定義します。

## 使用法の詳細

この `client-extension.yaml` ファイルは、テーマのCSSクライアント拡張を定義します。

```yaml
able-theme-css:
    clayURL: css/clay.css
    mainURL: css/main.css
    name: Able Theme CSS
    type: themeCSS
```

`mainURL`と`clayURL`のプロパティは、2つのCSSリソースファイル（それぞれ`main.css` と `clay.css`）へのパスを設定するものです。 これらのCSSファイルは、テーマモジュールのプロジェクトでデプロイされるものに相当します。

これらのファイルのCSSは、テーマですでに使用されているスタイリングに追加されます。 競合する場合は、クライアント拡張のCSSが、すでにページ上にあるスタイリングを上書きします。

[ワークスペースの例](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-theme-css-1) には、完全なテーマのCSSクライアント拡張が含まれています。

## YAML プロパティ

これらのプロパティは、テーマのCSSクライアント拡張に特有のものです。

| 名前        | データ型 | 説明                                                                          |
|:--------- |:---- |:--------------------------------------------------------------------------- |
| `clayURL` | URL  | (必須）Liferayテーマの`clay.css`ファイルを表すCSSファイルへのパスです。 完全なURIは、`baseURL`の値が先頭に付きます。 |
| `mainURL` | URL  | (必須）Liferayテーマの`main.css`ファイルを表すCSSファイルへのパスです。 完全なURIは、`baseURL`の値が先頭に付きます。 |

すべてのフロントエンドクライアント拡張に共通するプロパティについては、 [フロントエンドのクライアント拡張プロパティ](../frontend-client-extensions.md#frontend-client-extension-properties) を参照してください。

## 関連トピック

* [フロントエンドのクライアント拡張](../frontend-client-extensions.md)
* [クライアント拡張との連携](../working-with-client-extensions.md)
* [CSS YAML設定リファレンス](./css-yaml-configuration-reference.md)
