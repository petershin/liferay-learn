# Elasticsearch インデックスのリファレンス

Liferay 7.3 と 7.4 はそれぞれ Elasticsearch で作成されたインデックスのセットを持っています。 これらのインデックスとその機能を理解することは、LiferayのElasticsearchのインストールをより良く設定し、管理するのに役立ちます。

```{important}
Liferay 7.2のインデックス名は、パッチによってインデックスの命名パターンに変更が加えられたため、より複雑になっています。 詳しくは、 [マルチテナント・インデックス名](../getting-started/whats-new-in-search-for-73.md#multi-tenant-index-names) をご覧ください。
```

## Liferay 7.4 の Elasticsearch インデックス

以下のリストは、Liferay DXP 7.4 のデフォルトの Elasticsearch インデックスに近似しています（変更される場合があります）。 デフォルトのグローバル **Index Name Prefix** は `liferay-`で、Elasticsearch 7 のコネクタ設定で変更可能です。 `20097` は、データベース内の指定された会社の生成された `companyId` である。  UIにインスタンスIDとして表示され、[仮想インスタンス](../../system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.md)を表します。

| インデックス名                                                      | インデックスタイプ  | インデックスの目的                                                 |
|:------------------------------------------------------------ |:---------- |:--------------------------------------------------------- |
| liferay-0                                                    | システムインデックス | システム設定アプリケーションで検索する。                                      |
| ライフレイ-20097                                                  | 会社インデックス   | Liferay DXP Virtual Instance のインデックスされたコンテンツを検索します。       |
| liferay-20097-commerce-ml-forecast                           | アプリインデックス  | Liferay Commerceの機械学習機能をインデックスします。                        |
| liferay-20097-frequent-pattern-commerce-ml-recommendation。   | アプリインデックス  | Liferay Commerceのレコメンドサービスをインデックスします。                     |
| liferay-20097-product-content-commerce-ml-recommendation     | アプリインデックス  | Liferay Commerceのレコメンドサービスをインデックスします。                     |
| liferay-20097-product-interaction-commerce-ml-recommendation | アプリインデックス  | Liferay Commerceのレコメンドサービスをインデックスします。                     |
| liferay-20097-search-tuning-rankings                         | アプリインデックス  | リザルトランキングのアプリケーションデータの索引を作成します。                           |
| liferay-20097-search-tuning-synonyms                         | アプリインデックス  | Synonym Setsのアプリケーションデータの索引を作成します。                        |
| liferay-20097-user-commerce-ml-recommendation                | アプリインデックス  | Liferay Commerceのレコメンドサービスをインデックスします。                     |
| liferay-20097-workflow-metrics-instances                     | アプリインデックス  | Workflow Metricsアプリケーションのワークフローインスタンスのインデックスを作成します。       |
| liferay-20097-workflow-metrics-nodes                         | アプリインデックス  | Workflow Metrics アプリケーションのワークフローノードのインデックスを作成します。         |
| liferay-20097-workflow-metrics-processes                     | アプリインデックス  | Workflow Metricsアプリケーションのワークフロープロセスのインデックスを作成します。         |
| liferay-20097-workflow-metrics-sla-instance-results          | アプリインデックス  | Workflow MetricsアプリケーションのワークフローインスタンスごとのSLA結果をインデックス化します。 |
| liferay-20097-workflow-metrics-sla-task-results              | アプリインデックス  | Workflow MetricsアプリケーションのワークフロータスクごとのSLA結果をインデックス化します。    |
| LIFERAY-20097-workflow-metrics-tasks                         | アプリインデックス  | Workflow Metricsアプリケーションのワークフロータスクをインデックス化します。            |
| liferay-20097-workflow-metrics-transitions                   | アプリインデックス  | Workflow Metricsアプリケーションのワークフロー遷移をインデックス化します。             |

## Liferay 7.3 の Elasticsearch インデックス

以下のリストは、Liferay DXP 7.3 のデフォルトの Elasticsearch インデックスに近いものです（変更される可能性があります）。 デフォルトのグローバル **Index Name Prefix** は `liferay-`で、Elasticsearch 7 のコネクタ設定で変更可能です。 `20101` は、データベース内の指定された会社の生成された `companyId` である。  UIにインスタンスIDとして表示され、[仮想インスタンス](../../system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.md)を表します。

| インデックス名                                             | インデックスタイプ  | インデックスの目的                                                  |
|:--------------------------------------------------- |:---------- |:---------------------------------------------------------- |
| liferay-0                                           | システムインデックス | システム設定アプリケーションのインデックス検索。                                   |
| liferay-20101                                       | 会社インデックス   | Liferay DXP Virtual Instance のインデックスされたコンテンツを検索するインデックスです。 |
| liferay-20101-search-tuning-rankings                | アプリインデックス  | リザルトランキング」アプリケーションのインデックスを作成します。                           |
| liferay-20101-search-tuning-synonyms                | アプリインデックス  | Synonym Setsアプリケーションのインデックスを作成します。                         |
| liferay-20101-workflow-metrics-instances            | アプリインデックス  | Workflow Metricsアプリケーションのワークフローインスタンスのインデックスを作成します。        |
| liferay-20101-workflow-metrics-nodes                | アプリインデックス  | Workflow Metricsアプリケーションのワークフローノードのインデックスを作成します。           |
| liferay-20101-workflow-metrics-processes            | アプリインデックス  | Workflow Metricsアプリケーションのワークフロープロセスをインデックス化します。            |
| liferay-20101-workflow-metrics-sla-instance-results | アプリインデックス  | Workflow MetricsアプリケーションのワークフローインスタンスごとのSLA結果をインデックス化します。  |
| liferay-20101-workflow-metrics-sla-task-results     | アプリインデックス  | Workflow MetricsアプリケーションのワークフロータスクごとのSLA結果をインデックス化します。     |
| liferay-20101-workflow-metrics-tokens               | アプリインデックス  | Workflow Metricsアプリケーションのワークフロートークンをインデックス化します。            |
| liferay-20101-workflow-metrics-transitions          | アプリインデックス  | Workflow Metricsアプリケーションのワークフロー遷移をインデックス化します。              |

もし、 [Liferay Commerce](https://www.liferay.com/products/commerce) のサブスクリプションを持っていて、それがインストールで有効になっている場合、これらのインデックスも持っています。

| インデックス名                                                      | インデックスタイプ | インデックスの目的                             |
|:------------------------------------------------------------ |:--------- |:------------------------------------- |
| liferay-20101-commerce-ml-forecast                           | アプリインデックス | Liferay Commerceの機械学習機能をインデックスします。    |
| liferay-20101-product-content-commerce-ml-recommendation     | アプリインデックス | Liferay Commerceのレコメンドサービスをインデックスします。 |
| liferay-20101-product-interaction-commerce-ml-recommendation | アプリインデックス | Liferay Commerceのレコメンドサービスをインデックスします。 |

## 関連情報

- [マルチテナントインデックス名](../getting-started/whats-new-in-search-for-73.md#multi-tenant-index-names)
