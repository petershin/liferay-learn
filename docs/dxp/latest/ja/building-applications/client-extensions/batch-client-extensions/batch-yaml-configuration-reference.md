# バッチYAMLコンフィギュレーションリファレンス

`client-extension.yaml` ファイルを使用して、バッチクライアント拡張機能を定義します。

## 使用方法詳細

この `client-extension.yaml` ファイルは、タイプ `バッチ`のクライアント拡張を定義しています：

```yaml
yoke-batch:
    oAuthApplicationHeadlessServer: yoke-oauth-application-headless-server
    type: batch

yoke-oauth-application-headless-server:
    type: oAuthApplicationHeadlessServer
```

## YAML プロパティ

これらのプロパティは、バッチクライアントエクステンションに固有のものです：

| 名前                               | データ型 | 説明                                                                |
|:-------------------------------- |:---- |:----------------------------------------------------------------- |
| `name`                           | 文字列  | バッチ名です。                                                           |
| `oAuthApplicationHeadlessServer` | 文字列  | (必須) OAuth2 アプリケーションヘッドレスサーバープロファイルの ID(`externalReferenceCode`)。 |

## 追加情報

* [クライアントエクステンションの操作](../working-with-client-extensions.md)
