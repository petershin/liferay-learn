# LCP.jsonによるコンフィギュレーション

Liferay Cloud 環境の各サービスには `LCP.json` ファイルがあり、これを使用してサービスを設定することができます。 サービスID、メモリ、CPU数、環境変数、ボリュームなどのプロパティを設定できます。

この表は、 `LCP.json`で追加できるプロパティの一覧と説明です。

| 項目               | 種類     | デフォルト値                        | 説明                                                                                                                           |
|:---------------- |:------ |:----------------------------- |:---------------------------------------------------------------------------------------------------------------------------- |
| `id`             | 文字列    | ランダム                          | サービスID                                                                                                                       |
| `image`          | 文字列    | `""`                          | Docker Hubからサービスイメージ                                                                                                         |
| `env`            | オブジェクト | 未分類                           | 環境変数                                                                                                                         |
| `loadBalancer`   | オブジェクト | `{}`                          | 公開ポートおよびドメインの宣言                                                                                                              |
| `cpu`            | 数字     | `1`                           | CPU数                                                                                                                         |
| `scale`          | 数字     | `1`                           | インスタンスの起動数                                                                                                                   |
| `memory`         | 数字     | `512`                         | メモリ量(MB)                                                                                                                     |
| `volumes`        | オブジェクト | 未分類                           | データを永続化するためのパス                                                                                                               |
| `readinessProbe` | オブジェクト | `{ "timeoutSeconds": 5 }`     | サービスレディネスチェック                                                                                                                |
| `livenessProbe`  | オブジェクト | `{ "timeoutSeconds": 5 }`     | サービス稼働率チェック                                                                                                                  |
| `dependencies`   | 配列     | `[]`                          | 依存関係の展開順序                                                                                                                    |
| `kind`           | 文字列    | `Deployment`                  | デプロイメントタイプ（例：Deployment、StatefulSet）。                                                                                        |
| `strategy`       | オブジェクト | `{ "type": "RollingUpdate" }` | デプロイ戦略（RollingUpdateやRecreateなど）                                                                                             |
| `ports`          | 配列     | `[]`                          | ポートおよびプロトコルの宣言                                                                                                               |
| `environments`   | オブジェクト | `{}`                          | 環境に応じた設定                                                                                                                     |
| `deploy`         | ブール値   | `true`                        | 指定された環境に対してサービスが展開されるかどうか。 このプロパティは、 `environments` プロパティの内部でのみ使用し、ルートレベルでは使用しないでください。 サンプル `LCP.json` ファイルをご覧ください。          |
| `autoscale`      | オブジェクト | `{ "cpu": 80, "memory": 80 }` | オートスケーリングでのCPUおよびメモリの目標平均使用率。 これがオートスケーリングでどのように機能するかについての詳細は、 [オートスケーリング](../manage-and-optimize/auto-scaling.md)を参照してください。 |

## 使用量

以下は、すべてのプロパティを使用した `LCP.json` ファイルの例です。

```json
{
  "id": "myservice",
  "image": "liferaycloud/example",
  "env": {
    "DB_USER": "root",
    "DB_PASSWORD": "pass123"
  },
  "loadBalancer": {
    "cdn": true,
    "targetPort": 3000,
    "customDomains": ["example.com"],
    "ssl": {
      "key": "...",
      "crt": "..."
    }
  },
  "cpu": 2,
  "scale": 2,
  "memory": 2048,
  "volumes": {
    "storage": "/opt/storage"
  },
  "livenessProbe": {
    "timeoutSeconds": 5,
    "httpGet": {
      "path": "/status",
      "port": 3000
    },
    "initialDelaySeconds": 40,
    "periodSeconds": 5,
    "successThreshold": 5
  },
  "readinessProbe": {
    "timeoutSeconds": 5,
    "exec": {
      "command": ["cat", "/tmp/healthy"]
    },
    "initialDelaySeconds": 40,
    "periodSeconds": 5
  },
  "dependencies": ["service1", "service2"],
  "kind": "StatefulSet",
  "strategy": {
    "type": "RollingUpdate"
  },
  "ports": [
    {
      "port": 3400,
      "targetPort": 7000,
      "protocol": "TCP"
    },
    {
      "port": 9000,
      "targetPort": 8000,
      "protocol": "TCP",
      "external": true
    }
  ],
  "environments": {
    "prd": {
      "memory": 4096,
      "cpu": 6
    },
    "dev": {
      "deploy": false
    }
  },
  "autoscale": {
    "cpu": 90,
    "memory": 90
  }
}
```
