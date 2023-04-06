---
toc:
- ./clustering-for-high-availability/example-creating-a-simple-dxp-cluster.md
- ./clustering-for-high-availability/database-configuration-for-cluster-nodes.md
- ./clustering-for-high-availability/configuring-cluster-link.md
- ./clustering-for-high-availability/configuring-unicast-over-tcp.md
---
# 高可用性のためのクラスタリング

```{toctree}
:maxdepth: 3

clustering-for-high-availability/example-creating-a-simple-dxp-cluster.md
clustering-for-high-availability/database-configuration-for-cluster-nodes.md
clustering-for-high-availability/configuring-cluster-link.md
clustering-for-high-availability/configuring-unicast-over-tcp.md
```

Liferay DXPは、最小から最大までのすべてのWebサイトに対応するように拡張できます。 アウトオブボックスで、単一のサーバー環境に最適な構成になっています。 トラフィックが多いと予想される場合、またはサイトの全体的なフォールトトレランスを向上させたい場合は、DXPのクラスタリングを検討してください。

![Liferay DXPは、必要なだけ大規模にインストールできるように設計されています](./clustering-for-high-availability/images/01.png)

Liferay DXPは、複数のマシンのクラスター（水平クラスター）または単一のマシン上の複数のVMのクラスター（垂直クラスター）、または任意の組み合わせでうまく機能します。

## クラスタリング要件

ここでは、効果的に機能するDXPクラスタを作成するために必要なことを説明します。

1.  Liferay DXP [installed](../installing-liferay.md) を別々のアプリケーションサーバーノードに設置する。

1.  すべてのノードからアクセス可能な[データベースまたはデータベースクラスタ](./clustering-for-high-availability/database-configuration-for-cluster-nodes.md)

1.  全ノードからアクセス可能な[ファイルストア](../../system-administration/file-storage.md)

1. [オプションでクラスター化された検索エンジン (DXP の外部で実行)](../../using-search/installing-and-upgrading-a-search-engine/installing-a-search-engine.md)

1.  [全ノードで通信とキャッシュの複製が可能なクラスターリンクの設定](./clustering-for-high-availability/configuring-cluster-link.md)

```{note}
同時実行の問題がなく、マスターノードが正しく選択されていることを確認するため、ノードを順次起動します。
```

DXPクラスターを構成したら、それにアプリケーションをデプロイし、ユーザーエクスペリエンスを引き続き改善できます。 詳しくは[クラスターインストールのメンテナンス](../maintaining-a-liferay-installation/maintaining-clustered-installations.md)を参照してください。

## 次のステップ

例としてクラスタを作成することは、DXPクラスタリングを理解するための最初の一歩として最適です。 まずは[例：シンプルなDXPクラスタの作成](./clustering-for-high-availability/example-creating-a-simple-dxp-cluster.md) で詳細を確認してください。 そして、上記の【クラスタリング要件】(#clustering-requirements)に対応します。

```{note}
このドキュメントでは、Java EE アプリケーションサーバー、HTTP サーバー、ロードバランサーなどのサードパーティーソフトウェアの具体的な実装には触れず、DXP 固有のクラスタ構成について説明します。これらのコンポーネントを設定するには、それらのコンポーネントのドキュメントを参照してください。DXP クラスタを作成する前に、OS がシステムのホスト名を 127.0.0.1 のローカルネットワークに定義していないことを確認してください。
```
