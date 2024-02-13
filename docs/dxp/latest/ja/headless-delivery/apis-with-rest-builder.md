---
toc:
  - >-
    ./apis-with-rest-builder/producing-and-implementing-apis-with-rest-builder.md
---
# RESTビルダーを使用したAPI

RESTビルダーとは、ローカルAPIをWeb上で利用しやすくするためのコード生成ツールです。 [OpenAPI仕様](https://www.openapis.org/) を使用し、RESTと [GraphQL](https://graphql.org/) APIを生成します。

RESTビルダーは、 `rest-config.yaml`ファイルおよび`rest-openapi.yaml`ファイルで定義した設定を用いて、お客様のAPIの動作に必要なコードのほとんどを一度に生成します。 クラス名やコードの置き場所を設定すると、RESTビルダーが必要なファイルをすべて生成します。 その後、実装ロジックを追加します。

Liferay Workspaceにある`impl`モジュールからGradleタスク`buildREST`を使って、RESTビルダーを実行します。 設定完了後、すべてのビルディングブロックコード、インターフェース、そしてリソースクラスまで、実装の準備が整った状態で生成されます。

## 次のステップ

- [RESTビルダーを使用したAPIの作成と実装](./apis-with-rest-builder/producing-and-implementing-apis-with-rest-builder.md)
