# Elasticsearchのバックアップ

[Elasticsearchレプリカ](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/index-modules.html#index-modules-settings) は 、ノードがダウンするのを防ぎますが、壊滅的な障害が発生した場合には役立ちません。 その時に役立つのは、適切なバックアップ習慣だけです。

## アップグレード前のインデックスのバックアップ

たとえインデックスされたデータがLiferayのデータベースから再インデックスすることで復元できるとしても、すべてのアップグレードシナリオでインデックスのバックアップを取るのがベストプラクティスです。 アプリ固有のインデックスの [スナップショットを取ること](#backing-up-and-restoring-search-tuning-indexes-for-liferay-7-2-and-7-3) （Liferay DXP 7.2と7.3のLiferayの検索の調整インデックスのように）は、データが検索インデックスにのみ保存されている場合に必須となります。 スナップショットは、新しいElasticsearchサーバをセットアップする際に、以前のデータ（同義語セットや結果ランキングなど）を復元するために使用することができます。 このアプローチを試みる前に、 [スナップショットとバージョンの復元の互換性](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshot-restore.html#snapshot-restore-version-compatibility) に関するElasticsearchのドキュメントを読んでください。

ここでは、代表的なアップグレードシナリオを紹介します。

* Liferayとは無関係にElasticsearchクラスタをアップグレードする場合：すべてのインデックスのバックアップを推奨します。 スナップショットからのデータの復元は、すべてのインデックスがシステムに残っているため、必要ありません。
* Liferayをアップグレードし、同じElasticsearchクラスタに接続する場合：すべてのインデックスのバックアップを行うことを推奨します。 スナップショットからのデータの復元は、すべてのインデックスがシステムに残っているため、必要ありません。
* Liferayをアップグレードし、別のElasticsearchクラスタに接続する場合：すべてのインデックスのバックアップを推奨します。 スナップショットからのリストアは、すべてのプライマリストレージインデックスに必要です。 Liferayの検索の調整機能（結果ランキングと同義語セット）のいずれかを使用している場合、Liferay DXP 7.4へのアップグレード後に、 [Liferayデータベースにインデックスデータをインポートする](upgrading-search-infrastructure.md#importing-the-search-tuning-indexes-in-7-4) ことも必要です。

## Elasticsearchクラスタのバックアップを作成する

```{tip}
スナップショットの作成と管理は、 [Kibana 7.x UI](https://www.elastic.co/guide/en/kibana/8.8/snapshot-repositories.html) を使うと便利です。
```

次の3つの手順でElasticsearchクラスターをバックアップし、バックアップの復元をテストします。

1. リポジトリを作成します

1. Elasticsearchクラスターのスナップショットを作成します

1. スナップショットから復元します

```{note}
より詳細な情報については、Elastic社の [Elasticsearch 管理ガイド](https://www.elastic.co/guide/en/elasticsearch/guide/master/administration.html) を参照し、特に [Snapshot and Restore モジュール](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshot-restore.html) を参照してください。
```

### リポジトリの作成

まず、スナップショットを保存する [リポジトリを作成](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshots-register-repository.html) します。 Elasticsearch では、以下のようないくつかのリポジトリタイプを使用できます。

* ネットワークファイルシステムやNASなどの共有ファイルシステム
* Amazon S3
* HDFS（Hadoop Distributed File System）
* Azureクラウド
* Google Cloud Storage

スナップショットを共有ファイルシステムに保存したい場合は、まず各ノードの `elasticsearch.yml` に [`path.repo` 設定を使用して共有ファイルシステムへのパスを登録します](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshots-register-repository.html#snapshots-filesystem-repository) 。 例えば、

```yaml
path.repo: ["path/to/shared/file/system/"]
```

リポジトリをホストするフォルダへのパスを登録した後（フォルダが存在することを確認してください）、`PUT`コマンドでリポジトリを作成します。 例えば、

```bash
PUT /_snapshot/test_backup
{
  "type": "fs",
  "settings": {
    "location": "/path/to/shared/file/system/"
  }
}'
```

`test_backup`を作成するリポジトリの名前に置き換え、`location\`の設定値を共有ファイルシステムへの絶対パスに置き換えます。

リポジトリが正しく作成されていれば、コマンドは次のような結果を返します。

```json
{"acknowledged":true}
```

リポジトリが存在しているので、スナップショットを作成します。

### クラスターのスナップショットを取得する

最も簡単なスナップショットのアプローチは、 [クラスター内のすべてのインデックスのスナップショット](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshots-take-snapshot.html) を作成することです。 例えば、

```bash
PUT /_snapshot/test_backup/snapshot_1
```

スナップショットコマンドが成功すると、次の結果が返されます。

```json
{"accepted":true}
```

スナップショットを特定のインデックスに制限することもできます。 たとえば、Liferay Enterprise Searchモニタリングを使用しているが、スナップショットからモニタリングインデックスを除外したい場合があります。 スナップショットに含めるインデックスを明示的に宣言できます。 例えば、

```bash
PUT /_snapshot/test_backup/snapshot_2
{ "indices": "liferay-0,liferay-20116" }
```

すべてのインデックスとそのメトリクスを一覧表示するには、このコマンドを実行します：

```bash
GET /_cat/indices?v
```

インデックスメトリクスの例：

```bash
health status index                                              uuid                   pri rep docs.count docs.deleted store.size pri.store.size
green  open   liferay-20101-search-tuning-rankings               ykbNqPjkRkq7aCYnc7G20w   1   0          7            0      7.7kb          7.7kb
green  open   liferay-20101-workflow-metrics-tokens              DF-1vq8IRDmFAqUy4MHHPQ   1   0          4            0       26kb           26kb
green  open   liferay-20101                                      QKXQZeV5RHKfCsZ-TYU-iA   1   0     253015          392     43.1mb         43.1mb
green  open   liferay-20101-workflow-metrics-sla-task-results    SrWzmeLuSKGaIvKrv4WmuA   1   0          4           72     30.6kb         30.6kb
green  open   liferay-20101-workflow-metrics-processes           Ras8CH0PSDGgWSyO3zEBhg   1   0          1            0     49.3kb         49.3kb
green  open   liferay-20101-workflow-metrics-nodes               bcdKKgDySeWf4BJnmMzk6A   1   0          4            0     10.5kb         10.5kb
green  open   liferay-20101-workflow-metrics-sla-process-results VJrNOpJWRoeTaJ-sBGs_vA   1   0          3           91     47.4kb         47.4kb
green  open   liferay-20101-workflow-metrics-instances           OgJMyD5ZQIi2h0xUTSjezg   1   0          3            0     62.4kb         62.4kb
green  open   liferay-0                                          jPIEOfZhSCKZSWnY0L65RQ   1   0     253114          491     50.1mb         50.1mb
green  open   liferay-20101-search-tuning-synonyms               pAUN8st1RmaV1NxXtj-Sig   1   0          1            0      4.1kb          4.1kb
```

```{note}
Elasticsearchは、*スマートスナップショット*アプローチを採用しています。 その意味を理解するために、1つのインデックスを考えてみましょう。 最初のスナップショットにはインデックス全体のコピーが含まれ、それ以降のスナップショットには、最初の完全なインデックススナップショットと現在のインデックスの状態との差分のみが含まれます。
```

最終的には、リポジトリに多数のスナップショットが作成されることになります。スナップショットに名前を付けたとしても、スナップショットに含まれているものを忘れてしまう可能性があります。 Elasticsearch APIを使用して説明を取得できます。 例えば、

```bash
GET /_snapshot/test_backup/snapshot_1
```

以下が返されます

```json
{"snapshots":[
    {"snapshot":"snapshot_1",
    "uuid":"WlSjvJwHRh-xlAny7zeW3w",
    "version_id":6.80399,
    "version":"6.8.2",
    "indices":["liferay-20099","liferay-0","liferay-47206"],
    "state":"SUCCESS",
    "start_time":"2018-08-15T21:40:17.261Z",
    "start_time_in_millis":1534369217261,
    "end_time":"2018-08-15T21:40:17.482Z",
    "end_time_in_millis":1534369217482,
    "duration_in_millis":221,
    "failures":[],
    "shards":{
        "total":3,
        "failed":0,
        "successful":3
        
        }
    }
]}
```

スナップショット情報には、インデックスの時間範囲が含まれています。

スナップショットを破棄したい場合は `DELETE` コマンドを使ってください。

```bash
DELETE /_snapshot/test_backup/snapshot_1
```

スナップショットにすべてのインデックスを含めると、多くの時間とストレージを消費する可能性があります。 間違ってスナップショットの作成を開始した場合（例えば、特定のインデックスでフィルタリングしたかったが、すべてのインデックスを含んでしまった場合）、`DELETE`コマンドを使用してスナップショット処理をキャンセルすることができます。 名前でスナップショットを削除すると、スナップショットプロセスが終了し、部分的なスナップショットがリポジトリから削除されます。

## スナップショットからの復元のテスト

壊滅的な障害が発生した場合、スナップショットから [検索インデックスを復元](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshots-restore-snapshot.html) することができなければ、スナップショットは何の役にも立ちません。 すべてのスナップショットのインデックスをリストアするには `_restore` API を使用します：

```bash
POST /_snapshot/test_backup/snapshot_1/_restore
```

スナップショット・インデックスから既存のインデックスにデータをリストアする必要がある場合は、別の名前でインデックスをリストアしてから、既存のインデックスにデータを再インデックスします。 リストアコマンドを特定のインデックスに限定するには、`indices`オプションを使用します。 `rename_pattern`と`rename_replacement` オプションを使用して、リストアしたインデックスの名前を変更する：

```bash
POST /_snapshot/test_backup/snapshot_1/_restore
{
    "indices": "liferay-20116",
    "rename_pattern": "(.+)",
    "rename_replacement": "restored-$1"
}
```

これはスナップショットから`liferay-201616`という名前のインデックスだけをリストアし、名前を`restored_liferay-201616`に変更します。 いったんクラスタにリストアすると、`_reindex` API コールを使ってバックアップしたデータを既存の `liferay-20116` インデックスにリストアすることができる。

```bash
POST _reindex/
{
    "dest": {
      "index": "liferay-20116"
    },
    "source": {
      "index": "restored_liferay-201116"
    }
}
```

スナップショット処理をキャンセルするのと同様に、`DELETE`コマンドを使って誤ったリストア処理をキャンセルすることができます：

```bash
DELETE /restored_liferay-20116index_3
```

本番環境システムでの壊滅的な障害は誰もが望みませんが、スナップショットを取得してインデックスを復元するためのElasticsearchのAPIを使用すれば、障害が発生した場合に検索クラスターを復元できるので安心です。 詳細とオプションについては、Elasticの [スナップショットと復元のドキュメンテーション](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshot-restore.html) を参照してください。

## Liferay 7.2と7.3の検索チューニングインデックスのバックアップと復元

Elasticsearchインデックスのスナップショットを作成することを強くお勧めします。プライマリストレージ形式として機能するインデックス（Liferay DXP 7.2および7.3の [同義語セット](../../../search-administration-and-tuning/synonym-sets.md) や [結果ランキング](../../../search-administration-and-tuning/result-rankings.md) など）の場合は特にお勧めします。 データベースには、これらのアプリケーションのレコードはありません。

Elasticsearchの [スナップショットおよび復元](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshot-restore.html) 機能を使用して、検索の調整インデックスをバックアップおよび復元できます。

1. システムのどこかに `elasticsearch_local_backup` というフォルダを作成する。 Elasticsearchがそのフォルダ（例：`/path/to/elasticsearch_local_backup`）に読み書きできることを確認してください。

1. 追加

   ```yaml
   path.repo: [ "/path/to/elasticsearch_local_backup" ]
   ```

   を `elasticsearch.yml` に追加してください。 [Elasticsearch クラスタ内のすべてのマスターノードとデータノード](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshots-register-repository.html#snapshots-filesystem-repository) です。 Elasticsearchをアップグレードする場合は、スナップショットリポジトリへのパスがアップグレード前とアップグレード後のElasticsearch構成で同じであることを確認してください。

1. すべてのElasticsearchノードを再起動します。

1. [スナップショットリポジトリを登録します](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshots-register-repository.html) 。 以下の `snapshot` API リクエストを実行することができる（例えば Kibana の Dev Tools コンソールから）：

   ```json
   PUT /_snapshot/elasticsearch_local_backup
   {
     "type": "fs",
     "settings": {
       "location": "/path/to/elasticsearch_local_backup"
     }
   }

   ```

   新しいElasticsearchバージョンにアップグレードする場合は、アップグレード後のElasticsearchでこれと同じコマンドを使用して、スナップショットリポジトリを登録できます。

1. [スナップショットを作成します](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshots-take-snapshot.html) ：

   ```json
   PUT /_snapshot/elasticsearch_local_backup/snapshot1?wait_for_completion=true
   {
     "indices": "liferay-20101-search-tuning*",
     "ignore_unavailable": true,
     "include_global_state": false
   }
   ```

   すべてのLiferayインデックスのスナップショットを作成したい場合は、代わりに`"indices"："liferay*,workflow-metrics*"` を使用することができます。 アップグレードシナリオを使用している場合は、Liferay DXP 7.2および7.3の同義語セットインデックスや結果ランキングインデックスなど、データベースから再作成できないインデックスのみのスナップショットを作成するほうが合理的な場合があります。

1. [リストア](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshots-restore-snapshot.html) 特定のインデックスを別の名前でスナップショットからリストアするには、以下のような `restore` APIコールを実行する：

   ```json
   POST /_snapshot/elasticsearch_local_backup/snapshot1/_restore
   {
     "indices": "liferay-20101-search-tuning-synonyms,liferay-20101-search-tuning-rankings",
     "ignore_unavailable": true,
     "include_global_state": false,
     "rename_pattern": "(.+)",
     "rename_replacement": "restored_$1",
     "include_aliases": false
   }
   ```

   ここで `indices` はリストア元のスナップショットされたインデックス名を指定する。 上記の呼び出しによるインデックスは、`rename_pattern` と `rename_replacement` の正規表現に従って、`restored_liferay-20101-search-tuning-rankings` と `restored_liferay-20101-search-tuning-synonyms` としてリストアされる。

Sidecar/Embeddedモードで実行中に検索チューニング設定（シノニムセットや結果ランキングなど）を追加した場合、Elasticsearchへの本番モード接続を設定し、インデックスを再作成すると、それらは消えてしまいます。

既存の検索チューニング・インデックス・ドキュメントをリストアするには、Elasticsearchの [Reindex API](https://www.elastic.co/guide/en/elasticsearch/reference/current/docs-reindex.html#docs-reindex) を使います：

```json
POST _reindex/
{
 "dest": {
   "index": "liferay-20101-search-tuning-synonyms"
 },
 "source": {
   "index": "restored_liferay-20101-search-tuning-synonyms"
 }
}
```

`liferay-20101-search-tuning-rankings`インデックスに対して同じコマンドを実行する。 アップグレード後のElasticsearchインストールで両方のリクエストを実行すると、アップグレード前のシステムから同義語セットと結果ランキングのデータが復元されるようになりました。

### 検索の調整インデックス名

すぐに使用できる検索の調整インデックス名は、Liferayのバージョンとパッチレベルによって異なります。

| Liferayのバージョンとパッチ                | 検索の調整インデックス                                                                                    |
| :------------------------------- | :--------------------------------------------------------------------------------------------- |
| Liferay DXP 7.2 SP2/FP5以下        | `liferay-search-tuning-rankings`<br />`liferay-search-tuning-synonyms-liferay-<companyId>`     |
| Liferay DXP 7.2 SP3/FP8以降        | `liferay-<companyId>-search-tuning-rankings`<br />`liferay-<companyId>-search-tuning-synonyms` |
| Liferay DXP 7.3 GA1+ および7.4 GA1+ | `liferay-<companyId>-search-tuning-rankings`<br />`liferay-<companyId>-search-tuning-synonyms` |

`<companyId>`（例：`20101`）はデータベース内の指定された`Company`レコードに属する。 UIでは **Instance ID** と表示され、 [仮想インスタンス](../../../../system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.md) を表します。

## 次のステップ

[Elasticsearchをアップグレード](./upgrading-to-elasticsearch-7.md) する場合は、今すぐアップグレードできます。

## 関連トピック

[検索管理およびチューニング](../../../search-administration-and-tuning.md)
