# クライアント拡張機能のパッケージ化

{bdg-primary}`Liferay Self-Hosted`
{bdg-primary}`Liferay Experience Cloud (SaaS)`
{bdg-warning}`Liferay Cloud： セルフマネージド`

{bdg-secondary}`Liferay 7.4`

クライアント拡張プロジェクトは、 **Liferay Universal File Format Archives**(LUFFAs) と呼ばれる展開可能なアーカイブとして構築され、 `.zip` という拡張子を持ちます。 各LUFFAは、特定の構造を持ち、特定のコンポーネントファイルを定義しており、プロジェクトによって提供されない場合は自動的に生成されます。 Liferay workspaceは、クライアント拡張プロジェクトをビルドする際にパッケージ化します。 パッケージングの仕組みを理解することは、 [クライアントエクステンションを組み立てる](./working-with-client-extensions.md#assembling-client-extensions) あるいは、別のプロセスでLUFFAを作成する場合に重要です。

これはLUFFAの構造です：

```bash
.
├── batch
│   └── **/*.batch-engine-data.json
├── *.client-extension-config.json
├── Dockerfile
├── LCP.json
├── static
│   └── **/*
├── WEB-INF
│   └── liferay-plugin-package.properties
└── [microservice resources]
```

## `batch`

```{note}
batch`フォルダは、[バッチクライアント拡張プロジェクト](./batch-client-extensions.md)によってのみ必要とされます。
```

バッチクライアント拡張のデータエンティティは、ビルドしたLUFFAの `batch/` フォルダ内の `*.batch-engine-data.json` ファイルです。 これらのファイルは、 `batch/` フォルダ内の任意のフォルダ構成にすることができます。

`*.batch-engine-data.json` ファイルを、ルートレベル `batch/` ディレクトリの下に、深さ無制限のディレクトリ構造でいくつでも配置することができます。 プロジェクトの `client-extension.yaml` ファイルでバッチ拡張機能を定義しなかった場合、Liferay はこれらのファイルを無視します。

## `*.client-extension-config.json`

```{note}
各LUFFAに最低1つの`*.client-extension-config.json`ファイルが必要である。
```

LUFFAのルートには、1つ以上の `*.client-extension-config.json` ( [OSGi Configuration Resource Format](https://docs.osgi.org/specification/osgi.cmpn/7.0.0/service.configurator.html#d0e131566) ) ファイルがあります。 クライアントエクステンションがアーカイブ内でどのように構成されるかを定義するものです。 通常、これらのファイルは、 `client-extension.yaml` ファイルの内容に基づいて、ビルドプロセス中に生成されます。 YAML から JSON への変換は、 [Liferay workspace plugin](https://repo1.maven.org/maven2/com/liferay/com.liferay.gradle.plugins.workspace/) で指定されており、1:1 対応ではありません。

## `Dockerfile`

```{note}
各LUFFAに最低1つのDockerfileが必要です。
```

ビルドプロセスでは、 [バッチ用](./batch-client-extensions.md)、 [設定用](./configuration-client-extensions.md)、 [フロントエンド](./front-end-client-extensions.md) クライアント拡張用の `Dockerfile` を自動的に生成しパッケージ化します。

[マイクロサービスクライアント拡張のための [`Dockerfile`](https://docs.docker.com/engine/reference/builder/) をプロジェクトで提供する必要があります](./microservice-client-extensions.md). これをプロジェクトのルートに追加すると、プロジェクトのビルド時にLUFFAにコピーされます。 `Dockerfile` が、プロジェクトのマイクロサービスクライアント拡張を実行できることを確認してください。 例えば、 `Dockerfile` は、マイクロサービスのコードを実行するために必要な特定のツールをインストールする必要があるかもしれません。

### クライアント拡張機能を手動でパッケージ化する

LUFFAを自分でパッケージングする場合、バッチ、設定、フロントエンドクライアント拡張には、特定の `Dockerfile` の規約が必要です。 Liferayは以下の画像でそれらを提供しています。

バッチクライアント拡張の場合は、 `liferay/batch:latest` イメージを使用してください：

```Dockerfile
FROM liferay/batch:latest
COPY /batch /batch
```

コンフィギュレーションクライアントの拡張については、 `liferay/noop:latest` イメージを使用してください：

```Dockerfile
FROM liferay/noop:latest
```

フロントエンドのクライアントエクステンションには、 `liferay/caddy:latest` イメージを使用してください：

```Dockerfile
FROM liferay/caddy:latest
COPY static/ /public_html/
```

マイクロサービスクライアントエクステンションの `Dockerfile` は、お客様の特定のコンテキストに完全に依存するため、事前に設定されたイメージを提供することができません。

## `LCP.json`

```{note}
各LUFFAには`LCP.json`ファイルが必要です。
```

ビルドプロセスでは、 [バッチ用](./batch-client-extensions.md)、 [設定用](./configuration-client-extensions.md)、 [フロントエンド用](./front-end-client-extensions.md)の `LCP.json` ファイルを自動生成しパッケージ化します。

[マイクロサービスクライアント拡張](./microservice-client-extensions.md)のために、プロジェクト内に`LCP.json`ファイルを用意する必要があります。これをプロジェクトのルートに追加すると、プロジェクトがビルドされる際にLUFFAにコピーされます。この`LCP.json` ファイルは、Liferay Experience Cloud にデプロイされた際にマイクロサービスに使用されるコンテナを構成します。

LUFFAを自分でパッケージングする場合、各クライアント拡張は、その `LCP.json`に対して、異なる仕様の提案を持っています：

| クライアント拡張                                                | 重要な資源を必要とする | 種類   | メモ                        |
|:------------------------------------------------------- |:----------- |:---- |:------------------------- |
| [バッチ](#example-batch-client-extension-lcp-json)         | &#10008;    | 仕事   | <ul><li>環境変数 `LIFERAY_BATCH_OAUTH_APP_ERC` には、バッチクライアント拡張の `oAuthApplicationHeadlessServer` プロパティの値を設定する必要があります。 これは、補間によって提供することができます。</li><li>cpu`、`memory`、`scale`に小さな値を指定することができます。</li></ul> |
| [設定](#example-configuration-client-extension-lcp-json)  | &#10008;    | 仕事   | <ul><li>バッチエクステンションよりさらにメモリ消費量が少ない。</li><li>cpu`、`memory`、`scale`には非常に小さな値を指定することができます。</li></ul> |
| [フロントエンド](#example-front-end-client-extension-lcp-json) | &#10008;    | デプロイ | <ul><li>loadBalancer`プロパティに、`targetPort`を`80`に設定して指定する必要があります。</li><li>自己修復のために [`livenessProbe`と`readinessProbe`のプロパティ](https://learn.liferay.com/w/liferay-cloud/troubleshooting/self-healing) を指定すること。</li><li>cpu`、`memory`、`scale`に小さな値を指定することができます。</li></ul> |

### バッチクライアント拡張の例 LCP.json

 ```json
{
    "cpu": 0.2,
    "env": {
        "LIFERAY_BATCH_OAUTH_APP_ERC": "__batch.oAuthApplicationHeadlessServer__"
    },
    "id": "__CLIENT_EXTENSION_ID__",
    "kind": "Job",
    "memory": 50,
    "scale": 1
}
```

### 構成例 Client Extension LCP.json

```json
{
    "cpu": 0.1,
    "id": "__CLIENT_EXTENSION_ID__",
    "kind": "Job",
    "memory": 10,
    "scale": 1
}
```

### フロントエンドクライアント拡張の例 LCP.json

```json
{
    "cpu": 0.2,
    "id": "__CLIENT_EXTENSION_ID__",
    "kind": "Deployment",
    "livenessProbe": {
        "httpGet": {
            "path": "/",
            "port": 80
        }
    },
    "loadBalancer": {
        "cdn": true,
        "targetPort": 80
    },
    "memory": 50,
    "readinessProbe": {
        "httpGet": {
            "path": "/",
            "port": 80
        }
    },
    "scale": 1
}
```

[LCP.json による設定](https://learn.liferay.com/w/liferay-cloud/reference/configuration-via-lcp-json) をご参照ください。

## `static`

```{note}
static`ディレクトリは、[フロントエンドクライアント拡張プロジェクト](./front-end-client-extensions.md)によってのみ必要とされます。
```

ビルドしたLUFFAのルートレベル `static/` ディレクトリに、任意の数の静的リソースファイルを配置することができます。 `static/` フォルダ内は、任意のフォルダ構成でご利用ください。 これらのファイルは、プロジェクトの `client-extension.yaml` ファイルで定義されているフロントエンドクライアント拡張がない場合、無視されます。

## マイクロサービス・リソース

他の必須ファイルと競合しない限り、マイクロサービスクライアント拡張プロジェクトのビルドLUFFAに追加のリソースを含めることができます。

## 関連トピック

* [クライアントエクステンションの操作](./working-with-client-extensions.md)
* [Liferay Workspace](../tooling/liferay-workspace/what-is-liferay-workspace.md)
