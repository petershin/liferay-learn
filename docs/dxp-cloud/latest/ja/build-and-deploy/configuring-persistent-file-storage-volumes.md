# 永続的なファイルストレージボリュームを設定する

管理者は、デプロイタイプ（`Deployment` または `StatefulSet`）に応じて、DXP Cloudでサービスのボリュームを設定できます。 ボリュームは、導入形態に応じて、永続的な共有ストレージ（NFS）または専用ストレージ（SSD）で保存することができます。 この記事では、サービスの `LCP.json` ファイルを使用してボリュームを設定する方法を説明します。 デプロイタイプの詳細は、[デプロイメントの種類について](./understanding-deployment-types.md)を参照してください。

```{note}
liferay` と `backup` サービスでは、 `/opt/liferay/data` ディレクトリ (デフォルトでは `data` という名前) がドキュメントライブラリ用に確保される。 このボリュームは `LCP.json` ファイルに設定する必要はなく、パスを変更することもできません。 この設定がある場合は、問題を起こすことなく安全に削除することができます。
```

以下の手順に従って、サービス用の新しいボリュームを構成してください。

1. 永続化するデータを含むフォルダを選択します（例： `/opt/storage`）。

1. 特定の環境のリポジトリ内の `LCP.json`ファイル（例えば、`liferay/`）に移動します。

1. `volumes` 設定を `LCP.json` ファイルに追加します。 このコンフィギュレーションには、各ボリュームに対応するキーが含まれている必要があります。 例えば、以下の設定では、 `storage` key for `/opt/storage`...が含まれています。

```json
{
    "id": "liferay",
    "memory": 8192,
    "cpu": 8,
    "volumes": {
        "storage": "/opt/storage"
    }
}
```

```{important}
`StatefulSet`タイプのサービスの場合、ボリューム構成の変更を有効にするには、サービスを削除してから再デプロイする必要があります。
```

```{note}
バージョン3.x.xのサービスを使用している場合、`liferay` サービスの`LCP.json` ファイルは、`lcp/liferay/` directoryディレクトリにあります。 バージョン確認の詳細については、 [サービススタックのバージョンについて](../reference/understanding-service-stack-versions.md) を参照してください。
```

## 異なるサービス間でボリュームを共有する

`Deployment` タイプのサービスのボリュームのみ、NFSを使用して同じ環境の他のサービスと共有できます。 `StatefulSet` タイプのサービスにはそれぞれ、共有できない独自のボリュームがあります。

ボリュームを共有するため。

1. サービスのGithubリポジトリの `LCP.json` ファイル（`[ProjectID]/liferay/LCP.json`）に移動します。

1. 次のように入力します：
     * サービスアイディー
     * 共有するコンテンツの場所(絶対パス)
     * 異なるサービスに対して同じボリュームキー

次の例では、`service1` および `service2` は、NFSの共有ボリュームを使用して `/documents/images` からのファイルを共有します。 これにより、両方のサービスがキーおよび宣言されたファイルパスを介してボリューム内のファイルにアクセスできます。

最初のサービス（`service1`）は `/documents/images`から写真を共有します。

```json
{
  "id": "service1",
  "volumes": {
    "photos": "/documents/images"
  }
}
```

2番目のサービス（`service2`）は同じ場所にボリュームを宣言し、NFSで共有できるようにします。

```json
{
  "id": "service2",
  "volumes": {
    "photos": "/documents/images"
  }
}
```

両方のサービスは、サービスの再起動後、次のデプロイ時にNFSの指定されたボリュームにアクセスできます。

## ボリュームのコンテンツの削除

サービスが削除されても、ボリュームは環境内に残ります。 サービスで使用しているボリュームの名前を変更して（または既存のボリュームの名前を変更して）新しいボリュームを使用することができますが、古いボリュームのコンテンツは（NFSまたはサービスのSSDのいずれかに）存在します。 また、ボリュームの内容を保持したくない場合は、内容を自分で削除する必要があります。

## 追加情報

* [Github リポジトリの設定](../getting-started/configuring-your-github-repository.md)
* [LCP.jsonで設定する](../reference/configuration-via-lcp-json.md)
* [デプロイタイプについて](./understanding-deployment-types.md)
