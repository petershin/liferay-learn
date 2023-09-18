---
toc:
  - ./clustering/configuring-the-database.md
  - ./clustering/configuring-search.md
  - ./clustering/configuring-the-dxp-cluster.md
---
# クラスタリング

信頼性とパフォーマンスを高めるために、Liferayはクラスタ化することができます。 こうすることで、1つのサーバーに障害が発生しても、別のサーバーがデータを提供し続けることができる。

Liferayは水平クラスタリングと垂直クラスタリングの両方のアプローチで構成することができます。 水平クラスタでは、各ノードは別々のマシン上で動作する。 垂直クラスターでは、複数の仮想Javaマシンが1台のマシン上で実行される。

ここでは、以下の方法を学びます。

* クラスタ環境用にデータベースを構成する
* Elasticsearchをクラスタ環境用に設定する
* 水平クラスターで2つのLiferayノードを実行する

最初のステップはデータベースの設定だ。

[続きはこちら](./clustering/configuring-the-database.md)
