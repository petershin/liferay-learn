---
toc:
  - ./clustering-for-high-availability/example-creating-a-simple-dxp-cluster.md
  - >-
    - ./clustering-for-high-availability/configuring-cluster-link.md
    - ./clustering-for-high-availability/configuring-unicast-over-tcp.md
---
# 高可用性のクラスタリング

Liferay DXPは、最小から最大までのすべてのWebサイトに対応するように拡張できます。 デフォルトで、単一のサーバー環境に最適な構成になっています。 トラフィックが多いと予想される場合、またはサイトの全体的なフォールトトレランスを向上させたい場合は、DXPのクラスタリングを検討してください。

![Liferay DXPは、必要に応じて大規模な設置に対応できるように設計されています。](./clustering-for-high-availability/images/01.png)

Liferay DXPは、複数のマシンのクラスター（水平クラスター）または単一のマシン上の複数のVMのクラスター（垂直クラスター）、または任意の組み合わせでうまく機能します。

## クラスタリング要件

ここでは、効果的に機能するDXPクラスタを作成するために必要なことを説明します。

1. 別々のアプリケーションサーバーノードに[インストールされた](../installing-liferay.md)Liferay DXP

1. すべてのノードにアクセスできる [データベースまたはデータベースクラスター](./clustering-for-high-availability/database-configuration-for-cluster-nodes.md)

1. すべてのノードにアクセス可能な [ファイルストア](../../system-administration/file-storage.md)

1. オプションでクラスター化されている [検索エンジン（DXPの外部で実行）](../../using-search/installing-and-upgrading-a-search-engine/installing-a-search-engine.md)

1. [すべてのノード間で通信とキャッシュレプリケーションを有効にするように構成されたクラスターリンク](./clustering-for-high-availability/configuring-cluster-link.md)

```{note}
同時実行の問題がなく、マスターノードが正しく選択されていることを確認するため、ノードを順次起動します。
```

DXPクラスターを構成したら、それにアプリケーションをデプロイし、ユーザーエクスペリエンスを引き続き改善できます。 詳細は、 [クラスター化されたインストールの維持](../maintaining-a-liferay-installation/maintaining-clustered-installations.md) を参照してください。

## 次のステップ

例としてクラスタを作成することは、DXPクラスタリングを理解するための最初の一歩として最適です。 詳細は、「 [例：単純なDXPクラスター](./clustering-for-high-availability/example-creating-a-simple-dxp-cluster.md) 作成」から始めてください。 次に、上記の [クラスタリング要件](#clustering-requirements) 対処します。

```{note}
このドキュメントでは、Java EEアプリケーションサーバー、HTTPサーバー、ロードバランサーなどのサードパーティソフトウェアの特定の実装に触れずに、DXP固有のクラスター構成について説明します。 それらを構成するには、それらのコンポーネントのドキュメントを参照してください。 DXPクラスターを作成する前に、OSが127.0.0.1のローカルネットワークに対してシステムのホスト名を定義していないことを確認してください。
```
