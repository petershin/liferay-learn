# クライアント拡張機能のパッケージ化

{bdg-secondary}`liferay Experience Cloud and Liferay DXP 7.4+ (self-hosted)` 
{bdg-unsupported}`Liferay Cloud：セルフマネージド`

クライアント拡張プロジェクトは **Liferay Universal File Format Archives**(LUFFAs) と呼ばれる展開可能なアーカイブとしてビルドされ、拡張子は `.zip` です。 各LUFFAは、特定の構造を持ち、特定のコンポーネント・ファイルを定義します。プロジェクトによって提供されない場合は、自動的に生成されます。 Liferay ワークスペースは、クライアント拡張プロジェクトをビルドするときにパッケージ化します。 パッケージングがどのように機能するのかを理解することは、 [クライアント・エクステンションを組み立てる](./working-with-client-extensions.md#assembling-client-extensions) あるいは別のプロセスでLUFFAを作成する場合に重要である。

これがLUFFAの構造だ：

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
batch` フォルダは [バッチクライアント拡張プロジェクト](./batch-client-extensions.md) でのみ必要です。
```
バッチクライアント拡張のデータエンティティは、ビルドされたLUFFAの`batch/`フォルダ内の`*.batch-engine-data.json`ファイルである。 これらのファイルは `batch/` フォルダ内の任意のフォルダ構造に置くことができる。

ルートレベルの `batch/` ディレクトリの下に `*.batch-engine-data.json` ファイルをいくつでも置くことができ、ディレクトリ構造は無制限である。 プロジェクトの `client-extension.yaml` ファイルでバッチ拡張を定義しなかった場合、Liferay はこれらのファイルを無視します。

## `*.client-extension-config.json`

```{note}
各LUFFAには少なくとも1つの`*.client-extension-config.json`ファイルが必要です。
```

LUFFAのルートには、1つ以上の`*.client-extension-config.json` ( [OSGi Configuration Resource Format](https://docs.osgi.org/specification/osgi.cmpn/7.0.0/service.configurator.html#d0e131566) ) ファイルがあります。 これらは、クライアントのエクステンションがアーカイブ内でどのように構成されているかを定義します。 通常、これらのファイルは `client-extension.yaml` ファイルの内容に基づいてビルドプロセス中に生成されます。 YAMLからJSONへの変換は [Liferayワークスペースプラグイン](https://repo1.maven.org/maven2/com/liferay/com.liferay.gradle.plugins.workspace/) によって指定され、1:1のマッピングではありません。

## `Dockerfile`

```{note}
各LUFFAには少なくとも1つのDockerfileが必要です。
```

ビルド・プロセスは、 [バッチ](./batch-client-extensions.md) 、 [コンフィギュレーション](./configuration-client-extensions.md) 、 [フロントエンド](./frontend-client-extensions.md) クライアント拡張用の `Dockerfile` を自動的に生成し、パッケージ化する。

[マイクロサービスクライアント拡張](./microservice-client-extensions.md) 用に、 [`Dockerfile`](https://docs.docker.com/engine/reference/builder/) をプロジェクトに用意する必要があります。 これをプロジェクトのルートに追加すると、プロジェクトのビルド時にLUFFAにコピーされます。 `Dockerfile`がプロジェクトのマイクロサービスクライアント拡張を実行できることを確認してください。 例えば、`Dockerfile`はマイクロサービスのコードを実行するために必要な特定のツールをインストールする必要があるかもしれない。

### クライアント拡張機能を手動でパッケージ化する

LUFFAを自分でパッケージングする場合、バッチ、コンフィギュレーション、フロントエンドクライアントの拡張には、特定の`Dockerfile`の規約が必要です。 Liferayは以下の画像でそれらを提供します。

バッチクライアントの拡張には `liferay/batch:latest` イメージを使ってください：

```Dockerfile
FROM liferay/batch:latest
COPY /batch /batch
```

コンフィギュレーションクライアントの拡張には `liferay/noop:latest` イメージを使ってください：

```Dockerfile
FROM liferay/noop:latest
```

フロントエンドクライアントの拡張には `liferay/caddy:latest` イメージを使ってください：

```Dockerfile
FROM liferay/caddy:latest
COPY static/ /public_html/
```

マイクロサービスクライアント拡張の `Dockerfile` は完全に特定のコンテキストに依存するため、事前に設定されたイメージを提供することはできません。

## `LCP.json`

```{note}
各LUFFAには`LCP.json`ファイルが必要です。
```

ビルドプロセスは、 [バッチ](./batch-client-extensions.md) 、 [コンフィギュレーション](./configuration-client-extensions.md) 、 [フロントエンド](./frontend-client-extensions.md) 用の `LCP.json` ファイルを自動的に生成し、パッケージ化します。

[マイクロサービスクライアント拡張](./microservice-client-extensions.md) 用に `LCP.json` ファイルをプロジェクトに用意する必要があります。 これをプロジェクトのルートに追加すると、プロジェクトがビルドされるときにLUFFAにコピーされます。 この `LCP.json` ファイルは、マイクロサービスが Liferay Experience Cloud にデプロイされたときに使用されるコンテナを設定します。

LUFFAを自分でパッケージングする場合、各クライアント拡張機能には、`LCP.json`に対する異なる仕様の提案が付属しています：

| クライアント拡張                                                                   | 多大なリソースを必要とする | 親切   | メモ                                                                                                                                                                                                                                                                             |
| :------------------------------------------------------------------------- | :------------ | :--- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [バッチ](#example-batch-client-extension-lcp-json)                 | &#10008;      | 仕事   | <ul><li>環境変数 `LIFERAY_BATCH_OAUTH_APP_ERC` には、バッチクライアント拡張の `oAuthApplicationHeadlessServer` プロパティの値を設定しなければならない。 これは補間によって提供することができる。</li><li>`cpu`、`memory`、`scale` には小さな値を指定できる。</li></ul>                                                                                    |
| [コンフィギュレーション](#example-configuration-client-extension-lcp-json) | &#10008      | 仕事   | <ul><li>バッチ拡張よりもさらにメモリ消費量が少ない。</li><li>`cpu`、`memory`、`scale` には非常に小さな値を指定できる。</li></ul>                                                                                                                                                                                        |
| [フロントエンド](#example-frontend-client-extension-lcp-json)         | &#10008      | デプロイ | <ul><li>`loadBalancer` プロパティを `targetPort` に `80` を指定して指定する必要がある。</li><li> [セルフヒーリング](https://learn.liferay.com/w/liferay-cloud/troubleshooting/self-healing) `livenessProbe` プロパティと `readinessProbe` プロパティを指定する必要がある。</li><li>`cpu`、`memory`、`scale` には小さな値を指定できる。</li></ul> |

### バッチクライアント拡張 LCP.json の例

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

### 構成例 クライアント拡張 LCP.json

```json
{
    "cpu": 0.1,
    "id": "__CLIENT_EXTENSION_ID__",
    "kind": "Job",
    "memory": 10,
    "scale": 1
}
```

### フロントエンド・クライアント拡張の例 LCP.json

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

詳細は [LCP.jsonによるコンフィギュレーション](https://learn.liferay.com/w/liferay-cloud/reference/configuration-via-lcp-json) を参照。

## `static`

```{note}
static`ディレクトリが必要なのは、 [フロントエンドクライアント拡張プロジェクト](./frontend-client-extensions.md) だけです。
```

ビルドされたLUFFAのルートレベル`static/`ディレクトリには、任意の数の静的リソースファイルを置くことができます。 `static/`フォルダの中に好きなフォルダ構造を使ってください。 プロジェクトの `client-extension.yaml` ファイルにフロントエンドクライアント拡張が定義されていない場合、これらのファイルは無視されます。

## マイクロサービスのリソース

マイクロサービスクライアント拡張プロジェクトのビルドLUFFAには、他の必須ファイルと競合しない限り、追加のリソースを含めることができます。

## 関連トピック

* [クライアント拡張機能の操作](./working-with-client-extensions.md) 
* [Liferay ワークスペース](../tooling/liferay-workspace/what-is-liferay-workspace.md)
